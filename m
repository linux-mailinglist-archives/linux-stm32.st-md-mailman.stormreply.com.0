Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8E13D3B64
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jul 2021 15:46:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43AFAC5719C;
	Fri, 23 Jul 2021 13:46:35 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74B51C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 13:46:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Ma1HG-1ldDQg2hr2-00VwmI for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 15:46:30 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 o3-20020a05600c5103b029024c0f9e1a5fso3293343wms.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 06:46:30 -0700 (PDT)
X-Gm-Message-State: AOAM532NP5aI2IeUj99bRVNSPhHckF0uubBB7W+cKGdxQE/2fa0tLthq
 hfN3dHPO6TDAokbr0ANcmnfQRKejGDWQsLJgVTw=
X-Google-Smtp-Source: ABdhPJyfbJ/TTAuOw7j89Wul0Xg+2CYe0Hm+3Y35Empz4DlbpbFzr1NRRDGERsVfUMwmu0uZ4yYDMTYgM127TEzwEVk=
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr14345036wmk.84.1627047990248; 
 Fri, 23 Jul 2021 06:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 23 Jul 2021 15:46:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ax29ThCG867phtx1Xb12GgiJFcLDd8H9VLbsJQ1uoAw@mail.gmail.com>
Message-ID: <CAK8P3a1ax29ThCG867phtx1Xb12GgiJFcLDd8H9VLbsJQ1uoAw@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Provags-ID: V03:K1:PR9RCQ/bbMFoU1SPxaHigIQQCoqbNS7tZsSoMnIUbljqUQ1Eg1F
 sCfHlDMzYxVMi0zz+w5BlpCKGCOP/do98zxoJTUYrZTCKs6/ubcRUZJWG8S1ZLy897GlUEE
 wqXrHK/EvAEmOJ4DiwGHTtdRszJpXlOvNOH/riv8gqoOgEPloQLArLrcd7pLQ8KC/I5RrV6
 DK2a+0jiKAbloeZm9yWpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+CBkEcvW878=:aE31TKpZG1TEfCwp/SvXd4
 AJyX0nC6JCAlRMTkHQTtSXYDpKWzis7CaZs4+ZRU0oFKD182XGrqkZr/TWAlQJc7PAnKg/BLC
 lbolqf4PoT+QenMoy2y+H+mbbFvHbAHZZHXLpSbomsxWuGu/Xtmsz1q6ViUX4SlPk6qJ9RMZk
 OQnYQmyi/o2U96ABpfFxTrE4o0jrdixe3uGd3Hl1Fm3DG39WlF8/cMmg2Zxz+RWo+AwQKBc0K
 zywfg2KDhdPZXR0qmbLL719tgnuqBdI2fsgz1+ovCDlkBnZsr1i4NneHpVt1xPODMHVv8+dQ6
 xMm14oM3tr/+UPL/uBv8g0yXHso6eN83JKc3UiKOh5VdKnCBXxBjEaMx3LSJ13QuTkebC04pJ
 RB5/szMZLNIvqBF12Rea1WxlQgkq4xpxBcTyZHD6V2otwEoOeFT4s/7uabuqnzweg7ygQunmZ
 UL0h+eHtZzVeFC+Nyz2milnI6Olt3hFb0B1kCdWlB18ySesejacAxQHoeOx/pEVdtBSmQez9b
 IzHJLpiH1keJ3V1zpBcq5tOWle8jM++hUFhXYLEtdXG+ifL3FlDrAGm8kpTPRSrSnu3kHCgdM
 0GJ8+vccVOnwAz/gXrXtPWNKDTicAoRJQqKYhzc8DJ9QQoNbQ+o3XldYD3hyU/zCflCz35TOU
 wXUSoU7kDfbNekbVCwqCZBqfkZUKuoV9YaBlcCR9AUs+ycZzoqckCWfQNQxVbuYJ4BBQ+JngQ
 Hxjpxts50VlWNZv8GqAKqFzG1mHQCPEm8jR57MhOtniYJFURA5zYfWTPDkXdZBLSLekAUrNR9
 JmylV2avumLoa0j0pFVSDslMZ5qxkDCBbIF0/Pk0/IQi/WxYrdk8eqK1Tun5lFiCytA6UlgaK
 hIfa0+89IYodg/AlgkxHZCCFDn23Z9TBpTF1d+vLotV3MLw3Cev6ZwkODDYRSY/LMAQK5Q1PW
 SPWJaerSnAUQ8LrDrZoJ6d/sJjr+g7Y47tVqQrHgqq35ZTc5DHKXF
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olof Johansson <olof@lixom.net>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/7] Add STM32MP13 SoCs and discovery
	board support
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

On Fri, Jul 23, 2021 at 3:28 PM Alexandre Torgue
<alexandre.torgue@foss.st.com> wrote:
>
> This series enhance the STM32 MPU family by adding STM32MP13 SoCs support.
> It adds machine support and device tree diversity to support the whole
> stm32mp13 family (STM32MP131/STM32MP133/STM32MP135, plus security feature
> diversity).
>
> Basically STM32MP13 SoCs embeds one Cortex A7, storage (SD/MMC/SDIO, QSPI FMC),
> network (ETH, CAN), display (DCMIPP, LTDC, ...), audio(SAI, DFSDM, SPDIFRX),
> com (USB EHCI/OHCI, USB OTG, I2C, SPI/I2S, U(S)ART).
>
> This series also adds STM32MP135F Discovery board support (stm32mp135f-dk). It
> embeds a STM32MP135f SOC with 512 MB of DDR3. Several connections are available
> on this board:
>  - 4*USB2.0, 1*USB2.0 typeC DRD, SDcard, 2*RJ45, HDMI, Combo Wifi/BT, ...
>
> Only SD card, uart4 (console) and watchdog IPs are enabled in this commit.
>
> Note that file stm32mp135.dtsi doesn't define nodes but I add it now to ease adding
> of new nodes in a (close) future.

I had a brief look and it seems all fine to me, nice work!

The only (very minor) thing I noticed is that the crypto engine device node
has an unusual name 'cryp@' instead of the usual 'crypto@', but this is already
the case on stm32mp157.

With this changed,

Acked-by: Arnd Bergmann <arnd@arndb.de
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
