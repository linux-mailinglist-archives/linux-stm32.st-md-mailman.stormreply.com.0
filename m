Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF95497C9C
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 11:01:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49D4FC5F1E1;
	Mon, 24 Jan 2022 10:01:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A6C1C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 10:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643018512; x=1674554512;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Tz1WJ/YY3EwQM6gWrJzFBZDFZsZ1MNsURDEDEz1XInA=;
 b=fvriZZ1qOeE4J3ti7JrDXZk+Fi8AZo1YbawKyudhCU2EuIOJ+PLZenJg
 xlTN5p8Gms/colNB7Y2YYB00dLKjVQAQe7V/782KyfWszL1w5p7I6dn5p
 ohGvni1ji+NtmRqAIgPQGm7WT3rM/HhS6BOvQ1OBiyypfhCaLb3t6GtIZ
 IDxNRss9nzDTq24Hav0Z5yOXmJJG+u0psJ+6NQM8U5XlOGcqAlxHL5mZF
 kQvmI/NsxeJAxhuArptnU2Mu/Bp4w2kHyAOSJiNmgpi0gBfppPI/m7t/d
 xtZprbywdVDtzpiL6VzhtZbGkdX7wMUDHji+07IBu6Kjy5qQ7WcwmQbcX w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="225990623"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="225990623"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 02:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="519886948"
Received: from mismail5-ilbpg0.png.intel.com ([10.88.229.13])
 by orsmga007.jf.intel.com with ESMTP; 24 Jan 2022 02:00:40 -0800
From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>,
 Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 24 Jan 2022 17:59:50 +0800
Message-Id: <20220124095951.23845-2-mohammad.athari.ismail@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220124095951.23845-1-mohammad.athari.ismail@intel.com>
References: <20220124095951.23845-1-mohammad.athari.ismail@intel.com>
Cc: netdev@vger.kernel.org, mohammad.athari.ismail@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net 1/2] net: stmmac: configure PTP clock
	source prior to PTP initialization
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

For Intel platform, it is required to configure PTP clock source prior PTP
initialization in MAC. So, need to move ptp_clk_freq_config execution from
stmmac_ptp_register() to stmmac_init_ptp().

Fixes: 76da35dc99af ("stmmac: intel: Add PSE and PCH PTP clock source selection")
Cc: <stable@vger.kernel.org> # 5.15.x
Signed-off-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6708ca2aa4f7..d7e261768f73 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -889,6 +889,9 @@ static int stmmac_init_ptp(struct stmmac_priv *priv)
 	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
 	int ret;
 
+	if (priv->plat->ptp_clk_freq_config)
+		priv->plat->ptp_clk_freq_config(priv);
+
 	ret = stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE);
 	if (ret)
 		return ret;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 0d24ebd37873..1c9f02f9c317 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -297,9 +297,6 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 {
 	int i;
 
-	if (priv->plat->ptp_clk_freq_config)
-		priv->plat->ptp_clk_freq_config(priv);
-
 	for (i = 0; i < priv->dma_cap.pps_out_num; i++) {
 		if (i >= STMMAC_PPS_MAX)
 			break;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
