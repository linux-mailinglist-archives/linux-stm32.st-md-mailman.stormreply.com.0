Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A514FC311B1
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 14:04:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3934EC62ECF;
	Tue,  4 Nov 2025 13:04:28 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D16FC62ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 13:04:26 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B59C81A0A39;
 Tue,  4 Nov 2025 14:04:25 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A77171A09FE;
 Tue,  4 Nov 2025 14:04:25 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 08A68202E8;
 Tue,  4 Nov 2025 14:04:25 +0100 (CET)
Date: Tue, 4 Nov 2025 14:04:25 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aQn52d7B6HfVSS22@lsv051416.swis.nl-cdc01.nxp.com>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
 <aQnJRgJqFY99kDUj@lsv051416.swis.nl-cdc01.nxp.com>
 <aQnNjWuytebZpZyW@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQnNjWuytebZpZyW@shell.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Andrew Lunn <andrew@lunn.ch>, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 02/11] net: stmmac: s32: move
 PHY_INTF_SEL_x definitions out of the way
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

On Tue, Nov 04, 2025 at 09:55:25AM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 04, 2025 at 10:37:10AM +0100, Jan Petrous wrote:
> > On Mon, Nov 03, 2025 at 11:50:00AM +0000, Russell King (Oracle) wrote:
> > >  /* SoC PHY interface control register */
> > > -#define PHY_INTF_SEL_MII	0x00
> > > -#define PHY_INTF_SEL_SGMII	0x01
> > > -#define PHY_INTF_SEL_RGMII	0x02
> > > -#define PHY_INTF_SEL_RMII	0x08
> > > +#define S32_PHY_INTF_SEL_MII	0x00
> > > +#define S32_PHY_INTF_SEL_SGMII	0x01
> > > +#define S32_PHY_INTF_SEL_RGMII	0x02
> > > +#define S32_PHY_INTF_SEL_RMII	0x08
> > 
> > Reviewed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> 
> Thanks. One question: is it possible that bits 3:1 are the dwmac
> phy_intf_sel_i inputs, and bit 0 selects an external PCS which
> is connected to the dwmac using GMII (and thus would be set bits
> 3:1 to zero) ?

I guess so, as the S32G3 Reference Manual says regarding
GMAC_0_CTRL_STS register bits the following:

[3-1] PHY_INTF_SEL: PHY Interface Select
      Selects the PHY interface. These values are valid only
      for PHY_MODE=0.

      000b - MII
      001b - RGMII
      100b - RMII

[0-0] PHY_MODE: Select the PHY mode.
      Selects the PHY mode.

      0b - Other PHY modes (for ex. RGMII, RMII, ...)
      1b - SGMII mode

> 
> It's not really relevant as the driver only appears to support
> RGMII.

Yes. The RGMII was the simplest way to upstream review, so
I decided to stick on it.

The SGMII support is ongoing.

/Jan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
