Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBEF9900BC
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 12:20:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CC31C78023;
	Fri,  4 Oct 2024 10:20:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F345C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g5gMsMlOt6+uUT+iqof24T3eZesuF6qztprcqRPdYLE=; b=IHsg0vzEv5qz9GOw5lXDVzbEzv
 ZnTWNB3bY4TryT+DXC5e6vRKWDBrs9idERQ/4nTStu3sOOLkCdzzZUMAqWuiGTzge5JMxqAvizPOl
 8OPG9J4g6iC4ZRPghgepHAl4nD76uJnBfHJvmVxVDLFNciVljJ6aiFO9wJQgXg3p44BojTTrrg/Of
 lI4SlghrghkX/tIv23vfVkpVppmhUiwmjQmt+XhJjmqRkuZdsPKucrA7ILwtOaov1QvVRDcwk30yc
 U71meNoT0bamu6Qu8BfYPLZobG+xqUq6yyBxUDj53qQllXNUZSriY6hXYYXoaWCbypI/R6GPrsauw
 pvZuJ5Mg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43032)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1swfPp-0001fb-3D;
 Fri, 04 Oct 2024 11:20:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1swfPi-00016R-0C;
 Fri, 04 Oct 2024 11:19:58 +0100
Date: Fri, 4 Oct 2024 11:19:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 00/13] net: pcs: xpcs: cleanups batch
	2
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

This is the second cleanup series for XPCS.

Patch 1 removes the enum indexing the dw_xpcs_compat array. The index is
never used except to place entries in the array and to size the array.

Patch 2 removes the interface arrays - each of which only contain one
interface.

Patch 3 makes xpcs_find_compat() take the xpcs structure rather than the
ID - the previous series removed the reason for xpcs_find_compat needing
to take the ID.

Patch 4 provides a helper to convert xpcs structure to a regular
phylink_pcs structure, which leads to patch 5.

Patch 5 moves the definition of struct dw_xpcs to the private xpcs
header - with patch 4 in place, nothing outside of the xpcs driver
accesses the contents of the dw_xpcs structure.

Patch 6 renames xpcs_get_id() to xpcs_read_id() since it's reading the
ID, rather than doing anything further with it. (Prior versions of this
series renamed it to xpcs_read_phys_id() since that more accurately
described that it was reading the physical ID registers.)

Patch 7 moves the searching of the ID list out of line as this is a
separate functional block.

Patch 8 converts xpcs to use the bitmap macros, which eliminates the
need for _SHIFT definitions.

Patch 9 adds and uses _modify() accessors as there are a large amount
of read-modify-write operations in this driver. This conversion found
a bug in xpcs-wx code that has been reported and already fixed.

Patch 10 converts xpcs to use read_poll_timeout() rather than open
coding that.

Patch 11 converts all printed messages to use the dev_*() functions so
the driver and devie name are always printed.

Patch 12 moves DW_VR_MII_DIG_CTRL1_2G5_EN to the correct place in the
header file, rather than amongst another register's definitions.

Patch 13 moves the Wangxun workaround to a common location rather than
duplicating it in two places. We also reformat this to fit within
80 columns.

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |   2 +-
 drivers/net/pcs/pcs-xpcs-nxp.c                    |  24 +-
 drivers/net/pcs/pcs-xpcs-wx.c                     |  56 ++-
 drivers/net/pcs/pcs-xpcs.c                        | 445 +++++++++-------------
 drivers/net/pcs/pcs-xpcs.h                        |  26 +-
 include/linux/pcs/pcs-xpcs.h                      |  19 +-
 6 files changed, 237 insertions(+), 335 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
