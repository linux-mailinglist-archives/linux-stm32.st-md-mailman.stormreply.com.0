Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D837D599859
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Aug 2022 11:17:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D536C5E2C2;
	Fri, 19 Aug 2022 09:17:58 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFD6EC03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Aug 2022 09:17:57 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id h3so176494vko.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Aug 2022 02:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=p1fTT14mThGLEnUJzebZNUEmZIwatmKiQNsPLBHI5iY=;
 b=XR21uy40mHLPtSTKAqdJKVL9MwMeWLFV4ooUajs4MA13OTg801f8tRjFXKx+Ld8j9n
 1fabusKbSEbno2jvmIIhGhn8+G784QEEtX5IDZaoBlT/WZPt9Ns8/QirPBLEeDmnIciO
 eZM0kgNk2Nn0MvzlFg0flqwTIPX+ZYlraT+9z5voW3WJgMMcu91WruvvD6Xx5OaIsAa+
 PvPyY7QYq/uufsS5b2XYcI9B1Ge1fZyWXMkwQkvOrbgBTcEQaASUpLx7zbZBn4FA5yio
 K8uT60bZndJeJAGya7JKePX3tY/EGpMZ4+C0Dp6cazsZeN5obGXbK+rYLl52c048/ZJ0
 HLlA==
X-Gm-Message-State: ACgBeo1LCI9oQNkUf5fOuuanJWMrimRtSKm7oMSrcPy07Gmb4920L4im
 v4AW4JywTd+taylouVNWMhwedYAWyqT+aYYO
X-Google-Smtp-Source: AA6agR6Azq/Oh1iC+2LsB9V871DsyIz64lblg12hQFjECH0I1u1csap5O6ouCrEPAYCZtfmOTJOWqA==
X-Received: by 2002:a05:6122:154:b0:377:ebed:7e5d with SMTP id
 r20-20020a056122015400b00377ebed7e5dmr2686447vko.41.1660900676385; 
 Fri, 19 Aug 2022 02:17:56 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42]) by smtp.gmail.com with ESMTPSA id
 h7-20020a056102214700b0038ab671b8afsm2117295vsg.16.2022.08.19.02.17.55
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 02:17:56 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id s5so1566667uar.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Aug 2022 02:17:55 -0700 (PDT)
X-Received: by 2002:a25:cbcf:0:b0:695:2d3b:366 with SMTP id
 b198-20020a25cbcf000000b006952d3b0366mr1673997ybg.365.1660900664907; Fri, 19
 Aug 2022 02:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220818135522.3143514-1-arnd@kernel.org>
 <20220818135522.3143514-2-arnd@kernel.org>
In-Reply-To: <20220818135522.3143514-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Aug 2022 11:17:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEXQNeOQGnYTQG58nHwB8YwLQ5q1vaje7kPQexrAMsRA@mail.gmail.com>
Message-ID: <CAMuHMdXEXQNeOQGnYTQG58nHwB8YwLQ5q1vaje7kPQexrAMsRA@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
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

Hi Arnd,

On Thu, Aug 18, 2022 at 3:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The debug-info and can subystem options have moved around in the
> 'savedefconfig' output, so fix these up to reduce the clutter
> from the savedefconfig command.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -33,7 +33,6 @@ CONFIG_INET=y
>  CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y
>  CONFIG_CAN=y
> -CONFIG_CAN_RCAR=y
>  CONFIG_PCI=y
>  CONFIG_PCI_MSI=y
>  CONFIG_PCI_RCAR_GEN2=y
> @@ -57,6 +56,7 @@ CONFIG_RAVB=y
>  CONFIG_SMSC911X=y
>  CONFIG_MICREL_PHY=y
>  CONFIG_SMSC_PHY=y
> +CONFIG_CAN_RCAR=y
>  CONFIG_INPUT_EVDEV=y
>  CONFIG_KEYBOARD_GPIO=y
>  # CONFIG_INPUT_MOUSE is not set

This may cause conflicts with the usual refresh I plan to do for
v6.0-rc1, which will be very similar to
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=517d634d376042ab797d9feeb94236ad4cb03396
So it may be better to drop this part.

However, that decision is up to you, as you will have to handle the
conflict when merging renesas-arm-defconfig-for-v6.0-tag1 later ;-)
But sfr might complain before...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
