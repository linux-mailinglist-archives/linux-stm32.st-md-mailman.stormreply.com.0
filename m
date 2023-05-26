Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD20714D51
	for <lists+linux-stm32@lfdr.de>; Mon, 29 May 2023 17:46:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19F2BC6A61D;
	Mon, 29 May 2023 15:46:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FBDCC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gIbo2OHXFMVJ6gyvgDlZbweRhKVO88XqXsauWqjJJGQ=; b=DSkLujtz9AOVB+vvmi/42gjSnq
 uoUlG7ED9r8gJ0Qj+5nEnvcDkXs7+nwqXPwkpJYsOC5QfvqKyKC8DsX/uNZwp92LV4Yo5lAGPfu8w
 7Evr+/NSpNA/1RBChiFAX6PiLdAlwTEKLBYJth+sMpjfhQw7kEUAmRZerkTT+FsnW8JS2hAW89oyL
 I+awrXYTmwcnjG2ywmVqSxaLJ3E84TQJseaZnWPnyXtUM47V8fus1y2O4omvTGoMdAgrgMnJcfIuh
 MlKlJaLu5Lsxaa5pZZk37lr3sBnr5cKi4ds3WMfyXVc1kWHqg2mEek70C8HgjEw8z5NFM/630XEma
 ohjVJwaA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55470)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1q2USW-0005OU-5d; Fri, 26 May 2023 11:14:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1q2USN-0003e9-Ec; Fri, 26 May 2023 11:13:59 +0100
Date: Fri, 26 May 2023 11:13:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <ZHCGZ8IgAAwr8bla@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 29 May 2023 15:46:36 +0000
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 UNGLinuxDriver@microchip.com, linux-stm32@st-md-mailman.stormreply.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Simon Horman <simon.horman@corigine.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/6] net: pcs: add helpers to xpcs
 and lynx to manage mdiodev
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

Hi,

This morning, we have had two instances where the destruction of the
MDIO device associated with XPCS and Lynx has been wrong. Rather than
allowing this pattern of errors to continue, let's make it easier for
driver authors to get this right by adding a helper.

The changes are essentially:

1. Add two new mdio device helpers to manage the underlying struct
   device reference count. Note that the existing mdio_device_free()
   doesn't actually free anything, it merely puts the reference count.

2. Make the existing _create() and _destroy() PCS driver methods
   increment and decrement this refcount using these helpers. This
   results in no overall change, although drivers may hang on to
   the mdio device for a few cycles longer.

3. Add _create_mdiodev() which creates the mdio device before calling
   the existing _create() method. Once the _create() method has
   returned, we put the reference count on the mdio device.

   If _create() was successful, then the reference count taken there
   will "hold" the mdio device for the lifetime of the PCS (in other
   words, until _destroy() is called.) However, if _create() failed,
   then dropping the refcount at this point will free the mdio device.

   This is the exact behaviour we desire.

4. Convert users that create a mdio device and then call the PCS's
   _create() method over to the new _create_mdiodev() method, and
   simplify the cleanup.

We also have DPAA2 and fmem_memac that look up their PCS rather than
creating it. These could also drop their reference count on the MDIO
device immediately after calling lynx_pcs_create(), which would then
mean we wouldn't need lynx_get_mdio_device() and the associated
complexity to put the device in dpaa2_pcs_destroy() and pcs_put().
Note that DPAA2 bypasses the mdio device's abstractions by calling
put_device() directly.

 drivers/net/dsa/ocelot/felix_vsc9959.c            | 20 +++------------
 drivers/net/dsa/ocelot/seville_vsc9953.c          | 20 +++------------
 drivers/net/ethernet/freescale/enetc/enetc_pf.c   | 22 +++-------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 15 +++--------
 drivers/net/pcs/pcs-lynx.c                        | 31 +++++++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                        | 28 ++++++++++++++++++++
 include/linux/mdio.h                              | 10 ++++++++
 include/linux/pcs-lynx.h                          |  1 +
 include/linux/pcs/pcs-xpcs.h                      |  2 ++
 9 files changed, 87 insertions(+), 62 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
