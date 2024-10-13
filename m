Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD399C3B2
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2024 10:42:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4055AC78F63;
	Mon, 14 Oct 2024 08:42:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45035C78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Oct 2024 21:28:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6818A5C583A;
 Sun, 13 Oct 2024 21:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6994C4CED7;
 Sun, 13 Oct 2024 21:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728854877;
 bh=Wjx/+DPDuCDJsKobMzavDna+uVZd2lzCV/OOFYYHJFg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=tLkxWBVumkpwGqjS8BsRDIpzK7R4Ds8pYNgzXlkS/hryGvcUC+PKdEY3llXmt2w28
 fL2z99X+c7XPUpQlovPQVn3EofcwQ0ZDI7W2PJzI7DqUOmU6pGm1Q4ve8wiFkWDWgJ
 H525mtkIUj3hbdHKjOv4AIj/9c9iHTziz6FHqL1ksUP5Cpm8GteGZ+nt/Aup+Y9mPp
 +ErsOWEoNQ6lmRe4OHLNKAd8Bc2fzA+yWw11SZisVK/ZQmmXvtHRtNX4uXe8v+taPW
 eppdNHvOsX3qaaY3b5GLCMOTBobMeEQgBqQLeMyPjLonEIqOTCmW/9mRESUHlZ4R8+
 AmZ8SIXh0+3/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BC2C2CF258E;
 Sun, 13 Oct 2024 21:27:57 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 13 Oct 2024 23:27:39 +0200
MIME-Version: 1.0
Message-Id: <20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com>
References: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
In-Reply-To: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728854875; l=2138;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=DaDkzUPthYLXEW32SreKBO3MyQ9lanZalBFxpDCNQzE=;
 b=bo+RPMH3Mt3S1/zUl8ym396kld4wUMRFbTsLm5IgKWk0eKbfyTYScNWSGecqm9ZQqMjJk8ZEp
 qtga7k6oZDxDG2MG5OuboP6Z/O5hDkbWtDc3kFxhksvVJCx7PNcKAvX
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailman-Approved-At: Mon, 14 Oct 2024 08:42:52 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 04/16] net: phy: Add helper for mapping
 RGMII link speed to clock rate
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
Reply-To: jan.petrous@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The helper rgmii_clock() implemented Russel's hint during stmmac
glue driver review:

  > We seem to have multiple cases of very similar logic in lots of stmmac
  > platform drivers, and I think it's about time we said no more to this.
  > So, what I think we should do is as follows:
  >
  > add the following helper - either in stmmac, or more generically
  > (phylib? - in which case its name will need changing.)
  >
  > static long stmmac_get_rgmii_clock(int speed)
  > {
  >        switch (speed) {
  >        case SPEED_10:
  >                return 2500000;
  >
  >        case SPEED_100:
  >                return 25000000;
  >
  >        case SPEED_1000:
  >                return 125000000;
  >
  >        default:
  >                return -ENVAL;
  >        }
  > }
  >
  > Then, this can become:
  >
  >        long tx_clk_rate;
  >
  >        ...
  >
  >        tx_clk_rate = stmmac_get_rgmii_clock(speed);
  >        if (tx_clk_rate < 0) {
  >                dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
  >                return;
  >        }
  >
  >        ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);

Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 include/linux/phy.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index a98bc91a0cde..7f6d9e7533ce 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -298,6 +298,27 @@ static inline const char *phy_modes(phy_interface_t interface)
 	}
 }
 
+/**
+ * rgmii_clock - map link speed to the clock rate
+ * @speed: link speed value
+ *
+ * Description: maps RGMII supported link speeds
+ * into the clock rates.
+ */
+static inline long rgmii_clock(int speed)
+{
+	switch (speed) {
+	case SPEED_10:
+		return 2500000;
+	case SPEED_100:
+		return 25000000;
+	case SPEED_1000:
+		return 125000000;
+	default:
+		return -EINVAL;
+	}
+}
+
 #define PHY_INIT_TIMEOUT	100000
 #define PHY_FORCE_TIMEOUT	10
 

-- 
2.46.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
