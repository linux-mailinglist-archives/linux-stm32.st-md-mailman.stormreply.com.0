Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 743B598CBA1
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2024 05:49:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 261B6C7801F;
	Wed,  2 Oct 2024 03:49:14 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BC51C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 03:49:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F095FA4369A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 03:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A518FC4CEEB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 03:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727840945;
 bh=nAEKTIpBmymWLR+e+hBkypCfwSNJotZOEB0oMjBgW3A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Af2UjTVfNh6y+KURqioy4b8Bj7Yu5BpvrE0pOuTAaCdsWVGE8VQdAPbay4eP9DqPg
 vWMLCMNoxrjpq2dgf0Gkki5SuP7pwmk7jkH2meg7cuorJVxX/VF75raABEWvzkaMHi
 vhhxdgRpR3b7B5ke0UhpF0oO9c3sZ7F6qfo5LaAZzh2DiImZJl6yUno80Km9y1f2VX
 IIlH0yPKwIL8OBus0S8hdF72eqSA5xm2L3CztnHUgtzPMXEtvUhtadchDi41GC6Mt7
 Ca1gozPG5gv1ZiW5uDRIVS53lJA/EuDl2IF4CK5RlPgdKNeNXNE2aGU70QMIY0HzW0
 QHOaUeFAAHJ5A==
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5369f1c7cb8so7654410e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Oct 2024 20:49:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWry1DD5+XFT5zOBhfIEh0unwsEksK2AFo5dmoLhyvDgLDR7jkbfcEKLL2A6Nb7U95Ahzk0HAwCNLOrog==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwZ0Ey9K9D08ZjBvzQQcVYxmqp46Z2KVVuH57l9hwcQ82Reu2Ch
 aC6LYIlgZgV6weaxtPemaVTAyWS3B1Xm4XIwGLwAQMBoTnCe8cc0/IwpuuYN77sUT9ImhD1UEiO
 FJ6keyOIVdt3QonJN0RdlprT93A==
X-Google-Smtp-Source: AGHT+IEqtnQCtoRUlnvKJ/juvutRb8LD+WF2Ji1IL7egoXyMFlaAGJMVK219VrK0qM0doCIPbjzZD5sR9nPD1sht5+g=
X-Received: by 2002:a05:6512:1113:b0:533:4638:df40 with SMTP id
 2adb3069b0e04-539a067f65cmr743356e87.27.1727840943291; Tue, 01 Oct 2024
 20:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240930223550.353882-1-rosenp@gmail.com>
 <20240930223550.353882-3-rosenp@gmail.com>
In-Reply-To: <20240930223550.353882-3-rosenp@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 Oct 2024 22:48:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKNMhUy3HUAanod27FnJAz35w7FLp7tp0Uo3SeVbG7EGw@mail.gmail.com>
Message-ID: <CAL_JsqKNMhUy3HUAanod27FnJAz35w7FLp7tp0Uo3SeVbG7EGw@mail.gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Tomasz Maciej Nowak <tmn505@gmail.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jisheng Zhang <jszhang@kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 Jesper Nilsson <jesper.nilsson@axis.com>, "open list:ARM/SAMSUNG S3C,
 S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Enric Balletbo i Serra <eballetbo@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Robert Eckelmann <longnoserob@gmail.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Lechner <david@lechnology.com>, Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "maintainer:SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT" <soc@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Lars Persson <lars.persson@axis.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, Denis Burkov <hitechshell@mail.ru>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Antoine Tenart <atenart@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:ARM/RISC-V/RENESAS ARCHITECTURE"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT"
 <kernel@dh-electronics.com>, Alexey Charkov <alchark@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, Viresh Kumar <vireshk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 "moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] ARM: dts: assign reg to memory nodes
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gTW9uLCBTZXAgMzAsIDIwMjQgYXQgNTozNuKAr1BNIFJvc2VuIFBlbmV2IDxyb3NlbnBAZ21h
aWwuY29tPiB3cm90ZToKPgo+IEZpeGVzIGR0YyB3YXJuaW5nczoKClVuZm9ydHVuYXRlbHkgd2Ug
Y2Fubm90IG1ha2UgdGhpcyBjaGFuZ2UgdHJlZXdpZGUuIEFueSBwbGF0Zm9ybSB0aGF0CnJlbGll
cyBvbiB0aGUgQVRBR1MgdG8gRFQgYm9vdGxvYWRlciBzdXBwb3J0IGluIHRoZSBrZXJuZWwKZGVj
b21wcmVzc29yIGV4cGVjdHMgL21lbW9yeS4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
