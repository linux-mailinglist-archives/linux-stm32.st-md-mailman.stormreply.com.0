Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096D8FBA50
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 19:27:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B104BC71293;
	Tue,  4 Jun 2024 17:27:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C15DC71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 17:27:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9C08688481;
 Tue,  4 Jun 2024 19:27:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717522032;
 bh=3NtwaV0lVIbVvfefAVmPkJRULKlNZkvRewz4sAE2MzQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fRYQaIBkivP15jB/9X0FMmdKthdY+zvzdWW92V4p6yGsqzOGdWqpb9FRfQKpDSLAd
 Y51mmCbzifnmHvC0MvNGQ6pmx1jLWIQNuclUNV68E+1Zq1YuNPBX8AFccRjsAwREV9
 MWLZIRuIJPS5m4BtikgjEzKEPzJe9lSq+N0nc74/+civjx6Tqv2Junym+QPeZuzX5+
 cNLw5XdO80KCpfw8zO5E13IvyO+poL6K3ptYTQmKt3WokfCYL4rCC9NwiJx0m4RoZz
 jB1ucAFMzuLhRdH2aJy0/hT13GDA5GwizjfWubH/taAzqnuZlYWM/jQlUZx6GIwrwd
 6lWUekjtvuF1g==
Message-ID: <3c40352b-ad69-4847-b665-e7b2df86a684@denx.de>
Date: Tue, 4 Jun 2024 19:05:59 +0200
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
References: <20240604143502.154463-1-christophe.roullier@foss.st.com>
 <20240604143502.154463-8-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240604143502.154463-8-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 07/11] net: ethernet: stmmac: add
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

On 6/4/24 4:34 PM, Christophe Roullier wrote:
> Add Ethernet support for STM32MP13.
> STM32MP13 is STM32 SOC with 2 GMACs instances.
> GMAC IP version is SNPS 4.20.
> GMAC IP configure with 1 RX and 1 TX queue.
> DMA HW capability register supported
> RX Checksum Offload Engine supported
> TX Checksum insertion supported
> Wake-Up On Lan supported
> TSO supported
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>   .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 50 +++++++++++++++----
>   1 file changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> index bed2be129b2d2..e59f8a845e01e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> @@ -84,12 +84,14 @@ struct stm32_dwmac {
>   	struct clk *clk_eth_ck;
>   	struct clk *clk_ethstp;
>   	struct clk *syscfg_clk;
> +	bool is_mp13;
>   	int ext_phyclk;
>   	int enable_eth_ck;
>   	int eth_clk_sel_reg;
>   	int eth_ref_clk_sel_reg;
>   	int irq_pwr_wakeup;
>   	u32 mode_reg;		 /* MAC glue-logic mode register */
> +	u32 mode_mask;
>   	struct regmap *regmap;
>   	u32 speed;
>   	const struct stm32_ops *ops;
> @@ -102,8 +104,8 @@ struct stm32_ops {
>   	void (*resume)(struct stm32_dwmac *dwmac);
>   	int (*parse_data)(struct stm32_dwmac *dwmac,
>   			  struct device *dev);
> -	u32 syscfg_eth_mask;
>   	bool clk_rx_enable_in_suspend;
> +	u32 syscfg_clr_off;
>   };
>   
>   static int stm32_dwmac_clk_enable(struct stm32_dwmac *dwmac, bool resume)
> @@ -227,7 +229,14 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
>   
>   	switch (plat_dat->mac_interface) {
>   	case PHY_INTERFACE_MODE_MII:
> -		val = SYSCFG_PMCR_ETH_SEL_MII;
> +		/*
> +		 * STM32MP15xx supports both MII and GMII, STM32MP13xx MII only.
> +		 * SYSCFG_PMCSETR ETH_SELMII is present only on STM32MP15xx and
> +		 * acts as a selector between 0:GMII and 1:MII. As STM32MP13xx
> +		 * supports only MII, ETH_SELMII is not present.
> +		 */
> +		if (!dwmac->is_mp13)	/* Select MII mode on STM32MP15xx */
> +			val |= SYSCFG_PMCR_ETH_SEL_MII;
>   		break;
>   	case PHY_INTERFACE_MODE_GMII:
>   		val = SYSCFG_PMCR_ETH_SEL_GMII;
> @@ -256,13 +265,16 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
>   
>   	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
>   
> +	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
> +	val <<= ffs(dwmac->mode_mask) - ffs(SYSCFG_MP1_ETH_MASK);
> +
>   	/* Need to update PMCCLRR (clear register) */
> -	regmap_write(dwmac->regmap, reg + SYSCFG_PMCCLRR_OFFSET,
> -		     dwmac->ops->syscfg_eth_mask);
> +	regmap_write(dwmac->regmap, dwmac->ops->syscfg_clr_off,
> +		     dwmac->mode_mask);
>   
>   	/* Update PMCSETR (set register) */
>   	return regmap_update_bits(dwmac->regmap, reg,
> -				 dwmac->ops->syscfg_eth_mask, val);
> +				 dwmac->mode_mask, val);
>   }
>   
>   static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
> @@ -303,7 +315,7 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
>   	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
>   
>   	return regmap_update_bits(dwmac->regmap, reg,
> -				 dwmac->ops->syscfg_eth_mask, val << 23);
> +				 SYSCFG_MCU_ETH_MASK, val << 23);
>   }
>   
>   static void stm32_dwmac_clk_disable(struct stm32_dwmac *dwmac, bool suspend)
> @@ -348,8 +360,15 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>   		return PTR_ERR(dwmac->regmap);
>   
>   	err = of_property_read_u32_index(np, "st,syscon", 1, &dwmac->mode_reg);
> -	if (err)
> +	if (err) {
>   		dev_err(dev, "Can't get sysconfig mode offset (%d)\n", err);
> +		return err;
> +	}
> +
> +	dwmac->mode_mask = SYSCFG_MP1_ETH_MASK;
> +	err = of_property_read_u32_index(np, "st,syscon", 2, &dwmac->mode_mask);
> +	if (err)
> +		pr_debug("Warning sysconfig register mask not set\n");

