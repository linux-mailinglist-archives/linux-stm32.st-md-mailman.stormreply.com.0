Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B35315A457E
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Aug 2022 10:53:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59981C03FE1;
	Mon, 29 Aug 2022 08:53:10 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BE21C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 08:53:09 +0000 (UTC)
Received: from mail-ed1-f52.google.com ([209.85.208.52]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N0nOF-1pN0YD2bQ5-00wkv0 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 10:53:08 +0200
Received: by mail-ed1-f52.google.com with SMTP id e18so1700262edj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 01:53:08 -0700 (PDT)
X-Gm-Message-State: ACgBeo2KzbxKyymoDrMhiZ/9H/cR10kxq/Q8iO6vxX7KsCIp5UuInwyJ
 loCD46K/xNkcTT0vKKfk0ICZEvIXWHAGr7HBVh4=
X-Google-Smtp-Source: AA6agR4dO9Qog99EOhFMYD2/TUvDUFPeLAFKpCKJySAtY2CWxJsmH8fvbDozC2seipJY5siIbg1N/2rhc6q5GDAswIQ=
X-Received: by 2002:a17:907:d0b:b0:741:7ca6:a2b with SMTP id
 gn11-20020a1709070d0b00b007417ca60a2bmr3580848ejc.654.1661763177783; Mon, 29
 Aug 2022 01:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220818135522.3143514-1-arnd@kernel.org>
In-Reply-To: <20220818135522.3143514-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 29 Aug 2022 10:52:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1tsby7+xfKTQaaBQZ4t-=uWG5Dtbcn_jPEsSMG_YVHgA@mail.gmail.com>
Message-ID: <CAK8P3a1tsby7+xfKTQaaBQZ4t-=uWG5Dtbcn_jPEsSMG_YVHgA@mail.gmail.com>
To: linux-arm-kernel@lists.infradead.org
X-Provags-ID: V03:K1:EZiW+9lo5BpA1GGQvq0aNFjPKX2/WYp75iylJ/veM6NRewpeQyl
 VOIU3SSL76IP754+zs/bRKnvmRwAYN2nK2PhakcoFRDWz5ntPZSeWUe95bmPPx46e2UUd02
 jxh0pJ6hLqRHTIcnUtWNp+d14zbFNebG8Hn+u/JWDhDp47SKFvSlsTYp2OFVA7NzEuM01D0
 8psqVG8rpL6ooo7WMilig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4F4IDsJqAug=:osElwZNCnlvKlaIbJWOvkA
 AE+fzotxkGOMO/1xO/NrNORX6hD+PFk/NA5mDe6r8OarPKghbtnpTmcvUGyWY/sy3fm1X4XyK
 G4CsufRlYw3jnHms6nNkSkVKwWv/KE44arO1vfRm8ab5LdoIJ96WmSvF0dguqVhkyYJwnVz0T
 bPm6p63/pawlkONRmMd4TwemHhQoZZy7dmsNSwIGCM2pVQRbUGb9HxsfARd9VkIL7hUkLo4sf
 RXfh944hnGy4BBQr+KYFcpa3zLSE7PNf0VFhOKkI1otXG4jJpPzzAWM0fiTsZ57lfsVKKOeNA
 JskECyl55nw5meOuxu7G0BUpK7HRaQmRkaXguet/ncbDdCmVaM0Gurk+EIa8CMrTRWEXLnr24
 cFOikOy1oFHOmWul1zNov3V7RoamGfySNWdKjOKjyFqBqQKasdeb/dQGvfLzi+CqBEiZHv8L/
 sb/qSWiQgM6feoq2TCTDDbdKsKWoNn3uvE1Xd390kI62giwTYMxPxLZUj66MM+WaZE8iiu4Pv
 +dzc87nv2dAM7Cz804E+AlUOwtk4kUr72Yd+aGhRKYbL6ITVfL/tLRYpdXFbm7ZQlcJxoaJwi
 vY6rVJGS4WB0/rFvr02IPF/8AEn2v4+Ivrgm4leQTkcc5TUO9sptol5/AQeNTp4wq6U4ZfSk5
 3AZ409+PIWCs2OGqDPqMcNcoGMfoMt8dERiAF5XCGuFTMPqZr8DDtYe3VAo1W7hrHRyYeBGXJ
 ozs+fml4+hBwmoZjKE/OB3NXww3a0n4Ymu44dwNnLIax0rqCF3xRANmvK069hpI2cnBWdY5XV
 gDSCuJH1t7Qc+9IKWMJSF2GuVi1J51ankt1Mcnz6pLqtWLSU8D714vdWUnzLQ/Fz9jTGtezY7
 0sffA08JW5sT70DalviA==
Cc: Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Peter Chen <peter.chen@nxp.com>,
 Tony Lindgren <tony@atomide.com>, Magnus Damm <magnus.damm@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Stefan Wahren <stefan.wahren@i2se.com>, linux-samsung-soc@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 Bin Liu <b-liu@ti.com>, Qin Jian <qinjian@cqplus1.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Felipe Balbi <balbi@ti.com>,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sudeep Holla <sudeep.holla@arm.com>, Shannon Nelson <snelson@pensando.io>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 00/11] ARM: defconfig cleanup
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

On Thu, Aug 18, 2022 at 3:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> I have continued the cleanup of the multi_*_defconfig files, and
> reordered the other files according to the 'make savedefconfig'
> output as before.
>
> I would like to queue these up for 6.1, though the last two
> should probably be considered bugfixes and merged for 6.0.
>
> Since a third of the defconfig files are for machines that
> are now marked as unused, I skipped those files. There are still
> a few things that get removed by 'make savedefconfig' as they
> now get selected by some driver:
>
> -CONFIG_SERIAL_BCM63XX=y
> -CONFIG_SND_AUDIO_GRAPH_CARD=m
> -CONFIG_NEW_LEDS=y
> -CONFIG_LEDS_TRIGGERS=y
> -CONFIG_TEGRA20_APB_DMA=y
>
> I think for those we should follow up with patches to remove the
> 'select' statements.

I dropped the last patch that Greg has already picked up, and merged the
rest into the arm/defconfig branch of the soc tree.

Thanks for the Acks.

        Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
