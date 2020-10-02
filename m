Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFDF28104E
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Oct 2020 12:06:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C97F4C424AF;
	Fri,  2 Oct 2020 10:06:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14F62C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 10:06:45 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CDC6206CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 10:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601633204;
 bh=UJnxaC4M1lOTDgzs586QRSYYhrDCyDplqGq8e17l78E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zK6KwWMfGx+COYeTiW7XydYPT01P72wNhoDo1SEhefHyCZ2dCm5+bFatWiMRR3iyG
 pV7fqxOJPOW+mEONS9qBxxAEg/5+9PT+UdMukVhcUctmHwSVNjY1+32RMDdRWy6r9m
 KaGUN9J4TqtYuUjQJ6SSBLyjrSliBPEQN5WSsiOQ=
Received: by mail-ed1-f50.google.com with SMTP id l24so1057964edj.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Oct 2020 03:06:44 -0700 (PDT)
X-Gm-Message-State: AOAM5310bmhJMuTWwSJUAG4XA9VuTCtwzUiRXRDJ2FI3+LsEBk/Za20w
 cKUPtlItMGG/8YEZY4YbcQ7MbFVsbdl/KsbSOWg=
X-Google-Smtp-Source: ABdhPJyMUEsiLReOne5kMxnk5FpY37kPG9ggO9a1YAGcyv6YS7ZODs7IzG6QmWx9MLtvVFTrSOvy1Y7+WgappyP9AWU=
X-Received: by 2002:a50:a452:: with SMTP id v18mr350430edb.143.1601633202677; 
 Fri, 02 Oct 2020 03:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-6-post@lespocky.de>
 <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
 <4533120.poq1GmoeVQ@ada>
In-Reply-To: <4533120.poq1GmoeVQ@ada>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 2 Oct 2020 12:06:30 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd3um-RvcmjexhYbpnbwcd6yKRYdCV1fnmjKoLguVOLKQ@mail.gmail.com>
Message-ID: <CAJKOXPd3um-RvcmjexhYbpnbwcd6yKRYdCV1fnmjKoLguVOLKQ@mail.gmail.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [Linux-stm32] [PATCH v6 5/7] ARM: dts: Fix schema warnings for
	pwm-leds
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

On Fri, 2 Oct 2020 at 11:28, Alexander Dahl <ada@thorsis.com> wrote:
>
> Hello Krzysztof,
>
> Am Freitag, 2. Oktober 2020, 11:12:50 CEST schrieb Krzysztof Kozlowski:
> > On Thu, 1 Oct 2020 at 01:53, Alexander Dahl <post@lespocky.de> wrote:
> > > The node names for devices using the pwm-leds driver follow a certain
> > > naming scheme (now).
> > >
> > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > ---
> > >
> > > Notes:
> > >     v6:
> > >       * added this patch to series
> > >
> > >  arch/arm/boot/dts/at91-kizbox.dts             | 10 +++----
> > >  arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 +++---
> > >  arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++------
> > >  arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++----
> > >  arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 +++---
> > >  arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++----
> > >  arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++----
> > >  .../boot/dts/berlin2cd-google-chromecast.dts  |  6 ++---
> > >  arch/arm/boot/dts/exynos5422-odroidhc1.dts    |  4 +--
> > >  arch/arm/boot/dts/exynos5422-odroidxu4.dts    |  4 +--
> >
> > Somehow you did not CC the maintainers... please use
> > scripts/get_maintainers.pl to obtain list of addresses.
>
> Well, that will be a huge list of Cc then.  What is the policy?  Everybody
> gets the whole series or different list of receivers per patch?

With git send email and get_maintainers.pl you can simplify it:
1. Send cover letter to everyone (could be skipped and instead send to
mailing lists and then link included under --- in each patch).
2. Send automatically each patch only to maintainers, with adjusted
in-reply-to to the cover letter already sent. Something like: git
send-email --cc-cmd "scripts/get_maintainer.pl --no-git --no-roles
--no-rolestats".

Probably 1+2 could be even one command if you put manually lists as Cc
in the cover letter.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
