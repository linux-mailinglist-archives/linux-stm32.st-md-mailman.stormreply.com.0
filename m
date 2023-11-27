Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0F07F9D52
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Nov 2023 11:20:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63A8AC6B457;
	Mon, 27 Nov 2023 10:20:59 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED524C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 10:20:57 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2c5b7764016so44654441fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 02:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701080457; x=1701685257;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ExvmcaBmtMG79z7Iqahkd4y5Qc/HJbGcEwVPJT9+anc=;
 b=SseSRkat9A6ua4FSMl6UVimZPiZmyjXIpuuDb8hya6YjyVmu4z8D0cpSn6eR3rRy3m
 vGYDMVGydxXjCb0IOyJzxMbkCxiLy+cv1Cl6LvxdAqga0/XOoolIXKkj+4pR+yFYqmAM
 dCWrcK7bAc/SEV1xqPM5S88TECQvhUYJxY2hTe58l5qj4yERUJhLGW0n9WHGcYmNfrF7
 hOl5GZXGr45NVPvOh4I5Lw4TeHXbLtk+JZIercGuZRP0POtrTgVicNdffCdHFHYy69EM
 CflnlDCgtiTeh3evQuSi2EsMV414Pqkol1hQU70kyF06KnuKYvTvhVKxFJ73WtzA+p1i
 5Z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701080457; x=1701685257;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ExvmcaBmtMG79z7Iqahkd4y5Qc/HJbGcEwVPJT9+anc=;
 b=P65TV/kV7XLmSJDye3MObegMxbTc5zN6KJ8Ey0uhHwQIZyrebFLWEFBmBFXv3rU0KJ
 cdp2f08Cx3BmzgrSbfKFlZYs382tgTdc0VJVAjn2CExwF9iX47r9KjLuCcesKYQ+JxM9
 1qAv1xrsWvSOGjUspwHSM/amuLFvHtdG9II2PUS6xe2UDA8hzRDFhuiyLZVmFOZZS0+O
 C5FU2hgArHLaAodaZsA6J5/HlC+KFZg+fsQNwQd5piRdnoyR5ZGr0+Z4Bwf7L4OEgXeL
 xepDPIIouKHTX8JD/jOYysdQ52A5w42YK7lBJfX+lXDJh5cbHc2JT72eSHTy8zftfDkI
 wlKA==
X-Gm-Message-State: AOJu0YzyO1iAMA6qJEZ+ILzgejWCWPmaGOJc3JH+1yAHY2dsN6POuWlH
 aTPhG0pE4pKxvmDHjD8BXqc=
X-Google-Smtp-Source: AGHT+IHFvU38B/KUK8EW7W2GDlIJK1kT3L7x6bHmk5zwGmADxT7yj2QOJsgIHXtc/tzPluuHkK/V1A==
X-Received: by 2002:a2e:b74c:0:b0:2c9:a707:beb0 with SMTP id
 k12-20020a2eb74c000000b002c9a707beb0mr837832ljo.3.1701080456752; 
 Mon, 27 Nov 2023 02:20:56 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a2eb53a000000b002bba2da7955sm1305573ljm.132.2023.11.27.02.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 02:20:56 -0800 (PST)
