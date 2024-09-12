Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A49499285A
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:42:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC70AC6DD94;
	Mon,  7 Oct 2024 09:42:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AEC3C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2024 02:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726106875; x=1757642875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2pC7oUHqvWMtu/IF0XFSSJJ+/UjqjyzX7Lx26PSeFBE=;
 b=PeT/RXt8et5HfPdAdiTnLLTa1J/4QQI+uYkvIQmDc1gvw8Xk0BMyttWu
 QcC+51Qc9j47uV1B8Sk6oj0SgfM+jbikOb1OHO7ibCYl0DrqMc3EBze/h
 e1KsKB+lZ/vYkMzqKouh/AT+Yx3MXxnuJ0JAqVVJVgHvb8mW3tYpGJ4mU
 BiIRqf+S6LeXz87Kb4eTpD2a7g0Wa12rOYFaAy3mb0VuxNg1sABz6EmKI
 JsFux3GlqSEp+Hiq5TK6y6C2cYT+m7DD4JOhe240caBoEUGyXRtOvT111
 3I6T402jesmq3W37Dp3A7LqzHRFWrH2BYVfpJo0e6tJzieLQnvWggCqfu g==;
X-CSE-ConnectionGUID: 0NwCE615QYumKKR6H/8cSw==
X-CSE-MsgGUID: 0oO6nlSpT3SlzZCzdQXDWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25070641"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="25070641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 19:07:47 -0700
X-CSE-ConnectionGUID: omHwZdw+SlO9u0NbszeNcw==
X-CSE-MsgGUID: iSlPjsQBTnKTSinp9R5LKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="67174707"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 19:07:46 -0700
Received: from P12HL2yongliang.png.intel.com (P12HL2yongliang.png.intel.com
 [10.158.65.196])
 by linux.intel.com (Postfix) with ESMTP id 91C5A20CFEDA;
 Wed, 11 Sep 2024 19:07:42 -0700 (PDT)
From: KhaiWenTan <khai.wen.tan@linux.intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Simon Horman <horms@kernel.org>, Xiaolei Wang <xiaolei.wang@windriver.com>
Date: Thu, 12 Sep 2024 09:55:41 +0800
Message-Id: <20240912015541.363600-1-khai.wen.tan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:42:34 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Tan Khai Wen <khai.wen.tan@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: Fix zero-division error
	when disabling tc cbs
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

The commit b8c43360f6e4 ("net: stmmac: No need to calculate speed divider
when offload is disabled") allows the "port_transmit_rate_kbps" to be
set to a value of 0, which is then passed to the "div_s64" function when
tc-cbs is disabled. This leads to a zero-division error.

When tc-cbs is disabled, the idleslope, sendslope, and credit values the
credit values are not required to be configured. Therefore, adding a return
statement after setting the txQ mode to DCB when tc-cbs is disabled would
prevent a zero-division error.

Fixes: b8c43360f6e4 ("net: stmmac: No need to calculate speed divider when offload is disabled")
Cc: <stable@vger.kernel.org>
Co-developed-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 996f2bcd07a2..2c3fd9c66d14 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -392,10 +392,10 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
 	} else if (!qopt->enable) {
 		ret = stmmac_dma_qmode(priv, priv->ioaddr, queue,
 				       MTL_QUEUE_DCB);
-		if (ret)
-			return ret;
+		if (!ret)
+			priv->plat->tx_queues_cfg[queue].mode_to_use = MTL_QUEUE_DCB;
 
-		priv->plat->tx_queues_cfg[queue].mode_to_use = MTL_QUEUE_DCB;
+		return ret;
 	}
 
 	/* Final adjustments for HW */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
