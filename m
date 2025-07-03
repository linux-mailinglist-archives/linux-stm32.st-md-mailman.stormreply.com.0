Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A5AF7D7C
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 18:12:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FF71C3F94F;
	Thu,  3 Jul 2025 16:12:48 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29123C3F94D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 16:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Wv4BBXA+4pL6f4PUbQmyirqWFmcBaGMABn9VzcOlZ3U=; b=c+erWZh9K/H57qNTVjYAqIrEOL
 0CI5JHEPPML77qSqRxJ3y8+sdgKQhWnZhiWt6HM+5UC5IiYPL2fePvaabjIaqOlX4ckg1PkkE1Gl3
 rVU0jDk/u6oqPH0At3SkDXcHbiCKR8LVDVvZc87TGUO+KINbKzmRbybM83sM8aweDT9w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uXMY1-0007LT-ER; Thu, 03 Jul 2025 18:12:29 +0200
Date: Thu, 3 Jul 2025 18:12:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: weishangjuan@eswincomputing.com
Message-ID: <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703092015.1200-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250703092015.1200-1-weishangjuan@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com,
 kuba@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 dfustini@tenstorrent.com, linux-arm-kernel@lists.infradead.org,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, inochiama@gmail.com, krzk+dt@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 2/2] ethernet: eswin: Add eic7700
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

> +/* Default delay value*/
> +#define EIC7700_DELAY_VALUE0 0x20202020
> +#define EIC7700_DELAY_VALUE1 0x96205A20

We need a better explanation of what is going on here. What do these
numbers mean?

> +	dwc_priv->dly_param_1000m[0] = EIC7700_DELAY_VALUE0;
> +	dwc_priv->dly_param_1000m[1] = EIC7700_DELAY_VALUE1;
> +	dwc_priv->dly_param_1000m[2] = EIC7700_DELAY_VALUE0;
> +	dwc_priv->dly_param_100m[0] = EIC7700_DELAY_VALUE0;
> +	dwc_priv->dly_param_100m[1] = EIC7700_DELAY_VALUE1;
> +	dwc_priv->dly_param_100m[2] = EIC7700_DELAY_VALUE0;
> +	dwc_priv->dly_param_10m[0] = 0x0;
> +	dwc_priv->dly_param_10m[1] = 0x0;
> +	dwc_priv->dly_param_10m[2] = 0x0;

What are the three different values for?

> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
> +				   &dwc_priv->rx_delay_ps);
> +	if (ret)
> +		dev_dbg(&pdev->dev, "can't get rx-internal-delay-ps, ret(%d).", ret);
> +	else
> +		has_rx_dly = true;
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps",
> +				   &dwc_priv->tx_delay_ps);
> +	if (ret)
> +		dev_dbg(&pdev->dev, "can't get tx-internal-delay-ps, ret(%d).", ret);
> +	else
> +		has_tx_dly = true;
> +	if (has_rx_dly && has_tx_dly)

What if i only to set a TX delay? I want the RX delay to default to
0ps.

{
> +		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
> +				  &dwc_priv->dly_param_1000m[1]);
> +		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
> +				  &dwc_priv->dly_param_100m[1]);
> +		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
> +				  &dwc_priv->dly_param_10m[1]);
> +	} else {
> +		dev_dbg(&pdev->dev, " use default dly\n");

What is the default? It should be 0ps. So there is no point printing
this message.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
