Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8052C90041A
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 14:55:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EDB8C712A2;
	Fri,  7 Jun 2024 12:55:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45027C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 12:54:59 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0BFDD87FFB;
 Fri,  7 Jun 2024 14:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717764899;
 bh=dLyJBZqHf76+ChB4CcC6G4HDf+CMmtyIIIHG7RFXt4c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WPcE9VzqTN0zrI4noJOx9HQUp51f4aUcGe7g3aaP8cl9TMlMsIRkST9g5asihJjm3
 k22Xgt1EgJy9/K1EMt5BUiZZXODBq1WcQ3YOfntVVCyn02I/kqftREQV4m4myWjIm+
 iS69pw41jRRnt9Mw/PB9HQYCOYf+jLk+LUdjyDOZBt07pFWyUc5FqVNKgBPmoEAaIq
 M8+7dWf+kWA9lGOBZe7aebpdfB4aLb9ahFnISLOgGQDITXwZnCxA5VD/4mogNYVjsp
 xPypTq87yVAYo7xPfDBsGJ9iA4cF6NKz1DhtPd+ensSXMddFcNVbctBwC3lvQ51m7m
 jlYH805gKeAQw==
Message-ID: <6f44537a-3d60-46f5-a159-919cc2a144ec@denx.de>
Date: Fri, 7 Jun 2024 14:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Roullier <christophe.roullier@foss.st.com>,
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
References: <20240607095754.265105-1-christophe.roullier@foss.st.com>
 <20240607095754.265105-9-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240607095754.265105-9-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 08/12] net: stmmac: dwmac-stm32: add
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

On 6/7/24 11:57 AM, Christophe Roullier wrote:

[...]

> @@ -224,11 +225,18 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
>   {
>   	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
>   	u32 reg = dwmac->mode_reg;
> -	int val;
> +	int val = 0;

Is the initialization really needed ? It seems the switch-case below 
does always initialize $val .

>   	switch (plat_dat->mac_interface) {
>   	case PHY_INTERFACE_MODE_MII:
> -		val = SYSCFG_PMCR_ETH_SEL_MII;
> +		/*
> +		 * STM32MP15xx supports both MII and GMII, STM32MP13xx MII only.
> +		 * SYSCFG_PMCSETR ETH_SELMII is present only on STM32MP15xx and
> +		 * acts as a selector between 0:GMII and 1:MII. As STM32MP13xx
> +		 * supports only MII, ETH_SELMII is not present.
> +		 */
> +		if (!dwmac->ops->is_mp13)  /* Select MII mode on STM32MP15xx */
> +			val |= SYSCFG_PMCR_ETH_SEL_MII;
>   		break;
>   	case PHY_INTERFACE_MODE_GMII:
>   		val = SYSCFG_PMCR_ETH_SEL_GMII;

[...]

This way of adding MP13 support definitely looks much better.

Also, split the series, drivers/ stuff for netdev (and make sure to 
include the net-next patch prefix , git send-email 
--subject-prefix="net-next,PATCH") , DTs for linux-arm-kernel , config 
patch also for linux-arm-kernel .
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
