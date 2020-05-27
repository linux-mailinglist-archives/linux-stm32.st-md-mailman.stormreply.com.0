Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A73F01E46D7
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 17:04:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56D00C36B21;
	Wed, 27 May 2020 15:04:13 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AEC4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 15:04:05 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id x22so19398765otq.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 08:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Vx58Hq7sHLXBsQGSYl+3QZFOqiNWHmAX7GPof+o7eQ=;
 b=trGA7LcBZ9WGxABbKj7OHnkMEsI0Dspn62Ny2oKnOYXvQIIKS/23PsrfhU0/cVS+9b
 k4GNryAd2Tk4YUgyiF7krctAEAs+aBQb5PWZJKUzcQpYjhk4fCNIHnwz21bV4MFbf35A
 Rvy9UlLsHjbJxCZGSkLk3O/GHkUROqOaj5HFo62iZO6v/GcjvMTDHHLXGsRXvVkao7kM
 4Vvs6hLJ7i/YFeJz25/kKIhW+vKNsLFFVuzkQnR/Zema28+i1Zqtf6IRTGUg58nmIykP
 lMQO1GhiKDhCCcOjSFnJJwsXxRTnI7HD2vutf/4wI6mmj2Z3IGF6ZUxopnI5Lv6FHjZR
 Hh7A==
X-Gm-Message-State: AOAM5307QXH4rd5RZgFlDhMWsQ4mlYN+5iB7+loD9I4h3kax/uUJswNM
 gPACnQ6V4QZOmAoBWi7nTZ4Cldyz9M83lKN1O50=
X-Google-Smtp-Source: ABdhPJzwMPGSTgdrUYctj0XU40med+NR1Bq/ddfSHu6e0BLAm4f5O93pxTTndqvUHsxmhkX1InI0IHrV5NKDuiWzbv8=
X-Received: by 2002:a9d:4713:: with SMTP id a19mr4711281otf.167.1590591844210; 
 Wed, 27 May 2020 08:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200526151619.8779-1-benjamin.gaignard@st.com>
 <jhjk10xu1tq.mognet@arm.com> <ab4340c0-bda3-e752-9073-e162e6325bb1@st.com>
 <CAKfTPtBt6Ju-CnETnn6_FkgR0CAJ+jYnySz9OHP9X2hmxWHM7w@mail.gmail.com>
 <51917583-f8ff-3933-7783-2eedc91484a4@st.com>
 <fe69390f-ea8c-b6e3-7610-d6bd73e8500d@st.com>
In-Reply-To: <fe69390f-ea8c-b6e3-7610-d6bd73e8500d@st.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 27 May 2020 17:03:52 +0200
Message-ID: <CAJZ5v0h17aPe69KbZ6xVV4RiUKwSHWOQLycUFFNCprg5XPpN4g@mail.gmail.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: "len.brown@intel.com" <len.brown@intel.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
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

On Wed, May 27, 2020 at 4:54 PM Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
>
>
>
> On 5/27/20 2:48 PM, Benjamin GAIGNARD wrote:
> >
> >
> > On 5/27/20 2:22 PM, Vincent Guittot wrote:
> >> On Wed, 27 May 2020 at 13:17, Benjamin GAIGNARD
> >> <benjamin.gaignard@st.com> wrote:
> >>>
> >>>
> >>> On 5/27/20 12:09 PM, Valentin Schneider wrote:
> >>>> Hi Benjamin,
> >>>>
> >>>> On 26/05/20 16:16, Benjamin Gaignard wrote:
> >>>>> A first round [1] of discussions and suggestions have already be
> >>>>> done on
> >>>>> this series but without found a solution to the problem. I resend
> >>>>> it to
> >>>>> progress on this topic.
> >>>>>
> >>>> Apologies for sleeping on that previous thread.
> >>>>
> >>>> So what had been suggested over there was to use uclamp to boost the
> >>>> frequency of the handling thread; however if you use threaded IRQs you
> >>>> get RT threads, which already get the max frequency by default (at
> >>>> least
> >>>> with schedutil).
> >>>>
> >>>> Does that not work for you, and if so, why?
> >>> That doesn't work because almost everything is done by the hardware
> >>> blocks
> >>> without charge the CPU so the thread isn't running. I have done the
> >>> tests with schedutil
> >>> and ondemand scheduler (which is the one I'm targeting). I have no
> >>> issues when using
> >>> performance scheduler because it always keep the highest frequencies.
> >> IMHO, the only way to ensure a min frequency for anything else than a
> >> thread is to use freq_qos_add_request() just like cpufreq cooling
> >> device but for the opposite QoS. This can be applied only on the
> >> frequency domain of the CPU which handles the interrupt.
> > I will give a try with this idea.
> > Thanks.
>
> Adding freq_qos_add_request(FREQ_QOS_MIN) when starting streaming frames
> solve my problem. I remove the request at the end of the streaming to
> restore
> the default value.

You may as well add the request once at the init time with the request
value set to PM_QOS_MIN_FREQUENCY_DEFAULT_VALUE initially and update
it as needed going forward.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
