Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB65AF9ACB
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 20:35:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4DC0C3F943;
	Fri,  4 Jul 2025 18:35:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35DC4C349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 18:35:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C95A45C69CD;
 Fri,  4 Jul 2025 18:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB0EC4CEE3;
 Fri,  4 Jul 2025 18:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751654140;
 bh=U9geYByHsf8enlHJPpCq7QpmK+9AHfjGM5nRLkE02tM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dGzz2/Y8p6yKxIIBQzuSGWV8tUC8IUNJPRS2gz/LHrY9js/7JdC8k4glofIqp77h+
 YSDivQepATF5uokXAGpsaPrQMQNYRAg2Ff43bRvt0fx666/2Cc2yY1d9XNbUp1ll66
 R/DA0QcoAqY9AeVIAm3TAA3NI/JmmMAR1cbhlWScjaM3ayyYBAg6R8tPI+D2vgYDVY
 LvOoAyF2FnzxKMD0Qb08KGndQVSSKUxAt89fhqlWLyEChOwaUAecHeByOuy+Fbhx4t
 tpBkrHRSB2vyQf5abCd+iQYhpUcXDUVmvhX0Eg71Dc9Kf22Gh6+GyCxyBhhPZp0vyi
 YTtWjjNLcqUCw==
Date: Fri, 4 Jul 2025 19:35:34 +0100
From: Simon Horman <horms@kernel.org>
To: EricChan <chenchuangyu@xiaomi.com>
Message-ID: <20250704183534.GA356576@horms.kernel.org>
References: <20250703020449.105730-1-chenchuangyu@xiaomi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250703020449.105730-1-chenchuangyu@xiaomi.com>
Cc: Yanteng Si <si.yanteng@linux.dev>, xiaojianfeng <xiaojianfeng1@xiaomi.com>,
 netdev@vger.kernel.org, Yinggang Gu <guyinggang@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, xiongliang <xiongliang@xiaomi.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Fix interrupt handling
 for level-triggered mode in DWC_XGMAC2
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

On Thu, Jul 03, 2025 at 10:04:49AM +0800, EricChan wrote:
> According to the Synopsys Controller IP XGMAC-10G Ethernet MAC Databook
> v3.30a (section 2.7.2), when the INTM bit in the DMA_Mode register is set
> to 2, the sbd_perch_tx_intr_o[] and sbd_perch_rx_intr_o[] signals operate
> in level-triggered mode. However, in this configuration, the DMA does not
> assert the XGMAC_NIS status bit for Rx or Tx interrupt events.
> 
> This creates a functional regression where the condition
> if (likely(intr_status & XGMAC_NIS)) in dwxgmac2_dma_interrupt() will
> never evaluate to true, preventing proper interrupt handling for
> level-triggered mode. The hardware specification explicitly states that
> "The DMA does not assert the NIS status bit for the Rx or Tx interrupt
> events" (Synopsys DWC_XGMAC2 Databook v3.30a, sec. 2.7.2).
> 
> The fix ensures correct handling of both edge and level-triggered
> interrupts while maintaining backward compatibility with existing
> configurations. It has been tested on the hardware device (not publicly
> available), and it can properly trigger the RX and TX interrupt handling
> in both the INTM=0 and INTM=2 configurations.
> 
> Fixes: d6ddfacd95c7 ("net: stmmac: Add DMA related callbacks for XGMAC2")
> Tested-by: EricChan <chenchuangyu@xiaomi.com>
> Signed-off-by: EricChan <chenchuangyu@xiaomi.com>
> ---
> Changes from v1:
> - Add a Fixes tag pointing to the commit in which the problem was introduced
> - Add the testing results of this patch
> 
> [v1] https://lore.kernel.org/all/20250625025134.97056-1-chenchuangyu@xiaomi.com/

Thanks,

I note that this addresses the review by Jakub of v1.

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
