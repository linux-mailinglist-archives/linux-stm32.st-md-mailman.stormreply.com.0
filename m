Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 944357896EB
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Aug 2023 15:36:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5402CC6B44F;
	Sat, 26 Aug 2023 13:36:51 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5626FC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Aug 2023 13:36:50 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-4ff8cf11b90so2830289e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Aug 2023 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693057009; x=1693661809;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6VkMa5W6uY3fSZYkhCX3GMktDqjJzGb0eTy0nnjALzA=;
 b=VUfosENc6y/n5gCCAAAV0zZo9DYMBol7CZSu70vmZ8hUuszuGjKhgjIZCU3gtz1iTv
 FkO531+MIkQf60yH9909064vmM6yWSrvW3nCxwbiGGViKxnwg3fiIU0oQq/t6wHEVS/K
 5sS0xpIrNmYc1DGhp9K4Iq6EqLKKwwJEFIWno6iZv9/iOqfZZJZCw3Tv5T9R7l9EReWD
 E5K5mlAS7ZNVpWRcyqxl094bjusJa6PeYZH8WN+DveFayodNCFeUW3kWAZXMII9HMY9o
 Aa1i/Ki6lxWyGRg6AI98e16s7EJa1lvek+iSRGz/wfElDGOAKazfFOh1HSDuJbz9r3s4
 uNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693057009; x=1693661809;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VkMa5W6uY3fSZYkhCX3GMktDqjJzGb0eTy0nnjALzA=;
 b=PiN8O6CwmOst2sNZNk9xpYdflMCILpVWqcMOf9UV20F56DZtA/vWfOa5abn2Jq79fQ
 yYOopRrFY3Z0UfSB1BKofJJtiVNWqTijse1IXfP5MlseEUVSzB1OOc5cVqCOO22IDyqL
 Dkv1yZy42LJ0iDsw9bFwfOgjYcdfUUqFHAlathqnvLlpjD7HR4KZA0tWSR2ET1FeF+Vf
 DAI+BbhUUFbD/4TvvO0ha73Morr+hRH6FJRlz30Hne2WSzm1iyuF3jrE3t4OPxmF7Bpi
 hXvCuDzaiybLJxvqd+oSlLJZ5Y1t8AWbJtMB3dap9mm5ZqWEv7WoOTqtbh7jeauQpawN
 oshA==
X-Gm-Message-State: AOJu0Yy2Z9eQBgT21lP7Y+ZfkESo/deHdCpCykDrwPOqNKWbf+2vDCpH
 eCoMIdBmMFPIp0P0LGk4HGE=
X-Google-Smtp-Source: AGHT+IECrT/f4YU7eGYMT2JKLqncJPJWUk/GN3HdGnXoaiZGZEg51ifpGDI4TjkBwNtKbaT99ZyWtw==
X-Received: by 2002:a05:6512:b22:b0:4fe:df2:b82d with SMTP id
 w34-20020a0565120b2200b004fe0df2b82dmr15910554lfu.37.1693057009281; 
 Sat, 26 Aug 2023 06:36:49 -0700 (PDT)
Received: from mobilestation ([95.79.200.178])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac24143000000b004ff8631d6c0sm709430lfi.278.2023.08.26.06.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 06:36:48 -0700 (PDT)
Date: Sat, 26 Aug 2023 16:36:46 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <m6wo7hsk2wy2sgwjxlj37u5zg3iba7ecgjrvmhvkw7kdm7o6j7@ggcag6ziyk4c>
References: <ZOddFH22PWmOmbT5@shell.armlinux.org.uk>
 <E1qZAXd-005pUP-JL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qZAXd-005pUP-JL@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 08/10] net: stmmac: move xgmac
 specific phylink caps to dwxgmac2 core
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

On Thu, Aug 24, 2023 at 02:38:29PM +0100, Russell King (Oracle) wrote:
> Move the xgmac specific phylink capabilities to the dwxgmac2 support
> core.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 10 ++++++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 10 ----------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 34e1b0c3f346..f352be269deb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -47,6 +47,14 @@ static void dwxgmac2_core_init(struct mac_device_info *hw,
>  	writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);
>  }
>  

> +static void xgmac_phylink_get_caps(struct stmmac_priv *priv)

Also after splitting this method up into DW XGMAC v2.x and DW XLGMAC
v2.x specific functions please preserve the local naming convention:
use dwxgmac2_ and dwxlgmac2_ prefixes.

-Serge(y)

> +{
> +	priv->phylink_config.mac_capabilities |= MAC_2500FD | MAC_5000FD |
> +						 MAC_10000FD | MAC_25000FD |
> +						 MAC_40000FD | MAC_50000FD |
> +						 MAC_100000FD;
> +}
> +
>  static void dwxgmac2_set_mac(void __iomem *ioaddr, bool enable)
>  {
>  	u32 tx = readl(ioaddr + XGMAC_TX_CONFIG);
> @@ -1490,6 +1498,7 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr, u32 num_txq,
>  
>  const struct stmmac_ops dwxgmac210_ops = {
>  	.core_init = dwxgmac2_core_init,
> +	.phylink_get_caps = xgmac_phylink_get_caps,
>  	.set_mac = dwxgmac2_set_mac,
>  	.rx_ipc = dwxgmac2_rx_ipc,
>  	.rx_queue_enable = dwxgmac2_rx_queue_enable,
> @@ -1551,6 +1560,7 @@ static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
>  
>  const struct stmmac_ops dwxlgmac2_ops = {
>  	.core_init = dwxgmac2_core_init,
> +	.phylink_get_caps = xgmac_phylink_get_caps,
>  	.set_mac = dwxgmac2_set_mac,
>  	.rx_ipc = dwxgmac2_rx_ipc,
>  	.rx_queue_enable = dwxlgmac2_rx_queue_enable,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 0b02845e7e9d..5cf8304564c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1227,16 +1227,6 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
>  	/* Get the MAC specific capabilities */
>  	stmmac_mac_phylink_get_caps(priv);
>  
> -	if (priv->plat->has_xgmac) {
> -		priv->phylink_config.mac_capabilities |= MAC_2500FD;
> -		priv->phylink_config.mac_capabilities |= MAC_5000FD;
> -		priv->phylink_config.mac_capabilities |= MAC_10000FD;
> -		priv->phylink_config.mac_capabilities |= MAC_25000FD;
> -		priv->phylink_config.mac_capabilities |= MAC_40000FD;
> -		priv->phylink_config.mac_capabilities |= MAC_50000FD;
> -		priv->phylink_config.mac_capabilities |= MAC_100000FD;
> -	}
> -
>  	/* Half-Duplex can only work with single queue */
>  	if (priv->plat->tx_queues_to_use > 1)
>  		priv->phylink_config.mac_capabilities &=
> -- 
> 2.30.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
