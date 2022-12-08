Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D5E64808E
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Dec 2022 11:01:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80BEBC65E6B;
	Fri,  9 Dec 2022 10:01:03 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99D36C6411C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670490275; x=1702026275;
 h=from:to:cc:subject:date:message-id;
 bh=UA+smJjZZYbFnblJ4yJ0P96Z25fhqeBCuoWHkuOYe74=;
 b=Kk5nMiFvtoOynCE6TMuX6BfGN0qU7sAFvhRNsnL8DbHSSkih8s4GSHbu
 L5nudkzp3tC5V2Zlzq/zOW6t/x6iE4/PcXi+oW2+Lynfmgp9Rf8JScsLa
 qC9Sx04HqVrhR0mZlkUec3+uuu1TdMxo/KL7fPm/Q3xPhNmrWxgjUAr+p
 8SxBNHuqdRy0ecFNn3eNXVzOPLWmEXCwuoS160l01Xsa+0X3xR5tztqXO
 GNdqtOYYD3uWWGn0RNnKoph95qMDLo91F8me+c8XEZyZKQq4bXwbbGh+4
 5DobhqtCPSLghhaME5SuD7ZBDVaPD1k+QuWjWKwdngEv1lDKex790GRac A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="381413938"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="381413938"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 01:03:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="975786174"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="975786174"
Received: from ssid-ilbpg3.png.intel.com ([10.88.227.111])
 by fmsmga005.fm.intel.com with ESMTP; 08 Dec 2022 01:03:16 -0800
From: Lai Peter Jun Ann <jun.ann.lai@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu,  8 Dec 2022 17:03:15 +0800
Message-Id: <1670490195-19367-1-git-send-email-jun.ann.lai@intel.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Fri, 09 Dec 2022 10:01:02 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: Add check for
	taprio basetime configuration
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

From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>

Adds a boundary check to prevent negative basetime input from user
while configuring taprio.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Lai Peter Jun Ann <jun.ann.lai@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 773e415..2cfb18c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -926,6 +926,9 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 	int i, ret = 0;
 	u64 ctr;
 
+	if (qopt->base_time < 0)
+		return -ERANGE;
+
 	if (!priv->dma_cap.estsel)
 		return -EOPNOTSUPP;
 
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
