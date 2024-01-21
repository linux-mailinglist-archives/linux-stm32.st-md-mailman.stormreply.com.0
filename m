Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF53383569B
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jan 2024 17:19:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 519ECC6B457;
	Sun, 21 Jan 2024 16:19:22 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB723C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jan 2024 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=qn4t+vas77bkDv8g3HdYzBVs/Lcv/nz47gDWrhkMoW0=; b=s8bZff+lnIy0w1E7iRjMwp/D5N
 CviH96SZl4ruDUwl3yMGZnF+huZmenyU48MCOt6rZmO2g1ZK1RZTN1cmW9QI+0iS7pbwn1FX/1lnd
 ywqOGEuwfb4Cj4Ue1dmv6ay3qiSExwDJq71IHBlCankDuAWJXiykbIHYoN4XtMtnOT6E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rRaXS-005f13-Ik; Sun, 21 Jan 2024 17:19:14 +0100
Date: Sun, 21 Jan 2024 17:19:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Message-ID: <2c6c0d72-5d4e-4ec4-beb6-d30852108a67@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556D5568546D6DA4313209EC9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYZPR01MB5556D5568546D6DA4313209EC9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 1/8] net: phy: Introduce Qualcomm IPQ5018
 internal PHY driver
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

On Sun, Jan 21, 2024 at 08:42:30PM +0800, Ziyang Huang wrote:
> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>

You need to say something in the commit message. One obvious thing is
to justify not using the at803x driver, since 

> +#define IPQ5018_PHY_ID			0x004dd0c0

is in the Atheros OUI range.

> +static int ipq5018_probe(struct phy_device *phydev)
> +{
> +	struct ipq5018_phy *priv;
> +	struct device *dev = &phydev->mdio.dev;
> +	char name[64];
> +	int ret;

I guess you are new to mainline network. Please read:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

Section 1.6.4.

> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return dev_err_probe(dev, -ENOMEM,
> +				     "failed to allocate priv\n");

Please read the documentation of dev_err_probe() and this fix the
obvious problem with this.

> +	snprintf(name, sizeof(name), "%s#rx", dev_name(dev));
> +	priv->clk_rx = clk_hw_register_fixed_rate(dev, name, NULL, 0,
> +						  TX_RX_CLK_RATE);
> +	if (IS_ERR_OR_NULL(priv->clk_rx))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk_rx),
> +				     "failed to register rx clock\n");
> +
> +	snprintf(name, sizeof(name), "%s#tx", dev_name(dev));
> +	priv->clk_tx = clk_hw_register_fixed_rate(dev, name, NULL, 0,
> +						  TX_RX_CLK_RATE);
> +	if (IS_ERR_OR_NULL(priv->clk_tx))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk_tx),
> +				     "failed to register tx clock\n");
> +
> +	priv->clk_data = devm_kzalloc(dev,
> +				      struct_size(priv->clk_data, hws, 2),
> +				      GFP_KERNEL);
> +	if (!priv->clk_data)
> +		return dev_err_probe(dev, -ENOMEM,
> +				     "failed to allocate clk_data\n");
> +
> +	priv->clk_data->num = 2;
> +	priv->clk_data->hws[0] = priv->clk_rx;
> +	priv->clk_data->hws[1] = priv->clk_tx;
> +	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> +				     priv->clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "fail to register clock provider\n");

This needs an explanation. Why register two fixed clocks, which you
never use? Why not put these two clocks in DT?

> +
> +	return 0;
> +}
> +
> +static int ipq5018_soft_reset(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = phy_modify(phydev, IPQ5018_PHY_FIFO_CONTROL,
> +			 IPQ5018_PHY_FIFO_RESET, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	msleep(50);
> +
> +	ret = phy_modify(phydev, IPQ5018_PHY_FIFO_CONTROL,
> +			 IPQ5018_PHY_FIFO_RESET, IPQ5018_PHY_FIFO_RESET);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}

This needs an explanation. It is also somewhat like
qca808x_link_change_notify(). Is it really sufficient to only do this
reset FIFO during a soft reset, or is it needed when ever the link
changes?

You also appear to be missing device tree bindings.

    Andrew

---
pw-bot: cr

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
