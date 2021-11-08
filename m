Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5614498B3
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Nov 2021 16:45:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D13FC5E2D5;
	Mon,  8 Nov 2021 15:45:58 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 113EAC5A4F3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Nov 2021 15:45:57 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id w1so64628601edd.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Nov 2021 07:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PVza8bc+buwzI929X8sHOlCTGiVgpXXZXYwI8Fybjx0=;
 b=phVki65L5hxv+xQOyJZrMNRFTbKH8OSIgDhhxuQwrxszhIsMEYK2tLOpFd6UvSQPhZ
 tzin2L3SCtV4nnTmGGJee1cW3YYxd2bTzWjqD9czUAc0h44JLEhAKGuwEmZB6EaBSfJo
 aZRUcsFCRMxgBKkmcuGfNo0wHG/5hbZG8j/GZ5Tae7vFKszVoaG7AF0a3LjEmzjYOhZ0
 RYXNe9hex9CxKhRjDVTeUKxGdC5eJBSheHLCJWgEsbiPt9X4UqRvrzxeKDoDoGtHx53u
 STkv5P52gd9jJpYVeCz1rbzirDzJU4brHGIaFJT8ndihadb6Y6Bk5i8AK3cinOYPniap
 Y/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PVza8bc+buwzI929X8sHOlCTGiVgpXXZXYwI8Fybjx0=;
 b=Ea5fZyBSDWPSmQV6GSmkvrrtRyoOMVVeGCI9pE4z4fd1abN8NNqRUREhSAln5/Ad/t
 qdWwxZ2/3ET/zVhqH/4wbRR40hhvAvjjf7S83c/fXboQj9o03CvrXvGcWipdSoQrV9tb
 vbmHNOzkR9xzzIKiw6udKdHlrXOWwJSrtrheVqkQvHGkRu01nzum3OQTHuETIngJjhmv
 WLiIQJPv/YnVcbJawnaWaudvVt2fJfEV1CUQiNf3mVpZ0h2ZLwoKpuPPKM8GDKFZUtIZ
 SNYiNLHIAiUshuOHZf02RwcXWquDs2jk5OWoGHSJJKxC7Tf21QWA63bCs752ooEZcrRb
 zliA==
X-Gm-Message-State: AOAM531Jb/k5dxlIIRY4+3JbSjtdYk4e6OC3O4qKYJ0vHBJCWbYHKI8a
 nWSW4pI7WE25TPdjrjLYzP8=
X-Google-Smtp-Source: ABdhPJwJmcAuxFWPTO6M9QJsOkA9H+B2EKW7FArIW5Jx9cV/hYP96PeZTzf5PPn+RN4BVA5Gqqtdvg==
X-Received: by 2002:a17:907:3f18:: with SMTP id
 hq24mr302251ejc.506.1636386356512; 
 Mon, 08 Nov 2021 07:45:56 -0800 (PST)
Received: from skbuf ([188.25.175.102])
 by smtp.gmail.com with ESMTPSA id f7sm9536865edl.33.2021.11.08.07.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 07:45:56 -0800 (PST)
Date: Mon, 8 Nov 2021 17:45:54 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <20211108154554.axd2lmm2a3gw6vfu@skbuf>
References: <20210305054930.7434-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305054930.7434-1-boon.leong.ong@intel.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Fix VLAN filter
 delete timeout issue in Intel mGBE SGMII
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

On Fri, Mar 05, 2021 at 01:49:30PM +0800, Ong Boon Leong wrote:
> For Intel mGbE controller, MAC VLAN filter delete operation will time-out
> if serdes power-down sequence happened first during driver remove() with
> below message.
> 
> [82294.764958] intel-eth-pci 0000:00:1e.4 eth2: stmmac_dvr_remove: removing driver
> [82294.778677] intel-eth-pci 0000:00:1e.4 eth2: Timeout accessing MAC_VLAN_Tag_Filter
> [82294.779997] intel-eth-pci 0000:00:1e.4 eth2: failed to kill vid 0081/0
> [82294.947053] intel-eth-pci 0000:00:1d.2 eth1: stmmac_dvr_remove: removing driver
> [82295.002091] intel-eth-pci 0000:00:1d.1 eth0: stmmac_dvr_remove: removing driver
> 
> Therefore, we delay the serdes power-down to be after unregister_netdev()
> which triggers the VLAN filter delete.
> 
> Fixes: b9663b7ca6ff ("net: stmmac: Enable SERDES power up/down sequence")
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 0eba44e9c1f8..208cae344ffa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5249,13 +5249,16 @@ int stmmac_dvr_remove(struct device *dev)
>  	netdev_info(priv->dev, "%s: removing driver", __func__);
>  
>  	stmmac_stop_all_dma(priv);
> +	stmmac_mac_set(priv, priv->ioaddr, false);
> +	netif_carrier_off(ndev);
> +	unregister_netdev(ndev);
>  
> +	/* Serdes power down needs to happen after VLAN filter
> +	 * is deleted that is triggered by unregister_netdev().
> +	 */
>  	if (priv->plat->serdes_powerdown)
>  		priv->plat->serdes_powerdown(ndev, priv->plat->bsp_priv);
>  
> -	stmmac_mac_set(priv, priv->ioaddr, false);
> -	netif_carrier_off(ndev);
> -	unregister_netdev(ndev);
>  #ifdef CONFIG_DEBUG_FS
>  	stmmac_exit_fs(ndev);
>  #endif
> -- 
> 2.17.0
> 

Don't you also want to fix the probe path?

stmmac_dvr_probe:
	ret = register_netdev(ndev);
	if (ret) {
		dev_err(priv->device, "%s: ERROR %i registering the device\n",
			__func__, ret);
		goto error_netdev_register;
	}

	if (priv->plat->serdes_powerup) {
		ret = priv->plat->serdes_powerup(ndev,
						 priv->plat->bsp_priv);

		if (ret < 0)
			goto error_serdes_powerup;
	}

Since the device can start being used immediately after registration, it
depends upon the SERDES clock being powered up.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
