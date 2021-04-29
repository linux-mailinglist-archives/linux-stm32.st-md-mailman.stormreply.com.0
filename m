Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9EC36F2C9
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Apr 2021 01:01:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94737C58D5A;
	Thu, 29 Apr 2021 23:01:38 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 107C8C57B74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 23:01:34 +0000 (UTC)
IronPort-SDR: GatvVpHwEm/Lixxfa66z+PCL7PfJea+HL5iorPz4aevigZAlof6PdEYbYcgsOyYDS53cA30r8l
 pSzKktZ1/yBA==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="193958258"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="193958258"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 16:01:33 -0700
IronPort-SDR: Fs4pZUxMK/8fcBFX0Jb8mob6R/t0PY5ARNLAXFEgVblwdspSkxuzuukhnkHZ/mdnqNPvd9alWr
 2e+5YiWNWk1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="455748252"
Received: from mismail5-ilbpg0.png.intel.com ([10.88.229.82])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Apr 2021 16:01:29 -0700
From: mohammad.athari.ismail@intel.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 30 Apr 2021 07:01:04 +0800
Message-Id: <20210429230104.16977-1-mohammad.athari.ismail@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mohammad.athari.ismail@intel.com,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: cleared __FPE_REMOVING bit
	in stmmac_fpe_start_wq()
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

From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>

An issue found when network interface is down and up again, FPE handshake
fails to trigger. This is due to __FPE_REMOVING bit remains being set in
stmmac_fpe_stop_wq() but not cleared in stmmac_fpe_start_wq(). This
cause FPE workqueue task, stmmac_fpe_lp_task() not able to be executed.

To fix this, add clearing __FPE_REMOVING bit in stmmac_fpe_start_wq().

Fixes: 5a5586112b92 ("net: stmmac: support FPE link partner hand-shaking procedure")
Signed-off-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a9a984c57d78..e0b7eebcb512 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3180,6 +3180,7 @@ static int stmmac_fpe_start_wq(struct stmmac_priv *priv)
 	char *name;
 
 	clear_bit(__FPE_TASK_SCHED, &priv->fpe_task_state);
+	clear_bit(__FPE_REMOVING,  &priv->fpe_task_state);
 
 	name = priv->wq_name;
 	sprintf(name, "%s-fpe", priv->dev->name);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
