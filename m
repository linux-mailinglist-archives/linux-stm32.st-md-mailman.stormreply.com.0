Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCB27D8E8B
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Oct 2023 08:15:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88D04C6C855;
	Fri, 27 Oct 2023 06:15:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C655C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 06:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698387357; x=1729923357;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RzxknOAHxhYQy517vTA+5JreFWE2tbMpxk8ZOQ6gyW0=;
 b=JZEuQxr23RwKYyPMwKgVqCJHoeWv7L31paaXHtRKZDKQOpCXthBRK1dH
 hnD7rovXPThNjUQn75XmGC1Eus5x2Mb2oMeeVP0nCsBbNhoPvBxfMH6qj
 VUiOQzSHTguRwEysNhDF04BtogwDgp9ZOy/rZ0dUJSs8aqr045fxouqDe
 n25RcdbUFElAaLKq0+5Qh6cwMw6L9oES8w/A8wLQw2VgGr4p9pIFCY2Tk
 NH2jlV9mBE2vmWgIQzRpdrtY3Hgb8lQIaRpAyETRlh8j1Y4rcU3FRpxnd
 ux+kooTksypiwopJ4k/DrKPQ6PuqZZjDKvxUo3g3rv2sObyxbGR0BixGT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="473958858"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="473958858"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 23:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="735995360"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="735995360"
Received: from ssid-ilbpg3-teeminta.png.intel.com ([10.88.227.74])
 by orsmga006.jf.intel.com with ESMTP; 26 Oct 2023 23:14:21 -0700
From: Gan Yi Fang <yi.fang.gan@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Oct 2023 14:11:14 +0800
Message-Id: <20231027061114.3792619-1-yi.fang.gan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Gan Yi Fang <yi.fang.gan@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Subject: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: check CBS input
	values before configuration
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

From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>

Add check for below conditions before proceeding to configuration.
A message will be prompted if the input value is invalid.

Idleslope minus sendslope should equal speed_div.
Idleslope is always a positive value.
Sendslope is always a negative value.
Hicredit is always a positive value.
Locredit is always a negative value.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Gan, Yi Fang <yi.fang.gan@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index ac41ef4cbd2f..e8a079946f84 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -381,6 +381,11 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
 		return -EOPNOTSUPP;
 	}
 
+	if ((qopt->idleslope - qopt->sendslope != speed_div) ||
+	    qopt->idleslope < 0 || qopt->sendslope > 0 ||
+	    qopt->hicredit < 0 || qopt->locredit > 0)
+		return -EINVAL;
+
 	mode_to_use = priv->plat->tx_queues_cfg[queue].mode_to_use;
 	if (mode_to_use == MTL_QUEUE_DCB && qopt->enable) {
 		ret = stmmac_dma_qmode(priv, priv->ioaddr, queue, MTL_QUEUE_AVB);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
