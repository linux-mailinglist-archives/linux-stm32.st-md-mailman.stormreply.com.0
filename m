Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD6F37252A
	for <lists+linux-stm32@lfdr.de>; Tue,  4 May 2021 06:39:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4FF1C59784;
	Tue,  4 May 2021 04:39:29 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63A43C59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 04:39:25 +0000 (UTC)
IronPort-SDR: mO1J7mUoMNBx0gDicVhJ4nX0W1UzVRL2LUZIDSE6v7U9OSm28FCdeF5hMjzRoitkY+icl3e9tt
 kI1WDb/sCa7Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="195845259"
X-IronPort-AV: E=Sophos;i="5.82,271,1613462400"; d="scan'208";a="195845259"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 21:39:23 -0700
IronPort-SDR: hojtwMwQeNiR593ORTkypqOZ9gZwUJ+9pdBSRBrRObwNbyFut3j2a1fvElPqa1dUNEShOSUv4T
 thd6Gus9d97Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,271,1613462400"; d="scan'208";a="395990371"
Received: from intel-z390-ud.iind.intel.com ([10.223.96.21])
 by fmsmga007.fm.intel.com with ESMTP; 03 May 2021 21:39:19 -0700
From: Ramesh Babu B <ramesh.Babu.B@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue,  4 May 2021 21:12:41 +0530
Message-Id: <20210504154241.1165-1-ramesh.Babu.B@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ramesh Babu B <ramesh.Babu.B@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: Clear receive all(RA)
	bit when promiscuous mode is off
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

From: Ramesh Babu B <ramesh.babu.b@intel.com>

In promiscuous mode Receive All bit is set in GMAC packet filter register,
but outside promiscuous mode Receive All bit is not cleared,
which resulted in all network packets are received when toggle (ON/OFF)
the promiscuous mode.

Fixes: e0f9956a3862 ("net: stmmac: Add option for VLAN filter fail queue enable")
Signed-off-by: Ramesh Babu B <ramesh.babu.b@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 95864f014ffa..f35c03c9f91e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -642,6 +642,7 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
 	value &= ~GMAC_PACKET_FILTER_PCF;
 	value &= ~GMAC_PACKET_FILTER_PM;
 	value &= ~GMAC_PACKET_FILTER_PR;
+	value &= ~GMAC_PACKET_FILTER_RA;
 	if (dev->flags & IFF_PROMISC) {
 		/* VLAN Tag Filter Fail Packets Queuing */
 		if (hw->vlan_fail_q_en) {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
