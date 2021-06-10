Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A763A3A2768
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 10:49:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53193C58D5B;
	Thu, 10 Jun 2021 08:49:22 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2CDDC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 08:49:20 +0000 (UTC)
IronPort-SDR: jylDS82kJY3MM629o7LVI8FIbZSqYVF2irxy03uLOKH8ijDwNzctVBROaPPXxkfTgc5jVEBz5Q
 tSLCx2o+wCJw==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="202230659"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="202230659"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 01:49:13 -0700
IronPort-SDR: tWyKEu0tHSOZusqlFndwFkERH2/HlIARjRaOnVupIdzhJH6dxixEZq+MF66efislk7Mmn1ZObI
 vnFHtpqXTpdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="486088008"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2021 01:49:13 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.69])
 by linux.intel.com (Postfix) with ESMTP id C2C8D580B58;
 Thu, 10 Jun 2021 01:49:10 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 10 Jun 2021 16:53:54 +0800
Message-Id: <20210610085354.656580-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joakim Zhang <qiangqing.zhang@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net-next v1 1/1] net: stmmac: Fix mixed enum
	type warning
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

The commit 5a5586112b92 ("net: stmmac: support FPE link partner
hand-shaking procedure") introduced the following coverity warning:

  "Parse warning (PW.MIXED_ENUM_TYPE)"
  "1. mixed_enum_type: enumerated type mixed with another type"

This is due to both "lo_state" and "lp_sate" which their datatype are
enum stmmac_fpe_state type, and being assigned with "FPE_EVENT_UNKNOWN"
which is a macro-defined of 0. Fixed this by assigned both these
variables with the correct enum value.

Fixes: 5a5586112b92 ("net: stmmac: support FPE link partner hand-shaking procedure")
Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 180f347b4c8e..db97cd4b871d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1021,8 +1021,8 @@ static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 	if (is_up && *hs_enable) {
 		stmmac_fpe_send_mpacket(priv, priv->ioaddr, MPACKET_VERIFY);
 	} else {
-		*lo_state = FPE_EVENT_UNKNOWN;
-		*lp_state = FPE_EVENT_UNKNOWN;
+		*lo_state = FPE_STATE_OFF;
+		*lp_state = FPE_STATE_OFF;
 	}
 }
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
