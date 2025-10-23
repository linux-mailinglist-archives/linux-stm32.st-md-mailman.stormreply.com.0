Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0400DC0047B
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 11:37:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F91EC5EC4C;
	Thu, 23 Oct 2025 09:36:58 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85899C5E2DF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6DCJK6uJnCbgD2d0vAbxfsTdaOAd3ysv1m0iG7pR4Mk=; b=KeHPk39NCTe+UtVT3YRRER4JIG
 ka52phznonJX4IdnwDithKL2Yl/rPVwsYHzsAZtGL6GKI7ZuzCyxwHq2jitcX5d+iPPGJ1AMEJn35
 /BxDqxz6sJtwIWv04JNnCybhECo4COpAAKGSbTU/7jIB6wu+jV3MchWFjJp4msrImUEeVbxdQNk5E
 q8F7sT0b+yaLmxwQO/7+9qq+7YYQkJqDsc7S2QynYpT8E4CYttP4u6Wg8aJXaUvVsKH1n132K6U55
 7rMXKLVK8/XCkH7f4yChe4z5z2fMGQ1BwPAuf7kNcYeR6QxFydWCi1zrhpUZnSYcBCW3y7GiOwVME
 22pbPQFQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44934)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vBrka-0000000064O-1MLL;
 Thu, 23 Oct 2025 10:36:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vBrkX-000000001ZH-3TwL; Thu, 23 Oct 2025 10:36:49 +0100
Date: Thu, 23 Oct 2025 10:36:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
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

This series cleans up hwif.c:

- move the reading of the version information out of stmmac_hwif_init()
  into its own function, stmmac_get_version(), storing the result in a
  new struct.

- simplify stmmac_get_version().

- read the version register once, passing it to stmmac_get_id() and
  stmmac_get_dev_id().

- move stmmac_get_id() and stmmac_get_dev_id() into
  stmmac_get_version()

- define version register fields and use FIELD_GET() to decode

- start tackling the big loop in stmmac_hwif_init() - provide a
  function, stmmac_hwif_find(), which looks up the hwif entry, thus
  making a much smaller loop, which improves readability of this code.

- change the use of '^' to '!=' when comparing the dev_id, which is
  what is really meant here.

- reorganise the test after calling stmmac_hwif_init() so that we
  handle the error case in the indented code, and the success case
  with no indent, which is the classical arrangement.

 drivers/net/ethernet/stmicro/stmmac/common.h |   3 +
 drivers/net/ethernet/stmicro/stmmac/hwif.c   | 166 +++++++++++++++------------
 2 files changed, 98 insertions(+), 71 deletions(-)
 
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
