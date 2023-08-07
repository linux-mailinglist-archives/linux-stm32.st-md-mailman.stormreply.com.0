Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF547771B6F
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Aug 2023 09:27:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86F56C6B475;
	Mon,  7 Aug 2023 07:27:21 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F371C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Aug 2023 06:57:00 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6bcd4b5ebbaso2282141a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Aug 2023 23:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691391419; x=1691996219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f9OrhSZvhb/ZMUIdWe8j3Y2F94jn11ho58WAhi9rnzk=;
 b=YCwJ5Wqbvh4a14jpVGxdNgmejAUYJA985sKomXUERwzROFls45NZv80dRiubGhA4oN
 IsN9pIKMLdB1L6Ah57ZccCxc6xPNhffAsVUTqG7FZYyWpl4O744iN2/z8Q5OAcFceY3S
 VXwHWDiBcGmpbISnLJkFuFZfw1xOfVNhIebw2/qW9rJCFy0DmEKdMMc2erEs5290mZKY
 NnXLwT8wihI78z89cYUI+KmFi0x/51eMO+lHhoLqCjYIvkIYVWHp2WSQWiT9CPFhGDfV
 MvRJCGB4XBkcyG16NG7ivDraz7jkdryBQ/v79FXyi/Oi9m3qGJBvtVradILNt7+L4ig+
 kEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691391419; x=1691996219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f9OrhSZvhb/ZMUIdWe8j3Y2F94jn11ho58WAhi9rnzk=;
 b=jmvonMoA456dy3JdlAOE1J+N+z7w9eCmMHbsTuuGs3w4osTm2HgbmlRpWAIO78h6hu
 S+sphdP6FHFM9uKV52pqajF7yDTjaFYJy89ycpDt90ROHMRYfH5/ILszr/ZuUmbFiQBv
 aLvHc7wCQ0WuRZ4TAHnShkDalQIVcxWPXUrivev05FsXLsdcWCPQDLek+GLzNU1Qq/jm
 2fr+Pk+UYPT9E2l5qLvM73djyNHFUgQT5S6TaG50BnFY94ptJcaqTOYaypZ6+Mn+FJjY
 Ydbuy6fSDDiccRpaW4J8NTVcw9udBQba9hF2uMI4TGbzZ1bYZK+x6lfpYJoQbuVtjyWV
 KfDQ==
X-Gm-Message-State: AOJu0YyvFqPMJfQII5dbtyXCq7WEI1SFeduwUWu+Wo9Yb1WMfAeBQwhX
 zJsgH/0H0+CoW1L2Y+eCbb8=
X-Google-Smtp-Source: AGHT+IEq+N/N48py0+EYLPagfqEI5zpmAY0xVp0Qka/6+3fufCJCQGhCpXNmwkK+qrKzMAzN2GLY/A==
X-Received: by 2002:a05:6359:668b:b0:134:e06a:ef40 with SMTP id
 so11-20020a056359668b00b00134e06aef40mr3185789rwb.17.1691391419432; 
 Sun, 06 Aug 2023 23:56:59 -0700 (PDT)
Received: from localhost.localdomain ([198.211.45.220])
 by smtp.googlemail.com with ESMTPSA id
 m68-20020a633f47000000b00563e1ef0491sm4522311pga.8.2023.08.06.23.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 23:56:59 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Mon,  7 Aug 2023 14:56:09 +0800
Message-Id: <20230807065609.1096076-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Aug 2023 07:27:21 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: xgmac: RX queue routing
	configuration
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
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    | 14 +++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 37 ++++++++++++++++++-
 2 files changed, 49 insertions(+), 2 deletions(-)

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
index a0c2ef8bb0ac..24918d95f612 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -127,6 +127,39 @@ static void dwxgmac2_tx_queue_prio(struct mac_device_info *hw, u32 prio,
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
+	value |= (queue << dwxgmac2_route_possibilities[packet-1].reg_shift) &
+		dwxgmac2_route_possibilities[packet - 1].reg_mask;
+
+	/* some packets require extra ops */
+	if (packet == PACKET_AVCPQ) {
+		value &= ~XGMAC_TACPQE;
+		value |= 0x1 << XGMAC_TACPQE_SHIFT;
+	} else if (packet == PACKET_MCBCQ) {
+		value &= ~XGMAC_MCBCQEN;
+		value |= 0x1 << XGMAC_MCBCQEN_SHIFT;
+	}
+
+	writel(value, ioaddr + XGMAC_RXQ_CTRL1);
+}
+
 static void dwxgmac2_prog_mtl_rx_algorithms(struct mac_device_info *hw,
 					    u32 rx_alg)
 {
@@ -1463,7 +1496,7 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.rx_queue_enable = dwxgmac2_rx_queue_enable,
 	.rx_queue_prio = dwxgmac2_rx_queue_prio,
 	.tx_queue_prio = dwxgmac2_tx_queue_prio,
-	.rx_queue_routing = NULL,
+	.rx_queue_routing = dwxgmac2_rx_queue_routing,
 	.prog_mtl_rx_algorithms = dwxgmac2_prog_mtl_rx_algorithms,
 	.prog_mtl_tx_algorithms = dwxgmac2_prog_mtl_tx_algorithms,
 	.set_mtl_tx_queue_weight = dwxgmac2_set_mtl_tx_queue_weight,
@@ -1524,7 +1557,7 @@ const struct stmmac_ops dwxlgmac2_ops = {
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
