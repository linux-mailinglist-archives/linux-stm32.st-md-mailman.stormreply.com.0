Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 886B04972BA
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jan 2022 16:52:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30578C5EC76;
	Sun, 23 Jan 2022 15:52:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2900AC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=EMC6Ft10JXwi16PGGMWQ1pe3LM0kkBsvwtaXhgSs0wM=; b=EO0tRbP4Cm6mmtzSNEUjPEe+fN
 gEll1aTSwCLFqWNaKAehFMt6LO3f3TV6EsNHAZGABi4xyxeHb8Tpf+vbNq26LfSK0KL9iDpWUzJZI
 +kQE8nHGPjqqqISIy1/DC/Yk4uQ+cxG41jqOjV8AQAKzMk3WcnoirV20gNJSx7do3ELU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nBfAL-002OLT-JC; Sun, 23 Jan 2022 16:52:29 +0100
Date: Sun, 23 Jan 2022 16:52:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <Ye15va7tFWMgKPEE@lunn.ch>
References: <20220123141245.1060-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123141245.1060-1-jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: don't stop RXC during LPI
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

On Sun, Jan 23, 2022 at 10:12:45PM +0800, Jisheng Zhang wrote:
> I met can't receive rx pkt issue with below steps:
> 0.plug in ethernet cable then boot normal and get ip from dhcp server
> 1.quickly hotplug out then hotplug in the ethernet cable
> 2.trigger the dhcp client to renew lease
> 
> tcpdump shows that the request tx pkt is sent out successfully,
> but the mac can't receive the rx pkt.
> 
> The issue can easily be reproduced on platforms with PHY_POLL external
> phy. If we don't allow the phy to stop the RXC during LPI, the issue
> is gone. I think it's unsafe to stop the RXC during LPI because the mac
> needs RXC clock to support RX logic.
> 
> And the 2nd param clk_stop_enable of phy_init_eee() is a bool, so use
> false instead of 0.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 6708ca2aa4f7..92a9b0b226b1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1162,7 +1162,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  
>  	stmmac_mac_set(priv, priv->ioaddr, true);
>  	if (phy && priv->dma_cap.eee) {
> -		priv->eee_active = phy_init_eee(phy, 1) >= 0;
> +		priv->eee_active = phy_init_eee(phy, false) >= 0;

This has not caused issues in the past. So i'm wondering if this is
somehow specific to your system? Does everybody else use a PHY which
does not implement this bit? Does your synthesis of the stmmac have a
different clock tree?

By changing this value for every instance of the stmmac, you are
potentially causing a power regression for stmmac implementations
which don't need the clock. So we need a clear understanding, stopping
the clock is wrong in general and so the change is correct in
general. Or this is specific to your system, and you probably need to
add priv->dma_cap.keep_rx_clock_ticking, which you set in your glue
driver,and use here to decide what to pass to phy_init_eee().

	   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
