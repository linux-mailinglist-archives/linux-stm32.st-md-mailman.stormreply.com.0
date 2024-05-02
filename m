Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F7B8BA354
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 00:35:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5B27C712A0;
	Thu,  2 May 2024 22:35:35 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE643C7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2024 22:35:28 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51f174e316eso1493451e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2024 15:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714689328; x=1715294128;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DvheITl3IOmOnUb9pD5ukdBgjTFDZhV45ZiqqHS1lC8=;
 b=k3TvtDI0Ae42fljUGEFG9GwGDBKuI5uGoEaNr4+IqFU77RGQHK/ZitmLx1PWwDFi5D
 uoaBY3KDF0D7mZ7IhdUJnOlzYhTsyCzKn9Oib6A3D/BEK9E+CZzFUsbBZo6Ng+N+UdTm
 u1X26NBWaUKt/H+gphxkvrMTowBGsC85/G1toNHFHB1zQ4GVSJu/PoFJPr9nJxwgJpq/
 vXLiK0d+mBnQf6zdBFeaBC0J6S/c3BghixNhGrokDkefscUnNHjNbgrnjS8wjeoizQ6B
 xoNyYG4Lmxa1TrMUkA+LLwAQ1dX6/gP3y6MoL/yaDw+J7bGuNgql8irc3XP75x0yOKB/
 R2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714689328; x=1715294128;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DvheITl3IOmOnUb9pD5ukdBgjTFDZhV45ZiqqHS1lC8=;
 b=bX9EsoO5z+AXJFk7Fzz/GWjcApZQ8urTKLPK3iNuw9gfPrvBkPQMdCqFPKBdHt1TON
 pWNKu1V+Ju9IdupY1ILX93ElrKDmWezQnWOJloyld8o04Bvw6jCK+5doOj3xd6tYJv/w
 j4CrqaZy3w7Kkw3XESlVtuiMrY0wCxmuz9VVsNvUDGY9pIXaCxQ+hIwBbyKZpCnIiRVI
 U0ABYMUUqcONGHARJEwwf/2n7dIc/fW1+aSgJL4hMxRPyDAVm367dFpWVNPeAA78fMrn
 eGTKd3SJlFC/LeLr6pdd0pPew8586uQwxmY7MLgHSyahmpgCN8km4A5cJYJvCq0CMJwM
 h48Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBVoSmSZlsl+2M1+IxYkP/D7A9Sl4A5oVABbQXzvcPI40cItBZssbEacdm7g4Ch+tzVJPSIdC1kqjLSKprY7eVTTiasu1iN5rKT9P9UQ6eLShZbMAxefq6
X-Gm-Message-State: AOJu0YzgY+ZMq4k6b6K4217m8r8JrWdi1wNQ8ix0n9jJ3SNr9USjLq6+
 ub1dnRIFaxRCRu/1oKhqK1zi9RbnO2oR28Qx+K7BTXkRLI5MN5Hv
X-Google-Smtp-Source: AGHT+IE+RRNfYrBA3kuTddhvlt5WggN/PhqusvrPB/Y3CSAEVYjC9nt3P4uZkm4BFPRlh+f+nPyCNQ==
X-Received: by 2002:a05:6512:4886:b0:51f:6132:2803 with SMTP id
 eq6-20020a056512488600b0051f61322803mr604261lfb.17.1714689327994; 
 Thu, 02 May 2024 15:35:27 -0700 (PDT)
Received: from mobilestation ([95.79.182.53]) by smtp.gmail.com with ESMTPSA id
 bi5-20020a0565120e8500b0051cb300265dsm320741lfb.109.2024.05.02.15.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 15:35:27 -0700 (PDT)
Date: Fri, 3 May 2024 01:35:25 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <jdqitzxy7lymkn2mizkvvycttxb4prxhevoqhwsatikceja5ph@sor2bnlaopre>
References: <20240430-rzn1-gmac1-v5-0-62f65a84f418@bootlin.com>
 <20240430-rzn1-gmac1-v5-4-62f65a84f418@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240430-rzn1-gmac1-v5-4-62f65a84f418@bootlin.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v5 4/7] net: stmmac: introduce
 pcs_init/pcs_exit stmmac operations
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

On Tue, Apr 30, 2024 at 09:29:44AM +0200, Romain Gantois wrote:
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Introduce a mechanism whereby platforms can create their PCS instances
> prior to the network device being published to userspace, but after
> some of the core stmmac initialisation has been completed. This means
> that the data structures that platforms need will be available.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 8 +++++++-
>  include/linux/stmmac.h                            | 2 ++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index af8ad9768da10..1c788caea0cfb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -505,7 +505,10 @@ int stmmac_pcs_setup(struct net_device *ndev)
>  	priv = netdev_priv(ndev);
>  	mode = priv->plat->phy_interface;
>  
> -	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
> +	if (priv->plat->pcs_init) {
> +		ret = priv->plat->pcs_init(priv);
> +	} else if (priv->plat->mdio_bus_data &&
> +		   priv->plat->mdio_bus_data->has_xpcs) {
>  		/* Try to probe the XPCS by scanning all addresses */
>  		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
>  			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
> @@ -531,6 +534,9 @@ int stmmac_pcs_setup(struct net_device *ndev)
>  
>  void stmmac_pcs_clean(struct stmmac_priv *priv)
>  {
> +	if (priv->plat->pcs_exit)
> +		priv->plat->pcs_exit(priv);
> +
>  	if (!priv->hw->xpcs)
>  		return;
>  
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index dfa1828cd756a..4a24a246c617d 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -285,6 +285,8 @@ struct plat_stmmacenet_data {
>  	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
>  			   void *ctx);
>  	void (*dump_debug_regs)(void *priv);
> +	int (*pcs_init)(struct stmmac_priv *priv);
> +	void (*pcs_exit)(struct stmmac_priv *priv);
>  	void *bsp_priv;
>  	struct clk *stmmac_clk;
>  	struct clk *pclk;
> 
> -- 
> 2.44.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
