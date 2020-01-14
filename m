Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56890138EB0
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 11:13:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F66BC36B0C;
	Mon, 13 Jan 2020 10:13:44 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 159F9C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:13:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 02:13:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,428,1571727600"; d="scan'208";a="397116822"
Received: from bong5-hp-z440.png.intel.com ([10.221.118.136])
 by orsmga005.jf.intel.com with ESMTP; 13 Jan 2020 02:13:38 -0800
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: netdev@vger.kernel.org
Date: Tue, 14 Jan 2020 10:01:14 +0800
Message-Id: <1578967276-55956-6-git-send-email-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578967276-55956-1-git-send-email-boon.leong.ong@intel.com>
References: <1578967276-55956-1-git-send-email-boon.leong.ong@intel.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Voon Weifeng <weifeng.voon@intel.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 5/7] net: stmmac: fix incorrect
	GMAC_VLAN_TAG register writting implementation
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

From: "Tan, Tee Min" <tee.min.tan@intel.com>

It should always do a read of current value of GMAC_VLAN_TAG instead of
directly overwriting the register value.

Fixes: c1be0022df0d ("net: stmmac: Add VLAN HASH filtering support in GMAC4+")

Signed-off-by: Tan, Tee Min <tee.min.tan@intel.com>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 40ca00e..6e3d0ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -736,11 +736,14 @@ static void dwmac4_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 				    __le16 perfect_match, bool is_double)
 {
 	void __iomem *ioaddr = hw->pcsr;
+	u32 value;
 
 	writel(hash, ioaddr + GMAC_VLAN_HASH_TABLE);
 
+	value = readl(ioaddr + GMAC_VLAN_TAG);
+
 	if (hash) {
-		u32 value = GMAC_VLAN_VTHM | GMAC_VLAN_ETV;
+		value |= GMAC_VLAN_VTHM | GMAC_VLAN_ETV;
 		if (is_double) {
 			value |= GMAC_VLAN_EDVLP;
 			value |= GMAC_VLAN_ESVL;
@@ -759,8 +762,6 @@ static void dwmac4_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 
 		writel(value | perfect_match, ioaddr + GMAC_VLAN_TAG);
 	} else {
-		u32 value = readl(ioaddr + GMAC_VLAN_TAG);
-
 		value &= ~(GMAC_VLAN_VTHM | GMAC_VLAN_ETV);
 		value &= ~(GMAC_VLAN_EDVLP | GMAC_VLAN_ESVL);
 		value &= ~GMAC_VLAN_DOVLTC;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
