Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDDFC20E23
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 16:19:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A765C57A51;
	Thu, 30 Oct 2025 15:19:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E50DCC57A4D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 15:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wvl1wULlPsH7hoZkM6Y8NRE1qWb5w+0oVN/bGJLNUUI=; b=PA3ub+bun3d2D08Kdx1Pzr+4yd
 xjQsir5EQJtCS7QcfH714iVa3uUoXmgvI2U1Fzk4kdQo3mZ1sOcWgYxnC/Mqon2wBIZRgMpaJj10+
 B83VmbtGcPE/52DgNXpReUT0tyI8TCdZNMJflp9QiPtqqbj0NoFV1jxudlvTVPD1vSZT+WFIk8OjG
 nUtyGHbgxMUN3SrVSxJgniok3hX53oxZGnMf+4ZGituT8FiNWtcX0Q6KtfNWPwkEm6gpzQDJc9N3H
 rin4gBvlc1GENrR1JuRGLiXkdowh62jNY8YsigpYs3hDnOblwfJLveTHRpy1erxYHyWhu+5TfEXp2
 O7BdGZGw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56358)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vEUR2-000000005rN-2rEZ;
 Thu, 30 Oct 2025 15:19:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vEUQx-00000000079-3c0M; Thu, 30 Oct 2025 15:19:27 +0000
Date: Thu, 30 Oct 2025 15:19:27 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Message-ID: <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQNmM5+cptKllTS8@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Furong Xu <0x1207@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Daniel Machon <daniel.machon@microchip.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: phylink PCS
 conversion part 3 (dodgy stuff)
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

On Thu, Oct 30, 2025 at 06:50:51PM +0530, Mohd Ayaan Anwar wrote:
> Hi Russell,
> On Wed, Oct 29, 2025 at 09:22:49AM +0000, Russell King (Oracle) wrote:
> > > # Patch Series (current): net: stmmac: phylink PCS conversion part 3
> > > (dodgy stuff)
> > >   - QCS9100 Ride R3 - functionality seems to be fine (again, probably
> > >     due to the changes only affecting SGMII mode). However, the warning
> > >     added in patch 2 comes up whenever there's a speed change (I added
> > >     an additional WARN_ON to check the sequence):
> > >   	[   61.663685] qcom-ethqos 23000000.ethernet eth0: Link is Down
> > > 	[   66.235461] dwmac: PCS configuration changed from phylink by glue, please report: 0x00001000 -> 0x00000000
> > 
> > That's clearing ANE, turning off AN. This will be because we're not
> > using the PCS code for 2500base-X.
> > 
> > Can you try:
> > 
> > 1. in stmmac_check_pcs_mode(), as a hack, add:
> > 
> > 	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_2500BASEX)
> > 		priv->hw->pcs = STMMAC_PCS_SGMII;
> > 
> > 2. with part 3 added, please change dwmac4_pcs_init() to:
> > 
> > 	phy_interface_t modes[] = {
> > 		PHY_INTERFACE_MODE_SGMII,
> > 		PHY_INTERFACE_MODE_2500BASEX,
> > 	};
> > 	...
> > 	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
> > 					  GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE,
> > 					  modes, ARRAY_SIZE(modes));
> > 
> > This will cause the integrated PCS to also be used for 2500BASE-X.
> > 
> > 3. modify dwmac_integrated_pcs_inband_caps() to return
> >    LINK_INBAND_DISABLE for PHY_INTERFACE_MODE_2500BASEX.
> > 
> > This should result in the warning going away for you.
> > 
> > I'm not suggesting that this is a final solution.
> 
> Here are my observations (with phylink logs if it helps):
> 
> 1. Link up at 2.5G
> [    8.429331] qcom-ethqos 23000000.ethernet: User ID: 0x20, Synopsys ID: 0x52
> [    8.436610] qcom-ethqos 23000000.ethernet:   DWMAC4/5
> [   10.395163] qcom-ethqos 23000000.ethernet eth0: PHY stmmac-0:00 uses interfaces 4,23,27, validating 23
> [   10.407759] qcom-ethqos 23000000.ethernet eth0:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
> [   10.418507] qcom-ethqos 23000000.ethernet eth0: PHY [stmmac-0:00] driver [Aquantia AQR115C] (irq=343)
> [   10.428003] qcom-ethqos 23000000.ethernet eth0: phy: 2500base-x setting supported 0000000,00000000,00008000,000062ff advertising 0000000,00000000,00008000,000062ff
> [   10.461072] qcom-ethqos 23000000.ethernet eth0: Enabling Safety Features
> [   10.478201] qcom-ethqos 23000000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
> [   10.487449] qcom-ethqos 23000000.ethernet eth0: registered PTP clock
> [   10.494010] qcom-ethqos 23000000.ethernet eth0: configuring for phy/2500base-x link mode
> [   10.494014] qcom-ethqos 23000000.ethernet eth0: major config, requested phy/2500base-x
> [   10.494018] qcom-ethqos 23000000.ethernet eth0: interface 2500base-x inband modes: pcs=01 phy=00
> [   10.494021] qcom-ethqos 23000000.ethernet eth0: major config, active phy/outband/2500base-x
> [   10.494024] qcom-ethqos 23000000.ethernet eth0: phylink_mac_config: mode=phy/2500base-x/none adv=0000000,00000000,00000000,00000000 pause=00
> [   10.508824] qcom-ethqos 23000000.ethernet eth0: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
> [   15.099693] qcom-ethqos 23000000.ethernet eth0: phy link up 2500base-x/2.5Gbps/Full/none/rx/tx/nolpi
> [   15.122160] dwmac: PCS configuration changed from phylink by glue, please report: 0x00041000 -> 0x00040000
> [   15.140458] qcom-ethqos 23000000.ethernet eth0: Link is Up - 2.5Gbps/Full - flow control rx/tx
> [   15.140939] stmmac_pcs: Link Up
> 
> As I understand it, the glue layer disables ANE at 2.5G.

