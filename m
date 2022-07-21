Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA3957CFF6
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 17:42:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA019C640F0;
	Thu, 21 Jul 2022 15:42:12 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF5E4C640ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 15:42:11 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id o7so3388787lfq.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 08:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DbAlny0t1Z1mEp76q3Ok9AdQU6F9gRBoHTbQLXF/2lk=;
 b=hvMY/wKgqNkLwMGAA1veSwXkHAGy+A6V3WOkfUKYAdhYB8ptxzUPD7n35rsO9Jcvr7
 6UDVHo0V37fnqX2S0c15nIq3n4z6ArkAWtF+lGEg9BC5qQf+mEDT2UuywuO/+AFrwg6P
 jFuYVRrXQ21UhwdbV388q5sUMCQU465XKUyiSp0BPn/vBPSJN9lK2KzWUZE7tRuBCkcF
 ewxg0NMWAaa3d+T2QRhzgxExRIc5ACCOcQ3/ppkPQ5wo0swP5SjDLy8L+XwpArxrJ0Q/
 eeAmdqXFlUazj++UKjdRTrln8X4SOrsW3BodSCOU0+mbJsZrrBRXQKEnIdrhHN8un0RW
 grAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DbAlny0t1Z1mEp76q3Ok9AdQU6F9gRBoHTbQLXF/2lk=;
 b=wa/O/IrHYJLd4FX9JMjni5iODjBPCT4EmLAqCMCFodN/dzb8fWIJg3XzPfCtNsAOQS
 Vvq4RGVk1VZ4fmPGlZ2S4nBftCOuw8HRBs9Bm1q0hFDqXVKal2l7EbA0MUo6fMgbLqZs
 57iOt/S20PqzPzsRZN9HaL7VS78qCa588Sn9QAheXmfNdvglG6QCm9UT/vSUE6VS+Pma
 /9QLZgr50uaXrSOeeO+PIZ801Qp++OX6uaDDSiEinhRjc0ZymubcmKQAJnsTkwdv3eUb
 RYI0tHnL9umfNZHV4QNOOZk1i0bHFoyeB7TJKTfvCvZ8hANx4f/W7yO+eyagQ7kKAR3O
 fUXg==
X-Gm-Message-State: AJIora+u1ZxvwbA61xuwpQO60a8l1aJ72peU6CRjZnhAFipKuij9qR5O
 GbNNHaGoGpGRCUGihnj0RpDcZg==
X-Google-Smtp-Source: AGRyM1uH+KevGsKWyG8Df61xvPgqfo29eVC+LR/aED9QzOXzzbztIiUFTSzFYEZjDIchb6h/N4lCSg==
X-Received: by 2002:a05:6512:3409:b0:489:c549:4693 with SMTP id
 i9-20020a056512340900b00489c5494693mr21503245lfr.26.1658418131160; 
 Thu, 21 Jul 2022 08:42:11 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no.
 [89.162.31.138]) by smtp.gmail.com with ESMTPSA id
 s4-20020a056512314400b00488333b6515sm499662lfi.305.2022.07.21.08.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 08:42:10 -0700 (PDT)
Message-ID: <e83c98f9-f32a-6bfd-71b6-9aba22aa7abb@linaro.org>
Date: Thu, 21 Jul 2022 17:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-5-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141325.2413920-5-arnd@kernel.org>
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

On 21/07/2022 16:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> CONFIG_DEBUG_INFO is now implicitly selected if one picks one of the
> explicit options that could be DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT,
> DEBUG_INFO_DWARF4, DEBUG_INFO_DWARF5.
> 
> This was actually not what I had in mind when I suggested making
> it a 'choice' statement, but it's too late to change again now,
> and the Kconfig logic is more sensible in the new form.
> 
> Change any defconfig file that had CONFIG_DEBUG_INFO enabled
> but did not pick DWARF4 or DWARF5 explicitly to now pick the toolchain
> default.

I think this should be split - into remove DEBUG_INFO (noop) and into
selecting CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT (a fix).

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
