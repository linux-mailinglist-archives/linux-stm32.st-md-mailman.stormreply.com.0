Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAB68265EC
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Jan 2024 21:27:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A080C6B476;
	Sun,  7 Jan 2024 20:27:45 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 841EAC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jan 2024 20:27:43 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2cd0f4f306fso12431071fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 07 Jan 2024 12:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704659263; x=1705264063;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rACQcrVO3678TKytfbkiLbnrDHkDyaaJCQekoivO3/I=;
 b=i4tApgzivyxGg5nWNGpklI+J/kpoZuhCgDbhgn6aCDGz5NfopVEVUaXVquaTm/lP2D
 SJ0qd9FolYslvrfGC9/iiFRadKwk02ILL+/bqvOxcMN05Z0A1jorNbZ2dMlSqVYjm9S2
 RDWzOuTaQqjuiiKpBt0Z8u6Q6PvXTQRNnnRgXY74jFEk/3RYxvANN/6dH5r96/R7aXfN
 JYoxTpAvzFFbibFeQ1XTEN0/zRE7oDFDg3JLL7lWWi/bYfpTeIx6PhiMmWieJL2jTT6Z
 uD1rYaKB3V/8ThfUFO4hU3DKJ457K3Y6apVO1ALBKRso85Qad8vlp/s8GU9nlc6j/rlc
 BwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704659263; x=1705264063;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rACQcrVO3678TKytfbkiLbnrDHkDyaaJCQekoivO3/I=;
 b=hxuX0BTIpm+p32YAfX6gKgTpDum4rT1CSHS5a7mNwgvz9a4X2m80kiecFsOnbVVZwO
 J34Ua91vo3eCho+OxK9NFHg3AfIu9SgqIFt06nkx1rPbSX3+4SOTTp8wlIBXfYVBVxF/
 nYvRSljG+dKU3e3kQ3zLX58FaHp57yq25/w0E2MzZHS9n7zqThnPbT5LEnXv1IoZMUZt
 2TZgoAvIN98mgDwi9Op5JQy2IPs3+gBX5CH/om+mJLMyNUMycmVRYX+KadY0OZHPz05N
 E9xaANYVdBFcngNRgG2wTykEvQGoXnh8kLegEA0UW+J3RYDOMvbrihzthnRD4i1sP3zW
 2zJw==
X-Gm-Message-State: AOJu0YzpnxjN8Ep4DyPInjJFpOvPR/HYwlKmY8OVJuP87Jts5XBIuvc+
 SXiB2h7KohpjcU2dfIZQeqA=
X-Google-Smtp-Source: AGHT+IHY8QkpmvDikI5+hT5QabaOhXFiLTKCSkAnfwnzCibd7vo5TympZlmpqcBYPDF30h0wFj34Hg==
X-Received: by 2002:a2e:a555:0:b0:2cc:9860:e34e with SMTP id
 e21-20020a2ea555000000b002cc9860e34emr1164138ljn.56.1704659262506; 
 Sun, 07 Jan 2024 12:27:42 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a2e8547000000b002ccbcc18e73sm1260470ljj.17.2024.01.07.12.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 12:27:42 -0800 (PST)
Date: Sun, 7 Jan 2024 23:27:39 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Leong Ching Swee <leong.ching.swee@intel.com>
Message-ID: <7euscw66rss3iux2cvf7fkvfburmlf6lo4arfx76k42gihspkz@xm3klojs4e26>
References: <20240105070925.2948871-1-leong.ching.swee@intel.com>
 <20240105070925.2948871-3-leong.ching.swee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240105070925.2948871-3-leong.ching.swee@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Teoh Ji Sheng <ji.sheng.teoh@intel.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/4] net: stmmac: Make MSI
 interrupt routine generic
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

On Fri, Jan 05, 2024 at 03:09:23PM +0800, Leong Ching Swee wrote:
> From: Swee Leong Ching <leong.ching.swee@intel.com>
> 
> There is no support for per DMA channel interrupt for non-MSI platform,
> where the MAC's per channel interrupt hooks up to interrupt controller(GIC)
> through shared peripheral interrupt(SPI) to handle interrupt from TX/RX
> transmit channel.
> 
> This patch generalize the existing MSI ISR to also support non-MSI
> platform.

Basically this patch just fixes the individual IRQ handling code
names.

