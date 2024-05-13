Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E03BF8C3FA4
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 13:19:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 956E7C640E5;
	Mon, 13 May 2024 11:19:06 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABC4FC030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 11:18:59 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51fcb7dc722so4004261e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 04:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715599139; x=1716203939;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TxoxTRlBMgAdpdtYLCnyvuBYOSb/qoUiI56aw8Gi2oQ=;
 b=M25QuVqN53FTp8rietZAUhcsPW1glAh6WGZkWA4ASirKe6V6RBoz9CkZ5wurbjvetH
 oT+hsag0C+ezdK4foFL92A/O8feVoKmfCQbd1kX2afsC+hggvXcdxFj4Rdgu350vUTXq
 8L6vRa53n4osmAw9PM+gXXQEk50Csn8pA/GSU0P92Vvs7C/1PwgER9E1nltOdXqYRZ3b
 4NTM70p+xwagfmUP3GjGb/gNOTJJE6nIAn4uwqC8J04KvHPmoNibtoDn/TdtsJRH7ix6
 DUfdRyxfGiGF/AesjlQvxVUneYsLB/5WVsl6vSACUsRshuWXTnzwNQq2/459+MAhsUch
 7coA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715599139; x=1716203939;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TxoxTRlBMgAdpdtYLCnyvuBYOSb/qoUiI56aw8Gi2oQ=;
 b=dL7e0P5xFcPlDeIUo8dFuhyphw2C3rxsG/raf1viYA5UsWy5gGeKfv9HyWaoDfLEWy
 4xG45YIrHzlINxQAP+ZNvvm4NMdTBg+9Z12HXrS/gFNawwhbplSwoTo7xJXFm0ki8ste
 vfaeq+CWn3BPXwjb13+5RItkZZWUQ6z9yDX+Dz6qWa65+y27sxiSR7BkMBfEkdYmrr72
 AyutF0INw+yidKffdQZKD75SiLBr/PU94tlfii2oQm2/7wurBZCBCJnAFds8gP6t6E05
 G7WsyR6pp1F7DPc+1yjK/yUuIB0qqn2cSn8bDbplHGhioNEJY6x8mpmH1ML58xRTH94V
 eJXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2ytgSlSfHqv7RMH9rfPVyJjUq/mYfqxAFfkL72yoGL6kBKWJupqhoxn4GhIg/0Oaaviq/5GZXKCqBUsbhGHnfdtHITizgs3Tqn8pAxV18J1EiMRsD0A3T
X-Gm-Message-State: AOJu0YyW5ZCMkQg0eKK4dW1hLy0PFasMvUMXpXjada1gLnN88NCaq/Vi
 XDukgNI9+r0tDZcPUCcrDi/U2UrutGqVG0DFq4N+sg0SMOqGQ0MY
X-Google-Smtp-Source: AGHT+IHPjMFLv26BZRQFG2peE5v3S3oL/BYNqJ5p/9Me4eMLyyk+yjGM0lndBIQJAKOzP171zHN64A==
X-Received: by 2002:ac2:5d46:0:b0:51e:f830:2dec with SMTP id
 2adb3069b0e04-5220e477249mr2524557e87.17.1715599138745; 
 Mon, 13 May 2024 04:18:58 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad6f9sm1737071e87.48.2024.05.13.04.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 04:18:58 -0700 (PDT)
Date: Mon, 13 May 2024 14:18:55 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <mqjrk24l7bxeox4tpkz5yyfboq5siapj34k2c4ftub6ywp6txx@2webb4wu6hbe>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-3-6acf58b5440d@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240513-rzn1-gmac1-v7-3-6acf58b5440d@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/7] net: stmmac: Make
 stmmac_xpcs_setup() generic to all PCS devices
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

On Mon, May 13, 2024 at 09:25:14AM +0200, Romain Gantois wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> A pcs_init() callback will be introduced to stmmac in a future patch. This
> new function will be called during the hardware initialization phase.
> Instead of separately initializing XPCS and PCS components, let's group all
> PCS-related hardware initialization logic in the current
> stmmac_xpcs_setup() function.
> 
> Rename stmmac_xpcs_setup() to stmmac_pcs_setup() and move the conditional
> call to stmmac_xpcs_setup() inside the function itself.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Looking good. Thanks.

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++-----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 30 ++++++++++++++---------
>  3 files changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index badfe686a5702..ed38099ca7406 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -360,7 +360,7 @@ enum stmmac_state {
>  int stmmac_mdio_unregister(struct net_device *ndev);
>  int stmmac_mdio_register(struct net_device *ndev);
>  int stmmac_mdio_reset(struct mii_bus *mii);
> -int stmmac_xpcs_setup(struct mii_bus *mii);
> +int stmmac_pcs_setup(struct net_device *ndev);
>  void stmmac_pcs_clean(struct net_device *ndev);
>  void stmmac_set_ethtool_ops(struct net_device *netdev);
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 0ac99c132733d..ef285b3c56ab9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7754,11 +7754,9 @@ int stmmac_dvr_probe(struct device *device,
>  	if (priv->plat->speed_mode_2500)
>  		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
>  
> -	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
> -		ret = stmmac_xpcs_setup(priv->mii);
> -		if (ret)
> -			goto error_xpcs_setup;
> -	}
> +	ret = stmmac_pcs_setup(ndev);
> +	if (ret)
> +		goto error_pcs_setup;
>  
>  	ret = stmmac_phy_setup(priv);
>  	if (ret) {
> @@ -7791,7 +7789,7 @@ int stmmac_dvr_probe(struct device *device,
>  	phylink_destroy(priv->phylink);
>  error_phy_setup:
>  	stmmac_pcs_clean(ndev);
> -error_xpcs_setup:
> +error_pcs_setup:
>  	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 73ba9901a4439..54708440e27b8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -495,31 +495,37 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  	return 0;
>  }
>  
> -int stmmac_xpcs_setup(struct mii_bus *bus)
> +int stmmac_pcs_setup(struct net_device *ndev)
>  {
> -	struct net_device *ndev = bus->priv;
> +	struct dw_xpcs *xpcs = NULL;
>  	struct stmmac_priv *priv;
> -	struct dw_xpcs *xpcs;
> +	int ret = -ENODEV;
>  	int mode, addr;
>  
>  	priv = netdev_priv(ndev);
>  	mode = priv->plat->phy_interface;
>  
> -	/* Try to probe the XPCS by scanning all addresses. */
> -	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
> -		xpcs = xpcs_create_mdiodev(bus, addr, mode);
> -		if (IS_ERR(xpcs))
> -			continue;
> +	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
> +		/* Try to probe the XPCS by scanning all addresses */
> +		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
> +			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
> +			if (IS_ERR(xpcs))
> +				continue;
>  
> -		priv->hw->xpcs = xpcs;
> -		break;
> +			ret = 0;
> +			break;
> +		}
> +	} else {
> +		return 0;
>  	}
>  
> -	if (!priv->hw->xpcs) {
> +	if (ret) {
>  		dev_warn(priv->device, "No xPCS found\n");
> -		return -ENODEV;
> +		return ret;
>  	}
>  
> +	priv->hw->xpcs = xpcs;
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.44.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