Date: Mon, 27 Nov 2023 13:20:53 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
Message-ID: <mpapy5qi6q5wfyblhtroqtggqtdfxrh5czkhbgabqdyy4m7ini@s5zwmr457252>
References: <CY5PR12MB637218C74342CCAF7AFCB85FBFBDA@CY5PR12MB6372.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR12MB637218C74342CCAF7AFCB85FBFBDA@CY5PR12MB6372.namprd12.prod.outlook.com>
Cc: Voon Weifeng <weifeng.voon@intel.com>, James Li <James.Li1@synopsys.com>,
 Eric Dumazet <edumazet@google.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Russell King \(Oracle" <rmk+kernel@armlinux.org.uk>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Tan Tee Min <tee.min.tan@intel.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Simon Horman <horms@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix FPE events losing
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

Hi Jianheng

On Mon, Nov 27, 2023 at 07:08:17AM +0000, Jianheng Zhang wrote:
> 
> The status bits of register MAC_FPE_CTRL_STS are clear on read. Using
> 32-bit read for MAC_FPE_CTRL_STS in dwmac5_fpe_configure() and
> dwmac5_fpe_send_mpacket() clear the status bits. Then the stmmac interrupt
> handler missing FPE event status and leads to FPE handshaking failure and
> retries.
> To avoid clear status bits of MAC_FPE_CTRL_STS in dwmac5_fpe_configure()
> and dwmac5_fpe_send_mpacket(), add fpe_csr to stmmac_fpe_cfg structure to
> cache the control bits of MAC_FPE_CTRL_STS and to avoid reading
> MAC_FPE_CTRL_STS in those methods.
> 
> Fixes: 5a5586112b92 ("net: stmmac: support FPE link partner hand-shaking procedure")
> Signed-off-by: jianheng <jianheng@synopsys.com>

Thanks for the fix and taking all my notes and nitpicks into account.
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.c       | 45 +++++++++-------------
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.h       |  4 +-
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  3 +-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  8 +++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |  1 +
>  include/linux/stmmac.h                             |  1 +
>  7 files changed, 36 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> index e95d35f..8fd1675 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> @@ -710,28 +710,22 @@ void dwmac5_est_irq_status(void __iomem *ioaddr, struct net_device *dev,
>  	}
>  }
>  
> -void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
> +void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> +			  u32 num_txq, u32 num_rxq,
>  			  bool enable)
>  {
>  	u32 value;
>  
> -	if (!enable) {
> -		value = readl(ioaddr + MAC_FPE_CTRL_STS);
> -
> -		value &= ~EFPE;
> -
> -		writel(value, ioaddr + MAC_FPE_CTRL_STS);
> -		return;
> +	if (enable) {
> +		cfg->fpe_csr = EFPE;
> +		value = readl(ioaddr + GMAC_RXQ_CTRL1);
> +		value &= ~GMAC_RXQCTRL_FPRQ;
> +		value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
> +		writel(value, ioaddr + GMAC_RXQ_CTRL1);
> +	} else {
> +		cfg->fpe_csr = 0;
>  	}
> -
> -	value = readl(ioaddr + GMAC_RXQ_CTRL1);
> -	value &= ~GMAC_RXQCTRL_FPRQ;
> -	value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
> -	writel(value, ioaddr + GMAC_RXQ_CTRL1);
> -
> -	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> -	value |= EFPE;
> -	writel(value, ioaddr + MAC_FPE_CTRL_STS);
> +	writel(cfg->fpe_csr, ioaddr + MAC_FPE_CTRL_STS);
>  }
>  
>  int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> @@ -741,6 +735,9 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
>  
>  	status = FPE_EVENT_UNKNOWN;
>  
> +	/* Reads from the MAC_FPE_CTRL_STS register should only be performed
> +	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
> +	 */
>  	value = readl(ioaddr + MAC_FPE_CTRL_STS);
>  
>  	if (value & TRSP) {
> @@ -766,19 +763,15 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
>  	return status;
>  }
>  
> -void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, enum stmmac_mpacket_type type)
> +void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> +			     enum stmmac_mpacket_type type)
>  {
> -	u32 value;
> +	u32 value = cfg->fpe_csr;
>  
> -	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> -
> -	if (type == MPACKET_VERIFY) {
> -		value &= ~SRSP;
> +	if (type == MPACKET_VERIFY)
>  		value |= SVER;
> -	} else {
> -		value &= ~SVER;
> +	else if (type == MPACKET_RESPONSE)
>  		value |= SRSP;
> -	}
>  
>  	writel(value, ioaddr + MAC_FPE_CTRL_STS);
>  }
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> index 53c138d..34e6207 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> @@ -153,9 +153,11 @@ int dwmac5_est_configure(void __iomem *ioaddr, struct stmmac_est *cfg,
>  			 unsigned int ptp_rate);
>  void dwmac5_est_irq_status(void __iomem *ioaddr, struct net_device *dev,
>  			   struct stmmac_extra_stats *x, u32 txqcnt);
> -void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
> +void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> +			  u32 num_txq, u32 num_rxq,
>  			  bool enable);
>  void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
> +			     struct stmmac_fpe_cfg *cfg,
>  			     enum stmmac_mpacket_type type);
>  int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev);
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 453e88b..a74e71d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -1484,7 +1484,8 @@ static int dwxgmac3_est_configure(void __iomem *ioaddr, struct stmmac_est *cfg,
>  	return 0;
>  }
>  
> -static void dwxgmac3_fpe_configure(void __iomem *ioaddr, u32 num_txq,
> +static void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> +				   u32 num_txq,
>  				   u32 num_rxq, bool enable)
>  {
>  	u32 value;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index b95d3e1..68aa2d5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -412,9 +412,11 @@ struct stmmac_ops {
>  			     unsigned int ptp_rate);
>  	void (*est_irq_status)(void __iomem *ioaddr, struct net_device *dev,
>  			       struct stmmac_extra_stats *x, u32 txqcnt);
> -	void (*fpe_configure)(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
> +	void (*fpe_configure)(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> +			      u32 num_txq, u32 num_rxq,
>  			      bool enable);
>  	void (*fpe_send_mpacket)(void __iomem *ioaddr,
> +				 struct stmmac_fpe_cfg *cfg,
>  				 enum stmmac_mpacket_type type);
>  	int (*fpe_irq_status)(void __iomem *ioaddr, struct net_device *dev);
>  };
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3e50fd5..7791e9b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -964,7 +964,8 @@ static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  	bool *hs_enable = &fpe_cfg->hs_enable;
>  
>  	if (is_up && *hs_enable) {
> -		stmmac_fpe_send_mpacket(priv, priv->ioaddr, MPACKET_VERIFY);
> +		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
> +					MPACKET_VERIFY);
>  	} else {
>  		*lo_state = FPE_STATE_OFF;
>  		*lp_state = FPE_STATE_OFF;
> @@ -5838,6 +5839,7 @@ static void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
>  		/* If user has requested FPE enable, quickly response */
>  		if (*hs_enable)
>  			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
> +						fpe_cfg,
>  						MPACKET_RESPONSE);
>  	}
>  
> @@ -7262,6 +7264,7 @@ static void stmmac_fpe_lp_task(struct work_struct *work)
>  		if (*lo_state == FPE_STATE_ENTERING_ON &&
>  		    *lp_state == FPE_STATE_ENTERING_ON) {
>  			stmmac_fpe_configure(priv, priv->ioaddr,
> +					     fpe_cfg,
>  					     priv->plat->tx_queues_to_use,
>  					     priv->plat->rx_queues_to_use,
>  					     *enable);
> @@ -7280,6 +7283,7 @@ static void stmmac_fpe_lp_task(struct work_struct *work)
>  			netdev_info(priv->dev, SEND_VERIFY_MPAKCET_FMT,
>  				    *lo_state, *lp_state);
>  			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
> +						fpe_cfg,
>  						MPACKET_VERIFY);
>  		}
>  		/* Sleep then retry */
> @@ -7294,6 +7298,7 @@ void stmmac_fpe_handshake(struct stmmac_priv *priv, bool enable)
>  	if (priv->plat->fpe_cfg->hs_enable != enable) {
>  		if (enable) {
>  			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
> +						priv->plat->fpe_cfg,
>  						MPACKET_VERIFY);
>  		} else {
>  			priv->plat->fpe_cfg->lo_fpe_state = FPE_STATE_OFF;
> @@ -7754,6 +7759,7 @@ int stmmac_suspend(struct device *dev)
>  	if (priv->dma_cap.fpesel) {
>  		/* Disable FPE */
>  		stmmac_fpe_configure(priv, priv->ioaddr,
> +				     priv->plat->fpe_cfg,
>  				     priv->plat->tx_queues_to_use,
>  				     priv->plat->rx_queues_to_use, false);
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index ac41ef4..6ad3e0a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -1079,6 +1079,7 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
>  
>  	priv->plat->fpe_cfg->enable = false;
>  	stmmac_fpe_configure(priv, priv->ioaddr,
> +			     priv->plat->fpe_cfg,
>  			     priv->plat->tx_queues_to_use,
>  			     priv->plat->rx_queues_to_use,
>  			     false);
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 0b4658a..dee5ad6 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -175,6 +175,7 @@ struct stmmac_fpe_cfg {
>  	bool hs_enable;				/* FPE handshake enable */
>  	enum stmmac_fpe_state lp_fpe_state;	/* Link Partner FPE state */
>  	enum stmmac_fpe_state lo_fpe_state;	/* Local station FPE state */
> +	u32 fpe_csr;				/* MAC_FPE_CTRL_STS reg cache */
>  };
>  
>  struct stmmac_safety_feature_cfg {
> -- 
> 1.8.3.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
