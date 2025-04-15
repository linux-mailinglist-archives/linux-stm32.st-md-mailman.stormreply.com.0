Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11120A89D2A
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 14:09:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF2C8C78023;
	Tue, 15 Apr 2025 12:09:22 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FBB6C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 12:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=vmwziB2QVw1Qr19BFPphA8MaFnyigzwEzdHBN9OFZHs=; b=wW5cAcCJFw2naWbMZ72P4VjQta
 6HpRQGMmka0nQN542fTwufjaehEQw3hcbvz9hRvt9wcCk37asYm6WYVTIkVLfPsVnvHlUUks0M0Mn
 PhWdu632aZ0vlSiE/BNMVtaJ/dcCY7iaFmTtesoaeNMN7VjmqooKVo668G81ouU7Ekw0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1u4f5z-009Qfa-Cp; Tue, 15 Apr 2025 14:08:55 +0200
Date: Tue, 15 Apr 2025 14:08:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <840346cf-52a3-4e40-bf38-9d66231366d7@lunn.ch>
References: <20250410070453.61178-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410070453.61178-1-minda.chen@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next v1] net: stmmac: starfive: Add serdes
 PHY init/deinit function
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

> +static int starfive_dwmac_serdes_powerup(struct net_device *ndev, void *priv)
> +{
> +	struct starfive_dwmac *dwmac = priv;
> +	int ret;
> +
> +	ret = phy_init(dwmac->serdes_phy);
> +	if (ret)
> +		return ret;
> +
> +	return phy_power_on(dwmac->serdes_phy);
> +}

static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
{
        struct qcom_ethqos *ethqos = priv;
        int ret;

        ret = phy_init(ethqos->serdes_phy);
        if (ret)
                return ret;

        ret = phy_power_on(ethqos->serdes_phy);
        if (ret)
                return ret;

        return phy_set_speed(ethqos->serdes_phy, ethqos->speed);
}

Similar?

> +static void starfive_dwmac_serdes_powerdown(struct net_device *ndev, void *priv)
> +{
> +	struct starfive_dwmac *dwmac = priv;
> +
> +	phy_power_off(dwmac->serdes_phy);
> +	phy_exit(dwmac->serdes_phy);
> +}

static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
{
        struct qcom_ethqos *ethqos = priv;

        phy_power_off(ethqos->serdes_phy);
        phy_exit(ethqos->serdes_phy);
}

Pretty much cut & paste.

>  static int starfive_dwmac_probe(struct platform_device *pdev)
>  {
>  	struct plat_stmmacenet_data *plat_dat;
> @@ -102,6 +125,11 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
>  	if (!dwmac)
>  		return -ENOMEM;
>  
> +	dwmac->serdes_phy = devm_phy_optional_get(&pdev->dev, NULL);
> +	if (IS_ERR(dwmac->serdes_phy))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->serdes_phy),
> +				     "Failed to get serdes phy\n");
> +

        ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
        if (IS_ERR(ethqos->serdes_phy))
                return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
                                     "Failed to get serdes phy\n");


>  	dwmac->data = device_get_match_data(&pdev->dev);
>  
>  	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> @@ -132,6 +160,11 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> +	if (dwmac->serdes_phy) {
> +		plat_dat->serdes_powerup = starfive_dwmac_serdes_powerup;
> +		plat_dat->serdes_powerdown  = starfive_dwmac_serdes_powerdown;
> +	}
> +

        if (ethqos->serdes_phy) {
                plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
                plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
        }


I assume you have seen all the work Russell King has been doing
recently cleaning up all the copy/paste code between various glue
drivers. Please don't add to that mess. Please consider how you can
refactor the ethqos code to make is generic for any stmmac driver
which has a generic phy.

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
