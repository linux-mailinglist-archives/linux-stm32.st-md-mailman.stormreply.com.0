Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0832949A8F
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 23:57:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77328C7129D;
	Tue,  6 Aug 2024 21:57:04 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46E38C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 21:56:57 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f16767830dso12207121fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Aug 2024 14:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722981416; x=1723586216;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W6MPx6EpPmKaQ9lPkOLAzoJdOfI6/FaVi+vpEu4BxRo=;
 b=GPf+EaSMJ/p1G5mcUHjoRoEtnYcVmN5P1El3bCSgWuEVdh2sv6SW1trW1W9b47Gz2Q
 0J2ANrqBjKvm9A3oXshifqMaMLG3FGtX7NPdnj3y7hfsTMGXU6tv5usMB8ZKhmGBGDpP
 WL+4QHryUQXfU3z448JTiuFZzjtHGCfDQKSJLHYLFYE5i66vHv0RqRmSrzvIgw6UwFac
 3CvkmoDnn9MsfHctTEcUjASP1+g82fJxHGGZQYCpbpWizpzM8+/mmfnGExzV934ZaZlB
 nd97oj3snfh6sEfEGaomxMq8S0K6wsvqP+VuxM+CVVR9V1ps1yOu08OvyrPEVFFBNNS6
 gY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722981416; x=1723586216;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6MPx6EpPmKaQ9lPkOLAzoJdOfI6/FaVi+vpEu4BxRo=;
 b=ohgysUhdeKRSNsBB9h5waWlwA5OMdVPHA+fC82o2BKovWcbicTaMa9neSCO7DFSzHm
 3aoGUv5yLUw+DIs4PqeNGzEf4pYXtIStnkzdWZ44OZClovKkL3d5d+oLAY2Ju8me8ofc
 zMrYikEbt+bLgSdejJZRgbYPbOydsbGrLtETO21rsq7q2S8C8Eb3YD8qb9jmd+OtY4ml
 d+ffqYGfPZDfUO/rLuGtMnh6/70NNAJKBc+11AyCTSR3aeAdgjptSwBGXMqJc/8BhUyG
 kwezN+79+ySSjgS6cdzMa4Sj9XvsKVKxJhPgTY9j59yITcYZyZKqH3kCw+0Y7xemAWU8
 5r+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3lYS7HhKTm4J1fWNBW8X7x0Hml+G8XogOox2GIkPYmfVNEvui80GCuoYzYM6KGAOCKKdZwbGq8eB5anjlbzpKmxTI5YCvwJUgd0p+1G7OQEgD6tcCTr1L
X-Gm-Message-State: AOJu0YzikigQWVnBuL6u4MhqPWclgaC0Kvv5RkBRAr/Kyvr72gspK9c5
 bpPaT5/1DAaJJVD6v9DQodpiOIlPlF8NIRlh2O0RxLxv2o+20+eZ
X-Google-Smtp-Source: AGHT+IGndPovKdG9kqTQoq4yO1/t8TMk9tRPZMqjFWB+ekO4WLiI8dYz51DHkGby04QVqSYknA6PsA==
X-Received: by 2002:a05:6512:2399:b0:52c:d904:d26e with SMTP id
 2adb3069b0e04-530bb36fe6amr12514300e87.21.1722981415879; 
 Tue, 06 Aug 2024 14:56:55 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de4022f3sm992e87.110.2024.08.06.14.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 14:56:55 -0700 (PDT)
Date: Wed, 7 Aug 2024 00:56:53 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: jitendra.vegiraju@broadcom.com
Message-ID: <zlbtbzch6reo656d72it5h2s7p5bnwhexire36v3w63mazidta@cqyiza4k562t>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-2-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802031822.1862030-2-jitendra.vegiraju@broadcom.com>
Cc: andrew@lunn.ch, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, horms@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net
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

