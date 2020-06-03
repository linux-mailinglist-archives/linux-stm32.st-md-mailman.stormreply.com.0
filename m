Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF881ECACC
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jun 2020 09:50:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 802DBC36B21;
	Wed,  3 Jun 2020 07:50:20 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 243B0C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2020 07:50:19 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id h188so693506lfd.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jun 2020 00:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RI6iXB0qMqr3xlMnwnNSpUiS3SZYn3+NS4HUs4hvuFk=;
 b=Bv2NGZRkizy50GG012REDa+Ac6WD7Cdlhp9SBQUZne2ONByEmjbrF1ObuaG8BusUuc
 tT4fFF6bOT7sbpGB8srbSU8sAzLauoqfKgAnHEMe+Njoiq8cN8L4/OILOwpNPvXxVoRH
 Pnb1931Hl0DGZD17DmZWdVQg3OicSRvDhOV3hpc3knBMfWL7aYPz7QcGjsOC6+dIYy1Z
 BBA8Nzqwm/A2HE/lLI5xIt/BnG1w3KfdtF35Eoo4b/oIXYE9IQp3jdFlXdXmLTzZjFuK
 x6SKMLDcFQfsamwJtMSktvo/Ma8v/iZmfw/yQqiVXjsUKZjmCLRSvusNarN0vntWMQ8c
 P4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RI6iXB0qMqr3xlMnwnNSpUiS3SZYn3+NS4HUs4hvuFk=;
 b=Ofj48fPD4x9CpsxqtqS/BrAT+b8r5EVaeiHNOIerhsfJDIRDDQXrougiZhzS7MyXyU
 whXouuSMYjsdIl9w/gBHmhpGNDNBGRS9QWcXnQrM6nlCtlx5fk/F4/uTff0UqUz00giF
 hVBYF9A2EhfX+3sOoA6t6UShh3Yt5TEmVDevkUeL8rzZMV0DHBzF20B3SXTgDTm7HyrX
 DqVS/EP6QnA0DjzNC0Xaphz8CvKFUlOBBoJY1ktyVxr/LkDSR3SvsY/8XOtUSG+3JYvC
 WGiNBSb+kd4A1+k+xh/Gn6urVc4HVvglT2pUHTuixtPaOdrMHeE+H2Jq30t9bTRzT3UP
 Tgsw==
X-Gm-Message-State: AOAM5337wTzqU9Lja/pdpl5nLmtRcdp69QQsGgkx/S9wq38DFYHykJIi
 u8+AFcgpALeBkK140ywUYGed3HAxNPxo4VxCERC0gA==
X-Google-Smtp-Source: ABdhPJwQ86B8yTe/9il9L6LnfiUJTL8erQbgj0KU1+oMuQ+QlImP1yxiL4f9rbdAdwNQf8DKbxDu0Dm6tMQQyCoUlhY=
X-Received: by 2002:a19:5013:: with SMTP id e19mr1725514lfb.95.1591170618304; 
 Wed, 03 Jun 2020 00:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200527151613.16083-1-benjamin.gaignard@st.com>
 <jhjpnahizkm.mognet@arm.com> <f95ce45f-7a1c-0feb-afa8-203ddb500f2f@st.com>
 <jhjo8q1io9o.mognet@arm.com> <1b0ace18-e7f8-0b75-f6fe-968a269626b0@st.com>
In-Reply-To: <1b0ace18-e7f8-0b75-f6fe-968a269626b0@st.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 3 Jun 2020 09:50:06 +0200
Message-ID: <CAKfTPtCbM-w_0VrTB5tsSM5PKRtC44f3sSmAR=U=P3e3KQ+cMw@mail.gmail.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
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

