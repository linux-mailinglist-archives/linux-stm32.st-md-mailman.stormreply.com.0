Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0816E1BF3B9
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 11:06:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6EE4C36B0E;
	Thu, 30 Apr 2020 09:06:32 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 116E0C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 09:00:18 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m18so4269063otq.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 02:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6KQACPLN/GZpi+FYGmYG62Ze5DkTEi4wV710+OZY2aQ=;
 b=Mhjqenf0XER61lkR9R4IB/mstEicU4wfM54TKHHz+nvAFTgSROaSG6gXfOa2X761sU
 pSMbOn0xqZBdUlKOwKw6K9zyNEVtXpu9acFE8yeFUVe8CDRfXkuNn+rKK0HrPUxT1mWX
 w/oiTsZzWzh0rR1P9KCwNNSzGf+2o/uguA9O4b2npvWVqtN3F7GQ/zHkT0CIznCZ6NQ5
 nYH9ZlfL2208YFmD5+5r3J1dyXV219nt7Obo7Vpt8fnUBRfu/jRjvqlhQBxn+uqrtS/n
 WFOiwQMWGOKtVjW5rTAwclNfw17uL0fWYf6USW8eMYjHLlq8ErkfD35luw4mgpFoJR7O
 Gp2w==
X-Gm-Message-State: AGi0PuaKemlXBLp0kRjwpiGr6MBlGxiH05c7K21K/3jmeBLEsbw/WR3X
 rUmLXjrzt4RrtT8SKSdvz62nXTbD9zSPsbqgx90=
X-Google-Smtp-Source: APiQypION7scbqEm7NDh6Gggg+1C2ij+NE18vee8aBc9XS9X5f4dFoPNeOl0elV99+hw6k1aQNEtvFSivkjKAlKGNyw=
X-Received: by 2002:a9d:112:: with SMTP id 18mr1274967otu.167.1588237217674;
 Thu, 30 Apr 2020 02:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200424114058.21199-1-benjamin.gaignard@st.com>
 <7657495.QyJl4BcWH5@kreacher>
 <CAKfTPtBNH8x=83RVQajgK859qQGjMTyvEdP4GioMONEZp9t-NA@mail.gmail.com>
In-Reply-To: <CAKfTPtBNH8x=83RVQajgK859qQGjMTyvEdP4GioMONEZp9t-NA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 30 Apr 2020 11:00:05 +0200
Message-ID: <CAJZ5v0g+9DYuGS8URoXYecOxcnu5-kC-D=gvYTuMvxMZbYXR9w@mail.gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
X-Mailman-Approved-At: Thu, 30 Apr 2020 09:06:30 +0000
Cc: Len Brown <len.brown@intel.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Patrick Bellasi <patrick.bellasi@arm.com>, linux-media@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 LAK <linux-arm-kernel@lists.infradead.org>
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

On Wed, Apr 29, 2020 at 7:08 PM Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Wed, 29 Apr 2020 at 17:50, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> >
> > On Friday, April 24, 2020 1:40:55 PM CEST Benjamin Gaignard wrote:
> > > When start streaming from the sensor the CPU load could remain very low
> > > because almost all the capture pipeline is done in hardware (i.e. without
> > > using the CPU) and let believe to cpufreq governor that it could use lower
> > > frequencies. If the governor decides to use a too low frequency that
> > > becomes a problem when we need to acknowledge the interrupt during the
> > > blanking time.
> > > The delay to ack the interrupt and perform all the other actions before
> > > the next frame is very short and doesn't allow to the cpufreq governor to
> > > provide the required burst of power. That led to drop the half of the frames.
> > >
> > > To avoid this problem, DCMI driver informs the cpufreq governors by adding
> > > a cpufreq minimum load QoS resquest.
> >
> > This seems to be addressing a use case that can be addressed with the help of
> > utilization clamps with less power overhead.
>
> Can't freq_qos_update_request() be also used if you don't have cgroup
> enabled on your system ?

It can.

The problem here is that imposing a global minimum frequency limit
generally causes the power draw of the system to increase regardless
of what is going on, including the CPUs that are not involved in the
handling of the interrupt in question.

That seems a bit excessive ...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
