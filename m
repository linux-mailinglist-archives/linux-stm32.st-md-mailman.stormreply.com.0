Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9188C3F8F
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 13:12:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 343E9C640E5;
	Mon, 13 May 2024 11:12:42 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7AAFC030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 11:12:34 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2e1fa1f1d9bso74904091fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 04:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715598754; x=1716203554;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CsXgR3w2FhQE+aSDSS2Gv40EZ/tbmCX2jDPHP8DnHb8=;
 b=P9H+aL+E49Or97/XilIH95iyYBAXKpwZQUD+l52tNyz87gW/1QyjOEu95g48sSzb9F
 hjhoa6FScuj9wJRQDYbiH8kbpd5h5y7NidHAMJl4Kwt/XvDq8+/4d/NQKqS9o8LiAMtV
 7RSoIfIdDjUFT3GF9WMUl7zXQhPisRgFmwH+B2a0rissXuAh1Eozz8XgQCASKeSUssPj
 8IXfAzOh0rWZc7N8LHIxJez/D3lP7Q9syk/Yl7xF6pUNb9OyrUkaSzNsWXTtzL32RQzo
 xH8PksNK2D9QimmyU2j8lbe1DbkbDgrHMghkquSqQpOGLuCRCu24FAOB1ggE6LUoLgz9
 N4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715598754; x=1716203554;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CsXgR3w2FhQE+aSDSS2Gv40EZ/tbmCX2jDPHP8DnHb8=;
 b=bq1YkkbwIjKUzymw2KtmF5Mq96p99bwSS9aUPgqLNTQ/U7Ym/N759NomgVNrJRo8mh
 ybQgXvKDP0HeYHBeF1SlywWdaliZXcwPvzeNMNAPTBm52my2/bqCunJ60rKlB2nBs5x7
 KFsAnnCSirODt4HFdYLZ3mLzIBeI/7C3L6r8I2KHbDfJy9Vd/5W8W6MOAbQWmK62yhqF
 VEUTgSDzH0SoqcunNdDv7iOw9YJDn7V1//EwG6UyZ0q8qAwuc1CvJnMyWtuNJ8Z3gznO
 xAhuwiSIFyn5dcYkvc/gZnA9wEH+/7cSouH1qdGdQxbkOQZVeqqLsEMNp2Lls05OUZot
 sDTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7eCrcZN6Wgxvq07mSsxI8aVmKork4fssfGKHr+PkPAkc+0kGqFb23eVrKMaRKViBLMJIhfVSVKspRa0HJx1V4dgjs0Hiq7OibMiuR+DEwKQpMGFmY88su
X-Gm-Message-State: AOJu0YzeMpGVIVSvDvCCF9JJyfPp6w3BWqYnMbyJtpk0VzPCMUicdvdc
 ePA6y6QTFQ50E75htPGEqqVJxWsMBcmXsYaHsJDPmje3F0f36Tip
X-Google-Smtp-Source: AGHT+IFNrzH1ND0SZWwUAgn/8uMLO2dCcSkwSoLKZfE1t1yAXNHUDLcBvn8cGIMU+gIVm1ldgnIHuA==
X-Received: by 2002:a05:651c:b0c:b0:2dd:bc53:e80 with SMTP id
 38308e7fff4ca-2e52039daccmr90950591fa.51.1715598753491; 
 Mon, 13 May 2024 04:12:33 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0bbd6a7sm14048281fa.6.2024.05.13.04.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 04:12:32 -0700 (PDT)
Date: Mon, 13 May 2024 14:12:29 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <u3t3zu4ihqoc44gl2mvw74seamtoas5wvxr7kqzxxhvu3enhbx@7txzs5fsse25>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-2-6acf58b5440d@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240513-rzn1-gmac1-v7-2-6acf58b5440d@bootlin.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v7 2/7] net: stmmac: Add
 dedicated XPCS cleanup method
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

Hi Romain

On Mon, May 13, 2024 at 09:25:13AM +0200, Romain Gantois wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> Currently the XPCS handler destruction is performed in the
> stmmac_mdio_unregister() method. It doesn't look good because the handler
> isn't originally created in the corresponding protagonist
> stmmac_mdio_unregister(), but in the stmmac_xpcs_setup() function. In
> order to have more coherent MDIO and XPCS setup/cleanup procedures,
> let's move the DW XPCS destruction to the dedicated stmmac_pcs_clean()
> method.
> 
> This method will also be used to cleanup PCS hardware using the
> pcs_exit() callback that will be introduced to stmmac in a subsequent
> patch.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Looking good. Thanks!
* Not sure whether my explicit Rb tag will be required in such the tags
disposition.)

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 14 +++++++++++---
>  3 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index dddcaa9220cc3..badfe686a5702 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -361,6 +361,7 @@ int stmmac_mdio_unregister(struct net_device *ndev);
>  int stmmac_mdio_register(struct net_device *ndev);
>  int stmmac_mdio_reset(struct mii_bus *mii);
>  int stmmac_xpcs_setup(struct mii_bus *mii);
> +void stmmac_pcs_clean(struct net_device *ndev);
>  void stmmac_set_ethtool_ops(struct net_device *netdev);
>  
>  int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3d828904db0d3..0ac99c132733d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7789,8 +7789,9 @@ int stmmac_dvr_probe(struct device *device,
>  
>  error_netdev_register:
>  	phylink_destroy(priv->phylink);
> -error_xpcs_setup:
>  error_phy_setup:
> +	stmmac_pcs_clean(ndev);
> +error_xpcs_setup:
>  	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
> @@ -7832,6 +7833,9 @@ void stmmac_dvr_remove(struct device *dev)
>  	if (priv->plat->stmmac_rst)
>  		reset_control_assert(priv->plat->stmmac_rst);
>  	reset_control_assert(priv->plat->stmmac_ahb_rst);
> +
> +	stmmac_pcs_clean(ndev);
> +
>  	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 0542cfd1817e6..73ba9901a4439 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -523,6 +523,17 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
>  	return 0;
>  }
>  
> +void stmmac_pcs_clean(struct net_device *ndev)
> +{
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +
> +	if (!priv->hw->xpcs)
> +		return;
> +
> +	xpcs_destroy(priv->hw->xpcs);
> +	priv->hw->xpcs = NULL;
> +}
> +
>  /**
>   * stmmac_mdio_register
>   * @ndev: net device structure
> @@ -679,9 +690,6 @@ int stmmac_mdio_unregister(struct net_device *ndev)
>  	if (!priv->mii)
>  		return 0;
>  
> -	if (priv->hw->xpcs)
> -		xpcs_destroy(priv->hw->xpcs);
> -
>  	mdiobus_unregister(priv->mii);
>  	priv->mii->priv = NULL;
>  	mdiobus_free(priv->mii);
> 
> -- 
> 2.44.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
