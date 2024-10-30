Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 520579B622D
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2024 12:47:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A505C78027;
	Wed, 30 Oct 2024 11:47:18 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7DB6C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 11:47:10 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-37d6716e200so994681f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730288830; x=1730893630;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=71Z6N0f0s9Q9l3FMkhrwHC4fWFLGTTR2mo+j6DbIOd4=;
 b=gEe0aUyJuNxpfPILJi5RLaqkfBqY7wWrKMkK0VFBJcyh1fr3DsXUWeDcF2gtvirjRC
 8My9bPQBEDWu0v5mg386hobGl8Wfg4llyqqrZxOMxOBBVtW5vBB9PEZxoccoitRFtNeJ
 4YhX6EMYpdpdiIPtGkB1ZrDZLe6t8h/dn3gjXQ5Y9r/fsnnDYc1ziNI0/dCkeSTTVoeI
 tBfZArHwhxHo9w3ri6Hn6u3kptIRon8CI645WOX4JPFluFr7Hqfe7fIRGjv3WXuvaX0b
 h/4JRMauFIzLKmMWjaizJaJbF4jzzJxX0Se9QvkRVGGkA0wLV9JQj1XH04wMdMbAgWRo
 8bFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730288830; x=1730893630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=71Z6N0f0s9Q9l3FMkhrwHC4fWFLGTTR2mo+j6DbIOd4=;
 b=PMMY36wdmcZAKfqM53jdA3/NxU8bipZvfJExX1y7UbiLPRoMdqbID2GMATXIbumSm/
 h8wJ/wjW097b+OuNM+MEKd0aUO68TeEq6TUt/qarEiO/QLL47mPIc+JNGtNaLjCa8SOf
 njv8w5KlKyposLkbCzHn3A5MB1oGxFtdp3+ith2zDS/zjfHDbRZRpQrzJtbHo1eiRt4W
 AX2yoM6Bkv3JephdOCl/9IlsbLU+pKBmQhoGThg4slaDjt9LhoiBDGIKj1mT0xcwxeko
 BfM1rGfhFx0iqk7N7zjKBMvTEgEBOUZ6VoQc1MXqlKfbsl/9jl5WHt98dwhwru3wURlz
 +A6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf3xkJqnzd8nqthNS3av9+HmRndzoUVJHimrC5QiUrfuXFnxVGWKotxa7Frx3MgeXYNMxB7+doY3GNWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxS0OQH6i9AzxMH3Kll1iSzIcF9LjV4X4NrPDO9cSnbAElBOr/9
 PT46aMWWXKLgr8JIppRzGB0Nz824frERKolK5HXE3AR7/YuXunDP
X-Google-Smtp-Source: AGHT+IH9XhTipE8INCmJM9rDpTSk6gZJf8Rw2L5Pqs2PM2odooDFAsmqFnRjL6M7rtEJXarPjCXh7g==
X-Received: by 2002:a05:6000:18a3:b0:378:c6f5:9e54 with SMTP id
 ffacd0b85a97d-3806112785amr5406861f8f.5.1730288829817; 
 Wed, 30 Oct 2024 04:47:09 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd917f0bsm18906905e9.17.2024.10.30.04.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 04:47:08 -0700 (PDT)
Date: Wed, 30 Oct 2024 13:47:06 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241030114706.yaevtgpefwfxva5v@skbuf>
References: <cover.1730263957.git.0x1207@gmail.com>
 <cover.1730263957.git.0x1207@gmail.com>
 <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
 <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
 <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v6 3/6] net: stmmac: Refactor FPE
 functions to generic version
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

On Wed, Oct 30, 2024 at 01:36:12PM +0800, Furong Xu wrote:
> FPE implementation for DWMAC4 and DWXGMAC differs only for:
> 1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
> 2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1
> 3) Bit offset of Frame Preemption Interrupt Enable
> 
> Refactor FPE functions to avoid code duplication.

I would add "and to simplify the code flow by avoiding the use of
function pointers".

> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> index 70ea475046f0..ee86658f77b4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> @@ -27,6 +27,20 @@
>  #define STMMAC_MAC_FPE_CTRL_STS_SVER	BIT(1)
>  #define STMMAC_MAC_FPE_CTRL_STS_EFPE	BIT(0)
>  
> +struct stmmac_fpe_reg {
> +	const u32 mac_fpe_reg;		/* offset of MAC_FPE_CTRL_STS */
> +	const u32 mtl_fpe_reg;		/* offset of MTL_FPE_CTRL_STS */
> +	const u32 rxq_ctrl1_reg;	/* offset of MAC_RxQ_Ctrl1 */
> +	const u32 fprq_mask;		/* Frame Preemption Residue Queue */
> +	const u32 int_en_reg;		/* offset of MAC_Interrupt_Enable */
> +	const u32 int_en_bit;		/* Frame Preemption Interrupt Enable */
> +};
> +
> +bool stmmac_fpe_supported(struct stmmac_priv *priv)
> +{
> +	return (priv->dma_cap.fpesel && priv->fpe_cfg.reg);
> +}

