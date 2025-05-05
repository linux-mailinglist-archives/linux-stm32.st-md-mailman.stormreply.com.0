Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3134DAA9FD2
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 00:28:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D054CC78F62;
	Mon,  5 May 2025 22:28:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6BCFC78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 22:28:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A4F42629C6;
 Mon,  5 May 2025 22:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BFAC4CEE4;
 Mon,  5 May 2025 22:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484079;
 bh=8QB1qWbQMWXdg2olIa2PcGR3GhKyBvi+KW+5UPu/fRg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cxcF/OnFa3vfZgfBQ0lloRErHHwL3YfnxVS5xKcB/uw7NGQVwJajtxrf1fwt4+Khf
 J19oiPYlzpOjlEXbB2ccgbyI0mw2UAkLO8Mq3XgCMJbZ+dVBtHz6A0VOy02TJn7ZfE
 CsCA0REDF0lZk29JxFqqMlj0FXOuufqFzxao6kXOL9RKwdBaE2cFcV+6dsXg9il+ZI
 q5xoBI6QCDSJtyjPIFbUfPfdo0V+47kDxI29DXsLmw/i7PpKNt0ghKrNGmYfm+rpd9
 rqVRVyWxZqC3U46UjO4tWbFF1ou5tMXl82ZvCg7h9gU+GvS+iXVMvwONQ2CEBDG7P7
 4dgsT0KsQS/Tw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon,  5 May 2025 18:09:14 -0400
Message-Id: <20250505221419.2672473-338-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Cc: Sasha Levin <sashal@kernel.org>, 0x1207@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, xiaolei.wang@windriver.com,
 netdev@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 jan.petrous@oss.nxp.com, edumazet@google.com, fancer.lancer@gmail.com,
 andrew+netdev@lunn.ch, Russell King <rmk+kernel@armlinux.org.uk>,
 olteanv@gmail.com, si.yanteng@linux.dev, mcoquelin.stm32@gmail.com,
 Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 6.14 338/642] net: stmmac: Correct
	usage of maximum queue number macros
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

From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

[ Upstream commit 352bc4513ec3907db71cb5674fb93a76fc341ca9 ]

The maximum numbers of each Rx and Tx queues are defined by
MTL_MAX_RX_QUEUES and MTL_MAX_TX_QUEUES respectively.

There are some places where Rx and Tx are used in reverse. There is no
issue when the Tx and Rx macros have the same value, but should correct
usage of macros for maximum queue number to keep consistency and prevent
unexpected mistakes.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Link: https://patch.msgid.link/20250221051818.4163678-1-hayashi.kunihiko@socionext.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/common.h | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac.h | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index e25db747a81a5..c660eb933f24b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -101,8 +101,8 @@ struct stmmac_rxq_stats {
 /* Updates on each CPU protected by not allowing nested irqs. */
 struct stmmac_pcpu_stats {
 	struct u64_stats_sync syncp;
-	u64_stats_t rx_normal_irq_n[MTL_MAX_TX_QUEUES];
-	u64_stats_t tx_normal_irq_n[MTL_MAX_RX_QUEUES];
+	u64_stats_t rx_normal_irq_n[MTL_MAX_RX_QUEUES];
+	u64_stats_t tx_normal_irq_n[MTL_MAX_TX_QUEUES];
 };
 
 /* Extra statistic and debug information exposed by ethtool */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index f05cae103d836..dae279ee2c280 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -257,7 +257,7 @@ struct stmmac_priv {
 	/* Frequently used values are kept adjacent for cache effect */
 	u32 tx_coal_frames[MTL_MAX_TX_QUEUES];
 	u32 tx_coal_timer[MTL_MAX_TX_QUEUES];
-	u32 rx_coal_frames[MTL_MAX_TX_QUEUES];
+	u32 rx_coal_frames[MTL_MAX_RX_QUEUES];
 
 	int hwts_tx_en;
 	bool tx_path_in_lpi_mode;
@@ -265,8 +265,7 @@ struct stmmac_priv {
 	int sph;
 	int sph_cap;
 	u32 sarc_type;
-
-	u32 rx_riwt[MTL_MAX_TX_QUEUES];
+	u32 rx_riwt[MTL_MAX_RX_QUEUES];
 	int hwts_rx_en;
 
 	void __iomem *ioaddr;
@@ -343,7 +342,7 @@ struct stmmac_priv {
 	char int_name_sfty[IFNAMSIZ + 10];
 	char int_name_sfty_ce[IFNAMSIZ + 10];
 	char int_name_sfty_ue[IFNAMSIZ + 10];
-	char int_name_rx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 14];
+	char int_name_rx_irq[MTL_MAX_RX_QUEUES][IFNAMSIZ + 14];
 	char int_name_tx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 18];
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
