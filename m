Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7181BF0D8
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 09:10:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31B67C36B0D;
	Thu, 30 Apr 2020 07:10:34 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61A19C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 17:08:27 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id e25so3438270ljg.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2F/GGX+E0c0+b/vD1LG0X0Imv+S43d6dDOK/FkPT3g8=;
 b=jNkYpc6S0ZAt1d7I3WBLADvu8AvAoumyVfy15MqXYeffwC+o4Cob9YDhPtMZ8QWvH+
 NIwdCDYO3Ztb8zQ3NlSssEXDT66TreFG8fQZFp2Sf/GUZvt3pdbYSGtLKGnxRX+tQTcQ
 zb1kabUEdqdEgPGAX3PG8+MATiYMctEl87v0wIV8vw6cs9cJg5IaVwlKG6Zfiv5akn75
 jDsY1e2YbK6YsNoc8BmOCB3Kw7UeY8zYQ1iUdKYUGLuug2TQemrSwaCGKE4Xe4nS9V9P
 WBX0kvYhtVFlazgSsG0wd6v0mt1vwy7k9/83/pCmG6nJkn1eoGUkQmSC02Cnl2AeuK8+
 nCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2F/GGX+E0c0+b/vD1LG0X0Imv+S43d6dDOK/FkPT3g8=;
 b=pi5YIHoqdOOJmD9V395CxNGbDrD2z6y09YWbMCGrXeDc+9GMhE1GDhClxR89F3Ij3c
 6XCGGJzX/XAS3sCa+MjQ6HxP3oaegc2emTcMZQlOWRuSeATPFgA/FaMVUBwWpDlLoZgO
 UXV4w/EohSnd9ofRoGV9WHDw1LAq+BFLr8NIH/f0nRhhEvDsXbPD9YmHjXUt2pjXkCjl
 FMUElvWVUwp+9TD+ECvxA0Bt3dbKG5RCs0ot22insqMFqO2AtTBpNBNWj8wK8hdDCAVQ
 uFExDua1AcsTZREpMF6kkP70NwDjZO5Z8v8J8ru5VxOGHviutLGbEfbPwNIEndwGU6cL
 5JOg==
X-Gm-Message-State: AGi0PuZ+4Usztt7eh+hWDAo+DCMC3LDQ/4uBirUI8JzHAjuFpTQlJI+4
 EZY7z4gY0k573rU0e7PDTMHYCd5xXPygWmupFcnqjQ==
X-Google-Smtp-Source: APiQypI/p8hMCfeSVM1tpb+Hmphas9b6HroclmJaxP7F1hxtSeUvsqPKT++NGG1tH/H5GveF7lU55+kiTYZblxp87+I=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr20607906ljg.21.1588180106288; 
 Wed, 29 Apr 2020 10:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200424114058.21199-1-benjamin.gaignard@st.com>
 <7657495.QyJl4BcWH5@kreacher>
In-Reply-To: <7657495.QyJl4BcWH5@kreacher>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 29 Apr 2020 19:08:14 +0200
Message-ID: <CAKfTPtBNH8x=83RVQajgK859qQGjMTyvEdP4GioMONEZp9t-NA@mail.gmail.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:10:31 +0000
Cc: Len Brown <len.brown@intel.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Patrick Bellasi <patrick.bellasi@arm.com>, linux-media@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, mchehab@kernel.org,
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

On Wed, 29 Apr 2020 at 17:50, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> On Friday, April 24, 2020 1:40:55 PM CEST Benjamin Gaignard wrote:
> > When start streaming from the sensor the CPU load could remain very low
> > because almost all the capture pipeline is done in hardware (i.e. without
> > using the CPU) and let believe to cpufreq governor that it could use lower
> > frequencies. If the governor decides to use a too low frequency that
> > becomes a problem when we need to acknowledge the interrupt during the
> > blanking time.
> > The delay to ack the interrupt and perform all the other actions before
> > the next frame is very short and doesn't allow to the cpufreq governor to
> > provide the required burst of power. That led to drop the half of the frames.
> >
> > To avoid this problem, DCMI driver informs the cpufreq governors by adding
> > a cpufreq minimum load QoS resquest.
>
> This seems to be addressing a use case that can be addressed with the help of
> utilization clamps with less power overhead.

Can't freq_qos_update_request() be also used if you don't have cgroup
enabled on your system ?

>
> Thanks!
>
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