> 
> Signed-off-by: Teoh Ji Sheng <ji.sheng.teoh@intel.com>
> Signed-off-by: Swee Leong Ching <leong.ching.swee@intel.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  4 +--
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  3 ++
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  2 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 30 +++++++++----------
>  include/linux/stmmac.h                        |  4 +--
>  5 files changed, 23 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> index 60283543ffc8..f0ec69af96c9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> @@ -952,7 +952,7 @@ static int stmmac_config_single_msi(struct pci_dev *pdev,
>  
>  	res->irq = pci_irq_vector(pdev, 0);
>  	res->wol_irq = res->irq;
> -	plat->flags &= ~STMMAC_FLAG_MULTI_MSI_EN;
> +	plat->flags &= ~STMMAC_FLAG_MULTI_IRQ_EN;
>  	dev_info(&pdev->dev, "%s: Single IRQ enablement successful\n",
>  		 __func__);
>  
> @@ -1004,7 +1004,7 @@ static int stmmac_config_multi_msi(struct pci_dev *pdev,
>  	if (plat->msi_sfty_ue_vec < STMMAC_MSI_VEC_MAX)
>  		res->sfty_ue_irq = pci_irq_vector(pdev, plat->msi_sfty_ue_vec);
>  
> -	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
> +	plat->flags |= STMMAC_FLAG_MULTI_IRQ_EN;
>  	dev_info(&pdev->dev, "%s: multi MSI enablement successful\n", __func__);
>  
>  	return 0;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index ba2ce776bd4d..cf43fb3c6cc5 100644

> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -427,6 +427,9 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->bsp_priv = dwmac;
>  	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
>  
> +	if (stmmac_res.rx_irq[0] > 0 && stmmac_res.tx_irq[0] > 0)
> +		plat_dat->flags |= STMMAC_FLAG_MULTI_IRQ_EN;
> +
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret)
>  		return ret;

This is unrelated change. It adds the individual DMA IRQs support for
the SoC FPGA platform, which AFAICS doesn't have it supported at the
moment. Please move this into a separate patch with the commit log
describing the change.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> index 84d3a8551b03..5f649106ffcd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> @@ -175,7 +175,7 @@ static void dwmac4_dma_init(void __iomem *ioaddr,
>  
>  	value = readl(ioaddr + DMA_BUS_MODE);
>  
> -	if (dma_cfg->multi_msi_en) {
> +	if (dma_cfg->multi_irq_en) {
>  		value &= ~DMA_BUS_MODE_INTM_MASK;
>  		value |= (DMA_BUS_MODE_INTM_MODE1 << DMA_BUS_MODE_INTM_SHIFT);
>  	}
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 47de466e432c..57873b879b33 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -129,8 +129,8 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id);
>  /* For MSI interrupts handling */
>  static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id);
>  static irqreturn_t stmmac_safety_interrupt(int irq, void *dev_id);
> -static irqreturn_t stmmac_msi_intr_tx(int irq, void *data);
> -static irqreturn_t stmmac_msi_intr_rx(int irq, void *data);
> +static irqreturn_t stmmac_dma_tx_interrupt(int irq, void *data);
> +static irqreturn_t stmmac_dma_rx_interrupt(int irq, void *data);
>  static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue);
>  static void stmmac_reset_tx_queue(struct stmmac_priv *priv, u32 queue);
>  static void stmmac_reset_queues_param(struct stmmac_priv *priv);
> @@ -3602,7 +3602,7 @@ static void stmmac_free_irq(struct net_device *dev,
>  	}
>  }
>  
> -static int stmmac_request_irq_multi_msi(struct net_device *dev)
> +static int stmmac_request_irq_multi(struct net_device *dev)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	enum request_irq_err irq_err;
> @@ -3697,7 +3697,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>  		}
>  	}
>  
> -	/* Request Rx MSI irq */

> +	/* Request Rx irq */

s/irq/IRQ
(capitalize)

