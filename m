Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3A3497996
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 08:40:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD6AAC60467;
	Mon, 24 Jan 2022 07:40:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 792D2C5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 12:35:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 17F8B60B6E;
 Sun, 23 Jan 2022 12:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19892C340E2;
 Sun, 23 Jan 2022 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642941334;
 bh=S7js9MyhutpXKmExYcJoR4zt9vRfN4FPoO8fosVNf8o=;
 h=From:To:Cc:Subject:Date:From;
 b=lMhV36RUtivGR2ajyZ4IVzQdcYtCJWjwS95KCwl4XFCV4p9oePljYqgy8SyABn0MQ
 B94uTywz1BX/96guAzyapy72PshjyqR07AIn8RSi6QNDsTLzM7W+yNYxODPm24BFTN
 9w+h9/ugmHo6q3x0++ji6hGie0YouDnfGwZ6Z3Gl3IAaxiKBiQMwy+KdtkZlhivo/x
 iJ2BygJPf40eKwxuICcKKX2ugytVlZKpViwbAFJhX64vRqVW5myo3bhk0OwlGx4UAQ
 VfCXuWUnHoTyRkVcUzFugC5zHcUJf5C9SSZEAy4DsDeSAdNDFOPySEO2p1Mb3DVB8J
 69kjbOQEBnRoA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Date: Sun, 23 Jan 2022 20:27:58 +0800
Message-Id: <20220123122758.2876-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Jan 2022 07:40:41 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: remove unused members in struct
	stmmac_priv
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

The tx_coalesce and mii_irq are not used at all now, so remove them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 40b5ed94cb54..5b195d5051d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -194,7 +194,6 @@ struct stmmac_priv {
 	u32 tx_coal_timer[MTL_MAX_TX_QUEUES];
 	u32 rx_coal_frames[MTL_MAX_TX_QUEUES];
 
-	int tx_coalesce;
 	int hwts_tx_en;
 	bool tx_path_in_lpi_mode;
 	bool tso;
@@ -229,7 +228,6 @@ struct stmmac_priv {
 	unsigned int flow_ctrl;
 	unsigned int pause;
 	struct mii_bus *mii;
-	int mii_irq[PHY_MAX_ADDR];
 
 	struct phylink_config phylink_config;
 	struct phylink *phylink;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
