Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 781B31EF701
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jun 2020 14:06:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23EB1C36B22;
	Fri,  5 Jun 2020 12:06:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A50E0C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2020 12:06:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB6C12B;
 Fri,  5 Jun 2020 05:06:06 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 235B53F305;
 Fri,  5 Jun 2020 05:06:05 -0700 (PDT)
References: <20200604123932.20512-1-benjamin.gaignard@st.com>
 <20200604123932.20512-3-benjamin.gaignard@st.com>
User-agent: mu4e 0.9.17; emacs 26.3
From: Valentin Schneider <valentin.schneider@arm.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
In-reply-to: <20200604123932.20512-3-benjamin.gaignard@st.com>
Date: Fri, 05 Jun 2020 13:05:59 +0100
Message-ID: <jhj5zc5iuoo.mognet@arm.com>
MIME-Version: 1.0
Cc: vincent.guittot@linaro.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, mchehab@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/3] media: stm32-dcmi: Set minimum
	cpufreq requirement
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On 04/06/20 13:39, Benjamin Gaignard wrote:
> Before start streaming set cpufreq minimum frequency requirement.
> The cpufreq governor will adapt the frequencies and we will have
> no latency for handling interrupts.
> The frequency requirement is retrieved from the device-tree node.
>
> While streaming be notified if the IRQ affinity change thanks to
> irq_affinity_notify callback.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 3:
> - add a cpumask field to track boosted CPUs
> - add irq_affinity_notify callback
> - protect cpumask field with a mutex
>
>  drivers/media/platform/stm32/stm32-dcmi.c | 187 ++++++++++++++++++++++++++++--
>  1 file changed, 179 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index b8931490b83b..fb6ab09eaff0 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> +static void dcmi_irq_notifier_notify(struct irq_affinity_notify *notify,
> +				     const cpumask_t *mask)
> +{
> +	struct stm32_dcmi *dcmi = container_of(notify,
> +					       struct stm32_dcmi,
> +					       notify);
> +	struct cpufreq_policy *p;
> +	int cpu;
> +
> +	mutex_lock(&dcmi->freq_lock);
> +	/*
> +	 * For all boosted CPUs check if it is still the case
> +	 * if not remove the request
> +	 */
> +	for_each_cpu(cpu, dcmi->boosted) {
> +		if (cpumask_test_cpu(cpu, mask))
> +			continue;
> +
> +		p = cpufreq_cpu_get(cpu);
> +		if (!p)
> +			continue;
> +
> +		freq_qos_remove_request(&per_cpu(qos_req, cpu));
> +		cpumask_andnot(dcmi->boosted, dcmi->boosted, p->cpus);
> +
> +		cpufreq_cpu_put(p);
> +	}
> +
> +	/*
> +	 * For CPUs in the mask check if they are boosted if not add
> +	 * a request
> +	 */
> +	for_each_cpu(cpu, mask) {
> +		if (cpumask_test_cpu(cpu, dcmi->boosted))
> +			continue;
> +
> +		p = cpufreq_cpu_get(cpu);
> +		if (!p)
> +			continue;
> +
> +		freq_qos_add_request(&p->constraints, &per_cpu(qos_req, cpu),
> +				     FREQ_QOS_MIN, dcmi->min_frequency);
> +		cpumask_or(dcmi->boosted, dcmi->boosted, p->cpus);
> +		cpufreq_cpu_put(p);
> +	}
> +
> +	mutex_unlock(&dcmi->freq_lock);

That looks about right.

> +}
> +
> +static void dcmi_irq_notifier_release(struct kref *ref)
> +{
> +	/*
> +	 * This is required by affinity notifier. We don't have anything to
> +	 * free here.
> +	 */
> +}
> +
> +static void dcmi_get_cpu_policy(struct stm32_dcmi *dcmi)
> +{
> +	struct cpufreq_policy *p;
> +	int cpu;
> +
> +	if (!alloc_cpumask_var(&dcmi->boosted, GFP_KERNEL))
> +		return;

I think you want to actually return i.e. -ENOMEM and do cleanups in the
probe; otherwise you'll silently continue.

> +
> +	mutex_lock(&dcmi->freq_lock);
> +
> +	for_each_cpu(cpu, irq_get_affinity_mask(dcmi->irq)) {

When I suggested serialization, I was thinking we may want to use the irq's
desc lock to prevent the affinity from moving under our feet. Something
like:

  CPU A                                          CPU B

  for_each_cpu(cpu, mask)
    cpu = cpumask_next(cpu, mask)

    // ...                                       cpumask_copy(desc->irq_common_data.affinity, mask)

    cpu = cpumask_next(cpu, mask)

Now, should that happen, we would still queue the notifier and run it
shortly after - and since you track which CPUs are boosted, I don't think
we have any loss of information here.

We may have yet another affinity change while the notifier is still queued;
but the notifier boilerplate does grab the desc lock, so I think it's all
good - it wasn't all super obvious so I figured I'd still point it out.

> +		if (cpumask_test_cpu(cpu, dcmi->boosted))
> +			continue;
> +
> +		p = cpufreq_cpu_get(cpu);
> +		if (!p)
> +			continue;
> +
> +		freq_qos_add_request(&p->constraints, &per_cpu(qos_req, cpu),
> +				     FREQ_QOS_MIN, FREQ_QOS_MIN_DEFAULT_VALUE);
> +
> +		cpumask_or(dcmi->boosted, dcmi->boosted, p->cpus);
> +
> +		cpufreq_cpu_put(p);
> +	}
> +
> +	mutex_unlock(&dcmi->freq_lock);
> +}
> +
> +static void dcmi_put_cpu_policy(struct stm32_dcmi *dcmi)
> +{
> +	struct cpufreq_policy *p;
> +	int cpu;
> +
> +	mutex_lock(&dcmi->freq_lock);
> +
> +	for_each_cpu(cpu, irq_get_affinity_mask(dcmi->irq)) {
> +		if (!cpumask_test_cpu(cpu, dcmi->boosted))
> +			continue;
> +
> +		p = cpufreq_cpu_get(cpu);
> +		if (!p)
> +			continue;
> +
> +		freq_qos_remove_request(&per_cpu(qos_req, cpu));
> +		cpumask_andnot(dcmi->boosted, dcmi->boosted, p->cpus);
> +
> +		cpufreq_cpu_put(p);
> +	}
> +
> +	free_cpumask_var(dcmi->boosted);
> +
> +	mutex_unlock(&dcmi->freq_lock);
> +}
> +
> +static void dcmi_set_min_frequency(struct stm32_dcmi *dcmi, s32 freq)
> +{
> +	struct irq_affinity_notify *notify = &dcmi->notify;
> +	int cpu;
> +
> +	mutex_lock(&dcmi->freq_lock);
> +
> +	for_each_cpu(cpu, irq_get_affinity_mask(dcmi->irq)) {
> +		if (!cpumask_test_cpu(cpu, dcmi->boosted))
> +			continue;
> +

If the affinity changed between say .probe() and .start_streaming(), IIUC
you may skip CPUs here - and even if you initialize the notifier earlier in
the function (see below), that won't help you.

I think dcmi_irq_notifier_notify() does almost all you want, if it also did
the QoS update for CPUs that weren't affected by the affinity change, you
may be able to just do:

   dcmi_irq_notifier_notify(irq_get_affinity_mask(dcmi->irq));

Or something along those lines.

> +		if (!freq_qos_request_active(&per_cpu(qos_req, cpu)))
> +			continue;
> +
> +		freq_qos_update_request(&per_cpu(qos_req, cpu), freq);
> +	}
> +
> +	mutex_unlock(&dcmi->freq_lock);
> +
> +	if (freq != FREQ_QOS_MIN_DEFAULT_VALUE) {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
