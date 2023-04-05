Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6266C6D7974
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 12:18:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09411C6A610;
	Wed,  5 Apr 2023 10:18:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EDD4C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yJ16+cUT0D7ZVTErfZwxzpUUZnFQ1yqnqpQx3pT2yuE=; b=xNXdVbtPEQ7P54mUHFZ1T4HKNB
 ukQx0seAcml+qIAsJ2sLzXRsiPchyuM64rLCzMlXxHsQDJRIubi+34vv2ToTtIK3iZ/ATyjSda7nf
 Oi2DuJUcczk+WMWnVT2qwWkyJD3QAXEK2xlyRuNt22/NHyFnwsMVRkYyGSyMIgd9gNQ3W/xQFbSBS
 04x9A54r2+piVmdAQxWvxOwSDHWjBFCypmkT7M8k2rGFTEQ/rckQKkDwrzYNKZxeF8zX3o/ab0/Lg
 g2z8YmB1ZKNG43Y+0bFl7O0drdS8B3229jr1dcUD+kvN3Fd9mJ+V2VRBvVKwteoplvcd9FyB1jD+u
 UQlBk+rA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56198)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pk0Db-0005KI-EB; Wed, 05 Apr 2023 11:18:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pk0DW-0006DJ-CA; Wed, 05 Apr 2023 11:18:14 +0100
Date: Wed, 5 Apr 2023 11:18:14 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Message-ID: <ZC1K5mLAkkO7bjA4@shell.armlinux.org.uk>
References: <20230405093945.3549491-1-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405093945.3549491-1-michael.wei.hong.sit@intel.com>
Cc: andrew@lunn.ch, Voon Weifeng <weifeng.voon@intel.com>,
 Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Eric Dumazet <edumazet@google.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, hock.leong.kweh@intel.com,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Zulkifli Muhammad Husaini <muhammad.husaini.zulkifli@intel.com>,
 "David S . Miller" <davem@davemloft.net>, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: check fwnode for phy
 device before scanning for phy
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

On Wed, Apr 05, 2023 at 05:39:45PM +0800, Michael Sit Wei Hong wrote:
> Some DT devices already have phy device configured in the DT/ACPI.
> Current implementation scans for a phy unconditionally even though
> there is a phy listed in the DT/ACPI and already attached.
> 
> We should check the fwnode if there is any phy device listed in
> fwnode and decide whether to scan for a phy to attach to.y
> 
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

> Fixes: fe2cfbc96803 ("net: stmmac: check if MAC needs to attach to a PHY")
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d41a5f92aee7..7ca9be7bec06 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1134,22 +1134,26 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
>  static int stmmac_init_phy(struct net_device *dev)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
> +	struct fwnode_handle *phy_fwnode;
>  	struct fwnode_handle *fwnode;
> -	bool phy_needed;
>  	int ret;
>  
> +	if (!phylink_expects_phy(priv->phylink))
> +		return 0;
> +
>  	fwnode = of_fwnode_handle(priv->plat->phylink_node);
>  	if (!fwnode)
>  		fwnode = dev_fwnode(priv->device);
>  
>  	if (fwnode)
> -		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
> +		phy_fwnode = fwnode_get_phy_node(fwnode);
> +	else
> +		phy_fwnode = NULL;
>  
> -	phy_needed = phylink_expects_phy(priv->phylink);
>  	/* Some DT bindings do not set-up the PHY handle. Let's try to
>  	 * manually parse it
>  	 */
> -	if (!fwnode || phy_needed || ret) {
> +	if (!phy_fwnode || IS_ERR(phy_fwnode)) {
>  		int addr = priv->plat->phy_addr;
>  		struct phy_device *phydev;
>  
> @@ -1165,6 +1169,9 @@ static int stmmac_init_phy(struct net_device *dev)
>  		}
>  
>  		ret = phylink_connect_phy(priv->phylink, phydev);
> +	} else {
> +		fwnode_handle_put(phy_fwnode);
> +		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
>  	}
>  
>  	if (!priv->plat->pmt) {

LGTM, thanks for taking on board my suggestion.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
