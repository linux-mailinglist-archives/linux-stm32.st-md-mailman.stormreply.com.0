Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B236B69993E
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Feb 2023 16:51:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46897C6A5FB;
	Thu, 16 Feb 2023 15:51:44 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DA8AC6A5EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Feb 2023 15:51:42 +0000 (UTC)
Received: from [192.168.1.90] (unknown [86.120.32.152])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8AAD166021A3;
 Thu, 16 Feb 2023 15:51:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676562701;
 bh=zKMiYpoes0iudILSJDimdQN0K8gtppZKMtn1e8Ml7qQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lTNf0P4pZlesM+9raKdOYwM2EIJpVkRHpwIIO8a2Cjrd/LXYN/OEe/L0vvTwUfTE3
 +/9dxkFlDpw1XTHKekO6/iGGbTjg+bnsQSSCVvjiEoLWcZ8FutfQgtMKa/qs7sWwOV
 C7XrnSpFp7rl/XhJQo0KqC+IE8Xh5dZbjHmL/NtmBzRXEbaRyue3LFhzO/V90lo5rs
 UPd+QgjfnkooxOCslc3R24PGpgHx/vuT0pCXO5xHbZgX/q2tQVcS21F3c4W0aSL64E
 NWEOifSRVOKOpZfEH2sW+bPlT4Zxh+KJ8DBRTHxi3meSQDsF+gQ8UGcDzoUU92ga00
 lw7j+obymckFg==
Message-ID: <cfa0f980-4bb6-4419-909c-3fce697cf8f9@collabora.com>
Date: Thu, 16 Feb 2023 17:51:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
 <Y+e74UIV/Td91lKB@lunn.ch>
 <586971af-2d78-456d-a605-6c7b2aefda91@collabora.com>
 <Y+zXv90rGfQupjPP@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <Y+zXv90rGfQupjPP@lunn.ch>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 07/12] dt-bindings: net: Add StarFive
	JH7100 SoC
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 2/15/23 15:01, Andrew Lunn wrote:
> On Wed, Feb 15, 2023 at 02:34:23AM +0200, Cristian Ciocaltea wrote:
>> On 2/11/23 18:01, Andrew Lunn wrote:
>>>> +  starfive,gtxclk-dlychain:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: GTX clock delay chain setting
>>>
>>> Please could you add more details to this. Is this controlling the
>>> RGMII delays? 0ns or 2ns?
>>
>> This is what gets written to JH7100_SYSMAIN_REGISTER49 and it's currently
>> set to 4 in patch 12/12. As already mentioned, I don't have the register
>> information in the datasheet, but I'll update this as soon as we get some
>> details.
> 
> I have seen what happens to this value, but i have no idea what it
> actually means. And without knowing what it means, i cannot say if it
> is being used correctly or not. And it could be related to the next
> part of my comment...
> 
>>
>>>> +    gmac: ethernet@10020000 {
>>>> +      compatible = "starfive,jh7100-dwmac", "snps,dwmac";
>>>> +      reg = <0x0 0x10020000 0x0 0x10000>;
>>>> +      clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
>>>> +               <&clkgen JH7100_CLK_GMAC_AHB>,
>>>> +               <&clkgen JH7100_CLK_GMAC_PTP_REF>,
>>>> +               <&clkgen JH7100_CLK_GMAC_GTX>,
>>>> +               <&clkgen JH7100_CLK_GMAC_TX_INV>;
>>>> +      clock-names = "stmmaceth", "pclk", "ptp_ref", "gtxc", "tx";
>>>> +      resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
>>>> +      reset-names = "ahb";
>>>> +      interrupts = <6>, <7>;
>>>> +      interrupt-names = "macirq", "eth_wake_irq";
>>>> +      max-frame-size = <9000>;
>>>> +      phy-mode = "rgmii-txid";
>>>
>>> This is unusual. Does your board have a really long RX clock line to
>>> insert the 2ns delay needed on the RX side?
>>
>> Just tested with "rgmii" and didn't notice any issues. If I'm not missing
>> anything, I'll do the change in the next revision.
> 
> rgmii-id is generally the value to be used. That indicates the board
> needs 2ns delays adding by something, either the MAC or the PHY. And
> then i always recommend the MAC driver does nothing, pass the value to
> the PHY and let the PHY add the delays.
> 
> So try both rgmii and rgmii-id and do a lot of bi directional
> transfers. Then look at the reported ethernet frame check sum error
> counts, both local and the link peer. I would expect one setting gives
> you lots of errors, and the other works much better.

I gave "rgmii-id" a try and it's not usable, I get too many errors. So 
"rgmii" should be the right choice here.

Thanks,
Cristian

>      Andrew
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
