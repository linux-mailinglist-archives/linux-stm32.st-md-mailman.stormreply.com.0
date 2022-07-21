Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D6757D037
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 17:48:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E855C03FD6;
	Thu, 21 Jul 2022 15:48:54 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8598CC03FD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 15:48:53 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id t1so3421819lft.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kerRz12dqSLTCb/G6XJ/ci3/MyFW1quIGYpIj1cwXFk=;
 b=wDBqXadlpWBGbF94NOPOQ/Bfz5t/ZzsogIdYsJ1FdmokyRJmcyUMiMTd/qQUi6HCUj
 LS0/+TXFRrPn84en4MNolQ8SP1DWf+5SJQYpjQaftlkjzqU6KXT1VhiQsgQ1bXdBNhZG
 eXktSmRf7qsD14iTTYy25QK92o/dANesEtVQEEeCtwJc+UL4SrCbFObe2KkOy/JAxtcJ
 p9LwNunwXGsbah8IiBadWtnhp8g01iGAjwpJd9bv6AoYQUj30+W1lS34LNqLGJh/j9pk
 Ois97SWLnSs16i/ic/ZolC/KRcIelYw3hGeR0w6KMILBL1/VUzcLTu7iMWKyRGa9loUq
 bJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kerRz12dqSLTCb/G6XJ/ci3/MyFW1quIGYpIj1cwXFk=;
 b=XO1IOQ2hbmrf4qWgeXFAIynUjjrwrM83QjaGAr6gtNKsl/A9D1HeCmnwD5pYRBtyHp
 Q033C97tzpN/9h05NJRs3c9eejc00Q1Xp+8+uyIANWZsERTK9iAl8DhtSeAUZuFKiYpQ
 rrhZLiNhd6bHr+P6LmlHyLBnhgVOY8RuTW+Q5yLrR/W0ej4Mo0oHxy1BgqlkYiVkTuXv
 Gme10KCHcUQ165IcYDrlf7zZdjuf6ZkFZ/2fWAP5Y82ABKews+r45Uvpj71dWnSSZvTk
 UPKYZUMj8RSVi0p79r42p5yl2anV0QlGPwgvJpfQdd22hMmGwNI3CvMIXsJatJDyC+RO
 jgdg==
X-Gm-Message-State: AJIora9xqQxtiHxhvn0cE84VdGKfXXeACxJe2Oc0cOcxQGnvGjoYo+8Q
 pZrIKxIltZlfTfTyCuLKOitL4g==
X-Google-Smtp-Source: AGRyM1vYOoQf3HxOuIleon6snvJrA0y5Q04RuYZBpQSTB4+Hi2vONRjhGK/EYdcj5WmLKjOJUoS6nA==
X-Received: by 2002:a19:e006:0:b0:48a:7322:4890 with SMTP id
 x6-20020a19e006000000b0048a73224890mr820171lfg.179.1658418532839; 
 Thu, 21 Jul 2022 08:48:52 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no.
 [89.162.31.138]) by smtp.gmail.com with ESMTPSA id
 t8-20020a192d48000000b0047f8132d10bsm504347lft.281.2022.07.21.08.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 08:48:52 -0700 (PDT)
Message-ID: <9b76623e-af4e-a562-83a3-38350c8ce3c8@linaro.org>
Date: Thu, 21 Jul 2022 17:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-2-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141325.2413920-2-arnd@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Alexander Shiyan <shc_work@mail.ru>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Will Deacon <will@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-sh@vger.kernel.org,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 linux-sunxi@lists.linux.dev,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 1/6] ARM: refresh defconfig files
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

