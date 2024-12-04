Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF9E9E4228
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2024 18:46:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5B44C71292;
	Wed,  4 Dec 2024 17:46:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99F64C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2024 17:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kzr64Zpl+/ODsxh5ngDaOioMCrFlk3ZIkJsAP9LIhGc=; b=qj+2FVi7MOovWbqbrtwMg0nY9z
 Uwx/AYN/X4CrTaCeYHsWhusd1x3YNjf5t5hpIM6gL/IMqt7g9JOlGXQwxI4XYW+g74VOfVr2lPTuC
 F21gQrknQ3AkNdIBQYNBwN/L1+6Xqw9D0Rfr33jCnwW+17ny7u0VxoMfR8v1k0T5+bd6NY7s2MIHy
 6EzvqulNhPbrA+HLs4VqdStZ6Cn58D9Uiby0NM8aQg2NLEBuDTX770jvvu5iLtZfsoQb3gWDfAAgh
 YRITv9o2zSTyRJU2D10+HpL/qWHdFOKAyvUW36sPv81P0nj+n2SFUylPKCUZ7r/F/O1sL9ibzVxk3
 5JtLW8Rg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58250)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tItRc-0003j0-1P;
 Wed, 04 Dec 2024 17:45:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tItRY-0005jt-08;
 Wed, 04 Dec 2024 17:45:44 +0000
Date: Wed, 4 Dec 2024 17:45:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <Z1CVRzWcSDuPyQZe@shell.armlinux.org.uk>
References: <20241128144501.0000619b@gmail.com>
 <20241202163309.05603e96@kernel.org>
 <20241203100331.00007580@gmail.com>
 <20241202183425.4021d14c@kernel.org>
 <20241203111637.000023fe@gmail.com>
 <klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw>
 <df3a6a9d-4b53-4338-9bc5-c4eea48b8a40@arm.com>
 <2g2lp3bkadc4wpeslmdoexpidoiqzt7vejar5xhjx5ayt3uox3@dqdyfzn6khn6>
 <Z1CFz7GpeIzkDro1@shell.armlinux.org.uk>
 <9719982a-d40c-4110-9233-def2e6cb4d74@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9719982a-d40c-4110-9233-def2e6cb4d74@nvidia.com>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <treding@nvidia.com>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unbalanced
 DMA map/unmap for non-paged SKB data
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

On Wed, Dec 04, 2024 at 05:02:19PM +0000, Jon Hunter wrote:
> Hi Russell,
> 
> On 04/12/2024 16:39, Russell King (Oracle) wrote:
> > On Wed, Dec 04, 2024 at 04:58:34PM +0100, Thierry Reding wrote:
> > > This doesn't match the location from earlier, but at least there's
> > > something afoot here that needs fixing. I suppose this could simply be
> > > hiding any subsequent errors, so once this is fixed we might see other
> > > similar issues.
> > 
> > Well, having a quick look at this, the first thing which stands out is:
> > 
> > In stmmac_tx_clean(), we have:
> > 
> >                  if (likely(tx_q->tx_skbuff_dma[entry].buf &&
> >                             tx_q->tx_skbuff_dma[entry].buf_type != STMMAC_TXBUF_T
> > _XDP_TX)) {
> >                          if (tx_q->tx_skbuff_dma[entry].map_as_page)
> >                                  dma_unmap_page(priv->device,
> >                                                 tx_q->tx_skbuff_dma[entry].buf,
> >                                                 tx_q->tx_skbuff_dma[entry].len,
> >                                                 DMA_TO_DEVICE);
> >                          else
> >                                  dma_unmap_single(priv->device,
> >                                                   tx_q->tx_skbuff_dma[entry].buf,
> >                                                   tx_q->tx_skbuff_dma[entry].len,
> >                                                   DMA_TO_DEVICE);
> >                          tx_q->tx_skbuff_dma[entry].buf = 0;
> >                          tx_q->tx_skbuff_dma[entry].len = 0;
> >                          tx_q->tx_skbuff_dma[entry].map_as_page = false;
> >                  }
> > 
> > So, tx_skbuff_dma[entry].buf is expected to point appropriately to the
> > DMA region.
> > 
> > Now if we look at stmmac_tso_xmit():
> > 
> >          des = dma_map_single(priv->device, skb->data, skb_headlen(skb),
> >                               DMA_TO_DEVICE);
> >          if (dma_mapping_error(priv->device, des))
> >                  goto dma_map_err;
> > 
> >          if (priv->dma_cap.addr64 <= 32) {
> > ...
> >          } else {
> > ...
> >                  des += proto_hdr_len;
> > ...
> > 	}
> > 
> >          tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
> >          tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_headlen(skb);
> >          tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
> >          tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
> > 
> > This will result in stmmac_tx_clean() calling dma_unmap_single() using
> > "des" and "skb_headlen(skb)" as the buffer start and length.
> > 
> > One of the requirements of the DMA mapping API is that the DMA handle
> > returned by the map operation will be passed into the unmap function.
> > Not something that was offset. The length will also be the same.
> > 
> > We can clearly see above that there is a case where the DMA handle has
> > been offset by proto_hdr_len, and when this is so, the value that is
> > passed into the unmap operation no longer matches this requirement.
> > 
> > So, a question to the reporter - what is the value of
> > priv->dma_cap.addr64 in your failing case? You should see the value
> > in the "Using %d/%d bits DMA host/device width" kernel message.
> 
> It is ...
> 
>  dwc-eth-dwmac 2490000.ethernet: Using 40/40 bits DMA host/device width

So yes, "des" is being offset, which will upset the unmap operation.
Please try the following patch, thanks:

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9b262cdad60b..c81ea8cdfe6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4192,8 +4192,8 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct stmmac_txq_stats *txq_stats;
 	struct stmmac_tx_queue *tx_q;
 	u32 pay_len, mss, queue;
+	dma_addr_t tso_des, des;
 	u8 proto_hdr_len, hdr;
-	dma_addr_t des;
 	bool set_ic;
 	int i;
 
@@ -4289,14 +4289,15 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		/* If needed take extra descriptors to fill the remaining payload */
 		tmp_pay_len = pay_len - TSO_MAX_BUFF_SIZE;
+		tso_des = des;
 	} else {
 		stmmac_set_desc_addr(priv, first, des);
 		tmp_pay_len = pay_len;
-		des += proto_hdr_len;
+		tso_des = des + proto_hdr_len;
 		pay_len = 0;
 	}
 
-	stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
+	stmmac_tso_allocator(priv, tso_des, tmp_pay_len, (nfrags == 0), queue);
 
 	/* In case two or more DMA transmit descriptors are allocated for this
 	 * non-paged SKB data, the DMA buffer address should be saved to

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
