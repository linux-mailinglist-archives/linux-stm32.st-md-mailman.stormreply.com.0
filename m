Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A379F81CEA0
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 20:02:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 553B3C6B477;
	Fri, 22 Dec 2023 19:02:55 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 474AFC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 19:02:53 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-50e4e3323a6so3154912e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 11:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703271772; x=1703876572;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/WNkEye7dFIS+EDfctJcq2mxRq3d7CRsgYJhjbfmoKo=;
 b=hqiNaP5d81j7hGKJmj8klHcnb+U0toVl55KhXRBqa37HBoBvsoZyoCJ+qU9swkNWxF
 +iI+RLe/aygV65O/TN6Vcqq8MV+FBbgpzBG0dLm1pMN5l8GnIscm9mWTtiSao8jLHGwb
 yKmpxYLVDDf3IdzZoYoUoRB6N9MINKDjUEslGKXu5H2SIbtfTiHvhHYAzoSAz0gKDIYH
 y4CuXZdSMii1nJV3yizln7tBz6qGeUxGLTCh2aFhP6x1wUmRfOoMqOX6mCs5MV6BDPrR
 mD4R4bACk3OKlBn7pg5JNxer4PbNU9hkD/taxS2Uk6lvKpyxayxo6NhBm4TUdpjCaDRg
 cJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703271772; x=1703876572;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WNkEye7dFIS+EDfctJcq2mxRq3d7CRsgYJhjbfmoKo=;
 b=qDO6WZxDLNpyw+hkeldtd+UZ+j2yXCdkadiUhV2KaSwzjOXI+qBsc+p4gIJSjhTTIV
 pDv8whIT+OOgbCSPg3pmLp2Pn+0IEfntL3usrw2+FjFQg/9i2TNrHFy5tqMevBqxuKih
 4iiaW7XRLHq7ryWif3LckbOviNih8U5QuiwlkHJL7QtUp/eXNnMeR1hakFCsYp/iWQeR
 j0Y/jCIiAN9Rft13A2Q/BkQTfCMOq84gmfR1j6pwTXa2DJjLylY2Rd7CPzpQ+sroGNCk
 egOkcPqPXlpaNT69xXBzIPE9gSXQ4dfhmEy9TUjODJFblolmPPiy0Co67Q4KP2yyunv2
 wjNw==
X-Gm-Message-State: AOJu0YyKV4NQiGfwuuRuZfRcblgVve2HOBjC9T1kh449PDGVI0nfLjK9
 k6gDDhADgNQqIqWfVLAgRkk=
X-Google-Smtp-Source: AGHT+IGz/FqM2N1Z4rL+rLpRsvL9Un5LXgILvgOSlHba9sLT12TSLmn3JXu/fLGcWUryA565wKYB2g==
X-Received: by 2002:a19:2d42:0:b0:50e:4b79:b825 with SMTP id
 t2-20020a192d42000000b0050e4b79b825mr982189lft.20.1703271771959; 
 Fri, 22 Dec 2023 11:02:51 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 q17-20020ac25fd1000000b0050e3719148fsm608211lfg.235.2023.12.22.11.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 11:02:51 -0800 (PST)
Date: Fri, 22 Dec 2023 22:02:47 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Leong Ching Swee <leong.ching.swee@intel.com>
Message-ID: <zwlnzllanmd6wtmn6ts7pd6y2sxgbauy4ffgqlf3yaq4uo65tw@ybigwcjpk7uf>
References: <20231222054451.2683242-1-leong.ching.swee@intel.com>
 <20231222054451.2683242-3-leong.ching.swee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222054451.2683242-3-leong.ching.swee@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Teoh Ji Sheng <ji.sheng.teoh@intel.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 2/4] net: stmmac: Make MSI
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

On Fri, Dec 22, 2023 at 01:44:49PM +0800, Leong Ching Swee wrote:
> From: Swee Leong Ching <leong.ching.swee@intel.com>
> 
> There is no support for per DMA channel interrupt for non-MSI platform,
> where the MAC's per channel interrupt hooks up to interrupt controller(GIC)
> through shared peripheral interrupt(SPI) to handle interrupt from TX/RX
> transmit channel.
> 
> This patch generalize the existing MSI ISR to also support non-MSI
> platform.
> 
> Signed-off-by: Teoh Ji Sheng <ji.sheng.teoh@intel.com>
> Signed-off-by: Swee Leong Ching <leong.ching.swee@intel.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  4 +--
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  2 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 29 ++++++++++---------
>  include/linux/stmmac.h                        |  4 +--
>  4 files changed, 21 insertions(+), 18 deletions(-)
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
> index 47de466e432c..30cc9edb4198 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -129,8 +129,8 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id);
>  /* For MSI interrupts handling */
>  static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id);
>  static irqreturn_t stmmac_safety_interrupt(int irq, void *dev_id);