On 21/07/2022 16:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A lot of Kconfig options have changed over the years, and we tend
> to not do a blind 'make defconfig' to refresh the files, to ensure
> we catch options that should not have gone away.
> 
> I used some a bit of scripting to only rework the bits where an
> option moved around in any of the defconfig files, without also
> dropping any of the other lines, to make it clearer which options
> we no longer have.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/configs/am200epdkit_defconfig    |  26 ++---
>  arch/arm/configs/aspeed_g4_defconfig      |  16 +--
>  arch/arm/configs/aspeed_g5_defconfig      |  16 +--
>  arch/arm/configs/assabet_defconfig        |   8 +-
>  arch/arm/configs/at91_dt_defconfig        |  10 +-
>  arch/arm/configs/axm55xx_defconfig        |  22 ++--
>  arch/arm/configs/badge4_defconfig         |   8 +-
>  arch/arm/configs/bcm2835_defconfig        |  36 +++----
>  arch/arm/configs/cerfcube_defconfig       |  16 +--
>  arch/arm/configs/clps711x_defconfig       |   2 +-
>  arch/arm/configs/cm_x300_defconfig        |  26 ++---
>  arch/arm/configs/cns3420vb_defconfig      |  18 ++--
>  arch/arm/configs/colibri_pxa270_defconfig |  32 +++---
>  arch/arm/configs/colibri_pxa300_defconfig |  10 +-
>  arch/arm/configs/collie_defconfig         |  20 ++--
>  arch/arm/configs/corgi_defconfig          |  44 ++++----
>  arch/arm/configs/davinci_all_defconfig    |  26 ++---
>  arch/arm/configs/dove_defconfig           |  28 ++---
>  arch/arm/configs/ep93xx_defconfig         |  16 +--
>  arch/arm/configs/eseries_pxa_defconfig    |  26 ++---
>  arch/arm/configs/exynos_defconfig         |  20 ++--
>  arch/arm/configs/ezx_defconfig            |  72 ++++++-------
>  arch/arm/configs/footbridge_defconfig     |  14 +--
>  arch/arm/configs/h3600_defconfig          |  10 +-
>  arch/arm/configs/h5000_defconfig          |  18 ++--
>  arch/arm/configs/hackkit_defconfig        |   4 +-
>  arch/arm/configs/hisi_defconfig           |  24 ++---
>  arch/arm/configs/imx_v4_v5_defconfig      |   8 +-
>  arch/arm/configs/imx_v6_v7_defconfig      |   8 +-
>  arch/arm/configs/integrator_defconfig     |   2 +-
>  arch/arm/configs/iop32x_defconfig         |  20 ++--
>  arch/arm/configs/jornada720_defconfig     |  10 +-
>  arch/arm/configs/keystone_defconfig       |  62 +++++------
>  arch/arm/configs/lart_defconfig           |   6 +-
>  arch/arm/configs/lpc18xx_defconfig        |  12 +--
>  arch/arm/configs/lpc32xx_defconfig        |   8 +-
>  arch/arm/configs/lpd270_defconfig         |   6 +-
>  arch/arm/configs/lubbock_defconfig        |  10 +-
>  arch/arm/configs/magician_defconfig       |  30 +++---
>  arch/arm/configs/mainstone_defconfig      |   4 +-
>  arch/arm/configs/milbeaut_m10v_defconfig  |   6 +-
>  arch/arm/configs/mini2440_defconfig       |   6 +-
>  arch/arm/configs/mmp2_defconfig           |  28 ++---
>  arch/arm/configs/moxart_defconfig         |  18 ++--
>  arch/arm/configs/mps2_defconfig           |  14 +--
>  arch/arm/configs/multi_v4t_defconfig      |   4 +-
>  arch/arm/configs/multi_v5_defconfig       |  12 +--
>  arch/arm/configs/multi_v7_defconfig       |  62 +++++------
>  arch/arm/configs/mv78xx0_defconfig        |  32 +++---
>  arch/arm/configs/mvebu_v5_defconfig       |  28 ++---
>  arch/arm/configs/mvebu_v7_defconfig       |   2 +-
>  arch/arm/configs/mxs_defconfig            |   4 +-
>  arch/arm/configs/neponset_defconfig       |  24 ++---
>  arch/arm/configs/netwinder_defconfig      |  10 +-
>  arch/arm/configs/nhk8815_defconfig        |   6 +-
>  arch/arm/configs/omap1_defconfig          |  74 ++++++-------
>  arch/arm/configs/omap2plus_defconfig      |  16 +--
>  arch/arm/configs/orion5x_defconfig        |  32 +++---
>  arch/arm/configs/oxnas_v6_defconfig       |  14 +--
>  arch/arm/configs/palmz72_defconfig        |  14 +--
>  arch/arm/configs/pcm027_defconfig         |  22 ++--
>  arch/arm/configs/pleb_defconfig           |   6 +-
>  arch/arm/configs/pxa168_defconfig         |  18 ++--
>  arch/arm/configs/pxa255-idp_defconfig     |  10 +-
>  arch/arm/configs/pxa3xx_defconfig         |  18 ++--
>  arch/arm/configs/pxa910_defconfig         |  22 ++--
>  arch/arm/configs/pxa_defconfig            | 126 +++++++++++-----------
>  arch/arm/configs/qcom_defconfig           |  60 +++++------

qcom I already did here:
https://lore.kernel.org/all/20220623110535.177326-2-krzysztof.kozlowski@linaro.org/

but it seems it was missed in MAINTAINERS pattern and never made to
Bjorn/Patchwork.

Would be nice if it got picked up, but it seems a bit smaller than yours
diff (56 vs 60).

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
