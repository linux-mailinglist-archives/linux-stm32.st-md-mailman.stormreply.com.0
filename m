Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFE757E536
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jul 2022 19:17:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECD09C04005;
	Fri, 22 Jul 2022 17:17:20 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2B68C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 17:17:19 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id z25so8706521lfr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kKlkNDy7IkULxlqR/cm5H8XjRPA1VC1UXnLKGJxFlME=;
 b=kBc+EnEOjMvGg2ZacnNtByBS5zqpdyDA3715FeJnzHEz8i7uQ3YazW37ESeq6Bt/Xs
 xfZxUKs2P9eMWf6y8K6/VFe7VOybuL/G6VLN3AIKAgqfVnwnDcWIaWqMeBD90b1cHJEm
 CrGy0+PfYoICbO7lBsY1q6kAKWV6HYUaZI6Pxj9bQK+3VRbuFAmNR6timpbiAbfNAD1h
 RgrdIYtHkCLgg+QKCKOKx3J8mbJQ8vlMXmwgS5nuRcsGKH/WiePo8hsKWsIvPjTXvgG5
 74rE/woUGUEcCuZI9zWfuFtnmKLvL6vpUJWmdAEsEulykLv048QBWoQr4lEKzl+ShQ0H
 hidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kKlkNDy7IkULxlqR/cm5H8XjRPA1VC1UXnLKGJxFlME=;
 b=z64VgDMtHn4DyyoxfVDd/C/Nl3H6/5QTgkzYbrWexPeH5GX88qFSo4WetXOgBG3aI9
 kM1z0SKEfFDvF0BL4iZMFeRWTBidnB20vqNgMcx5u9wxGQgVGLMgbYhZI5E5VjsIwBfQ
 AuLsBdN8hKIJBdq3trmzuDAFaxSX/NnjMPog+2qaZLrDdzRTEIq+na60+HQr8WXsCscP
 XaFBp+PIXT2RJwNUROGgtVpEwoQluJc2pFUKXJDjif8sTyz+aS1KFyiEak+qDKVIhArZ
 q1m1ye1wuloNuGcDGPeuhiOD07qm18lBpN9TU6totevo9A9Dd8RMiSqQMYWv8KS8KsiO
 BdTw==
X-Gm-Message-State: AJIora9wwj0nbF07OuebKMZpczdyQjahqhh/P44cXD1ce0+1gPePuZK2
 u3PxODd3Y6OKEk4cOXfkZTLYfQ==
X-Google-Smtp-Source: AGRyM1tCkKIh7mn6CioEd8be2QKiJ6B5weamVHcEf6LV7UC4qd+9bgwV6JWvuVCeXL6DaArFJ0VqEA==
X-Received: by 2002:a05:6512:b84:b0:48a:7d72:407c with SMTP id
 b4-20020a0565120b8400b0048a7d72407cmr183405lfv.537.1658510238975; 
 Fri, 22 Jul 2022 10:17:18 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net.
 [81.167.86.93]) by smtp.gmail.com with ESMTPSA id
 e6-20020a05651236c600b0048a72437127sm962811lfs.42.2022.07.22.10.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 10:17:18 -0700 (PDT)
Message-ID: <3c3bccc2-786f-45f2-fe30-3e0c9f95da63@linaro.org>
Date: Fri, 22 Jul 2022 19:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-5-arnd@kernel.org>
 <e83c98f9-f32a-6bfd-71b6-9aba22aa7abb@linaro.org>
 <CAK8P3a0yc_iZ1dqbReckvune6KszCPvysCX9okYoaU-by+YRhQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAK8P3a0yc_iZ1dqbReckvune6KszCPvysCX9okYoaU-by+YRhQ@mail.gmail.com>
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

On 21/07/2022 22:43, Arnd Bergmann wrote:

> I'd rather keep them together: while removing the DEBUG_INFO is
> now a NOP, keeping the two changes together explains much better
> why this is done and is atomically needed based on the single patch
> that caused the change.
> 
> It's the same with the LEDS patch that replaces the CONFIG_LEDS
> option with CONFIG_NEW_LEDS.

OK,

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
