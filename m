Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1B45E76B8
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Sep 2022 11:21:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB517C03FE0;
	Fri, 23 Sep 2022 09:21:33 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71683C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 09:21:32 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id g20so12734849ljg.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 02:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=7slKNQh60cH75T6cRpc524ASdPemcdJLGtdMzrxSYyU=;
 b=HyrSz8jTScQZTYUsbOu1g5FDL7oZOyf1s0Lc0HZQi9P6adutQjNUM+Un9WYFhsVEij
 Ba6Sl/mUaV0geS0UFA+BSP9uuLEa+6W1+/fDWvK73NB397lq6UusDD+bx2PVpvf87VP/
 AcpC/5nFqDzljfIkvAzdfFYnkLHeG4CoNhH8mJ52uLQP8trylJMZf9IOMThEFmnHqNmK
 H3p/jhzsCjrnf6KC3xTQ6esGIio110B+EIL54O3dOvQPs+Kfp+/37S6OTRQK2V/LzRfB
 BA6aJSe5MqtuDBAGaKYEmKU2bcM2gUMdgvfHg45t7ZIepj8APZObWmjdzoilEos+qpp1
 MqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=7slKNQh60cH75T6cRpc524ASdPemcdJLGtdMzrxSYyU=;
 b=ZAoKHP3dmoTEk8CRaAzD6wGRbtAlkwsDSfCHbv4L7BoJ9rT6Cyn5EuwN8OUsT0u6Zh
 12bcLccbm7m2gztQISqpQr3cXZe2bHULw/4tzKcToaY5+jBhN5BeI/AEamNVR0j6c57c
 6LBv5EcLqGCb4lfuFi+EXvq59NeblD8jDE0t/6+kdsE0ceROoXV6E+5B/s60uG7m823s
 0RPOOC9qNvBR0704BNpFvpj65WYVF5JUh/b8Fd/mTrpevjOitMwTav3kvwf1wXEgy68e
 Lkrm9bmr2PdIsEvHwYJhz9xHbz45ct1QsW3nXLP69JghhJy/VoT2CwDNrq9LPeTVxTOI
 6VQA==
X-Gm-Message-State: ACrzQf2LMc51Exrm9EnjMDqMqTndVon6ge8s7TJvGyBUDYTctYQVvYtJ
 HwIyvOArIYwc0kEFH3vckx0nsA==
X-Google-Smtp-Source: AMsMyM74Lo3/SJUxoYla08JLCU/g5bhtWWnSLD+31ZWhtxJwgkE+9Vc+9/OUSstjZkqFaNSdWOVI5w==
X-Received: by 2002:a2e:bc11:0:b0:26c:565:12f6 with SMTP id
 b17-20020a2ebc11000000b0026c056512f6mr2423362ljf.91.1663924891762; 
 Fri, 23 Sep 2022 02:21:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 bg33-20020a05651c0ba100b00261beb471d1sm1284238ljb.121.2022.09.23.02.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 02:21:31 -0700 (PDT)
Message-ID: <5145d4db-65bf-971d-84cd-73c222311cd3@linaro.org>
Date: Fri, 23 Sep 2022 11:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20220913074639.31932-1-alexandre.torgue@foss.st.com>
 <9b711a9e-9e63-b69e-fabf-e05c11f145a6@linaro.org>
 <c21b9c95-ae35-fd7e-9e8e-6926703725b4@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c21b9c95-ae35-fd7e-9e8e-6926703725b4@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: stm32: add missing
 entries for gpio subnodes
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

On 23/09/2022 10:29, Alexandre TORGUE wrote:
> Hi Krzysztof
> 
> On 9/19/22 13:32, Krzysztof Kozlowski wrote:
>> On 13/09/2022 09:46, Alexandre Torgue wrote:
>>> Add "interrupt-controller" and gpio-line-names to gpio subnodes in order to
>>> fix dtb validation.
>>
>> Rebase your patch on recent Linux kernel and use get_maintainers.pl.
> 
> I did it on 6.0-rc5 but yes I used your kernel.org address instead of 
> linaro ones. Sorry.
> 
>>
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
>>> index d35dcc4f0242..92582cccbb1b 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
>>> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
>>> @@ -65,6 +65,10 @@ patternProperties:
>>>         '#gpio-cells':
>>>           const: 2
>>>   
>>> +      interrupt-controller: true
>>> +      '#interrupt-cells':
>>> +        const: 2
>>> +
>>>         reg:
>>>           maxItems: 1
>>>         clocks:
>>> @@ -80,6 +84,8 @@ patternProperties:
>>>           minimum: 1
>>>           maximum: 16
>>>   
>>> +      gpio-line-names: true
>>
>> maxItems?
> 
> Generic question, Is it mandatory to add maxItems information for all 
> entries ?

It's not mandatory for all. For some it is recommended, for some it does
not make sense. Here it's quite easy to add and it will validate the
entry. Any reason not to add it?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
