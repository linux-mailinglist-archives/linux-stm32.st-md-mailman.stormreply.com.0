Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0DFA93AF9
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 18:38:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32F18C78F97;
	Fri, 18 Apr 2025 16:38:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 023E4C78F71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744994317; x=1776530317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AtORh+C/RnJb7OaKXNfLBopb4E8qh/pXxldrFvkHkzU=;
 b=ieh6uXbQChMLuMeGUHGIyhALz1cCUNUx2xIRyO5r1bHAEZlhlVPpk/2q
 HdtMPz7tWGt5e3C6Fa3nKaw5hN0CwsO2MUy4f1r+WNdEKEs7OZRyruy+H
 HdhpHFb3hUhqv8k3LwXoCdWUx7zaiaQRH7mLdjKZXjsZIh+v7duJmGKfm
 +En3UeF+hiYXFDH3lkN9nGRd4RYo/vxg5f4qA+D1qUDUjdfw6TncAIZyI
 GdF4et0DB/05pH6aJtn9UY0wAdqt+MxaVrQm1fyG9Yu3R7FYxi/1mIutP
 ExvytKCOhRT0uBlf/Obqm612wEfoKtmdlHE/Z6o4m9rwugjlxe5MbcH5L w==;
X-CSE-ConnectionGUID: YB3FjJI8Shq60D7Ghfy4gw==
X-CSE-MsgGUID: T2cG9U08SEKzvffyHroFHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50454303"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="50454303"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 09:38:34 -0700
X-CSE-ConnectionGUID: j8lM+5MhSPaoaOGxcyCz4Q==
X-CSE-MsgGUID: zpLoSDBVRjiVUq3GJybrwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="130892238"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
 by orviesa009.jf.intel.com with ESMTP; 18 Apr 2025 09:38:33 -0700
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@google.com, andrew+netdev@lunn.ch, netdev@vger.kernel.org
Date: Fri, 18 Apr 2025 09:38:09 -0700
Message-ID: <20250418163822.3519810-4-anthony.l.nguyen@intel.com>
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
 horms@kernel.org, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 kory.maincent@bootlin.com, xiaolei.wang@windriver.com, fancer.lancer@gmail.com,
 hkelam@marvell.com, mcoquelin.stm32@gmail.com, vitaly.lifshits@intel.com,
 bpf@vger.kernel.org, dima.ruinskiy@intel.com
Subject: [Linux-stm32] [PATCH net-next 03/14] net: ethtool: mm: reset
	verification status when link is down
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

When the link partner goes down, "ethtool --show-mm" still displays
"Verification status: SUCCEEDED," reflecting a previous state that is
no longer valid.

Reset the verification status to ensure it reflects the current state.

Reviewed-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 net/ethtool/mm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ethtool/mm.c b/net/ethtool/mm.c
index bfd988464d7d..ad9b40034003 100644
--- a/net/ethtool/mm.c
+++ b/net/ethtool/mm.c
@@ -415,6 +415,10 @@ void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up)
 		/* New link => maybe new partner => new verification process */
 		ethtool_mmsv_apply(mmsv);
 	} else {
+		/* Reset the reported verification state while the link is down */
+		if (mmsv->verify_enabled)
+			mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
+
 		/* No link or pMAC not enabled */
 		ethtool_mmsv_configure_pmac(mmsv, false);
 		ethtool_mmsv_configure_tx(mmsv, false);
-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
