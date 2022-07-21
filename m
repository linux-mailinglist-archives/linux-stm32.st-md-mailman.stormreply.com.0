Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B1157CF82
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 17:38:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82A5DC640F0;
	Thu, 21 Jul 2022 15:38:25 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E013C640ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 15:38:24 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id t1so3377330lft.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 08:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UqCa+wJI049j4zTLACQna4vEDfj2rqaLjlldqQdrtbc=;
 b=Hr4EUI+tJ5IR28Fd9rlLrL2Jhdl6y04tFTZ7SiEj8y1JW0oLBxnYtIiAxp4fV/1ml3
 XNc2IHUMggG0rlz1xVNCcB8Ij7GdlfZJng1lvQzRta+lFGgEuqvRcPk1VAyXG6/rz6L3
 24N7v/a2z6VqnTCmtZRoxq9+R94zChXy64OuJ+ofzweytxFPcsC18NRkN0F/inqmx65G
 8EtBrYyOKrnRMNd1zVShLukQdFrlhcWvnBxH1Skm/pMFhtK5dIa0hnnAVck4MmS80fWc
 O4GIa+aNN+YT4KPfVRPywl0b25PpIhaAQOpzc4dspd4HUkTiGvC7Qox4l+D4eMYzliSj
 M93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UqCa+wJI049j4zTLACQna4vEDfj2rqaLjlldqQdrtbc=;
 b=cYiSysBFek0o6zXPvu3r3yZuXPqScP2sq98O1RTS4DImfMeLrn6cnC0HrKCXtxKMwz
 77JVVk1Yln4sd70Ozpd7CIY2mo5qVJPCRqyUw1vfWgArr0BJbo4JSX8hZaihRAIyqA/4
 MXxAN4CZ8SfUg0OEmQXPE9ajIGovjsjQVE6kyANZ7vCJGe+qh5Zp9e/GmXDJlnIOX6Mv
 Y7l/vy2TWcZLcxozuuLX7J9foePwC1lESaNVFivDUcfJwulsoLQTz6d2od0EnGfgT/LC
 lbjYb2YhrmoePwuqb+oiXNgE6WWxSa3Vb4/zk0IjdkfSsxXctoRqW3dREh+8sxrP4ege
 mDpQ==
X-Gm-Message-State: AJIora/LLaid+MjddgoT4ffpDIfybp37BTREcjv6mKn5A1BuHYHg5BWm
 ld2W8tXordMUqrCPRCQqJl05Iw==
X-Google-Smtp-Source: AGRyM1u+XAg5Gfu+MlpMWaQN3hIuyfigsjR8EO3U+oTkp4M+3abIhECXSY47lzIOdxD8vuPZLJkGzA==
X-Received: by 2002:a05:6512:108d:b0:489:e640:df8c with SMTP id
 j13-20020a056512108d00b00489e640df8cmr22708209lfg.332.1658417903698; 
 Thu, 21 Jul 2022 08:38:23 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no.
 [89.162.31.138]) by smtp.gmail.com with ESMTPSA id
 8-20020a05651c12c800b0025de7126bf1sm448863lje.89.2022.07.21.08.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 08:38:23 -0700 (PDT)
Message-ID: <6468e7b1-b253-53bc-c81f-2fa6b75194ae@linaro.org>
Date: Thu, 21 Jul 2022 17:38:20 +0200
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

Samsung bits (s3c, s5p, exynos, mini2440, tct_hammer) look good:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> # Samsung

(I did not review the rest, though)

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
