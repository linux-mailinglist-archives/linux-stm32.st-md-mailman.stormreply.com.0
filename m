Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA494772C1
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 14:12:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 812AAC5F1D8;
	Thu, 16 Dec 2021 13:12:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3293C5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 13:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wHsilHS0z8BwdSdM+lXoMOjmJiClWgkl8JYzzdvfN88=; b=DMeto2sE7xQ6XVdNbAW3Pu1UbB
 Qy4zgZ9S2hlzoPaEUHhz5wHhFQbgc5xI9YYHwdX+A8vcrbvgfRzeiSoztKMLRmxJfPLAVksfU14Es
 WV/DD/oX8qLfDM5Io/y0sTFQ+vr8/+rGrMMsNgfbX4TCWnBdX13HNYwAqpbgybYj9YFrVrCsX8Qwg
 vIk9h1A5ZKp1nCLez492YkBvnxLIEN6KZ8cDpxao5NJHhTc+S9yH5dyH79JYo43oLL8C23pZET7VI
 OpndX1Sxe3fobzuRa2dzTYJErFfx0v9GRKs7AFP8K54cMynp8oqICmVWZsqQGQFPbjoGHuDZCCOdG
 qjiRfpYw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56320)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mxqY6-0007sD-O7; Thu, 16 Dec 2021 13:11:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mxqXs-0005Rj-Cp; Thu, 16 Dec 2021 13:11:40 +0000
Date: Thu, 16 Dec 2021 13:11:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Message-ID: <Ybs7DNDkBrf73jDi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH CFT net-next 0/6] net: stmmac/xpcs: modernise
	PCS support
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

This series updates xpcs and stmmac for the recent changes to phylink
to better support split PCS and to get rid of private MAC validation
functions.

This series is slightly more involved than other conversions as stmmac
has already had optional proper split PCS support.

The patches:

1) Provide a function to query the xpcs for the interface modes that
   are supported.

2) Populates the MAC capabilities and switches stmmac_validate() to use
   phylink_get_linkmodes(). We do not use phylink_generic_validate() yet
   as (a) we do not always have the supported interfaces populated, and
   (b) the existing code does not restrict based on interface. There
   should be no functional effect from this patch.

3) Populates phylink's supported interfaces from the xpcs when the xpcs
   is configured by firmware and also the firmware configured interface
   mode. Note: this will restrict stmmac to only supporting these
   interfaces modes - stmmac maintainers need to verify that this
   behaviour is acceptable.

4) stmmac_validate() tail-calls xpcs_validate(), but we don't need it to
   now that PCS have their own validation method. Convert stmmac and
   xpcs to use this method instead.

5) xpcs sets the poll field of phylink_pcs to true, meaning xpcs
   requires its status to be polled. There is no need to also set the
   phylink_config.pcs_poll. Remove this.

6) Switch to phylink_generic_validate(). This is probably the most
   contravertial change in this patch set as this will cause the MAC to
   restrict link modes based on the interface mode. From an inspection
   of the xpcs driver, this should be safe, as XPCS only further
   restricts the link modes to a subset of these (whether that is
   correct or not is not an issue I am addressing here.) For
   implementations that do not use xpcs, this is a more open question
   and needs feedback from stmmac maintainers.

Please review and test this series. Thanks!

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 144 ++++++----------------
 drivers/net/pcs/pcs-xpcs.c                        |  41 +++---
 include/linux/pcs/pcs-xpcs.h                      |   3 +-
 3 files changed, 67 insertions(+), 121 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
