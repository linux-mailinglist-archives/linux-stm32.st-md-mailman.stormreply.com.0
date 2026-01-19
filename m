Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 071D7D3A8FA
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 13:35:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2AD6C8F28C;
	Mon, 19 Jan 2026 12:35:26 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B08CC8F27C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 12:35:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so2807774f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768826124; x=1769430924;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z3eT6Bg7ZWijWJ4NFvVulXfOaaoq9EAaYQC3GNm1H3Q=;
 b=WsTMAGZIKG+lfhLM36SG0lYPFE5a6bpcNa0LjF45JOBgabXXS2Q7tbKDIx7QLa/p23
 J5I7ALxM6XS07tP6sn1385YdAAf3Gu9mHGDJDRvau/kDQ54dHl+7lzuY9gEIGOQ1K5H2
 Ui/kPifcQ80XeE+pk0mtgJWSOQS9EtIknd45Qj3VWORPe0RgPsBBJIeKlI1CCi2o4vJ1
 En2v23tovOG9XLcp0CywA5ZcNjBS9sGhGEWQRLqaEd9URI7O6K/lpbeJiWKe1EbIgSG+
 uWd0xNWfer6fzQdCWDANLsHt9mtC6h5LvD+GGzYzdNoqKd4h8vIM0K34/t5NOwAK9XK/
 s0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768826124; x=1769430924;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z3eT6Bg7ZWijWJ4NFvVulXfOaaoq9EAaYQC3GNm1H3Q=;
 b=bHiETNRSwfVNVHj6+3V3C9tV2GrpLkesb3I8p2SMSVULer59Y0k4+zoHY6qgux9/6I
 5kqQDJtZNdYnTGcGFkIJrMS9c/PqLfsAfaSA1M0zbZm9vtsitHq/gWwNL7KjqipbTlot
 lXSQSU/C50NBQQh5qLSmFScpBG+EJAV7vCwsPItfvfj0kgW0UxHvKzR4cu30ihacVcHp
 XYmXXWLjN5zm/MZNuzwb9EvdV0YkK4KtuthYEG851RKlFjYXn4Nm2/WkeH2DTc0BSVE3
 qezGlJ6G/3WyWjsn5JZBfl850RUONgz184CCNFJg3DtOuQuwCI61bbSWGA7dVZPndTW0
 EGeA==
X-Gm-Message-State: AOJu0Yz9P1Zts+zS4ilzZq7uNTUalAMkiauDS4x+jUqlgap0xprSWpfD
 AyOglatv7OgP+YQ6AafvbRi7QTpFDowSdF5wbH0YjWy00riADACICmvATBgWPzWaS2U=
X-Gm-Gg: AZuq6aI9RJAXMwUm9iFozzrmLEb+5LE16POITkIRvaxOBrfXo6XWuFlq+sWfxA600mf
 g0laOrGYrmeb0GF5fmZKLk7OzX0oikSJcG0LWQnprrN3la5KuREoPuF/CzWTF6vhbeI+ImNLU6A
 6XWT5TGa8aoE6aPMxU5OQtgg7rQQKBskiZY7kTVt+JKiw0T8zIfv0Imi4w9ZDJg0X2AT5r5ZmTG
 8Go1pW8RGxYmJanfsdGZ+LezopRwUQzKX0trv1yoF+65XScyicbCM3HbQMPbLhO/XJEvI/mbfLU
 rh2viEZZShs6JnEkLbvqzgGRPT/IVBIDrQeT5tuy5Ss2VDpsshgN61vHmZy+l2nlpM1G2E2tqWx
 2NuceK5yFI/1IFDtB5Tkw4BiBUbxO0HWMqqkWNt0f42aDFlQwDs8KNGSCqGkOXQETBbNwusEmIH
 kXHT6cdHrxFZL4SXJd
X-Received: by 2002:a05:6000:144b:b0:430:f5dc:d34a with SMTP id
 ffacd0b85a97d-43569bbb0acmr15961638f8f.29.1768826124241; 
 Mon, 19 Jan 2026 04:35:24 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cefdsm22268489f8f.24.2026.01.19.04.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 04:35:23 -0800 (PST)
Message-ID: <8d48dd55-d78d-4cbf-88b0-5427a731ba7d@linaro.org>
Date: Mon, 19 Jan 2026 12:35:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stm class: Fix Kconfig symbols
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



On 17/12/2025 9:39 am, Leo Yan via CoreSight wrote:
> Kconfig symbols must not include the CONFIG_ prefix.  Remove the CONFIG_
> prefix for default values to work.
> 
> Fixes: a02509f301c6 ("stm class: Factor out default framing protocol")
> Fixes: d69d5e83110f ("stm class: Add MIPI SyS-T protocol support")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/stm/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
> index eda6b11d40a1f9ab49a1ec1e6faae8ee178c5ed3..cd7f0b0f3fbebc74775d8835187e49e5bd21d646 100644
> --- a/drivers/hwtracing/stm/Kconfig
> +++ b/drivers/hwtracing/stm/Kconfig
> @@ -13,7 +13,7 @@ if STM
>   
>   config STM_PROTO_BASIC
>   	tristate "Basic STM framing protocol driver"
> -	default CONFIG_STM
> +	default STM
>   	help
>   	  This is a simple framing protocol for sending data over STM
>   	  devices. This was the protocol that the STM framework used
> @@ -28,7 +28,7 @@ config STM_PROTO_BASIC
>   
>   config STM_PROTO_SYS_T
>   	tristate "MIPI SyS-T STM framing protocol driver"
> -	default CONFIG_STM
> +	default STM

The help below here says "If you don't know what this is, say N." which 
makes me wonder if this should be on by default or not?

Also everything is in an "if STM" block, so "default STM" is a bit 
redundant. It's not that obvious what the intention was.

James

>   	help
>   	  This is an implementation of MIPI SyS-T protocol to be used
>   	  over the STP transport. In addition to the data payload, it
> 
> ---
> base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
> change-id: 20251216-fix_stm_kconfig-a72f40c7612c
> 
> Best regards,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
