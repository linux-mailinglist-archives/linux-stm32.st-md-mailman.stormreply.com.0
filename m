Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E424175A48
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Mar 2020 13:19:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CA8AC36B0B;
	Mon,  2 Mar 2020 12:19:02 +0000 (UTC)
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DCF3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 11:35:40 +0000 (UTC)
X-QQ-mid: bizesmtp19t1583148929tc3ukjdo
Received: from localhost.localdomain (unknown [218.76.23.26])
 by esmtp10.qq.com (ESMTP) with 
 id ; Mon, 02 Mar 2020 19:35:24 +0800 (CST)
X-QQ-SSF: 01400000002000N0KK40000A0000000
X-QQ-FEAT: HLwgFh8nePq/awm+WYZ6JZcvXzwTMkOv7zWhtJcrt5MK7H5uZaP6XKl730Crf
 ShSYmwOveql/ABkiZSaAox1Phau/v+o/FRCkOXfWnoWo7Rscu5YpHxRLDN6Y9XWScD2e6Zo
 Ewwg6WaaYkvnXu0rq0MwhlxvKG9Rb+Yk+ScAIsUmVbsjH8Mmm0VdiSPpipMl4q15jD5ZSID
 OzySyEX+gB30hVpNBEI2KilB2kNz0DfZadS5BG2rBBC+fC2+XSxDZRD0bsmERXfG2WqJ9x9
 wVZOwbZb+UCHhPjLd7B6Nmdj6zRC6M2OCAARaULNR9rJd1s9mgvPIBbPWqyvFP+grebh8jW
 Ui89fvb
X-QQ-GoodBg: 2
From: xiaolinkui <xiaolinkui@tj.kylinos.cn>
To: peppe.cavallaro@st.com,
	alexandre.torgue@st.com,
	joabreu@synopsys.com
Date: Mon,  2 Mar 2020 19:34:59 +0800
Message-Id: <20200302113459.22683-1-xiaolinkui@tj.kylinos.cn>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tj.kylinos.cn:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Mon, 02 Mar 2020 12:19:00 +0000
Cc: netdev@vger.kernel.org, xiaolinkui <xiaolinkui@tj.kylinos.cn>,
 davem@davemloft.net, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] net: stmmac: Abort loop after phydev is
	detected
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

A mac only needs at most one phydev, There is no need
to recycle the entire list after finding phydev.

Signed-off-by: xiaolinkui <xiaolinkui@tj.kylinos.cn>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index cfe5d8b73142..6fb87cc18d65 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -431,6 +431,9 @@ int stmmac_mdio_register(struct net_device *ndev)
 
 		phy_attached_info(phydev);
 		found = 1;
+
+		if (phydev->phy_id != 0)
+			goto bus_register_done;
 	}
 
 	if (!found && !mdio_node) {
-- 
2.17.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
