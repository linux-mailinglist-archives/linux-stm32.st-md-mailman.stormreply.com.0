Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D096AC4DF0
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 13:56:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC3C4C36B1E;
	Tue, 27 May 2025 11:56:48 +0000 (UTC)
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch
 [185.125.25.12])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28AD6C36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 11:56:47 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch
 [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4b6B1p536tzjYD;
 Tue, 27 May 2025 13:56:46 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4b6B1m5HnLzfFg; Tue, 27 May 2025 13:56:44 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 27 May 2025 13:56:23 +0200
MIME-Version: 1.0
Message-Id: <20250527-stmmac-mdio-bus_id-v2-1-a5ca78454e3c@cherry.de>
X-B4-Tracking: v=1; b=H4sIAGaoNWgC/32NQQ6CMBBFr0Jm7RimlSCuvIchprSDnUXBtJVIC
 He34QAu3//572+QOAonuFUbRF4kyTwVUKcKrDfTi1FcYVC1aupGEaYcgrEYnMw4fNJTHGrSQ3u
 xbdtpDWX4jjzK95A+YOIMfQm9pDzH9Tha6Kj+ORdCwo6uRluiYVT2bj3HuJ4dQ7/v+w+TF1Rru
 QAAAA==
X-Change-ID: 20250521-stmmac-mdio-bus_id-313b74c77933
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
Cc: Heiko Stuebner <heiko@sntech.de>,
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2] net: stmmac: platform: guarantee
 uniqueness of bus_id
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

From: Quentin Schulz <quentin.schulz@cherry.de>

bus_id is currently derived from the ethernetX alias. If one is missing
for the device, 0 is used. If ethernet0 points to another stmmac device
or if there are 2+ stmmac devices without an ethernet alias, then bus_id
will be 0 for all of those.

This is an issue because the bus_id is used to generate the mdio bus id
(new_bus->id in drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
stmmac_mdio_register) and this needs to be unique.

This allows to avoid needing to define ethernet aliases for devices with
multiple stmmac controllers (such as the Rockchip RK3588) for multiple
stmmac devices to probe properly.

Obviously, the bus_id isn't guaranteed to be stable across reboots if no
alias is set for the device but that is easily fixed by simply adding an
alias if this is desired.

Fixes: 25c83b5c2e82 ("dt:net:stmmac: Add support to dwmac version 3.610 and 3.710")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Unsure if I should cc stable since people who encountered that issue for
sure had to add an ethernet alias to make things work with their DT so
shouldn't be too much of an actual issue?

Based on Paolo's feedback, have a Fixes tag regardless of the answer to
the above question.
---
Changes in v2:
- added Fixes tag,
- Link to v1: https://lore.kernel.org/r/20250521-stmmac-mdio-bus_id-v1-1-918a3c11bf2c@cherry.de
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index c73eff6a56b87a3783c91b2ffbf5807a27df303f..15205a47cafc276442c3759a36d115d8da1fe51d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -430,6 +430,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	struct device_node *np = pdev->dev.of_node;
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_dma_cfg *dma_cfg;
+	static int bus_id = -ENODEV;
 	int phy_mode;
 	void *ret;
 	int rc;
@@ -465,8 +466,14 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	of_property_read_u32(np, "max-speed", &plat->max_speed);
 
 	plat->bus_id = of_alias_get_id(np, "ethernet");
-	if (plat->bus_id < 0)
-		plat->bus_id = 0;
+	if (plat->bus_id < 0) {
+		if (bus_id < 0)
+			bus_id = of_alias_get_highest_id("ethernet");
+		/* No ethernet alias found, init at -1 so first bus_id is 0 */
+		if (bus_id < 0)
+			bus_id = -1;
+		plat->bus_id = ++bus_id;
+	}
 
 	/* Default to phy auto-detection */
 	plat->phy_addr = -1;

---
base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
change-id: 20250521-stmmac-mdio-bus_id-313b74c77933

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
