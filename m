Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 707E29E3FD5
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2024 17:40:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AE18C71292;
	Wed,  4 Dec 2024 16:40:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E88F9C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2024 16:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t8Qpni1g+CTP4DtqlAKjnlwu/KLFrA6csbzYi4hK4/c=; b=ta8+rhefvAfTVON2qkfHns8aKZ
 M3XgNBM1LKMVU/0hPzAABXNPwE1ahhu39CoKAY6ro8Z5K5XSyjrV2mUmNVjMLoH8iRUQ175ViA3ai
 Cjy25bi6xMVT0qJmza5h/5eTycpxyifsdFrPNu6Onj1aLEoBNw3U1Povys8tefq3W+sxf3HOM0wSm
 p74skew5erUlsSllvX8L2IxRjnCSrszXm+ncYbx4w6JqSayC1b+GLpdPhtab9hx0vdbDUJFtD18IW
 AZ30ZID3dKWRdEpD9Cipoh79ds1zjZ2Z5HL8F4GtBH9RWrGu/2wMDE+MIkxmtKUWOzLkMs7MsSRRY
 m0bccgOw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43724)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tIsPk-0003eW-0H;
 Wed, 04 Dec 2024 16:39:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tIsPf-0005hd-1N;
 Wed, 04 Dec 2024 16:39:43 +0000
Date: Wed, 4 Dec 2024 16:39:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <Z1CFz7GpeIzkDro1@shell.armlinux.org.uk>
References: <20241021061023.2162701-1-0x1207@gmail.com>
 <d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
 <20241128144501.0000619b@gmail.com>
 <20241202163309.05603e96@kernel.org>
 <20241203100331.00007580@gmail.com>
 <20241202183425.4021d14c@kernel.org>
 <20241203111637.000023fe@gmail.com>
 <klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw>
 <df3a6a9d-4b53-4338-9bc5-c4eea48b8a40@arm.com>
 <2g2lp3bkadc4wpeslmdoexpidoiqzt7vejar5xhjx5ayt3uox3@dqdyfzn6khn6>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2g2lp3bkadc4wpeslmdoexpidoiqzt7vejar5xhjx5ayt3uox3@dqdyfzn6khn6>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
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

On Wed, Dec 04, 2024 at 04:58:34PM +0100, Thierry Reding wrote:
> This doesn't match the location from earlier, but at least there's
> something afoot here that needs fixing. I suppose this could simply be
> hiding any subsequent errors, so once this is fixed we might see other
> similar issues.

Well, having a quick look at this, the first thing which stands out is:

In stmmac_tx_clean(), we have:

                if (likely(tx_q->tx_skbuff_dma[entry].buf &&
                           tx_q->tx_skbuff_dma[entry].buf_type != STMMAC_TXBUF_T
_XDP_TX)) {
                        if (tx_q->tx_skbuff_dma[entry].map_as_page)
                                dma_unmap_page(priv->device,
                                               tx_q->tx_skbuff_dma[entry].buf,
                                               tx_q->tx_skbuff_dma[entry].len,
                                               DMA_TO_DEVICE);
                        else
                                dma_unmap_single(priv->device,
                                                 tx_q->tx_skbuff_dma[entry].buf,
                                                 tx_q->tx_skbuff_dma[entry].len,
                                                 DMA_TO_DEVICE);
                        tx_q->tx_skbuff_dma[entry].buf = 0;
                        tx_q->tx_skbuff_dma[entry].len = 0;
                        tx_q->tx_skbuff_dma[entry].map_as_page = false;
                }

So, tx_skbuff_dma[entry].buf is expected to point appropriately to the
DMA region.

Now if we look at stmmac_tso_xmit():

        des = dma_map_single(priv->device, skb->data, skb_headlen(skb),
                             DMA_TO_DEVICE);
        if (dma_mapping_error(priv->device, des))
                goto dma_map_err;

        if (priv->dma_cap.addr64 <= 32) {
...
        } else {
...
                des += proto_hdr_len;
...
	}

        tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
        tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_headlen(skb);
        tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
        tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;

This will result in stmmac_tx_clean() calling dma_unmap_single() using
"des" and "skb_headlen(skb)" as the buffer start and length.

One of the requirements of the DMA mapping API is that the DMA handle
returned by the map operation will be passed into the unmap function.
Not something that was offset. The length will also be the same.

We can clearly see above that there is a case where the DMA handle has
been offset by proto_hdr_len, and when this is so, the value that is
passed into the unmap operation no longer matches this requirement.

So, a question to the reporter - what is the value of
priv->dma_cap.addr64 in your failing case? You should see the value
in the "Using %d/%d bits DMA host/device width" kernel message.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
