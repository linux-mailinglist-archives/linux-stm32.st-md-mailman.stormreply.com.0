Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ8fDHPiiWnGCwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 14:34:43 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A70B410FC37
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 14:34:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 484C9C36B3E;
	Mon,  9 Feb 2026 13:34:42 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B5AEC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Feb 2026 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Sh23NSounPEoAE2h79+DwlVVBDgNeh1OQatWs/Guhyc=; b=Xa+QQuRAVaTq3QfgkF6otHND6P
 1tX50Y+PCdAxCTR75mp2UWO7wGqTlAXch2y+oT1au3UH+6n6Tn5vc22nPjgJIgScn+dfxz2scnG/R
 v8cJOik1at9Yt/X7jKqKC0AUini3O6AC+8xAQprfzp1oq6WKGdBEohe/mJ5XhJpe9BR4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vpRPL-006j5z-20; Mon, 09 Feb 2026 14:34:31 +0100
Date: Mon, 9 Feb 2026 14:34:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: lizhi2@eswincomputing.com
Message-ID: <1392e400-9901-4f65-b44b-d257d8196abf@lunn.ch>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
 <20260209094832.932-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260209094832.932-1-lizhi2@eswincomputing.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linmin@eswincomputing.com, devicetree@vger.kernel.org,
 ningyu@eswincomputing.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com
Subject: Re: [Linux-stm32] [PATCH v2 2/2] net: stmmac: eic7700: enable
 clocks before syscon access and correct RX sampling timing
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linmin@eswincomputing.com,m:devicetree@vger.kernel.org,m:ningyu@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,eswincomputing.com,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org,einfochips.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,kernel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:mid,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: A70B410FC37
X-Rspamd-Action: no action

>  static int eic7700_dwmac_init(struct device *dev, void *priv)
>  {
>  	struct eic7700_qos_priv *dwc = priv;
> +	u32 eth_phy_ctrl_regset;
> +	int ret = 0;
> +
> +	ret = eic7700_clks_config(dwc, true);

No point initialising ret if the first thing you do is assign to it.

> +	if (ret)
> +		return ret;
> +
> +	regmap_read(dwc->eic7700_hsp_regmap, dwc->eth_phy_ctrl_offset,
> +		    &eth_phy_ctrl_regset);
> +	eth_phy_ctrl_regset |=
> +		(EIC7700_ETH_TX_CLK_SEL | EIC7700_ETH_PHY_INTF_SELI);
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_phy_ctrl_offset,
> +		     eth_phy_ctrl_regset);

regmap_set_bits(dwc->eic7700_hsp_regmap, dwc->eth_phy_ctrl_offset,
		EIC7700_ETH_TX_CLK_SEL | EIC7700_ETH_PHY_INTF_SELI);

> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_axi_lp_ctrl_offset,
> +		     EIC7700_ETH_CSYSREQ_VAL);
> +
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_txd_offset, 0);
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_rxd_offset, 0);
>  
> -	return eic7700_clks_config(dwc, true);
> +	return ret;

returning ret here seems pointless. You already know it is 0.


>  }
>  
>  static void eic7700_dwmac_exit(struct device *dev, void *priv)
> @@ -88,17 +124,33 @@ static int eic7700_dwmac_resume(struct device *dev, void *priv)
>  	return ret;
>  }
>  
> +static void eic7700_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
> +{
> +	struct eic7700_qos_priv *dwc = (struct eic7700_qos_priv *)priv;
> +	u32 dly_param = dwc->eth_clk_dly_param;
> +
> +	switch (speed) {
> +	case SPEED_1000:
> +		if (dwc->eth_rx_clk_inv)
> +			dly_param |= EIC7700_ETH_RX_INV_DELAY;
> +		break;
> +	case SPEED_100:
> +	case SPEED_10:
> +		break;
> +	default:
> +		dev_err(dwc->dev, "invalid speed %u\n", speed);
> +		break;
> +	}
> +
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_clk_offset, dly_param);
> +}
> +
>  static int eic7700_dwmac_probe(struct platform_device *pdev)
>  {
> +	const struct eic7700_dwmac_data *data;
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct eic7700_qos_priv *dwc_priv;
> -	struct regmap *eic7700_hsp_regmap;
> -	u32 eth_axi_lp_ctrl_offset;
> -	u32 eth_phy_ctrl_offset;
> -	u32 eth_phy_ctrl_regset;
> -	u32 eth_rxd_dly_offset;
> -	u32 eth_dly_param = 0;
>  	u32 delay_ps;
>  	int i, ret;
>  
> @@ -116,13 +168,23 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
>  	if (!dwc_priv)
>  		return -ENOMEM;
>  
> +	dwc_priv->dev = &pdev->dev;
> +
> +	data = device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return dev_err_probe(&pdev->dev,
> +				     -EINVAL, "no match data found\n");
> +
> +	dwc_priv->eth_rx_clk_inv = data->rgmii_rx_clk_invert;
> +
>  	/* Read rx-internal-delay-ps and update rx_clk delay */
>  	if (!of_property_read_u32(pdev->dev.of_node,
>  				  "rx-internal-delay-ps", &delay_ps)) {
> -		u32 val = min(delay_ps / 100, EIC7700_MAX_DELAY_UNIT);
> +		u32 val = min(delay_ps / 20, EIC7700_MAX_DELAY_STEPS);

If the value it too big, please return -EINVAL. You have listed in the
DT binding what the valid range is, not that you clamp to the maximum
value.

>  
> -		eth_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
> -		eth_dly_param |= FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
> +		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
> +		dwc_priv->eth_clk_dly_param |=
> +				 FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
>  	} else {
>  		return dev_err_probe(&pdev->dev, -EINVAL,
>  			"missing required property rx-internal-delay-ps\n");

RX and TX internal delays are generally optional, because most boards
don't require them. Default to 0 if not supplied.

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
