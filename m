Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6299A8A94C8
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 10:17:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03BE8C6DD66;
	Thu, 18 Apr 2024 08:17:20 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5CAAC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 08:17:18 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5193363d255so664391e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 01:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713428238; x=1714033038;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wlNNcUScDIGSnpnqgWFU5e+3JX9/1lQWaa8cNUyZpso=;
 b=kJaOyZuDCqivVxvhxMkzScpxN1u6yYjLj3504MyVFBOKIMUZyzYR2D4xHNGLtzA77y
 f4OyNVCeiPHuxcTHR6k1not8xWsaIcMtkWqgX7PmTM4Ob232wENnyhwyPwJ1Cp+jqFNB
 6N+qFsM158NQXhzGMkYKF3UF6VPQbqzGet9rf4KShG7M+O944LR5VNoBCB9IT1zHXB98
 aPUm2a8cy+5oJuQqlkCwjtYFFddTdt1MWgHil8ARGf3EeuwjINg4Ye+fZd9Y21klZncZ
 WfW10KFvC5h/zpndiVFllRibESWtd/NOPrbQ2OIbducEzy1zLuhsZgc38qSxb9iLHgf3
 W41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713428238; x=1714033038;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlNNcUScDIGSnpnqgWFU5e+3JX9/1lQWaa8cNUyZpso=;
 b=V6hLV+V47uYZm/WTAQ2lPSp2pkkRAJrPE2zqaMSADfbWBDqsXsi5sMByuS6iS0WiJN
 vgeAoijybn+V98FMvhtmSf+qxFWjT8Qs5ZkZFhmjrHj/WJ0MRVrORnSh4ToiIgoDwUrn
 apIsTzY0G1LmnNv+tU7S91SBso9MmodiykZpFKODWRoCue7fWza9t4l/RdzCBTvHa1Xv
 Xkgy4+xvoqaTp0TJxZpqezYCUAfixw5zPEOPVXysc1DEZXoy1APBjY2pHCzZZLj3UATT
 jikwaAUJpR5dyVwcUl4rme+UskAx1Zszmp4nn1YtOLz4A83Ui2x7j09k8m68UB0M8yzr
 Z+bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvVfxkRRI7E4/NN4Sa9xMmJ33xk3kL4wbzHW2c70oVAZYcUC3jiQq27nEaSCvh2fX/ahjsIzwiCf2zuQrJU/8Roh4Fkeo2SBI2NpNwXhFRN5k+BXWV/2ao
X-Gm-Message-State: AOJu0YwU7dKDqc1i77KUolHgcqXu59iPVAS43rkXZofYqx8CtzPNsmhp
 EIx3CJ4Ho8/ubFdks9NlEQ1vG94ukcLQqqt2qVobfRn7eJbrte86
X-Google-Smtp-Source: AGHT+IEkl4oQ5eL+FkXyZ/IVZNia6d81ZoKJ3prwLaLO9l0/cT5rMB2dxps5UMONIgom/mkOG7+N7Q==
X-Received: by 2002:ac2:4c38:0:b0:517:61b1:45a6 with SMTP id
 u24-20020ac24c38000000b0051761b145a6mr930338lfq.53.1713428237445; 
 Thu, 18 Apr 2024 01:17:17 -0700 (PDT)
Received: from mobilestation.baikal.int (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a05651236cb00b00515d1dfab34sm144215lfs.81.2024.04.18.01.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 01:17:17 -0700 (PDT)
Date: Thu, 18 Apr 2024 11:17:15 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <peqz2hl6efyu25j26rpt6rqi5ovq4ymjvivfhczihnz4hf7w2o@akaiyvzuqjgo>
References: <20240411143658.1049706-1-christophe.roullier@foss.st.com>
 <20240411143658.1049706-4-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411143658.1049706-4-christophe.roullier@foss.st.com>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/11] net: ethernet: stmmac: rework glue
 to simplify management for next stm32
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

On Thu, Apr 11, 2024 at 04:36:50PM +0200, Christophe Roullier wrote:
> Change glue to be more generic and manage easily next stm32 products.
> The goal of this commit is to have one stm32mp1_set_mode function which
> can manage different STM32 SOC. SOC can have different SYSCFG register
> bitfields. so in pmcsetr we defined the bitfields corresponding to the SOC.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>

[PATCH 03/11] net: ethernet: stmmac: rework glue to simplify management for next stm32

Just use the dwmac-stm32 prefix so you won't need to have the "for
next stm32" clause in all the commits. For instance like this:

[PATCH 03/11] net: stmmac: dwmac-stm32: rework glue to simplify management

the same for the patches 4 to 7.

