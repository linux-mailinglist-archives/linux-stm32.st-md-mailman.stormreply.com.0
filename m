Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEE2C2354
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Sep 2019 16:32:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A89EC36B0B;
	Mon, 30 Sep 2019 14:32:51 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D34CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 14:32:49 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id i16so11297040oie.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 07:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kUMYVmu3XMOxDG5rrYQfwaFPZ00CpUb0hbyz3+BbaG0=;
 b=ocSOcM3ZWOY01jkxy2ENlIXJajkWNDwmEg5xGgVkX9US8ffS4evDnDUeP3C+UfmCIJ
 6XbsEFvW6gkxOlkGjHwsX3B51Px58Rm8uYCTBlm2/EXp8re/KH0pmv5z4D4Mmx4t7bS+
 zK/wMt24k9aB/EQna22v+62R3E7YoGf5c8RdlZUD/nwO86sT3/3FZxLqxJ4WgzDwwb5K
 Ec8ASuH6HLxpOqQxzmc+1K2vDKHd2mKYp2NjkNtGn+Ojcpt7O6D7VXfSbaum5DEavYV+
 kOnC8m1/5UO01ILJBXj3KKfskHB8jggQSalZ5d23M+ONcbiSvFWNgbGcw3XHyedwKVIK
 DjZw==
X-Gm-Message-State: APjAAAVuoDNcq54aR/q2bU91WrG6OBosmAX19mfzqPufI6iaCYNRZU7s
 t2/d6Ir9FTP3if3a0hMXCg==
X-Google-Smtp-Source: APXvYqyWWGHweAxd+epg50sMtp2YxM9KH4bIudckXn/jzkB0T25eaocN5L6p2a1h/laqh+KPJMVjkw==
X-Received: by 2002:aca:c792:: with SMTP id
 x140mr18609373oif.132.1569853967784; 
 Mon, 30 Sep 2019 07:32:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t82sm4319977oie.12.2019.09.30.07.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 07:32:47 -0700 (PDT)
Date: Mon, 30 Sep 2019 09:32:46 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu.Beznea@microchip.com
Message-ID: <20190930143246.GA19967@bogus>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <20190910143231.GB14966@e107533-lin.cambridge.arm.com>
 <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
 <20190910150826.GA18308@e107533-lin.cambridge.arm.com>
 <20190910151055.GX21254@piout.net>
 <CACRpkda4mmpbPWa2nD93CvD6HWzcTUDzyyLdQxC2gNB7XiJF3w@mail.gmail.com>
 <a2aca46a-8eb9-d8a8-de42-9850a8a8f44c@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2aca46a-8eb9-d8a8-de42-9850a8a8f44c@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tmaimon77@gmail.com, linus.walleij@linaro.org, nsekhar@ti.com,
 guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 khilman@baylibre.com, Ludovic.Desroches@microchip.com, linux-imx@nxp.com,
 u.kleine-koenig@pengutronix.de, uclinux-h8-devel@lists.sourceforge.jp,
 marc.zyngier@arm.com, s.hauer@pengutronix.de, linux-unisoc@lists.infradead.org,
 khalasa@piap.pl, tglx@linutronix.de, sbranden@broadcom.com,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com,
 kernel@pengutronix.de, mark.rutland@arm.com, alexandre.belloni@bootlin.com,
 jhogan@kernel.org, palmer@sifive.com, eric@anholt.net,
 thierry.reding@gmail.com, manivannan.sadhasivam@linaro.org,
 ysato@users.sourceforge.jp, zhang.lyra@gmail.com, daniel.lezcano@linaro.org,
 jonathanh@nvidia.com, bgolaszewski@baylibre.com, kgene@kernel.org,
 linux-arm-msm@vger.kernel.org, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com,
 john.stultz@linaro.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 baohua@kernel.org, kaloz@openwrt.org, sboyd@kernel.org, wahrenst@gmx.net,
 mcoquelin.stm32@gmail.com, narmstrong@baylibre.com,
 linux-tegra@vger.kernel.org, festevam@gmail.com, f.fainelli@gmail.com,
 benjaminfair@google.com, shc_work@mail.ru, krzk@kernel.org, yuenn@google.com,
 wens@csie.org, bcm-kernel-feedback-list@broadcom.com, orsonzhai@gmail.com,
 linux-snps-arc@lists.infradead.org, rjui@broadcom.com, vz@mleia.com,
 john@phrozen.org, tali.perry1@gmail.com, avifishman70@gmail.com,
 venture@google.com, lftan@altera.com, linux-oxnas@groups.io,
 shawnguo@kernel.org, afaerber@suse.de, baruch@tkos.co.il,
 maxime.ripard@bootlin.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux@armlinux.org.uk, agross@kernel.org, slemieux.tyco@gmail.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, monstr@monstr.eu, baolin.wang@linaro.org,
 vgupta@synopsys.com, Nicolas.Ferre@microchip.com, linux@prisktech.co.nz,
 nios2-dev@lists.rocketboards.org
Subject: Re: [Linux-stm32] [PATCH 4/7] dt-bindings: chosen: Add clocksource
 and clockevent selection
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

On Wed, Sep 11, 2019 at 07:18:07AM +0000, Claudiu.Beznea@microchip.com wrote:
> 
> 
> On 11.09.2019 03:03, Linus Walleij wrote:
> > External E-Mail
> > 
> > 
> > On Tue, Sep 10, 2019 at 4:11 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> >> On 10/09/2019 16:08:26+0100, Sudeep Holla wrote:
> >>> On Tue, Sep 10, 2019 at 02:51:50PM +0000, Claudiu.Beznea@microchip.com wrote:
> > 
> >>> In that case, why can't we identify capability that with the compatibles
> >>> for this timer IP ?
> >>>
> >>> IOW, I don't like the proposal as it's hardware limitation.
> >>
> >> To be clear, bot timers are exactly the same but can't be clocksource
> >> and clockevent at the same time. Why would we have different compatibles
> >> for the exact same IP?
> > 
> > In that case why not just pick the first one you find as clocksource
> > and the second one as clock event? As they all come to the
> > same timer of init function two simple local state variables can
> > solve that:
> > 
> > static bool registered_clocksource;
> > static bool registered_clockevent;
> > 
> > probe(timer) {
> >    if (!registered_clocksource) {
> >        register_clocksource(timer);
> >        registrered_clocksource = true;
> >        return;
> >    }
> >    if (!registered_clockevent) {
> >        register_clockevent(timer);
> >        registered_clockevent = true;
> >        return;
> >    }
> >    pr_info("surplus timer %p\n", timer);
> > }
> > 
> 
> That was also my proposal for the driver I'm sending this series for (see
> [1]) but it has been proposed to implement a mechanism similar to this one
> in this series (see [2] and [3]).

This comes up over and over, and the answer is still no. Either each 
block is identical and doesn't matter which one is used for what or 
there is some h/w difference that you should describe. 

If you want something that would even be considered to put into DT, 
then define something BSD or other OS's could use too. (That's not a 
suggestion to respin this with generalized names.)

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
