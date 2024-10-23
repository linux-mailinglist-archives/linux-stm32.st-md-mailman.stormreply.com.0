Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 226F69AC21F
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 10:49:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD771C71287;
	Wed, 23 Oct 2024 08:49:23 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EACDAC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 08:49:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6F462A444AE;
 Wed, 23 Oct 2024 08:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC8DC4CEC6;
 Wed, 23 Oct 2024 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729673355;
 bh=7NhjULpJR19EvTFu6kukQjms/KFY1lUVI61YeGXteK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mCa7dn6prblg2R6KnQjb+AXq101pO4zTQ6kdNO0cGMRoSxe4p8mcSY11kut/o4ARa
 VIb3+v0Ulxo4NjOxCI69dz3NnHfyMuLr5lUiqauOKBRGtmpjo85QQfoOkC/cvvbOq/
 nNafENibQaC0pa/HBqLQku9SGDNagfPnOFHMa28Dm+8nzXTSZQEwRZTdCnHMd7sfLx
 Vn04n7/iJ0IeP/lcMgNlGbsEUsvemJANyJVFPQrp5+D8yNtayXxm9X7ilTIqRotpLs
 bB1EuQxYmNO/KtQ9wtLYYD/uAmHQD5WePX+P/GW2Ogbm1QTbREYOVHB+XoPZWvhBWH
 oLU+MCJztxvCQ==
Date: Wed, 23 Oct 2024 09:49:10 +0100
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241023084910.GL402847@kernel.org>
References: <tencent_CCC29C4F562F2DEFE48289DB52F4D91BDE05@qq.com>
 <20241021130554.00005cf5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021130554.00005cf5@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 hailong.fan@siengine.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, 2694439648@qq.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] net: stmmac: enable MAC after MTL
	configuring
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

On Mon, Oct 21, 2024 at 01:05:54PM +0800, Furong Xu wrote:
> On Mon, 21 Oct 2024 09:03:05 +0800, 2694439648@qq.com wrote:
> 
> > From: "hailong.fan" <hailong.fan@siengine.com>
> > 
> > DMA maybe block while ETH is opening,
> > Adjust the enable sequence, put the MAC enable last
> > 
> > For example, ETH is directly connected to the switch,
> > which never power down and sends broadcast packets at regular intervals.
> > During the process of opening ETH, data may flow into the MTL FIFO,
> > once MAC RX is enabled. and then, MTL will be set, such as FIFO size.
> > Once enable DMA, There is a certain probability that DMA will read
> > incorrect data from MTL FIFO, causing DMA to hang up.
> > By read DMA_Debug_Status, you can be observed that the RPS remains at
> > a certain value forever. The correct process should be to configure
> > MAC/MTL/DMA before enabling DMA/MAC
> > 
> > Signed-off-by: hailong.fan <hailong.fan@siengine.com>
> > 
> 
> A Fixes: tag should be added.

Also, as this patch is a fix for net, that target should be noted in the
subject.

  Subject: [PATCH v2 net] ...

Please address this and the issues raised by Furong Xu and post a v3.

> >  static void dwxgmac2_dma_stop_rx(struct stmmac_priv *priv, void __iomem *ioaddr,
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index e21404822..c19ca62a4 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3437,9 +3437,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
> >  		priv->hw->rx_csum = 0;
> >  	}
> >  
> > -	/* Enable the MAC Rx/Tx */
> > -	stmmac_mac_set(priv, priv->ioaddr, true);
> > -
> >  	/* Set the HW DMA mode and the COE */
> >  	stmmac_dma_operation_mode(priv);
> >  
> > @@ -3523,6 +3520,9 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
> >  	/* Start the ball rolling... */
> >  	stmmac_start_all_dma(priv);
> >  
> > +	/* Enable the MAC Rx/Tx */
> > +	stmmac_mac_set(priv, priv->ioaddr, true);
> > +
> 
> This sequence fix should be applied to stmmac_xdp_open() too.
> 
> >  	stmmac_set_hw_vlan_mode(priv, priv->hw);
> >  
> >  	return 0;
> 
> It is better to split this patch into individual patches, since you are
> trying to fix an issue related to several previous commits:
> dwmac4, dwxgmac2, stmmac_hw_setup() and stmmac_xdp_open()

And each patch should have an appropriate Fixes tag.

-- 
pw-bot: changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
