Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9656B6977FA
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 500C4C6B45A;
	Wed, 15 Feb 2023 08:18:50 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9017EC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Feb 2023 00:34:28 +0000 (UTC)
Received: from [192.168.1.90] (unknown [86.120.32.152])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 402C0660217D;
 Wed, 15 Feb 2023 00:34:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676421268;
 bh=GPRpB7l0KFvDAe90l47jGxlxu/5Kcdt9J/hi24/5C7w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KGwXRBM+CqsY8WuVEfFGb/3XE6k5Po4N/V7S5ZYtvlN9vFIQGjvcSa80xB+QIKeNu
 nLP/oA1H5uIjgN/mRBN1QDxHG+RER1Q/j6jnvPPM6DdDMLZN8ieUtg3ARbQ8XGAKdQ
 DuYxDMbfPlM5EsnNFnlIWZ7oQ4xKlwvvcxGsbJWrclFzyrD/zP7icr+xtrhCCBnY/A
 Mi+ycV2kn42zsBBiGOr9OvgoXz6x2i0TQIfF0KdM4BO7RRYVK52qEsvnin9rSNKyn7
 iXTQk09k1+rOU5CDn28q1vB64m62J9RTYcCCVFOLohT2yv+B+1K8P/TjbJktfwRRYX
 B5LfeJ39Hm8Ow==
Message-ID: <586971af-2d78-456d-a605-6c7b2aefda91@collabora.com>
Date: Wed, 15 Feb 2023 02:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
 <Y+e74UIV/Td91lKB@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <Y+e74UIV/Td91lKB@lunn.ch>
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:41 +0000
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

On 2/11/23 18:01, Andrew Lunn wrote:
>> +  starfive,gtxclk-dlychain:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: GTX clock delay chain setting
> 
> Please could you add more details to this. Is this controlling the
> RGMII delays? 0ns or 2ns?

This is what gets written to JH7100_SYSMAIN_REGISTER49 and it's 
currently set to 4 in patch 12/12. As already mentioned, I don't have 
the register information in the datasheet, but I'll update this as soon 
as we get some details.

>> +    gmac: ethernet@10020000 {
>> +      compatible = "starfive,jh7100-dwmac", "snps,dwmac";
>> +      reg = <0x0 0x10020000 0x0 0x10000>;
>> +      clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
>> +               <&clkgen JH7100_CLK_GMAC_AHB>,
>> +               <&clkgen JH7100_CLK_GMAC_PTP_REF>,
>> +               <&clkgen JH7100_CLK_GMAC_GTX>,
>> +               <&clkgen JH7100_CLK_GMAC_TX_INV>;
>> +      clock-names = "stmmaceth", "pclk", "ptp_ref", "gtxc", "tx";
>> +      resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
>> +      reset-names = "ahb";
>> +      interrupts = <6>, <7>;
>> +      interrupt-names = "macirq", "eth_wake_irq";
>> +      max-frame-size = <9000>;
>> +      phy-mode = "rgmii-txid";
> 
> This is unusual. Does your board have a really long RX clock line to
> insert the 2ns delay needed on the RX side?

Just tested with "rgmii" and didn't notice any issues. If I'm not 
missing anything, I'll do the change in the next revision.

>         Andrew

Thanks,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
