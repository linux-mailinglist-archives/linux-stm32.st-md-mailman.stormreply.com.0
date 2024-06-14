Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D480390908D
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 18:38:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84D7FC6B460;
	Fri, 14 Jun 2024 16:38:53 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AC1CC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 16:38:46 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6b06f1f9a06so12096346d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718383125; x=1718987925;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1VgYK0cT1rtZcE4zC+Ip3HzrpvWS7pmA+aGN6P6P8vs=;
 b=kQ+5fniJBPJx9tIxLsqLJndl5yMoVWaAbxVIuqXzQRxjqOwmb/KmYHb4liGutEcM0P
 gALLsd6LOtDwUN9hNU1nIgdCTqiHfpPtMYNomjQk1QNyO345feDEjNfPCjBXD2LmCJCu
 YH3EsVtYtT4Qvsf2b7i3QqaJbC22PAms4mqSwhuB9GugczCA6+fnNp4sD+IJmw4ln48J
 e6KoVDT1lLeQYfGkWRD0Yu5kDuLJ5U8+u360QfC17fTrhO0Mo606/hDYYUvbI6CfqpRj
 KE1xPZb8qKpdzPpkxyyBsk/2PPXd6COrJXHXSAdc0YqXthEAmG5HvEgpCm918rGEM8JB
 zWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718383125; x=1718987925;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1VgYK0cT1rtZcE4zC+Ip3HzrpvWS7pmA+aGN6P6P8vs=;
 b=fywQ6h4wY6MyINopaJUPgBPYQv5kQWn/DNostbzwGtnpQcW2qMjsgIQYJiWh6kkHLJ
 SB0pYyppduT8jef4/CQekEt/GA3huJx48fsuhfhkEmNeY4y7Hm0DFZ9JRFWIIRfccdNc
 NO2nC+VRiu399p7Qr7XukFg3lIgZ5egVLmBDm+UlKhmB6ICYf7AhpREbMzhB+dyP1EIV
 cdVXubGSpAt8uCGMf+FsUAqhFIaqvYPzi0lI11BZrkqwe+/rnLCUzQQ8QJTnxVbBXXA9
 Is8L9W4354XM8qeVrr+Or/Tiyjz2vN1UpcqOC30VpbXksYQb1wNlGQaHjZSvMuB6lcpK
 lruQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3sZCBnCF29AloXQpCE09fGzVu7yOvTi4AgMyBaDVbSpTITwcl5m96OHUIyTi393tmFHV3pEUW6n01NXSrKazDdoZCrucwviHuibOTJoyiUr4lJF/i/L9u
X-Gm-Message-State: AOJu0YxDUvX4Yb9ytZD1Cl976ROL3DB2CSxXRefzoso9a5wayqXriauw
 DjuyE5lLISvYbqsOdsD3rxkv7TTRTRFSFLDw3vyiEwGAzmeR3MMrezI+H6su
X-Google-Smtp-Source: AGHT+IHqafr3Vnf+TWfjTdXJN6lGKMwNFYAnGXAKuDMdyJd/+pk6bm9GyX5kxb6EN7JL13WGpSePbg==
X-Received: by 2002:a05:6214:8e5:b0:6b0:63ab:b7ba with SMTP id
 6a1803df08f44-6b2afc936f5mr27299926d6.15.1718383125075; 
 Fri, 14 Jun 2024 09:38:45 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5efc4c1sm19901876d6.127.2024.06.14.09.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 09:38:44 -0700 (PDT)
Date: Fri, 14 Jun 2024 19:38:40 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <2xl2icmnhym4pzikivo6wqeyqny6ewrbqlfvsxrisykztdcaip@mp54uqtmrgyf>
References: <ZmrLbdwv6ALoy+gs@shell.armlinux.org.uk>
 <E1sHhoM-00Fesu-8E@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1sHhoM-00Fesu-8E@rmk-PC.armlinux.org.uk>
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/5] net: stmmac: add
 select_pcs() platform method
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

Hi Russell

On Thu, Jun 13, 2024 at 11:36:06AM +0100, Russell King (Oracle) wrote:
> Allow platform drivers to provide their logic to select an appropriate
> PCS.
> 
> Tested-by: Romain Gantois <romain.gantois@bootlin.com>
> Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++++
>  include/linux/stmmac.h                            | 4 +++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index bbedf2a8c60f..302aa4080de3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -949,6 +949,13 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
>  						 phy_interface_t interface)
>  {
>  	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
> +	struct phylink_pcs *pcs;
> +
> +	if (priv->plat->select_pcs) {
> +		pcs = priv->plat->select_pcs(priv, interface);
> +		if (!IS_ERR(pcs))
> +			return pcs;
> +	}
>  
>  	if (priv->hw->xpcs)
>  		return &priv->hw->xpcs->pcs;
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 8f0f156d50d3..9c54f82901a1 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -13,7 +13,7 @@
>  #define __STMMAC_PLATFORM_DATA
>  
>  #include <linux/platform_device.h>
> -#include <linux/phy.h>
> +#include <linux/phylink.h>
>  
>  #define MTL_MAX_RX_QUEUES	8
>  #define MTL_MAX_TX_QUEUES	8
> @@ -271,6 +271,8 @@ struct plat_stmmacenet_data {
>  	void (*dump_debug_regs)(void *priv);

>  	int (*pcs_init)(struct stmmac_priv *priv);
>  	void (*pcs_exit)(struct stmmac_priv *priv);
> +	struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,
> +					  phy_interface_t interface);

Just a small note/nitpick. We've got pcs_init() and pcs_exit()
callbacks. Both of them have the pcs_ prefix followed by the action
verb. What about using the same notation for the PCS-select method,
using the plat_stmmacenet_data::pcs_select() callback-name instead?

-Serge(y)

>  	void *bsp_priv;
>  	struct clk *stmmac_clk;
>  	struct clk *pclk;
> -- 
> 2.30.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
