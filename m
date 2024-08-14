Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A5495219B
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Aug 2024 19:57:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED145C71290;
	Wed, 14 Aug 2024 17:57:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E5CDC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 17:57:21 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-371845c66d9so89968f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 10:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723658241; x=1724263041;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=HnUwdGhfSZGHxuMeMqzleyP++rz6g7MwzjmvPDN+MAg=;
 b=VRWFIN+0jj7zoZqxd0CTBpK6XMQghiePP0MK5BHVOI0v1A63L4ziiZlSCwPlPCamFx
 7K5LIX4drfLUOVcJhf36Vafhc+r6+sEYMbNjBFpZtuX7DljQPR1bIV09C2iKAs06bdZM
 /kvh3z6n1SFl00O4vUGJ2b21T7HhjFehMIC+cxabZJu3k4j77nH9rX1237xGuRa2B55d
 bDWmGmDh2b1W6brjn5txTRt5wreFheRsoyFNQqbpER8B3D9uupeNEsfIE3ieidhHdYL7
 3itXF+XZF7XhcubjjLsbW/gtRuZ0kN+bOwssWkkeJDlDdJ2qI9IakAfsdVG+fBkWOFHu
 3vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723658241; x=1724263041;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HnUwdGhfSZGHxuMeMqzleyP++rz6g7MwzjmvPDN+MAg=;
 b=eF+JydfgWtcn1n2cJK2WrLG871VpPXnp6VnA/Jagxx8K8qw5H43bYwuQY/JMWJIk1z
 Zhr/HADCAmYJ12ETwq4qMG2fZeqgKMRwQ6byJvMdDJKM/alxwm/3REl5dAk6GY8zUPuu
 Av08zpli0YtCZUEUaATiKAglWMmq/1JI6Jk8bQ6KvX90343qINycIGt1R4NrKddlY8DR
 u+CmPshA3iLBCjw7vQtVi+EAWd6ixbvfTkPN9TiswTwENuuNaUhGQTt6puyRuVaw0yka
 3nruK32zZ/Nh9Qq4k+p9RiUqkBd3YMCDAQWybDRnWKxZjNQDQKU2BGaaOoBAiagHZPEt
 LtPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgoHhDCWUI3gGLqB9yk7NlwMqtkvptMzWX0Rb0NLguNxZR8y4YcMghG/eltTUpqDostv0h9pmORNXEQD7HHdVsYB5fkXOz64fkIJuBmEZlyXFku7qfDJpx
X-Gm-Message-State: AOJu0YzW5yS+9s/VsFgcWDrsOrv8sPx/P68Ug06V/Ini93mx1DSwqkQI
 XGIq4v5TOM/LkFzapentJxpBbX8n0tXYnSorY8lPU07lxuimkbWm61WVdVVgVLg=
X-Google-Smtp-Source: AGHT+IGohuyYGGk60HZbxQ/ROWUPTaq5Wi5UopTp8W5NYw+7mjHHwwWxgpEiJsSVNDzahS1qQVmMhQ==
X-Received: by 2002:a5d:4850:0:b0:369:b7e3:497c with SMTP id
 ffacd0b85a97d-3717775fb8fmr2431134f8f.1.1723658240825; 
 Wed, 14 Aug 2024 10:57:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3717314e38bsm4654498f8f.97.2024.08.14.10.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 10:57:20 -0700 (PDT)
Message-ID: <768894bb-a12a-4919-9b4d-b579c153a556@linaro.org>
Date: Wed, 14 Aug 2024 19:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
 <20240812-cleanup-h-of-node-put-memory-v1-3-5065a8f361d2@linaro.org>
 <20240814174246.00007e4e@Huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240814174246.00007e4e@Huawei.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 3/9] memory: samsung: exynos5422-dmc: use
 scoped device node handling to simplify error paths
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

On 14/08/2024 18:42, Jonathan Cameron wrote:
> On Mon, 12 Aug 2024 15:33:57 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> Obtain the device node reference with scoped/cleanup.h to reduce error
>> handling and make the code a bit simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Trivial comments inline
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
>> ---
>>  drivers/memory/samsung/exynos5422-dmc.c | 31 +++++++++++--------------------
>>  1 file changed, 11 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
>> index da7ecd921c72..d3ae4d95a3ba 100644
>> --- a/drivers/memory/samsung/exynos5422-dmc.c
>> +++ b/drivers/memory/samsung/exynos5422-dmc.c
>> @@ -4,6 +4,7 @@
>>   * Author: Lukasz Luba <l.luba@partner.samsung.com>
>>   */
>>  
>> +#include <linux/cleanup.h>
>>  #include <linux/clk.h>
>>  #include <linux/devfreq.h>
>>  #include <linux/devfreq-event.h>
>> @@ -1176,10 +1177,10 @@ static int of_get_dram_timings(struct exynos5_dmc *dmc)
>>  {
>>  	int ret = 0;
>>  	int idx;
>> -	struct device_node *np_ddr;
> 
> This would definitely benefit from a
> struct device *dev = dmc->dev;

True, I'll do it in separate patch.

> 
>>  	u32 freq_mhz, clk_period_ps;
>>  
>> -	np_ddr = of_parse_phandle(dmc->dev->of_node, "device-handle", 0);
>> +	struct device_node *np_ddr __free(device_node) = of_parse_phandle(dmc->dev->of_node,
>> +									  "device-handle", 0);
> Trivial. Maybe consider the wrap suggested in patch 1.
>> +	struct device_node *np_ddr __free(device_node) =
> 		of_parse_phandle(dmc->dev->of_node, "device-handle", 0);

Ack.



Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
