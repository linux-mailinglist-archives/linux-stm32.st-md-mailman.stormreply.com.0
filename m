Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AD01E41F1
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 14:22:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A7B5C36B21;
	Wed, 27 May 2020 12:22:41 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8BE7C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 12:22:39 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z18so28608056lji.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9b4AFKGw4ZZqotl5s77CmzWTjWCoCCtFECSbH9IYsSA=;
 b=m/5Y8vGmTNwpX4AY/6YSPBzyxbV9CKofpxuLOV0rT4OW1WUwRQh+L2hmPkrR89JHho
 mp29JMpeTbkjSCFWI18PSTIgrgmgOjy6tersXf5zegumqtO4wPcztIOrlczKxAfBaip/
 dkflMMQCcfol0dxbIx4Vta1k0hWUb/ffJAZUrQBY2F7BSIYH4RLzFuT9RagreGHhUs+E
 3L0R+LudxVmrH/FaiNK0F4I8Vh+kXtqFQu+TEGgkAFqZTdN1Sg6Gr7h26V9rvn/PGWT1
 Ny2xAtgPKwRyY+mbbM43KJUc8HGCnx2gqGjVEeQgynYclzEh+vg+qkDRfKBwTGMzbIHG
 +zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9b4AFKGw4ZZqotl5s77CmzWTjWCoCCtFECSbH9IYsSA=;
 b=GhhYgukkQvR2ptcikK0x9xGMh6dg5FiP4x6kh4jVlC8TkttVIuAxzqSWozfbMD5zwc
 V6MPWZxP14hIQRaZC1gqsNTt+yjDs/VC6pcCs5QbNuC5NgvoNm3u+MScfKAW4jT8RVqo
 9cUPU9tfu3V1i6JC6I9k/X3FeePBVJBlZirwm90Gd9Tq1YLvJW8cW31WqTNGmZiMcrbk
 8nTPbZfUjzq7j4LQFUxZU4yo0ivhPLxE7GNcwb9DAA/2pSSA91H8MJG0FqxXMAEamqt4
 qcFBh5g4SBOoGGo75DTX78HAKJfT5Ts3xTZC4Azl/f1dlEXT4dL/7UUW5gpUKF0bFfQn
 F8zg==
X-Gm-Message-State: AOAM532xx3PzAQNTbpLd4Ph5/fq0MJcvuaACkhVshV8jN7qTm7+NfNcX
 HWiVKLIpSvUR/Ni9iGZz3oS8ZQ/teUz379kNpRcSAQ==
X-Google-Smtp-Source: ABdhPJxTsWDgeOe5Djkxbz5Vhm5vLbaAAlGQFkDtkkPWtJUSrez+RPSqeMSp1e9eKl58SCBsVQ5ilU3q78cT0eLqwnc=
X-Received: by 2002:a2e:9510:: with SMTP id f16mr3179414ljh.111.1590582158421; 
 Wed, 27 May 2020 05:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200526151619.8779-1-benjamin.gaignard@st.com>
 <jhjk10xu1tq.mognet@arm.com> <ab4340c0-bda3-e752-9073-e162e6325bb1@st.com>
In-Reply-To: <ab4340c0-bda3-e752-9073-e162e6325bb1@st.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 27 May 2020 14:22:27 +0200
Message-ID: <CAKfTPtBt6Ju-CnETnn6_FkgR0CAJ+jYnySz9OHP9X2hmxWHM7w@mail.gmail.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: "len.brown@intel.com" <len.brown@intel.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [RFC RESEND 0/3] Introduce cpufreq minimum load
	QoS
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

On Wed, 27 May 2020 at 13:17, Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
>
>
>
> On 5/27/20 12:09 PM, Valentin Schneider wrote:
> > Hi Benjamin,
> >
> > On 26/05/20 16:16, Benjamin Gaignard wrote:
> >> A first round [1] of discussions and suggestions have already be done on
> >> this series but without found a solution to the problem. I resend it to
> >> progress on this topic.
> >>
> > Apologies for sleeping on that previous thread.
> >
> > So what had been suggested over there was to use uclamp to boost the
> > frequency of the handling thread; however if you use threaded IRQs you
> > get RT threads, which already get the max frequency by default (at least
> > with schedutil).
> >
> > Does that not work for you, and if so, why?
> That doesn't work because almost everything is done by the hardware blocks
> without charge the CPU so the thread isn't running. I have done the
> tests with schedutil
> and ondemand scheduler (which is the one I'm targeting). I have no
> issues when using
> performance scheduler because it always keep the highest frequencies.

IMHO, the only way to ensure a min frequency for anything else than a
thread is to use freq_qos_add_request() just like cpufreq cooling
device but for the opposite QoS. This can be applied only on the
frequency domain of the CPU which handles the interrupt.
Have you also checked the wakeup latency of your idle state ?

>
>
> >
> >> When start streaming from the sensor the CPU load could remain very low
> >> because almost all the capture pipeline is done in hardware (i.e. without
> >> using the CPU) and let believe to cpufreq governor that it could use lower
> >> frequencies. If the governor decides to use a too low frequency that
> >> becomes a problem when we need to acknowledge the interrupt during the
> >> blanking time.
> >> The delay to ack the interrupt and perform all the other actions before
> >> the next frame is very short and doesn't allow to the cpufreq governor to
> >> provide the required burst of power. That led to drop the half of the frames.
> >>
> >> To avoid this problem, DCMI driver informs the cpufreq governors by adding
> >> a cpufreq minimum load QoS resquest.
> >>
> >> Benjamin
> >>
> >> [1] https://lkml.org/lkml/2020/4/24/360
> >>
> >> Benjamin Gaignard (3):
> >>    PM: QoS: Introduce cpufreq minimum load QoS
> >>    cpufreq: governor: Use minimum load QoS
> >>    media: stm32-dcmi: Inform cpufreq governors about cpu load needs
> >>
> >>   drivers/cpufreq/cpufreq_governor.c        |   5 +
> >>   drivers/media/platform/stm32/stm32-dcmi.c |   8 ++
> >>   include/linux/pm_qos.h                    |  12 ++
> >>   kernel/power/qos.c                        | 213 ++++++++++++++++++++++++++++++
> >>   4 files changed, 238 insertions(+)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
