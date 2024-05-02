Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A168BA339
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 00:33:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A1F9C712A0;
	Thu,  2 May 2024 22:33:54 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97D1EC7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2024 22:33:47 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51f174e316eso1492044e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2024 15:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714689227; x=1715294027;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OuymcIiJPiemZlanqz0KZDKUioJ+R0OZ4+MGq8AhvEg=;
 b=EmhzRttgG8d/Xz/lKnKF2ZnQLMgW+SddfxWWLYu8w/Ll/UsCWXk0RpsMz7cMTH4tqi
 OxzaMyYXTm7faTLAyWHYo/gAJFDj84pfesY03G/8beD8d2g6XF2asJYM+1ishFtMRqZ4
 4UZBl9QR8gzIkQh06oRGxZY0p5oJ+qM33g5zvWrYJeCXntPIktSHoACzxQ8WyoejdF9h
 bSi76PI5lObFhweQMIMfC0jKhJBlj8RIsHHh90AajZqyfa/HONFpuN+uGguytYx6oxRQ
 4yST5anZBnbUB+kGaJrLXOreynCOtQT+mkby6rkTWj5kJiksK1u/4NFYdilaI/R6BRer
 h0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714689227; x=1715294027;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OuymcIiJPiemZlanqz0KZDKUioJ+R0OZ4+MGq8AhvEg=;
 b=AWjhWnz1VLRY4Xcu3T8NKSq1/wTrLLkSlKpZMYABCYt1k/GjfI3DVCzufcH4bov2TA
 zWc8MpyX8v+7m0vuCCdTzwDtaLD4F+2hCPvvfSRYAZMYzjngeenjC5I1RcK+wMk1ioWw
 9Sco3zg+Ljc14//jB0RI4hw55OtZKN0O0nmYRebMy8aL78LsBpZgDOgyEPIuZVQrlC++
 7SeY5KjVgAGg4y+8AtzmATGQSmksfDy4BL8vUtFgJYCbOsKUje+uUcf/dE5B6tJ7Y+5g
 yUOc7DOThiUEQ2tOcKgm0BguezuyVNDe9bbiXeDA3oOPA5lBcMfwAqsLw3YWQKezs/jK
 pUcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM8nNwFeeX7T9kXJrnO7ryM4j1VgvwfMW6L0FEJLk4TBDb+YWaHH2oa3fGoddB0T8w4Qxl+D0p7TkV8RMSTVWxMml2ixBKTIKGprNB+lagF7SW/wYPiFK1
X-Gm-Message-State: AOJu0YyK78WPSG69EBYZMTxZpqghrZb4Hk3zkwq3DhtiOEvxeyBk04JV
 pJ7L3xezqOl1WhZ7p7/eutiYluKdFu+MFyFPXb4TAclncnCeVAYx
X-Google-Smtp-Source: AGHT+IGbFfFzXlP47A82vaBo8QSPa7wJ1Xkts6SMGSKXY0Bak5fwBUFDwrThIgMWZJyGR0yaLaiBOQ==
X-Received: by 2002:ac2:4d97:0:b0:519:2c84:2405 with SMTP id
 g23-20020ac24d97000000b005192c842405mr643387lfe.44.1714689226346; 
 Thu, 02 May 2024 15:33:46 -0700 (PDT)
Received: from mobilestation ([95.79.182.53]) by smtp.gmail.com with ESMTPSA id
 y13-20020a19914d000000b0051b59171ba9sm327335lfj.96.2024.05.02.15.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 15:33:45 -0700 (PDT)
Date: Fri, 3 May 2024 01:33:43 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <4wdcmcb2yxneynxtppestl6cp25z5xge3hfv7o47bxwpafn4cg@mtvc3ls2cxij>
References: <20240430-rzn1-gmac1-v5-0-62f65a84f418@bootlin.com>
 <20240430-rzn1-gmac1-v5-2-62f65a84f418@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240430-rzn1-gmac1-v5-2-62f65a84f418@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/7] net: stmmac: Add
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

On Tue, Apr 30, 2024 at 09:29:42AM +0200, Romain Gantois wrote:
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
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 12 +++++++++---
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index dddcaa9220cc3..7e0d727ed795b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -361,6 +361,7 @@ int stmmac_mdio_unregister(struct net_device *ndev);
>  int stmmac_mdio_register(struct net_device *ndev);
>  int stmmac_mdio_reset(struct mii_bus *mii);
>  int stmmac_xpcs_setup(struct mii_bus *mii);
> +void stmmac_pcs_clean(struct stmmac_priv *priv);
>  void stmmac_set_ethtool_ops(struct net_device *netdev);
>  
>  int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 59bf83904b62d..2a55c5d07f6b8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7789,8 +7789,9 @@ int stmmac_dvr_probe(struct device *device,
>  
>  error_netdev_register:
>  	phylink_destroy(priv->phylink);
> -error_xpcs_setup:
>  error_phy_setup:
> +	stmmac_pcs_clean(priv);
> +error_xpcs_setup:
>  	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
> @@ -7832,6 +7833,9 @@ void stmmac_dvr_remove(struct device *dev)
>  	if (priv->plat->stmmac_rst)
>  		reset_control_assert(priv->plat->stmmac_rst);
>  	reset_control_assert(priv->plat->stmmac_ahb_rst);
> +
> +	stmmac_pcs_clean(priv);
> +
>  	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 0542cfd1817e6..508bd39cbe2b3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -523,6 +523,15 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
>  	return 0;
>  }
>  

> +void stmmac_pcs_clean(struct stmmac_priv *priv)

Ideally it would have been great to have the entire driver fixed to
accept the stmmac_priv pointer as the functions argument. But this
would be too tiresome. Anyway seeing the PCS-setup protagonist method
has the net_device pointer passed I would implement the same prototype
for the antagonist even though it would require an additional local
variable. That will make the MDIO and PCS local interface-functions
looking alike and as if unified. That is the reason of why I made
stmmac_xpcs_clean() accepting the net_device pointer. 

Alternatively both stmmac_pcs_setup() and stmmac_pcs_clean() could be
converted to just accepting a pointer to the stmmac_priv instance.

-Serge(y)

> +{
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
> @@ -679,9 +688,6 @@ int stmmac_mdio_unregister(struct net_device *ndev)
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
