Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876F749556
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jul 2023 08:08:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5119FC6B45C;
	Thu,  6 Jul 2023 06:08:06 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0DF4C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jul 2023 06:08:04 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so36257566b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Jul 2023 23:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688623684; x=1691215684;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I7nLQR/B3UQbt+9uJMAZJaX6K0uXW7cxqOcVTi+nmsg=;
 b=ZUKbME848xiV2hktdav+CO31kzq1MxpYSRjHlbmGTy7PBC9j30cY//SQZEm5FrXI0P
 xSRk50aUQ0CnfXXy6O6S6z6T2LNIVIYwb2I4iwwZmHZbtgZFXpD2N9QOfSqDp/GbI2Hk
 YAQdq+vjLAG9dz/oC21JBMx80qUiw9KBedwJK/rer/IlPSBLsiAliLQjKSGfgTh5lO7z
 tA1DNyXmETftvdu9kmXKLPIDEyBJ5/NFBtVOKsYS6iDzG+0n/aNQ2Gi5YVDEIN652OVQ
 hyPP9aRVTJpByJt5QExCPE6KYnaHGV3Dp/KsnsNAuhDeoQ/tmZStlWx3/nPA8drurazx
 03lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688623684; x=1691215684;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I7nLQR/B3UQbt+9uJMAZJaX6K0uXW7cxqOcVTi+nmsg=;
 b=Lb469aclz37aIX4k93KtPLRTISMN2RIjJwhE3Kj0dNed1CDArX8KtDvmBFw60NdI+3
 ycopNu/9txzlF9X83tpDDHfC+b5iKC0/Lx590ezRCuam9NpuHCL0FcRrWVb4jxABPQZp
 P355YWmhGyS3WselHeQyVnLc6/YLG7LUUhNeUoh5V1ilErgjohLGUF6T7k0SXyn5K30g
 xTfJ/JmWvevBJmllAo3xEIunvAlW5BWMnsqxKXrXv6xqzbtBRjthXpyv9bxudx/6Mpjn
 kWB732+5B4wUp+ZHoKoTlywxB3uzsTY2WrYXTJUPWQayH2n8OkPFIOmD0chS75lhhklH
 4XIA==
X-Gm-Message-State: ABy/qLbO+ov9Vf1QTo2H2j0cXWLkfJyTcc/agw7qROMCK/k4JKm5OTGD
 ycQLt9giqL2NA7dpYrCXeY1Xdg==
X-Google-Smtp-Source: APBJJlFDMJFx306FrGg5ohS3BhEzDqr0yb6OoJZbHqbX+RnUydpRx11+NP5dFtOybSs3/zqB/5U5Cw==
X-Received: by 2002:a17:906:212:b0:992:a31f:f584 with SMTP id
 18-20020a170906021200b00992a31ff584mr670671ejd.31.1688623684073; 
 Wed, 05 Jul 2023 23:08:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a1709064a8b00b00992dcae806bsm368577eju.5.2023.07.05.23.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 23:08:03 -0700 (PDT)
Message-ID: <7a08dcf4-e6d4-ef60-48d2-81275a7d7a6e@linaro.org>
Date: Thu, 6 Jul 2023 08:08:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Valentin CARON <valentin.caron@foss.st.com>,
 Mark Brown <broonie@kernel.org>
References: <20230627123906.147029-1-valentin.caron@foss.st.com>
 <0815474b-a8fa-f486-fc6e-a85df88ed9b9@linaro.org>
 <c232e3f1-b703-d8d2-7e2d-19ed3f5fc3ad@foss.st.com>
 <79505e19-c5ee-36ee-c8ae-344c15f8b108@linaro.org>
 <ec4f025e-680f-2145-7ca8-1ee6b38baa43@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ec4f025e-680f-2145-7ca8-1ee6b38baa43@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: disable device mode with
 st, stm32f4-spi compatible
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

On 05/07/2023 19:16, Valentin CARON wrote:
> Hi, Krzysztof
> 
> On 7/1/23 10:09, Krzysztof Kozlowski wrote:
>> On 28/06/2023 18:21, Valentin CARON wrote:
>>> Hi,
>>>
>>> On 6/27/23 15:39, Krzysztof Kozlowski wrote:
>>>> On 27/06/2023 14:39, Valentin Caron wrote:
>>>>> STM32 SPI driver is not capable to handle device mode with stm32f4 soc.
>>>>> Stop probing if this case happens, and print an error with involved
>>>>> compatible.
>>>>>
>>>> ...
>>>>
>>>>>    
>>>>>    static const struct of_device_id stm32_spi_of_match[] = {
>>>>> @@ -1798,8 +1802,16 @@ static int stm32_spi_probe(struct platform_device *pdev)
>>>>>    	struct device_node *np = pdev->dev.of_node;
>>>>>    	bool device_mode;
>>>>>    	int ret;
>>>>> +	const char *compatible =
>>>>> +		of_match_device(pdev->dev.driver->of_match_table, &pdev->dev)->compatible;
>>>> The goal was to replace it, so drop it.
>>> Is is still needed for dev_err, so I can't
>> Why do you need it for dev_err? Isn't it entirely redundant?
>>
>> Best regards,
>> Krzysztof
>>
> Only to have a clearer error message. To let know to user that spi 
> device is not available on this device.

It's obvious from the probe error.

> Right now, there is only one compatible where spi device can't be 
> enable. So I could use a static message. But this is not the best if a 
> new compatible is added.

It does not make sense. Compatible changes here nothing. It does not
matter whether your driver supports one or two devices. Not mentioning
that errors are printed with device ID.

Drop this code, it's entirely useless.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