>  	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
>  		if (i >= MTL_MAX_RX_QUEUES)
>  			break;
> @@ -3707,11 +3707,11 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>  		int_name = priv->int_name_rx_irq[i];
>  		sprintf(int_name, "%s:%s-%d", dev->name, "rx", i);
>  		ret = request_irq(priv->rx_irq[i],
> -				  stmmac_msi_intr_rx,
> +				  stmmac_dma_rx_interrupt,
>  				  0, int_name, &priv->dma_conf.rx_queue[i]);
>  		if (unlikely(ret < 0)) {
>  			netdev_err(priv->dev,
> -				   "%s: alloc rx-%d  MSI %d (error: %d)\n",

> +				   "%s: alloc rx-%d  dma rx_irq %d (error: %d)\n",

s/ dma/DMA
(capitalize and drop extra space)

>  				   __func__, i, priv->rx_irq[i], ret);
>  			irq_err = REQ_IRQ_ERR_RX;
>  			irq_idx = i;
> @@ -3722,7 +3722,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>  		irq_set_affinity_hint(priv->rx_irq[i], &cpu_mask);
>  	}
>  
> -	/* Request Tx MSI irq */

> +	/* Request Tx irq */

s/irq/IRQ

>  	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
>  		if (i >= MTL_MAX_TX_QUEUES)
>  			break;
> @@ -3732,11 +3732,11 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>  		int_name = priv->int_name_tx_irq[i];
>  		sprintf(int_name, "%s:%s-%d", dev->name, "tx", i);
>  		ret = request_irq(priv->tx_irq[i],
> -				  stmmac_msi_intr_tx,
> +				  stmmac_dma_tx_interrupt,
>  				  0, int_name, &priv->dma_conf.tx_queue[i]);
>  		if (unlikely(ret < 0)) {
>  			netdev_err(priv->dev,
> -				   "%s: alloc tx-%d  MSI %d (error: %d)\n",

> +				   "%s: alloc tx-%d  dma tx_irq %d (error: %d)\n",

s/ dma/DMA

-Serge(y)

>  				   __func__, i, priv->tx_irq[i], ret);
>  			irq_err = REQ_IRQ_ERR_TX;
>  			irq_idx = i;
> @@ -3811,8 +3811,8 @@ static int stmmac_request_irq(struct net_device *dev)
>  	int ret;
>  
>  	/* Request the IRQ lines */
> -	if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN)
> -		ret = stmmac_request_irq_multi_msi(dev);
> +	if (priv->plat->flags & STMMAC_FLAG_MULTI_IRQ_EN)
> +		ret = stmmac_request_irq_multi(dev);
>  	else
>  		ret = stmmac_request_irq_single(dev);
>  
> @@ -6075,7 +6075,7 @@ static irqreturn_t stmmac_safety_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static irqreturn_t stmmac_msi_intr_tx(int irq, void *data)
> +static irqreturn_t stmmac_dma_tx_interrupt(int irq, void *data)
>  {
>  	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)data;
>  	struct stmmac_dma_conf *dma_conf;
> @@ -6107,7 +6107,7 @@ static irqreturn_t stmmac_msi_intr_tx(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
> +static irqreturn_t stmmac_dma_rx_interrupt(int irq, void *data)
>  {
>  	struct stmmac_rx_queue *rx_q = (struct stmmac_rx_queue *)data;
>  	struct stmmac_dma_conf *dma_conf;
> @@ -7456,8 +7456,8 @@ int stmmac_dvr_probe(struct device *device,
>  	priv->plat = plat_dat;
>  	priv->ioaddr = res->addr;
>  	priv->dev->base_addr = (unsigned long)res->addr;
> -	priv->plat->dma_cfg->multi_msi_en =
> -		(priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN);
> +	priv->plat->dma_cfg->multi_irq_en =
> +		(priv->plat->flags & STMMAC_FLAG_MULTI_IRQ_EN);
>  
>  	priv->dev->irq = res->irq;
>  	priv->wol_irq = res->wol_irq;
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index dee5ad6e48c5..b950e6f9761d 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -98,7 +98,7 @@ struct stmmac_dma_cfg {
>  	int mixed_burst;
>  	bool aal;
>  	bool eame;
> -	bool multi_msi_en;
> +	bool multi_irq_en;
>  	bool dche;
>  };
>  
> @@ -215,7 +215,7 @@ struct dwmac4_addrs {
>  #define STMMAC_FLAG_TSO_EN			BIT(4)
>  #define STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP	BIT(5)
>  #define STMMAC_FLAG_VLAN_FAIL_Q_EN		BIT(6)
> -#define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
> +#define STMMAC_FLAG_MULTI_IRQ_EN		BIT(7)
>  #define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
>  #define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
>  #define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
