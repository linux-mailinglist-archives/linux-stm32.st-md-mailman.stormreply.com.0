Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C932D50E60F
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 18:45:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D918C60462;
	Mon, 25 Apr 2022 16:45:09 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15481C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 03:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649822070; x=1681358070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qWnHsji0gnh/xDp7MQF81PbKycXAQAQAMMGE3n28kdA=;
 b=VkqOjtYKeJWOspsTz5wXkexGk9zudYr7OlWGsIFIcRfRfKXPV0gRaMWe
 bvgxN4hXIgRoJASQw1PEELKU9hQ4U9DBywyvx51oEYCO0jci5NsGh/QYt
 Pcr5NGmmvaEm2OPBws1vaJT7nae9d0UxEl1hJZe6eHWaOsTQKZoWkKDOO
 4GidUiohS0jiIdC4Wqqe6a2dkFFBLEhcne4xZNTQJg6A2U9Gi3PM9Pb6v
 7khPob4CHO5Mv2g2NM4y3RzwCZG2gW09PuwT7JJdCeCDruTrPlC+0LzqJ
 r8N/nJOpQSes/Bk7SghzHh0GiAgINSOvSPE5Zdd1Ce7oIO7xgi/oOmZAB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262742619"
X-IronPort-AV: E=Sophos;i="5.90,255,1643702400"; d="scan'208";a="262742619"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 20:54:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,255,1643702400"; d="scan'208";a="724733855"
Received: from p12hl01tmin.png.intel.com ([10.158.65.75])
 by orsmga005.jf.intel.com with ESMTP; 12 Apr 2022 20:54:23 -0700
From: Tan Tee Min <tee.min.tan@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Wed, 13 Apr 2022 12:01:15 +0800
Message-Id: <20220413040115.2351987-1-tee.min.tan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Apr 2022 16:45:09 +0000
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Tan Tee Min <tee.min.tan@intel.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: add fsleep() in HW Rx
	timestamp checking loop
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

There is a possibility that the context descriptor still owned by the DMA
even the previous normal descriptor own bit is already cleared. Checking
the context descriptor readiness without delay might be not enough time
for the DMA to update the descriptor field, which causing failure in
getting HW Rx timestamp.

This patch introduces a 1us fsleep() in HW Rx timestamp checking loop
to give time for DMA to update/complete the context descriptor.

ptp4l Timestamp log without this patch:
-----------------------------------------------------------
$ echo 10000 > /sys/class/net/enp0s30f4/gro_flush_timeout
$ echo 10000 > /sys/class/net/enp0s30f4/napi_defer_hard_irqs
$ ptp4l -P2Hi enp0s30f4 --step_threshold=1 -m
ptp4l: selected /dev/ptp2 as PTP clock
ptp4l: port 1: INITIALIZING to LISTENING on INIT_COMPLETE
ptp4l: selected local clock 901210.fffe.b57df7 as best master
ptp4l: port 1: new foreign master 22bb22.fffe.bb22bb-1
ptp4l: selected best master clock 22bb22.fffe.bb22bb
ptp4l: port 1: LISTENING to UNCALIBRATED on RS_SLAVE
ptp4l: port 1: UNCALIBRATED to SLAVE on MASTER_CLOCK_SELECTED
ptp4l: port 1: received SYNC without timestamp
ptp4l: rms   49 max   63 freq  -9573 +/-  34 delay    71 +/-   1
ptp4l: rms   15 max   25 freq  -9553 +/-  20 delay    72 +/-   0
ptp4l: port 1: received SYNC without timestamp
ptp4l: rms    9 max   18 freq  -9540 +/-  11 delay    70 +/-   0
ptp4l: port 1: received PDELAY_REQ without timestamp
ptp4l: rms   16 max   29 freq  -9519 +/-  12 delay    72 +/-   0
ptp4l: port 1: received PDELAY_REQ without timestamp
ptp4l: rms    9 max   18 freq  -9527 +/-  12 delay    72 +/-   0
ptp4l: rms    5 max    9 freq  -9530 +/-   7 delay    70 +/-   0
ptp4l: rms   11 max   20 freq  -9530 +/-  16 delay    72 +/-   0
ptp4l: rms    5 max   11 freq  -9530 +/-   7 delay    74 +/-   0
ptp4l: rms    6 max    9 freq  -9522 +/-   7 delay    72 +/-   0
ptp4l: port 1: received PDELAY_REQ without timestamp
-----------------------------------------------------------

ptp4l Timestamp log with this patch:
-----------------------------------------------------------
$ echo 10000 > /sys/class/net/enp0s30f4/gro_flush_timeout
$ echo 10000 > /sys/class/net/enp0s30f4/napi_defer_hard_irqs
$ ptp4l -P2Hi enp0s30f4 --step_threshold=1 -m
ptp4l: selected /dev/ptp2 as PTP clock
ptp4l: port 1: INITIALIZING to LISTENING on INIT_COMPLETE
ptp4l: selected local clock 901210.fffe.b57df7 as best master
ptp4l: port 1: new foreign master 22bb22.fffe.bb22bb-1
ptp4l: selected best master clock 22bb22.fffe.bb22bb
ptp4l: port 1: LISTENING to UNCALIBRATED on RS_SLAVE
ptp4l: port 1: UNCALIBRATED to SLAVE on MASTER_CLOCK_SELECTED
ptp4l: rms   30 max   45 freq  -9400 +/-  23 delay    72 +/-   0
ptp4l: rms    7 max   16 freq  -9414 +/-  10 delay    70 +/-   0
ptp4l: rms    6 max    9 freq  -9422 +/-   6 delay    72 +/-   0
ptp4l: rms   13 max   20 freq  -9436 +/-  13 delay    74 +/-   0
ptp4l: rms   12 max   27 freq  -9446 +/-  11 delay    72 +/-   0
ptp4l: rms    9 max   12 freq  -9453 +/-   6 delay    74 +/-   0
ptp4l: rms    9 max   15 freq  -9438 +/-  11 delay    74 +/-   0
ptp4l: rms   10 max   16 freq  -9435 +/-  12 delay    74 +/-   0
ptp4l: rms    8 max   18 freq  -9428 +/-   8 delay    72 +/-   0
ptp4l: rms    8 max   18 freq  -9423 +/-   8 delay    72 +/-   0
ptp4l: rms    9 max   16 freq  -9431 +/-  12 delay    70 +/-   0
ptp4l: rms    9 max   18 freq  -9441 +/-   9 delay    72 +/-   0
-----------------------------------------------------------

Fixes: ba1ffd74df74 ("stmmac: fix PTP support for GMAC4")
Cc: <stable@vger.kernel.org> # 5.4.x
Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
Signed-off-by: Tan Tee Min <tee.min.tan@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index d3b4765c1a5b..289bf26a6105 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -279,10 +279,11 @@ static int dwmac4_wrback_get_rx_timestamp_status(void *desc, void *next_desc,
 			/* Check if timestamp is OK from context descriptor */
 			do {
 				ret = dwmac4_rx_check_timestamp(next_desc);
-				if (ret < 0)
+				if (ret <= 0)
 					goto exit;
 				i++;
 
+				fsleep(1);
 			} while ((ret == 1) && (i < 10));
 
 			if (i == 10)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