Please try again, this time with snps,ps-speed removed from the DT
description for the interface. This property was a buggy attempt at
reverse-SGMII, and incorrectly produced a warning if not specified
when the integrated PCS was being used. The "bug" in the attempt
with this was a typo in each MAC core driver, where specifying this
set the TE (transmit enable) bit rather than the TC (transmit
configuration) bit in the MAC control register. All the rest of the
setup for reverse-SGMII mode was in place, but this bug made the
entire thing useless.

The "invalid port speed" warning that results if this property is
not set to 10, 100 or 1000 is another bug - only if this warning
is printed will the "normal" mode be selected.

Since the PCS series 1 and 2 have been merged into net-next, it
will be safe to submit patches removing these properties from your
DT files, without fear of this warning appearing.

> 2. Link up at 1G:
> [    6.261112] qcom-ethqos 23000000.ethernet: User ID: 0x20, Synopsys ID: 0x52
> [    6.261116] qcom-ethqos 23000000.ethernet:   DWMAC4/5
> [    9.051693] qcom-ethqos 23000000.ethernet eth0: PHY stmmac-0:00 uses interfaces 4,23,27, validating 23
> [    9.061261] qcom-ethqos 23000000.ethernet eth0:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
> [    9.061266] qcom-ethqos 23000000.ethernet eth0: PHY [stmmac-0:00] driver [Aquantia AQR115C] (irq=305)
> [    9.061269] qcom-ethqos 23000000.ethernet eth0: phy: 2500base-x setting supported 0000000,00000000,00008000,000062ff advertising 0000000,00000000,00008000,000062ff
> [    9.080324] qcom-ethqos 23000000.ethernet eth0: Enabling Safety Features
> [    9.114550] qcom-ethqos 23000000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
> [    9.123870] qcom-ethqos 23000000.ethernet eth0: registered PTP clock
> [    9.130412] qcom-ethqos 23000000.ethernet eth0: configuring for phy/2500base-x link mode
> [    9.138726] qcom-ethqos 23000000.ethernet eth0: major config, requested phy/2500base-x
> [    9.138729] qcom-ethqos 23000000.ethernet eth0: interface 2500base-x inband modes: pcs=01 phy=00
> [    9.138731] qcom-ethqos 23000000.ethernet eth0: major config, active phy/outband/2500base-x
> [    9.164930] qcom-ethqos 23000000.ethernet eth0: phylink_mac_config: mode=phy/2500base-x/none adv=0000000,00000000,00000000,00000000 pause=00
> [    9.194764] qcom-ethqos 23000000.ethernet eth0: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
> [   12.542771] qcom-ethqos 23000000.ethernet eth0: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
> [   12.553890] qcom-ethqos 23000000.ethernet eth0: major config, requested phy/sgmii
> [   12.561617] qcom-ethqos 23000000.ethernet eth0: interface sgmii inband modes: pcs=03 phy=03
> [   12.570220] qcom-ethqos 23000000.ethernet eth0: major config, active phy/outband/sgmii
> [   12.578367] qcom-ethqos 23000000.ethernet eth0: phylink_mac_config: mode=phy/sgmii/none adv=0000000,00000000,00000000,00000000 pause=03
> [   12.599545] stmmac_pcs: ANE process completed
> [   12.607910] dwmac: PCS configuration changed from phylink by glue, please report: 0x00041000 -> 0x00041200
> [   12.616188] stmmac_pcs: Link Up
> [   12.634351] qcom-ethqos 23000000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
> [   12.639575] stmmac_pcs: ANE process completed
> [   12.647498] stmmac_pcs: Link Up
> 
> This is probably fine since Bit(9) is self-clearing and its value just
> after this is 0x00041000.

Yes, and bit 9 doesn't need to be set at all. SGMII isn't "negotiation"
but the PHY says to the MAC "this is how I'm operating" and the MAC says
"okay". Nothing more.

I'm afraid the presence of snps,ps-speed, this disrupts the test.

> > I haven't noticed qcom-ethqos using a register field that corresponds
> > with the phy_intf_sel inputs, so even in that series, this driver
> > doesn't get converted.
> 
> True, I think qcom-ethqos's behaviour is different than other glue
> drivers. For both SGMII and 2500Base-X, it uses the same
> ethqos_configure_sgmii() function which is just changing the SerDes
> speed and PCS and depending on the current speed.

Right, so it leaves the SGMIIRAL block in place, hoping that it
will be operating with no symbol replication.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
