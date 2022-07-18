Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA915577E80
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Jul 2022 11:19:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81ECAC0AA15;
	Mon, 18 Jul 2022 09:19:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A489C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jul 2022 09:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g+aTLzc5WOjLByrM2aIBjE7jce/TtjRUMlCv6WTaasE=; b=FZU13y12dR3Vgw1hfnZzrtwg2F
 EaTspZRJJMBfg7ahQoT+uqQhdFMzARu3j0eunEwGF39D/BuvTRE0dxk4WFQ3OJn6gfNOOSk9aT3Gb
 +GknrDjVtkhYnXAA3H5kQotvoSa3cl6s6EmR8HfoK6xIxDa1y/0YXmvGkaNfb1A+VuZNxbpVgbRuh
 Z0dgfCitFIA2ZW3maldWMZQWXCDKLP6m3IXCH2SvPwLqP2USPg6U65cZrSQsgBtGv6PnUNMpE4kke
 vLQfR8ldIRKHp06tlrW9iZmqMhnDVzbhoaB99lRNF4UvGCJ1Amx4HGweQptOhCXk7ICuT2JvtMZ9h
 NRzKxgFw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33402)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1oDMuf-0001Lw-6u; Mon, 18 Jul 2022 10:19:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1oDMuX-0001r0-Ht; Mon, 18 Jul 2022 10:19:29 +0100
Date: Mon, 18 Jul 2022 10:19:29 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Message-ID: <YtUloYvDtTxX1MQA@shell.armlinux.org.uk>
References: <20220716230802.20788-1-ansuelsmth@gmail.com>
 <20220716230802.20788-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220716230802.20788-3-ansuelsmth@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH v3 2/5] net: ethernet: stmicro:
 stmmac: first disable all queues in release
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

On Sun, Jul 17, 2022 at 01:07:59AM +0200, Christian Marangi wrote:
> Disable all queues before tx_disable in stmmac_release to prevent a
> corner case where packet may be still queued at the same time tx_disable
> is called resulting in kernel panic if some packet still has to be
> processed.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 5578abb14949..1854dcdd6095 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3758,6 +3758,11 @@ static int stmmac_release(struct net_device *dev)
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	u32 chan;
>  
> +	stmmac_disable_all_queues(priv);
> +
> +	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
> +		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
> +
>  	netif_tx_disable(dev);

Is there a reason not to call phylink_stop() as the very first thing in
this function? That will bring the link (and therefore carrier) down
before phylink_stop() returns which should also prevent packets being
queued into the driver for transmission.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
