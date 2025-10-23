Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 173E7C00565
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 11:46:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB3FCC5EC5D;
	Thu, 23 Oct 2025 09:46:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34DCAC5EC58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 09:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NgpAa3vCXF8Kyi2ufZqWKX+aesmDKAy5CtUjQRUQIQ0=; b=VeFnkdn79Q2P2HP9G4RpPb58FR
 VKZ98Er/W8oLcJsbPdOrkvVY4udncaY1U7sFVyJu1kffwcnHW56FH9qe9Hma/z2g3/cvmIDuK7e/4
 Jzw/At4CH2AbDMnNoPVzoj9zo8FvOe+gwvJwByXqcSrV80Z0DPe4WapqqHGm+rNLtXjkeoV6FEA/Z
 7XIvysR95b+ZsqxwCldkVlb5dI1Rnr/+geCaJHR5xOJ4EOFQC3X/8XwyN93XRR5jKVUKvKeR3/hfv
 UTlsjF2/n2s3EiHIIPiCC5aKlhSuBvDKcWDltQTbVTWTtXl3MCvLFLw7MbadrXJd3rWvORUKo/vQu
 5fz6MKCg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36838)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vBrtb-0000000068L-2tsr;
 Thu, 23 Oct 2025 10:46:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vBrtZ-000000001aN-2Di5; Thu, 23 Oct 2025 10:46:09 +0100
Date: Thu, 23 Oct 2025 10:46:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: pcs support part 2
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

This is the next part of stmmac PCS support. Not much here, other than
dealing with what remains of the interrupts, which are the PCS AN
complete and PCS Link interrupts, which are just cleared and update
accounting.

Currently, they are enabled at core init time, but if we have an
implementation that supports multiple PHY interfaces, we want to
enable only the appropriate interrupts.

I also noticed that stmmac_fpe_configure_pmac() also modifies the
interrupt mask during run time. As a pre-requisit, we need a way
to ensure that we don't have different threads modifying the
interrupt settings at the same time. So, the first patch introduces
a new function and a spinlock which must be held when manipulating
the interrupt enable/mask state.

The second patch adds the PCS bits for enabling the PCS AN and PCS
link interrupts when the PCS is in-use.

 drivers/net/ethernet/stmicro/stmmac/common.h       |  5 ++++
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  7 +++---
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   | 26 +++++++++++++++------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  2 --
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  | 27 ++++++++++++++++------
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 16 +++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c         |  2 ++
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c   |  3 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 22 +++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  4 +++-
 11 files changed, 96 insertions(+), 22 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
