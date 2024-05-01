Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5E78B8C72
	for <lists+linux-stm32@lfdr.de>; Wed,  1 May 2024 17:07:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AA21C71291;
	Wed,  1 May 2024 15:07:56 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5093C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2024 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=r7gAXy+cNEHO7G6rohfcs/xnGaGYf4/LzouNOqGTrog=; b=Ub7vtwJFu31k+jCSuleQcGO1Qb
 sfN8ktFXayykcXReCJZQowkbnYKx3TSDpjEm1o8mt0XUt0DXYlyqZiU7v9r7rVUKusSvnVZ5sM22d
 5h/kFCCevEEeyuUEiAtX7MZgTd3RdYRuzF+zrYLm7hFVDfTbPQ0T6hRRl4JBw0/yZRxw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1s2BYe-00EQuu-Kp; Wed, 01 May 2024 17:07:44 +0200
Date: Wed, 1 May 2024 17:07:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <229b5a82-1086-40be-8ee5-16b7f3a03b30@lunn.ch>
References: <uz66kbjbxieof6vkliuwgpzhlrbcmeb2f5aeuourw2vqcoc4hv@2adpvba3zszx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <uz66kbjbxieof6vkliuwgpzhlrbcmeb2f5aeuourw2vqcoc4hv@2adpvba3zszx>
Cc: davem@davemloft.net, linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] racing ndo_open()/phylink*connect() with
	phy_probe()
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

On Tue, Apr 30, 2024 at 04:02:19PM -0500, Andrew Halaney wrote:
> Hi,
> 
> I've been taking a look at the following error message:
> 
>     qcom-ethqos 23000000.ethernet end1: __stmmac_open: Cannot attach to PHY (error: -19)
> 
> end1 is using a phy on the mdio bus of end0, not on its own bus. Something
> like this devicetree snippet highlights the relationship:
> 
>     // end0
>     &ethernet0 {
>             phy-mode = "sgmii";
>             phy-handle = <&sgmii_phy0>;
> 
>             mdio {
>                     compatible = "snps,dwmac-mdio";
>                     sgmii_phy0: phy@8 {
>                             compatible = "ethernet-phy-id0141.0dd4";
>                             reg = <0x8>;
>                             device_type = "ethernet-phy";
>                     };
> 
>                     sgmii_phy1: phy@a {
>                             compatible = "ethernet-phy-id0141.0dd4";
>                             reg = <0xa>;
>                             device_type = "ethernet-phy";
>                     };
>             };
>     };
> 
>     // end1
>     &ethernet1 {
>             phy-mode = "sgmii";
>             phy-handle = <&sgmii_phy1>;
>     };

I agree with Russell here. You need to determine where the ENODEV
comes from.

It seems unlikely, but one possibility is:

static int stmmac_xgmac2_mdio_read_c22(struct mii_bus *bus, int phyaddr,
                                       int phyreg)
{
        struct net_device *ndev = bus->priv;
        struct stmmac_priv *priv;
        u32 addr;

        priv = netdev_priv(ndev);

        /* Until ver 2.20 XGMAC does not support C22 addr >= 4 */
        if (priv->synopsys_id < DWXGMAC_CORE_2_20 &&
            phyaddr > MII_XGMAC_MAX_C22ADDR)
                return -ENODEV;

Maybe if the interface is down, priv->synopsys_id has not been set
yet? Your devices are at address 8 and 10, so if priv->synopsys_id
where 0, this would give you the ENODEV.

Once you know the root cause, we might be able to make suggests how to
fix it.

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
