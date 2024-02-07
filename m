Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2B484C5DD
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 08:57:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E9DFC6C85A;
	Wed,  7 Feb 2024 07:57:59 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EAD1C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 07:57:57 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51124e08565so480608e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 23:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707292676; x=1707897476;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=faw62muK8rMq99LhU7XEIx44p0VAUyI8BL+QRChVvwA=;
 b=BnyK/4XuQRdahUwKvoHZ07a92douZQeEu0ZGFtiqg9UEID8AuFlpUtVoUf/0VGVcsl
 h4D5jfRSumqB1sbW0GvKeqDZRokw0Y7wlspUc9rUNeMxkVvxizY+dnPTScmVs44AAB+u
 wQlZfJoTvstGNKgg/7+XfSAQbTjTqeVqJXA1gAWufFN1oH3kwvfGZOwm5ciMKOd0KP5U
 KsePdFj7gFfPR+httjjgR6lEUY4FbOPclxiV/JLtLARj6VTgJUeBga9g5msaNh7FXnHo
 Of1m1UXATtCK2BGalK+WTZZN7e9TBC4gXEuatMzrXo+yEPXzwCdCkp5r34VY/ticniP5
 d1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707292676; x=1707897476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=faw62muK8rMq99LhU7XEIx44p0VAUyI8BL+QRChVvwA=;
 b=Ta7cCe+LHtvoNnJxE5BEDjBDkG14lRHOYGttd3rG0+WxBDdhe/tVy4UhXzRbJ9lnpb
 Q44tQAESxDf5DDQvorKUIDDNzHNQcX/8AX7qMnIG0Qy5UQSsK3JaNQ9p7zDA/2p8/NvY
 qR8zUXLEkaPUpqjP3+r8Gj9ULZn7IW3wZ9MN5MTOr3C8TyhSN4DU+BzT/Eq/NV2Ji6oz
 zG4YxspMcL7mDuWHtvKpU7k+6398v1mEYtK8cg+x3ViMbRTZkt7EgT6Mta0NDlBn8lHJ
 rebzo0Kn73V7rDErYGH08CYmZ6nKBIP3OZXBBZ//qOBEpvKgIjqIO3Ta8kcRiAl4XNpG
 EysA==
X-Gm-Message-State: AOJu0YzkaGMWJ1f2imnreaPaXlwfrWHOim+Y8I4WFJKaacL+TxmFQIVk
 YBwpKEkfvrMYdPH498xgGqnXQggQXGLts/4uzLnPkz7InUdtYSLO
X-Google-Smtp-Source: AGHT+IHrOG4ej7Nc8ic00cewvUn2sqV1hsMqwojBzY8/6TzL9zMPEDbPRaGu93Tp6EIf/bcp6ZT7zw==
X-Received: by 2002:ac2:42d5:0:b0:511:5b47:1fe8 with SMTP id
 n21-20020ac242d5000000b005115b471fe8mr3472289lfl.6.1707292676205; 
 Tue, 06 Feb 2024 23:57:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWCJTQDT9qidD5GSnJxXCfNIUbZHTrA3J5SEMhoGXkwZ8UHtixP6Uu2E0dmz4PJCKV0lED018lrWOuIW368bJFU2nzD5CDed1ZTSKe19z8Dczg0RB0oxZ18Tfzbw8jOsM3Vb4ps4gOqQxHxVRB2ycP8l0JoiKbzhUHUzu9kY77hcC/6ESLjmv6wB3ujRzYOM6FqR2iizc7p/MiKL8nGcQIzct0Kx7YECuXvtTQ9NaYsOxZ7IWQSOGJ0UUs/qUnnVg+iZGKxQ9qxnhKxDng2I6N/+oAD7xAqY6oz5HYas2dUWL2SvBTcPKkJUSKrP3NFocMBv1vjMJMPfX2e4ZOZ4mIxqR6h3uNnOeEUhALQJzGRZKTpfZ08hHuHVBkhqayVq00SB/lUS+4ITMiHqiFEm13zTZ25gt09zSGyk6LunSj+PVdw8u9Ovw4jIvD7iw75kK35MgkLo5fULXOjp3QV9olbvzUPtuN9c6s/lPW7tFOpXimlnGV/BItO7P8F3p3D9N1AgDPOCYl4+5jazyW5qGeUF53lIBl6lzWtfX2/BcIkjPP/p5Apwv7TNC21ji4rpHUfe/ZK1E+L/gXrM8DcgkQUMOIzkVQBh8bYZjJ5tOE=
Received: from ?IPV6:2001:14ba:7426:df00::2?
 (drtxq0yyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:7426:df00::2])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a056512310200b0051140df84fdsm96155lfb.12.2024.02.06.23.57.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 23:57:55 -0800 (PST)
Message-ID: <ab8d9d0a-aad4-42b7-9e24-9ae6acf7c939@gmail.com>
Date: Wed, 7 Feb 2024 09:57:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, en-GB
To: Bo Liu <liubo03@inspur.com>, lee@kernel.org, wens@csie.org,
 marek.vasut+renesas@gmail.com, support.opensource@diasemi.com,
 neil.armstrong@linaro.org, ckeepax@opensource.cirrus.com,
 rf@opensource.cirrus.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
References: <20240206071314.8721-1-liubo03@inspur.com>
 <20240206071314.8721-12-liubo03@inspur.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240206071314.8721-12-liubo03@inspur.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 11/18] mfd: rohm: convert to use maple
	tree register cache
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

On 2/6/24 09:13, Bo Liu wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>

Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
>   drivers/mfd/rohm-bd71828.c | 4 ++--
>   drivers/mfd/rohm-bd718x7.c | 2 +-
>   drivers/mfd/rohm-bd9576.c  | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
> index 594718f7e8e1..2f3826c7eef4 100644
> --- a/drivers/mfd/rohm-bd71828.c
> +++ b/drivers/mfd/rohm-bd71828.c
> @@ -197,7 +197,7 @@ static const struct regmap_config bd71815_regmap = {
>   	.val_bits = 8,
>   	.volatile_table = &bd71815_volatile_regs,
>   	.max_register = BD71815_MAX_REGISTER - 1,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>   };
>   
>   static const struct regmap_config bd71828_regmap = {
> @@ -205,7 +205,7 @@ static const struct regmap_config bd71828_regmap = {
>   	.val_bits = 8,
>   	.volatile_table = &bd71828_volatile_regs,
>   	.max_register = BD71828_MAX_REGISTER,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>   };
>   
>   /*
> diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
> index 4798bdf27afb..7755a4c073bf 100644
> --- a/drivers/mfd/rohm-bd718x7.c
> +++ b/drivers/mfd/rohm-bd718x7.c
> @@ -87,7 +87,7 @@ static const struct regmap_config bd718xx_regmap_config = {
>   	.val_bits = 8,
>   	.volatile_table = &volatile_regs,
>   	.max_register = BD718XX_MAX_REGISTER - 1,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>   };
>   
>   static int bd718xx_init_press_duration(struct regmap *regmap,
> diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
> index bceac7016740..3a9f61961721 100644
> --- a/drivers/mfd/rohm-bd9576.c
> +++ b/drivers/mfd/rohm-bd9576.c
> @@ -62,7 +62,7 @@ static struct regmap_config bd957x_regmap = {
>   	.val_bits = 8,
>   	.volatile_table = &volatile_regs,
>   	.max_register = BD957X_MAX_REGISTER,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>   };
>   
>   static struct regmap_irq bd9576_irqs[] = {

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
