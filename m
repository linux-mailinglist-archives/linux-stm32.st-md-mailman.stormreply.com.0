Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB0FC42903
	for <lists+linux-stm32@lfdr.de>; Sat, 08 Nov 2025 08:58:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26A46C60469;
	Sat,  8 Nov 2025 07:58:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9CB8C56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Nov 2025 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=13csuvQtsJof1dOcx8aG6Jr6ZCLtdjpsnRWnJo51I84=; b=Rv2wxtohwqYJPfuCefjstYazhS
 J7sVL69bsh133ujRSUUL9rrB0a/kzxTXGGikUf2yKLeg7SmIMIT8UuJNoKhzCvfyGAAWz5Pe+EeEm
 h2Q3xUXo+zHXfnRbj7Qyw+yNd1OHpPxkgHGUi0HVF6jlGu4p8MUsSzzkzdi1BfcZ8nJ49iFCq6/se
 ZFmURo5WkmDkDgxbjYGaHpgr5UnQva3gNUyY8WgIrCVrLxhKy+ZdWv2qrhTCFKDvav2VUb6zLH+VB
 pr2JJLW3b4SiifkY32GzQxiS7P334PO84sQOHxisN0vvi52hhb/G8h9REWWVIxAKPkvD8a139wNRt
 Mb4K10Ng==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41096)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vHdq8-000000007Vz-3J1j;
 Sat, 08 Nov 2025 07:58:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vHdpz-000000008Nb-48sV; Sat, 08 Nov 2025 07:58:20 +0000
Date: Sat, 8 Nov 2025 07:58:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aQ74G_WqoAusC2wd@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSq-0000000DkTN-3RoV@rmk-PC.armlinux.org.uk>
 <14f80863-5766-437a-8e38-8991a1a725f9@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14f80863-5766-437a-8e38-8991a1a725f9@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 16/16] net: stmmac: visconti: use
 stmmac_get_phy_intf_sel()
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

On Fri, Nov 07, 2025 at 07:23:26PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 07/11/2025 15:29, Russell King (Oracle) wrote:
> > -	switch (plat_dat->phy_interface) {
> > -	case PHY_INTERFACE_MODE_RGMII:
> > -	case PHY_INTERFACE_MODE_RGMII_ID:
> > -	case PHY_INTERFACE_MODE_RGMII_RXID:
> > -	case PHY_INTERFACE_MODE_RGMII_TXID:
> > -		phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
> > -		break;
> > -	case PHY_INTERFACE_MODE_MII:
> > -		phy_intf_sel = ETHER_CONFIG_INTF_MII;
> > -		break;
> > -	case PHY_INTERFACE_MODE_RMII:
> > -		phy_intf_sel = ETHER_CONFIG_INTF_RMII;
> > -		break;
> > -	default:
> > +	int phy_intf_sel;
> > +
> > +	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
> > +	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
> > +	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
> > +	    phy_intf_sel != PHY_INTF_SEL_RMII) {
> >  		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n", plat_dat->phy_interface);
> >  		return -EOPNOTSUPP;
> >  	}
> 
> Probably not too big of a deal, but don't we now incorrectly accept the
> "gmii" mode ?

We will accept GMII mode, but (a) does that matter, and (b) shouldn't
the DT binding be checking the phy-mode (we have some bindings that do.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
