Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5814C800367
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 06:53:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E09EC6B47D;
	Fri,  1 Dec 2023 05:53:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46B27C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 05:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701410021; x=1732946021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=72Q5T4Gt/E6LRMKubjDuW89gTEGgYKk1Pow/mso1yHI=;
 b=SNfTIOI6ViXz0tUm+gScd/Cg+y2iZ9v1RBjxFr4EKeXSvbsCAfhevrd9
 GYv40UTuTd//MiqGnUw4A2p8MssN1bQ2dwcDh8KkjxIx3Tb675APz7egv
 zpjxoIe1x8NUUyV+mfmfdZw/k0AQFPuO70M1T0/01s81iN/dXjZ5Xt42o
 uE9NHstmV9KTLuQCxRqudilu6nftuaQYc3UenSxGk1M8Dp13fp0dUz7Rs
 uHimDwpaSCNaQUR5s3iQzu/YFMmn30MrlpXNueyS/7C0qSrLWbhiMq8z2
 w2+5HW+JiVT7T5zwsJL9QSgJe1FSkpLHZFP3H/cbuqNh/yCmA2jqnnQGE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="373624049"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="373624049"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 21:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="763004581"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="763004581"
Received: from ppgyli0104.png.intel.com ([10.126.160.64])
 by orsmga007.jf.intel.com with ESMTP; 30 Nov 2023 21:53:33 -0800
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Fri,  1 Dec 2023 13:52:52 +0800
Message-Id: <20231201055252.1302-4-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20231201055252.1302-1-rohan.g.thomas@intel.com>
References: <20231201055252.1302-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, bpf@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Add support for
	EST cycle-time-extension
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

Add support for cycle-time-extension. TER GCL-register needs to be
updated with the cycle-time-extension. Width of TER register is EST
time interval width + 7 bits.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index d4ee4684bc70..287767f6d671 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -975,6 +975,8 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 		return -EINVAL;
 	if (!qopt->cycle_time)
 		return -ERANGE;
+	if (qopt->cycle_time_extension >= BIT(wid + 7))
+		return -ERANGE;
 
 	if (!plat->est) {
 		plat->est = devm_kzalloc(priv->device, sizeof(*plat->est),
@@ -1041,6 +1043,8 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 	priv->plat->est->ctr[0] = do_div(ctr, NSEC_PER_SEC);
 	priv->plat->est->ctr[1] = (u32)ctr;
 
+	priv->plat->est->ter = qopt->cycle_time_extension;
+
 	if (fpe && !priv->dma_cap.fpesel) {
 		mutex_unlock(&priv->plat->est->lock);
 		return -EOPNOTSUPP;
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
