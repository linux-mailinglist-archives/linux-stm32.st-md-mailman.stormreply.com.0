Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 114E53E4462
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 13:06:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF4F9C5719E;
	Mon,  9 Aug 2021 11:06:29 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8877C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 11:06:28 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id k9so6652359edr.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Aug 2021 04:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rqeeHdFchIP+lwGA3HCPDFYMIAiS+hDBXIwLFpK/6FQ=;
 b=LysAVhcZN4VamA6w0Bt5EA0pSwuLmjl6mFBc/WjwCp/VqGiUwNjWfZf+MhmKZtOETw
 NXGKJAz5m9eVz6OiSPVACZT+rT+XxT9zEdF0EriCtD5gm4a7GEetlFWQzj6UN3PMeWhh
 l1IyPQJ3D/iQnXzP1kKr0QKGoRrvNXSD5HbPlxM7xaLiVVRvzguIV7MJbEJihqnXezPW
 o1FIsieBqIKuaJR/QkjKApmwu3qm69u5ETCRQEs5TTE9ynCckJn9tr2guVVeNzIj43sy
 uBlbv947wJyiIOT6HeEehYqivl79V7Fj1IkWNV5LeGz6N9ZG91KxXwIfspe8YayhpTht
 giUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rqeeHdFchIP+lwGA3HCPDFYMIAiS+hDBXIwLFpK/6FQ=;
 b=kECZnlu7O8S1/j3TKfnBMjZMpzK6zBCP0iUjZah7kDRqMcEyNNyeKuKFTaU6132+q5
 9wZhEy81U9qqsf4UzdfTHZMRamipUF61j6RF7RUaTr8akKZC7z5CPfZHqAkO8nd1pogP
 lEQo1WvXyPf+25POLNbCX40EcSGPXNnAI8rfy59UxxBJk10HtYK5VCHzNcwS+JVUFMgQ
 OweDZoApdoHwaah8g9FtuW6/GpFTRt8QaZxCkgWo9Tp7Jfmtgy7mr/RsheaTExJ0PuRZ
 VfUBgWUUJKdiKlkbJKL6Y3F/jpHfEOalL0R5dlz+FsiRKAaKIrvo/Q6sbDXcp+o9MLvE
 eViA==
X-Gm-Message-State: AOAM5304vfxiSIDUPVVZFPcAs36xIR+gG4BUXZTk845sKL35alwtkraL
 P6mqLgg1LFhLvC/F1aZt2Ps=
X-Google-Smtp-Source: ABdhPJyH0j2dqKqb+c+DaZqSChnn1pBcE8AI4Vi7lk9pC1/kUS7xkWpuQsFpG0Z1NuGIataB+B6pYg==
X-Received: by 2002:a50:fc96:: with SMTP id f22mr6964806edq.367.1628507188420; 
 Mon, 09 Aug 2021 04:06:28 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id y23sm5794648ejp.115.2021.08.09.04.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 04:06:28 -0700 (PDT)
Date: Mon, 9 Aug 2021 14:06:26 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Message-ID: <20210809110626.4kfkegwixiualq2x@skbuf>
References: <20210809102229.933748-1-vee.khee.wong@linux.intel.com>
 <20210809102229.933748-2-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210809102229.933748-2-vee.khee.wong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-kernel@vger.kernel.org, Voon Weifeng <weifeng.voon@intel.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: pcs: xpcs: enable skip
	xPCS soft reset
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

Hi VK,

On Mon, Aug 09, 2021 at 06:22:28PM +0800, Wong Vee Khee wrote:
> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 63fda3fc40aa..c7a3aa862079 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
> @@ -1081,7 +1081,8 @@ static const struct phylink_pcs_ops xpcs_phylink_ops = {
>  };
>  
>  struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
> -			    phy_interface_t interface)
> +			    phy_interface_t interface,
> +			    bool skip_reset)
>  {
>  	struct dw_xpcs *xpcs;
>  	u32 xpcs_id;
> @@ -1113,9 +1114,16 @@ struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
>  		xpcs->pcs.ops = &xpcs_phylink_ops;
>  		xpcs->pcs.poll = true;
>  
> -		ret = xpcs_soft_reset(xpcs, compat);
> -		if (ret)
> -			goto out;
> +		if (!skip_reset) {
> +			dev_info(&xpcs->mdiodev->dev, "%s: xPCS soft reset\n",
> +				 __func__);
> +			ret = xpcs_soft_reset(xpcs, compat);
> +			if (ret)
> +				goto out;
> +		} else {
> +			dev_info(&xpcs->mdiodev->dev,
> +				 "%s: skip xpcs soft reset\n", __func__);
> +		}

I don't feel like the prints are really necessary.

>  
>  		return xpcs;
>  	}
> diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
> index add077a81b21..0c05a63f3446 100644
> --- a/include/linux/pcs/pcs-xpcs.h
> +++ b/include/linux/pcs/pcs-xpcs.h
> @@ -36,7 +36,8 @@ void xpcs_validate(struct dw_xpcs *xpcs, unsigned long *supported,
>  int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
>  		    int enable);
>  struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
> -			    phy_interface_t interface);
> +			    phy_interface_t interface,
> +			    bool xpcs_reset);
>  void xpcs_destroy(struct dw_xpcs *xpcs);
>  

How about exporting the reset functionality as a separate function, and
the Intel Alder Lake stmmac shim just won't call it? Like this:

-----------------------------[ cut here ]-----------------------------
diff --git a/drivers/net/dsa/sja1105/sja1105_mdio.c b/drivers/net/dsa/sja1105/sja1105_mdio.c
index 19aea8fb76f6..5acf6742da4d 100644
--- a/drivers/net/dsa/sja1105/sja1105_mdio.c
+++ b/drivers/net/dsa/sja1105/sja1105_mdio.c
@@ -437,13 +437,17 @@ static int sja1105_mdiobus_pcs_register(struct sja1105_private *priv)
 			goto out_pcs_free;
 		}
 
-		xpcs = xpcs_create(mdiodev, priv->phy_mode[port]);
+		xpcs = xpcs_create(mdiodev);
 		if (IS_ERR(xpcs)) {
 			rc = PTR_ERR(xpcs);
 			goto out_pcs_free;
 		}
 
 		priv->xpcs[port] = xpcs;
+
+		rc = xpcs_reset(xpcs, priv->phy_mode[port]);
+		if (rc)
+			goto out_pcs_free;
 	}
 
 	priv->mdio_pcs = bus;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index a5d150c5f3d8..81a145009488 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -401,12 +401,15 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
 {
 	struct net_device *ndev = bus->priv;
 	struct mdio_device *mdiodev;
+	bool skip_xpcs_soft_reset;
 	struct stmmac_priv *priv;
 	struct dw_xpcs *xpcs;
 	int mode, addr;
+	int err;
 
 	priv = netdev_priv(ndev);
 	mode = priv->plat->phy_interface;
+	skip_xpcs_soft_reset = priv->plat->skip_xpcs_soft_reset;
 
 	/* Try to probe the XPCS by scanning all addresses. */
 	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
@@ -414,12 +417,21 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
 		if (IS_ERR(mdiodev))
 			continue;
 
-		xpcs = xpcs_create(mdiodev, mode);
+		xpcs = xpcs_create(mdiodev);
 		if (IS_ERR_OR_NULL(xpcs)) {
 			mdio_device_free(mdiodev);
 			continue;
 		}
 
+		if (!skip_xpcs_soft_reset) {
+			err = xpcs_reset(xpcs, mode);
+			if (err) {
+				xpcs_destroy(xpcs);
+				mdio_device_free(mdiodev);
+				continue;
+			}
+		}
+
 		priv->hw->xpcs = xpcs;
 		break;
 	}
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 63fda3fc40aa..2e721e57bee4 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -248,6 +248,18 @@ static int xpcs_soft_reset(struct dw_xpcs *xpcs,
 	return xpcs_poll_reset(xpcs, dev);
 }
 
+int xpcs_reset(struct dw_xpcs *xpcs, phy_interface_t interface)
+{
+	const struct xpcs_compat *compat;
+
+	compat = xpcs_find_compat(xpcs->id, interface);
+	if (!compat)
+		return -ENODEV;
+
+	return xpcs_soft_reset(xpcs, compat);
+}
+EXPORT_SYMBOL_GPL(xpcs_reset);
+
 #define xpcs_warn(__xpcs, __state, __args...) \
 ({ \
 	if ((__state)->link) \
@@ -1080,12 +1092,11 @@ static const struct phylink_pcs_ops xpcs_phylink_ops = {
 	.pcs_link_up = xpcs_link_up,
 };
 
-struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
-			    phy_interface_t interface)
+struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev)
 {
 	struct dw_xpcs *xpcs;
 	u32 xpcs_id;
-	int i, ret;
+	int i;
 
 	xpcs = kzalloc(sizeof(*xpcs), GFP_KERNEL);
 	if (!xpcs)
@@ -1097,35 +1108,18 @@ struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
 
 	for (i = 0; i < ARRAY_SIZE(xpcs_id_list); i++) {
 		const struct xpcs_id *entry = &xpcs_id_list[i];
-		const struct xpcs_compat *compat;
 
 		if ((xpcs_id & entry->mask) != entry->id)
 			continue;
 
 		xpcs->id = entry;
-
-		compat = xpcs_find_compat(entry, interface);
-		if (!compat) {
-			ret = -ENODEV;
-			goto out;
-		}
-
 		xpcs->pcs.ops = &xpcs_phylink_ops;
 		xpcs->pcs.poll = true;
 
-		ret = xpcs_soft_reset(xpcs, compat);
-		if (ret)
-			goto out;
-
 		return xpcs;
 	}
 
-	ret = -ENODEV;
-
-out:
-	kfree(xpcs);
-
-	return ERR_PTR(ret);
+	return ERR_PTR(-ENODEV);
 }
 EXPORT_SYMBOL_GPL(xpcs_create);
 
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index add077a81b21..d841f55f12cc 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -35,8 +35,8 @@ void xpcs_validate(struct dw_xpcs *xpcs, unsigned long *supported,
 		   struct phylink_link_state *state);
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		    int enable);
-struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
-			    phy_interface_t interface);
+int xpcs_reset(struct dw_xpcs *xpcs, phy_interface_t interface);
+struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev);
 void xpcs_destroy(struct dw_xpcs *xpcs);
 
 #endif /* __LINUX_PCS_XPCS_H */
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index a6f03b36fc4f..0f901773c5e4 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -268,5 +268,6 @@ struct plat_stmmacenet_data {
 	int msi_rx_base_vec;
 	int msi_tx_base_vec;
 	bool use_phy_wol;
+	bool skip_xpcs_soft_reset;
 };
 #endif
-----------------------------[ cut here ]-----------------------------

I also gave this patch a run on sja1105 and it still works.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
