Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5389949C6CE
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 10:48:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18BA7C5F1D5;
	Wed, 26 Jan 2022 09:48:20 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10F0BC5F1D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 09:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643190498; x=1674726498;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Tz1WJ/YY3EwQM6gWrJzFBZDFZsZ1MNsURDEDEz1XInA=;
 b=WBEa+8omPpTivL9sBoMue+P1McTO04pO3D693a5LvZeyh7gZToUykHPm
 c6xFEwNsq8Qg2KVWUYC12wCyvn52rdSwTF7NCf8IgBELvHEs8uJJEtS34
 xs9XWN9auQjqFssM0MOAN3OeE6QV/iTHMestsZKwu0PES3flCfijTC7b0
 Lprathf/7aczM8iRI3udZ0eq6fRxsCqx9RPQq/y1XFP860shhXXuIGrd5
 MrlwVyRWd5Uyl/XkIRQXmb37AQ6KihopGjr+mdmaQUmpft0YE0n0LOTBq
 1A/msI8mgf+99uEJJGyvaohqIA7nzw/L10LZr8Vhueosw2V5Xij2Gv8Xt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246734103"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="246734103"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:48:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="617918587"
Received: from mismail5-ilbpg0.png.intel.com ([10.88.229.13])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jan 2022 01:48:13 -0800
From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 26 Jan 2022 17:47:22 +0800
Message-Id: <20220126094723.11849-2-mohammad.athari.ismail@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220126094723.11849-1-mohammad.athari.ismail@intel.com>
References: <20220126094723.11849-1-mohammad.athari.ismail@intel.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, mohammad.athari.ismail@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
