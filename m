Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB15F97436E
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2024 21:25:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F6ADC78011;
	Tue, 10 Sep 2024 19:25:08 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A762CC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 19:25:01 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53568ffc525so1536710e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 12:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725996301; x=1726601101;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F+liXnOTOUZPV47MWD+3+P5kmqr14y4l2/py1L5IUI8=;
 b=NzXOaRk3fnuxY7IDsn/Q2IVl7x4k45JNkOmDePE223ySgIj8y35XJuiX3hdOXvTbm+
 6XVGy4dEBh+rSKrL5UA//BEpmXACHZrbdtmXq0oqlElz19QRA19zTJbfoVf08FsWcoOb
 3W+kGxM554Pg4CMqxV1ZRrQr80IGxPR7S5/PXoxfBqy14N/mTgBM5sLG9xz2umCxvtAu
 LoCx3tfbESnQC9R09aQeBZHK2/Tb4jq4U+xN+z/rspEKdwzQfAaLkwWyW4HqJfsl3XQA
 AWq7tN1SZsMSrwCDan0Obtb7Tw078ox0YMYa7qJlRq6Y03hYZKydXDnRiuref8j5t+oP
 oJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725996301; x=1726601101;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F+liXnOTOUZPV47MWD+3+P5kmqr14y4l2/py1L5IUI8=;
 b=m88R6S311K3fPQFv0jOkmiR3VGT3yXkAteEYd/13RJZE0RtVb18PE7mH/833MNN6C6
 9V4A7WTlfNWNHXdEZ44ndRRPeNaoo9LuOJcp+m+Eak/e1bT6qICGeWMM9NuXwhDAP3gk
 XKXsraHHlp7yWslNqapjJdYL54HgpflLpDtCZSSDVq13ip7bV9SwHJ1zGlpS02ykeAcp
 Mk8XwxTLY0aOyqq4izoXehuszwQD/uZGL6kNqZa9BQEXnXpBpgkTRn4H26ERgbLaw/0M
 O/tceF2Jhp7vpCeljZg7sx5VIZINMleE6PxKxoA+aE9oWzlLDOPWaVqPPH3YiD4Z6cIT
 KcAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9hG5XDOGdht5wv5ejpSAmfyMGuh9SwaxjWwj+pH+5oZDNyP1xQLAzvTr/b9ffmVJetO1Jbq9FCuxgrg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzaAz/AG+6FkdP/3te2kaZHlKVG6vMu9XXO9Ehtj/9DGQi7J/l9
 P9w7cMGCVvD71aL1C+B1uUlMp8afqhONg4vvcVCcGMOXFEwSUsJLGgtnwvSN
X-Google-Smtp-Source: AGHT+IH7h7nMsPnJM5DLDYU7ruoVNkI47PUGmGGDvmGbr5hRc1m5j2pA6BQCYOGF0ngdjX3ukTQR4g==
X-Received: by 2002:a05:6512:1589:b0:52e:a68a:6076 with SMTP id
 2adb3069b0e04-53673ca1524mr327461e87.49.1725996299754; 
 Tue, 10 Sep 2024 12:24:59 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f8cabddsm1279795e87.149.2024.09.10.12.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 12:24:59 -0700 (PDT)
Date: Tue, 10 Sep 2024 22:24:55 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: jitendra.vegiraju@broadcom.com
Message-ID: <mhfssgiv7unjlpve45rznyzr72llvchcwzk4f7obnvp5edijqc@ilmxqr5gaktb>
References: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
 <20240904054815.1341712-3-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904054815.1341712-3-jitendra.vegiraju@broadcom.com>
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/5] net: stmmac: Add basic
 dw25gmac support in stmmac core
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

