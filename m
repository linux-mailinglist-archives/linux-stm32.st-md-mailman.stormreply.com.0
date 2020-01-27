Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0581C14A2A1
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2020 12:09:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B321CC36B1E;
	Mon, 27 Jan 2020 11:09:38 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (sv2-smtprelay2.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5CBAC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 11:09:36 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 30CF8407A1;
 Mon, 27 Jan 2020 11:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1580123375; bh=NixIYL9DJLQ1EjTICLfMWuieQcujDdoMHw59TKyyS8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=TfOTD3c61jySU590rkw/WFPmnX4b3Yp1lziig60p8MtXl/WVBNxXo6Eesngx+eomY
 QwzQcFIQEBQT5yFCCWbIYUgPd/Gf6bquxFUnrJzgLahK/AMKBrYhn8TK8iXfLEXQBE
 1uWntPc45cgt/P611nE6So2fe0aScGXMFPM9bvqOQK+xi9p5SBRa9J6PnCYtBUNmbb
 B+kXNx8qSeg2RXFaVHbaPzhvqv6jX8y9HInABcF+DsAvrx3OX/rpSknvCBn4nMkS57
 R129Qv3KRyueOvdsntraQascjwgfEXhYZJco/6HdkiKXUdmHHeyx6SIr0d9ysgYuFa
 sZWoAJcRwq+Bg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id BD0F3A009B;
 Mon, 27 Jan 2020 11:09:28 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon, 27 Jan 2020 12:09:11 +0100
Message-Id: <9a2136885d9a892ff170be88fdffeda82c778a10.1580122909.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1580122909.git.Jose.Abreu@synopsys.com>
References: <cover.1580122909.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1580122909.git.Jose.Abreu@synopsys.com>
References: <cover.1580122909.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Joao Pinto <Joao.Pinto@synopsys.com>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [RFC net-next 6/8] net: phylink: Configure MAC/PCS
	when link is up without PHY
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

When we don't have any real PHY driver connected and we get link up from
PCS we shall configure MAC and PCS for the desired speed and also
resolve the flow control settings from MAC side.

Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/phy/phylink.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 4174d874b1f7..75dbaf80d7a5 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -533,10 +533,20 @@ static void phylink_resolve(struct work_struct *w)
 
 	if (link_changed) {
 		pl->old_link_state = link_state.link;
-		if (!link_state.link)
+		if (!link_state.link) {
 			phylink_mac_link_down(pl);
-		else
+		} else {
+			/* If no PHY is connected, we still need to configure
+			 * MAC/PCS for flow control and speed.
+			 */
+			if (!pl->phydev) {
+				phylink_resolve_flow(pl, &link_state);
+				phylink_mac_config(pl, &link_state);
+			}
+
 			phylink_mac_link_up(pl, link_state);
+		}
+
 	}
 	if (!link_state.link && pl->mac_link_dropped) {
 		pl->mac_link_dropped = false;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
