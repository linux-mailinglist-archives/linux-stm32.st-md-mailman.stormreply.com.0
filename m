Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CEA7447F0
	for <lists+linux-stm32@lfdr.de>; Sat,  1 Jul 2023 10:09:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72E84C6B453;
	Sat,  1 Jul 2023 08:09:09 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53AE5C04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Jul 2023 08:09:08 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-51d89664272so2838299a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 01 Jul 2023 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688198948; x=1690790948;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KSlAwdCySIPpHmXGLs2pWw86cvP+2Eq0vNW9mrLLkJQ=;
 b=hwS6HIFRBhIjc+RulU2qKaHPWsKm8iIpLpWKEScv9k3KM0liFWO5gnpfPMiiPVzuKI
 A4H+8aeBMAz5J6NZt64SLbmVItWC3f7WhJJomHJa3Zl5M73pB2E1u1TD7dAJopIsqYqq
 Pgk53D6bCQG7sWKtMCmF2FU7DKKF/yR8tM/6rkP4nprQD2KWZInDVcYVbT3RPSXJ2CPn
 uhUtQBRylO4DksYiQ8fvbapSndRs7CKaHx43OfzWDkQiGldDuCN6gax1ErqRiIlSQHnA
 ytfIKZqzWRG+eF+C/6GaRiAzjupWuZP4x1ni9PZ4NL1j2m0r61UnFKLo1Asf9J9OCj77
 jxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688198948; x=1690790948;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSlAwdCySIPpHmXGLs2pWw86cvP+2Eq0vNW9mrLLkJQ=;
 b=QQ/5Jvolf47XaoUN5N271zAgEN1R8yQGwkKR09Dc3jazyXqcBDtFRE9g8v7d2Q87XE
 Hba8dlL5nOdXJ3929v+ZoC6wpy6q467MmbmzKu0AaFSPAw2kr2rZ1sm1rYkIu0JsddG6
 JfKMf/z1f8XjdQINsLfzxGv2laUmSksDx6KebcixvDUFiP9jYFPikXmt3uyV/yxJ1olX
 qUjJXCjUrmklrWNyH/b5vsZxvQXCRuTJoalk6komResGbyJdkNGVdmini67+NmYWbSAQ
 1moE6coDrBRKVyp8CIBExxai5vZ6RlpHjmZoYZdSQybXs569csQ//eI7S8HlpH6i3WoA
 p+Xw==
X-Gm-Message-State: ABy/qLZ4WIKIxpvJu3vxPtAEwmsyzTmamK9Xckkdrfvg3mT1dBtdrq8B
 h2PP3wzN/Qc4U3kypQsP9BzSMA==
X-Google-Smtp-Source: APBJJlHWma/hbAV/dZaNLVa+XpQhQptQYCvZa1XvPDcNYiQmDsijOwydkrgNp1l53POy1A76v4YzgA==
X-Received: by 2002:a50:ec8c:0:b0:51d:9dd1:29d0 with SMTP id
 e12-20020a50ec8c000000b0051d9dd129d0mr3229450edr.23.1688198947677; 
 Sat, 01 Jul 2023 01:09:07 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a056402032b00b0051de2455041sm2292444edw.24.2023.07.01.01.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jul 2023 01:09:07 -0700 (PDT)
Message-ID: <79505e19-c5ee-36ee-c8ae-344c15f8b108@linaro.org>
Date: Sat, 1 Jul 2023 10:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Valentin CARON <valentin.caron@foss.st.com>,
 Mark Brown <broonie@kernel.org>
References: <20230627123906.147029-1-valentin.caron@foss.st.com>
 <0815474b-a8fa-f486-fc6e-a85df88ed9b9@linaro.org>
 <c232e3f1-b703-d8d2-7e2d-19ed3f5fc3ad@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c232e3f1-b703-d8d2-7e2d-19ed3f5fc3ad@foss.st.com>
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

On 28/06/2023 18:21, Valentin CARON wrote:
> Hi,
> 
> On 6/27/23 15:39, Krzysztof Kozlowski wrote:
>> On 27/06/2023 14:39, Valentin Caron wrote:
>>> STM32 SPI driver is not capable to handle device mode with stm32f4 soc.
>>> Stop probing if this case happens, and print an error with involved
>>> compatible.
>>>
>> ...
>>
>>>   
>>>   static const struct of_device_id stm32_spi_of_match[] = {
>>> @@ -1798,8 +1802,16 @@ static int stm32_spi_probe(struct platform_device *pdev)
>>>   	struct device_node *np = pdev->dev.of_node;
>>>   	bool device_mode;
>>>   	int ret;
>>> +	const char *compatible =
>>> +		of_match_device(pdev->dev.driver->of_match_table, &pdev->dev)->compatible;
>> The goal was to replace it, so drop it.
> Is is still needed for dev_err, so I can't

Why do you need it for dev_err? Isn't it entirely redundant?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
