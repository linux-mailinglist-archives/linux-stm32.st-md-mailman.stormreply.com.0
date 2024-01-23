Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EB783898A
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jan 2024 09:50:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FE49C6DD6C;
	Tue, 23 Jan 2024 08:50:50 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AC19C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 08:50:49 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-6e0a64d9449so2636849a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 00:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705999848; x=1706604648;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FNB6nZlr/06kPBlEqaF8a61wrkKCAoA4BnsL6cXaDrQ=;
 b=bL/JxmtBydRrxuku2RPKi2fyoiZS5Cj8xyrK4dfUAHuYz6bMafG0H6FAUB+WzPUJTt
 ViODAF6x0zmuLTDr4ii9hH3BTaYxGxTyJASZIDYXRm7GeB8JyJT+8L0DOjLu9ceh5dXC
 hGE7/hybK3HtcGmn68KnzPjkty5BCwCS7UO+M4rPe1ITfCbfdfE9wDKYGoMg61GZv1/w
 G6dW70yXp2iRiHG/ywASEghBDHKKXzxh7szU5C+cCxwUzfeR/hhAXkoF2rvIf5dNaYQV
 T8Gx9zhnTwLDJRJeXh1lhBOQjN/VVnL+4XCUlzdPiktU6gN8q4aSQ/ZHpso2mcoH6O4W
 k2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705999848; x=1706604648;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FNB6nZlr/06kPBlEqaF8a61wrkKCAoA4BnsL6cXaDrQ=;
 b=m69sFKzL2cAdQnvw1C7+3aIQsHgWlGcnFROEARsTV3Vkc95BRHvOBNW05WNnE7s31r
 BUwtlXwkjtrzdHBnlMAqHhs0MzJwq6Z796pK3+Glm388XagtsaES2pPSb8ZuqJIv9Z1z
 o4F7V5agJSG4FnWdQ8fUhYV0/b6uTr/f9Xd8OYyhSKGGamV0dlBF+Hd+FfaL7JJqb//C
 sUjipzEIF8/7YUGKx6RWP3+Z6aycpxBXkTwL/H+ZRBjrv0KY8601utTt7SBAKlaFNq6q
 jjHrIJak26cg6ddSRGLHudDCnB45c7NzBoD2rdXj13WGR4q4t0kzvl2meskAuM5VFzhc
 SeWQ==
X-Gm-Message-State: AOJu0YziZ01PyRTEfhz3NbBg9BnewPUnaxkvwucbETzZmeV76Ahwms42
 3L0H07WSgQ16hRCfKDKp2Bf4Z3fmjy2ayBFi+WfoCv7pTnpBJ1sj
X-Google-Smtp-Source: AGHT+IHRKZzHqJsuxlpfoRfWi87C1N58CDPLVDywt+3AVD3QL8TKT2ebBbKukW0im0MhyVmjRuztlw==
X-Received: by 2002:a05:6830:1e2d:b0:6dc:8dfb:3a86 with SMTP id
 t13-20020a0568301e2d00b006dc8dfb3a86mr5969046otr.15.1705999847791; 
 Tue, 23 Jan 2024 00:50:47 -0800 (PST)
Received: from localhost.localdomain ([112.65.140.130])
 by smtp.googlemail.com with ESMTPSA id
 w70-20020a638249000000b005cf88b016cesm9626322pgd.72.2024.01.23.00.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 00:50:47 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>
