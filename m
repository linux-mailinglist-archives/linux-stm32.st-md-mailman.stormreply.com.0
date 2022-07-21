Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E58257CFA5
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 17:39:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA128C640F0;
	Thu, 21 Jul 2022 15:39:35 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B798C640ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 15:39:35 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id o12so2295838ljc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oqVQwNQbcwLQWg6kfm6rj9WKvgY4OIEgQOzUXlpBlmg=;
 b=bUbA0eHhlHZLz/7ERfxE+ujHsrXIi/1BLF0UUgCTGD2Op4a9uPqxE8PfjDUnh0vkrM
 NoiNYlMDhoMOEIMth1a4LodxokvPtNEiBNqvhrTtMsiqk5AvOOTWVvtkX0vcdar+TZ9P
 cuHmDRDRj/iCTgpFnlWFwejofmUcNLUdW+0FeB/h2HYA1p1jGTJseRZ/c1Dk0fKehi12
 XzY95w37ZgrMXEVRmU96gkg5e/DspC1gFPZ/ekbdgflGdDWjEXquopvsQwGp1I4qEgn7
 d7QKdgpNbpN8vahcEQWCFuFNkozJDOmGqU5v/udTFpQ1oOJ+f117PzP28vOHlt71WwUc
 35AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oqVQwNQbcwLQWg6kfm6rj9WKvgY4OIEgQOzUXlpBlmg=;
 b=PqtuzkaPCU7nN0i4zyRd+451ih+QY0p11e+0xXBMEi0LHND6r4JBE3SRZ3DwMUAImK
 tZMQNfX46im+bHDe5e63WCIocmEScQAFiwjogr3qrIm0EJn8RcynxMRNViW0Nn6Iwz4s
 9NhQsMnKaiD6GPFqs1DsJumQYqP5cA5c94v+1PP4dpgB9QOk6ZUOfNMuW7CvQG1rKv1B
 6ysXH4l5qJN0EnA6CDPo0ZY9dVci7VJGYG/cBqD5XtYVlwWOXVhhvUr4ft0sIhMa+vQ+
 6uY2+5H6rrz/bH/jnc1A0R0oJEG9JDwuMzLfs5geiqQlnsxnIWEPzTvfrO9t5twWQ9G7
 G34w==
X-Gm-Message-State: AJIora9E+AUQ4oVUJkMLn5tAvuZ9lPBmBXRuuYM3m4DzGNQuKbMsUPlo
 /L9+OceuZw55awu+YvWzKnsPaA==
X-Google-Smtp-Source: AGRyM1u1EiuENGOYTFtFOFvt+gosoK/tppAX7Zpo5TZqB7ckZKOx3LwixuugOACtM48KFq3goni/DQ==
X-Received: by 2002:a2e:953:0:b0:25d:5c20:2265 with SMTP id
 80-20020a2e0953000000b0025d5c202265mr18734344ljj.348.1658417974213; 
 Thu, 21 Jul 2022 08:39:34 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no.
 [89.162.31.138]) by smtp.gmail.com with ESMTPSA id
 o23-20020a05651205d700b0048a35b93b24sm504903lfo.181.2022.07.21.08.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 08:39:33 -0700 (PDT)
Message-ID: <e3b0a57b-e987-9be0-75e5-40c0d7e41310@linaro.org>
Date: Thu, 21 Jul 2022 17:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-4-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141325.2413920-4-arnd@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH 3/6] ARM: defconfig: remove stale
	CONFIG_ZBOOT_ROM entries
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
> The default is always 0x0 after commit 39c3e304567a ("ARM: 8984/1:
> Kconfig: set default ZBOOT_ROM_TEXT/BSS value to 0x0"), so any
> defconfig file that has these two lines can now drop them to reduce
> the diff against the 'make savedefconfig' version.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