As we figured out (didn't we?) that it's actually the DW 25GMAC, then
it should be taken into account across the entire series.

> 
> Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
>  .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  31 ++++
>  .../net/ethernet/stmicro/stmmac/dwxgmac4.c    | 142 ++++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/dwxgmac4.h    |  84 +++++++++++
>  4 files changed, 258 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwxgmac4.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwxgmac4.h
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index c2f0e91f6bf8..2f637612513d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -6,7 +6,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
>  	      mmc_core.o stmmac_hwtstamp.o stmmac_ptp.o dwmac4_descs.o	\
>  	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
>  	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
> -	      stmmac_xdp.o stmmac_est.o \

> +	      stmmac_xdp.o stmmac_est.o dwxgmac4.o \

dw25gmac.o?

>  	      $(stmmac-y)
>  
>  stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index dd2ab6185c40..c15f5247aaa8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -7,6 +7,7 @@
>  #include <linux/iopoll.h>
>  #include "stmmac.h"
>  #include "dwxgmac2.h"

> +#include "dwxgmac4.h"

"dw25gmac.h"?

>  
>  static int dwxgmac2_dma_reset(void __iomem *ioaddr)
>  {
> @@ -641,3 +642,33 @@ const struct stmmac_dma_ops dwxgmac210_dma_ops = {
>  	.enable_sph = dwxgmac2_enable_sph,
>  	.enable_tbs = dwxgmac2_enable_tbs,
>  };
> +

> +const struct stmmac_dma_ops dwxgmac400_dma_ops = {

dw25gmac_dma_ops?

> +	.reset = dwxgmac2_dma_reset,

> +	.init = dwxgmac4_dma_init,
> +	.init_chan = dwxgmac2_dma_init_chan,
> +	.init_rx_chan = dwxgmac4_dma_init_rx_chan,
> +	.init_tx_chan = dwxgmac4_dma_init_tx_chan,

dw25gmac_dma_init, dw25gmac_dma_init_rx_chan, dw25gmac_dma_init_tx_chan?

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

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.c
> new file mode 100644
> index 000000000000..9c8748122dc6
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.c

dw25gmac.c?

> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Broadcom Corporation
> + */
> +#include "dwxgmac2.h"

> +#include "dwxgmac4.h"

dw25gmac.h?

> +
> +static int rd_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel)
> +{
> +	u32 reg_val = 0;
> +	u32 val = 0;
> +
> +	reg_val |= mode << XGMAC4_MSEL_SHIFT & XGMAC4_MODE_SELECT;
> +	reg_val |= channel << XGMAC4_AOFF_SHIFT & XGMAC4_ADDR_OFFSET;
> +	reg_val |= XGMAC4_CMD_TYPE | XGMAC4_OB;
> +	writel(reg_val, ioaddr + XGMAC4_DMA_CH_IND_CONTROL);
> +	val = readl(ioaddr + XGMAC4_DMA_CH_IND_DATA);
> +	return val;
> +}
> +
> +static void wr_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel, u32 val)
> +{
> +	u32 reg_val = 0;
> +
> +	writel(val, ioaddr + XGMAC4_DMA_CH_IND_DATA);
> +	reg_val |= mode << XGMAC4_MSEL_SHIFT & XGMAC4_MODE_SELECT;
> +	reg_val |= channel << XGMAC4_AOFF_SHIFT & XGMAC4_ADDR_OFFSET;
> +	reg_val |= XGMAC_OB;
> +	writel(reg_val, ioaddr + XGMAC4_DMA_CH_IND_CONTROL);
> +}
> +

> +static void xgmac4_tp2tc_map(void __iomem *ioaddr, u8 pdma_ch, u32 tc_num)
> +{
> +	u32 val = 0;
> +
> +	val = rd_dma_ch_ind(ioaddr, MODE_TXEXTCFG, pdma_ch);
> +	val &= ~XGMAC4_TP2TCMP;
> +	val |= tc_num << XGMAC4_TP2TCMP_SHIFT & XGMAC4_TP2TCMP;
> +	wr_dma_ch_ind(ioaddr, MODE_TXEXTCFG, pdma_ch, val);
> +}
> +
> +static void xgmac4_rp2tc_map(void __iomem *ioaddr, u8 pdma_ch, u32 tc_num)
> +{
> +	u32 val = 0;
> +
> +	val = rd_dma_ch_ind(ioaddr, MODE_RXEXTCFG, pdma_ch);
> +	val &= ~XGMAC4_RP2TCMP;
> +	val |= tc_num << XGMAC4_RP2TCMP_SHIFT & XGMAC4_RP2TCMP;
> +	wr_dma_ch_ind(ioaddr, MODE_RXEXTCFG, pdma_ch, val);
> +}

What does "tc" stand for? Traffic control? If it's a kind of queue
then what about implementing the stmmac_ops::map_mtl_to_dma interface
method?

> +
> +void dwxgmac4_dma_init(void __iomem *ioaddr,
> +		       struct stmmac_dma_cfg *dma_cfg, int atds)
> +{
> +	u32 value;
> +	u32 i;
> +
> +	value = readl(ioaddr + XGMAC_DMA_SYSBUS_MODE);
> +
> +	if (dma_cfg->aal)
> +		value |= XGMAC_AAL;
> +
> +	if (dma_cfg->eame)
> +		value |= XGMAC_EAME;
> +
> +	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
> +
> +	for (i = 0; i < VDMA_TOTAL_CH_COUNT; i++) {

> +		value = rd_dma_ch_ind(ioaddr, MODE_TXDESCCTRL, i);
> +		value &= ~XGMAC4_TXDCSZ;
> +		value |= 0x3;
> +		value &= ~XGMAC4_TDPS;
> +		value |= (3 << XGMAC4_TDPS_SHIFT) & XGMAC4_TDPS;
> +		wr_dma_ch_ind(ioaddr, MODE_TXDESCCTRL, i, value);
> +
> +		value = rd_dma_ch_ind(ioaddr, MODE_RXDESCCTRL, i);
> +		value &= ~XGMAC4_RXDCSZ;
> +		value |= 0x3;
> +		value &= ~XGMAC4_RDPS;
> +		value |= (3 << XGMAC4_RDPS_SHIFT) & XGMAC4_RDPS;
> +		wr_dma_ch_ind(ioaddr, MODE_RXDESCCTRL, i, value);

I know that the TDPS/RDPS means Tx/Rx Descriptor Pre-fetch threshold
Size. What does the TXDCSZ/RXDCSZ config mean?

Most importantly why are these parameters hardcoded to 3? It
doesn't seem right.

> +	}
> +

> +	for (i = 0; i < PDMA_TX_CH_COUNT; i++) {
> +		value = rd_dma_ch_ind(ioaddr, MODE_TXEXTCFG, i);
> +		value &= ~(XGMAC4_TXPBL | XGMAC4_TPBLX8_MODE);
> +		if (dma_cfg->pblx8)
> +			value |= XGMAC4_TPBLX8_MODE;
> +		value |= (dma_cfg->pbl << XGMAC4_TXPBL_SHIFT) & XGMAC4_TXPBL;
> +		wr_dma_ch_ind(ioaddr, MODE_TXEXTCFG, i, value);
> +		xgmac4_tp2tc_map(ioaddr, i, i);
> +	}
> +
> +	for (i = 0; i < PDMA_RX_CH_COUNT; i++) {
> +		value = rd_dma_ch_ind(ioaddr, MODE_RXEXTCFG, i);
> +		value &= ~(XGMAC4_RXPBL | XGMAC4_RPBLX8_MODE);
> +		if (dma_cfg->pblx8)
> +			value |= XGMAC4_RPBLX8_MODE;
> +		value |= (dma_cfg->pbl << XGMAC4_RXPBL_SHIFT) & XGMAC4_RXPBL;
> +		wr_dma_ch_ind(ioaddr, MODE_RXEXTCFG, i, value);
> +		if (i < PDMA_MAX_TC_COUNT)
> +			xgmac4_rp2tc_map(ioaddr, i, i);
> +		else
> +			xgmac4_rp2tc_map(ioaddr, i, PDMA_MAX_TC_COUNT - 1);
> +	}

Shouldn't these initialization be done on the per-channel basis only
for only activated queues
plat_stmmacenet_data::{rx_queues_to_use,tx_queues_to_use} (the STMMAC
driver one-on-one maps queues and DMA-channels if no custom mapping
was specified)?

> +}
> +
> +void dwxgmac4_dma_init_tx_chan(struct stmmac_priv *priv,
> +			       void __iomem *ioaddr,
> +			       struct stmmac_dma_cfg *dma_cfg,
> +			       dma_addr_t dma_addr, u32 chan)
> +{
> +	u32 value;
> +
> +	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
> +	value &= ~XGMAC4_TVDMA2TCMP;
> +	value |= (chan << XGMAC4_TVDMA2TCMP_SHIFT) & XGMAC4_TVDMA2TCMP;
> +	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
> +
> +	writel(upper_32_bits(dma_addr),
> +	       ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
> +	writel(lower_32_bits(dma_addr),
> +	       ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));
> +}
> +
> +void dwxgmac4_dma_init_rx_chan(struct stmmac_priv *priv,
> +			       void __iomem *ioaddr,
> +			       struct stmmac_dma_cfg *dma_cfg,
> +			       dma_addr_t dma_addr, u32 chan)
> +{
> +	u32 value;
> +
> +	value = readl(ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
> +	value &= ~XGMAC4_RVDMA2TCMP;
> +	value |= (chan << XGMAC4_RVDMA2TCMP_SHIFT) & XGMAC4_RVDMA2TCMP;
> +	writel(value, ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
> +
> +	writel(upper_32_bits(dma_addr),
> +	       ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));
> +	writel(lower_32_bits(dma_addr),
> +	       ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));
> +}
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.h
> new file mode 100644
> index 000000000000..0ce1856b0b34
> --- /dev/null

> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac4.h

dw25gmac.h?

> @@ -0,0 +1,84 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2024 Broadcom Corporation
> + * XGMAC4 definitions.
> + */
> +#ifndef __STMMAC_DWXGMAC4_H__
> +#define __STMMAC_DWXGMAC4_H__
> +
> +/* DMA Indirect Registers*/

> +#define XGMAC4_DMA_CH_IND_CONTROL	0X00003080

XXVGMAC_*?

> +#define XGMAC4_MODE_SELECT		GENMASK(27, 24)
> +#define XGMAC4_MSEL_SHIFT		24
> +enum dma_ch_ind_modes {
> +	MODE_TXEXTCFG	 = 0x0,	  /* Tx Extended Config */
> +	MODE_RXEXTCFG	 = 0x1,	  /* Rx Extended Config */
> +	MODE_TXDBGSTS	 = 0x2,	  /* Tx Debug Status */
> +	MODE_RXDBGSTS	 = 0x3,	  /* Rx Debug Status */
> +	MODE_TXDESCCTRL	 = 0x4,	  /* Tx Descriptor control */
> +	MODE_RXDESCCTRL	 = 0x5,	  /* Rx Descriptor control */
> +};
> +
> +#define XGMAC4_ADDR_OFFSET		GENMASK(14, 8)
> +#define XGMAC4_AOFF_SHIFT		8
> +#define XGMAC4_AUTO_INCR		GENMASK(5, 4)
> +#define XGMAC4_AUTO_SHIFT		4
> +#define XGMAC4_CMD_TYPE			BIT(1)
> +#define XGMAC4_OB			BIT(0)
> +#define XGMAC4_DMA_CH_IND_DATA		0X00003084
> +
> +/* TX Config definitions */
> +#define XGMAC4_TXPBL			GENMASK(29, 24)
> +#define XGMAC4_TXPBL_SHIFT		24
> +#define XGMAC4_TPBLX8_MODE		BIT(19)
> +#define XGMAC4_TP2TCMP			GENMASK(18, 16)
> +#define XGMAC4_TP2TCMP_SHIFT		16
> +#define XGMAC4_ORRQ			GENMASK(13, 8)
> +/* RX Config definitions */
> +#define XGMAC4_RXPBL			GENMASK(29, 24)
> +#define XGMAC4_RXPBL_SHIFT		24
> +#define XGMAC4_RPBLX8_MODE		BIT(19)
> +#define XGMAC4_RP2TCMP			GENMASK(18, 16)
> +#define XGMAC4_RP2TCMP_SHIFT		16
> +#define XGMAC4_OWRQ			GENMASK(13, 8)
> +/* Tx Descriptor control */
> +#define XGMAC4_TXDCSZ			GENMASK(2, 0)
> +#define XGMAC4_TDPS			GENMASK(5, 3)
> +#define XGMAC4_TDPS_SHIFT		3
> +/* Rx Descriptor control */
> +#define XGMAC4_RXDCSZ			GENMASK(2, 0)
> +#define XGMAC4_RDPS			GENMASK(5, 3)
> +#define XGMAC4_RDPS_SHIFT		3
> +
> +/* DWCXG_DMA_CH(#i) Registers*/
> +#define XGMAC4_DSL			GENMASK(20, 18)
> +#define XGMAC4_MSS			GENMASK(13, 0)
> +#define XGMAC4_TFSEL			GENMASK(30, 29)
> +#define XGMAC4_TQOS			GENMASK(27, 24)
> +#define XGMAC4_IPBL			BIT(15)
> +#define XGMAC4_TVDMA2TCMP		GENMASK(6, 4)
> +#define XGMAC4_TVDMA2TCMP_SHIFT		4
> +#define XGMAC4_RPF			BIT(31)
> +#define XGMAC4_RVDMA2TCMP		GENMASK(30, 28)
> +#define XGMAC4_RVDMA2TCMP_SHIFT		28
> +#define XGMAC4_RQOS			GENMASK(27, 24)
> +

> +/* PDMA Channel count */
> +#define PDMA_TX_CH_COUNT		8
> +#define PDMA_RX_CH_COUNT		10
> +#define PDMA_MAX_TC_COUNT		8
> +
> +/* VDMA channel count */
> +#define VDMA_TOTAL_CH_COUNT		32

These seems like the vendor-specific constant. What are the actual DW
25GMAC constraints?

-Serge(y)

> +
> +void dwxgmac4_dma_init(void __iomem *ioaddr,
> +		       struct stmmac_dma_cfg *dma_cfg, int atds);
> +
> +void dwxgmac4_dma_init_tx_chan(struct stmmac_priv *priv,
> +			       void __iomem *ioaddr,
> +			       struct stmmac_dma_cfg *dma_cfg,
> +			       dma_addr_t dma_addr, u32 chan);
> +void dwxgmac4_dma_init_rx_chan(struct stmmac_priv *priv,
> +			       void __iomem *ioaddr,
> +			       struct stmmac_dma_cfg *dma_cfg,
> +			       dma_addr_t dma_addr, u32 chan);
> +#endif /* __STMMAC_DWXGMAC4_H__ */
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
