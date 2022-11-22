Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 284216343C0
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 19:40:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6047C6504B;
	Tue, 22 Nov 2022 18:40:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63807C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 18:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8fcpg5DnZdCFHGZ1fkTjCjZIX2J0omCQ8g6dw5X6py0=; b=vCIkijpRcSDaxYKRDYdsqz+JNT
 j7BPwPUT+gd6SRstLMRSTsz9rYh7nTS1fL/l/YnVrKKFV3c48PIKX8dRQyeC8VNpBUEp/liaYrd/f
 4LAhQnrKYJPrON/m1KerF3J8TxKJI2T+Ya4560/keXH/FqPXlZazgN7wQVMTpQiy4A6/8d+dItyXC
 On7dI76prGr8n0QMAUIHZJlYtSL+YyuozULnz8dGr/IdgXF7DKj7UT1EgcvF0HtYMSUsIlUe7caN9
 yvjIjuaFBOPkt/h73KzK6KEUXVy17NVP3P1+U3e0cRWLcahQwPEk65IXfUK0LFT4O+glsYycYUscF
 tVlySE6w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35390)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1oxYCC-0001u5-Bq; Tue, 22 Nov 2022 18:40:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1oxYC9-0003Wr-CJ; Tue, 22 Nov 2022 18:40:33 +0000
Date: Tue, 22 Nov 2022 18:40:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Goh, Wei Sheng" <wei.sheng.goh@intel.com>
Message-ID: <Y30XoUHXscGSMHaL@shell.armlinux.org.uk>
References: <20221122063935.6741-1-wei.sheng.goh@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221122063935.6741-1-wei.sheng.goh@intel.com>
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
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Set MAC's flow
 control register to reflect current settings
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

On Tue, Nov 22, 2022 at 02:39:35PM +0800, Goh, Wei Sheng wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> index c25bfecb4a2d..369db308b1dd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> @@ -748,6 +748,9 @@ static void dwmac4_flow_ctrl(struct mac_device_info *hw, unsigned int duplex,
>  	if (fc & FLOW_RX) {
>  		pr_debug("\tReceive Flow-Control ON\n");
>  		flow |= GMAC_RX_FLOW_CTRL_RFE;
> +	} else {
> +		pr_debug("\tReceive Flow-Control OFF\n");
> +		flow &= ~GMAC_RX_FLOW_CTRL_RFE;
>  	}
>  	writel(flow, ioaddr + GMAC_RX_FLOW_CTRL);

This doesn't look correct to me. The function starts off:

        unsigned int flow = 0;

flow is not written to before the context above. So, the code you've
added effectively does:

	flow = 0 & ~GMAC_RX_FLOW_CTRL_RFE;

which is still zero. So, I don't think this hunk is meaningful apart
from adding the pr_debug().

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
> +	else
> +		priv->flow_ctrl = FLOW_OFF;
> +
> +	stmmac_mac_flow_ctrl(priv, duplex);
>  
>  	if (ctrl != old_ctrl)
>  		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);

This looks like the true fix for correctly setting the flow control
depending on the phylink link_up() (which will contain the resuts of
pause negotiation, rate adaption or overriden by ethtool - but only
when operating in full duplex mode.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