On Wed, 3 Jun 2020 at 09:34, Benjamin GAIGNARD <benjamin.gaignard@st.com> wrote:
>
>
>
> On 6/2/20 3:35 PM, Valentin Schneider wrote:
> > On 02/06/20 12:37, Benjamin GAIGNARD wrote:
> >> On 6/2/20 11:31 AM, Valentin Schneider wrote:
> >>>> @@ -99,6 +100,8 @@ enum state {
> >>>>
> >>>>    #define OVERRUN_ERROR_THRESHOLD 3
> >>>>
> >>>> +#define DCMI_MIN_FREQ     650000 /* in KHz */
> >>>> +
> >>> This assumes the handling part is guaranteed to always run on the same CPU
> >>> with the same performance profile (regardless of the platform). If that's
> >>> not guaranteed, it feels like you'd want this to be configurable in some
> >>> way.
> >> Yes I could add a st,stm32-dcmi-min-frequency (in KHz) parameter the
> >> device tree node.
> >>
> > Something like that - I'm not sure how well this fits with the DT
> > landscape, as you could argue it isn't really a description of the
> > hardware, more of a description of the performance expectations of the
> > software. I won't really argue here.
> >
> >>>>    struct dcmi_graph_entity {
> >>>>         struct v4l2_async_subdev asd;
> >>>>
> >>> [...]
> >>>> @@ -2020,6 +2042,8 @@ static int dcmi_probe(struct platform_device *pdev)
> >>>>                 goto err_cleanup;
> >>>>         }
> >>>>
> >>>> +  dcmi->policy = cpufreq_cpu_get(0);
> >>>> +
> >>> Ideally you'd want to fetch the policy of the CPU your IRQ (and handling
> >>> thread) is affined to; The only compatible DTS I found describes a single
> >>> A7, which is somewhat limited in the affinity area...
> >> If I move this code just before start streaming and use get_cpu(), would
> >> it works ?
> >>
> > AFAIA streaming_start() is not necessarily executing on the same CPU as the
> > one that will handle the interrupt. I was thinking you could use the IRQ's
> > effective affinity as a hint of which CPU(s) to boost, i.e. something like:
> >
> > ---
> >      struct cpumask_var_t visited;
> >      struct irq_data *d = irq_get_irq_data(irq);
> >
> >      err = alloc_cpumask_var(visited, GFP_KERNEL);
> >      /* ... */
> >      for_each_cpu(cpu, irq_data_get_effective_affinity_mask(d)) {
> >              /* check if not already spanned */
> >              if (cpumask_test_cpu(cpu, visited))
> >                      continue;
> >
> >              policy = cpufreq_cpu_get(cpu);
> >              cpumask_or(visited, visited, policy->cpus);
> >              /* do the boost for that policy here */
> >              /* ... */
> >              cpufreq_cpu_put(policy);
> >      }
> > ---
> >
> > That of course falls apart when hotplug gets involved, and the effective
> > affinity changes... There's irq_set_affinity_notifier() out there, but it
> > seems it's only about the affinity, not the effective_affinity, I'm not
> > sure how valid it would be to query the effective_affinity in that
> > notifier.
> If I wait to be in the irq it will be too late so I think I will do a
> loop over all possible CPUs
> before start the streaming to change the policies.

Can't you use irq_get_affinity_mask  and loop over it ?

Also You should better use freq_qos_add/remove_request during probe
and remove of the driver and use freq_qos_update_request in
dcmi_start/stop_streaming to set/unset your constraint.

>
> >
> >> Benjamin
> >>>>         dev_info(&pdev->dev, "Probe done\n");
> >>>>
> >>>>         platform_set_drvdata(pdev, dcmi);
> >>>> @@ -2049,6 +2073,9 @@ static int dcmi_remove(struct platform_device *pdev)
> >>>>
> >>>>         pm_runtime_disable(&pdev->dev);
> >>>>
> >>>> +  if (dcmi->policy)
> >>>> +          cpufreq_cpu_put(dcmi->policy);
> >>>> +
> >>>>         v4l2_async_notifier_unregister(&dcmi->notifier);
> >>>>         v4l2_async_notifier_cleanup(&dcmi->notifier);
> >>>>         media_entity_cleanup(&dcmi->vdev->entity);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
