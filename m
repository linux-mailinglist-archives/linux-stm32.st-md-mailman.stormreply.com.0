Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 026ED59998F
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Aug 2022 12:17:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A73FAC5E2C2;
	Fri, 19 Aug 2022 10:17:52 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E214C03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Aug 2022 10:17:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9B5E8CE25E4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Aug 2022 10:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5203C433B5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Aug 2022 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660904267;
 bh=bBGGs+VaVwa9GZVrl+mfip/PNxqOhyRiV5mtJK9gULA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LSwaVI8rUzMmO/Ct43XNW9RruD+qxBI8tnG2OoF/s63ywpKDgUlWIi/aLX949UKPN
 jM20X3grcEAWH38fx5/oYHEV7F5sTeuvwCDPVnMMG53ff2UByclp++LklueQkXypFU
 H7c9/JJp/RjyIB8BwC52gvvAYZIk2WNxpCZz5cJXuJNC06FJis2sLmU6k3EGL09lKc
 Jb0xsF7kl1AKAIK0xmR/ofWHEdPxStI2V1NvsgZa+z5y1Ow/2cxRWkgNKh/52pgoWK
 DCt8ZOZFDA7eTYb7MHgMkmQVIDOYTuxR00NmLv1qFt7npxJhkX1i5DzsxxCLPXCGpY
 yOQjDCPKxSuDQ==
Received: by mail-lf1-f47.google.com with SMTP id d23so1164727lfl.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Aug 2022 03:17:47 -0700 (PDT)
X-Gm-Message-State: ACgBeo0WoYBaE2g1LRp2xsDYL2DYmAxd74b9FS5E5glofJ2RYkBECztD
 J9C7d3Bwkj8LTV0U04ERx7XrproZ4nlpKf6lQ/s=
X-Google-Smtp-Source: AA6agR5J9QREsVSQar6+cAcI+eQkL21ldizqJ/P5eBUIHXbbNTd/IG0qShM+KxoLNU3uFpfrKuXX255VS5DFZKFqEjU=
X-Received: by 2002:a05:6402:2751:b0:443:d90a:43d4 with SMTP id
 z17-20020a056402275100b00443d90a43d4mr5657123edd.368.1660904254658; Fri, 19
 Aug 2022 03:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220818135522.3143514-1-arnd@kernel.org>
 <20220818135522.3143514-2-arnd@kernel.org>
 <CAMuHMdXEXQNeOQGnYTQG58nHwB8YwLQ5q1vaje7kPQexrAMsRA@mail.gmail.com>
In-Reply-To: <CAMuHMdXEXQNeOQGnYTQG58nHwB8YwLQ5q1vaje7kPQexrAMsRA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 19 Aug 2022 12:17:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0kJVLEFqS0E=Lv2=HE9dbmjgA=_T2NX4zhq7EHvk4DBg@mail.gmail.com>
Message-ID: <CAK8P3a0kJVLEFqS0E=Lv2=HE9dbmjgA=_T2NX4zhq7EHvk4DBg@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Peter Chen <peter.chen@nxp.com>,
 Tony Lindgren <tony@atomide.com>, Magnus Damm <magnus.damm@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Stefan Wahren <stefan.wahren@i2se.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
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
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Bin Liu <b-liu@ti.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Qin Jian <qinjian@cqplus1.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Felipe Balbi <balbi@ti.com>,
 linux-sunxi@lists.linux.dev, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 USB list <linux-usb@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sudeep Holla <sudeep.holla@arm.com>, Shannon Nelson <snelson@pensando.io>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 01/11] ARM: defconfig: reorder defconfig
	files
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

On Fri, Aug 19, 2022 at 11:17 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> This may cause conflicts with the usual refresh I plan to do for
> v6.0-rc1, which will be very similar to
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=517d634d376042ab797d9feeb94236ad4cb03396
> So it may be better to drop this part.
>
> However, that decision is up to you, as you will have to handle the
> conflict when merging renesas-arm-defconfig-for-v6.0-tag1 later ;-)
> But sfr might complain before...

I'm not too worried here, if you just do the 'savedefconfig' step, you
should get
the same change and the mergetool will figure it out. In case there is a nasty
context conflict, you could just send that part early so I can resolve it.

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
