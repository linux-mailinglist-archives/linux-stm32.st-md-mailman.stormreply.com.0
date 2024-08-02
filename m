Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E8A945F82
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 16:38:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C29A5C7129D;
	Fri,  2 Aug 2024 14:38:36 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F10D0C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 14:38:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F173DCE1B0C;
 Fri,  2 Aug 2024 14:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96FFC4AF0B;
 Fri,  2 Aug 2024 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722609505;
 bh=71o3IObaA9yD0TmHXVj+9FSEWjx+F9BkQDM7P7obTFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZHbTgnaFYKrgsR9M1xdGzOxKcaswozfv8aTwEnqKf9T80BhyLaFfXsV7g3Y23zxSB
 45Y++ZWnlDnVAN0khOr1S8gjWTEq6o4xt5DP0dNP+DRvz3Wn3Jen5Sgn0L3FZUEfCj
 47IR7ZEYaao6/G8KMJBu5PL6bf4V1ddZaDmYxxreZefHY37B6nMNW9wnIuxTfsXgXk
 XoWR7oNS8BaT/73Qdwp/26IivfQdo5GoqelZBzGiycXL/oZSXtwYatuMYruchpwAWu
 PGQk/9D1nc5SmCZIW/uIsbPOe+bNEX08CUEFQfgg63jETYD/0FvB2QQrudQ3819eBg
 TnJ0WZyBdrY4Q==
Date: Fri, 2 Aug 2024 15:38:18 +0100
From: Simon Horman <horms@kernel.org>
To: jitendra.vegiraju@broadcom.com
Message-ID: <20240802143818.GB2504122@kernel.org>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-2-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802031822.1862030-2-jitendra.vegiraju@broadcom.com>
Cc: andrew@lunn.ch, hawk@kernel.org, daniel@iogearbox.net,
 linux@armlinux.org.uk, netdev@vger.kernel.org, richardcochran@gmail.com,
 john.fastabend@gmail.com, ast@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, kuba@kernel.org, bpf@vger.kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] net: stmmac: Add basic
 dwxgmac4 support to stmmac core
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

On Thu, Aug 01, 2024 at 08:18:20PM -0700, jitendra.vegiraju@broadcom.com wrote:
> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> 
> Adds support for DWC_xgmac version 4.00a in stmmac core module.
> This version adds enhancements to DMA architecture for virtualization
> scalability. This is realized by decoupling physical DMA channels (PDMA)
> from Virtual DMA channels (VDMA). The  VDMAs are software abastractions
> that map to PDMAs for frame transmission and reception.
> 
> The virtualization enhancements are currently not being used and hence
> a fixed mapping of VDMA to PDMA is configured in the init functions.
> Because of the new init functions, a new instance of struct stmmac_dma_ops
> dwxgmac400_dma_ops is added.
> Most of the other dma operation functions in existing dwxgamc2_dma.c file
> can be reused.
> 
> Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

...

>  stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c

...

> @@ -641,3 +642,33 @@ const struct stmmac_dma_ops dwxgmac210_dma_ops = {
>  	.enable_sph = dwxgmac2_enable_sph,
>  	.enable_tbs = dwxgmac2_enable_tbs,
>  };
> +
> +const struct stmmac_dma_ops dwxgmac400_dma_ops = {
> +	.reset = dwxgmac2_dma_reset,
> +	.init = dwxgmac4_dma_init,
> +	.init_chan = dwxgmac2_dma_init_chan,
> +	.init_rx_chan = dwxgmac4_dma_init_rx_chan,
> +	.init_tx_chan = dwxgmac4_dma_init_tx_chan,
> +	.axi = dwxgmac2_dma_axi,
> +	.dump_regs = dwxgmac2_dma_dump_regs,
> +	.dma_rx_mode = dwxgmac2_dma_rx_mode,
> +	.dma_tx_mode = dwxgmac2_dma_tx_mode,
> +	.enable_dma_irq = dwxgmac2_enable_dma_irq,
> +	.disable_dma_irq = dwxgmac2_disable_dma_irq,
> +	.start_tx = dwxgmac2_dma_start_tx,
> +	.stop_tx = dwxgmac2_dma_stop_tx,
> +	.start_rx = dwxgmac2_dma_start_rx,
> +	.stop_rx = dwxgmac2_dma_stop_rx,
> +	.dma_interrupt = dwxgmac2_dma_interrupt,
> +	.get_hw_feature = dwxgmac2_get_hw_feature,
> +	.rx_watchdog = dwxgmac2_rx_watchdog,
> +	.set_rx_ring_len = dwxgmac2_set_rx_ring_len,
> +	.set_tx_ring_len = dwxgmac2_set_tx_ring_len,
> +	.set_rx_tail_ptr = dwxgmac2_set_rx_tail_ptr,
> +	.set_tx_tail_ptr = dwxgmac2_set_tx_tail_ptr,
> +	.enable_tso = dwxgmac2_enable_tso,
> +	.qmode = dwxgmac2_qmode,
> +	.set_bfsize = dwxgmac2_set_bfsize,
> +	.enable_sph = dwxgmac2_enable_sph,
> +	.enable_tbs = dwxgmac2_enable_tbs,
> +};

Please add dwxgmac400_dma_ops to hwif.h in this patch rather than a
subsequent one to avoid Sparse suggesting the symbol should be static.

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
