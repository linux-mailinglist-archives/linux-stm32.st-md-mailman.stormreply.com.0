Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 864731ED348
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jun 2020 17:25:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEFEBC36B21;
	Wed,  3 Jun 2020 15:25:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE31DC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2020 15:25:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3362B55D;
 Wed,  3 Jun 2020 08:25:10 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FCFA3F52E;
 Wed,  3 Jun 2020 08:25:08 -0700 (PDT)
References: <20200603124559.22652-1-benjamin.gaignard@st.com>
 <20200603124559.22652-3-benjamin.gaignard@st.com>
User-agent: mu4e 0.9.17; emacs 26.3
From: Valentin Schneider <valentin.schneider@arm.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
In-reply-to: <20200603124559.22652-3-benjamin.gaignard@st.com>
Date: Wed, 03 Jun 2020 16:25:01 +0100
Message-ID: <jhjk10oi33m.mognet@arm.com>
MIME-Version: 1.0
Cc: vincent.guittot@linaro.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, mchehab@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] media: stm32-dcmi: Set minimum
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


On 03/06/20 13:45, Benjamin Gaignard wrote:
> +static void dcmi_set_min_frequency(struct stm32_dcmi *dcmi, u64 freq)
> +{
> +	struct cpufreq_policy *p;
> +	int cpu;
> +
> +	for_each_cpu(cpu, irq_get_affinity_mask(dcmi->irq)) {
> +		p = per_cpu(policy, cpu);
> +		if (!p)
> +			continue;
> +
> +		freq_qos_update_request(&per_cpu(qos_req, cpu), freq);
> +	}
> +}
> +

You may want to use a "visited" cpumask as I suggested in the previous
thread, since a policy can cover more than one CPU (IOW, a frequency domain
can span more than one CPU). It's not required per-se, AFAICT, but it makes
things a bit neater.

I also think you'll have to use the affinity notifier
(irq_set_affinity_notifier()), since AFAICT userspace can change the
affinity of that IRQ. I suppose you'll want something like:
- Check if we currently are in streaming mode
- Clear the QoS request for CPUs that were previously boosted but that
  aren't in the new mask
- Add the request for the new CPUs.

You'll probably need serialize the reading of the mask in the regular
dcmi_set_min_frequency() as well. I concur all of that is somewhat
annoying, but AFAICT that's required for a sturdy implementation.

>  static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
>       struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
