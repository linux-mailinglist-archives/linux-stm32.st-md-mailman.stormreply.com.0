Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D89B04099
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jul 2025 15:53:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8113C3F92D;
	Mon, 14 Jul 2025 13:53:22 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9A25C36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=TmleEhhVyOMAvmKR4twAxGwgQhrNxQ2pccvF+Yutx3I=; b=UtBS/0chb+ZDH8y8RqGl2m7yeO
 uals07ZFQCEyENbaG0hmUouu0k1MOEE9tuQ9w1lbvRnHxN74m9jAD9TNxN09YNLhBuTiKXM5sIOh9
 s1IxAtvFuAVBtBbbzIWwXNkjBPu4ny0UXVcqerQIexBZ074ZoGLlgNjKIIDz3x+03Sko=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ubJcB-001SqZ-ID; Mon, 14 Jul 2025 15:53:07 +0200
Date: Mon, 14 Jul 2025 15:53:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marvin Lin <milkfafa@gmail.com>
Message-ID: <5b01bd9c-252c-41ac-adaa-dddda8ffd06b@lunn.ch>
References: <20250714053527.767380-1-milkfafa@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250714053527.767380-1-milkfafa@gmail.com>
Cc: KWLIU@nuvoton.com, tmaimon77@gmail.com, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, kflin@nuvoton.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Add NCSI support
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

> -	ret = stmmac_reset(priv, priv->ioaddr);
> -	if (ret) {
> -		netdev_err(priv->dev, "Failed to reset the dma\n");
> -		return ret;
> +	if (!priv->plat->use_ncsi) {
> +		ret = stmmac_reset(priv, priv->ioaddr);
> +		if (ret) {
> +			netdev_err(priv->dev, "Failed to reset the dma\n");
> +			return ret;
> +		}
>  	}

Please break this patch up into a series and include good commit
messages. You can then explain why this change is safe.

>  	/* DMA Configuration */
> @@ -3643,6 +3646,14 @@ static void stmmac_hw_teardown(struct net_device *dev)
>  	clk_disable_unprepare(priv->plat->clk_ptp_ref);
>  }
>  
> +static void stmmac_ncsi_handler(struct ncsi_dev *nd)
> +{
> +	if (unlikely(nd->state != ncsi_dev_state_functional))
> +		return;
> +
> +	netdev_info(nd->dev, "NCSI interface %s\n", nd->link_up ? "up" : "down");

Please don't spam the kernel log. Only do prints if something goes
wrong.

> +}
> +
>  static void stmmac_free_irq(struct net_device *dev,
>  			    enum request_irq_err irq_err, int irq_idx)
>  {
> @@ -4046,14 +4057,16 @@ static int __stmmac_open(struct net_device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	if ((!priv->hw->xpcs ||
> -	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
> -		ret = stmmac_init_phy(dev);
> -		if (ret) {
> -			netdev_err(priv->dev,
> -				   "%s: Cannot attach to PHY (error: %d)\n",
> -				   __func__, ret);
> -			goto init_phy_error;
> +	if (!priv->plat->use_ncsi) {
> +		if ((!priv->hw->xpcs ||

My understanding of NCSI is that you have an additional RGMII like
port feeding into the MAC. The MAC still has all its media machinery,
a PCS, PHY etc. Something needs to drive that PCS and PHY. So it would
be good to explain in the commit message why you are removing all
this.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
