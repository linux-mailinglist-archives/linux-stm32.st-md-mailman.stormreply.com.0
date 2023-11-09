Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 290DC7E7082
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Nov 2023 18:41:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D23B4C6B47D;
	Thu,  9 Nov 2023 17:41:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03B1EC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699551694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ldln3FmchpK7mYvC/Qbzz6JwoU9x1Xo3YzeXRTK0iAs=;
 b=JPr3lY0nrqXTnBYzjG8783mEo2BKi7/w/RATNSbFIfnyk7CVY/2qWld2KblKdlNWpbMtdo
 ZUCrYhCt6luBS8+Mjvv+xVcEVnkmhfiY4QkSL97hB7injsxhRxEcn2klZTzQhMRD5nbD0O
 v4UUvKpubWtLa7HZeSclduD/t+JKwjs=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-BrTMchocPyudumUSNX6hnw-1; Thu, 09 Nov 2023 12:41:32 -0500
X-MC-Unique: BrTMchocPyudumUSNX6hnw-1
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-45db0719f7aso445929137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Nov 2023 09:41:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699551692; x=1700156492;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ldln3FmchpK7mYvC/Qbzz6JwoU9x1Xo3YzeXRTK0iAs=;
 b=X33k8Kok3oS+72YtLmwYEkIRBc8y+YeObImkx0J1ABR8fHAKiMa+iVPTwrXER6njrd
 I+71OxC78Gf4fE7PVZh3wEvckt912JhF+Ts6bCjDyqsgIZ+E7zcxjcAVQOU85+JWLdvp
 sN8rGnn/NE3Teg08MVHl9ZSeiuk+G4TPuEKG+A7tvBmXBNZ0Es7wBby1ra4GbVWoYp3f
 6OZyyPVV8NQnzaJLRenVZgfa21UudzlcZsKpk7Hd+k6Xz4GQsbY2Z9/asTvPs7jtcM+D
 p2BptmJPfiYE7Euf6xExTmla8cwPjAVTYmuz9V2b7XfJO8219gZolpMLT8JjSz3uv1IE
 DRng==
X-Gm-Message-State: AOJu0YyclpLGhotM8VSRRuvgckw400FoA8AQ3Dzq/QCb5HBGUcJkml7R
 doSN4IVBWJiRqxEZfflE1/G1sncj3CUNLfVWRFqiXY+C5NXzm19mbzxhz2AWa16NEHrmp6dREb3
 b4iWikoe3ZZ7zPrFY8i8hzNQFmEYXyIR282aGn9u6
X-Received: by 2002:a05:6102:109d:b0:45e:461e:e59c with SMTP id
 s29-20020a056102109d00b0045e461ee59cmr5298146vsr.34.1699551692041; 
 Thu, 09 Nov 2023 09:41:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAtKPOBrTOSnV314GbIFd2FqobPJmav8XQgDXe2lsohJmm41xwQ5voqUZBI/1sIKjrX7guVg==
X-Received: by 2002:a05:6102:109d:b0:45e:461e:e59c with SMTP id
 s29-20020a056102109d00b0045e461ee59cmr5298118vsr.34.1699551691645; 
 Thu, 09 Nov 2023 09:41:31 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a0ce809000000b0065b17ec4b49sm2275472qvn.46.2023.11.09.09.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 09:41:31 -0800 (PST)
Date: Thu, 9 Nov 2023 11:41:28 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Gan Yi Fang <yi.fang.gan@intel.com>
Message-ID: <x4xutfdi3iqo2xdahfu5xpvkgxoogb7bptfmug4cdzjhnsy75x@vu4gzqwxwqgh>
References: <20231109053831.2572699-1-yi.fang.gan@intel.com>
MIME-Version: 1.0
In-Reply-To: <20231109053831.2572699-1-yi.fang.gan@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Johannes Zink <j.zink@pengutronix.de>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Simon Horman <horms@kernel.org>, Voon Weifeng <weifeng.voon@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Shenwei Wang <shenwei.wang@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Looi Hong Aun <hong.aun.looi@intel.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: Add support for
 HW-accelerated VLAN stripping
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

