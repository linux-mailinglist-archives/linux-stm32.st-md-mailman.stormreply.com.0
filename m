Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 696448FD6DA
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jun 2024 21:57:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2130DC71293;
	Wed,  5 Jun 2024 19:57:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F31C0C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 19:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717617461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JWQxM6aqHm81G/z8DlBDMrRJqsgHQrmGfdhPJ9ykgek=;
 b=YXxHDteEPr8pzM89lttADv8lQdCwOjhQyicWtSfm1hyQCNRi1BRwc09iFDlAk/ZM+5L+7W
 hnOUX46h2kYsr1Ppd093DrbCc4vC0FqBglSW1EZVJwod3MPz2H8piR87tH+bzeqmpX99pQ
 NBVlag3hEtzZ6phNTnyr5y0Q3+kYClc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-BVh-DWIDP4CSF5Cj_y7qoA-1; Wed, 05 Jun 2024 15:57:38 -0400
X-MC-Unique: BVh-DWIDP4CSF5Cj_y7qoA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6ae099984c6so1647086d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Jun 2024 12:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717617458; x=1718222258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JWQxM6aqHm81G/z8DlBDMrRJqsgHQrmGfdhPJ9ykgek=;
 b=sFb8Whz17G9DdDnRECXOXGcGtw+1UEuCPauUG+r872huVDASuNFFUvD3FUQyJNjE6N
 W+aJyW6thfw8WwOJZ7z5e+P7DXdVH86FFzgUhz4Qhw8mHymmoXossmDJmnITRAAOPOPX
 dJmYR1yirUiD6RCaP1UAHyxVri8LXNrB5WqQhGz8YPKyaucMYs3UmqTuBdB9QtdfRTaG
 5/SNAcx8xH/5uxVyRLqqJxFGESPojA0ziaW1VO2uiYYMldVLILVHNl+L9zsdTr8845P7
 3eYNz6fQLyuNBR7iajSc41kM7doj5Kmw7f7gFEFe1j820pDHZuFtkjESZo88tRZ+aIe2
 cgpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcrI4Tshv2RfyzgvpXwVEyVl+uaY7PLoZiP2gfQoMaC37xSbso1miMWZODvc573nbhsCF2ttsVR+xmfIs6oWnxNK1Ub2OoAKr3NvIiq97QV/o9r+29tG+F
X-Gm-Message-State: AOJu0YyAF0NJR1zxZPb9Eoyzzwdee8FrAh85Gx90pfTJj84Yf9x93y75
 Wk3jNQowmyeUQFvtFHkgzMNcH2EjR62VYhCAPdo4movnE3/MNtTKQoBMLQXGTBN9EVUXEsxWlpz
 xQrOgqwAv63Rt3nCxVS+GkUALR8Zoq7iaZh9r+9TEOP5ETpAvojxQJbCrIH8Ark0RyyJCgVaFCq
 Hy6A==
X-Received: by 2002:a05:620a:2117:b0:793:29:7fdd with SMTP id
 af79cd13be357-79523d35d0bmr373676485a.1.1717617457772; 
 Wed, 05 Jun 2024 12:57:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIIh/6pi8PTFOGs3IGfoQfpMirYunYud+fmoKSI1Bn2omHpXELJyfVCOdX6bX/d86FFhd4Ow==
X-Received: by 2002:a05:620a:2117:b0:793:29:7fdd with SMTP id
 af79cd13be357-79523d35d0bmr373673185a.1.1717617457232; 
 Wed, 05 Jun 2024 12:57:37 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794f2f11fa5sm471097585a.38.2024.06.05.12.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 12:57:36 -0700 (PDT)
Date: Wed, 5 Jun 2024 14:57:34 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <gyiomer5eqxtq7q7zo5lwtokvdugs4jlb3nux3ry6xf5j27wtp@wl6s643vbn75>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0Ol-00EzBh-3f@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sD0Ol-00EzBh-3f@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 1/8] net: stmmac: add
 infrastructure for hwifs to provide PCS
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