On Tue, Sep 03, 2024 at 10:48:12PM -0700, jitendra.vegiraju@broadcom.com wrote:
> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> 
> The BCM8958x uses early adopter version of DWC_xgmac version 4.00a for
> Ethernet MAC. The DW25GMAC introduced in this version adds new DMA
> architecture called Hyper-DMA (HDMA) for virtualization scalability.
> This is realized by decoupling physical DMA channels(PDMA) from potentially
> large number of virtual DMA channels (VDMA). The VDMAs are software
> abstractions that map to PDMAs for frame transmission and reception.
> 
> Define new macros DW25GMAC_CORE_4_00 and DW25GMAC_ID to identify 25GMAC
> device.
> To support the new HDMA architecture, a new instance of stmmac_dma_ops
> dw25gmac400_dma_ops is added.
> Most of the other dma operation functions in existing dwxgamc2_dma.c file
> are reused where applicable.
> Added setup function for DW25GMAC's stmmac_hwif_entry in stmmac core.
> 
> Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h  |   4 +
>  .../net/ethernet/stmicro/stmmac/dw25gmac.c    | 224 ++++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/dw25gmac.h    |  92 +++++++
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   1 +
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  43 ++++
>  .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  31 +++
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |   1 +
>  8 files changed, 397 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dw25gmac.h
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index c2f0e91f6bf8..967e8a9aa432 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -6,7 +6,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
>  	      mmc_core.o stmmac_hwtstamp.o stmmac_ptp.o dwmac4_descs.o	\
>  	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
>  	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
> -	      stmmac_xdp.o stmmac_est.o \
> +	      stmmac_xdp.o stmmac_est.o dw25gmac.o \
>  	      $(stmmac-y)
>  
>  stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 684489156dce..9a747b89ba51 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -38,9 +38,11 @@
>  #define DWXGMAC_CORE_2_10	0x21
>  #define DWXGMAC_CORE_2_20	0x22
>  #define DWXLGMAC_CORE_2_00	0x20
> +#define DW25GMAC_CORE_4_00	0x40
>  
>  /* Device ID */
>  #define DWXGMAC_ID		0x76
> +#define DW25GMAC_ID		0x55
>  #define DWXLGMAC_ID		0x27
>  
>  #define STMMAC_CHAN0	0	/* Always supported and default for all chips */
> @@ -563,6 +565,7 @@ struct mac_link {
>  		u32 speed2500;
>  		u32 speed5000;
>  		u32 speed10000;
> +		u32 speed25000;
>  	} xgmii;
>  	struct {
>  		u32 speed25000;
> @@ -621,6 +624,7 @@ int dwmac100_setup(struct stmmac_priv *priv);
>  int dwmac1000_setup(struct stmmac_priv *priv);
>  int dwmac4_setup(struct stmmac_priv *priv);
>  int dwxgmac2_setup(struct stmmac_priv *priv);
> +int dw25gmac_setup(struct stmmac_priv *priv);
>  int dwxlgmac2_setup(struct stmmac_priv *priv);
>  
>  void stmmac_set_mac_addr(void __iomem *ioaddr, const u8 addr[6],
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c b/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
> new file mode 100644
> index 000000000000..adb33700ffbb
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Broadcom Corporation
> + */
> +#include "stmmac.h"
> +#include "dwxgmac2.h"
> +#include "dw25gmac.h"
> +
> +static u32 decode_vdma_count(u32 regval)
> +{
> +	/* compressed encoding for vdma count
> +	 * regval: VDMA count
> +	 * 0-15	 : 1 - 16
> +	 * 16-19 : 20, 24, 28, 32
> +	 * 20-23 : 40, 48, 56, 64
> +	 * 24-27 : 80, 96, 112, 128
> +	 */
> +	if (regval < 16)
> +		return regval + 1;
> +	return (4 << ((regval - 16) / 4)) * ((regval % 4) + 5);

The shortest code isn't always the best one. This one gives me a
headache in trying to decipher whether it really matches to what is
described in the comment. What about just:

	if (regval < 16) /* Direct mapping */
		return regval + 1;
	else if (regval < 20) /* 20, 24, 28, 32 */
		return 20 + (regval - 16) * 4;
	else if (regval < 24) /* 40, 48, 56, 64 */
		return 40 + (regval - 20) * 8;
	else if (regval < 28) /* 80, 96, 112, 128 */
		return 80 + (regval - 24) * 16;

?

> +}
> +
> +static void dw25gmac_read_hdma_limits(void __iomem *ioaddr,
> +				      struct stmmac_hdma_cfg *hdma)
> +{
> +	u32 hw_cap;
> +
> +	/* Get VDMA/PDMA counts from HW */
> +	hw_cap = readl(ioaddr + XGMAC_HW_FEATURE2);


> +	hdma->tx_vdmas = decode_vdma_count(FIELD_GET(XXVGMAC_HWFEAT_VDMA_TXCNT,
> +						     hw_cap));
> +	hdma->rx_vdmas = decode_vdma_count(FIELD_GET(XXVGMAC_HWFEAT_VDMA_RXCNT,
> +						     hw_cap));
> +	hdma->tx_pdmas = FIELD_GET(XGMAC_HWFEAT_TXQCNT, hw_cap) + 1;
> +	hdma->rx_pdmas = FIELD_GET(XGMAC_HWFEAT_RXQCNT, hw_cap) + 1;

Hmm, these are the Tx/Rx DMA-channels and Tx/Rx MTL-queues count
fields. Can't you just use the
dma_features::{number_tx_channel,number_tx_queues} and
dma_features::{number_rx_channel,number_rx_queues} fields to store the
retrieved data?

Moreover why not to add the code above to the dwxgmac2_get_hw_feature() method?

> +}
> +
> +int dw25gmac_hdma_cfg_init(struct stmmac_priv *priv)
> +{
> +	struct plat_stmmacenet_data *plat = priv->plat;
> +	struct device *dev = priv->device;
> +	struct stmmac_hdma_cfg *hdma;
> +	int i;
> +
> +	hdma = devm_kzalloc(dev,
> +			    sizeof(*plat->dma_cfg->hdma_cfg),
> +			    GFP_KERNEL);
> +	if (!hdma)
> +		return -ENOMEM;
> +
> +	dw25gmac_read_hdma_limits(priv->ioaddr, hdma);
> +
> +	hdma->tvdma_tc = devm_kzalloc(dev,
> +				      sizeof(*hdma->tvdma_tc) * hdma->tx_vdmas,
> +				      GFP_KERNEL);
> +	if (!hdma->tvdma_tc)
> +		return -ENOMEM;
> +
> +	hdma->rvdma_tc = devm_kzalloc(dev,
> +				      sizeof(*hdma->rvdma_tc) * hdma->rx_vdmas,
> +				      GFP_KERNEL);
> +	if (!hdma->rvdma_tc)
> +		return -ENOMEM;
> +
> +	hdma->tpdma_tc = devm_kzalloc(dev,
> +				      sizeof(*hdma->tpdma_tc) * hdma->tx_pdmas,
> +				      GFP_KERNEL);
> +	if (!hdma->tpdma_tc)
> +		return -ENOMEM;
> +
> +	hdma->rpdma_tc = devm_kzalloc(dev,
> +				      sizeof(*hdma->rpdma_tc) * hdma->rx_pdmas,
> +				      GFP_KERNEL);
> +	if (!hdma->rpdma_tc)
> +		return -ENOMEM;
> +

> +	/* Initialize one-to-one mapping for each of the used queues */
> +	for (i = 0; i < plat->tx_queues_to_use; i++) {
> +		hdma->tvdma_tc[i] = i;
> +		hdma->tpdma_tc[i] = i;
> +	}
> +	for (i = 0; i < plat->rx_queues_to_use; i++) {
> +		hdma->rvdma_tc[i] = i;
> +		hdma->rpdma_tc[i] = i;
> +	}

So the Traffic Class ID is initialized for the
tx_queues_to_use/rx_queues_to_use number of channels only, right? What
about the Virtual and Physical DMA-channels with numbers greater than
these values?

> +	plat->dma_cfg->hdma_cfg = hdma;
> +
> +	return 0;
> +}
> +
> +static int rd_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel)
> +{
> +	u32 reg_val = 0;
> +
> +	reg_val |= FIELD_PREP(XXVGMAC_MODE_SELECT, mode);
> +	reg_val |= FIELD_PREP(XXVGMAC_ADDR_OFFSET, channel);
> +	reg_val |= XXVGMAC_CMD_TYPE | XXVGMAC_OB;
> +	writel(reg_val, ioaddr + XXVGMAC_DMA_CH_IND_CONTROL);
> +	return readl(ioaddr + XXVGMAC_DMA_CH_IND_DATA);
> +}
> +
> +static void wr_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel, u32 val)
> +{
> +	u32 reg_val = 0;
> +
> +	writel(val, ioaddr + XXVGMAC_DMA_CH_IND_DATA);
> +	reg_val |= FIELD_PREP(XXVGMAC_MODE_SELECT, mode);
> +	reg_val |= FIELD_PREP(XXVGMAC_ADDR_OFFSET, channel);
> +	reg_val |= XGMAC_OB;
> +	writel(reg_val, ioaddr + XXVGMAC_DMA_CH_IND_CONTROL);
> +}
> +
> +static void xgmac4_tp2tc_map(void __iomem *ioaddr, u8 pdma_ch, u32 tc_num)
> +{
> +	u32 val = 0;
> +
> +	val = rd_dma_ch_ind(ioaddr, MODE_TXEXTCFG, pdma_ch);
> +	val &= ~XXVGMAC_TP2TCMP;
> +	val |= FIELD_PREP(XXVGMAC_TP2TCMP, tc_num);
> +	wr_dma_ch_ind(ioaddr, MODE_TXEXTCFG, pdma_ch, val);
> +}
> +
> +static void xgmac4_rp2tc_map(void __iomem *ioaddr, u8 pdma_ch, u32 tc_num)
> +{
> +	u32 val = 0;
> +
> +	val = rd_dma_ch_ind(ioaddr, MODE_RXEXTCFG, pdma_ch);
> +	val &= ~XXVGMAC_RP2TCMP;
> +	val |= FIELD_PREP(XXVGMAC_RP2TCMP, tc_num);
> +	wr_dma_ch_ind(ioaddr, MODE_RXEXTCFG, pdma_ch, val);
> +}
> +
> +void dw25gmac_dma_init(void __iomem *ioaddr,
> +		       struct stmmac_dma_cfg *dma_cfg)
> +{
> +	u32 value;
> +	u32 i;
> +
> +	value = readl(ioaddr + XGMAC_DMA_SYSBUS_MODE);
> +	value &= ~(XGMAC_AAL | XGMAC_EAME);
> +	if (dma_cfg->aal)
> +		value |= XGMAC_AAL;
> +	if (dma_cfg->eame)
> +		value |= XGMAC_EAME;
> +	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
> +
> +	for (i = 0; i < dma_cfg->hdma_cfg->tx_vdmas; i++) {
> +		value = rd_dma_ch_ind(ioaddr, MODE_TXDESCCTRL, i);
> +		value &= ~XXVGMAC_TXDCSZ;
> +		value |= FIELD_PREP(XXVGMAC_TXDCSZ,
> +				    XXVGMAC_TXDCSZ_256BYTES);
> +		value &= ~XXVGMAC_TDPS;
> +		value |= FIELD_PREP(XXVGMAC_TDPS, XXVGMAC_TDPS_HALF);
> +		wr_dma_ch_ind(ioaddr, MODE_TXDESCCTRL, i, value);
> +	}
> +
> +	for (i = 0; i < dma_cfg->hdma_cfg->rx_vdmas; i++) {
> +		value = rd_dma_ch_ind(ioaddr, MODE_RXDESCCTRL, i);
> +		value &= ~XXVGMAC_RXDCSZ;
> +		value |= FIELD_PREP(XXVGMAC_RXDCSZ,
> +				    XXVGMAC_RXDCSZ_256BYTES);
> +		value &= ~XXVGMAC_RDPS;
> +		value |= FIELD_PREP(XXVGMAC_TDPS, XXVGMAC_RDPS_HALF);
> +		wr_dma_ch_ind(ioaddr, MODE_RXDESCCTRL, i, value);
> +	}
> +

> +	for (i = 0; i < dma_cfg->hdma_cfg->tx_pdmas; i++) {
> +		value = rd_dma_ch_ind(ioaddr, MODE_TXEXTCFG, i);
> +		value &= ~(XXVGMAC_TXPBL | XXVGMAC_TPBLX8_MODE);
> +		if (dma_cfg->pblx8)
> +			value |= XXVGMAC_TPBLX8_MODE;
> +		value |= FIELD_PREP(XXVGMAC_TXPBL, dma_cfg->pbl);
> +		wr_dma_ch_ind(ioaddr, MODE_TXEXTCFG, i, value);
> +		xgmac4_tp2tc_map(ioaddr, i, dma_cfg->hdma_cfg->tpdma_tc[i]);
> +	}
> +
> +	for (i = 0; i < dma_cfg->hdma_cfg->rx_pdmas; i++) {
> +		value = rd_dma_ch_ind(ioaddr, MODE_RXEXTCFG, i);
> +		value &= ~(XXVGMAC_RXPBL | XXVGMAC_RPBLX8_MODE);
> +		if (dma_cfg->pblx8)
> +			value |= XXVGMAC_RPBLX8_MODE;
> +		value |= FIELD_PREP(XXVGMAC_RXPBL, dma_cfg->pbl);
> +		wr_dma_ch_ind(ioaddr, MODE_RXEXTCFG, i, value);
> +		xgmac4_rp2tc_map(ioaddr, i, dma_cfg->hdma_cfg->rpdma_tc[i]);

What if tx_pdmas doesn't match plat_stmmacenet_data::tx_queues_to_use
and rx_pdmas doesn't match to plat_stmmacenet_data::rx_queues_to_use?

If they don't then you'll get out of the initialized tpdma_tc/rpdma_tc
fields and these channels will be pre-initialized with the zero TC. Is
that what expected? I doubt so.

> +	}
> +}
> +

