Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EBA57CF48
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 17:36:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 586CDC640F0;
	Thu, 21 Jul 2022 15:36:22 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89DD4C640ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 15:36:21 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id bf9so3338283lfb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hfKsdhQQt9tQ595I9ds8b/DPqZVDcCzjVcrK9iWT3ts=;
 b=GCw16KpafXB+y2e+gFPayJKLMhyZMkVvIg00xSfR0J6zmap4XUiw74QYrBPZojxqnG
 nlMigEvmPTJqX2BUwSdZ4mJxx8kFZTXQJaOIndmhXWmnsZmilUJXncDHi2uKE8pGuWVL
 znA3Smzdfbdkc8qVWjZ7RHlZu4leucipgnhrY3cduU0fYTHFS3staPx9+XFkY/ZjtM2h
 117KpUbzALp8IYmM0wdGGHbqPzb9abAasZ2Y4vFeXAUqeWHw9qTJ0dR/mA5YE4OC5PTw
 ZVK2616IlVs5qLNNTIINaLS39Wgp/5PWsi2sSjQEOqP4IsbdopLcNcEJfX1/nxCnsqxR
 Lwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hfKsdhQQt9tQ595I9ds8b/DPqZVDcCzjVcrK9iWT3ts=;
 b=BPgBrUP83Qdc3B7Vc/cdt4OcZwXPnPW4CTN+O5RYFrXDiB5MdHVvwXcAmzuaOvUkMT
 YVSOufQWGbgsUu7ok8Jt/zcqnyOAFzTn+kW0vdNluIZ78lP/79u0JHzrn8ou58pFuTJY
 4fsB02IzpsVEFoC3kQnx4x20xN/Dy6meagJlXXqnRIu5Y1RmOPLDme1UGwbr0rXd+w12
 dl40AAMpG0ElFC1VcAVPywFf9eXYlifFtkehzJ1t2/YIgG4OY4v6SUJypYjX23sIzxLr
 HNNZTnyXhJxb8WAEmAUQWA6/EQE/EhHhfLWh80AcFl+BpCXMktox2oua+5nnyCcDhSuT
 1tfA==
X-Gm-Message-State: AJIora+UsZ3+6YH5teY75BouZys/Zm07IedbdwmSqp0RGiGVcfCMHNiy
 k/wdSlcMmYAVingpI03R9z/9TQ==
X-Google-Smtp-Source: AGRyM1uYyhdhJ+K6lLI/9qjAZeU/e9ueK5AuTfFuX6OK/DbxDxlvM3z4hS4HgQhwQusCJCfVoUBo3A==
X-Received: by 2002:a05:6512:1506:b0:47f:79c6:eb36 with SMTP id
 bq6-20020a056512150600b0047f79c6eb36mr24308198lfb.168.1658417780731; 
 Thu, 21 Jul 2022 08:36:20 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no.
 [89.162.31.138]) by smtp.gmail.com with ESMTPSA id
 w17-20020a05651234d100b00478f1e04655sm511718lfr.14.2022.07.21.08.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 08:36:20 -0700 (PDT)
Message-ID: <9e872a00-966a-aaf8-7bb9-6627fcb0cf83@linaro.org>
Date: Thu, 21 Jul 2022 17:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Scott Branden <scott.branden@broadcom.com>,
 Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-2-arnd@kernel.org>
 <9321ce6c-7565-a7eb-2bfe-dac144ab7733@broadcom.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9321ce6c-7565-a7eb-2bfe-dac144ab7733@broadcom.com>
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

On 21/07/2022 17:33, Scott Branden wrote:
> Hi Arnd,
> 
> On 2022-07-21 07:13, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> A lot of Kconfig options have changed over the years, and we tend
>> to not do a blind 'make defconfig' to refresh the files, to ensure
>> we catch options that should not have gone away.
>>
>> I used some a bit of scripting to only rework the bits where an
>> option moved around in any of the defconfig files, without also
>> dropping any of the other lines, to make it clearer which options
>> we no longer have.
> Resync is fine.  But, it would be great if the defconfig files were kept 
> in sync. Almost every kernel version kconfig options change which affect 
> these files. Could we put in place a defconfig refresh per kernel 
> version to keep them all in sync going forward?
>

Not entirely, because some Kconfig changes are causing symbols to
disappear. Also defconfig is expected to include user-visible options,
even if savedefconfig would drop them.

This is why blind savedefconfig is not acceptable.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
