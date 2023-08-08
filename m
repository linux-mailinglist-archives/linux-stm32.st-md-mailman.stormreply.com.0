Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C6E77366A
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 04:19:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5380FC6B469;
	Tue,  8 Aug 2023 02:19:54 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33767C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 02:19:53 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3a44cccbd96so3583949b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Aug 2023 19:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691461192; x=1692065992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w2SLqdPoc24r3SU7DATTJAeepTTgjgASEEH+wJbfp+8=;
 b=riVngxdTKsSRf7zXfXSL+qD0Y9DVtBRjJKYvZ/v+RGrtoKt2jqRdWIGY1s1cEYR/qX
 mnMqz8NnTPAca/wgd3qX9s+/2HRmdijpDagu7AOB+NXdafhI/WATpb6oFJjBeU9TI5hd
 jYynNZSw2+jSjtfEA+KpBodE2c5qagBxcR40d4hzGZ6m2FXk2i/9ePzEi+wEHpqNveJA
 wS9m4UybfB/LsIsiFllnIm1fByZs2aGe+6i63UN7+kXgX6JXzLLIPwNhdgAV5u9iGYGU
 XYZq+mXmuobQKRH3+VWUU2BZd7AGZZxu+6LzzE+pe58UPKcIY+vpP2nGPF7MhiSyuW8f
 gtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691461192; x=1692065992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w2SLqdPoc24r3SU7DATTJAeepTTgjgASEEH+wJbfp+8=;
 b=lM9oHPRzLNW9GRb36MDQ5v+xSFQ9Zt2l0bAiZp7NP5F3I0u19MDlAoYhJSIoUv+vW1
 GQybXdh896QjnGqEN+Y6FpXzCFgRX15Ok9eGA1JeR69ChEICxg5/XK1dLvRanRIhXsNp
 Jn7TGSL0PosUVEIcGp9XrrAWo/y/0KeVXGZlQQkDci3ornh5rmSJqszUq9g5I3n9PJz5
 wkt9g/oFbHyWM44n+xkGg1VR2LALcTItTcuH/JI/iVxNqGjoSNqL6AUDy3uudRV8RrtX
 OLfnNUl126/OE0idRewzVSgCa8TiwHCReik4+ONhYcWlKpxxPFhznCnWcfl/V7WOAItH
 iSPg==
X-Gm-Message-State: AOJu0YynO2A34FyQfqfl/KO81HnUnB6lT+n+uBj1i6mLdKvd9XAuEDI/
 MCXan1wQJSqDqzVdLQ11br8=
X-Google-Smtp-Source: AGHT+IGH/g0JdiGrMleuVRrFWy33FO4h64b4qozK/olV66uDrtE31E68FjW4XEcWo7kvtPQnHeG1BQ==
X-Received: by 2002:a05:6808:17aa:b0:3a7:7bd3:7a7d with SMTP id
 bg42-20020a05680817aa00b003a77bd37a7dmr15663696oib.23.1691461191836; 
 Mon, 07 Aug 2023 19:19:51 -0700 (PDT)
Received: from localhost.localdomain ([198.211.45.220])
 by smtp.googlemail.com with ESMTPSA id
 p18-20020aa78612000000b006871dad3e74sm6849000pfn.65.2023.08.07.19.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 19:19:51 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>
Date: Tue,  8 Aug 2023 10:19:06 +0800
Message-Id: <20230808021906.1120889-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/1] net: stmmac: xgmac: RX queue
	routing configuration
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

Commit abe80fdc6ee6 ("net: stmmac: RX queue routing configuration")
introduced RX queue routing to DWMAC4 core.
This patch extend the support to XGMAC2 core.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
Changes in v2:
  - Convert the shift ops to FIELD_PREP
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    | 14 ++++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 34 +++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 1913385df685..a2498da7406b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -74,8 +74,22 @@
 #define XGMAC_RXQEN(x)			GENMASK((x) * 2 + 1, (x) * 2)
 #define XGMAC_RXQEN_SHIFT(x)		((x) * 2)
 #define XGMAC_RXQ_CTRL1			0x000000a4
