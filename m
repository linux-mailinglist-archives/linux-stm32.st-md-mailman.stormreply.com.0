Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F9956E7B
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 17:16:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E35C6C6DD94;
	Mon, 19 Aug 2024 15:16:13 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41369C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 14:15:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9F3AECE098E;
 Mon, 19 Aug 2024 14:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00FEC32782;
 Mon, 19 Aug 2024 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724076948;
 bh=MOZaGaCqrP4GQgWZMCVI3+A5OoGRB7tPix85SODkMRk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VuXgYYXgjSynhcIUVRd88Vn8jb8VQEyEpu3wrHMFIdS239qr5Kr4EPkq3nBmuubZ2
 F0ZMxLbQJ6lq1zx8jK2Dr5ST9EpXYGenQL7ZXBJEt8RT/E+lkrcbk08kqTw6pzw8LP
 hbapYLR4Llew6HLwls8GwWLejwgSGVwbplzcqIaVvsN7wDC4qLHXI2/DJj34ZpEFlG
 VtY0m+TN7BGYGB3L1nhXvSnSRt2GzIBD4Vfiewa7SuH8WPo94qdsuy1YnSaQHTiFTb
 TdUa6+F0N5tADiLkoseiIFZt45WEDiTSkGsxJMKUpbubRLni8aC+sCz17UU04A6RSo
 Opt5qE3otX9wg==
Date: Mon, 19 Aug 2024 15:15:41 +0100
From: Simon Horman <horms@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Message-ID: <20240819141541.GE11472@kernel.org>
References: <AM9PR04MB85062E3A66BA92EF8D996513E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM9PR04MB85062E3A66BA92EF8D996513E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
X-Mailman-Approved-At: Mon, 19 Aug 2024 15:16:13 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, dl-S32 <S32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 4/7] net: phy: add helper for mapping
 RGMII link speed to clock rate
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

On Sun, Aug 18, 2024 at 09:50:46PM +0000, Jan Petrous (OSS) wrote:
> The helper rgmii_clock() implemented Russel's hint during stmmac
> glue driver review:
> 
> ---
> We seem to have multiple cases of very similar logic in lots of stmmac
> platform drivers, and I think it's about time we said no more to this.
> So, what I think we should do is as follows:
> 
> add the following helper - either in stmmac, or more generically
> (phylib? - in which case its name will need changing.)
> 
> static long stmmac_get_rgmii_clock(int speed)
> {
> 	switch (speed) {
> 	case SPEED_10:
> 		return 2500000;
> 
> 	case SPEED_100:
> 		return 25000000;
> 
> 	case SPEED_1000:
> 		return 125000000;
> 
> 	default:
> 		return -ENVAL;
> 	}
> }
> 
> Then, this can become:
> 
> 	long tx_clk_rate;
> 
> 	...
> 
> 	tx_clk_rate = stmmac_get_rgmii_clock(speed);
> 	if (tx_clk_rate < 0) {
> 		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
> 		return;
> 	}
> 
> 	ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
> ---
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  include/linux/phy.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 6b7d40d49129..bb797364d91c 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -298,6 +298,27 @@ static inline const char *phy_modes(phy_interface_t interface)
>  	}
>  }
>  
> +/**
> + * rgmi_clock - map link speed to the clock rate

nit: rgmii_clock

     Flagged by ./scripts/kernel-doc -none

> + * @speed: link speed value
> + *
> + * Description: maps RGMII supported link speeds
> + * into the clock rates.
> + */
> +static inline long rgmii_clock(int speed)
> +{
> +	switch (speed) {
> +	case SPEED_10:
> +		return 2500000;
> +	case SPEED_100:
> +		return 25000000;
> +	case SPEED_1000:
> +		return 125000000;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  #define PHY_INIT_TIMEOUT	100000
>  #define PHY_FORCE_TIMEOUT	10
>  
> -- 
> 2.46.0
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
