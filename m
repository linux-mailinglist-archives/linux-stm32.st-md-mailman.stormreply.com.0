Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29027718989
	for <lists+linux-stm32@lfdr.de>; Wed, 31 May 2023 20:47:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2633C6A614;
	Wed, 31 May 2023 18:47:45 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C5B3C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 18:47:44 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso156555a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 11:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685558864; x=1688150864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=57q4TdWvHlrEcIXeoi1W6gK5/9KE0SGJz/XNivOKPnk=;
 b=oilRIHPnW2cKnSn+LS9AcMaGyPgbofIVDMmLVDknuvY7DrITlUY34BXtCpgQgCYiIM
 /J1nY4WezjqAjMPOwSeq9pSDIVCD80AhJL4dlDFKI5RNcnWIn24TDlN8K6LASJ4ntUba
 YjprkdTZEpRW0STsJhGyBCIbRvIgHKOyuBP5wWhym2AH+s7KAQrJjxHQau+fywgxIvk0
 XCI7em/WbhCSiqLL0ffAIn8Rw2GnCj3L3wjUsL1xbnxZrINd8bMcxDSDB6kImuHe3hon
 +qbotEqVxhHKsc20Ey/mIt3hsAi1U6F4owY3hNPpoQEMRFLq701/C8+TvNepKEmWFTsx
 oexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685558864; x=1688150864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=57q4TdWvHlrEcIXeoi1W6gK5/9KE0SGJz/XNivOKPnk=;
 b=e82ThgSXbNTsGmiavsX9+z49rprXqhIxEsaRbunL4K86kz4RFRpKve6sG5ZY71QxB6
 n7iIBf5Jsfb50DPAw6BeQXfIeeQaUPudxr1u/soqDD2Y9JTXZd8H5Pox4Upgb5k+ioGZ
 mjvFBqMNWLwCn1H0qlVpBn6X/wmt69f6ZDkzURWx5uQEpTehrqc3IobzSpn6WPyOt8GT
 ddmfJ/PdbPplYZWmtJu4FnxMC0nPgbGjISmHSVy3zN0CkuyijLtUKy2L9kvrqb3O4yUK
 /IEdvABvPAnSOVnOpTiAVuz1GkLKAPVRgWvk+4MkPqaiUuniEt/1TOcH2UjvLN7HC1Mf
 J+cA==
X-Gm-Message-State: AC+VfDzVMcblnE7rs7Y2X1pNRd1fbwq1F4Ti/SxByGPF5yACKEV7xveS
 jFrFJl/b7hWVsKdvwKAzKCDDvA==
X-Google-Smtp-Source: ACHHUZ5OHEWC/l7SwXXG0Ex4UcYj5G95i7V5T07Yf+NXLS4ZzBYzSv6/qXcHJtcqP3+UJEQM/h4YDQ==
X-Received: by 2002:a17:907:7dab:b0:970:1bc9:2eeb with SMTP id
 oz43-20020a1709077dab00b009701bc92eebmr6064275ejc.30.1685558863716; 
 Wed, 31 May 2023 11:47:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 lv17-20020a170906bc9100b0095707b7dd04sm9258501ejb.42.2023.05.31.11.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 11:47:43 -0700 (PDT)
Message-ID: <25d61668-0b79-8565-0de8-dad7e80e3798@linaro.org>
Date: Wed, 31 May 2023 20:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor@kernel.org>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-5-alexandre.torgue@foss.st.com>
 <20230529-backlit-dealing-b099e4eb5210@spud>
 <c805cd5f-92b1-eb56-d9bc-66814705e848@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c805cd5f-92b1-eb56-d9bc-66814705e848@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/11] dt-bindings: stm32: add st,
 stm32mp25 compatibles to the stm32 family
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

On 30/05/2023 10:39, Alexandre TORGUE wrote:
> Hi Conor
> 
> On 5/29/23 20:05, Conor Dooley wrote:
>> On Mon, May 29, 2023 at 06:20:27PM +0200, Alexandre Torgue wrote:
>>> STM32 family is extended by the addition of the STM32MP25 SoCs. It is composed
>>> of 4 SoCs: STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>> index 4af5b8f4f803..7d7ca33d2e61 100644
>>> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>> @@ -161,6 +161,15 @@ properties:
>>>             - const: phytec,phycore-stm32mp157c-som
>>>             - const: st,stm32mp157
>>>   
>>> +      - items:
>>> +          - const: st,stm32mp251
>>> +      - items:
>>> +          - const: st,stm32mp253
>>> +      - items:
>>> +          - const: st,stm32mp255
>>> +      - items:
>>> +          - const: st,stm32mp257
>>
>> I assume the slightly odd format is just to avoid churn when adding
>> the board compatibles.
> 
> Yes, exactly.
> 

I don't get it. How are you going to extend it? Or rather - what are you
documenting here? If these are SoCs, then this is not valid. We do not
allow these alone.

No, please drop it.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
