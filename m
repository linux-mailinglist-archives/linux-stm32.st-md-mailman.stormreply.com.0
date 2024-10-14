Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC3799E847
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 14:04:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5746C78030;
	Tue, 15 Oct 2024 12:04:06 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A52FC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2024 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=O/yDHelZkZbEyouxYDEGSFyuC5vdHTQjMNQBxEU6cxs=; b=A1kWSnBtnNvgq117bQonvW7NGB
 ivzTefIRpDZr5RKxS59WshY6ydHPOP70BVMfmFz/UrESTk+lj5+ylhVB9+pu2Vz+nBJmC8M4t4TV4
 jqrfgqU+Ku4heNIzvZz7Glq1kZzRhooGJW5zrDPXqIzwMjIoqqVHk+350Z2xMISLyduQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1t0LJb-009vh1-Sn; Mon, 14 Oct 2024 15:40:51 +0200
Date: Mon, 14 Oct 2024 15:40:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Message-ID: <4686019c-f6f1-4248-9555-c736813417b7@lunn.ch>
References: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
 <20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com>
X-Mailman-Approved-At: Tue, 15 Oct 2024 12:04:05 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 04/16] net: phy: Add helper for mapping
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

On Sun, Oct 13, 2024 at 11:27:39PM +0200, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The helper rgmii_clock() implemented Russel's hint during stmmac
> glue driver review:
> 
>   > We seem to have multiple cases of very similar logic in lots of stmmac
>   > platform drivers, and I think it's about time we said no more to this.
>   > So, what I think we should do is as follows:
>   >
>   > add the following helper - either in stmmac, or more generically
>   > (phylib? - in which case its name will need changing.)
>   >
>   > static long stmmac_get_rgmii_clock(int speed)
>   > {
>   >        switch (speed) {
>   >        case SPEED_10:
>   >                return 2500000;
>   >
>   >        case SPEED_100:
>   >                return 25000000;
>   >
>   >        case SPEED_1000:
>   >                return 125000000;
>   >
>   >        default:
>   >                return -ENVAL;
>   >        }
>   > }
>   >
>   > Then, this can become:
>   >
>   >        long tx_clk_rate;
>   >
>   >        ...
>   >
>   >        tx_clk_rate = stmmac_get_rgmii_clock(speed);
>   >        if (tx_clk_rate < 0) {
>   >                dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
>   >                return;
>   >        }
>   >
>   >        ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
> 
> Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

But of an unusual commit message, but it does explain the "Why?".

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

>  
> +/**
> + * rgmii_clock - map link speed to the clock rate
> + * @speed: link speed value
> + *
> + * Description: maps RGMII supported link speeds
> + * into the clock rates.
> + */

A Returns: line would be nice. 

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
