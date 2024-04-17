Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4408A8B3B
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 20:40:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CD93C6C859;
	Wed, 17 Apr 2024 18:40:10 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A963C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 18:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=8Chgr1XzB7VSgqVHEHSg5NAelbYbuWSYpJpFWHYQKww=; b=xA9iEd9uSK1xlIdb5ceWhSY5LG
 6QyuyfGuXcUbPN6jWwUfai1cPpUETVoaxAQSAP4aLzeWyZ+LY+GTA5zHGziz29ZwNcfLOal5gYllU
 XnXYMEx7kq5w8oDMDrMS9DN2srLrGKB2ToOQQSk23DPI1dD7QCP+DmK/159KopQ/xjE4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rxACI-00DH19-19; Wed, 17 Apr 2024 20:39:54 +0200
Date: Wed, 17 Apr 2024 20:39:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <c8e3f5d0-832b-4ab1-a65f-52f983ff110a@lunn.ch>
References: <20240417164316.1755299-1-o.rempel@pengutronix.de>
 <20240417164316.1755299-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240417164316.1755299-3-o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>,
 Arun Ramadoss <arun.ramadoss@microchip.com>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 UNGLinuxDriver@microchip.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 2/4] net: phy: micrel:
 lan8841: set default PTP latency values
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

On Wed, Apr 17, 2024 at 06:43:14PM +0200, Oleksij Rempel wrote:
> Set default PTP latency values to provide realistic path delay
> measurements and reflecting internal PHY latency asymetry.
> 
> This values are based on ptp4l measurements for the path delay against
> identical PHY as link partner and latency asymmetry extracted from
> documented SOF Latency values of this PHY.
> 
> Documented SOF Latency values are:
> TX 138ns/RX 430ns @ 1000Mbps
> TX 140ns/RX 615ns @ 100Mbps (fixed latency mode)
> TX 140ns/RX 488-524ns @ 100Mbps (variable latency mode)
> TX 654ns/227-2577ns @ 10Mbps

Does Half Duplex vs Full Duplex make a difference here?

> +static int lan8841_ptp_latency_init(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = phy_write_mmd(phydev, KSZ9131RN_MMD_COMMON_CTRL_REG,
> +			    LAN8841_PTP_RX_LATENCY_10M,
> +			    LAN8841_PTP_RX_LATENCY_10M_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_write_mmd(phydev, KSZ9131RN_MMD_COMMON_CTRL_REG,
> +			    LAN8841_PTP_TX_LATENCY_10M,
> +			    LAN8841_PTP_TX_LATENCY_10M_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_write_mmd(phydev, KSZ9131RN_MMD_COMMON_CTRL_REG,
> +			    LAN8841_PTP_RX_LATENCY_100M,
> +			    LAN8841_PTP_RX_LATENCY_100M_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_write_mmd(phydev, KSZ9131RN_MMD_COMMON_CTRL_REG,
> +			    LAN8841_PTP_TX_LATENCY_100M,
> +			    LAN8841_PTP_TX_LATENCY_100M_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_write_mmd(phydev, KSZ9131RN_MMD_COMMON_CTRL_REG,
> +			    LAN8841_PTP_RX_LATENCY_1000M,
> +			    LAN8841_PTP_RX_LATENCY_1000M_VAL);
> +	if (ret)
> +		return ret;
> +
> +	return phy_write_mmd(phydev, KSZ9131RN_MMD_COMMON_CTRL_REG,
> +			     LAN8841_PTP_TX_LATENCY_1000M,
> +			     LAN8841_PTP_TX_LATENCY_1000M_VAL);
> +}

What affect does this have on systems which have already applied
adjustments in user space to correct for this? Will this cause
regressions for such systems?

I know Richard has rejected changes like this in the past.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