On Fri, May 31, 2024 at 12:26:15PM GMT, Russell King (Oracle) wrote:
> Allow hwifs to provide a phylink_select_pcs() implementation via struct
> stmmac_ops, which can be used to provide a phylink PCS.
> 
> Code analysis shows that when STMMAC_FLAG_HAS_INTEGRATED_PCS is set,
> then:
> 
> 	stmmac_common_interrupt()
> 	stmmac_ethtool_set_link_ksettings()
> 	stmmac_ethtool_get_link_ksettings()
> 
> will all ignore the presence of the PCS. The latter two will pass the
> ethtool commands to phylink. The former will avoid manipulating the
> netif carrier state behind phylink's back based on the PCS status.
> 
> This flag is only set by the ethqos driver. From what I can tell,
> amongst the current kernel DT files that use the ethqos driver, only
> sa8775p-ride.dts enables ethernet, and this defines a SGMII-mode link
> to its PHYs without the "managed" property. Thus, phylink will be
> operating in MLO_AN_PHY mode, and inband mode will not be used.
> 
> Therefore, it is safe to ignore the STMMAC_FLAG_HAS_INTEGRATED_PCS
> flag in stmmac_mac_select_pcs().
> 
> Further code analysis shows that XPCS is used by Intel for Cisco
> SGMII and 1000base-X modes. In this case, we do not want to provide
> the integrated PCS, but the XPCS. The same appears to also be true
> of the Lynx PCS.
> 
> Therefore, it seems that the integrated PCS provided by the hwif MAC
> code should only be used when an external PCS is not being used, so
> give priority to the external PCS.
> 
> Provide a phylink_pcs instance in struct mac_device_info for hwifs to
> use to provide their phylink PCS.
> 
> Omit the non-phylink PCS code paths when a hwif provides a
> phylink_select_pcs() method (in other words, when they are converted to
> use a phylink PCS.) This provides a way to transition parts of the
> driver in the subsequent patches.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  9 ++++++++-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    | 19 +++++++++++++++++--
>  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 12 ++++++++----
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++++---
>  4 files changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index cd36ff4da68c..940e83fa1202 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -14,7 +14,7 @@
>  #include <linux/etherdevice.h>
>  #include <linux/netdevice.h>
>  #include <linux/stmmac.h>
> -#include <linux/phy.h>
> +#include <linux/phylink.h>
>  #include <linux/pcs/pcs-xpcs.h>
>  #include <linux/module.h>
>  #if IS_ENABLED(CONFIG_VLAN_8021Q)
> @@ -591,6 +591,7 @@ struct mac_device_info {
>  	const struct stmmac_tc_ops *tc;
>  	const struct stmmac_mmc_ops *mmc;
>  	const struct stmmac_est_ops *est;
> +	struct phylink_pcs mac_pcs;	/* The MAC's RGMII/SGMII "PCS" */
>  	struct dw_xpcs *xpcs;
>  	struct phylink_pcs *phylink_pcs;
>  	struct mii_regs mii;	/* MII register Addresses */
> @@ -611,6 +612,12 @@ struct mac_device_info {
>  	bool hw_vlan_en;
>  };
>  
> +static inline struct mac_device_info *
> +phylink_pcs_to_mac_dev_info(struct phylink_pcs *pcs)
> +{
> +	return container_of(pcs, struct mac_device_info, mac_pcs);
> +}
> +
>  struct stmmac_rx_routing {
>  	u32 reg_mask;
>  	u32 reg_shift;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 97934ccba5b1..aa5f6e40cb53 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -5,6 +5,7 @@
>  #ifndef __STMMAC_HWIF_H__
>  #define __STMMAC_HWIF_H__
>  
> +#include <linux/err.h>
>  #include <linux/netdevice.h>
>  #include <linux/stmmac.h>
>  
> @@ -17,13 +18,17 @@
>  	} \
>  	__result; \
>  })
> -#define stmmac_do_callback(__priv, __module, __cname,  __arg0, __args...) \
> +#define stmmac_do_typed_callback(__type, __fail_ret, __priv, __module, \
> +				 __cname,  __arg0, __args...) \
>  ({ \
> -	int __result = -EINVAL; \
> +	__type __result = __fail_ret; \
>  	if ((__priv)->hw->__module && (__priv)->hw->__module->__cname) \
>  		__result = (__priv)->hw->__module->__cname((__arg0), ##__args); \
>  	__result; \
>  })
> +#define stmmac_do_callback(__priv, __module, __cname,  __arg0, __args...) \
> +	stmmac_do_typed_callback(int, -EINVAL, __priv, __module, __cname, \
> +				 __arg0, ##__args)
>  
>  struct stmmac_extra_stats;
>  struct stmmac_priv;
> @@ -310,6 +315,9 @@ struct stmmac_ops {
>  	void (*core_init)(struct mac_device_info *hw, struct net_device *dev);
>  	/* Update MAC capabilities */
>  	void (*update_caps)(struct stmmac_priv *priv);
> +	/* Get phylink PCS (for MAC */

nit: unclosed parenthesis

> +	struct phylink_pcs *(*phylink_select_pcs)(struct stmmac_priv *priv,
> +						  phy_interface_t interface);
>  	/* Enable the MAC RX/TX */
>  	void (*set_mac)(void __iomem *ioaddr, bool enable);
>  	/* Enable and verify that the IPC module is supported */
> @@ -431,6 +439,10 @@ struct stmmac_ops {
>  	stmmac_do_void_callback(__priv, mac, core_init, __args)
>  #define stmmac_mac_update_caps(__priv) \
>  	stmmac_do_void_callback(__priv, mac, update_caps, __priv)
> +#define stmmac_mac_phylink_select_pcs(__priv, __interface) \
> +	stmmac_do_typed_callback(struct phylink_pcs *, ERR_PTR(-EOPNOTSUPP), \
> +				 __priv, mac, phylink_select_pcs, __priv,\
> +				 __interface)
>  #define stmmac_mac_set(__priv, __args...) \
>  	stmmac_do_void_callback(__priv, mac, set_mac, __args)
>  #define stmmac_rx_ipc(__priv, __args...) \
> @@ -530,6 +542,9 @@ struct stmmac_ops {
>  #define stmmac_fpe_irq_status(__priv, __args...) \
>  	stmmac_do_callback(__priv, mac, fpe_irq_status, __args)
>  
> +#define stmmac_has_mac_phylink_select_pcs(__priv) \
> +	((__priv)->hw->mac->phylink_select_pcs != NULL)
> +
>  /* PTP and HW Timer helpers */
>  struct stmmac_hwtimestamp {
>  	void (*config_hw_tstamping) (void __iomem *ioaddr, u32 data);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 18468c0228f0..7c6530d63ade 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -323,7 +323,8 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
>  
>  	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
>  	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
> -	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
> +	     priv->hw->pcs & STMMAC_PCS_SGMII) &&
> +	    !stmmac_has_mac_phylink_select_pcs(priv)) {
>  		struct rgmii_adv adv;
>  		u32 supported, advertising, lp_advertising;
>  
> @@ -410,7 +411,8 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
>  
>  	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
>  	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
> -	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
> +	     priv->hw->pcs & STMMAC_PCS_SGMII) &&
> +	    !stmmac_has_mac_phylink_select_pcs(priv)) {
>  		/* Only support ANE */
>  		if (cmd->base.autoneg != AUTONEG_ENABLE)
>  			return -EINVAL;
> @@ -523,7 +525,8 @@ stmmac_get_pauseparam(struct net_device *netdev,
>  	struct stmmac_priv *priv = netdev_priv(netdev);
>  	struct rgmii_adv adv_lp;
>  
> -	if (priv->hw->pcs && !stmmac_pcs_get_adv_lp(priv, priv->ioaddr, &adv_lp)) {
> +	if (priv->hw->pcs && !stmmac_has_mac_phylink_select_pcs(priv) &&
> +	    !stmmac_pcs_get_adv_lp(priv, priv->ioaddr, &adv_lp)) {
>  		pause->autoneg = 1;
>  		if (!adv_lp.pause)
>  			return;
> @@ -539,7 +542,8 @@ stmmac_set_pauseparam(struct net_device *netdev,
>  	struct stmmac_priv *priv = netdev_priv(netdev);
>  	struct rgmii_adv adv_lp;
>  
> -	if (priv->hw->pcs && !stmmac_pcs_get_adv_lp(priv, priv->ioaddr, &adv_lp)) {
> +	if (priv->hw->pcs && !stmmac_has_mac_phylink_select_pcs(priv) &&
> +	   !stmmac_pcs_get_adv_lp(priv, priv->ioaddr, &adv_lp)) {
>  		pause->autoneg = 1;
>  		if (!adv_lp.pause)
>  			return -EOPNOTSUPP;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index bbedf2a8c60f..56c351e11952 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -953,7 +953,10 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
>  	if (priv->hw->xpcs)
>  		return &priv->hw->xpcs->pcs;
>  
> -	return priv->hw->phylink_pcs;
> +	if (priv->hw->phylink_pcs)
> +		return priv->hw->phylink_pcs;
> +
> +	return stmmac_mac_phylink_select_pcs(priv, interface);
>  }
>  
>  static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
> @@ -3482,7 +3485,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
>  		}
>  	}
>  
> -	if (priv->hw->pcs)
> +	if (priv->hw->pcs && !stmmac_has_mac_phylink_select_pcs(priv))
>  		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, priv->hw->ps, 0);
>  
>  	/* set TX and RX rings length */
> @@ -6052,7 +6055,8 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
>  
>  		/* PCS link status */
>  		if (priv->hw->pcs &&
> -		    !(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS)) {
> +		    !(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
> +		    !stmmac_has_mac_phylink_select_pcs(priv)) {
>  			if (priv->xstats.pcs_link)
>  				netif_carrier_on(priv->dev);
>  			else
> -- 
> 2.30.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
