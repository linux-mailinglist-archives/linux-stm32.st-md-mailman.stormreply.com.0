Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 977B6A03DAC
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 12:29:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3987FC78022;
	Tue,  7 Jan 2025 11:29:05 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECE3BC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 11:28:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 25E8DA40AC8;
 Tue,  7 Jan 2025 11:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF24DC4CED6;
 Tue,  7 Jan 2025 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736249336;
 bh=a/nUa1LpYlu8s73KEhuvs+6oTFnQ69UQk445ZrCficQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gImPgzFWKdaLfhzGloiicMj18CgRTePlPywu2sxqZzJB7pXfAAPZTTzPlM2C7keyA
 AAwwEKlIqBk+qKD6ZN670879wOhRm2SVeuE1Q5WW5BVoso2KdTqx5BOD6XMEKOpQD7
 vcrMImtbS9DRqzk2wHZjJp7TnPk+xw2R6tOrquuOIIxtuzSEVLhvw4KxP1I9u2r0mR
 A0zSxUozsvlgs/KDIbGMSn3t5vIhlNGvSN2Teu0WhSqU4STXkemsvEqruKTHLnWZ/4
 efI7l28N48n3OW3n7inOwPcRKmfyLLpiDbkhBA049t33h1iAmYfpV3CFTvjUg/Xk7T
 hk7erpGh03HAw==
Date: Tue, 7 Jan 2025 11:28:51 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250107112851.GE33144@kernel.org>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 03/17] net: stmmac: use
 correct type for tx_lpi_timer
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

On Mon, Jan 06, 2025 at 12:24:58PM +0000, Russell King (Oracle) wrote:
> The ethtool interface uses u32 for tx_lpi_timer, and so does phylib.
> Use u32 to store this internally within stmmac rather than "int"
> which could misinterpret large values.
> 
> Since eee_timer is used to initialise priv->tx_lpi_timer, this also
> should be unsigned to avoid a negative number being interpreted as a
> very large positive number.
> 
> Also correct "value" in dwmac4_set_eee_lpi_entry_timer() to use u32
> rather than int, which is derived from tx_lpi_timer, even though
> masking with STMMAC_ET_MAX will truncate the sign bits. u32 is the
> value argument type for writel().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9a9169ca7cd2..b0ef439b715b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -111,8 +111,8 @@ static const u32 default_msg_level = (NETIF_MSG_DRV | NETIF_MSG_PROBE |
>  				      NETIF_MSG_IFDOWN | NETIF_MSG_TIMER);
>  
>  #define STMMAC_DEFAULT_LPI_TIMER	1000
> -static int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> -module_param(eee_timer, int, 0644);
> +static unsigned int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> +module_param(eee_timer, uint, 0644);
>  MODULE_PARM_DESC(eee_timer, "LPI tx expiration time in msec");
>  #define STMMAC_LPI_T(x) (jiffies + usecs_to_jiffies(x))
>  

Hi Russell,

now that eee_timer is unsigned the following check in stmmac_verify_args()
can never be true. I guess it should be removed.

        if (eee_timer < 0)
                eee_timer = STMMAC_DEFAULT_LPI_TIMER;

Flagged by Smatch.

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
