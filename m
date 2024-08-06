Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F87948D3D
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 12:52:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2E96C71290;
	Tue,  6 Aug 2024 10:52:18 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B8B7C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 10:52:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6503FCE0E50;
 Tue,  6 Aug 2024 10:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A801C32786;
 Tue,  6 Aug 2024 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722941528;
 bh=+al5FmN+16P24jfwWkecabgEd+xqc7Jwsjs9HXuUbLk=;
 h=From:Date:Subject:To:Cc:From;
 b=V84xQF8WVMRn5GhPF31w6xnhf43JeB3DthohuV5AVuCLVj88AtBm6+BTKq8fkyReE
 WcaMuePO+aQn+mODpPaKBKFG9zt2JiIQAUyWJ3sKq2mYfNALh607fH+UiGmnKcJZqZ
 L5fVHFawgDE0fJuMMaVCfv9cSqv5HC6dE067ZlC5hYzi9rpucGdBHHMzsBVDWjzS/x
 5980q/y7dTm7s9ez/ZKetHlv6XXTMPaKq0oTcH1oeO2BZOfUdm7zOl3C6+3F/aA5wi
 RWkMvfsDJm6VcP5e30cMNBLYyAuT9dTo5CVlRbxSZJU++lzl+RT7sRehkuy1qjn4F8
 UCiro8FbDQiqw==
From: Simon Horman <horms@kernel.org>
Date: Tue, 06 Aug 2024 11:52:01 +0100
MIME-Version: 1.0
Message-Id: <20240806-xgmac-const-char-arrays-v1-1-8d91ec885d45@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFAAsmYC/x2MQQqDMBAAvyJ77kJMQyP9ivQQ49buoavsBomIf
 2/ocWBmTjBSJoNnd4LSzsarNOhvHeRPkoWQ58bgnQ9ucA+syzdlzKtYwWYoJtV0GIbYz8Pdxyn
 EDK3elN5c/+cRhAoK1QKv6/oBrfzMJnMAAAA=
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.14.0
Cc: netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: xgmac: use const char
 arrays for string constants
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

Jiri Slaby advises me that the preferred mechanism for declaring
string constants is static char arrays, so use that here.

This mostly reverts
commit 1692b9775e74 ("net: stmmac: xgmac: use #define for string constants")

That commit was a fix for
commit 46eba193d04f ("net: stmmac: xgmac: fix handling of DPP safety error for DMA channels").
The fix being replacing const char * with #defines in order to address
compilation failures observed on GCC 6 through 10.

Compile tested only.
No functional change intended.

Suggested-by: Jiri Slaby <jirislaby@kernel.org>
Link: https://lore.kernel.org/netdev/485dbc5a-a04b-40c2-9481-955eaa5ce2e2@kernel.org/
Signed-off-by: Simon Horman <horms@kernel.org>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 69 +++++++++++-----------
 1 file changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index f196cd99d510..cbf2dd976ab1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -846,42 +846,41 @@ static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {
 	{ false, "UNKNOWN", "Unknown Error" }, /* 31 */
 };
 
-#define DPP_RX_ERR "Read Rx Descriptor Parity checker Error"
-#define DPP_TX_ERR "Read Tx Descriptor Parity checker Error"
-
+static const char dpp_rx_err[] = "Read Rx Descriptor Parity checker Error";
+static const char dpp_tx_err[] = "Read Tx Descriptor Parity checker Error";
 static const struct dwxgmac3_error_desc dwxgmac3_dma_dpp_errors[32] = {
-	{ true, "TDPES0", DPP_TX_ERR },
-	{ true, "TDPES1", DPP_TX_ERR },
-	{ true, "TDPES2", DPP_TX_ERR },
-	{ true, "TDPES3", DPP_TX_ERR },
-	{ true, "TDPES4", DPP_TX_ERR },
-	{ true, "TDPES5", DPP_TX_ERR },
-	{ true, "TDPES6", DPP_TX_ERR },
-	{ true, "TDPES7", DPP_TX_ERR },
-	{ true, "TDPES8", DPP_TX_ERR },
-	{ true, "TDPES9", DPP_TX_ERR },
-	{ true, "TDPES10", DPP_TX_ERR },
-	{ true, "TDPES11", DPP_TX_ERR },
-	{ true, "TDPES12", DPP_TX_ERR },
-	{ true, "TDPES13", DPP_TX_ERR },
-	{ true, "TDPES14", DPP_TX_ERR },
-	{ true, "TDPES15", DPP_TX_ERR },
-	{ true, "RDPES0", DPP_RX_ERR },
-	{ true, "RDPES1", DPP_RX_ERR },
-	{ true, "RDPES2", DPP_RX_ERR },
-	{ true, "RDPES3", DPP_RX_ERR },
-	{ true, "RDPES4", DPP_RX_ERR },
-	{ true, "RDPES5", DPP_RX_ERR },
-	{ true, "RDPES6", DPP_RX_ERR },
-	{ true, "RDPES7", DPP_RX_ERR },
-	{ true, "RDPES8", DPP_RX_ERR },
-	{ true, "RDPES9", DPP_RX_ERR },
-	{ true, "RDPES10", DPP_RX_ERR },
-	{ true, "RDPES11", DPP_RX_ERR },
-	{ true, "RDPES12", DPP_RX_ERR },
-	{ true, "RDPES13", DPP_RX_ERR },
-	{ true, "RDPES14", DPP_RX_ERR },
-	{ true, "RDPES15", DPP_RX_ERR },
+	{ true, "TDPES0", dpp_tx_err },
+	{ true, "TDPES1", dpp_tx_err },
+	{ true, "TDPES2", dpp_tx_err },
+	{ true, "TDPES3", dpp_tx_err },
+	{ true, "TDPES4", dpp_tx_err },
+	{ true, "TDPES5", dpp_tx_err },
+	{ true, "TDPES6", dpp_tx_err },
+	{ true, "TDPES7", dpp_tx_err },
+	{ true, "TDPES8", dpp_tx_err },
+	{ true, "TDPES9", dpp_tx_err },
+	{ true, "TDPES10", dpp_tx_err },
+	{ true, "TDPES11", dpp_tx_err },
+	{ true, "TDPES12", dpp_tx_err },
+	{ true, "TDPES13", dpp_tx_err },
+	{ true, "TDPES14", dpp_tx_err },
+	{ true, "TDPES15", dpp_tx_err },
+	{ true, "RDPES0", dpp_rx_err },
+	{ true, "RDPES1", dpp_rx_err },
+	{ true, "RDPES2", dpp_rx_err },
+	{ true, "RDPES3", dpp_rx_err },
+	{ true, "RDPES4", dpp_rx_err },
+	{ true, "RDPES5", dpp_rx_err },
+	{ true, "RDPES6", dpp_rx_err },
+	{ true, "RDPES7", dpp_rx_err },
+	{ true, "RDPES8", dpp_rx_err },
+	{ true, "RDPES9", dpp_rx_err },
+	{ true, "RDPES10", dpp_rx_err },
+	{ true, "RDPES11", dpp_rx_err },
+	{ true, "RDPES12", dpp_rx_err },
+	{ true, "RDPES13", dpp_rx_err },
+	{ true, "RDPES14", dpp_rx_err },
+	{ true, "RDPES15", dpp_rx_err },
 };
 
 static void dwxgmac3_handle_dma_err(struct net_device *ndev,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