On Thu, Nov 09, 2023 at 01:38:31PM +0800, Gan Yi Fang wrote:
> From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
> 
> Current implementation supports driver level VLAN tag stripping only.
> The features is always on if CONFIG_VLAN_8021Q is enabled in kernel
> config and is not user configurable.
> 
> This patch add support to MAC level VLAN tag stripping and can be
> configured through ethtool. If the rx-vlan-offload is off, the VLAN tag
> will be stripped by driver. If the rx-vlan-offload is on, the VLAN tag
> will be stripped by MAC.
> 
> Command: ethtool -K enp0s30f4 rx-vlan-offload off | on
> 
> Signed-off-by: Gan, Yi Fang <yi.fang.gan@intel.com>
> Signed-off-by: Lai Peter Jun Ann <jun.ann.lai@intel.com>

I'm confused by the SOB lines. Gan is the author and the last sender of
the patch as far as I can tell in this email. Gan's SOB should be last.

Since Gan is also the author as far as I can tell, I am confused why
Lai's Signed-off-by is present.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  3 +-
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 35 +++++++++++++++++++
>  .../ethernet/stmicro/stmmac/dwmac4_descs.c    | 13 +++++++
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    | 15 ++++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 24 ++++++++++++-
>  include/linux/stmmac.h                        |  1 +
>  7 files changed, 90 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index e3f650e88f82..6b935922054d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -580,6 +580,7 @@ struct mac_device_info {
>  	u32 vlan_filter[32];
>  	bool vlan_fail_q_en;
>  	u8 vlan_fail_q;
> +	bool hw_vlan_en;
>  };
>  
>  struct stmmac_rx_routing {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> index 60283543ffc8..651fee867aac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> @@ -457,7 +457,8 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
>  	plat->has_gmac = 0;
>  	plat->has_gmac4 = 1;
>  	plat->force_sf_dma_mode = 0;
> -	plat->flags |= (STMMAC_FLAG_TSO_EN | STMMAC_FLAG_SPH_DISABLE);
> +	plat->flags |= (STMMAC_FLAG_TSO_EN | STMMAC_FLAG_SPH_DISABLE |
> +			STMMAC_FLAG_HW_VLAN_EN);
>  
>  	/* Multiplying factor to the clk_eee_i clock time
>  	 * period to make it closer to 100 ns. This value
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> index c6ff1fa0e04d..6a8d7873b456 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> @@ -1134,6 +1134,35 @@ static int dwmac4_config_l4_filter(struct mac_device_info *hw, u32 filter_no,
>  	return 0;
>  }
>  
> +static void dwmac4_rx_hw_vlan(struct mac_device_info *hw,
> +			      struct dma_desc *rx_desc, struct sk_buff *skb)
> +{
> +	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
> +		u16 vid = (u16)hw->desc->get_rx_vlan_tci(rx_desc);
> +
> +		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
> +	}
> +}
> +
> +static void dwmac4_set_hw_vlan_mode(struct mac_device_info *hw)
> +{
> +	void __iomem *ioaddr = hw->pcsr;
> +	u32 value = readl(ioaddr + GMAC_VLAN_TAG);
> +
> +	value &= ~GMAC_VLAN_TAG_CTRL_EVLS_MASK;
> +
> +	if (hw->hw_vlan_en)
> +		/* Always strip VLAN on Receive */
> +		value |= GMAC_VLAN_TAG_STRIP_ALL;
> +	else
> +		/* Do not strip VLAN on Receive */
> +		value |= GMAC_VLAN_TAG_STRIP_NONE;
> +
> +	/* Enable outer VLAN Tag in Rx DMA descriptor */
> +	value |= GMAC_VLAN_TAG_CTRL_EVLRXS;
> +	writel(value, ioaddr + GMAC_VLAN_TAG);
> +}
> +
>  const struct stmmac_ops dwmac4_ops = {
>  	.core_init = dwmac4_core_init,
>  	.phylink_get_caps = dwmac4_phylink_get_caps,
> @@ -1175,6 +1204,8 @@ const struct stmmac_ops dwmac4_ops = {
>  	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
>  	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
>  	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
> +	.rx_hw_vlan = dwmac4_rx_hw_vlan,
> +	.set_hw_vlan_mode = dwmac4_set_hw_vlan_mode,
>  };
>  
>  const struct stmmac_ops dwmac410_ops = {
> @@ -1224,6 +1255,8 @@ const struct stmmac_ops dwmac410_ops = {
>  	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
>  	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
>  	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
> +	.rx_hw_vlan = dwmac4_rx_hw_vlan,
> +	.set_hw_vlan_mode = dwmac4_set_hw_vlan_mode,
>  };
>  
>  const struct stmmac_ops dwmac510_ops = {
> @@ -1277,6 +1310,8 @@ const struct stmmac_ops dwmac510_ops = {
>  	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
>  	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
>  	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
> +	.rx_hw_vlan = dwmac4_rx_hw_vlan,
> +	.set_hw_vlan_mode = dwmac4_set_hw_vlan_mode,
>  };
>  
>  static u32 dwmac4_get_num_vlan(void __iomem *ioaddr)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> index 89a14084c611..a01d71dfed6c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> @@ -198,6 +198,17 @@ static int dwmac4_get_tx_ls(struct dma_desc *p)
>  		>> TDES3_LAST_DESCRIPTOR_SHIFT;
>  }
>  
> +static inline int dwmac4_wrback_get_rx_vlan_tci(struct dma_desc *p)
> +{
> +	return (le32_to_cpu(p->des0) & RDES0_VLAN_TAG_MASK);
> +}
> +
> +static inline bool dwmac4_wrback_get_rx_vlan_valid(struct dma_desc *p)
> +{
> +	return ((le32_to_cpu(p->des3) & RDES3_LAST_DESCRIPTOR) &&
> +		(le32_to_cpu(p->des3) & RDES3_RDES0_VALID));
> +}
> +
>  static int dwmac4_wrback_get_rx_frame_len(struct dma_desc *p, int rx_coe)
>  {
>  	return (le32_to_cpu(p->des3) & RDES3_PACKET_SIZE_MASK);
> @@ -551,6 +562,8 @@ const struct stmmac_desc_ops dwmac4_desc_ops = {
>  	.set_tx_owner = dwmac4_set_tx_owner,
>  	.set_rx_owner = dwmac4_set_rx_owner,
>  	.get_tx_ls = dwmac4_get_tx_ls,
> +	.get_rx_vlan_tci = dwmac4_wrback_get_rx_vlan_tci,
> +	.get_rx_vlan_valid = dwmac4_wrback_get_rx_vlan_valid,
>  	.get_rx_frame_len = dwmac4_wrback_get_rx_frame_len,
>  	.enable_tx_timestamp = dwmac4_rd_enable_tx_timestamp,
>  	.get_tx_timestamp_status = dwmac4_wrback_get_tx_timestamp_status,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index b95d3e137813..5a079dae1380 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -56,6 +56,10 @@ struct stmmac_desc_ops {
>  	void (*set_tx_ic)(struct dma_desc *p);
>  	/* Last tx segment reports the transmit status */
>  	int (*get_tx_ls)(struct dma_desc *p);
> +	/* Get the tag of the descriptor */
> +	int (*get_rx_vlan_tci)(struct dma_desc *p);
> +	/* Get the valid status of descriptor */
> +	bool (*get_rx_vlan_valid)(struct dma_desc *p);
>  	/* Return the transmit status looking at the TDES1 */
>  	int (*tx_status)(struct stmmac_extra_stats *x,
>  			 struct dma_desc *p, void __iomem *ioaddr);
> @@ -117,6 +121,10 @@ struct stmmac_desc_ops {
>  	stmmac_do_void_callback(__priv, desc, set_tx_ic, __args)
>  #define stmmac_get_tx_ls(__priv, __args...) \
>  	stmmac_do_callback(__priv, desc, get_tx_ls, __args)
> +#define stmmac_get_rx_vlan_tci(__priv, __args...) \
> +	stmmac_do_callback(__priv, desc, get_rx_vlan_tci, __args)
> +#define stmmac_get_rx_vlan_valid(__priv, __args...) \
> +	stmmac_do_callback(__priv, desc, get_rx_vlan_valid, __args)
>  #define stmmac_tx_status(__priv, __args...) \
>  	stmmac_do_callback(__priv, desc, tx_status, __args)
>  #define stmmac_get_tx_len(__priv, __args...) \
> @@ -388,6 +396,9 @@ struct stmmac_ops {
>  	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash,
>  				 __le16 perfect_match, bool is_double);
>  	void (*enable_vlan)(struct mac_device_info *hw, u32 type);
> +	void (*rx_hw_vlan)(struct mac_device_info *hw, struct dma_desc *rx_desc,
> +			   struct sk_buff *skb);
> +	void (*set_hw_vlan_mode)(struct mac_device_info *hw);
>  	int (*add_hw_vlan_rx_fltr)(struct net_device *dev,
>  				   struct mac_device_info *hw,
>  				   __be16 proto, u16 vid);
> @@ -497,6 +508,10 @@ struct stmmac_ops {
>  	stmmac_do_void_callback(__priv, mac, update_vlan_hash, __args)
>  #define stmmac_enable_vlan(__priv, __args...) \
>  	stmmac_do_void_callback(__priv, mac, enable_vlan, __args)
> +#define stmmac_rx_hw_vlan(__priv, __args...) \
> +	stmmac_do_void_callback(__priv, mac, rx_hw_vlan, __args)
> +#define stmmac_set_hw_vlan_mode(__priv, __args...) \
> +	stmmac_do_void_callback(__priv, mac, set_hw_vlan_mode, __args)
>  #define stmmac_add_hw_vlan_rx_fltr(__priv, __args...) \
>  	stmmac_do_callback(__priv, mac, add_hw_vlan_rx_fltr, __args)
>  #define stmmac_del_hw_vlan_rx_fltr(__priv, __args...) \
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3e50fd53a617..62299ec5179f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3469,6 +3469,9 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
>  	/* Start the ball rolling... */
>  	stmmac_start_all_dma(priv);
>  
> +	if (priv->hw->hw_vlan_en)
> +		stmmac_set_hw_vlan_mode(priv, priv->hw);
> +
>  	if (priv->dma_cap.fpesel) {
>  		stmmac_fpe_start_wq(priv);
>  
> @@ -5508,7 +5511,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		/* Got entire packet into SKB. Finish it. */
>  
>  		stmmac_get_rx_hwtstamp(priv, p, np, skb);
> -		stmmac_rx_vlan(priv->dev, skb);
> +
> +		if (priv->hw->hw_vlan_en)
> +			/* MAC level stripping. */
> +			stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
> +		else
> +			/* Driver level stripping. */
> +			stmmac_rx_vlan(priv->dev, skb);
> +

This same pattern exists in stmmac_dispatch_skb_zc, does it make sense
to update that as well?

>  		skb->protocol = eth_type_trans(skb, priv->dev);
>  
>  		if (unlikely(!coe))
> @@ -5817,6 +5827,14 @@ static int stmmac_set_features(struct net_device *netdev,
>  			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
>  	}
>  
> +	if ((features & NETIF_F_HW_VLAN_CTAG_RX) &&
> +	    (priv->plat->flags & STMMAC_FLAG_HW_VLAN_EN))
> +		priv->hw->hw_vlan_en = true;
> +	else
> +		priv->hw->hw_vlan_en = false;
> +
> +	stmmac_set_hw_vlan_mode(priv, priv->hw);
> +
>  	return 0;
>  }
>  
> @@ -7146,6 +7164,8 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>  			 "Enable RX Mitigation via HW Watchdog Timer\n");
>  	}
>  
> +	priv->hw->hw_vlan_en = (priv->plat->flags & STMMAC_FLAG_HW_VLAN_EN);

I'm curious, is there a particular reason you make this feature a
platform opt-in? My gut feeling is that if it's a dwmac4/5 feature, it
would be better to just enable it for all the platforms who use that IP
instead of making it opt-in per platform. To me that is more in the
spirit of a common IP driver.

> +
>  	return 0;
>  }
>  
> @@ -7515,6 +7535,8 @@ int stmmac_dvr_probe(struct device *device,
>  #ifdef STMMAC_VLAN_TAG_USED
>  	/* Both mac100 and gmac support receive VLAN tag detection */
>  	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
> +	ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
> +
>  	if (priv->dma_cap.vlhash) {
>  		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
>  		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 0b4658a7eceb..1cf78e6bca5e 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -220,6 +220,7 @@ struct dwmac4_addrs {
>  #define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
>  #define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
>  #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(12)
> +#define STMMAC_FLAG_HW_VLAN_EN			BIT(13)
>  
>  struct plat_stmmacenet_data {
>  	int bus_id;
> -- 
> 2.34.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
