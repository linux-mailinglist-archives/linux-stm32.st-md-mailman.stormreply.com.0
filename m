Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 172299A6841
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 14:26:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA3C4C7801A;
	Mon, 21 Oct 2024 12:26:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BD6AC7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 12:26:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C2AE85C5561;
 Mon, 21 Oct 2024 12:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F5EC4CEC3;
 Mon, 21 Oct 2024 12:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729513565;
 bh=cx/tLvH9CPRgHxEav9sPf4o/gHFa4lb5PR3fe7KBDA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HlF6z4iSE4m4KO6vx5hubfGjBlUBCwj1PXsxIH+/Xcop+vfX86LaDkpRtod2cq+MH
 xH+iCQ7icStQOSTZEWdc7fwJ2/vdFJWRYkY8zGc56jciyDi9wjqf3ULXVX0bpDynPR
 TABkMjgXNxkDAXPztzvpPj4Y0rCfErFGxe9c9p5bryS3zWbd8G4u9ot6FCw+FIbdfv
 Pi3m1RlJ4bGU9Z8TSdjIx1fidU6H8IECafN4z0VFaBT+I+dzNoeq1cC5K/+tD2XSYa
 CY3zwTqSII+OWs2FChK3B0e9JOcWROv1/xtstboToEqnH7FR+5JCEpEFWZpZ1FpbJG
 deqz1OZtUifHg==
Date: Mon, 21 Oct 2024 13:26:01 +0100
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241021122601.GI402847@kernel.org>
References: <20241021061023.2162701-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021061023.2162701-1-0x1207@gmail.com>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
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

On Mon, Oct 21, 2024 at 02:10:23PM +0800, Furong Xu wrote:
> In case the non-paged data of a SKB carries protocol header and protocol
> payload to be transmitted on a certain platform that the DMA AXI address
> width is configured to 40-bit/48-bit, or the size of the non-paged data
> is bigger than TSO_MAX_BUFF_SIZE on a certain platform that the DMA AXI
> address width is configured to 32-bit, then this SKB requires at least
> two DMA transmit descriptors to serve it.
> 
> For example, three descriptors are allocated to split one DMA buffer
> mapped from one piece of non-paged data:
>     dma_desc[N + 0],
>     dma_desc[N + 1],
>     dma_desc[N + 2].
> Then three elements of tx_q->tx_skbuff_dma[] will be allocated to hold
> extra information to be reused in stmmac_tx_clean():
>     tx_q->tx_skbuff_dma[N + 0],
>     tx_q->tx_skbuff_dma[N + 1],
>     tx_q->tx_skbuff_dma[N + 2].
> Now we focus on tx_q->tx_skbuff_dma[entry].buf, which is the DMA buffer
> address returned by DMA mapping call. stmmac_tx_clean() will try to
> unmap the DMA buffer _ONLY_IF_ tx_q->tx_skbuff_dma[entry].buf
> is a valid buffer address.
> 
> The expected behavior that saves DMA buffer address of this non-paged
> data to tx_q->tx_skbuff_dma[entry].buf is:
>     tx_q->tx_skbuff_dma[N + 0].buf = NULL;
>     tx_q->tx_skbuff_dma[N + 1].buf = NULL;
>     tx_q->tx_skbuff_dma[N + 2].buf = dma_map_single();
> Unfortunately, the current code misbehaves like this:
>     tx_q->tx_skbuff_dma[N + 0].buf = dma_map_single();
>     tx_q->tx_skbuff_dma[N + 1].buf = NULL;
>     tx_q->tx_skbuff_dma[N + 2].buf = NULL;
> 
> On the stmmac_tx_clean() side, when dma_desc[N + 0] is closed by the
> DMA engine, tx_q->tx_skbuff_dma[N + 0].buf is a valid buffer address
> obviously, then the DMA buffer will be unmapped immediately.
> There may be a rare case that the DMA engine does not finish the
> pending dma_desc[N + 1], dma_desc[N + 2] yet. Now things will go
> horribly wrong, DMA is going to access a unmapped/unreferenced memory
> region, corrupted data will be transmited or iommu fault will be
> triggered :(
> 
> In contrast, the for-loop that maps SKB fragments behaves perfectly
> as expected, and that is how the driver should do for both non-paged
> data and paged frags actually.
> 
> This patch corrects DMA map/unmap sequences by fixing the array index
> for tx_q->tx_skbuff_dma[entry].buf when assigning DMA buffer address.
> 
> Tested and verified on DWXGMAC CORE 3.20a
> 
> Reported-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> Fixes: f748be531d70 ("stmmac: support new GMAC4")
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Thanks for the very thorough explanation, much appreciated.

Reviewed-by: Simon Horman <horms@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
