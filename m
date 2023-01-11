Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AE2665333
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jan 2023 06:15:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC235C65E59;
	Wed, 11 Jan 2023 05:15:31 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52114C03FE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jan 2023 05:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673414130; x=1704950130;
 h=from:to:cc:subject:date:message-id;
 bh=vcvLe0f0ExqdNRKNIcoKlzOvKtyRlNadlCWz9n4LyFs=;
 b=KWhBvY+7EDNJj+VOszCEfPBehpNSPiivcX3kqcDOzLirwZMRy21XmbFx
 uzUnCGVNVlGCHIS9TzWBdcp34G3kN1GDqiiOaSmhHxhbTXUH2r2WLYmOr
 +NB5dECd5WpTN/6K8uIk5MA+Ez6kpVMXOnSmCiIPIu+Rc/sppPDpo5LrL
 1zkUAFqYL8LfAIwTGBOgsZmBOm23ww7UVnLM/FopCWqVWgdn+SY328gYZ
 S4onSwdvaGAUnndMLqkC06IMq48Pzg8zfFLeamxA/yOwgndVPOpkcQNGD
 SXSS+DHZHInxGRE//sUgZ8YpytDN6j/PpCQsh+8LQlffNT3wR3EUJtUkW w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303701154"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="303701154"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 21:15:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="720592833"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="720592833"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 10 Jan 2023 21:15:27 -0800
Received: from noorazur1-iLBPG12.png.intel.com
 (noorazur1-iLBPG12.png.intel.com [10.88.229.87])
 by linux.intel.com (Postfix) with ESMTP id F124D5807C8;
 Tue, 10 Jan 2023 21:15:22 -0800 (PST)
From: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Wed, 11 Jan 2023 13:02:00 +0800
Message-Id: <20230111050200.2130-1-noor.azura.ahmad.tarmizi@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@linux.intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Looi Hong Aun <hong.aun.looi@intel.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
Subject: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: add aux timestamps
	fifo clearance wait
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

Add timeout polling wait for auxiliary timestamps snapshot FIFO clear bit
(ATSFC) to clear. This is to ensure no residue fifo value is being read
erroneously.

Fixes: f4da56529da6 ("net: stmmac: Add support for external trigger timestamping")
Cc: <stable@vger.kernel.org> # 5.10.x
Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index fc06ddeac0d5..b4388ca8d211 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -210,7 +210,10 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 		}
 		writel(acr_value, ptpaddr + PTP_ACR);
 		mutex_unlock(&priv->aux_ts_lock);
-		ret = 0;
+		/* wait for auxts fifo clear to finish */
+		ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
+					 !(acr_value & PTP_ACR_ATSFC),
+					 10, 10000);
 		break;
 
 	default:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
