Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B3BA0086D
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2025 12:16:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFEDAC78F67;
	Fri,  3 Jan 2025 11:16:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0031FC78F66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2025 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KnnKr1tOZVG12cK+LLFuxnU9SlvnnOfbe1CXtqwo2co=; b=omu4oSb2n/Rx3anVtN7y8fsq6W
 ILbT06ESY8/18a0G6Ad4YiG8uXgbgd8tbeEuBBkTzg9YBJD6H/UkK/6vmh9BhGmWeWg5pDxeBoO+r
 EmcLWybCYb+EcQCxZKg0O/KOhAklMJgpzc7kc6eMm2yDrHmsLA6dWTJrQnmjhYFs0J7a3xkTp3v0b
 7ZwaxxwEJFfvNiD6ifORIUJnEUixetrKN8hGBATpO4Kk5ajHUf8lerm1RZMzyQ4y6Qs7v/u485vsS
 2phrRtLXhA8QRs9kPW4ke7a1I5gNa6M+icLSRRmZwdPF8Vh8d4vzqgXUrXJBK+ZglEUaE4H5ua5XA
 qmVOteUw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38220)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tTff2-0002zj-35;
 Fri, 03 Jan 2025 11:16:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tTfew-0001H9-1H;
 Fri, 03 Jan 2025 11:16:06 +0000
Date: Fri, 3 Jan 2025 11:16:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Alexander Couzens <lynxis@fe80.eu>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next 0/6] net: pcs: add
 supported_interfaces bitmap for PCS
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

This series adds supported_interfaces for PCS, which gives MAC code a
way to determine the interface modes that the PCS supports without
having to implement functions such as xpcs_get_interfaces(), or
workarounds such as in

https://lore.kernel.org/r/20241213090526.71516-3-maxime.chevallier@bootlin.com

Patch 1 adds the new bitmask to struct phylink_pcs, and code within
phylink to validate that the PCS returned by the MAC driver supports
the interface mode - but only if this bitmask is non-empty.

Patch 2 through 4 fills in the interface modes for XPCS, Mediatek LynxI
and Lynx PCS.

Patch 5 adds support to stmmac to make use of this bitmask when filling
in phylink_config.supported_interfaces, eliminating the call to
xpcs_get_interfaces.

As xpcs_get_interfaces() is now unused outside of pcs-xpcs.c, patch 6
makes this function static and removes it from the header file.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
 drivers/net/pcs/pcs-lynx.c                        | 13 +++++++++++++
 drivers/net/pcs/pcs-mtk-lynxi.c                   |  4 ++++
 drivers/net/pcs/pcs-xpcs.c                        |  5 +++--
 drivers/net/phy/phylink.c                         | 11 +++++++++++
 include/linux/pcs/pcs-xpcs.h                      |  1 -
 include/linux/phylink.h                           |  3 +++
 7 files changed, 43 insertions(+), 5 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
