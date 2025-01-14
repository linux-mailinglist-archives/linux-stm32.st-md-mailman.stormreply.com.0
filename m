Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2F6A1084F
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 15:02:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0133C78031;
	Tue, 14 Jan 2025 14:02:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B5DDC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yqNVbj3MVpY+7D9FsZ5FX3gjtvbIvX8GZPT80w1IszY=; b=Pt5ComHYAT8jrYVdXgPrySpmIW
 PTSfYjaRUYWjIAsO3ddwCOChjjOzU2oB5Qpzwa81UBEfeWUANGTwY4ZpO1o9Dfnm645Wmcwfdel98
 p1ZtZkEqW7NH89+LcQwtmH/0NrN660g39goEhZ+RKrVQ8v3NQb+TQRxDQS/cQKG9rKiYgPtuKRIDK
 jesRd8nbkGXSw17LnzGJ5eqYNNEgJFaJz+2KtSSBdfTJYu5c7X2Lzf73JSE101tP3bYdM+N4mLheH
 GwUXwHrttaQdAl3FvUQgkd0gNTPl5kUjVt7eGOQVsqsZrsAYmxFuYbVp41yvbiXI4iIJ5bEhE/Fja
 SBZHcasg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47342 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tXhUs-00088k-34;
 Tue, 14 Jan 2025 14:02:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tXhUZ-000n0G-W1; Tue, 14 Jan 2025 14:02:04 +0000
In-Reply-To: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
References: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tXhUZ-000n0G-W1@rmk-PC.armlinux.org.uk>
Date: Tue, 14 Jan 2025 14:02:03 +0000
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>, UNGLinuxDriver@microchip.com,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 01/10] net: mdio: add definition
 for clock stop capable bit
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

Add a definition for the clock stop capable bit in the PCS MMD. This
bit indicates whether the MAC is able to stop the transmit xMII clock
while it is signalling LPI.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/uapi/linux/mdio.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/mdio.h b/include/uapi/linux/mdio.h
index f0d3f268240d..6975f182b22c 100644
--- a/include/uapi/linux/mdio.h
+++ b/include/uapi/linux/mdio.h
@@ -125,6 +125,7 @@
 #define MDIO_STAT1_LPOWERABLE		0x0002	/* Low-power ability */
 #define MDIO_STAT1_LSTATUS		BMSR_LSTATUS
 #define MDIO_STAT1_FAULT		0x0080	/* Fault */
+#define MDIO_PCS_STAT1_CLKSTOP_CAP	0x0040
 #define MDIO_AN_STAT1_LPABLE		0x0001	/* Link partner AN ability */
 #define MDIO_AN_STAT1_ABLE		BMSR_ANEGCAPABLE
 #define MDIO_AN_STAT1_RFAULT		BMSR_RFAULT
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