> +void dw25gmac_dma_init_tx_chan(struct stmmac_priv *priv,
> +			       void __iomem *ioaddr,
> +			       struct stmmac_dma_cfg *dma_cfg,
> +			       dma_addr_t dma_addr, u32 chan)
> +{
> +	u32 value;
> +

> +	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
> +	value &= ~XXVGMAC_TVDMA2TCMP;
> +	value |= FIELD_PREP(XXVGMAC_TVDMA2TCMP,
> +			    dma_cfg->hdma_cfg->tvdma_tc[chan]);
> +	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));

Please note this will have only first
plat_stmmacenet_data::{tx_queues_to_use,rx_queues_to_use} VDMA
channels initialized. Don't you have much more than just 4 channels?

> +
> +	writel(upper_32_bits(dma_addr),
> +	       ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
> +	writel(lower_32_bits(dma_addr),
> +	       ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));
> +}
> +
> +void dw25gmac_dma_init_rx_chan(struct stmmac_priv *priv,
> +			       void __iomem *ioaddr,
> +			       struct stmmac_dma_cfg *dma_cfg,
> +			       dma_addr_t dma_addr, u32 chan)
> +{
> +	u32 value;
> +

> +	value = readl(ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
> +	value &= ~XXVGMAC_RVDMA2TCMP;
> +	value |= FIELD_PREP(XXVGMAC_RVDMA2TCMP,
> +			    dma_cfg->hdma_cfg->rvdma_tc[chan]);
> +	writel(value, ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));

The same question.

> +
> +	writel(upper_32_bits(dma_addr),
> +	       ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));
> +	writel(lower_32_bits(dma_addr),
> +	       ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));
> +}

These methods are called for each
plat_stmmacenet_data::{tx_queues_to_use,rx_queues_to_use}
DMA-channel/Queue. The static mapping means you'll have each
PDMA/Queue assigned a static traffic class ID corresponding to the
channel ID. Meanwhile the VDMA channels are supposed to be initialized
with the TC ID corresponding to the matching PDMA ID.

The TC ID in this case is passed as the DMA/Queue channel ID. Then the
Tx/Rx DMA-channels init methods can be converted to:

dw25gmac_dma_init_Xx_chan(chan)
{
	/* Map each chan-th VDMA to the single chan PDMA by assigning
	 * the static TC ID.
	 */
	for (i = chan; i < Xx_vdmas; i += (Xx_vdmas / Xx_queues_to_use)) {
		/* Initialize VDMA channels */
		XXVGMAC_TVDMA2TCMP = chan;
	}

	/* Assign the static TC ID to the specified PDMA channel */
	xgmac4_rp2tc_map(chan, chan)
}

, where X={t,r}.

Thus you can redistribute the loops implemented in dw25gmac_dma_init()
to the respective Tx/Rx DMA-channel init methods.

Am I missing something?

-Serge()

> [...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
