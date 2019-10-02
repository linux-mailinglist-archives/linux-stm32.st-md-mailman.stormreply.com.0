Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6641C4826
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2019 09:14:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B4B4C36B0B;
	Wed,  2 Oct 2019 07:14:02 +0000 (UTC)
Received: from smtp.cellavision.se (smtp.cellavision.se [84.19.140.14])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 390ACC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2019 07:07:46 +0000 (UTC)
Received: from DRCELLEX03.cellavision.se (172.16.169.12) by
 DRCELLEX03.cellavision.se (172.16.169.12) with Microsoft SMTP Server (TLS) id
 15.0.1044.25; Wed, 2 Oct 2019 09:07:46 +0200
Received: from ITG-CEL-24768.cellavision.se (10.230.0.148) by
 DRCELLEX03.cellavision.se (172.16.169.12) with Microsoft SMTP Server id
 15.0.1044.25 via Frontend Transport; Wed, 2 Oct 2019 09:07:46 +0200
From: Hans Andersson <haan@cellavision.se>
To: <mcoquelin.stm32@gmail.com>
Date: Wed, 2 Oct 2019 09:07:21 +0200
Message-ID: <20191002070721.9916-1-haan@cellavision.se>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:14:02 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 joabreu@synopsys.com, peppe.cavallaro@st.com,
 Hans Andersson <hans.andersson@cellavision.se>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Read user ID muliple times if
	needed.
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

From: Hans Andersson <hans.andersson@cellavision.se>

When we read user ID / Synopsys ID we might still be in reset,
so read muliple times if needed.

Signed-off-by: Hans Andersson <hans.andersson@cellavision.se>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 6c61b75..3347164 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -10,7 +10,16 @@
 
 static u32 stmmac_get_id(struct stmmac_priv *priv, u32 id_reg)
 {
-	u32 reg = readl(priv->ioaddr + id_reg);
+	u32 reg;
+	int i;
+
+	/* We might still be in reset when we read, */
+	/* so read multiple times if needed. */
+	for (i = 0; i < 10; i++) {
+		reg = readl(priv->ioaddr + id_reg);
+		if (reg)
+			break;
+	}
 
 	if (!reg) {
 		dev_info(priv->device, "Version ID not available\n");
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
