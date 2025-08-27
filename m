Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F83B38285
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 14:37:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81B5AC32E8E;
	Wed, 27 Aug 2025 12:37:41 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDFA6C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=isKWibVXBVycwFd7et1plNZH4fEqTmzHgURf/OQqBDA=; b=VcffjXPw/PgTwsJcBxPKr8x0LS
 NH45jESGr/WF2lfebtS7qCLpXzLVlklMtyUMwkREO7QafooG/b+hsQM7MgiPiUSsBPM//htmY+uZG
 e1Jj3nkF2Ba09x325c05fpfre772d0m1b8s5CY5NIun5+u21ibGFPEHKtd3sNcO3KLlY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1urFOs-006D0t-7x; Wed, 27 Aug 2025 14:37:14 +0200
Date: Wed, 27 Aug 2025 14:37:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: weishangjuan@eswincomputing.com
Message-ID: <7a39a658-0a83-4998-ae43-344025996c7b@lunn.ch>
References: <20250827081135.2243-1-weishangjuan@eswincomputing.com>
 <20250827081418.2347-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827081418.2347-1-weishangjuan@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, 0x1207@gmail.com, edumazet@google.com,
 jszhang@kernel.org, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, faizal.abdul.rahim@linux.intel.com,
 lizhi2@eswincomputing.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, linmin@eswincomputing.com,
 inochiama@gmail.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, p.zabel@pengutronix.de, netdev@vger.kernel.org,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v4 2/2] ethernet: eswin: Add eic7700
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

> +/**
> + * eic7700_apply_delay - Update TX or RX delay bits in delay parameter value.
> + * @delay_ps: Delay in picoseconds (capped at 12.7ns).
> + * @reg:      Pointer to register value to modify.
> + * @is_rx:    True for RX delay (bits 30:24), false for TX delay (bits 14:8).
> + *
> + * Converts delay to 0.1ns units, caps at 0x7F, and sets appropriate bits.
> + * Only RX or TX bits are updated; other bits remain unchanged.
> + */
> +static inline void eic7700_apply_delay(u32 delay_ps, u32 *reg, bool is_rx)
> +{
> +	if (!reg)
> +		return;
> +

Please don't use inline functions in .c files. Leave the compile to
decide.


> +	/* Read rx-internal-delay-ps and update rx_clk delay */
> +	if (!of_property_read_u32(pdev->dev.of_node,
> +				  "rx-internal-delay-ps",
> +				  &dwc_priv->rx_delay_ps)) {
> +		eic7700_apply_delay(dwc_priv->rx_delay_ps,
> +				    &eth_dly_param, true);
> +	} else {
> +		dev_warn(&pdev->dev, "can't get rx-internal-delay-ps\n");
> +	}
> +
> +	/* Read tx-internal-delay-ps and update tx_clk delay */
> +	if (!of_property_read_u32(pdev->dev.of_node,
> +				  "tx-internal-delay-ps",
> +				  &dwc_priv->tx_delay_ps)) {
> +		eic7700_apply_delay(dwc_priv->tx_delay_ps,
> +				    &eth_dly_param, false);

Given this code, why does eic7700_apply_delay() test for reg?  Don't
use defensive code, read your own code and make sure it cannot happen.

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
