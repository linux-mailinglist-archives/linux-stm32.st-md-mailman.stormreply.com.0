Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADCCB438B4
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 12:27:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E1F2C3FACF;
	Thu,  4 Sep 2025 10:27:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A79E9C3FACE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 10:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r+PxUXRPBCegn7nxIw8aU+giwhqnR+X96ofMNS1C+qA=; b=Trk0VvDUUBQmIaaZkOwxKUs5VS
 bHr2Pr+4J8HGE+FsC2yCsBZDLX+r9WZpbXWs+78vPnDsuSed1DhzcYI2IDAuBC/3z2LE41Pc/SQA7
 rj2PyYhXRAlorckyYao+MnFL1x3CmS5iARyLuK9/N0cpMZ9cn46Ms9GZUx621z5gZz7JQzjGKQEr3
 RSc9Wbn/jBSIPNUOpnR6MDIueDXv926ba8t3ia+ES0+TROjpeMAPwVcKWLBy6PfQlSgX3ndnbGf9L
 GI9/0xvaLDAFYAgJC7e6gOdpmLkheX/ObZ0UNFEzJzt82MdP8SCU0lTARU6dZsrgDxtYZlCmupRz9
 C+Kt+qxQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48290)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uu7An-000000001oA-2KNv;
 Thu, 04 Sep 2025 11:26:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uu7Af-000000001Qj-0fPd; Thu, 04 Sep 2025 11:26:25 +0100
Date: Thu, 4 Sep 2025 11:26:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: weishangjuan@eswincomputing.com
Message-ID: <aLlpUOr3IJzTuV1g@shell.armlinux.org.uk>
References: <20250904085913.2494-1-weishangjuan@eswincomputing.com>
 <20250904090125.2598-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250904090125.2598-1-weishangjuan@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, faizal.abdul.rahim@linux.intel.com,
 edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, inochiama@gmail.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, p.zabel@pengutronix.de,
 netdev@vger.kernel.org, krzk+dt@kernel.org, emil.renner.berthing@canonical.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 2/2] ethernet: eswin: Add eic7700
	ethernet driver
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

On Thu, Sep 04, 2025 at 05:01:25PM +0800, weishangjuan@eswincomputing.com wrote:
> +struct eic7700_qos_priv {
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct device *dev;
> +	struct regmap *hsp_regmap;
> +	u32 tx_delay_ps;
> +	u32 rx_delay_ps;
> +};
> +
> +/**
> + * eic7700_apply_delay - Apply TX or RX delay to a register value.
> + * @delay_ps: Delay in picoseconds, converted to 0.1ns units.
> + * @reg:      Pointer to register value to update in-place.
> + * @is_rx:    True for RX delay (bits 30:24), false for TX delay (bits 14:8).
> + *
> + * Converts delay from ps to 0.1ns units, capped by EIC7700_MAX_DELAY_UNIT.
> + * Updates only the RX or TX delay field (using FIELD_PREP), leaving all
> + * other bits in *@reg unchanged.
> + */
> +static void eic7700_apply_delay(u32 delay_ps, u32 *reg, bool is_rx)
> +{
> +	u32 val = min(delay_ps / 100, EIC7700_MAX_DELAY_UNIT);
> +
> +	if (is_rx) {
> +		*reg &= ~EIC7700_ETH_RX_ADJ_DELAY;
> +		*reg |= FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
> +	} else {
> +		*reg &= ~EIC7700_ETH_TX_ADJ_DELAY;
> +		*reg |= FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, val);
> +	}
> +}

...

> +	/* Read rx-internal-delay-ps and update rx_clk delay */
> +	if (!of_property_read_u32(pdev->dev.of_node,
> +				  "rx-internal-delay-ps",
> +				  &dwc_priv->rx_delay_ps)) {
> +		eic7700_apply_delay(dwc_priv->rx_delay_ps,
> +				    &eth_dly_param, true);

I've been trying to figure out the reasoning behind the following:

1. the presence of dwc_priv->rx_delay_ps and dwc_priv->tx_delay_ps
   rather than just using a local variable ("delay" ?)
2. the presence of eic7700_apply_delay() when we have to do something
   different to get the delay value anyway

It seems to me that this should either be:

static void eic7700_parse_delay(u32 *reg, struct device *dev,
				const char *name, bool is_rx)
{
	u32 delay;

	if (of_property_read_u32(dev->of_node, name, &delay)) {
		dev_warn(dev, "can't get %s\n", name);
		return
	}

	if (is_rx) {
		*reg &= ~EIC7700_ETH_RX_ADJ_DELAY;
		*reg |= FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, delay);
	} else {
		*reg &= ~EIC7700_ETH_TX_ADJ_DELAY;
		*reg |= FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, delay);
	}
}

or just not bother with the function at all and just write it out
fully in the probe function.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
