Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE445FFA15
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Oct 2022 15:00:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBCD2C6411F;
	Sat, 15 Oct 2022 13:00:25 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4201FC640F3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Oct 2022 13:00:24 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id s3so5282602qtn.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Oct 2022 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YzVFvoqPA8otoKfTTkSzo5O42ejeTslaNX3VpWD2aaU=;
 b=mLJCU69JHPINYeqEIAPtNr/qK1R54Q8SlRSUn7VGflw6i+u0BIdsTyCfyaaPMWvAL4
 ZA9xcVjh1/MUMBfXirJeSbVlbfBrsOUR0W7Ohv1jOLDMSlR6+vKp2JnMZTYAT0ZOuxNl
 akI5RcgwyxC8YloMc5rr40LYJDgbrxYkvAzk5GY7S8GVK3hkOy3wD6Udep/e12hapyDi
 Gvk+OB4yx3gDLxsgBFybo9WIbktw0O1EGYZwtocop6tI7MxRG61AP8QfSjBVegi/x5h+
 POKPUaYAjp78Iy6dDzRuPJhsUSLavftefrqrMypVFqIegE6wrbukKVrpuoXH2KcEmJwL
 9ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YzVFvoqPA8otoKfTTkSzo5O42ejeTslaNX3VpWD2aaU=;
 b=RzmsaLgkZCJ3p4ix58XLT5qzDPlPJxr0SA9P9DpSkaYwIP20UmqOJaVD+xwYKgcjJs
 Pr8V0gb+H+DavHT7+V5tN6q7GWBfi8Xnd0uYdiVuV60e3D91CfnPRB675iJ0Cw19n6FM
 eebq0EJIvZt+r76iAmKQGqTG6UzqJrTEFf332i+c4MRZ/RKmWD2iHOxGMv1WdSc2DBmC
 QZcw8zTnu4tFBJei7GbDi5dH7oBvEcb2SwRuiOG7Fk8wa4wGRkGjdizICl2hbH9CTYb3
 5Vbyz3Su0Vxr2K2zfzO01ikZzs7zThnLjhx64sPFkoEPcu5PFTuHSrI5HUmvHWgOeTTp
 rfsQ==
X-Gm-Message-State: ACrzQf2O6nGHTBuceN8BdbXHRDY5iZh5tRicnJdP3Id1dsrplULK3Mno
 RGUZd8AlKsyKx4X0VAtrS79eNA==
X-Google-Smtp-Source: AMsMyM4MtkHVxQ/H6J+XcEyuC7jT+IeuyzzKHfpCjoFk7oA3Kb0GQocOfHKfvZta4G6dPITaxdmWqA==
X-Received: by 2002:a05:622a:1829:b0:35b:b542:b593 with SMTP id
 t41-20020a05622a182900b0035bb542b593mr1779181qtc.471.1665838820432; 
 Sat, 15 Oct 2022 06:00:20 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:161:5720:79e9:9739?
 ([2601:42:0:3450:161:5720:79e9:9739])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a05620a085200b006ce580c2663sm4609123qku.35.2022.10.15.06.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Oct 2022 06:00:19 -0700 (PDT)
Message-ID: <cd5fdffa-3408-3270-59d2-728fd67891ad@linaro.org>
Date: Sat, 15 Oct 2022 09:00:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20221013221242.218808-1-marex@denx.de>
 <cc7289ac-b75a-62e3-4b58-fc018715c068@linaro.org>
 <09cb3000-14c4-e94f-70e8-36e0ef8ce3fc@denx.de>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <09cb3000-14c4-e94f-70e8-36e0ef8ce3fc@denx.de>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: mmc: arm,
 pl18x: Document interrupt-names is ignored
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

On 14/10/2022 12:02, Marek Vasut wrote:
>>> ---
>>>   Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>>> index 1e69a5a42439b..1c96da04f0e53 100644
>>> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>>> @@ -95,7 +95,9 @@ properties:
>>>         PIO (polled I/O) interrupt and occurs when the FIFO needs to be
>>>         emptied as part of a bulk read from the card. Some variants have these
>>>         two interrupts wired into the same line (logic OR) and in that case
>>> -      only one interrupt may be provided.
>>> +      only one interrupt may be provided. The interrupt-names property is
>>> +      not used due to inconsistency of existing DTs regarding its content.
>>> +    deprecated: false
>>
>> Why do you add deprecated false? All properties are not deprecated by
>> default. Did any other referenced schema make it deprecated?
> 
> Rob asked me to add it in V1 .

Indeed, thanks.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
