Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8D5772A31
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Aug 2023 18:10:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6603DC6B45C;
	Mon,  7 Aug 2023 16:10:51 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FF0BC6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Aug 2023 16:10:49 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3490cce32c4so22664315ab.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Aug 2023 09:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691424649; x=1692029449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KVadzo05Trppr5PYepmjmmUny3lh84/3p0xio4Ziz2w=;
 b=C/jZXjXV1AoWmOBfnXi6kglvKcSI8zQIDgpQrLVrCjN+FD77GCjFc5ONs1CkYN0sSz
 KUTfj6bsLNC1B3NxPqMZPh2J+P8IHDMzNn4z36lfYZIev5GXoxIdrw5xlZo5fZv+Kqiq
 rxqMHeWFUIHCnalT9uxeg2bFd1//JN7c/AtUtFCRO1clMiN+bnu/SEMvmRLwsiKPEFaY
 s2CTNCOcT8ZgaCiQ96Nly8hDs7lek2/8/VK4GJFVLR9bt5x20xUuhNr/YvV533fFOw8E
 6C2TOERUEDhYnHe6c/vKj5uKdgIaSaFiIVvDoVMfnh7sojeTn6Ks0Nzq5l0kai2e2U2s
 gzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691424649; x=1692029449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KVadzo05Trppr5PYepmjmmUny3lh84/3p0xio4Ziz2w=;
 b=ZCNnX/2DyDnTTfvMNKc+WfZ4RsZDKkBsl+/WnQ+KvbEQY7u+CuXQGpOfGk10h/vq+i
 CgNSrXPc/BP5Wp6e3HXAla5kCmbNWTGYOIgl7BUTc0d3d45HnBVAzO9tn24P9aU6gzYk
 6/EqUCgvd+ASmW8nqCgRu5PcmfOI+KHVxhsOVTsaLf7u+646Zsk1sXePg9VSvc5xP/Xj
 SG1WF5hHVbmcXog71pEkm3YtfLHyJG1INicf4miSkdoAdzpmkI9rmIFvrTaSwAq4gQM6
 uVTCfyiDezagJETfdY1j8UYoESs8FCO9kfSoeRBEpBpBHSpe7xYMA8B/WCUUuNEZZUBK
 Vn+w==
X-Gm-Message-State: AOJu0YxYsVYsMVdfhNeuUUVFUoY5rWTWpDUXrHemUSoyCOUo9yH7mYgx
 zBnsxI8yPKhzu99pRhWdbIs=
X-Google-Smtp-Source: AGHT+IHUY9s7W+bsFQGLPuSFqwSaDO55W8bwT4Q/REJIBx4fPtyJTkTe5sZvn+OjbgbPNjhuyZHpNw==
X-Received: by 2002:a05:6e02:154d:b0:349:1d60:f038 with SMTP id
 j13-20020a056e02154d00b003491d60f038mr11792029ilu.27.1691424648826; 
 Mon, 07 Aug 2023 09:10:48 -0700 (PDT)
Received: from localhost.localdomain ([198.211.45.220])
 by smtp.googlemail.com with ESMTPSA id
 k14-20020a637b4e000000b005533b6cb3a6sm5074741pgn.16.2023.08.07.09.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:10:48 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Simon Horman <horms@kernel.org>, Joao Pinto <Joao.Pinto@synopsys.com>
Date: Tue,  8 Aug 2023 00:09:55 +0800
Message-Id: <20230807160955.1111104-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: xgmac: RX queue routing
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
index a0c2ef8bb0ac..097b891a608d 100644
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
+	value |= (queue << dwxgmac2_route_possibilities[packet - 1].reg_shift) &
+		 dwxgmac2_route_possibilities[packet - 1].reg_mask;
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