This is a separate logical change from just refactoring. Refactoring
changes (which are noisy) should not have functional changes. Could
the introduction and use of stmmac_fpe_supported() please be a separate
patch?

Also, parentheses are not necessary.

> +
>  void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  {
>  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> @@ -38,25 +52,19 @@ void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  
>  	if (is_up && fpe_cfg->pmac_enabled) {
>  		/* VERIFY process requires pmac enabled when NIC comes up */
> -		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> -				     priv->plat->tx_queues_to_use,
> -				     priv->plat->rx_queues_to_use,
> -				     false, true);
> +		stmmac_fpe_configure(priv, false, true);
>  
>  		/* New link => maybe new partner => new verification process */
>  		stmmac_fpe_apply(priv);
>  	} else {
>  		/* No link => turn off EFPE */
> -		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> -				     priv->plat->tx_queues_to_use,
> -				     priv->plat->rx_queues_to_use,
> -				     false, false);
> +		stmmac_fpe_configure(priv, false, false);
>  	}
>  
>  	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
>  }
>  
> -void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
> +static void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
>  {
>  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
>  
> @@ -68,8 +76,7 @@ void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
>  
>  	/* LP has sent verify mPacket */
>  	if ((status & FPE_EVENT_RVER) == FPE_EVENT_RVER)
> -		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
> -					MPACKET_RESPONSE);
> +		stmmac_fpe_send_mpacket(priv, MPACKET_RESPONSE);
>  
>  	/* Local has sent verify mPacket */
>  	if ((status & FPE_EVENT_TVER) == FPE_EVENT_TVER &&
> @@ -107,8 +114,7 @@ static void stmmac_fpe_verify_timer(struct timer_list *t)
>  	case ETHTOOL_MM_VERIFY_STATUS_INITIAL:
>  	case ETHTOOL_MM_VERIFY_STATUS_VERIFYING:
>  		if (fpe_cfg->verify_retries != 0) {
> -			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
> -						fpe_cfg, MPACKET_VERIFY);
> +			stmmac_fpe_send_mpacket(priv, MPACKET_VERIFY);
>  			rearm = true;
>  		} else {
>  			fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_FAILED;
> @@ -118,10 +124,7 @@ static void stmmac_fpe_verify_timer(struct timer_list *t)
>  		break;
>  
>  	case ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED:
> -		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> -				     priv->plat->tx_queues_to_use,
> -				     priv->plat->rx_queues_to_use,
> -				     true, true);
> +		stmmac_fpe_configure(priv, true, true);
>  		break;
>  
>  	default:
> @@ -154,6 +157,9 @@ void stmmac_fpe_init(struct stmmac_priv *priv)
>  	priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
>  	timer_setup(&priv->fpe_cfg.verify_timer, stmmac_fpe_verify_timer, 0);
>  	spin_lock_init(&priv->fpe_cfg.lock);
> +
> +	if (priv->dma_cap.fpesel && !priv->fpe_cfg.reg)
> +		dev_info(priv->device, "FPE on this MAC is not supported by driver.\n");

This as well.

>  }
>  
>  void stmmac_fpe_apply(struct stmmac_priv *priv)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> index 25725fd5182f..00e616d7cbf1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> @@ -22,24 +22,21 @@ struct stmmac_priv;
>  struct stmmac_fpe_cfg;
>  
>  void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up);
> -void stmmac_fpe_event_status(struct stmmac_priv *priv, int status);
> +bool stmmac_fpe_supported(struct stmmac_priv *priv);
>  void stmmac_fpe_init(struct stmmac_priv *priv);
>  void stmmac_fpe_apply(struct stmmac_priv *priv);
> -
> -void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> -			  u32 num_txq, u32 num_rxq,
> -			  bool tx_enable, bool pmac_enable);
> -void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
> -			     struct stmmac_fpe_cfg *cfg,
> +void stmmac_fpe_configure(struct stmmac_priv *priv, bool tx_enable,
> +			  bool pmac_enable);
> +void stmmac_fpe_send_mpacket(struct stmmac_priv *priv,
>  			     enum stmmac_mpacket_type type);

Sorry I noticed this just now. After the refactoring, stmmac_fpe_send_mpacket()
is only used from stmmac_fpe.c, and thus can be unexported and made static.
Same goes for enum stmmac_mpacket_type.

> -int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev);
> -int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr);
> -void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size);
> +void stmmac_fpe_irq_status(struct stmmac_priv *priv);
> +int stmmac_fpe_get_add_frag_size(struct stmmac_priv *priv);
> +void stmmac_fpe_set_add_frag_size(struct stmmac_priv *priv, u32 add_frag_size);
> +
>  int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
>  				    struct netlink_ext_ack *extack, u32 pclass);
>  
> -void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> -			    u32 num_txq, u32 num_rxq,
> -			    bool tx_enable, bool pmac_enable);
> +extern const struct stmmac_fpe_reg dwmac5_fpe_reg;
> +extern const struct stmmac_fpe_reg dwxgmac3_fpe_reg;
>  
>  #endif
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
