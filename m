Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 933ACC06517
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 14:49:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AF68C5F1E0;
	Fri, 24 Oct 2025 12:49:34 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8485BC5F1DF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GYa1n3ROase+LapnQKxZJAF4u1UpN7+HlpMRVAW9AtM=; b=nrh8Jo4WbpxCA0qRREq3GkVlYx
 tjn6ZR60er7PJ5xvRh21mh69WQEdto5Q7L3qME2oATTnBsj9d6oh+VMkQgB+CNkKWl4cCW5rA+AGB
 K9Z8cJrKBgbgOBj35VSbTWdqz9d3mVy8phE+EVXFHUjEQ7SU3b4mNzTJjLryhjo+xaK+BxScWDnUh
 fJfAgPeeWa3In8IjF3x6BeASzWowoJ2M2/j+DddpGAgRcD5udxgshJ/tHAdbxYc8g4JA+ibpxYaPb
 HXhyDCq4ybydl+HbRLa00cngy+JbEnjXM+RaiIDmRZj911szCjT34wWjcz9RCxoFD4env+D9qYBye
 H04eqKDg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56360 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vCHEU-000000007au-1vC4;
 Fri, 24 Oct 2025 13:49:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vCHET-0000000BPU4-2f0F; Fri, 24 Oct 2025 13:49:25 +0100
In-Reply-To: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vCHET-0000000BPU4-2f0F@rmk-PC.armlinux.org.uk>
Date: Fri, 24 Oct 2025 13:49:25 +0100
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 5/8] net: stmmac: use FIELD_GET()
 for version register
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

Provide field definitions in common.h, and use these with FIELD_GET()
to extract the fields from the version register.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h | 3 +++
 drivers/net/ethernet/stmicro/stmmac/hwif.c   | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 31254ba525d5..a89fe25f1837 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -26,6 +26,9 @@
 #include "hwif.h"
 #include "mmc.h"
 
+#define DWMAC_SNPSVER	GENMASK_U32(7, 0)
+#define DWMAC_USERVER	GENMASK_U32(15, 8)
+
 /* Synopsys Core versions */
 #define	DWMAC_CORE_3_40		0x34
 #define	DWMAC_CORE_3_50		0x35
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index c156edb54ae6..78362cf656f2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -43,12 +43,12 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 	}
 
 	dev_info(priv->device, "User ID: 0x%x, Synopsys ID: 0x%x\n",
-		 (unsigned int)(version & GENMASK(15, 8)) >> 8,
-		 (unsigned int)(version & GENMASK(7, 0)));
+		 FIELD_GET(DWMAC_USERVER, version),
+		 FIELD_GET(DWMAC_SNPSVER, version));
 
-	ver->snpsver = version & GENMASK(7, 0);
+	ver->snpsver = FIELD_GET(DWMAC_SNPSVER, version);
 	if (core_type == DWMAC_CORE_XGMAC)
-		ver->dev_id = (version & GENMASK(15, 8)) >> 8;
+		ver->dev_id = FIELD_GET(DWMAC_USERVER, version);
 }
 
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
