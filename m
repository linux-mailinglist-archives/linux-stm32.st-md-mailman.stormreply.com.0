Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C1AA86BC3
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Apr 2025 10:05:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26179C78F77;
	Sat, 12 Apr 2025 08:05:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE46DC78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UHYHoHYB3kC5RVvuD/SFjezcUsEDtCLBmv9TeE4pFp8=; b=wuFfUaBq04t6k0J4ocBtzQaUo1
 /e1YBvGDsfOIgmtsvhQ8J94oQXM7aQbfVQ8z+Cd9BeDq5Q4c+FOOzEGYwQD2LOmj6wJq8QLcU8aLQ
 7yoMeW9SMZZnRqS9PY5FQIDzrxVRNbBGZV9MYBiFY2BmTddur76PVk27cBRE13a8QKe9hmf6Fb5k3
 fviD/akVGnAYlTgYKhBuCJOqSNQh9nMEPEoYuKuInV0pE1W27QaMUS5uwaaLe8qdram+JodPp/4eI
 OEpSoxjF/U49q/u25tE2lgYZc1p4xNrcqBXnw0Y2oe4AS9PRpLK7OZ3SON7Mcy3ucWUUZAbYOdzdI
 BkZ3KCLQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55788)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u3Vrx-0004LU-2T;
 Sat, 12 Apr 2025 09:05:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u3Vru-0005V8-06;
 Sat, 12 Apr 2025 09:05:38 +0100
Date: Sat, 12 Apr 2025 09:05:37 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Thierry Reding <treding@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] =?iso-8859-1?q?=5BPATCH_net-next_v2_0/5=5D_net=3A_s?=
 =?iso-8859-1?q?tmmac=3A_remove_unnecessary_initialisation_of_1=B5s_TIC_co?=
 =?iso-8859-1?q?unter?=
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

In commit 8efbdbfa9938 ("net: stmmac: Initialize MAC_ONEUS_TIC_COUNTER
register"), code to initialise the LPI 1us counter in dwmac4's
initialisation was added, making the initialisation in glue drivers
unnecessary. This series cleans up the now redundant initialisation.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 24 +---------------------
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c |  9 --------
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |  8 --------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  1 -
 include/linux/stmmac.h                             |  1 -
 5 files changed, 1 insertion(+), 42 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