+#define XGMAC_AVCPQ			GENMASK(31, 28)
+#define XGMAC_AVCPQ_SHIFT		28
+#define XGMAC_PTPQ			GENMASK(27, 24)
+#define XGMAC_PTPQ_SHIFT		24
+#define XGMAC_TACPQE			BIT(23)
+#define XGMAC_TACPQE_SHIFT		23
+#define XGMAC_DCBCPQ			GENMASK(19, 16)
+#define XGMAC_DCBCPQ_SHIFT		16
+#define XGMAC_MCBCQEN			BIT(15)
+#define XGMAC_MCBCQEN_SHIFT		15
+#define XGMAC_MCBCQ			GENMASK(11, 8)
+#define XGMAC_MCBCQ_SHIFT		8
 #define XGMAC_RQ			GENMASK(7, 4)
 #define XGMAC_RQ_SHIFT			4
+#define XGMAC_UPQ			GENMASK(3, 0)
+#define XGMAC_UPQ_SHIFT			0
 #define XGMAC_RXQ_CTRL2			0x000000a8
 #define XGMAC_RXQ_CTRL3			0x000000ac
 #define XGMAC_PSRQ(x)			GENMASK((x) * 8 + 7, (x) * 8)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index a0c2ef8bb0ac..38782662ff98 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -127,6 +127,36 @@ static void dwxgmac2_tx_queue_prio(struct mac_device_info *hw, u32 prio,
 	writel(value, ioaddr + reg);
 }
 
+static void dwxgmac2_rx_queue_routing(struct mac_device_info *hw,
+				      u8 packet, u32 queue)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 value;
+
+	static const struct stmmac_rx_routing dwxgmac2_route_possibilities[] = {
+		{ XGMAC_AVCPQ, XGMAC_AVCPQ_SHIFT },
+		{ XGMAC_PTPQ, XGMAC_PTPQ_SHIFT },
+		{ XGMAC_DCBCPQ, XGMAC_DCBCPQ_SHIFT },
+		{ XGMAC_UPQ, XGMAC_UPQ_SHIFT },
+		{ XGMAC_MCBCQ, XGMAC_MCBCQ_SHIFT },
+	};
+
+	value = readl(ioaddr + XGMAC_RXQ_CTRL1);
+
+	/* routing configuration */
+	value &= ~dwxgmac2_route_possibilities[packet - 1].reg_mask;
+	value |= (queue << dwxgmac2_route_possibilities[packet - 1].reg_shift) &
+		 dwxgmac2_route_possibilities[packet - 1].reg_mask;
+
+	/* some packets require extra ops */
+	if (packet == PACKET_AVCPQ)
+		value |= FIELD_PREP(XGMAC_TACPQE, 1);
+	else if (packet == PACKET_MCBCQ)
+		value |= FIELD_PREP(XGMAC_MCBCQEN, 1);
+
+	writel(value, ioaddr + XGMAC_RXQ_CTRL1);
+}
+
 static void dwxgmac2_prog_mtl_rx_algorithms(struct mac_device_info *hw,
 					    u32 rx_alg)
 {
@@ -1463,7 +1493,7 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.rx_queue_enable = dwxgmac2_rx_queue_enable,
 	.rx_queue_prio = dwxgmac2_rx_queue_prio,
 	.tx_queue_prio = dwxgmac2_tx_queue_prio,
-	.rx_queue_routing = NULL,
+	.rx_queue_routing = dwxgmac2_rx_queue_routing,
 	.prog_mtl_rx_algorithms = dwxgmac2_prog_mtl_rx_algorithms,
 	.prog_mtl_tx_algorithms = dwxgmac2_prog_mtl_tx_algorithms,
 	.set_mtl_tx_queue_weight = dwxgmac2_set_mtl_tx_queue_weight,
@@ -1524,7 +1554,7 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.rx_queue_enable = dwxlgmac2_rx_queue_enable,
 	.rx_queue_prio = dwxgmac2_rx_queue_prio,
 	.tx_queue_prio = dwxgmac2_tx_queue_prio,
-	.rx_queue_routing = NULL,
+	.rx_queue_routing = dwxgmac2_rx_queue_routing,
 	.prog_mtl_rx_algorithms = dwxgmac2_prog_mtl_rx_algorithms,
 	.prog_mtl_tx_algorithms = dwxgmac2_prog_mtl_tx_algorithms,
 	.set_mtl_tx_queue_weight = dwxgmac2_set_mtl_tx_queue_weight,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