-Serge(y)


> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 76 +++++++++++++------
>  1 file changed, 51 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> index c92dfc4ecf570..68a02de25ac76 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> @@ -23,10 +23,6 @@
>  
>  #define SYSCFG_MCU_ETH_MASK		BIT(23)
>  #define SYSCFG_MP1_ETH_MASK		GENMASK(23, 16)
> -#define SYSCFG_PMCCLRR_OFFSET		0x40
> -
> -#define SYSCFG_PMCR_ETH_CLK_SEL		BIT(16)
> -#define SYSCFG_PMCR_ETH_REF_CLK_SEL	BIT(17)
>  
>  /* CLOCK feed to PHY*/
>  #define ETH_CK_F_25M	25000000
> @@ -46,9 +42,6 @@
>   * RMII  |   1	 |   0	  |   0	   |  n/a  |
>   *------------------------------------------
>   */
> -#define SYSCFG_PMCR_ETH_SEL_MII		BIT(20)
> -#define SYSCFG_PMCR_ETH_SEL_RGMII	BIT(21)
> -#define SYSCFG_PMCR_ETH_SEL_RMII	BIT(23)
>  #define SYSCFG_PMCR_ETH_SEL_GMII	0
>  #define SYSCFG_MCU_ETH_SEL_MII		0
>  #define SYSCFG_MCU_ETH_SEL_RMII		1
> @@ -90,19 +83,33 @@ struct stm32_dwmac {
>  	int eth_ref_clk_sel_reg;
>  	int irq_pwr_wakeup;
>  	u32 mode_reg;		 /* MAC glue-logic mode register */
> +	u32 mode_mask;
>  	struct regmap *regmap;
>  	u32 speed;
>  	const struct stm32_ops *ops;
>  	struct device *dev;
>  };
>  
> +struct stm32_syscfg_pmcsetr {
> +	u32 eth1_clk_sel;
> +	u32 eth1_ref_clk_sel;
> +	u32 eth1_selmii;
> +	u32 eth1_sel_rgmii;
> +	u32 eth1_sel_rmii;
> +	u32 eth2_clk_sel;
> +	u32 eth2_ref_clk_sel;
> +	u32 eth2_sel_rgmii;
> +	u32 eth2_sel_rmii;
> +};
> +
>  struct stm32_ops {
>  	int (*set_mode)(struct plat_stmmacenet_data *plat_dat);
>  	int (*suspend)(struct stm32_dwmac *dwmac);
>  	void (*resume)(struct stm32_dwmac *dwmac);
>  	int (*parse_data)(struct stm32_dwmac *dwmac,
>  			  struct device *dev);
> -	u32 syscfg_eth_mask;
> +	u32 syscfg_clr_off;
> +	struct stm32_syscfg_pmcsetr pmcsetr;
>  	bool clk_rx_enable_in_suspend;
>  };
>  
> @@ -161,7 +168,7 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
>  {
>  	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
>  	u32 reg = dwmac->mode_reg, clk_rate;
> -	int val;
> +	int val = 0;
>  
>  	clk_rate = clk_get_rate(dwmac->clk_eth_ck);
>  	dwmac->enable_eth_ck = false;
> @@ -169,7 +176,7 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_MII:
>  		if (clk_rate == ETH_CK_F_25M && dwmac->ext_phyclk)
>  			dwmac->enable_eth_ck = true;
> -		val = SYSCFG_PMCR_ETH_SEL_MII;
> +		val = dwmac->ops->pmcsetr.eth1_selmii;
>  		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_MII\n");
>  		break;
>  	case PHY_INTERFACE_MODE_GMII:
> @@ -177,16 +184,17 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
>  		if (clk_rate == ETH_CK_F_25M &&
>  		    (dwmac->eth_clk_sel_reg || dwmac->ext_phyclk)) {
>  			dwmac->enable_eth_ck = true;
> -			val |= SYSCFG_PMCR_ETH_CLK_SEL;
> +			val |= dwmac->ops->pmcsetr.eth1_clk_sel;
>  		}
>  		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_GMII\n");
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		val = SYSCFG_PMCR_ETH_SEL_RMII;
> +		val = dwmac->ops->pmcsetr.eth1_sel_rmii | dwmac->ops->pmcsetr.eth2_sel_rmii;
>  		if ((clk_rate == ETH_CK_F_25M || clk_rate == ETH_CK_F_50M) &&
>  		    (dwmac->eth_ref_clk_sel_reg || dwmac->ext_phyclk)) {
>  			dwmac->enable_eth_ck = true;
> -			val |= SYSCFG_PMCR_ETH_REF_CLK_SEL;
> +			val |= dwmac->ops->pmcsetr.eth1_ref_clk_sel;
> +			val |= dwmac->ops->pmcsetr.eth2_ref_clk_sel;
>  		}
>  		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RMII\n");
>  		break;
> @@ -194,11 +202,12 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
> -		val = SYSCFG_PMCR_ETH_SEL_RGMII;
> +		val = dwmac->ops->pmcsetr.eth1_sel_rgmii | dwmac->ops->pmcsetr.eth2_sel_rgmii;
>  		if ((clk_rate == ETH_CK_F_25M || clk_rate == ETH_CK_F_125M) &&
>  		    (dwmac->eth_clk_sel_reg || dwmac->ext_phyclk)) {
>  			dwmac->enable_eth_ck = true;
> -			val |= SYSCFG_PMCR_ETH_CLK_SEL;
> +			val |= dwmac->ops->pmcsetr.eth1_clk_sel;
> +			val |= dwmac->ops->pmcsetr.eth2_clk_sel;
>  		}
>  		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RGMII\n");
>  		break;
> @@ -210,12 +219,12 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	}
>  
>  	/* Need to update PMCCLRR (clear register) */
> -	regmap_write(dwmac->regmap, reg + SYSCFG_PMCCLRR_OFFSET,
> -		     dwmac->ops->syscfg_eth_mask);
> +	regmap_write(dwmac->regmap, reg + dwmac->ops->syscfg_clr_off,
> +		     dwmac->mode_mask);
>  
>  	/* Update PMCSETR (set register) */
>  	return regmap_update_bits(dwmac->regmap, reg,
> -				 dwmac->ops->syscfg_eth_mask, val);
> +				 dwmac->mode_mask, val);
>  }
>  
>  static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
> @@ -241,7 +250,7 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	}
>  
>  	return regmap_update_bits(dwmac->regmap, reg,
> -				 dwmac->ops->syscfg_eth_mask, val << 23);
> +				 SYSCFG_MCU_ETH_MASK, val << 23);
>  }
>  
>  static void stm32_dwmac_clk_disable(struct stm32_dwmac *dwmac, bool suspend)
> @@ -286,10 +295,17 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>  		return PTR_ERR(dwmac->regmap);
>  
>  	err = of_property_read_u32_index(np, "st,syscon", 1, &dwmac->mode_reg);
> +	if (err) {
> +		dev_err(dev, "Can't get sysconfig register offset (%d)\n", err);
> +		return err;
> +	}
> +
> +	dwmac->mode_mask = SYSCFG_MP1_ETH_MASK;
> +	err = of_property_read_u32_index(np, "st,syscon", 2, &dwmac->mode_mask);
>  	if (err)
> -		dev_err(dev, "Can't get sysconfig mode offset (%d)\n", err);
> +		pr_debug("Warning sysconfig register mask not set\n");
>  
> -	return err;
> +	return 0;
>  }
>  
>  static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
> @@ -478,8 +494,7 @@ static SIMPLE_DEV_PM_OPS(stm32_dwmac_pm_ops,
>  	stm32_dwmac_suspend, stm32_dwmac_resume);
>  
>  static struct stm32_ops stm32mcu_dwmac_data = {
> -	.set_mode = stm32mcu_set_mode,
> -	.syscfg_eth_mask = SYSCFG_MCU_ETH_MASK
> +	.set_mode = stm32mcu_set_mode
>  };
>  
>  static struct stm32_ops stm32mp1_dwmac_data = {
> @@ -487,8 +502,19 @@ static struct stm32_ops stm32mp1_dwmac_data = {
>  	.suspend = stm32mp1_suspend,
>  	.resume = stm32mp1_resume,
>  	.parse_data = stm32mp1_parse_data,
> -	.syscfg_eth_mask = SYSCFG_MP1_ETH_MASK,
> -	.clk_rx_enable_in_suspend = true
> +	.clk_rx_enable_in_suspend = true,
> +	.syscfg_clr_off = 0x44,
> +	.pmcsetr = {
> +		.eth1_clk_sel		= BIT(16),
> +		.eth1_ref_clk_sel	= BIT(17),
> +		.eth1_selmii		= BIT(20),
> +		.eth1_sel_rgmii		= BIT(21),
> +		.eth1_sel_rmii		= BIT(23),
> +		.eth2_clk_sel		= 0,
> +		.eth2_ref_clk_sel	= 0,
> +		.eth2_sel_rgmii		= 0,
> +		.eth2_sel_rmii		= 0
> +	}
>  };
>  
>  static const struct of_device_id stm32_dwmac_match[] = {
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
