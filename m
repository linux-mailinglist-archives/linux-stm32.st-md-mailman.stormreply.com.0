Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F253ED23D
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Aug 2021 12:48:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98A44C57B7A;
	Mon, 16 Aug 2021 10:47:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B1F6C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 10:47:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="196105316"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="196105316"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 03:47:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="504848340"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 16 Aug 2021 03:47:53 -0700
Received: from linux.intel.com (vwong3-iLBPG3.png.intel.com [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DF374580866;
 Mon, 16 Aug 2021 03:47:49 -0700 (PDT)
Date: Mon, 16 Aug 2021 18:47:46 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Message-ID: <20210816104746.GA9014@linux.intel.com>
References: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
 <f82f52076841285309a997f849e2786781548538.1629092894.git.vijayakannan.ayyathurai@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f82f52076841285309a997f849e2786781548538.1629092894.git.vijayakannan.ayyathurai@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, weifeng.voon@intel.com,
 vee.khee.wong@intel.com, netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/3] net: stmmac: fix INTR TBU
 status affecting irq count statistic
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

On Mon, Aug 16, 2021 at 02:15:58PM +0800, Vijayakannan Ayyathurai wrote:
> From: Voon Weifeng <weifeng.voon@intel.com>
> 
> DMA channel status "Transmit buffer unavailable(TBU)" bit is not
> considered as a successful dma tx. Hence, it should not affect
> all the irq count statistic.
>

Acked-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
 
> Fixes: 1103d3a5531c ("net: stmmac: dwmac4: Also use TBU interrupt to clean TX path")
> Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
> Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> index e63270267578..f83db62938dd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> @@ -172,11 +172,12 @@ int dwmac4_dma_interrupt(void __iomem *ioaddr,
>  		x->rx_normal_irq_n++;
>  		ret |= handle_rx;
>  	}
> -	if (likely(intr_status & (DMA_CHAN_STATUS_TI |
> -		DMA_CHAN_STATUS_TBU))) {
> +	if (likely(intr_status & DMA_CHAN_STATUS_TI)) {
>  		x->tx_normal_irq_n++;
>  		ret |= handle_tx;
>  	}
> +	if (unlikely(intr_status & DMA_CHAN_STATUS_TBU))
> +		ret |= handle_tx;
>  	if (unlikely(intr_status & DMA_CHAN_STATUS_ERI))
>  		x->rx_early_irq++;
>  
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
