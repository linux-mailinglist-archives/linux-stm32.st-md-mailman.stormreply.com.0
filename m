Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1069463B9
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 21:23:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CE3CC7129D;
	Fri,  2 Aug 2024 19:23:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C6A0C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 19:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4bmxVMwcC7El7dkuub8GoTScaOOhQldmD5XLu9UZMmo=; b=V5bTjSRzYRz9FuEfIMzCZKHn/i
 QfusxZXY+z2IYAkons/wyW9sPeUz/VNX61lejxEflqnirN9QF/XFyp2xXAqLaKdmPe9sIN4IeLBDP
 xUjpE1Moc65cC1Myz2zs9cySn5ncCT1lkGMifudtfB8+DymqZs5w+Pw54MKAYRXCnvTwev5kvye4j
 6qPCubd0uVB0uFEXHKI8KV4cCxrL+RSOaz17W0B8cfd0n4pmqE26Sl4e3KwgsEXON08Qjxo6a/7Sf
 EV+XmU7MojDFm3jWoqoQLDxKMgRkOYoTMrhZQyQU6u0x56aZAT9a+NnRWn5s9v6+MciqlIofoeOJ+
 XIlPDlaw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53074)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sZxrN-0007Xh-0r;
 Fri, 02 Aug 2024 20:22:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sZxrP-0008GY-2W; Fri, 02 Aug 2024 20:22:43 +0100
Date: Fri, 2 Aug 2024 20:22:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <Zq0yAjzrpIEhcHBZ@shell.armlinux.org.uk>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpoq-000eHy-GR@rmk-PC.armlinux.org.uk>
 <ij562xfhvgxmvpgh2l6rhsvcpi43yvvkvef4wgpjupwusi6uwy@cpnkopeu7cpc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ij562xfhvgxmvpgh2l6rhsvcpi43yvvkvef4wgpjupwusi6uwy@cpnkopeu7cpc>
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 13/14] net: stmmac: remove
 obsolete pcs methods and associated code
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

On Fri, Aug 02, 2024 at 02:02:25PM -0500, Andrew Halaney wrote:
> On Fri, Aug 02, 2024 at 11:47:32AM GMT, Russell King (Oracle) wrote:
> > The pcs_ctrl_ane() method is no longer required as this will be handled
> > by the mac_pcs phylink_pcs instance. Remove these methods, their common
> > implementation, the pcs_link, pcs_duplex and pcs_speed members of
> > struct stmmac_extra_stats, and stmmac_has_mac_phylink_select_pcs().
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> ...
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > index 3c8ae3753205..799af80024d2 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > @@ -321,48 +321,6 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
> >  {
> >  	struct stmmac_priv *priv = netdev_priv(dev);
> >  
> > -	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
> 
> This change effectively makes the INTEGRATED_PCS flag useless, I think
> we should remove it entirely.

I'm hoping the ethqos folk are going to test this patch series and tell
me whether it works for them - specifically Sneh Shah who added

	net: stmmac: dwmac-qcom-ethqos: Add support for 2.5G SGMII

which directly configures the PCS bypassing phylink. Specifically,
if this in stmmac_check_pcs_mode():

	priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII

is true for this device, then we may be in for problems. Since
priv->dma_cap.pcs comes from hardware, it's impossible to tell
unless one has that hardware.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
