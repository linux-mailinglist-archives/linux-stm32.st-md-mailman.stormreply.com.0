Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D957D00A
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 17:43:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ABB6C640F0;
	Thu, 21 Jul 2022 15:43:25 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 615BDC640ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 15:43:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id bp17so3435640lfb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 08:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tk1DYU/BipOe/ykhrE+uY+ooU5Pb7mB25/yNG8lTcfE=;
 b=wfl3g/vRkmVmlH69jDqxAlRnmvZUFAn0fafUutbXTYDpLsG8Pb+wt+a7RBPTTkIeAv
 RTA1J3Qz8g58ZqKaZFGcfmZoiK5L3wvZnMlJImcTLgNb+ldG2lCPymk8BkG9ehlB0xoG
 6h/kCT9Muj89aPsxnGQE2taw2N9Id53CXH1TBhOx3DaVlqzhvPDKzR4lMgdoo8EdHX9y
 gDiQ7Ozw9bbiMJhjlNnpYcBKWyzHzzfSEgaRaxT3b+Gqd8C2TJ8X8ryAyEr+SXyHNfaX
 YlDbi4hbRJ2ceGpQOt2JP8zBnTDt95lIKLw81bA5NGb3sE9IcntSJch4r301U++1U29V
 fOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tk1DYU/BipOe/ykhrE+uY+ooU5Pb7mB25/yNG8lTcfE=;
 b=gnF8xTORC5pyGf72D9P+RIktMPMM1Plb91DfMKdSNPqxIlsEv7q7GA2G5Xih83fITU
 mu/bwBiEIs3cOaCtaVZSL5YKsu1HtIzFrjqIek0wliPjuUCRXyhwhVz5lceY3uayGKO3
 gF32ywU9uysGx7S0CRjweEDGGyy2EjtEc8XZYLzvlQPz8KlFRxWP7Y59yD1LvzgAu2/v
 CvkrxrYNyXsr8przLsIBHLz4y0KZ4e2pTb6r4srma/SiXijMpfUTXcqREdy+ZZ8B9yw7
 /6Altw/wnIiKdngqOPZo4wuejxtSWlEN1lHVJThFUfUjDl7N0q9bfytQMXkdd+mqtI15
 +r+Q==
X-Gm-Message-State: AJIora8DsZo17Tb58SFEDJZ4/cacdpe2NG6dpQGKfYNH0G6nFsE8kCjx
 1Ll+VxP7mQ/lG9AgZNXmT0U0Ng==
X-Google-Smtp-Source: AGRyM1ucvLSRgQ3vWLF4H0bcarGzsvXB0TIajUEBtz3KiyNKgTBVHkKnKs5eHbjxAH0RAjhN7ZfcTw==
X-Received: by 2002:a19:6510:0:b0:47f:baaf:e3be with SMTP id
 z16-20020a196510000000b0047fbaafe3bemr23855009lfb.139.1658418203026; 
 Thu, 21 Jul 2022 08:43:23 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no.
 [89.162.31.138]) by smtp.gmail.com with ESMTPSA id
 w9-20020ac254a9000000b0047f8d7c08e4sm506524lfk.166.2022.07.21.08.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 08:43:22 -0700 (PDT)
Message-ID: <ba87edff-6e2c-884f-1afb-cf4b721b6893@linaro.org>
Date: Thu, 21 Jul 2022 17:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-6-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141325.2413920-6-arnd@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH 5/6] ARM: defconfig: remove broken
	CONFIG_THUMB disables
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
> Since commit 1515b186c235 ("ARM: make configuration of userspace
> Thumb support an expert option"), CONFIG_THUMB cannot be disabled
> unless one turns on CONFIG_EXPERT first.
> 
> This is probably for the better, so remove the statements that
> turn it off.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
