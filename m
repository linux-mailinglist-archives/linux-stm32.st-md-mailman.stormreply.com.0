Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0C84B046
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 09:47:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C987DC6907A;
	Tue,  6 Feb 2024 08:47:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90D4AC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 08:47:52 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40ef64d8955so5014545e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 00:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707209272; x=1707814072;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Cgswh97JThtSZc+MWkKLL/sOqrjScM78TS+JiOIKCEY=;
 b=Ymbkl+j3+RkvV1RbKt1yA9VT41xxAjLaFQ0t1JsDs3B7x/W9/3StXiZhhWPLhHtZNF
 BvdKs+XF1J9URyL/CyZpaGW6ax9yFHo+2tZFuK7lcfWxXSRpUq5Dw0IRaMo4bttX24iy
 0wk7F8fBu3Xa+JwGxXvV/B/h+VKcj4B4Qafbzasl5RhqCSu2/1QifWaqcLxh2ZZqTUsk
 73g8/h2wkIoPwfft2hZavUnYMdxIxM4NbCGF459h0Sp/Gk38ojpuNr1dLmpmK4KLB4VI
 z6hiJ1f2sqZ1R8N4zoBZEJdq5k5cyQ13Lpzh+tgp0mt7h8lkT/516O+fzk9ojwSfc3+x
 +J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707209272; x=1707814072;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Cgswh97JThtSZc+MWkKLL/sOqrjScM78TS+JiOIKCEY=;
 b=VJnPkeCIISEbBW/DF6fbUSs1Gzn5P+EU/iRtHXtig6hO1Vm1nPEhQslbwkOPBBNRSS
 ZQLz/Al9SkB694f4DDIMGKJdJXcXKLbqSzNVYpPFrClMss42M7nL9NPwBrRthFWNxVbp
 d3mTvUtgEvIKENsUkPKvDMzt9Kr+RUNeZ8qNW1fxWw5zMq2a1yqYFiimbY3n/Fc95+cb
 VaFiQtc52RsOY+BKdZw8y8mgW4v27i9HfNM13d3DiMPwVQIHJgQpp2GeHp8jioABnGGr
 MaadKvONnr6+wUtu+30Rdyfwk2fWCxvQliVYLWmbDTwACKdcLlL4o/PDp5X5b7uOobkR
 dyqg==
X-Gm-Message-State: AOJu0YytojZIPg5N0NtrHSVyfwH1gavNMTfLjtlmCmZ3056uOG/xjn9r
 6ooYavHz3EK1Nyq++GNBdbaC7B9xqfSDddKpvBMPj+SMP9v1wpgDBJUGzq+gJ3Q=
X-Google-Smtp-Source: AGHT+IGhYB7S/j7lcNzeBzGO6RKkAL5j0F4BGe7lMnfxVZSyyt0yaNgwR3CzP3SL1KkRGHmCS6IleQ==
X-Received: by 2002:a05:600c:5204:b0:40f:bdf3:3426 with SMTP id
 fb4-20020a05600c520400b0040fbdf33426mr2050471wmb.31.1707209271941; 
 Tue, 06 Feb 2024 00:47:51 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX161gOqgvdRv10X26uunEqBIdx6lmer6jebnO8ie7WB84hoaVNdkmlbFSJ5LjujcMzuSzR/xphCn25giI+Q9UXCOpzU0SYElVmWIQHgdF1py1U6L8WklwZZ3QCMEX5nHAOzbJ9xizUKNmRG7qouRrbJUW2H0ChFld4lhcQ1KE9rJ+70wxfDZBjS2Kc0VxqLZOAGYnfch42/wyj5QYcH8ntahvUVFDmk41fpL5rXhGVE0BbfZWgTNwPSj9wZMcSWF77C2AruITJSKqyiP1Go4J5m1tT1or2ugXqOOxrXzTQ7YDRBGl1iKaBRVIiXD6ZaV+DyjcjKv5cvRVdxCt+od9xKcOV6F3/VQr3bdL2enneL+g0fOryGLlMbyAjDVZkC9jBg3EDHyoUXjj03kT0z561HwcXCTD6FBYlDJfH5VxhCQ7lVPLqsGVNUuEXexKOKhaEBxfYQHceEq7+1Ca4rKDHI5JfApLifcobxpRZNIZRb47N+wmvsTtdfZg4sc9kWkJD3GZshjCLZt+YeEjY/a3k8X4emne7fSNi6nAfvkxYgs12WG8iNGcsJjCA3i0mkA7UCH+6Wp8IcF80TAwq9ZrMZVn8Lmo9ggVYYDUb6g==
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd?
 ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d5610000000b0033b3ca3a255sm1511899wrv.19.2024.02.06.00.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 00:47:51 -0800 (PST)
Message-ID: <0e47aa27-b28d-4672-a2eb-f906e0e6a5ac@linaro.org>
Date: Tue, 6 Feb 2024 09:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Content-Language: en-US, fr
To: Bo Liu <liubo03@inspur.com>, lee@kernel.org, wens@csie.org,
 marek.vasut+renesas@gmail.com, support.opensource@diasemi.com,
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 mazziesaccount@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
References: <20240206071314.8721-1-liubo03@inspur.com>
 <20240206071314.8721-9-liubo03@inspur.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20240206071314.8721-9-liubo03@inspur.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/18] mfd: khadas-mcu: convert to use
 maple tree register cache
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 06/02/2024 08:13, Bo Liu wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>
> ---
>   drivers/mfd/khadas-mcu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index 61396d824f16..ba981a788692 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c
> @@ -72,7 +72,7 @@ static const struct regmap_config khadas_mcu_regmap_config = {
>   	.max_register	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
>   	.volatile_reg	= khadas_mcu_reg_volatile,
>   	.writeable_reg	= khadas_mcu_reg_writeable,
> -	.cache_type	= REGCACHE_RBTREE,
> +	.cache_type	= REGCACHE_MAPLE,
>   };
>   
>   static struct mfd_cell khadas_mcu_fan_cells[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