> -static irqreturn_t stmmac_msi_intr_tx(int irq, void *data);
> -static irqreturn_t stmmac_msi_intr_rx(int irq, void *data);
> +static irqreturn_t stmmac_tx_queue_interrupt(int irq, void *data);
> +static irqreturn_t stmmac_rx_queue_interrupt(int irq, void *data);

Let's use the next names instead:

+static irqreturn_t stmmac_dma_tx_interrupt(int irq, void *data);
+static irqreturn_t stmmac_dma_rx_interrupt(int irq, void *data);

It would be semantically more correct and would refer to the
stmmac_dma_interrupt() handler.

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
> @@ -3701,13 +3701,13 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>  	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
>  		if (i >= MTL_MAX_RX_QUEUES)
>  			break;

> -		if (priv->rx_irq[i] == 0)
> +		if (priv->rx_irq[i] <= 0)

Why? What about just using a temporary variable in
stmmac_get_platform_resources() to get the Per-channel DMA IRQs and
not saving error number in priv->rx_irq[]?

>  			continue;
>  
>  		int_name = priv->int_name_rx_irq[i];
>  		sprintf(int_name, "%s:%s-%d", dev->name, "rx", i);
>  		ret = request_irq(priv->rx_irq[i],
> -				  stmmac_msi_intr_rx,
> +				  stmmac_rx_queue_interrupt,
>  				  0, int_name, &priv->dma_conf.rx_queue[i]);
>  		if (unlikely(ret < 0)) {
>  			netdev_err(priv->dev,
> @@ -3726,13 +3726,13 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>  	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
>  		if (i >= MTL_MAX_TX_QUEUES)
>  			break;

> -		if (priv->tx_irq[i] == 0)
> +		if (priv->tx_irq[i] <= 0)

ditto.

>  			continue;
>  
>  		int_name = priv->int_name_tx_irq[i];
>  		sprintf(int_name, "%s:%s-%d", dev->name, "tx", i);
>  		ret = request_irq(priv->tx_irq[i],
> -				  stmmac_msi_intr_tx,
> +				  stmmac_tx_queue_interrupt,
>  				  0, int_name, &priv->dma_conf.tx_queue[i]);
>  		if (unlikely(ret < 0)) {
>  			netdev_err(priv->dev,

Please fix the error message strings in stmmac_request_irq_multi_msi()
too.

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
> +static irqreturn_t stmmac_tx_queue_interrupt(int irq, void *data)
>  {
>  	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)data;
>  	struct stmmac_dma_conf *dma_conf;
> @@ -6107,7 +6107,7 @@ static irqreturn_t stmmac_msi_intr_tx(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
> +static irqreturn_t stmmac_rx_queue_interrupt(int irq, void *data)
>  {
>  	struct stmmac_rx_queue *rx_q = (struct stmmac_rx_queue *)data;
>  	struct stmmac_dma_conf *dma_conf;
> @@ -7456,8 +7456,11 @@ int stmmac_dvr_probe(struct device *device,
>  	priv->plat = plat_dat;
>  	priv->ioaddr = res->addr;
>  	priv->dev->base_addr = (unsigned long)res->addr;
> -	priv->plat->dma_cfg->multi_msi_en =
> -		(priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN);
> +

> +	if (res->rx_irq[0] > 0 && res->tx_irq[0] > 0) {
> +		priv->plat->flags |= STMMAC_FLAG_MULTI_IRQ_EN;
> +		priv->plat->dma_cfg->multi_irq_en = true;
> +	}

This is wrong. It activates the stmmac_request_irq_multi_msi() method
to assign all the IRQ handlers to the individual IRQs. Even if DMA
IRQs line are available it doesn't mean that for instance Safety
Feature IRQs too. So it's better to rely on the glue drivers to set
that flag as before and leave the code as is.

-Serge(y) 

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
