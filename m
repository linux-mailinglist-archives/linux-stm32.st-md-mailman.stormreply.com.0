Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 178161ECCC0
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jun 2020 11:41:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC6DAC36B21;
	Wed,  3 Jun 2020 09:41:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9560BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2020 09:41:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DFD431B;
 Wed,  3 Jun 2020 02:41:52 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A3F93F305;
 Wed,  3 Jun 2020 02:41:50 -0700 (PDT)
References: <20200527151613.16083-1-benjamin.gaignard@st.com>
 <jhjpnahizkm.mognet@arm.com> <f95ce45f-7a1c-0feb-afa8-203ddb500f2f@st.com>
 <jhjo8q1io9o.mognet@arm.com> <1b0ace18-e7f8-0b75-f6fe-968a269626b0@st.com>
 <CAKfTPtCbM-w_0VrTB5tsSM5PKRtC44f3sSmAR=U=P3e3KQ+cMw@mail.gmail.com>
User-agent: mu4e 0.9.17; emacs 26.3
From: Valentin Schneider <valentin.schneider@arm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
In-reply-to: <CAKfTPtCbM-w_0VrTB5tsSM5PKRtC44f3sSmAR=U=P3e3KQ+cMw@mail.gmail.com>
Date: Wed, 03 Jun 2020 10:41:41 +0100
Message-ID: <jhjmu5kiizu.mognet@arm.com>
MIME-Version: 1.0
Cc: "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: Set minimum cpufreq
	requirement
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


On 03/06/20 08:50, Vincent Guittot wrote:
> On Wed, 3 Jun 2020 at 09:34, Benjamin GAIGNARD <benjamin.gaignard@st.com> wrote:
>> On 6/2/20 3:35 PM, Valentin Schneider wrote:
>> > AFAIA streaming_start() is not necessarily executing on the same CPU as the
>> > one that will handle the interrupt. I was thinking you could use the IRQ's
>> > effective affinity as a hint of which CPU(s) to boost, i.e. something like:
>> >
>> > ---
>> >      struct cpumask_var_t visited;
>> >      struct irq_data *d = irq_get_irq_data(irq);
>> >
>> >      err = alloc_cpumask_var(visited, GFP_KERNEL);
>> >      /* ... */
>> >      for_each_cpu(cpu, irq_data_get_effective_affinity_mask(d)) {
>> >              /* check if not already spanned */
>> >              if (cpumask_test_cpu(cpu, visited))
>> >                      continue;
>> >
>> >              policy = cpufreq_cpu_get(cpu);
>> >              cpumask_or(visited, visited, policy->cpus);
>> >              /* do the boost for that policy here */
>> >              /* ... */
>> >              cpufreq_cpu_put(policy);
>> >      }
>> > ---
>> >
>> > That of course falls apart when hotplug gets involved, and the effective
>> > affinity changes... There's irq_set_affinity_notifier() out there, but it
>> > seems it's only about the affinity, not the effective_affinity, I'm not
>> > sure how valid it would be to query the effective_affinity in that
>> > notifier.

>> If I wait to be in the irq it will be too late so I think I will do a
>> loop over all possible CPUs
>> before start the streaming to change the policies.
>

Yes, that's what I was thinking as well.

> Can't you use irq_get_affinity_mask  and loop over it ?
>

In the end that's the only usable option, I think.

I was looking at alternatives because on arm64 (and AFAICT that applies
to arm too; see irq-gic.c::gic_set_affinity()) the affinity mask spans
all CPUs by default, while the effective affinity mask spans only the
CPU that will actually handle the IRQ (+ where its thread should run).

That said, using the effective mask that way does feel like an
implementation leak. Sadly I couldn't find any better way to minimize
the number of boosted frequency domains.

> Also You should better use freq_qos_add/remove_request during probe
> and remove of the driver and use freq_qos_update_request in
> dcmi_start/stop_streaming to set/unset your constraint.
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
