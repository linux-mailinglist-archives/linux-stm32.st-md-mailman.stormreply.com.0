Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F93A22B2
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 05:19:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65F3CC58D5B;
	Thu, 10 Jun 2021 03:19:54 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F593C57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 03:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=jWmr2xlRwn6JQaehy4GwAbYBW8L4D3ESDbeB+eyjFlI=; b=hhiJjKT6WeE4zxbXF0IMfq/cIp
 4f29LBeN15gfX1AVIvAng+bg3qf9bFv4B9FvdCvxTnIDHot3hU6fdyvFxCB+L1skt3f3wTRAu4Y/K
 XQ44pUFutdRWIB7WN+v7catNdKHEgF0mCEaMjZLPh97X6hBkFGOR19LeXsxGtklpHdko=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lrBE2-008axE-Ng; Thu, 10 Jun 2021 05:19:22 +0200
Date: Thu, 10 Jun 2021 05:19:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>
Message-ID: <YMGEutCet7fP1NZ9@lunn.ch>
References: <1623260110-25842-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623260110-25842-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623260110-25842-3-git-send-email-zhouyanjie@wanyeetech.com>
Cc: joabreu@synopsys.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com,
 linux-kernel@vger.kernel.org, sihui.liu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux-mips@vger.kernel.org, paul@crapouillou.net, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 netdev@vger.kernel.org, dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH v2 2/2] net: stmmac: Add Ingenic SoCs MAC
	support.
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

> +static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct ingenic_mac *mac = plat_dat->bsp_priv;
> +	unsigned int val;


> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		val = FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT) |
> +			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII);
> +		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
> +		break;

So this does what DT writes expect. They put 'rgmii-id' as phy
mode. The MAC does not add a delay. PHY_INTERFACE_MODE_RGMII_ID is
passed to the PHY and it adds the delay. And frames flow to/from the
PHY and users are happy. The majority of MAC drivers are like this.

> +static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct ingenic_mac *mac = plat_dat->bsp_priv;
> +	unsigned int val;

Here we have a complete different story. 


> +	case PHY_INTERFACE_MODE_RGMII:
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII);
> +
> +		if (mac->tx_delay == 0) {
> +			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
> +		} else {
> +			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_DELAY);
> +
> +			if (mac->tx_delay > MACPHYC_TX_DELAY_MAX)
> +				val |= FIELD_PREP(MACPHYC_TX_DELAY_MASK, MACPHYC_TX_DELAY_MAX - 1);
> +			else
> +				val |= FIELD_PREP(MACPHYC_TX_DELAY_MASK, mac->tx_delay - 1);
> +		}

What are the units of tx_delay. The DT binding should be pS, and you
need to convert from that to whatever the hardware is using.

If mac->tx_delay is greater than MACPHYC_TX_DELAY_MAX, please return
-EINVAL when parsing the binding. We want the DT writer to know they
have requested something the hardware cannot do.

So if the device tree contains 'rgmii' for PHY mode, you can use this
for when you have long clock lines on your board adding the delay, and
you just need to fine tune the delay, add a few pS. The PHY will also
not add a delay, due to receiving PHY_INTERFACE_MODE_RGMII.

> +
> +		if (mac->rx_delay == 0) {
> +			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
> +		} else {
> +			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_DELAY);
> +
> +			if (mac->rx_delay > MACPHYC_RX_DELAY_MAX)
> +				val |= FIELD_PREP(MACPHYC_RX_DELAY_MASK, MACPHYC_RX_DELAY_MAX - 1);
> +			else
> +				val |= FIELD_PREP(MACPHYC_RX_DELAY_MASK, mac->rx_delay - 1);
> +		}
> +
> +		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
> +		break;
> +
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
> +			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN) |
> +			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII);
> +		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII_ID\n");
> +		break;

So this one is pretty normal. The MAC does not add a delay,
PHY_INTERFACE_MODE_RGMII_ID is passed to the PHY, and it adds the
delay. The interface will likely work.

> +
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII) |
> +			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
> +
> +		if (mac->tx_delay == 0) {
> +			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
> +		} else {
> +			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_DELAY);
> +
> +			if (mac->tx_delay > MACPHYC_TX_DELAY_MAX)
> +				val |= FIELD_PREP(MACPHYC_TX_DELAY_MASK, MACPHYC_TX_DELAY_MAX - 1);
> +			else
> +				val |= FIELD_PREP(MACPHYC_TX_DELAY_MASK, mac->tx_delay - 1);
> +		}

So here, the PHY is going to be passed PHY_INTERFACE_MODE_RGMII_RXID.
The PHY will add a delay in the receive path. The MAC needs to add the
delay in the transmit path. So tx_delay needs to be the full 2ns, not
just a small fine tuning value, or the PCB is adding the delay. And
you also cannot fine tune the RX delay, since rx_delay is ignored.

> +
> +		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII_RXID\n");
> +		break;
> +
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII) |
> +			  FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
> +
> +		if (mac->rx_delay == 0) {
> +			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
> +		} else {
> +			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_DELAY);
> +
> +			if (mac->rx_delay > MACPHYC_RX_DELAY_MAX)
> +				val |= FIELD_PREP(MACPHYC_RX_DELAY_MASK, MACPHYC_RX_DELAY_MAX - 1);
> +			else
> +				val |= FIELD_PREP(MACPHYC_RX_DELAY_MASK, mac->rx_delay - 1);
> +		}

And here we have the opposite to PHY_INTERFACE_MODE_RGMII_RXID.

So you need to clearly document in the device tree binding when
rx_delay and tx_delay are used, and when they are ignored. You don't
want to have DT writers having to look deep into the code to figure
this out.

Personally, i would simply this, in a big way. I see two options:

1) The MAC never adds a delay. The hardware is there, but simply don't
use it, to keep thing simple, and the same as nearly every other MAC.

2) If the hardware can do small steps of delay, allow this delay, both
RX and TX, to be configured in all four modes, in order to allow for
fine tuning. Leave the PHY to insert the majority of the delay.

> +	/* Get MAC PHY control register */
> +	mac->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "mode-reg");
> +	if (IS_ERR(mac->regmap)) {
> +		dev_err(&pdev->dev, "%s: failed to get syscon regmap\n", __func__);
> +		goto err_remove_config_dt;
> +	}

Please document this in the device tree binding.

> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "rx-clk-delay", &mac->rx_delay);
> +	if (ret)
> +		mac->rx_delay = 0;
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "tx-clk-delay", &mac->tx_delay);
> +	if (ret)
> +		mac->tx_delay = 0;

Please take a look at dwmac-mediatek.c. It handles delays nicely. I
would suggest that is the model to follow.

       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
