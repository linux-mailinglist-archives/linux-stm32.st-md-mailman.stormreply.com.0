Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8FF8D379A
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 15:29:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 527E8C62EFE;
	Wed, 29 May 2024 13:29:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BAAAC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BDYEhepQA/d2FZ56BctnoAn7J3hrIwALy9fmhbjaYl0=; b=Irq/mhY9oMmIKSYt8KYRcpNoWI
 Tu6uA1dOIDvk44vXrQbgz8vwQCIxdLVpc9xD9jeJVpUufdEaZhPHp0sIX0wNRrV3HSjWxd/bcQY95
 2EY0cywXA03kIKmfTlEg0HCDSFH4Xl7C2HjPUCKMveyqJ6cC2XWj+OcHRpj7jLL2lm+n/c3D4UM92
 spEQw2vcGA/OxQwux39bDI+S3Dmcan0L5hf1Btbam7jZYQx+I4UdZv+8Gw7Dq8D7NWblVSf0il9+d
 ApbaVENFAL4DHzrWAt3g31qs8kvcLnsEiF9lI5SPqp8cjR/K88jjbkIvF86JuIoVMCjlAPk1CeNBr
 1X+f/oTQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50668)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sCJMC-00069W-2P;
 Wed, 29 May 2024 14:28:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sCJMA-0004Eb-Nb; Wed, 29 May 2024 14:28:42 +0100
Date: Wed, 29 May 2024 14:28:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <ZlctinnTT8Xhemsm@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Madalin Bucur <madalin.bucur@nxp.com>,
 Sean Anderson <sean.anderson@seco.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 0/6] net: phylink: rearrange
	ovr_an_inband support
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

This series addresses the use of the ovr_an_inband flag, which is used
by two drivers to indicate to phylink that they wish to use inband mode
without firmware specifying inband mode.

The issue with ovr_an_inband is that it overrides not only PHY mode,
but also fixed-link mode. Both of the drivers that set this flag
contain code to detect when fixed-link mode will be used, and then
either avoid setting it or explicitly clear the flag. This is
wasteful when phylink already knows this.

Therefore, the approach taken in this patch set is to replace the
ovr_an_inband flag with a default_an_inband flag which means that
phylink defaults to MLO_AN_INBAND instead of MLO_AN_PHY, and will
allow that default to be overriden if firmware specifies a fixed-link.
This allows users of ovr_an_inband to be simplified.

What's more is this requires minimal changes in phylink to allow this
new mode of operation.

This series changes phylink, and also updates the two drivers
(fman_memac and stmmac), and then removes the unnecessary complexity
from the drivers.

This series may depend on the stmmac cleanup series I've posted
earlier - this is something I have not checked, but I currently have
these patches on top of that series.

 drivers/net/ethernet/freescale/fman/fman_memac.c  | 16 ++++++----------
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 15 ++-------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  4 ++--
 drivers/net/phy/phylink.c                         | 11 ++++++++---
 include/linux/phylink.h                           |  5 +++--
 include/linux/stmmac.h                            |  2 +-
 6 files changed, 22 insertions(+), 31 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
