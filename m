Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA33B04042
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jul 2025 15:40:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9028C3F92D;
	Mon, 14 Jul 2025 13:40:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34C20C36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 13:40:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6D7E439B0;
 Mon, 14 Jul 2025 13:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC30CC4CEED;
 Mon, 14 Jul 2025 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752500417;
 bh=ZbTnyFu2wdFpma2HJU3wztP0Nr+eewvviXPIjhzHS7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O9OMVAFaYpKkEUo00VozeeMaavQOzwZLjAlgLt8ICUjTf1vDJGPmPiVM3dxUiQT8W
 4VRwcoLQPJ6JrniWAoHeMOl0Y7I99B7kBMzoowssvE7vvbJD99wGH+WqyeduyxvpiE
 LFyTzOvhFSUSJalcrHQy3+4qT/AwKsvDWEJMVZJ9ttMUJkd+Zn1hL7vUYIym4+A5lG
 Nbg4PYgM5l/qXtq27N0m06xeSHOQnvTqco088zagti/MB+TNyP4Zi51PU8IHExyzn7
 /cSLgh9xO92hCf5ggN+Sa9BM4yu/tdDtKQgIgmfTrwZUDTk//QGnPMaS3QdxcHdY74
 WwgdJjslLUiQg==
Date: Mon, 14 Jul 2025 14:40:12 +0100
From: Simon Horman <horms@kernel.org>
To: rohan.g.thomas@altera.com
Message-ID: <20250714134012.GN721198@horms.kernel.org>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-3-c34092a88a72@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250714-xgmac-minor-fixes-v1-3-c34092a88a72@altera.com>
Cc: linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Set CIC bit
 only for TX queues with COE
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

On Mon, Jul 14, 2025 at 03:59:19PM +0800, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Currently, in the AF_XDP transmit paths, the CIC bit of
> TX Desc3 is set for all packets. Setting this bit for
> packets transmitting through queues that don't support
> checksum offloading causes the TX DMA to get stuck after
> transmitting some packets. This patch ensures the CIC bit
> of TX Desc3 is set only if the TX queue supports checksum
> offloading.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

Hi Rohan,

I notice that stmmac_xmit() handles a few other cases where
checksum offload should not be requested via stmmac_prepare_tx_desc:

        csum_insertion = (skb->ip_summed == CHECKSUM_PARTIAL);
        /* DWMAC IPs can be synthesized to support tx coe only for a few tx
         * queues. In that case, checksum offloading for those queues that don't
         * support tx coe needs to fallback to software checksum calculation.
         *
         * Packets that won't trigger the COE e.g. most DSA-tagged packets will
         * also have to be checksummed in software.
         */
        if (csum_insertion &&
            (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
             !stmmac_has_ip_ethertype(skb))) {
                if (unlikely(skb_checksum_help(skb)))
                        goto dma_map_err;
                csum_insertion = !csum_insertion;
        }

Do we need to care about them in stmmac_xdp_xmit_zc()
and stmmac_xdp_xmit_xdpf() too?

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
