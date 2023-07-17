Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F27756FC4
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jul 2023 00:27:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AC90C6B452;
	Mon, 17 Jul 2023 22:27:20 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42922C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 22:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=eokIwBNJv5OtIZE3uQ713rkqW4eN4iVKfN1MALeYmUA=; b=R8pOWROGxLsJn3q6owdrhbLuoZ
 edDM8s5U3mYHmqIMH32wwAV+PYc1ROKE9P3gR3GA2TmRS0vyc7bi6UY6pSF29amyzd9AG7s3hJsxE
 81nOpsRYwvvq6sR3PMkbqhvQVAftvLwAbRRYZsp+SJltnl89UXEJYl/pjlFHqPj+59ds=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qLWgI-001aGJ-CE; Tue, 18 Jul 2023 00:27:02 +0200
Date: Tue, 18 Jul 2023 00:27:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marco Felsch <m.felsch@pengutronix.de>
Message-ID: <cd8c177e-7840-4636-a039-dbe8884b3d2b@lunn.ch>
References: <20230717164307.2868264-1-m.felsch@pengutronix.de>
 <20230717164307.2868264-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230717164307.2868264-2-m.felsch@pengutronix.de>
Cc: kernel@pengutronix.de, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: platform: add
 support for phy-supply
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

> +static int stmmac_phy_power(struct platform_device *pdev,
> +			    struct plat_stmmacenet_data *plat,
> +			    bool enable)
> +{
> +	struct regulator *regulator = plat->phy_regulator;
> +	int ret = 0;
> +
> +	if (regulator) {
> +		if (enable)
> +			ret = regulator_enable(regulator);
> +		else
> +			regulator_disable(regulator);
> +	}
> +
> +	if (ret)
> +		dev_err(&pdev->dev, "Fail to enable regulator\n");

'enable' is only correct 50% of the time.

> @@ -742,6 +786,8 @@ static int __maybe_unused stmmac_pltfr_suspend(struct device *dev)
>  	if (priv->plat->exit)
>  		priv->plat->exit(pdev, priv->plat->bsp_priv);
>  
> +	stmmac_phy_power_off(pdev, priv->plat);
> +

What about WOL? You probably want to leave the PHY with power in that
case.

> @@ -757,6 +803,11 @@ static int __maybe_unused stmmac_pltfr_resume(struct device *dev)
>  	struct net_device *ndev = dev_get_drvdata(dev);
>  	struct stmmac_priv *priv = netdev_priv(ndev);
>  	struct platform_device *pdev = to_platform_device(dev);
> +	int ret;
> +
> +	ret = stmmac_phy_power_on(pdev, priv->plat);
> +	if (ret)
> +		return ret;

And this needs to balance with _suspend when WOL is being used.

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
