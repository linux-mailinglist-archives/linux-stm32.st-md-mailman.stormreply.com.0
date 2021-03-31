Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 830AA35043C
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 18:14:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0935AC5662E;
	Wed, 31 Mar 2021 16:14:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91F29C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 16:14:11 +0000 (UTC)
IronPort-SDR: eTVt+tYBncTrLX4zXG5gZ4+y37plDDpmbAxF8utXrJw4EOIRdW4rz7QLeWV2EKBNw6fWeZGCmc
 JDExagzM5oMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="192142227"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="192142227"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 09:14:07 -0700
IronPort-SDR: WrTshGn4jYlIW31Qo/prw/DSgBfhbbbJBQI4nvgqzP3sGhi1KCTPbujTv3VaI3jUVXwAun0FW8
 MshyRnLtO4Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="416292467"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 31 Mar 2021 09:14:07 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.59])
 by linux.intel.com (Postfix) with ESMTP id 9AAD158033E;
 Wed, 31 Mar 2021 09:14:04 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu,  1 Apr 2021 00:18:25 +0800
Message-Id: <20210331161825.32100-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: enable MTL ECC
	Error Address Status Over-ride by default
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

From: Voon Weifeng <weifeng.voon@intel.com>

Turn on the MEEAO field of MTL_ECC_Control_Register by default.

As the MTL ECC Error Address Status Over-ride(MEEAO) is set by default,
the following error address fields will hold the last valid address
where the error is detected.

Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Tan Tee Min <tee.min.tan@intel.com>
Co-developed-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index 5b010ebfede9..d8c6ff725237 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -192,6 +192,7 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp)
 
 	/* 1. Enable Safety Features */
 	value = readl(ioaddr + MTL_ECC_CONTROL);
+	value |= MEEAO; /* MTL ECC Error Addr Status Override */
 	value |= TSOEE; /* TSO ECC */
 	value |= MRXPEE; /* MTL RX Parser ECC */
 	value |= MESTEE; /* MTL EST ECC */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
index ff555d8b0cdf..6b2fd37b29ad 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
@@ -98,6 +98,7 @@
 #define ADDR				GENMASK(15, 0)
 #define MTL_RXP_IACC_DATA		0x00000cb4
 #define MTL_ECC_CONTROL			0x00000cc0
+#define MEEAO				BIT(8)
 #define TSOEE				BIT(4)
 #define MRXPEE				BIT(3)
 #define MESTEE				BIT(2)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
