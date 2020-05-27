Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E25B1E3EA9
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 12:09:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60204C36B21;
	Wed, 27 May 2020 10:09:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D296FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 10:09:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D58AB55D;
 Wed, 27 May 2020 03:09:12 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEC213F6C4;
 Wed, 27 May 2020 03:09:10 -0700 (PDT)
References: <20200526151619.8779-1-benjamin.gaignard@st.com>
User-agent: mu4e 0.9.17; emacs 26.3
From: Valentin Schneider <valentin.schneider@arm.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
In-reply-to: <20200526151619.8779-1-benjamin.gaignard@st.com>
Date: Wed, 27 May 2020 11:09:05 +0100
Message-ID: <jhjk10xu1tq.mognet@arm.com>
MIME-Version: 1.0
Cc: len.brown@intel.com, vincent.guittot@linaro.org, linux-pm@vger.kernel.org,
 viresh.kumar@linaro.org, pavel@ucw.cz, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, mchehab@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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


Hi Benjamin,

On 26/05/20 16:16, Benjamin Gaignard wrote:
> A first round [1] of discussions and suggestions have already be done on
> this series but without found a solution to the problem. I resend it to
> progress on this topic.
>

Apologies for sleeping on that previous thread.

So what had been suggested over there was to use uclamp to boost the
frequency of the handling thread; however if you use threaded IRQs you
get RT threads, which already get the max frequency by default (at least
with schedutil).

Does that not work for you, and if so, why?

> When start streaming from the sensor the CPU load could remain very low
> because almost all the capture pipeline is done in hardware (i.e. without
> using the CPU) and let believe to cpufreq governor that it could use lower
> frequencies. If the governor decides to use a too low frequency that
> becomes a problem when we need to acknowledge the interrupt during the
> blanking time.
> The delay to ack the interrupt and perform all the other actions before
> the next frame is very short and doesn't allow to the cpufreq governor to
> provide the required burst of power. That led to drop the half of the frames.
>
> To avoid this problem, DCMI driver informs the cpufreq governors by adding
> a cpufreq minimum load QoS resquest.
>
> Benjamin
>
> [1] https://lkml.org/lkml/2020/4/24/360
>
> Benjamin Gaignard (3):
>   PM: QoS: Introduce cpufreq minimum load QoS
>   cpufreq: governor: Use minimum load QoS
>   media: stm32-dcmi: Inform cpufreq governors about cpu load needs
>
>  drivers/cpufreq/cpufreq_governor.c        |   5 +
>  drivers/media/platform/stm32/stm32-dcmi.c |   8 ++
>  include/linux/pm_qos.h                    |  12 ++
>  kernel/power/qos.c                        | 213 ++++++++++++++++++++++++++++++
>  4 files changed, 238 insertions(+)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
