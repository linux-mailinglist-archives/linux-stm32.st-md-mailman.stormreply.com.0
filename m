Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5D462F36D
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Nov 2022 12:16:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75E29C65071;
	Fri, 18 Nov 2022 11:16:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28451C65052
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Nov 2022 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jCwiJcjbg7ZTiA+/f8xyS0h637tVnp9E3xI0ct+Ox54=; b=rdf+XtnYZnsMspk9kS+ZyEh0AS
 RGUkEV072p31F9GFMBGTOEe6ALTWGCIK0JuPu8PhAeIZYMrFcpz3qqdzROztEjXfNAYJRkb8eRWYT
 e22+XnXqBxBLbZoRze7we+h03xg21hlr+/NqlLOxV+Pa9c7DvOfTekCmZGtv7bWPCyrjT29aJmVg0
 QDnmZIG0yUbnvkZiHay1w8+4kEQWnpircZoR9Z6WUXU6VMSmBMRWGOAF9ySxbZo/6YdSYAAQxY1P1
 HCMUwICYV899eA97K58YX8q/NqeWF63YQcgk19VPhMWWxqjeGV+6tGOlZwwYTHahBOG/W+0sWxnvO
 OxOBw7Sg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35326)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ovzMG-0005cX-UB; Fri, 18 Nov 2022 11:16:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ovzMA-0007iy-Ra; Fri, 18 Nov 2022 11:16:26 +0000
Date: Fri, 18 Nov 2022 11:16:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Goh, Wei Sheng" <wei.sheng.goh@intel.com>
Message-ID: <Y3dpikbzUJAazMTD@shell.armlinux.org.uk>
References: <20221118072051.31313-1-wei.sheng.goh@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221118072051.31313-1-wei.sheng.goh@intel.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 Tan Tee Min <tee.min.tan@intel.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Ahmad Tarmizi Noor Azura <noor.azura.ahmad.tarmizi@intel.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Set MAC's flow control
 register to reflect current settings
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

On Fri, Nov 18, 2022 at 03:20:51PM +0800, Goh, Wei Sheng wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 8273e6a175c8..ab7f48f32f5b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1061,8 +1061,16 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  		ctrl |= priv->hw->link.duplex;
>  
>  	/* Flow Control operation */
> -	if (tx_pause && rx_pause)
> -		stmmac_mac_flow_ctrl(priv, duplex);
> +	if (rx_pause && tx_pause)
> +		priv->flow_ctrl = FLOW_AUTO;
> +	else if (rx_pause && !tx_pause)
> +		priv->flow_ctrl = FLOW_RX;
> +	else if (!rx_pause && tx_pause)
> +		priv->flow_ctrl = FLOW_TX;
> +	else if (!rx_pause && !tx_pause)
> +		priv->flow_ctrl = FLOW_OFF;

Since "if (!rx_pause && !tx_pause)" will always be true at this point,
you can eliminate this needless last condition, which will make the code
a little more readable.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
