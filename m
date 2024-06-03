Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 795888D84FF
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 16:30:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01FB7C71292;
	Mon,  3 Jun 2024 14:30:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 985D5C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 14:30:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1754387ECD;
 Mon,  3 Jun 2024 16:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717425007;
 bh=tS16nMscNeuJBS5c0fzS669yLH9RtEi4tcYfyXkUhuo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SDMgS2UVdOI8UvPt8wogrk8xp1A3xjV8ZOsZUD1gY28a8Ya1HY55XyZcmVeX6X+Cm
 ROCnzlw9Fp4qyi/4wW2rlEzq8ZlRSms9GkU9Cr9FfJjFYLfDseOmsEMUOkxx6z2r24
 SIfotgjkAuf+3cP7a7wUlyoZSfWJe6PyNbGijmIsguRB3PQPMAqNaYnu88jmnxgDNs
 sHbmIBytATd4WaV5abPrbDi4sJGG8YrPrSStAMs/GJJakkxcQU6KUTbbSnON1mU/P5
 LNyVnEu7Xpz0vcuzYmXQ6w/Ob34Do32T2mc/dYo3kco8LauQ/TYoI6G7GjkQXqw4fq
 bQnh5hf++mA3g==
Message-ID: <a992ecc9-bbb7-41af-9a0a-ff63a55d1652@denx.de>
Date: Mon, 3 Jun 2024 15:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240603092757.71902-1-christophe.roullier@foss.st.com>
 <20240603092757.71902-8-christophe.roullier@foss.st.com>
 <d5ce5037-7b77-42bc-8551-2165b7ed668f@prevas.dk>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <d5ce5037-7b77-42bc-8551-2165b7ed668f@prevas.dk>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 07/11] net: ethernet: stmmac: add
 management of stm32mp13 for stm32
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

On 6/3/24 1:30 PM, Rasmus Villemoes wrote:
> On 03/06/2024 11.27, Christophe Roullier wrote:
> 
>> @@ -259,13 +268,17 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
>>   
>>   	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
>>   
>> +	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
>> +	val <<= ffs(dwmac->mode_mask) - ffs(SYSCFG_MP1_ETH_MASK);
>> +
>>   	/* Need to update PMCCLRR (clear register) */
>> -	regmap_write(dwmac->regmap, reg + SYSCFG_PMCCLRR_OFFSET,
>> -		     dwmac->ops->syscfg_eth_mask);
>> +	regmap_write(dwmac->regmap, dwmac->ops->syscfg_clr_off,
>> +		     dwmac->mode_mask);
>>   
>>   	/* Update PMCSETR (set register) */
>>   	return regmap_update_bits(dwmac->regmap, reg,
>> -				 dwmac->ops->syscfg_eth_mask, val);
>> +				 dwmac->mode_mask, val);
>>   }
>>   
>>   static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
> 
> This hunk is broken, and makes the patch not apply:
> 
> Applying: net: ethernet: stmmac: add management of stm32mp13 for stm32
> error: corrupt patch at line 70
> 
> The -259,13 seems correct, and the net lines added by previous hunks is
> indeed +9, but this hunk only adds three more lines than it removes, not
> four, so the +268,17 should have been +268,16.
> 
> Have you manually edited this patch before sending? If so, please don't
> do that, it makes people waste a lot of time figuring out what is wrong.
> 
> Also, please include a base-id in the cover letter so one knows what it
> applies to.

Just out of curiosity, I know one can generate cover letter from branch 
description with git branch --edit-description and git format-patch 
--cover-from-description= , but is there something to automatically fill 
in the merge base (I assume that's what you want) ?

Or are you looking for git send-email --subject-prefix="net-next,PATCH" 
to fill in the net/net-next subject prefix ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
