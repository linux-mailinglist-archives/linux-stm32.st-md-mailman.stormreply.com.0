Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC7A58361
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Mar 2025 11:49:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 982A8C78F6C;
	Sun,  9 Mar 2025 10:49:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9ECC3C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Mar 2025 10:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741517350; x=1773053350;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6TymkuK2Y51ayMl9JT+5/O1CpZULriSQpMIEcVYEhNc=;
 b=Tv14hG4CrVsinhLvtTYkXPGMLh5i6p8KNqNSkr4WtBwq4SvrTdZx/JNp
 hV9x2sxIlWPTh7R8DB/rt6Mel2jkDf7fTODB1FLYJOFGHyeJp4JMKRgA9
 3ko00bKoWprgn035bNVkYAtgVQrAYkl6EoczyTmSVSIaLePtaQmG0bKtz
 9brlXFXj0p75N/9R6P1+cbGbbDZDNvE8Vfxtu8GgEt8Ndk3Ox2P9JZcBk
 EAz+xyuL3f3Q/ZAThx6LssiF7zV8DHkpwTZnynPM07NhJZ0KRuz30E1pf
 X2HW/9Vb6BeoiKmzSwmOSiWee9IMRjO2+IskV2mudp0NHlqNpgEHUDCb7 g==;
X-CSE-ConnectionGUID: tcZ7zC8aRReJ7F9lZEd3/Q==
X-CSE-MsgGUID: iRknH95hS6WFGVIdH8OzIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42636252"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; d="scan'208";a="42636252"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 03:49:08 -0700
X-CSE-ConnectionGUID: CIETKKlOScyYVVZE/Yw8Tw==
X-CSE-MsgGUID: Y5raPSEpQmqkIMkyPaf2Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; d="scan'208";a="124655180"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
 by orviesa003.jf.intel.com with ESMTP; 09 Mar 2025 03:49:00 -0700
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Sun,  9 Mar 2025 06:46:47 -0400
Message-Id: <20250309104648.3895551-14-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
References: <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH iwl-next v9 13/14] igc: add support to get MAC
	Merge data via ethtool
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

Implement "ethtool --show-mm" callback for IGC.

Tested with command:
$ ethtool --show-mm enp1s0.
  MAC Merge layer state for enp1s0:
  pMAC enabled: on
  TX enabled: on
  TX active: on
  TX minimum fragment size: 64
  RX minimum fragment size: 60
  Verify enabled: on
  Verify time: 128
  Max verify time: 128
  Verification status: SUCCEEDED

Verified that the fields value are retrieved correctly.

Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc_ethtool.c | 14 ++++++++++++++
 drivers/net/ethernet/intel/igc/igc_tsn.h     |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/intel/igc/igc_ethtool.c b/drivers/net/ethernet/intel/igc/igc_ethtool.c
index 529654ccd83f..fd4b4b332309 100644
--- a/drivers/net/ethernet/intel/igc/igc_ethtool.c
+++ b/drivers/net/ethernet/intel/igc/igc_ethtool.c
@@ -1782,6 +1782,19 @@ static int igc_ethtool_set_eee(struct net_device *netdev,
 	return 0;
 }
 
+static int igc_ethtool_get_mm(struct net_device *netdev,
+			      struct ethtool_mm_state *cmd)
+{
+	struct igc_adapter *adapter = netdev_priv(netdev);
+	struct igc_fpe_t *fpe = &adapter->fpe;
+
+	ethtool_mmsv_get_mm(&fpe->mmsv, cmd);
+	cmd->tx_min_frag_size = fpe->tx_min_frag_size;
+	cmd->rx_min_frag_size = IGC_RX_MIN_FRAG_SIZE;
+
+	return 0;
+}
+
 static int igc_ethtool_set_mm(struct net_device *netdev,
 			      struct ethtool_mm_cfg *cmd,
 			      struct netlink_ext_ack *extack)
@@ -2101,6 +2114,7 @@ static const struct ethtool_ops igc_ethtool_ops = {
 	.get_link_ksettings	= igc_ethtool_get_link_ksettings,
 	.set_link_ksettings	= igc_ethtool_set_link_ksettings,
 	.self_test		= igc_ethtool_diag_test,
+	.get_mm			= igc_ethtool_get_mm,
 	.set_mm			= igc_ethtool_set_mm,
 };
 
diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.h b/drivers/net/ethernet/intel/igc/igc_tsn.h
index 58fe5f0773d7..c2a77229207b 100644
--- a/drivers/net/ethernet/intel/igc/igc_tsn.h
+++ b/drivers/net/ethernet/intel/igc/igc_tsn.h
@@ -4,6 +4,7 @@
 #ifndef _IGC_TSN_H_
 #define _IGC_TSN_H_
 
+#define IGC_RX_MIN_FRAG_SIZE		60
 #define SMD_FRAME_SIZE			60
 
 enum igc_txd_popts_type {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
