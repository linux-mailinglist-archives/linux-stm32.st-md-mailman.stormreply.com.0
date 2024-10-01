Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CE998C669
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2024 22:00:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CDFFC78019;
	Tue,  1 Oct 2024 20:00:19 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B56FC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 20:00:11 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-20b7a4336easo20243095ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Oct 2024 13:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1727812810; x=1728417610;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
 b=eA+adyk2NDCT3WYlxBKNt4VCGokN3cxeippfF4nZdpzjGNF5Ia7aAy7+9TKyelCmbL
 o5BZ8Y1cwKYVzFfj8dn5nC572jxrfDnCOJkpJQ1MLHAtJU1zvOLyn6iX4+GkodRZyV50
 l4KWhwrUhEwvb0UEVtaP/cF/y3rSO6nx6MZJVw0vPQ/xKw9M+lI4UUzCbTysHrq97yCM
 OQhNaJiByI+fsinBqfQTW1xNAGHNxVLlgSVqhXlBV0Xv07Q8I/O6sguAJxhiycnfVzeF
 eFMocTGAkD/8MesJKMQHo/JoyUBSuOD3cIc91GYo3qqtDCPGNEo5eTHU7K7O6/qCfkiG
 Qfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727812810; x=1728417610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
 b=I0k7j5pGqQYIGeMIPTcPpMZTjx+PfwVMZVhEZ2JYPzkoGSSiuHiUcSpbMho1zbbU4a
 HiARWAEMzlA5lQxRFT9pn8okC9zz64GHccYwd3bxCt8Gvz1u87jC8Nkvq9sUjpGcnZV5
 5cozalJYydDXctEBphjFTcf92aZNUbf6zBCDypEYOSBPsw/kbRQrc9f/SPH7ZEmMMg3p
 GKDlSMu5sw+bF2GbOPOGBnNl4NK2i7OYascNVZTeIUkuEsEq0M4wLWu2zQ465WhGRrrc
 ilGpY1BclWXfUqqHVKKnSCcemrM5VYoj4hS1ighHSzCxpfaCcc7UuIHpCf9t0TKm7EgI
 L2ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaBsyeQEJhA0D8ahMkm8YCjFOOeRvN/XBLlQJeClQU+ruOeSNmjAJQ70q+xtB6DXT7DDVVABGNn5VY7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxxi2PKeaNYCpu4t0Avx4et5DO9+tFOoHRmf3eSaRwRnJQ61XPr
 97yR5UnY8R/k6fw8o9JkJwySc++5EAOv8gaXUSrZzrDBGW/xMWLRct0RGgDqAMiJB4VqGzwUNqh
 yOJKv/eKHOS0ONEIqsxolSXl3Lak=
X-Google-Smtp-Source: AGHT+IEzN68oFH6UETNrpbvCGpopcDsigqPvgYKygFNF7D6FUqPz4x1zQ8ZA7UoZNXXUi84OPMM6AhdceSvhM1DdNJ4=
X-Received: by 2002:a17:902:e550:b0:20b:720d:734 with SMTP id
 d9443c01a7336-20bc5a5cd06mr11151925ad.41.1727812809889; Tue, 01 Oct 2024
 13:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240930223550.353882-1-rosenp@gmail.com>
 <20240930223550.353882-3-rosenp@gmail.com>
In-Reply-To: <20240930223550.353882-3-rosenp@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 1 Oct 2024 21:59:58 +0200
Message-ID: <CAFBinCB1Rz+C=Tj+RJAL5KZbk9K7cnpF_uR6rKkMeqyCuDBo4A@mail.gmail.com>
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
 Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>,
 "open list:ARM/SAMSUNG S3C,
 S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Joel Stanley <joel@jms.id.au>,
 Robert Eckelmann <longnoserob@gmail.com>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Lechner <david@lechnology.com>, Arnd Bergmann <arnd@arndb.de>,
 Enric Balletbo i Serra <eballetbo@gmail.com>,
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

SGVsbG8gUm9zZW4sCgp3aGVuIHlvdSByZS1zZW5kIHRoaXMsIHBsZWFzZSBkcm9wIHRoZSBBbWxv
Z2ljIGZpbGVzLgoKT24gVHVlLCBPY3QgMSwgMjAyNCBhdCAxMjozNuKAr0FNIFJvc2VuIFBlbmV2
IDxyb3NlbnBAZ21haWwuY29tPiB3cm90ZToKWy4uLl0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbjYtYXR2MTIwMC5kdHMgICAgICAgICAgICAgICAgICAgIHwgMiArLQpUaGlzIGZp
bGUgd2FzIGRyb3BwZWQgd2l0aCBbMF0KCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2FtbG9naWMvbWVz
b244LW1pbml4LW5lby14OC5kdHMgICAgICAgICAgICAgICB8IDIgKy0KPiAgYXJjaC9hcm0vYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbjhiLWVjMTAwLmR0cyAgICAgICAgICAgICAgICAgICAgIHwgMiAr
LQo+ICBhcmNoL2FybS9ib290L2R0cy9hbWxvZ2ljL21lc29uOGItbXhxLmR0cyAgICAgICAgICAg
ICAgICAgICAgICAgfCAyICstCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2FtbG9naWMvbWVzb244Yi1v
ZHJvaWRjMS5kdHMgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgYXJjaC9hcm0vYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbjhtMi1teGlpaS1wbHVzLmR0cyAgICAgICAgICAgICAgIHwgMiArLQpUaGVz
ZSBnb3QgdXBkYXRlZCB3aXRoIFsxXQoKClswXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9hbWxvZ2ljL2xpbnV4LmdpdC9jb21taXQvP2g9djYuMTMvYXJt
LWR0JmlkPWUyYTNmMTFhZTExYzlmOWVlNzgwYmY0OWYwMGE2OWYxMmRjZTM1MjkKWzFdIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FtbG9naWMvbGludXgu
Z2l0L2NvbW1pdC8/aD12Ni4xMy9hcm0tZHQmaWQ9Nzk0N2ZkMmQzNTBlNjA1N2U3NTE0NDU5Yzdl
ZTJkYjM5ZDEwOTZhMgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
