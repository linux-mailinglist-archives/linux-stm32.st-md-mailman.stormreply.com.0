Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A519521BD
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Aug 2024 20:01:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52112C71290;
	Wed, 14 Aug 2024 18:01:23 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5739C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 18:01:15 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5314c6dbaa5so151897e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 11:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723658475; x=1724263275;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=EqWT7co9LLm+zY9hTxt/0Ma/Ff/Hf5HofKmeJ3F+uhw=;
 b=huzP1uoeb6Fc+01A4WmJ9taZrXPqTFgfcKE7DOTXnPSmPdUNZmoJGVRmgJ3NFNDkYZ
 ckLHklGAiFgBj9OBg1YLfvlLKRe6nwVjkTa0RR6W83DSa666ZMv9Y5q04MC6zoKRcfM3
 SlUEQizuOxHkADZXPSZoPjhl9wDhjJZ+Inbz9aDDUNmYUsdU9VgdBNyv3l6vpuFerT2Q
 VIZASHILnBjQoZDyTrDXXBXYLJMuW6JVFbbr+qpnCk3Qv/uQTlJX3fC+njO8eIWrFjur
 Z+F6lHvxLeBkaE6hj+cg6O1k5oJ/1Pde3PkLXWbw0cDAgf/vwOkEKc9JNlVZZLtjM52S
 8+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723658475; x=1724263275;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EqWT7co9LLm+zY9hTxt/0Ma/Ff/Hf5HofKmeJ3F+uhw=;
 b=CH9fpxG0drBqqBjEa8fLHIoTsHcfynsGr90SQJQ+2+Bi57dKN8Nrm6wwA4lCcXteUs
 gBIRFtiYIx4Gr/ulpjnYKrh5ggAJ+M+i99JzO5jintkAoGYOm7EpP+jfbqFTtYktiqe1
 34Mx7vRyxPw7bV1HfNrR90ejCs76Vd+72Pn4qdKgQ/kwNlW9Z4Ts35N+nftSkhtIiMpM
 CizFtfMOHORiGk1vN9W3Kyb9mleLfnC86sIeRFABySXpKS3AyTAGWLdWW05T5KdEj0A9
 MpPS26GrBIv3Kvp+fLcJ6JwgCUrqYKGHN7XOmn9gkiqZnO4RyJnnnEigik7fdswmufGT
 4NZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEGhbWOTfqx8cL322IiD7ppozTUkPVGGkMIBO9Y3RmgVJcqQ9vSozP+NJY6iQOPK+4THJVNAMaZwlxLf3idUHPNM5/aef5Fxt819zIvX+PhKbbnigyoJWd
X-Gm-Message-State: AOJu0Yy8jXGbiZuyKJb5mKOnZfLrQFeibQLfTT3f6+QljQH5BBOTzmDa
 uKqUxg0K7DaGPLDVHQW6QProlXJCuma1zbBnYNoiJwb+7WdbccGmaxKDgNrahjs=
X-Google-Smtp-Source: AGHT+IGOY+fHGA681Phv/bb+Nvm64Jh5qeSZOPlkH6pYx8qHLZa9/HUqI8ecTFDDn08I8Aj9PH7V0g==
X-Received: by 2002:a05:6512:687:b0:52c:d27b:ddcb with SMTP id
 2adb3069b0e04-532eda8e7ecmr2795696e87.3.1723658474687; 
 Wed, 14 Aug 2024 11:01:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded28cdasm26871565e9.16.2024.08.14.11.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 11:01:12 -0700 (PDT)
Message-ID: <03b93d98-5722-4592-9346-30a3b4f95d1f@linaro.org>
Date: Wed, 14 Aug 2024 20:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
 <20240812-cleanup-h-of-node-put-memory-v1-9-5065a8f361d2@linaro.org>
 <20240814175541.00002023@Huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240814175541.00002023@Huawei.com>
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
Subject: Re: [Linux-stm32] [PATCH 9/9] memory: ti-aemif: simplify with
 scoped for each OF child loop
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

On 14/08/2024 18:55, Jonathan Cameron wrote:
> On Mon, 12 Aug 2024 15:34:03 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> Use scoped for_each_available_child_of_node_scoped() when iterating over
>> device nodes to make code a bit simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Nothing wrong with this patch, but I think you can add a precusor
> that will make this neater.
> 
> Jonathan
> 
>> ---
>>  drivers/memory/ti-aemif.c | 13 ++++---------
>>  1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
>> index e192db9e0e4b..cd2945d4ec18 100644
>> --- a/drivers/memory/ti-aemif.c
>> +++ b/drivers/memory/ti-aemif.c
>> @@ -330,7 +330,6 @@ static int aemif_probe(struct platform_device *pdev)
>>  	int ret = -ENODEV;
>>  	struct device *dev = &pdev->dev;
>>  	struct device_node *np = dev->of_node;
>> -	struct device_node *child_np;
>>  	struct aemif_device *aemif;
>>  	struct aemif_platform_data *pdata;
>>  	struct of_dev_auxdata *dev_lookup;
>> @@ -374,12 +373,10 @@ static int aemif_probe(struct platform_device *pdev)
>>  		 * functions iterate over these nodes and update the cs data
>>  		 * array.
>>  		 */
>> -		for_each_available_child_of_node(np, child_np) {
>> +		for_each_available_child_of_node_scoped(np, child_np) {
>>  			ret = of_aemif_parse_abus_config(pdev, child_np);
>> -			if (ret < 0) {
>> -				of_node_put(child_np);
>> +			if (ret < 0)
>>  				goto error;
> I'd precede this patch with use of
> devm_clk_get_enabled()
> 
> That would avoid what looks like potential mixed devm and not issues
> and let you return here.

Yep, that would be useful.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
