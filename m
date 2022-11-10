Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A0E623C2F
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Nov 2022 07:56:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1285CC65051;
	Thu, 10 Nov 2022 06:56:53 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17319C64115
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 06:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668063411; x=1699599411;
 h=from:to:cc:subject:date:message-id;
 bh=Mwsy1axZV+PTNKiw6w+BLcbXyV1HVAU1m3qtT1Ss6a8=;
 b=ic9mJaiv8MZueslc4spkYo8CWj+jEww6ostOvHjTbhp/GUD30vXaujql
 G0pMt+d9bMczp9pSL/WF1Ic+KoA5lu1G80yA49meBYjVyuUimVqcGjB/c
 OCgjy4RY+jFI5zwgLtdFzWD0MPmlhhF0jMBg1+QxLNwa0m2pMu9F0+XM2
 BeH0+Fpozn0Sy7vx8xp/HbV95IEoYDftss0FvgWBoppE1W1dXl4C16dzz
 lb27zmKtrQryxlHvlfGLoWVXJE/CX9LevpsY8lG9FVDN768fJVoxjTm+U
 wFoNzyAZLQbDF2qSsxr4x22Nn5DgdcnEtvRcaCcBkkjUWiIiqnCEDL3Js Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="311230157"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="311230157"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 22:56:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="588061142"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="588061142"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 09 Nov 2022 22:56:39 -0800
Received: from noorazur1-iLBPG12.png.intel.com
 (noorazur1-iLBPG12.png.intel.com [10.88.229.87])
 by linux.intel.com (Postfix) with ESMTP id 6417A580C99;
 Wed,  9 Nov 2022 22:56:35 -0800 (PST)
From: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@linux.intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>
Date: Thu, 10 Nov 2022 14:45:52 +0800
Message-Id: <20221110064552.22504-1-noor.azura.ahmad.tarmizi@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mohd Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: ensure tx function is
	not running in stmmac_xdp_release()
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

From: Mohd Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>

When stmmac_xdp_release() is called, there is a possibility that tx
function is still running on other queues which will lead to tx queue
timed out and reset adapter.

This commit ensure that tx function is not running xdp before release
flow continue to run.

Fixes: ac746c8520d9 ("net: stmmac: enhance XDP ZC driver level switching performance")
Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
Signed-off-by: Mohd Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>
Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8273e6a175c8..6b43da78cdf0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6548,6 +6548,9 @@ void stmmac_xdp_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
+	/* Ensure tx function is not running */
+	netif_tx_disable(dev);
+
 	/* Disable NAPI process */
 	stmmac_disable_all_queues(priv);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
