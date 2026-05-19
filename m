Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB0PEBZxDGpKhgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 16:17:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C6958061E
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 16:17:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36B4EC8F294;
	Tue, 19 May 2026 14:17:57 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDAEBC349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 14:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=QaO48AAWxgV+yw0EkvBhAuqLsdVLtj1924pNS0Io8fc=; b=ryV0i+6kdnWANvaww2wot9+ZnZ
 +wFVUgptde9fiBUK22O97D8T2cGz6UkpqXCmDH/tsHlS8ZHUFI/1tKHLSJrt0ZYLVzIufLBd9LX1t
 te94etpns18S0qBhuyuJwXV0QIUtz/6Zwt8cThdwkSvVThlp0X+v03IhbdhttoL+uE3U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1wPLGM-003g5i-8J; Tue, 19 May 2026 16:17:38 +0200
Date: Tue, 19 May 2026 16:17:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <6eff2d70-a0ac-4d9c-8261-eb5249b7c877@lunn.ch>
References: <20260519101436.111476-1-minda.chen@starfivetech.com>
 <20260519101436.111476-5-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260519101436.111476-5-minda.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next v4 4/5] net: stmmac: starfive: Add
 jhb100 SGMII interface
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:minda.chen@starfivetech.com,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,kernel.org,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,lunn.ch:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 92C6958061E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> +static int stmmac_starfive_sgmii_set_clk_rate(void *bsp_priv, struct clk *clk_tx_i,
> +					      phy_interface_t __maybe_unused interface,
> +					      int speed)
> +{
> +	struct starfive_dwmac *dwmac = bsp_priv;
> +	long rate = rgmii_clock(speed);
> +	int ret;
> +
> +	/* MAC clock rate the same as RGMII */
> +	if (rate < 0)
> +		return 0;

You probably should return the error code, because something has gone
wrong, you have been asked to do a rate you don't support.

> +	ret = clk_set_rate(clk_tx_i, rate);
> +	if (ret)
> +		return ret;
> +
> +	return clk_set_rate(dwmac->sgmii_rx, rate);
> +}
> +
>  static int starfive_dwmac_probe(struct platform_device *pdev)
>  {
>  	struct plat_stmmacenet_data *plat_dat;
> @@ -102,23 +122,33 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, PTR_ERR(clk_gtx),
>  				     "error getting gtx clock\n");
>  
> -	/* Generally, the rgmii_tx clock is provided by the internal clock,
> -	 * which needs to match the corresponding clock frequency according
> -	 * to different speeds. If the rgmii_tx clock is provided by the
> -	 * external rgmii_rxin, there is no need to configure the clock
> -	 * internally, because rgmii_rxin will be adaptively adjusted.
> -	 */
> -	if (!device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
> -		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
> -
>  	dwmac->dev = &pdev->dev;
> -	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
>  	plat_dat->bsp_priv = dwmac;
> -	plat_dat->dma_cfg->dche = true;
> +	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_SGMII) {

Does the PCS support 1000BaseX? It is not needed now, but it is
something to keep in mind, try to avoid making to code too SGMII
specific when it might need to be more generic to support 1000BaseX as
well.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
