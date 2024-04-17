Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3448A8B2E
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 20:34:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C274C6C859;
	Wed, 17 Apr 2024 18:34:07 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE53FC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 18:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=qyvdskYVnamQI3a/ILIalEumJFvEM9exFz2R/7q+4jE=; b=ipL+I8TVXay+xwWsxLnGcJxNq+
 3MXPVeffIwUTLH4aFqP2fzWB99kP6oLrc3fydU+rNpr2jleE5dV3VCx+y794YXUXnqUhYl9g208Gh
 hm5aTjVvDdsaJfvozWQ84C1ALa7MppKCBaGT9jY22rHzGVmw0tSveXsTpH4kuza9SKH0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rxA6E-00DGzN-GY; Wed, 17 Apr 2024 20:33:38 +0200
Date: Wed, 17 Apr 2024 20:33:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <898f435b-99dd-4636-9a52-558780c1bb06@lunn.ch>
References: <20240417164316.1755299-1-o.rempel@pengutronix.de>
 <20240417164316.1755299-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240417164316.1755299-2-o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>,
 Arun Ramadoss <arun.ramadoss@microchip.com>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 UNGLinuxDriver@microchip.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/4] net: phy: Add TimeSync
 delay query support to PHYlib API
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

On Wed, Apr 17, 2024 at 06:43:13PM +0200, Oleksij Rempel wrote:
> Add a new phy_get_timesync_data_path_delays() function, to the PHY
> device API. This function enables querying the ingress and egress
> TimeSync delays for PHY devices, as specified in IEEE 802.3-2022
> sections 30.13.1.3 to 30.13.1.6. The function adds the capability to
> obtain the average delays in nanoseconds, which can be used to
> compensate for time variations added by the PHY to PTP packets.
> 
> Since most PHYs do not provide register-based delay information, PHY
> drivers should supply this data, typically dependent on the interface
> type (MII, RGMII, etc.) and link speed. The MAC driver, or consumer of
> this API, is expected to invoke this function upon link establishment to
> accurately compensate for any PHY-induced time discrepancies.

So your intention is that this function is called from within the
adjust_link callback? Hence there is no locking being performed
because the lock is already held?

> +/**
> + * phy_get_timesync_data_path_delays - get the TimeSync data path ingress/egress
> + *                                     delays
> + * @phydev: phy_device struct
> + * @tx_delay_ns: pointer to the transmit delay in nanoseconds
> + * @rx_delay_ns: pointer to the receive delay in nanoseconds
> + *
> + * This function is used to get the TimeSync data path ingress/egress delays
> + * as described in IEEE 802.3-2022 sections:
> + * 30.13.1.3 aTimeSyncDelayTXmax, 30.13.1.4 aTimeSyncDelayTXmin,
> + * 30.13.1.5 aTimeSyncDelayRXmax and 30.13.1.6 aTimeSyncDelayRXmin.
> + *
> + * The delays are returned in nanoseconds and can be used to compensate time
> + * added by the PHY to the PTP packets.

Please document the context this function should be used in. If users
use it outside of the adjust_link callback, the locking will be
wrong....

> + *
> + * Returns 0 on success, negative value on failure.

I think kdocs now requires a : after Returns ?

> +	/**
> +	 * @get_timesync_data_path_delays: Get the PHY time sync delay values
> +	 * @dev: PHY device
> +	 * @tsd: PHY time sync delay values
> +	 *
> +	 * Returns 0 on success, or an error code.

Same here.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