Date: Tue, 23 Jan 2024 16:50:37 +0800
Message-Id: <20240123085037.939471-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix safety error
	descriptions
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

Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
XGMAC core") prints safety error descriptions when safety error assert,
but missed some special errors, and mixed correctable errors and
uncorrectable errors together.
This patch complete the error code list and print the type of errors.

Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index eb48211d9b0e..ad812484059e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -748,29 +748,29 @@ static void dwxgmac3_handle_mac_err(struct net_device *ndev,
 }
 
 static const struct dwxgmac3_error_desc dwxgmac3_mtl_errors[32]= {
-	{ true, "TXCES", "MTL TX Memory Error" },
+	{ true, "TXCES", "MTL TX Memory Correctable Error" },
 	{ true, "TXAMS", "MTL TX Memory Address Mismatch Error" },
-	{ true, "TXUES", "MTL TX Memory Error" },
+	{ true, "TXUES", "MTL TX Memory Uncorrectable Error" },
 	{ false, "UNKNOWN", "Unknown Error" }, /* 3 */
-	{ true, "RXCES", "MTL RX Memory Error" },
+	{ true, "RXCES", "MTL RX Memory Correctable Error" },
 	{ true, "RXAMS", "MTL RX Memory Address Mismatch Error" },
-	{ true, "RXUES", "MTL RX Memory Error" },
+	{ true, "RXUES", "MTL RX Memory Uncorrectable Error" },
 	{ false, "UNKNOWN", "Unknown Error" }, /* 7 */
-	{ true, "ECES", "MTL EST Memory Error" },
+	{ true, "ECES", "MTL EST Memory Correctable Error" },
 	{ true, "EAMS", "MTL EST Memory Address Mismatch Error" },
-	{ true, "EUES", "MTL EST Memory Error" },
+	{ true, "EUES", "MTL EST Memory Uncorrectable Error" },
 	{ false, "UNKNOWN", "Unknown Error" }, /* 11 */
-	{ true, "RPCES", "MTL RX Parser Memory Error" },
+	{ true, "RPCES", "MTL RX Parser Memory Correctable Error" },
 	{ true, "RPAMS", "MTL RX Parser Memory Address Mismatch Error" },
-	{ true, "RPUES", "MTL RX Parser Memory Error" },
+	{ true, "RPUES", "MTL RX Parser Memory Uncorrectable Error" },
 	{ false, "UNKNOWN", "Unknown Error" }, /* 15 */
-	{ false, "UNKNOWN", "Unknown Error" }, /* 16 */
-	{ false, "UNKNOWN", "Unknown Error" }, /* 17 */
-	{ false, "UNKNOWN", "Unknown Error" }, /* 18 */
+	{ true, "SCES", "MTL SGF GCL Memory Correctable Error" },
+	{ true, "SAMS", "MTL SGF GCL Memory Address Mismatch Error" },
+	{ true, "SUES", "MTL SGF GCL Memory Uncorrectable Error" },
 	{ false, "UNKNOWN", "Unknown Error" }, /* 19 */
-	{ false, "UNKNOWN", "Unknown Error" }, /* 20 */
-	{ false, "UNKNOWN", "Unknown Error" }, /* 21 */
-	{ false, "UNKNOWN", "Unknown Error" }, /* 22 */
+	{ true, "RXFCES", "MTL RXF Memory Correctable Error" },
+	{ true, "RXFAMS", "MTL RXF Memory Address Mismatch Error" },
+	{ true, "RXFUES", "MTL RXF Memory Uncorrectable Error" },
 	{ false, "UNKNOWN", "Unknown Error" }, /* 23 */
 	{ false, "UNKNOWN", "Unknown Error" }, /* 24 */
 	{ false, "UNKNOWN", "Unknown Error" }, /* 25 */
@@ -796,13 +796,13 @@ static void dwxgmac3_handle_mtl_err(struct net_device *ndev,
 }
 
 static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {
-	{ true, "TCES", "DMA TSO Memory Error" },
+	{ true, "TCES", "DMA TSO Memory Correctable Error" },
 	{ true, "TAMS", "DMA TSO Memory Address Mismatch Error" },
-	{ true, "TUES", "DMA TSO Memory Error" },
+	{ true, "TUES", "DMA TSO Memory Uncorrectable Error" },
 	{ false, "UNKNOWN", "Unknown Error" }, /* 3 */
-	{ true, "DCES", "DMA DCACHE Memory Error" },
+	{ true, "DCES", "DMA DCACHE Memory Correctable Error" },
 	{ true, "DAMS", "DMA DCACHE Address Mismatch Error" },
-	{ true, "DUES", "DMA DCACHE Memory Error" },
+	{ true, "DUES", "DMA DCACHE Memory Uncorrectable Error" },
 	{ false, "UNKNOWN", "Unknown Error" }, /* 7 */
 	{ false, "UNKNOWN", "Unknown Error" }, /* 8 */
 	{ false, "UNKNOWN", "Unknown Error" }, /* 9 */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
