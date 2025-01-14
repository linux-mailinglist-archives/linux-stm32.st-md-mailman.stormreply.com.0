Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D614A11A11
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 07:49:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67AB8C78F8B;
	Wed, 15 Jan 2025 06:49:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9643C78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 23:19:16 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-216281bc30fso129457425ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 15:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736896755; x=1737501555;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f5eTKAbfNWbx/YU36/7otlGNMn3vJ1aSKnUDn2lnA00=;
 b=GtLOH8qASAmO6E+6tGkxwLaEjidwSUSehvvt47Gwa49D4qfaSFK9QDBqkz44Gn/n+P
 GFkTqT26fTtV6vQoUIEbsPRlas4KSiJ4bsV4shJuVpJezuF+Xk+nAjcmRntjulgE3Dep
 r5eUDJ/5NhDAGSJNDj6ZRtHto/Wcqir3OyM+qY6YMmosyeqH2L5u6KLa/MyGp3/Mdcme
 1caXTAGW576q1eDYlalxtvRr0crEPhLU8RgLHAOBvCZY/zQwXM+FBtCdv5R9pdPUnHfy
 I30ImdEcTPAEtZe+Jwf9Xd09oBvbT8gxUPijJt8IFQUQjO3wQiA3E7uk9p3SmUN368nk
 ySvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736896755; x=1737501555;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f5eTKAbfNWbx/YU36/7otlGNMn3vJ1aSKnUDn2lnA00=;
 b=l1LL87wCPi0krNFCa0Pt/pkDMOCPiF8GOTqGCLt8VnJQchkcBs/wx0nmoF+VHWOLtt
 9rnRkne6g9E+ykjI53Yb8DZP0rkS/XzheWorJX45ELHa0VNlcEFZxCthct7VrResBb6O
 SyiMAzXKCyNsDmXL43/4Sjl0Pi+FInY2fPgzW82FE+3e9RgoezDJpgNIdqlY5PEo74GI
 vB7cZRb3evjmagrN/lF7R2M7e/431SMwe21/Eiw/UN6gaSyhqb7zUWM8aVDrNGuULO//
 xSq3XcpW+syp6n1GNBeJsrbJoUXkhozxQad3vSI8/r98Fvq9K2jFAMsdqFS6jwlPRmBS
 gW+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHlrUsUqRttt3yK8enm58JV6DxiAJIgtxJEKlHWgxTo1QC76CfQf3LeIQXRzgYn012KZnMQW+7xTFFzg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzgq+zYTCpEZfGRY9A6Zyf7lCNocqHs0DWRcVPka9XqwhdA/ghP
 WLxdvydULyNHXCKNQi5Bm8WxDHEyliSEdRZpHz1OuOxOa9CRPByf
X-Gm-Gg: ASbGncvg95SrOr0VPvIRC5JTEO5MU68BPxpXBzBmOi9/YWfqujol8GBH2ngqs6pLs84
 H+8PORjUjIDo7DoplcCMDmxSn8beGzUOxPT9oO63ISxdg8G/ROKdJr+jyecXjmHPTfsnrYkkQtc
 1opj785iuUp7KR8O3veG4g6i8o8pcd9vkjuBcZYcwekOtmIgsKsqW7uVBHm/iSl02QKRcVAD8xw
 X+Tco/X4nRAXJP+ZWc8uMCflOmGX8oRId+UB8RbR02IPreV+B0u6ty+Vyv9Xy/ADgg6
X-Google-Smtp-Source: AGHT+IHvhFzdOuZJhvs41X/8XrZF9xVo0QVuW5f8A1eRLQV4vZJgXFT2cldJ2dy/GO1Wh/lGLTu/Og==
X-Received: by 2002:a17:902:f68b:b0:216:32c4:f807 with SMTP id
 d9443c01a7336-21a83fdea82mr421041255ad.45.1736896755413; 
 Tue, 14 Jan 2025 15:19:15 -0800 (PST)
Received: from [10.69.47.104] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f256b4csm71720915ad.215.2025.01.14.15.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 15:19:15 -0800 (PST)
Message-ID: <c48d6cda-8508-46f9-92b9-6621b335b565@gmail.com>
Date: Tue, 14 Jan 2025 15:19:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Nandor Han <nandor.han@ge.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
References: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Wed, 15 Jan 2025 06:49:15 +0000
Subject: Re: [Linux-stm32] [PATCH v2] gpio: Use str_enable_disable-like
	helpers
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 1/14/2025 11:14 AM, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>     operator has three arguments and with wrapping might lead to quite
>     long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>     file.
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v2:
> 1. Many more files changed.
> ---
>   drivers/gpio/gpio-brcmstb.c     | 3 ++-
>   drivers/gpio/gpio-crystalcove.c | 3 ++-
>   drivers/gpio/gpio-grgpio.c      | 3 ++-
>   drivers/gpio/gpio-mvebu.c       | 7 ++++---
>   drivers/gpio/gpio-nomadik.c     | 3 ++-
>   drivers/gpio/gpio-stmpe.c       | 6 +++---
>   drivers/gpio/gpio-wcove.c       | 3 ++-
>   drivers/gpio/gpio-wm831x.c      | 3 ++-
>   drivers/gpio/gpio-xra1403.c     | 3 ++-
>   drivers/gpio/gpiolib.c          | 3 ++-
>   10 files changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index 491b529d25f8..ca3472977431 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -9,6 +9,7 @@
>   #include <linux/irqchip/chained_irq.h>
>   #include <linux/interrupt.h>
>   #include <linux/platform_device.h>
> +#include <linux/string_choices.h>
>   
>   enum gio_reg_index {
>   	GIO_REG_ODEN = 0,
> @@ -224,7 +225,7 @@ static int brcmstb_gpio_priv_set_wake(struct brcmstb_gpio_priv *priv,
>   		ret = disable_irq_wake(priv->parent_wake_irq);
>   	if (ret)
>   		dev_err(&priv->pdev->dev, "failed to %s wake-up interrupt\n",
> -				enable ? "enable" : "disable");
> +			str_enable_disable(enable));
>   	return ret;
>   }
>   
For gpio-brcmstb:
Acked-by: Doug Berger <opendmb@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
