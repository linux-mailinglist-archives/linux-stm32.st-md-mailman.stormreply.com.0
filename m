Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0A6A93B06
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 18:38:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73FC5C7A824;
	Fri, 18 Apr 2025 16:38:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53979C78F9C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744994323; x=1776530323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QpB4fuSObrSGhJllu8vBsT+sDGkteMX3KzSzoPYn88A=;
 b=A7Z7lHvBKRGEgP+JGsLRc2IilZckLE0eJvNzlbnXz0y+BT0FFKVz9DvP
 mAv44CAXcQGok0FtvHQtFJNJek4FQvljsJxI95lwgXJcRLwnxsB0e95VS
 jRzAsp9g7HmUpYlNFN2LM7nUB+krM5QgzypWhWkj69kk8VPyOACqCM/Xs
 BZvHXxetW6ZZWiK+faokDXhQGxYI6Ok+jWTnkX+M+kHOgnzA8IeZI99IZ
 7v/e4MwVzzfYvJTWa4QKd9lCgzo5j1HCRNWNFKGdTQ1XKzQpILfXolf3B
 MWGGflt060BvHzo93QHRBbWenGY9uIwKixyPEbowG7F8Fj//whRwQYqhk Q==;
X-CSE-ConnectionGUID: JZaSYpEKTtmSHZOPqUbw2A==
X-CSE-MsgGUID: b2ThznL7S/mVBakovqkiQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50454532"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="50454532"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 09:38:38 -0700
X-CSE-ConnectionGUID: 0/e/4nI9T2+5I9zckeRCBQ==
X-CSE-MsgGUID: V8uic6F6THaPxlOP1etIYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="130892296"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
 by orviesa009.jf.intel.com with ESMTP; 18 Apr 2025 09:38:37 -0700
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@google.com, andrew+netdev@lunn.ch, netdev@vger.kernel.org
Date: Fri, 18 Apr 2025 09:38:19 -0700
Message-ID: <20250418163822.3519810-14-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
References: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
MIME-Version: 1.0
Cc: quic_jsuraj@quicinc.com, hayashi.kunihiko@socionext.com,
 vladimir.oltean@nxp.com, ast@kernel.org, linux@armlinux.org.uk,
 anthony.l.nguyen@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 hawk@kernel.org, chwee.lin.choong@intel.com, jesper.nilsson@axis.com,
 daniel@iogearbox.net, vinicius.gomes@intel.com, przemyslaw.kitszel@intel.com,
 gal@nvidia.com, john.fastabend@gmail.com,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>, 0x1207@gmail.com,
 horms@kernel.org, Mor Bar-Gabay <morx.bar.gabay@intel.com>,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, kory.maincent@bootlin.com,
 xiaolei.wang@windriver.com, fancer.lancer@gmail.com, hkelam@marvell.com,
 mcoquelin.stm32@gmail.com, vitaly.lifshits@intel.com, bpf@vger.kernel.org,
 dima.ruinskiy@intel.com
Subject: [Linux-stm32] [PATCH net-next 13/14] igc: add support to get MAC
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

From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>

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

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Tested-by: Mor Bar-Gabay <morx.bar.gabay@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
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
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
