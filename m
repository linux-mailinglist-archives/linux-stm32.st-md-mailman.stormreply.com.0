Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52630A4818F
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 15:37:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 149C1C7A849;
	Thu, 27 Feb 2025 14:37:52 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD846C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oiwYDnalcOWLxT6B/Bkzq59HPzR1dq0zPgE4ezlSWq4=; b=w/peQvAvOuCnZFaTMw3cbppWQA
 FovXewpHGfzdvCoXoW23WG2/mbsbKhl3ZC29qTW6Qk+26lwPDeiLaUhd7gqftdl5vTgCKi1LjksAY
 s2gTPyC9hZwrA+BxvoUfSIkdi2VeSYrrU3vR35NLYufhkDXmDZqLucSWCRyNO9CSQwuD3dDp7l8ll
 TWpcrNP+GYhV9Psn4lrP8x+G3Ld4qEB45GRYRhMzGMXe6oXvHn8+AYbuK1RZewXFgUwwycAyTryHJ
 abhygfIMfsyUGC4Wn3sfJxoGBPBMY2QU2hvsxgXkS81wqxdSuwizuuYj0+zuzoKtqAePiJcIrrfGY
 6ryq0f3g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40258)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tnf1D-0007Ps-29;
 Thu, 27 Feb 2025 14:37:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tnf1B-0008Cn-2M;
 Thu, 27 Feb 2025 14:37:41 +0000
Date: Thu, 27 Feb 2025 14:37:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 0/5] net: stmmac: fix resume failures due
	to RX clock
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

This series is likely dependent on the "net: stmmac: cleanup transmit
clock setting" series which was submitted earlier today.

stmmac has a long history of failing to resume due to lack of receive
clock. NVidia have reported that as a result of the EEE changes, they
see a greater chance of resume failure with those patches applied than
before.

The issue is that the DesignWare core requires that the receive clock
is running in order to complete software reset, which causes
stmmac_reset() and stmmac_hw_setup() to fail.

There are several things that are wrong:

1. Calling phylink_start() early can result in a call to mac_link_up()
   which will set TE and RE bits before stmmac_hw_setup() has been
   called. This is evident in the debug logs that NVidia sent while
   debugging the problem.

   This is something I have pointed out in the past, but ithas been
   claimed to be necessary to do things this way to have the PHY
   receive clock running. Enabling RE before DMA is setup is against
   the DesignWare databook documentation.

2. Enabling LPI clock-stop at the PHY (as the driver has done prior
   to my patch set) allows the PHY to stop its receive clock when the
   link enters low-power mode. This means the completion of reset is
   dependent on the current EEE state, which is indeterminable, but
   is likely to be in low power mode on resume.

We solve (1) by moving the call to phylink_resume() later. This patch
on its own probably causes regressions as it may make it more likely
that the link will be in low power state, or maybe the PHY driver does
not respect the PHY_F_RXC_ALWAYS_ON flag - this needs to be tested on
as many different hardware setups that use this driver as possible,
and any issues addressed *without* moving phylink_resume() back.
If we need some way to resume the PHY early, then we need to work out
some way to do that with phylib without calling phy_start() early.

(2) is fixed by introducing phylink_prepare_resume(), which will
disable receive clock-stop in LPI mode at the PHY, and we will restore
the clock-stop setting in phylink_resume(). It is possible that this
solves some of the reason for the early placement of phylink_resume().

phylink_prepare_resume() also provides a convenient site should (1)
need further work.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 27 +++++++--------
 drivers/net/phy/phylink.c                         | 40 ++++++++++++++++++++++-
 include/linux/phylink.h                           |  1 +
 3 files changed, 51 insertions(+), 17 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
