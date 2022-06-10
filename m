Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10777545D80
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 09:31:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCCFCC5F1D5;
	Fri, 10 Jun 2022 07:31:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 632F5C5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 07:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ehVVnHGNeCX8STqn/z69kwtCQzGXB+Z+xZvMBLoGV0=; b=nL86lEnP25nxC0q/9AYMxQQufI
 6E/ykfudlRfKm08L712JdI5gUFi5e8MhHsIYXZTXLuCgSHiLOIVnU2UMZ3GmVzqrp+b6iYWNZSITi
 VIIAnTTc76krunIBP+857GXkdhzrTYli8RWzCawcAq03kmqK9/+ufu0rtGUHgiRUd08/FFhzHKFhB
 3wLcLvXPQBgnvpqBNmL0ES6RyzDY0likckmumfQkFQfvtfoc7raVC+LEiptPxKpWX+dvcVsOh8WCK
 k4JqWmVK85+TjN+2h5MXVNQ9fCcY1p8oegaj5QNE70O9O5EWpektE2M4RoydHDf3IRSEtTLHT+whk
 MtY2Hlkg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32814)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nzZ6x-0007EW-1V; Fri, 10 Jun 2022 08:31:15 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nzZ6s-0003V8-W6; Fri, 10 Jun 2022 08:31:11 +0100
Date: Fri, 10 Jun 2022 08:31:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <YqLzPrEfcwqeKNX0@shell.armlinux.org.uk>
References: <20220610032941.113690-1-boon.leong.ong@intel.com>
 <20220610032941.113690-5-boon.leong.ong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610032941.113690-5-boon.leong.ong@intel.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Emilio Riva <emilio.riva@ericsson.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vivien Didelot <vivien.didelot@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/6] net: phylink: unset
 ovr_an_inband if fixed-link is selected
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

On Fri, Jun 10, 2022 at 11:29:39AM +0800, Ong Boon Leong wrote:
> If "fixed-link" DT or ACPI _DSD subnode is selected, it should take
> precedence over the value of ovr_an_inband passed by MAC driver.
> 
> Fixes: ab39385021d1 ("net: phylink: make phylink_parse_mode() support non-DT platform")
> Tested-by: Emilio Riva <emilio.riva@ericsson.com>
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
> ---
>  drivers/net/phy/phylink.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 066684b8091..566852815e0 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -609,8 +609,10 @@ static int phylink_parse_mode(struct phylink *pl, struct fwnode_handle *fwnode)
>  	const char *managed;
>  
>  	dn = fwnode_get_named_child_node(fwnode, "fixed-link");
> -	if (dn || fwnode_property_present(fwnode, "fixed-link"))
> +	if (dn || fwnode_property_present(fwnode, "fixed-link")) {
>  		pl->cfg_link_an_mode = MLO_AN_FIXED;
> +		pl->config->ovr_an_inband = false;
> +	}

ovr_an_inband was added to support "non-DT" platforms, and the only
place it's set is stmmac. I don't see why you'd want a driver to always
set this member, and then have phylink clear it - the driver should be
setting it correctly itself, otherwise it becomes a "maybe override AN
inband if certain conditions are met" flag inside phylink.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
