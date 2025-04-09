Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B638A82B13
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Apr 2025 17:49:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86B98C78F9A;
	Wed,  9 Apr 2025 15:49:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13D43C78F98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Apr 2025 15:49:55 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3912a28e629so965230f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Apr 2025 08:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744213795; x=1744818595;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=32r104ragES+JBKWZpr/5fwyEiz2V+wgrRvKzXjgako=;
 b=NAnayz4nGUw1MXSTgESGsPovXTNROYtdZS8ynVZNVUwlL8DDAZGUGirNK1Rf/BMTH5
 W00YR2Xkz2ZOe1KVmmR0Wtps3OQbj8iU+j0gpOrQUbIf3bfHIJ6t91nBfd9FKprxw3Ru
 gmjcI41yjEF3anFaD6ywSXvuhp3OVLISJyorM9nvEWvNJ2Qk1CDLnK25zRK3qBDpzuha
 WN9FGaBPFiK+dbcWOu0z2YEmTPW4xoAnqsIZ5GacD83NJ4cYpw0Mga0stUHG5x0hmO5P
 jfGyorVVp0sakIgnLv0+1wO/G+wz93v6Er1s8iGXoK96Wdt5mvdiAl+Do4xuMELGiNoa
 8SiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213795; x=1744818595;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=32r104ragES+JBKWZpr/5fwyEiz2V+wgrRvKzXjgako=;
 b=WR1abWPoLhul50jDxyC1nlPG9K2URq1eh055+mOOuLKPL/wH9Yjm6MtcsJmTGbZSK9
 oUKaQM06INe99thcNkqOjrxANRY/iqfz1YdgdEucFQs8WOki1O/WgZlaNlIPdcyVDCbQ
 XozSx80umkPfqsiN3ZJR8lPYBvv6FrrqoDz+fzthOj1Dn6WgCnEQ2UpjW7/nELdDtSVz
 Jm+KvxxZNGUb7fwNZ91eKPxCRoslxzlyf92xvVmyj4U8j1e7Of0lvhBVk1rdafzSLkTK
 Ba5JHZPX+ZYGa92J50v1+SGAutVmCp74+YpZA2j1fUGCUw0nDlCnmcaefm8dRzjXM51O
 5CJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5vjD/Zw8sunbPagYdj7AEaAtxZA1RZP58Hr0sM0N5GApBYxRTgme7qu8mGtOucVpddp/HulQYXX36mQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyhyIfEla55tdVFtb/AnvjglywFq0ySZA+2CrxlDjWiHKYjnfZJ
 jKfLhL2oSv1voPm052TQZyZs51jEQZkXXPVb7/hWCVEqq4Pa6OmObpUxEB/7VGM=
X-Gm-Gg: ASbGncs3sgz8Q3d60TPaSh9s/RJVSDSpdNWXT8cYsi7IPYuISK2wi05cGCIRuU89kA1
 GMrI9zRq4+wzcKWJIXnGHLhrL4LkTXCxmFjPmS33mn3mtGsmJO1i0jxIpmlnaNsKX23ft5HTRkX
 9tiPTfbgV3Wun4hN3hjIvcy5TN6KY7g+a5IplQeTxJyY2QaKlnMya7NcA7mPnD//SbBXQO7iyS6
 DfLtXwQz7pANNfyohQLtammoE8686GXvCl/KmuEiYKJ2z1rSQRTeCpYjVHFSVMoDweYHGv+xp+X
 FqktJK/U27PyJyIP60ER9rO566n/FnbwSOdGi+K6Me55h3+T6V1Nj5Mp4No=
X-Google-Smtp-Source: AGHT+IHFa+fVHyswKOhtWqv4wKhHcTO4gf1B7gffW/HC7i18H9UIMgFVHBSmLtlQ+wSwbCCT8gAfVA==
X-Received: by 2002:a5d:5986:0:b0:391:29ab:c9df with SMTP id
 ffacd0b85a97d-39d87ab55ffmr1238324f8f.4.1744213795374; 
 Wed, 09 Apr 2025 08:49:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.198.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8938d527sm2009165f8f.59.2025.04.09.08.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 08:49:54 -0700 (PDT)
Message-ID: <8406618a-20a9-4f9c-9ad9-09943524a7c7@linaro.org>
Date: Wed, 9 Apr 2025 17:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-3-arnd@kernel.org>
 <Z_aTOUUmyXpWnt57@smile.fi.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z_aTOUUmyXpWnt57@smile.fi.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Yu Jiaoliang <yujiaoliang@vivo.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/10] [v2] Input: stmpe-ts - use module
 alias instead of device table
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

On 09/04/2025 17:33, Andy Shevchenko wrote:
> On Wed, Apr 09, 2025 at 02:22:55PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> When compile tested with W=1 on x86_64 with driver as built-in:
>>
>>   stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]
>>
>> Ideally this would be referenced from the platform_driver, but since
>> the compatible string is already matched by the mfd driver for its
>> parent device, that would break probing.
>>
>> In this case, the of_device_id table just serves as a module alias
>> for loading the driver, while the device itself is probed using
>> the platform device name.
>>
>> Remove the table and instead use a module alias that reflects how
>> the driver is actually probed.
> 
> ...
> 
>> +MODULE_ALIAS("platform:stmpe-ts");
> 
> Isn't the preferable way to have platform device ID table instead?
> Krzysztof?

There is no ID table currently and I (usually) object for having both:
ID tables and aliases. In this case it is just simpler to have alias
than entire table and MODULE_DEVICE_TABLE(). Also it is unlikely it will
grow into many aliases. If it tries, then I will object.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
