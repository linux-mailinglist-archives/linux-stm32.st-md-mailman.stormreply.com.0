Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB7E50F2BB
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Apr 2022 09:38:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF8BAC60479;
	Tue, 26 Apr 2022 07:38:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96A78C60466
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 07:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650958734; x=1682494734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cK/K2uq2ENY0coZBc+dYKektq/VAXohMS2xxTvJhnWs=;
 b=VYSOWsSO2EmWEXEUnKaMfSsGFBsI4uPBe/v5U3LtNhcZ3mp5sSQN3V5n
 DRRV8HjIheDvdEKhD50k7BJdsgNe7qxpgwbVdmyrJxdESMYHhz6e2dq+V
 hPFdQcOo0VvfzTEIRodyjwHKQY74E84tAMbwrwUX2ARhobSmlK8hV3c8C
 4IgKE9VcfHZc7H5lKiUaJ/dtyz+MkPPQoy7ZJ4iVlAdQeSu4q7kWfmGAs
 e19/rorpfydYPSO3kSiLx2XZoI4PWW2Fa+GY9oG68V24RtO7JZUq4Z5Cf
 NcaY14AvlBPog3/U7Cpwf5S4MR4KW4qsqoA/Huith7Oo/kWMBIHavDdF0 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="245409654"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="245409654"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 00:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="660537394"
Received: from p12hl01tmin.png.intel.com ([10.158.65.175])
 by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2022 00:38:46 -0700
From: Tan Tee Min <tee.min.tan@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Ling Pei Lee <pei.lee.ling@intel.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Kurt Kanzenbach <kurt@linutronix.de>
Date: Tue, 26 Apr 2022 15:45:31 +0800
Message-Id: <20220426074531.4115683-1-tee.min.tan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Ong@stm-ict-prod-mailman-01.stormreply.prv,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Tan Tee Min <tee.min.tan@intel.com>,
	Boon Leong <boon.leong.ong@intel.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: disable Split Header
	(SPH) for Intel platforms
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

Based on DesignWare Ethernet QoS datasheet, we are seeing the limitation
of Split Header (SPH) feature is not supported for Ipv4 fragmented packet.
This SPH limitation will cause ping failure when the packets size exceed
the MTU size. For example, the issue happens once the basic ping packet
size is larger than the configured MTU size and the data is lost inside
the fragmented packet, replaced by zeros/corrupted values, and leads to
ping fail.

So, disable the Split Header for Intel platforms.

Cc: <stable@vger.kernel.org> # 5.10.x
Suggested-by: Ong, Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Signed-off-by: Tan Tee Min <tee.min.tan@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 include/linux/stmmac.h                            | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 63754a9c4ba7..0b0be0898ac5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -454,6 +454,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->has_gmac4 = 1;
 	plat->force_sf_dma_mode = 0;
 	plat->tso_en = 1;
+	plat->sph_disable = 1;
 
 	/* Multiplying factor to the clk_eee_i clock time
 	 * period to make it closer to 100 ns. This value
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4a4b3651ab3e..2525a80353b7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7021,7 +7021,7 @@ int stmmac_dvr_probe(struct device *device,
 		dev_info(priv->device, "TSO feature enabled\n");
 	}
 
-	if (priv->dma_cap.sphen) {
+	if (priv->dma_cap.sphen && !priv->plat->sph_disable) {
 		ndev->hw_features |= NETIF_F_GRO;
 		priv->sph_cap = true;
 		priv->sph = priv->sph_cap;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 24eea1b05ca2..29917850f079 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -270,5 +270,6 @@ struct plat_stmmacenet_data {
 	int msi_rx_base_vec;
 	int msi_tx_base_vec;
 	bool use_phy_wol;
+	bool sph_disable;
 };
 #endif
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
