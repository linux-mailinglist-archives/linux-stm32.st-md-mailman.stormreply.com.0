Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A2057D4F3
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 22:43:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E872EC03FEA;
	Thu, 21 Jul 2022 20:43:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC3B8C03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 20:43:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0CAC60C11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 20:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E68DC341C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 20:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658436221;
 bh=IXAnQ6GemUSS9XzXU96zGBYCowAVAOwBRn59x35Rp2M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=o74RQXgnVanDe9P19S6cZXCpO4QDYEWs9bQ5R9qczvm1tNgfjmN4avgiK0pRwb6Y3
 kBY5A3FPU5NqLGHKRWltqITvwU2NGHizNnzIRcPfB+g5cHWmkLbZGrlpNJgRy9v+bY
 0yllUX1cMOTPL0grM2hT8E4qQqL8I/D/R0EWCORJ30f/2vTrMRSwWceNcE0PNIzRgQ
 bbK+j86mXlLmk5fIPBIIfVXoQteZLrlHXMrqSBp4vb6976m9jXBm+57GD5acYnTsiy
 UJJvXlrf0YSXsFXst77eJtAmQ4eDUwK9APBE4kok14F07NEF9V7i5SXbmHu38PemMc
 iAMZZoW8EVSBg==
Received: by mail-yb1-f172.google.com with SMTP id i206so4812860ybc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 13:43:41 -0700 (PDT)
X-Gm-Message-State: AJIora8qmYZnFTE9Cz48ZvDgxIkK7vYONOw7/liqUG9L6qIzbMDfXC2d
 PJ6/Fj85RId2cO0kKmY7YPmbJOPNfT4LQHSeg4I=
X-Google-Smtp-Source: AGRyM1seo9DqPLT2Y67c1F9GPoLfoH/Dg7y5rc4GhGQoQDEAaUTYumu5ZH8+R/xhfkBTlrUa8ZxdgCiDlkpRaThuTk0=
X-Received: by 2002:a81:6dce:0:b0:31e:5a3b:d3a2 with SMTP id
 i197-20020a816dce000000b0031e5a3bd3a2mr305661ywc.495.1658436209315; Thu, 21
 Jul 2022 13:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-5-arnd@kernel.org>
 <e83c98f9-f32a-6bfd-71b6-9aba22aa7abb@linaro.org>
In-Reply-To: <e83c98f9-f32a-6bfd-71b6-9aba22aa7abb@linaro.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 21 Jul 2022 22:43:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0yc_iZ1dqbReckvune6KszCPvysCX9okYoaU-by+YRhQ@mail.gmail.com>
Message-ID: <CAK8P3a0yc_iZ1dqbReckvune6KszCPvysCX9okYoaU-by+YRhQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Alexander Shiyan <shc_work@mail.ru>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Will Deacon <will@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 4/6] ARM: defconfig: address renamed
	CONFIG_DEBUG_INFO=y
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

On Thu, Jul 21, 2022 at 5:42 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/07/2022 16:13, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > CONFIG_DEBUG_INFO is now implicitly selected if one picks one of the
> > explicit options that could be DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT,
> > DEBUG_INFO_DWARF4, DEBUG_INFO_DWARF5.
> >
> > This was actually not what I had in mind when I suggested making
> > it a 'choice' statement, but it's too late to change again now,
> > and the Kconfig logic is more sensible in the new form.
> >
> > Change any defconfig file that had CONFIG_DEBUG_INFO enabled
> > but did not pick DWARF4 or DWARF5 explicitly to now pick the toolchain
> > default.
>
> I think this should be split - into remove DEBUG_INFO (noop) and into
> selecting CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT (a fix).

I'd rather keep them together: while removing the DEBUG_INFO is
now a NOP, keeping the two changes together explains much better
why this is done and is atomically needed based on the single patch
that caused the change.

It's the same with the LEDS patch that replaces the CONFIG_LEDS
option with CONFIG_NEW_LEDS.

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
