Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B40A666C4
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 04:09:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10859C78F6D;
	Tue, 18 Mar 2025 03:09:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49BF4C78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 03:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742267344; x=1773803344;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cRb+CbjWo0ZjK0e4vuvO/MeSF/KtBDAkMvyjIUZVP0Y=;
 b=awJa54V3am+zbf5b4tuWLP/jOxh2Pkl7aY9penU+2l+P/JIvNfKd38gc
 aUI9kDhL3oaLH5A4rNQC11B+qgBz9KB52+VF1ieXCGk/ca8PymZYa1PLl
 czScifGjF19rCe1UvLcdOfBp34zjHoq1IatqcMLHzb/ar7WjiVitQtSio
 ADnvY33WIcCylNS2HQaAa9iKZfXpXSOw6XtgdTgLCs7MYRTiI1TG2mf8L
 vpTYddcUA5ScI6qHruPrCTUlmTK+Gjg5KsEHur3afQSC7QKP0W5DBZmEs
 Mgbsp6Ir98P9RPziC6NAuzLuq6OambCJlmA1Rq6e+5hsG9xvtHuJsuERb A==;
X-CSE-ConnectionGUID: gFySqKVnQueIF44zSGKc0g==
X-CSE-MsgGUID: C0zWGqGURQSC3sIiYrJ+dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54382981"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; d="scan'208";a="54382981"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 20:09:02 -0700
X-CSE-ConnectionGUID: 6ScQ+CC6QASbNGSWqJ1K2Q==
X-CSE-MsgGUID: 8G7UL6nyQd65/FtNHfjpZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; d="scan'208";a="126313814"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
 by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2025 20:08:55 -0700
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Hariprasad Kelam <hkelam@marvell.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Mon, 17 Mar 2025 23:07:33 -0400
Message-Id: <20250318030742.2567080-6-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
References: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH iwl-next v10 05/14] igc: rename
	I225_RXPBSIZE_DEFAULT and I225_TXPBSIZE_DEFAULT
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

Rename RX and TX packet buffer size macros in preparation for an
upcoming patch that will refactor buffer size handling using FIELD_PREP
and GENMASK.

Changes:
- Rename I225_RXPBSIZE_DEFAULT to IGC_RXPBSIZE_EXP_BMC_DEFAULT.
  The EXP_BMC suffix explicitly indicates Express and BMC buffer
  default values, improving readability and reusability for the
  upcoming changes, while also better reflecting the current buffer
  allocations.
- Rename I225_TXPBSIZE_DEFAULT to IGC_TXPBSIZE_DEFAULT.

These registers apply to both i225 and i226, so using the IGC prefix
aligns with existing macro naming conventions.

Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc_defines.h | 7 ++++---
 drivers/net/ethernet/intel/igc/igc_main.c    | 4 ++--
 drivers/net/ethernet/intel/igc/igc_tsn.c     | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_defines.h b/drivers/net/ethernet/intel/igc/igc_defines.h
index 8e449904aa7d..b6744ece64f0 100644
--- a/drivers/net/ethernet/intel/igc/igc_defines.h
+++ b/drivers/net/ethernet/intel/igc/igc_defines.h
@@ -396,9 +396,10 @@
 #define IGC_RCTL_PMCF		0x00800000 /* pass MAC control frames */
 #define IGC_RCTL_SECRC		0x04000000 /* Strip Ethernet CRC */
 
-#define I225_RXPBSIZE_DEFAULT	0x000000A2 /* RXPBSIZE default */
-#define I225_TXPBSIZE_DEFAULT	0x04000014 /* TXPBSIZE default */
-#define IGC_RXPBS_CFG_TS_EN	0x80000000 /* Timestamp in Rx buffer */
+/* RXPBSIZE default value for Express and BMC buffer */
+#define IGC_RXPBSIZE_EXP_BMC_DEFAULT	0x000000A2
+#define IGC_TXPBSIZE_DEFAULT		0x04000014 /* TXPBSIZE default */
+#define IGC_RXPBS_CFG_TS_EN		0x80000000 /* Timestamp in Rx buffer */
 
 #define IGC_TXPBSIZE_TSN	0x04145145 /* 5k bytes buffer for each queue */
 
diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 99123eef610b..6f0110e3ac22 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -7156,8 +7156,8 @@ static int igc_probe(struct pci_dev *pdev,
 	}
 
 	/* configure RXPBSIZE and TXPBSIZE */
-	wr32(IGC_RXPBS, I225_RXPBSIZE_DEFAULT);
-	wr32(IGC_TXPBS, I225_TXPBSIZE_DEFAULT);
+	wr32(IGC_RXPBS, IGC_RXPBSIZE_EXP_BMC_DEFAULT);
+	wr32(IGC_TXPBS, IGC_TXPBSIZE_DEFAULT);
 
 	timer_setup(&adapter->watchdog_timer, igc_watchdog, 0);
 	timer_setup(&adapter->phy_info_timer, igc_update_phy_info, 0);
diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.c b/drivers/net/ethernet/intel/igc/igc_tsn.c
index 1e44374ca1ff..498741d83ca6 100644
--- a/drivers/net/ethernet/intel/igc/igc_tsn.c
+++ b/drivers/net/ethernet/intel/igc/igc_tsn.c
@@ -136,7 +136,7 @@ static int igc_tsn_disable_offload(struct igc_adapter *adapter)
 	int i;
 
 	wr32(IGC_GTXOFFSET, 0);
-	wr32(IGC_TXPBS, I225_TXPBSIZE_DEFAULT);
+	wr32(IGC_TXPBS, IGC_TXPBSIZE_DEFAULT);
 	wr32(IGC_DTXMXPKTSZ, IGC_DTXMXPKTSZ_DEFAULT);
 
 	if (igc_is_device_id_i226(hw))
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
