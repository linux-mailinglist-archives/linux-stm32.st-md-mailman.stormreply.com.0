Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E51BF3BA
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 11:06:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2CAAC36B11;
	Thu, 30 Apr 2020 09:06:32 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75C06C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 09:04:07 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id o24so4629428oic.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 02:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPIctqtbjHbN+c6WsGMnZ4aDcQr0Dn9FvwQoBcXdb4k=;
 b=GdRwrxKgY9HkkM7IZn+HGof44EsQ+1JakbI/ksCkB4brDElDS9DYQKkPVNHiEJ6+jV
 MbHWtt4uR9BBvf4O9VNeHQzWGOAuS3GmCuWWA1OxpLKch4SrBK5r1rYgq3kZ1Pb2+vQ2
 9erOhAtw7/VLxQKEp7PKIKgHqQO1t3H9sbQ6bgUL9Ua+nZSvuoICsksdXw9JUxqUikag
 LvJVjNYIxC1OxtYzRFYADKwMYHaeKB6o9XtfbAtvrmx0E0Fv0V/f+ngkbNgO12MZzBsr
 TZERmDh8aySLHWObNd8gzQDSMenMmtBZqdOdsLSuUX5BLEa9KSfrdQTbbh1oTV7E18UA
 ISXA==
X-Gm-Message-State: AGi0PuYtXTjynGIX032owKitzNS8BhpR5UXSO/nkM9UwHMTCeB5FIG7l
 fOenV3QmDZorCriTJhEvDjbsleqx2rUB+NhRPKo=
X-Google-Smtp-Source: APiQypJD2+GdHPcXAjdJ2otz/vhbS/df9CkF9oCL8wWT9gqhtZ1UAebHm6B/NCfiC2qhRAGhImTD5b2woCc+kgQvvjQ=
X-Received: by 2002:aca:aa8c:: with SMTP id t134mr1027807oie.103.1588237445928; 
 Thu, 30 Apr 2020 02:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200424114058.21199-1-benjamin.gaignard@st.com>
 <7657495.QyJl4BcWH5@kreacher> <30cdecf9-703a-eb2b-7c2b-f1e21c805add@st.com>
 <70e743cf-b88e-346a-5114-939b8724c83d@arm.com>
 <6b5cde14-58b3-045d-9413-223e66b87bf0@st.com>
In-Reply-To: <6b5cde14-58b3-045d-9413-223e66b87bf0@st.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 30 Apr 2020 11:03:54 +0200
Message-ID: <CAJZ5v0h6t6perZiibCWhEh1_V0pSXqFe-z22TFqH7KTFXYmqpQ@mail.gmail.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
X-Mailman-Approved-At: Thu, 30 Apr 2020 09:06:30 +0000
Cc: "len.brown@intel.com" <len.brown@intel.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Patrick Bellasi <patrick.bellasi@arm.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [RFC 0/3] Introduce cpufreq minimum load QoS
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

On Thu, Apr 30, 2020 at 9:53 AM Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
>
>
>
> On 4/29/20 6:12 PM, Valentin Schneider wrote:
> > On 29/04/2020 16:57, Benjamin GAIGNARD wrote:
> >>
> >> On 4/29/20 5:50 PM, Rafael J. Wysocki wrote:
> >>> On Friday, April 24, 2020 1:40:55 PM CEST Benjamin Gaignard wrote:
> >>>> When start streaming from the sensor the CPU load could remain very low
> >>>> because almost all the capture pipeline is done in hardware (i.e. without
> >>>> using the CPU) and let believe to cpufreq governor that it could use lower
> >>>> frequencies. If the governor decides to use a too low frequency that
> >>>> becomes a problem when we need to acknowledge the interrupt during the
> >>>> blanking time.
> >>>> The delay to ack the interrupt and perform all the other actions before
> >>>> the next frame is very short and doesn't allow to the cpufreq governor to
> >>>> provide the required burst of power. That led to drop the half of the frames.
> >>>>
> >>>> To avoid this problem, DCMI driver informs the cpufreq governors by adding
> >>>> a cpufreq minimum load QoS resquest.
> >>> This seems to be addressing a use case that can be addressed with the help of
> >>> utilization clamps with less power overhead.
> >> Do mean clamping the policy frequencies ? I may have miss the API to do
> >> that...
> > IIUC Rafael is referring to uclamp, i.e. scheduler utilization clamping, see:
> >
> >    https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html#cpu
> >
> > The above describes the cgroup interface, note that you can also set clamps
> > per task (via sched_setattr()).
> >
> > One thing that comes to mind however is that schedutil only "sees" the clamps
> > of runnable tasks, and from reading your changelog you may not have moments
> > without any (i.e. gears are grinding in HW). You'd have to try boosting
> > (setting a high uclamp.min) whatever tasks you have on the software side and
> > see how it all behaves.
>
> Relying on userland side means that various applications need to be aware
> of this specific hardware case and fix it. I was hoping to find a
> solution in side the kernel
> to not impact the software side.

That's not what I meant.

I suppose that the interrupt processing in question takes place in
process context and so you may set the lower clamp on the utilization
of the task carrying that out.

Alternatively, that task may be a deadline one.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
