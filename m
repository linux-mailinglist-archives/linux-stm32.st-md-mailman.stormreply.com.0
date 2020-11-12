Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 354C02B07C3
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Nov 2020 15:47:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D819AC424B0;
	Thu, 12 Nov 2020 14:47:03 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED736C3FAE2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Nov 2020 14:46:59 +0000 (UTC)
IronPort-SDR: xcB0ufKmT1HsC1hyiK4f3ZSNV7ogut5QEtH/0vEraWZinpmN8LnTFn6YntY1PSS6+Gv2kuaFWw
 da/wUazcxKPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="167733311"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="167733311"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 06:46:49 -0800
IronPort-SDR: 7V223IaaLcQCP6ubSZGmGlFxIEdqv5gHZwMaWWRbbfsmwzTaJ4G6lYKc8huSCGztJzQIF3v6Yp
 BRlOkeYGO9fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="366356228"
Received: from glass.png.intel.com ([172.30.181.98])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Nov 2020 06:46:45 -0800
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 12 Nov 2020 22:49:48 +0800
Message-Id: <20201112144948.3042-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: Use rtnl_lock/unlock on
	netif_set_real_num_rx_queues() call
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

Fix an issue where dump stack is printed on suspend resume flow due to
netif_set_real_num_rx_queues() is not called with rtnl_lock held().

Fixes: 686cff3d7022 ("net: stmmac: Fix incorrect location to set real_num_rx|tx_queues")
Reported-by: Christophe ROULLIER <christophe.roullier@st.com>
Tested-by: Christophe ROULLIER <christophe.roullier@st.com>
Cc: Alexandre TORGUE <alexandre.torgue@st.com>
Reviewed-by: Ong Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ba855465a2db..33e280040000 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5278,7 +5278,10 @@ int stmmac_resume(struct device *dev)
 
 	stmmac_clear_descriptors(priv);
 
+	rtnl_lock();
 	stmmac_hw_setup(ndev, false);
+	rtnl_unlock();
+
 	stmmac_init_coalesce(priv);
 	stmmac_set_rx_mode(ndev);
 
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
