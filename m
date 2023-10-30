Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7297DB452
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Oct 2023 08:30:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14D73C6B44B;
	Mon, 30 Oct 2023 07:30:55 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1063C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 07:30:53 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-53f9af41444so6942971a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 00:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698651053; x=1699255853;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dKsyf8LXjrxhnDHkoYar39IjV7I2cF7I3rz9k9N3k64=;
 b=pDD+3Fpg4l4oqz1x7ODAjdNF4cXKpMRSrOVPMgo1mcS3ZMbsDh9BtqDoGx5UAeSH9G
 2I3XtkTmLl7n0GRwWfRzuurWe9L+uypBHqR+1dnRigyylfJ7KHdk+I9LQNWG760oArmt
 Lzq40+ca8NzpHSi9p3Z/fsJSKVCbItag9aobFio6YM0u9cXk0bgXDQ7kXQB35DcRYBjx
 azWScfsZ8uID04kqxySuZ5ut0EeD5kxN6kwyrQKOzH+/u22lx8o2v4T8W+V+PghF2vZI
 H9BDa/aawwkQ66psHeO4IzsYBSLZC/XEqYYzLkUXIrH+28aXGHeCvD5CJXiqq+pk4B1V
 lKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698651053; x=1699255853;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dKsyf8LXjrxhnDHkoYar39IjV7I2cF7I3rz9k9N3k64=;
 b=UvN8Lybj7A3FetUG5rvuUD6KujrZnFI8l3xGwDPZRP9v034anJWk5lO5n9dER6Vml2
 3C9oCJIeXe7AdhK/uvJes71Cne1S7r9j84woMR9nFKusyATHgeG0WGOCAr4BT60kqjQ0
 w6cz3VOSdxN38uKjN51XmNOkfy33pL8W9n5+pS4lAPQSon8RvruT+FqokBtpxyLbLsvB
 m4oVNnAELrxvUQ2F+WtabbkkcvtQkaDtehXaikTSt6ciwUvool5fSugwyIZ5qsvapTq1
 BNb3qJmbQY7f3lzbG1nfboIOV/9354PeOmGY1gRKJbfVBNmc2jIcLK1xsuRZwNKK08NA
 Xp9Q==
X-Gm-Message-State: AOJu0YxEoiBuJ8KRteema2T74fPmhVY7ktCg8b4MA6r3ktIOVjMvDsnL
 qUYDOHFh0Bq+bats+ns/RtBw/g==
X-Google-Smtp-Source: AGHT+IFbW3c/ycdFODwV1d2F+eIuDrPKoVPwJFEooXEALeleQB0leVMW+7i7JJjX0HH390RyocEIAg==
X-Received: by 2002:a50:ccc1:0:b0:540:16d0:3332 with SMTP id
 b1-20020a50ccc1000000b0054016d03332mr7243263edj.20.1698651053222; 
 Mon, 30 Oct 2023 00:30:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
 by smtp.gmail.com with ESMTPSA id
 eg25-20020a056402289900b0053dab756073sm5579901edb.84.2023.10.30.00.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 00:30:52 -0700 (PDT)
Message-ID: <35556392-3b9a-4997-b482-082dc2f9121f@linaro.org>
Date: Mon, 30 Oct 2023 08:30:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-5-cristian.ciocaltea@collabora.com>
 <e8f18634-7187-4e5a-a494-329c7c602fd2@linaro.org>
 <e86247b3-a6f4-44cf-90c4-583d850f6dd8@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <e86247b3-a6f4-44cf-90c4-583d850f6dd8@collabora.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 04/12] dt-bindings: net: starfive,
 jh7110-dwmac: Add JH7100 SoC compatible
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

On 29/10/2023 23:15, Cristian Ciocaltea wrote:
> On 10/29/23 13:24, Krzysztof Kozlowski wrote:
>> On 29/10/2023 05:27, Cristian Ciocaltea wrote:
>>> The Synopsys DesignWare MAC found on StarFive JH7100 SoC is quite
>>> similar to the newer JH7110, but it requires only two interrupts and a
>>> single reset line.
>>>
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>> ---
>>>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>>>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 74 +++++++++++++------
>>>  2 files changed, 54 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> index a4d7172ea701..c1380ff1c054 100644
>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> @@ -95,6 +95,7 @@ properties:
>>>          - snps,dwmac-5.20
>>>          - snps,dwxgmac
>>>          - snps,dwxgmac-2.10
>>> +        - starfive,jh7100-dwmac
>>>          - starfive,jh7110-dwmac
>>>  
>>>    reg:
>>> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>>> index 44e58755a5a2..70e35a3401f4 100644
>>> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>>> @@ -13,10 +13,14 @@ maintainers:
>>>  
>>>  properties:
>>>    compatible:
>>> -    items:
>>> -      - enum:
>>> -          - starfive,jh7110-dwmac
>>> -      - const: snps,dwmac-5.20
>>> +    oneOf:
>>> +      - items:
>>> +          - const: starfive,jh7100-dwmac
>>> +          - const: snps,dwmac
>>> +      - items:
>>> +          - enum:
>>> +              - starfive,jh7110-dwmac
>>> +          - const: snps,dwmac-5.20
>>
>> Why do you use different fallback?
> 
> AFAIK, dwmac-5.20 is currently only used by JH7110.

What is used by JH7000?

> 
>>>  
>>>    reg:
>>>      maxItems: 1
>>> @@ -37,23 +41,6 @@ properties:
>>>        - const: tx
>>>        - const: gtx
>>>  
>>> -  interrupts:
>>> -    minItems: 3
>>> -    maxItems: 3
>>> -
>>> -  interrupt-names:
>>> -    minItems: 3
>>> -    maxItems: 3
>>> -
>>> -  resets:
>>> -    minItems: 2
>>> -    maxItems: 2
>>
>> You just changed it in previous patches... So the previous code allowing
>> one item was correct?
> 
> I mentioned the possible use-cases in the previous email. So yes, JH7110
> requires 2 resets, while JH7100 just one.


Your previous patch does not make sense now...

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
