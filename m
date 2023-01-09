Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B819662C63
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jan 2023 18:14:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 202A8C69048;
	Mon,  9 Jan 2023 17:14:00 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D461C65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 15:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673278155; x=1704814155;
 h=from:to:cc:subject:date:message-id;
 bh=wva8vZRxBk1WM1WW4WpFbcoP5MmHOU8eLhwsXmsxR3Q=;
 b=dDKKsJOuBtfKufueAcSvEmlz3ueA8vqi/anRV3UPRlDi8s7seOeiKS0y
 mv8Fy8gs68xQ4wJYTqPhbOXiVtVMThQJtkwRV/ng5cXk2m63jvCfEvt1J
 3gRDkZodoGOrp5t5x7GDfcVf2DOzWE9XrcJngfW02d30NOHeQlm6IWboB
 4mwcD3/hQ81YYysuLs0+K4bFodRpasWNimQmyAcHHzdvLvl248netCgt9
 PLii8tx78xAeGIzyL9Mu2kgVp9GSGwaSncPVux50cPiuOywRSMJQO3iuw
 0KM+2IAl6QDuz7+FgaQnEPFg9GFag8nkGsnjGCZN6e03fRsRU0tXwg3g/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="385201759"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="385201759"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 07:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="719960144"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="719960144"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 09 Jan 2023 07:29:12 -0800
Received: from noorazur1-iLBPG12.png.intel.com
 (noorazur1-iLBPG12.png.intel.com [10.88.229.87])
 by linux.intel.com (Postfix) with ESMTP id 50F405809A0;
 Mon,  9 Jan 2023 07:29:07 -0800 (PST)
From: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Mon,  9 Jan 2023 23:15:46 +0800
Message-Id: <20230109151546.26247-1-noor.azura.ahmad.tarmizi@intel.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 09 Jan 2023 17:13:58 +0000
Cc: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@linux.intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Looi Hong Aun <hong.aun.looi@intel.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: add aux timestamps fifo
	clearance wait
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
