Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3F87DC0E3
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Oct 2023 21:02:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B94B8C6B44C;
	Mon, 30 Oct 2023 20:02:45 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AB9CC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 20:02:44 +0000 (UTC)
Received: from [192.168.1.90] (unknown [188.24.143.101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E56A6607393;
 Mon, 30 Oct 2023 20:02:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698696163;
 bh=uO9kOx6FyYOhUQqCre9IC5JYGMe00wfHPt3Z51gKaCw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KMC8RmIq7yyYms1wPJND7cKAylDHwfxmvbG0kAnRHCIBhAdNzjbC5YNsAosIOBVaW
 KDt+6NUawFqs/TozlkoipWSu3hQKjL0n0JIXE4zlPqW/fJt55X9wkC+NsTqKaEzhB4
 iQzUqHzI1A/+cGNCBugC3nhz3o13Ms8geoOpXkPmSUkGku2RaxmqirWtYnabCAtCE2
 BuI6e8+d3jTVlv22YZjXNxLOU9GAIog9TmkcHhrKVuYI4NCXf3n6X+X7dppOUxvN5l
 vMS5suy4PyZPRVoYFtH6/Nm1S3PxuhpIEmE1F9JrU26ELv+qtx28N9igxBTlmMRpOq
 yZQgG+niCuAaA==
Message-ID: <c47d2730-cbb4-43d2-aa51-ce439d67eabf@collabora.com>
Date: Mon, 30 Oct 2023 22:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <35556392-3b9a-4997-b482-082dc2f9121f@linaro.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <35556392-3b9a-4997-b482-082dc2f9121f@linaro.org>
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

On 10/30/23 09:30, Krzysztof Kozlowski wrote:
> On 29/10/2023 23:15, Cristian Ciocaltea wrote:
>> On 10/29/23 13:24, Krzysztof Kozlowski wrote:
>>> On 29/10/2023 05:27, Cristian Ciocaltea wrote:
>>>> The Synopsys DesignWare MAC found on StarFive JH7100 SoC is quite
>>>> similar to the newer JH7110, but it requires only two interrupts and a
>>>> single reset line.
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>>>>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 74 +++++++++++++------
>>>>  2 files changed, 54 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>> index a4d7172ea701..c1380ff1c054 100644
>>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>> @@ -95,6 +95,7 @@ properties:
>>>>          - snps,dwmac-5.20
>>>>          - snps,dwxgmac
>>>>          - snps,dwxgmac-2.10
>>>> +        - starfive,jh7100-dwmac
>>>>          - starfive,jh7110-dwmac
>>>>  
>>>>    reg:
>>>> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>>>> index 44e58755a5a2..70e35a3401f4 100644
>>>> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>>>> @@ -13,10 +13,14 @@ maintainers:
>>>>  
>>>>  properties:
>>>>    compatible:
>>>> -    items:
>>>> -      - enum:
>>>> -          - starfive,jh7110-dwmac
>>>> -      - const: snps,dwmac-5.20
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - const: starfive,jh7100-dwmac
>>>> +          - const: snps,dwmac
>>>> +      - items:
>>>> +          - enum:
>>>> +              - starfive,jh7110-dwmac
>>>> +          - const: snps,dwmac-5.20
>>>
>>> Why do you use different fallback?
>>
>> AFAIK, dwmac-5.20 is currently only used by JH7110.
> 
> What is used by JH7000?

Driver reports "Synopsys ID: 0x37", so it could be 3.70a or 3.710, as
those are the only compatibles available for 3.7x.

It's worth noting the driver does not rely on the compatibles for
implementing version specific logic, as it gets the IDs directly from
chip registers.

The usage of generic snps,dwmac fallback was borrowed from downstream code.

Regards,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
