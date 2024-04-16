Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C79968A6CA9
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 15:41:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F185C6B45B;
	Tue, 16 Apr 2024 13:41:38 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DEBCC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 13:41:36 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2da888330b1so34107841fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713274896; x=1713879696;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nItft6gjoHuRS9giH3fTnlakGsKJ/3yHC4ii5RtOabA=;
 b=FSf5CGvHZP+2GEBR0KfQPd3uB3x/ny/qvskr+iBlJGzNO9TCjjqGO6/UPTX2LufHOA
 Ku38vC4O6QyhvDXDi7bfSKkvFjMIRaUy+rYdLncJzhAPUtLFfU+4pKtJr35q9pAX9sAI
 Cd3JtuR8Y9f0pghKMdQUZyAqdt2HOS9H8oehJA1z5tjU8/2mZQaPmFznN8ywbEWDr7kD
 CFO61Ht/lg7ejbLNotGLZfWMjTPBnuyCY0NjU/Lsdfvp56MlbF0Be2GVfbSoSEAEoUli
 47rpfFUoa0nixOnS/jE09ICuRXCkXzJxZK8ChxmrCZadtvlcoxAN9QCT7syE5891p+0z
 VGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713274896; x=1713879696;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nItft6gjoHuRS9giH3fTnlakGsKJ/3yHC4ii5RtOabA=;
 b=uZFDMP2B/ZytUj3I9RfbKNqg342hq55ek5D75zfs4TxUmXgIdLsCIFYw+7NwXMewdG
 MDTNHyoL2SynaHdjoT9niEjmsI8TfpUUFNwgkXF2cDlSCebYoXpjgFU/qiotYjjaz1qh
 0RH+BFJ2NK+QcyUmynpRBH6eklE0sb5UZsEdjnvBmzogHdDfYZB8beON9JiIXINsHy2i
 50ci6mYCL5GOT3MEbbd+ir6R9XvCnM2lk9UfADp4q6Xn8Y2oF7YDc6O7gfr3k7vnowbZ
 AlFASKexb51mDTK+05wE/FWHcp5e356SE9qe78FyJb9CvPYPbzjH7OxkzXHAiH0rgI2F
 ZTgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1Y/bosmRXpnvXBu1krCjR/GGDAVlOjjbUDnqkYsWvFzpEW8xT8r12mPDV6+JIYugLLkKd+bhGXGFyRj5Dy9k7L7B4XHmYzwhYv+yb6Fc4TPwsH2ozd3Tq
X-Gm-Message-State: AOJu0YwyQ8YIFoWVEoqlWbR4okex7ZZMaugBkKCnnKgrbW0Y+FaTNli8
 m0MR4ZUZnnbuxYKYxZG0qdua4dMU2866o8eKXUs/IDCXYuCHFr16
X-Google-Smtp-Source: AGHT+IGy2KUFbhI6AaWFOmsemnnvP81uRkcNjM8jwXDSPhTQ3CP4mbDjx7oSLqi6TS3lljjR2AgDcg==
X-Received: by 2002:a05:651c:620:b0:2d9:f68a:d82c with SMTP id
 k32-20020a05651c062000b002d9f68ad82cmr7690751lje.41.1713274895863; 
 Tue, 16 Apr 2024 06:41:35 -0700 (PDT)
Received: from mobilestation (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a05651c105500b002d893f9fc22sm1556573ljm.57.2024.04.16.06.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 06:41:35 -0700 (PDT)
Date: Tue, 16 Apr 2024 16:41:33 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <42chuecdt7dpgm6fcrtt2crifvv5hflmtnmdrw5fvk3r7pwjgu@hlcv56dbeosf>
References: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
 <20240415-rzn1-gmac1-v3-2-ab12f2c4401d@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415-rzn1-gmac1-v3-2-ab12f2c4401d@bootlin.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/5] net: stmmac: introduce
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

Hi Romain, Russell

On Mon, Apr 15, 2024 at 11:18:42AM +0200, Romain Gantois wrote:
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Introduce a mechanism whereby platforms can create their PCS instances
> prior to the network device being published to userspace, but after
> some of the core stmmac initialisation has been completed. This means
> that the data structures that platforms need will be available.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 ++++++++++++++
>  include/linux/stmmac.h                            |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index fe3498e86de9d..25fa33ae7017b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7208,6 +7208,12 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>  	if (ret)
>  		return ret;
>  
> +	if (priv->plat->pcs_init) {
> +		ret = priv->plat->pcs_init(priv, priv->hw);
> +		if (ret)
> +			return ret;
> +	}
> +

I am currently working on my Memory-mapped DW XPCS patchset cooking:
https://lore.kernel.org/netdev/20231205103559.9605-1-fancer.lancer@gmail.com/
The changes in this series seems to intersect to what is/will be
introduced in my patchset. In particular as before I am going to
use the "pcs-handle" property for getting the XPCS node. If so what
about collecting PCS-related things in a single place. Like this:

int stmmac_xpcs_setup(struct net_device *ndev)
{
	...

	if (priv->plat->pcs_init) {
		return priv->plat->pcs_init(priv); /* Romain' part */
	} else if (fwnode_property_present(priv->plat->port_node, "pcs-handle")) {
		/* My DW XPCS part */
	} else if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
		/* Currently implemented procedure */
	}

	...
}

void stmmac_xpcs_clean(struct net_device *ndev)
{
	...

	if (priv->plat->pcs_exit) {
		priv->plat->pcs_exit(priv);
		return;

	}

	xpcs_destroy(priv->hw->xpcs);
	priv->hw->xpcs = NULL;
}

Please see the last two patches in my series:
https://lore.kernel.org/netdev/20231205103559.9605-16-fancer.lancer@gmail.com/
https://lore.kernel.org/netdev/20231205103559.9605-17-fancer.lancer@gmail.com/
as a reference of how the changes could be provided.

-Serge(y)

>  	/* Get the HW capability (new GMAC newer than 3.50a) */
>  	priv->hw_cap_support = stmmac_get_hw_features(priv);
>  	if (priv->hw_cap_support) {
> @@ -7290,6 +7296,12 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>  	return 0;
>  }
>  
> +static void stmmac_hw_exit(struct stmmac_priv *priv)
> +{
> +	if (priv->plat->pcs_exit)
> +		priv->plat->pcs_exit(priv, priv->hw);
> +}
> +
>  static void stmmac_napi_add(struct net_device *dev)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
> @@ -7804,6 +7816,7 @@ int stmmac_dvr_probe(struct device *device,
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
>  error_mdio_register:
> +	stmmac_hw_exit(priv);
>  	stmmac_napi_del(ndev);
>  error_hw_init:
>  	destroy_workqueue(priv->wq);
> @@ -7844,6 +7857,7 @@ void stmmac_dvr_remove(struct device *dev)
>  	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
> +	stmmac_hw_exit(priv);
>  	destroy_workqueue(priv->wq);
>  	mutex_destroy(&priv->lock);
>  	bitmap_free(priv->af_xdp_zc_qps);
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index dfa1828cd756a..941fde506e514 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -285,6 +285,8 @@ struct plat_stmmacenet_data {
>  	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
>  			   void *ctx);
>  	void (*dump_debug_regs)(void *priv);
> +	int (*pcs_init)(struct stmmac_priv *priv, struct mac_device_info *hw);
> +	void (*pcs_exit)(struct stmmac_priv *priv, struct mac_device_info *hw);
>  	void *bsp_priv;
>  	struct clk *stmmac_clk;
>  	struct clk *pclk;
> 
> -- 
> 2.44.0
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
