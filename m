Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A719291C905
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Jun 2024 00:17:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59F15C71282;
	Fri, 28 Jun 2024 22:17:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14098CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 22:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FkeOeWfmA8N6WfXP0KBtOcijRi04NyPUZ7Dnot/6j3o=; b=hsjFH66D8g9+9dSOKNWklH9uAF
 YHXMKCxnAGWqimirw253jOOwZbhGZXu4SAPG1j2GtfIL4VYas6eNgesM7eayLd5ByzrFcpar7cCm/
 SO9HxlYCH2wwr22sMmdQ57Vy7pbmrtjnm8aBQGrGyAyvD4dlfxmYXdSl7mSE36TNOlGZuPaZfyBJc
 IbKx8njf8xWafxyFQpLbJwEO2MzbKK/jTiCi6cNiRb5y6MHOnKQcFoKRrPDQhLAzTVbdYOKGHvtUD
 JaR+QF3Km+/aElUekrbXOkSB70v0tV3ji2Svk0JGWK/rIVCdkzCOFq89rzLd1wCHGgTM9MyN44lWv
 zy2KYpDQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43110)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sNJtl-0007Yz-2e;
 Fri, 28 Jun 2024 23:16:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sNJtl-0006qf-Rf; Fri, 28 Jun 2024 23:16:53 +0100
Date: Fri, 28 Jun 2024 23:16:53 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <Zn82VaTQBe0LkhSa@shell.armlinux.org.uk>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-3-eaa7cf9060f0@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625-icc_bw_voting_from_ethqos-v2-3-eaa7cf9060f0@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] net: stmmac: Bring down the clocks
 to lower frequencies when mac link goes down
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

On Tue, Jun 25, 2024 at 04:49:30PM -0700, Sagar Cheluvegowda wrote:
> When mac link goes down we don't need to mainitain the clocks to operate
> at higher frequencies, as an optimized solution to save power when
> the link goes down we are trying to bring down the clocks to the
> frequencies corresponding to the lowest speed possible.

I thought I had already commented on a similar patch, but I can't find
anything in my mailboxes to suggest I had.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ec7c61ee44d4..f0166f0bc25f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -996,6 +996,9 @@ static void stmmac_mac_link_down(struct phylink_config *config,
>  {
>  	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
>  
> +	if (priv->plat->fix_mac_speed)
> +		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);
> +
>  	stmmac_mac_set(priv, priv->ioaddr, false);
>  	priv->eee_active = false;
>  	priv->tx_lpi_enabled = false;
> @@ -1004,6 +1007,11 @@ static void stmmac_mac_link_down(struct phylink_config *config,
>  
>  	if (priv->dma_cap.fpesel)
>  		stmmac_fpe_link_state_handle(priv, false);
> +
> +	stmmac_set_icc_bw(priv, SPEED_10);
> +
> +	if (priv->plat->fix_mac_speed)
> +		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);

Two things here:

1) Why do we need to call fix_mac_speed() at the start and end of this
   stmmac_mac_link_down()?

2) What if the MAC doesn't support 10M operation? For example, dwxgmac2
   and dwxlgmac2 do not support anything below 1G. It feels that this
   is storing up a problem for the future, where a platform that uses
   e.g. xlgmac2 also implements fix_mac_speed() and then gets a
   surprise when it's called with SPEED_10.

Personally, I don't like "fix_mac_speed", and I don't like it even more
with this change. I would prefer to see link_up/link_down style
operations so that platforms can do whatever they need to on those
events, rather than being told what to do by a single call that may
look identical irrespective of whether the link came up or went down.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
