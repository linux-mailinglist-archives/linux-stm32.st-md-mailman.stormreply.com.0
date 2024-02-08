Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5849684DE66
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Feb 2024 11:35:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 094ACC6C83F;
	Thu,  8 Feb 2024 10:35:47 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 076D6C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Feb 2024 10:35:45 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1707388545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O8FbyMLRAf0MPPkiZw7u/45AM7lfLrYJ9PmRTbq1LVE=;
 b=i1R6VbZadJXN4evezJU3+AfnzMNV8Ufv037Ye1lMlAU9W4BqV73Bl3olyJhF/UfVyyYm6i
 AzvxBaW9KTA23MIUOn/NPVJwTv6qyNIbM5GkDnOZN58ZDzhFka16o0mD6quoKyJddMEwr5
 EgLxYUwWxj9BZJ5nunC0tC8jxNuyUFEM+iAhE/CKiQBBxy07+/B3iID+Q5OEeufDLVljee
 pIJv8Z0FU08xpDSjfABqFuCITnCZpwrSo1/F81WPlK69tYSnmTKbnGXSrZisfwSrLXSnDc
 JGFzfsjYKIOdYEcjBPWcDb+BlK0elp9oqI44Mfl/f3grZAVn2a6ImzpVb8rRrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1707388545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O8FbyMLRAf0MPPkiZw7u/45AM7lfLrYJ9PmRTbq1LVE=;
 b=rVNmJZsoRL/7zc5amA+WEs/jUMej37PPpGOnmELL1OLBfqFWEzbFhYOwpGRrZZ/G8yTA83
 nLpKpS9US8okTlAQ==
Date: Thu, 08 Feb 2024 11:35:25 +0100
MIME-Version: 1.0
Message-Id: <20240208-stmmac_irq-v1-1-8bab236026d4@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAGyuxGUC/x2N0QrCMAwAf2Xk2UItzlZ/RUSymrk8NGpSZDD27
 +t8PI7jFjBSJoNrt4DSj43f0uB46CBPKC9y/GwMwYeTDz45q6VgfrB+XR/PKYwYY8oXaMGARm5
 QlDztSUGrpLv4KI08/y83EKpOaK5wX9cNWvkro38AAAA=
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321; i=kurt@linutronix.de;
 h=from:subject:message-id; bh=XYU8UThxyVM/BmRkaWbkfJ/UUWs7MkJRNJWR7CTFe+g=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBlxK6Atb08JaTdEHu7F+d5W5Op9N65/uLVyQhBt
 IlsR7kKKRaJAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCZcSugAAKCRDBk9HyqkZz
 gm5XD/43iUUdoU4KgOL+dc14oqp3MKYJwu278fwqFSQWR8q9etX6XukXKnNp3QFfDet2+nwrCk/
 vjO93JpRiaL3UBsxrw6pljF1hAPwdfPHFOsk1WAXFRXvc4V5/RSjskdxOTbuBOexmPhvTph+gpg
 p19k8FVIEwnao1Zw/MVpslZNGW5DbLCwNIxnqVvoKjXkd/3WUrMEvWdCj/Lg3gIYjewXJbx9jxB
 9SnDFqMHN8diP4ybcS7xsnt3drAOiKaLsdhu8O8ID7VaMyj2j8UfJSZ/lUgAr6TgmFN/dJ1w3Q/
 PVWOH2blV0Md9Pf45U0Hivc632odzpInvaMOv1eHtrGeIHWM/7vVsNZXWW3BgYZDjAqrH1emM/Q
 8s7IzXLytvKO2DOMxCjgewx5OXOo5UW5KGQHN5XDXmqGGmpT/RiowcQBZUHrob6sbbl0je/x4T/
 VMKeZk97xA4z7xI03rEvsobCWDuSe67eTBA8W9+9PfN3xqTom8f2ImjasCQ0GRj/ZswRyEP70Om
 qBDrd6+Ss1mXosZu9kNYNkX1jtZ9PTaMnVGEgBSYoV2Rg7TcwjByMMDZGLC9qQkGwfbHKYrZXhZ
 kTSBuR8RTMpi1CLXy9MuJTPSf8+pU5XJPqtUkN1O4qekO+WwtZYY4HWnmjKWGeYCqITAtCNQoI1
 BlWB4xJLbkdMK0g==
X-Developer-Key: i=kurt@linutronix.de; a=openpgp;
 fpr=BCB9BFB2C8C37DD3DFDB5992C193D1F2AA467382
Cc: Yannick Vignon <yannick.vignon@nxp.com>, netdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: Simplify mtl IRQ status
	checking
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

Commit 8a7cb245cf28 ("net: stmmac: Do not enable RX FIFO overflow
interrupts") disabled the RX FIFO overflow interrupts. However, it left the
status variable around, but never checks it.

As stmmac_host_mtl_irq_status() returns only 0 now, the code can be
simplified.

Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 04d817dc5899..10ce2f272b62 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6036,10 +6036,8 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 				priv->tx_path_in_lpi_mode = false;
 		}
 
-		for (queue = 0; queue < queues_count; queue++) {
-			status = stmmac_host_mtl_irq_status(priv, priv->hw,
-							    queue);
-		}
+		for (queue = 0; queue < queues_count; queue++)
+			stmmac_host_mtl_irq_status(priv, priv->hw, queue);
 
 		/* PCS link status */
 		if (priv->hw->pcs &&

---
base-commit: 006e89649fa913e285b931f1b8dfd6485d153ca7
change-id: 20240208-stmmac_irq-57682fa778c9

Best regards,
-- 
Kurt Kanzenbach <kurt@linutronix.de>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