I _think_ you need to left-shift the mode mask by 8 for STM32MP13xx 
second GMAC somewhere in here, right ?

>   	return err;
>   }
> @@ -361,6 +380,8 @@ static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
>   	struct device_node *np = dev->of_node;
>   	int err = 0;
>   
> +	dwmac->is_mp13 = of_device_is_compatible(np, "st,stm32mp13-dwmac");

You could make is_mp13 part of struct stm32_ops {} just like 
syscfg_clr_off is part of struct stm32_ops {} .

>   	/* Ethernet PHY have no crystal */
>   	dwmac->ext_phyclk = of_property_read_bool(np, "st,ext-phyclk");
>   
> @@ -540,8 +561,7 @@ static SIMPLE_DEV_PM_OPS(stm32_dwmac_pm_ops,
>   	stm32_dwmac_suspend, stm32_dwmac_resume);
>   
>   static struct stm32_ops stm32mcu_dwmac_data = {
> -	.set_mode = stm32mcu_set_mode,
> -	.syscfg_eth_mask = SYSCFG_MCU_ETH_MASK
> +	.set_mode = stm32mcu_set_mode

It is not necessary to remove the trailing comma ','

>   };
>   
>   static struct stm32_ops stm32mp1_dwmac_data = {
> @@ -549,13 +569,23 @@ static struct stm32_ops stm32mp1_dwmac_data = {
>   	.suspend = stm32mp1_suspend,
>   	.resume = stm32mp1_resume,
>   	.parse_data = stm32mp1_parse_data,
> -	.syscfg_eth_mask = SYSCFG_MP1_ETH_MASK,
> +	.syscfg_clr_off = 0x44,
> +	.clk_rx_enable_in_suspend = true
> +};
> +
> +static struct stm32_ops stm32mp13_dwmac_data = {
> +	.set_mode = stm32mp1_set_mode,
> +	.suspend = stm32mp1_suspend,
> +	.resume = stm32mp1_resume,
> +	.parse_data = stm32mp1_parse_data,
> +	.syscfg_clr_off = 0x08,
>   	.clk_rx_enable_in_suspend = true
>   };
>   
>   static const struct of_device_id stm32_dwmac_match[] = {
>   	{ .compatible = "st,stm32-dwmac", .data = &stm32mcu_dwmac_data},
>   	{ .compatible = "st,stm32mp1-dwmac", .data = &stm32mp1_dwmac_data},
> +	{ .compatible = "st,stm32mp13-dwmac", .data = &stm32mp13_dwmac_data},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, stm32_dwmac_match);

This patch definitely looks MUCH better than what this series started 
with, it is much easier to grasp the MP13 specific changes.

You could possibly improve this further and split the 
dwmac->ops->syscfg_eth_mask to dwmac->mode_mask conversion into separate 
preparatory patch (as a 6.5/11 in context of this series), and then add 
the few MP13 changes on top (as 7/11 patch).
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
