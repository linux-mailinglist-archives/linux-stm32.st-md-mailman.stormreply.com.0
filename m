Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CCF908CDF
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 16:00:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48623C78010;
	Fri, 14 Jun 2024 14:00:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D8B7C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 14:00:42 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5FC1B889E9;
 Fri, 14 Jun 2024 16:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718373640;
 bh=oUw90xGCTf/R7dw6Q3/eRNoQsVdHr+6eZVmO95Kclv0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YV0Uon9aW17RuCD2I4tLNs4DUZh687c3Uzp0pSqI0WjWtGi3wy/YSfHzpAllZ8CJz
 JtkJAsx53o2sX9XjurbO82uIhR/kzhnYuhD7d7iebIry7SBe+Dp1VQe8L43ScrhPMK
 kaCqr/zf0OxMR0gf1uyTc38MKAf53kOyHA17vPwJLlR1CI4QG2OAKm0k+la4y6nshX
 x2TlhJMvLdupYil3eY9sD9Phf2/UCVhetIPFnc9QLbBNpzxWQK45xZe4zMckCjP1Lp
 N5ngCLXil0/7/DcqEYSWbQNvpTTZ5Dd1jafnPFnSkIiiLB6G6RAkPjYPtjCgxoHMKG
 1Usv9sWiKenVQ==
Message-ID: <4c2f1bac-4957-4814-bf62-816340bd9ff6@denx.de>
Date: Fri, 14 Jun 2024 15:58:33 +0200
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
References: <20240614130812.72425-1-christophe.roullier@foss.st.com>
 <20240614130812.72425-3-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240614130812.72425-3-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH 2/2] net: stmmac: dwmac-stm32: stm32: add management of
 stm32mp25 for stm32
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

On 6/14/24 3:08 PM, Christophe Roullier wrote:

[...]

> +static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
> +	u32 reg = dwmac->mode_reg;
> +	int val = 0;
> +
> +	switch (plat_dat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		break;

dwmac->enable_eth_ck does not apply to MII mode ? Why ?

> +	case PHY_INTERFACE_MODE_GMII:
> +		if (dwmac->enable_eth_ck)
> +			val |= SYSCFG_ETHCR_ETH_CLK_SEL;
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		val = SYSCFG_ETHCR_ETH_SEL_RMII;
> +		if (dwmac->enable_eth_ck)
> +			val |= SYSCFG_ETHCR_ETH_REF_CLK_SEL;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		val = SYSCFG_ETHCR_ETH_SEL_RGMII;
> +		if (dwmac->enable_eth_ck)
> +			val |= SYSCFG_ETHCR_ETH_CLK_SEL;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "Mode %s not supported",
> +			phy_modes(plat_dat->mac_interface));
> +		/* Do not manage others interfaces */
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
> +
> +	/*  select PTP (IEEE1588) clock selection from RCC (ck_ker_ethxptp) */

Drop extra leading space.
Sentence starts with capital letter.

> +	val |= SYSCFG_ETHCR_ETH_PTP_CLK_SEL;
> +
> +	/* Update ETHCR (set register) */
> +	return regmap_update_bits(dwmac->regmap, reg,
> +				 SYSCFG_MP2_ETH_MASK, val);
> +}
> +
>   static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
>   {
>   	int ret;
> @@ -292,6 +346,21 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
>   	return stm32mp1_configure_pmcr(plat_dat);
>   }
>   
> +static int stm32mp2_set_mode(struct plat_stmmacenet_data *plat_dat)
> +{
> +	int ret;
> +
> +	ret = stm32mp1_select_ethck_external(plat_dat);
> +	if (ret)
> +		return ret;
> +
> +	ret = stm32mp1_validate_ethck_rate(plat_dat);
> +	if (ret)
> +		return ret;


Is it necessary to duplicate this entire function instead of some:

if (is_mp2)
   return stm32mp2_configure_syscfg(plat_dat);
else
   return stm32mp1_configure_syscfg(plat_dat);

?

> +	return stm32mp2_configure_syscfg(plat_dat);
> +}
> +
>   static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
>   {
>   	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
> @@ -348,12 +417,6 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>   		return PTR_ERR(dwmac->clk_rx);
>   	}
>   
> -	if (dwmac->ops->parse_data) {
> -		err = dwmac->ops->parse_data(dwmac, dev);
> -		if (err)
> -			return err;
> -	}
> -
>   	/* Get mode register */
>   	dwmac->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscon");
>   	if (IS_ERR(dwmac->regmap))
> @@ -365,20 +428,14 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>   		return err;
>   	}
>   
> -	dwmac->mode_mask = SYSCFG_MP1_ETH_MASK;
> -	err = of_property_read_u32_index(np, "st,syscon", 2, &dwmac->mode_mask);
> -	if (err) {
> -		if (dwmac->ops->is_mp13)
> -			dev_err(dev, "Sysconfig register mask must be set (%d)\n", err);
> -		else
> -			dev_dbg(dev, "Warning sysconfig register mask not set\n");
> -	}
> +	if (dwmac->ops->parse_data)
> +		err = dwmac->ops->parse_data(dwmac, dev);

Why is this change here ? What is the purpose ?
This should be documented in commit message too.

The indirect call is not necessary either, simply do

if (is_mp2)
   return err;

... do mp15/13 stuff here ...

return err;

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
