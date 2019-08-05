Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B00822B0
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2019 18:45:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3462BC2402E;
	Mon,  5 Aug 2019 16:45:35 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (unknown [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77053C35E0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2019 16:45:31 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9EE9BC01AA;
 Mon,  5 Aug 2019 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1565023529; bh=aTDnCXcniV6uvBzYE58A0TIJ6PhSk7VA//+4NwG8t7k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=VZ3nhSd25VX1ZTWVBt76NJf/dbL5rJJvKCDZbo84nMneh3Y9RKrJ+zMM7lIDRvE6M
 FfhcpHthvaLjryhS85Ub/Lz9W/GlSGepfwy6B+uod38DJHf5CGBhOjThsgDDh0Wc/X
 6HPL/vRUZZdxQ+EKv1hhPV90jlIFIrBI/rFQ57OEywiS5N/wcpcZr97afr7DLlacII
 tRoxEieG8rgWO88xGLGc7jLTxOQhKPFOz9HrVE+8H6wer9BZtLuggIkD48A9BpHb0k
 wiepy3aucbK6a0ClVrgwRtqkOyQpp/8F7YJ1fFaTNApGHEC5aYwJ946em5XbseFddC
 TKdw2mByKGdzg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 64B02A0074;
 Mon,  5 Aug 2019 16:45:27 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon,  5 Aug 2019 18:44:34 +0200
Message-Id: <060d0e29c13f75123d8dfa17de5fcbb679048fc7.1565022597.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1565022597.git.joabreu@synopsys.com>
References: <cover.1565022597.git.joabreu@synopsys.com>
In-Reply-To: <cover.1565022597.git.joabreu@synopsys.com>
References: <cover.1565022597.git.joabreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 07/26] net: stmmac: selftests: Add
	RSS test
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

Add a test for RSS in the stmmac selftests.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>
---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index a97b1ea76438..83b775a8cedc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -700,6 +700,21 @@ static int stmmac_test_flowctrl(struct stmmac_priv *priv)
 	return ret;
 }
 
+static int stmmac_test_rss(struct stmmac_priv *priv)
+{
+	struct stmmac_packet_attrs attr = { };
+
+	if (!priv->dma_cap.rssen || !priv->rss.enable)
+		return -EOPNOTSUPP;
+
+	attr.dst = priv->dev->dev_addr;
+	attr.exp_hash = true;
+	attr.sport = 0x321;
+	attr.dport = 0x123;
+
+	return __stmmac_test_loopback(priv, &attr);
+}
+
 #define STMMAC_LOOPBACK_NONE	0
 #define STMMAC_LOOPBACK_MAC	1
 #define STMMAC_LOOPBACK_PHY	2
@@ -745,6 +760,10 @@ static const struct stmmac_test {
 		.name = "Flow Control         ",
 		.lb = STMMAC_LOOPBACK_PHY,
 		.fn = stmmac_test_flowctrl,
+	}, {
+		.name = "RSS                  ",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_rss,
 	},
 };
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
