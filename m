Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73892A25716
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 11:38:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24862C7802B;
	Mon,  3 Feb 2025 10:38:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2381CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j7v8B5fuLOyvPnE4F8xYonpHQmsOiXgCq2SRnIU+w8s=; b=nCpBsD3EHXJbS6gCHh0n8jBA+V
 bVSEjDPTWHFg73BKqz+RvYvf+t2x9qjPE6p6EKUZFYgCQRGAFBViMN4eN8btr5AcYZbB9hcdEqgtT
 T0vmFCauZEeXs2NPccXqd7q0JGLDj3PScZlXKOUSJFhS+WZn8XgaKh+fb/sXuRDKi+tC1sDRNTlZ8
 hiauULcVJ9BtyaIlBfdrW9kYBY1v2goRLxjIVksrxiOEWdqAmUfF/IbF3H+fF4JXCN1Kn3T9vUQnq
 lDqHKadfnhJ1oqX1QwCFm7s11WAofC8USnw00wQZWnHCmt6ifAkCo5oe3RlhWxHehqWKN/ugV+Kts
 pNIYkEvg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33290)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tetqI-0008Fh-2Y;
 Mon, 03 Feb 2025 10:38:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tetqC-0000IW-15;
 Mon, 03 Feb 2025 10:38:08 +0000
Date: Mon, 3 Feb 2025 10:38:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Steven Price <steven.price@arm.com>
Message-ID: <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
References: <20250203093419.25804-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250203093419.25804-1-steven.price@arm.com>
Cc: Furong Xu <0x1207@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Petr Tesarik <petr@tesarici.cz>, netdev@vger.kernel.org,
 Yanteng Si <si.yanteng@linux.dev>, linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Xi Ruoyao <xry111@xry111.site>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Allow zero for
	[tr]x_fifo_size
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

On Mon, Feb 03, 2025 at 09:34:18AM +0000, Steven Price wrote:
> Commit 8865d22656b4 ("net: stmmac: Specify hardware capability value
> when FIFO size isn't specified") modified the behaviour to bail out if
> both the FIFO size and the hardware capability were both set to zero.
> However devices where has_gmac4 and has_xgmac are both false don't use
> the fifo size and that commit breaks platforms for which these values
> were zero.
> 
> Only warn and error out when (has_gmac4 || has_xgmac) where the values
> are used and zero would cause problems, otherwise continue with the zero
> values.
> 
> Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when FIFO size isn't specified")
> Tested-by: Xi Ruoyao <xry111@xry111.site>
> Signed-off-by: Steven Price <steven.price@arm.com>

I'm still of the opinion that the original patch set was wrong, and
I was thinking at the time that it should _not_ have been submitted
for the "net" tree (it wasn't fixing a bug afaics, and was a risky
change.)

Yes, we had multiple places where we have code like:

        int rxfifosz = priv->plat->rx_fifo_size;
        int txfifosz = priv->plat->tx_fifo_size;

        if (rxfifosz == 0)
                rxfifosz = priv->dma_cap.rx_fifo_size;
        if (txfifosz == 0)
                txfifosz = priv->dma_cap.tx_fifo_size;

        /* Split up the shared Tx/Rx FIFO memory on DW QoS Eth and DW XGMAC */
        if (priv->plat->has_gmac4 || priv->plat->has_xgmac) {
                rxfifosz /= rx_channels_count;
                txfifosz /= tx_channels_count;
        }

and this is passed to stmmac_dma_rx_mode() and stmmac_dma_tx_mode().

We also have it in the stmmac_change_mtu() path for the transmit side,
which ensures that the MTU value is not larger than the transmit FIFO
size (which is going to fail as it's always done before or after the
original patch set, and whether or not your patch is applied.)

Now, as for the stmmac_dma_[tr]x_mode(), these are method functions
calling into the DMA code. dwmac4, dwmac1000, dwxgmac2, dwmac100 and
sun8i implement methods for this.

Of these, dwmac4, dwxgmac2 makes use of the value passed into
stmmac_dma_[tr]x_mode() - both of which initialise dma.[tr]x_fifo_size.
dwmac1000, dwmac100 and sun8i do not make use of it.

So, going back to the original patch series, I still question the value
of the changes there - and with your patch, it makes their value even
less because the justification seemed to be to ensure that
priv->plat->[tr]x_fifo_size contained a sensible value. With your patch
we're going back to a situation where we allow these to effectively be
"unset" or zero.

I'll ask the question straight out - with your patch applied, what is
the value of the original four patch series that caused the breakage?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
