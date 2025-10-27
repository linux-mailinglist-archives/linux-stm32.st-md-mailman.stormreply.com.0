Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B86C0D43A
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 12:50:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 875DCC6047F;
	Mon, 27 Oct 2025 11:50:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F543C6047B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 11:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761565836; x=1793101836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j468xXoR9cr3OXREFcfRw79OYR6IigAtpibsNTQMHX8=;
 b=fiiEdKmWoL5LlIVz3LUl6+6Wvh+lkamxrmzv+zHHmLwpcxiDEbAswzSH
 kXYJi/LDY/vNiYKTtJ0MdgiT/f8yLIpJYNyabZGS6jJY0bW2XtnnS/lSS
 GnLkw1GBAXU6X0bvl8p6OKNsgkGXYu3jJtfMZcsR/vQac0Cu4DTuEiLw8
 guz4/UOjbYFjs1OIQBOOHCP5I9XPg+NZO5BaXMPYdcwBIblly8kmMyZjS
 siHbFIzTl1pvh0IKB6ks/lEmjq++XDZ4H2FdU+6RXvX6YiQZIuQqjmjKw
 C+F9dHqOtUh6BpKG7n94KDLeHrU2YFIu9y+QxRAfmYlu2g2U9njyvLojj g==;
X-CSE-ConnectionGUID: mi/GxlB0SYS4hLJ89jeGsA==
X-CSE-MsgGUID: WuR5Y3c9Q5+Bcauk+/BxRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75088058"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="75088058"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:50:35 -0700
X-CSE-ConnectionGUID: ewcYyfhlT66sdCovZySfjA==
X-CSE-MsgGUID: UsAuCo6QT/a82eNu+1Oo3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184922007"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.244.31])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:50:25 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id E87C7121EFA;
 Mon, 27 Oct 2025 13:50:22 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
 (envelope-from <sakari.ailus@linux.intel.com>)
 id 1vDLjy-00000001dis-3lbe; Mon, 27 Oct 2025 13:50:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: netdev@vger.kernel.org
Date: Mon, 27 Oct 2025 13:50:22 +0200
Message-ID: <20251027115022.390997-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027115022.390997-1-sakari.ailus@linux.intel.com>
References: <20251027115022.390997-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Ingo Molnar <mingo@kernel.org>, Michael Nemanov <michael.nemanov@ti.com>,
 Roopni Devanathan <quic_rdevanat@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 linux-stm32@st-md-mailman.stormreply.com, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Paolo Abeni <pabeni@redhat.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Stephan Gerhold <stephan@gerhold.net>, Liu Haijun <haijun.liu@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Paul Barker <paul@pbarker.dev>, Roger Quadros <rogerq@kernel.org>,
 Wei Fang <wei.fang@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH RESEND 4/4] net: wwan: Remove redundant
	pm_runtime_mark_last_busy() calls
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/net/wwan/qcom_bam_dmux.c           | 2 --
 drivers/net/wwan/t7xx/t7xx_hif_cldma.c     | 3 ---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c | 2 --
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 2 --
 4 files changed, 9 deletions(-)

diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index 64dab8b57611..6a5b22589af4 100644
--- a/drivers/net/wwan/qcom_bam_dmux.c
+++ b/drivers/net/wwan/qcom_bam_dmux.c
@@ -162,7 +162,6 @@ static void bam_dmux_tx_done(struct bam_dmux_skb_dma *skb_dma)
 	struct bam_dmux *dmux = skb_dma->dmux;
 	unsigned long flags;
 
-	pm_runtime_mark_last_busy(dmux->dev);
 	pm_runtime_put_autosuspend(dmux->dev);
 
 	if (skb_dma->addr)
@@ -397,7 +396,6 @@ static void bam_dmux_tx_wakeup_work(struct work_struct *work)
 	dma_async_issue_pending(dmux->tx);
 
 out:
-	pm_runtime_mark_last_busy(dmux->dev);
 	pm_runtime_put_autosuspend(dmux->dev);
 }
 
diff --git a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
index 97163e1e5783..689c920ca898 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
@@ -250,7 +250,6 @@ static void t7xx_cldma_rx_done(struct work_struct *work)
 	t7xx_cldma_clear_ip_busy(&md_ctrl->hw_info);
 	t7xx_cldma_hw_irq_en_txrx(&md_ctrl->hw_info, queue->index, MTK_RX);
 	t7xx_cldma_hw_irq_en_eq(&md_ctrl->hw_info, queue->index, MTK_RX);
-	pm_runtime_mark_last_busy(md_ctrl->dev);
 	pm_runtime_put_autosuspend(md_ctrl->dev);
 }
 
@@ -362,7 +361,6 @@ static void t7xx_cldma_tx_done(struct work_struct *work)
 	}
 	spin_unlock_irqrestore(&md_ctrl->cldma_lock, flags);
 
-	pm_runtime_mark_last_busy(md_ctrl->dev);
 	pm_runtime_put_autosuspend(md_ctrl->dev);
 }
 
@@ -987,7 +985,6 @@ int t7xx_cldma_send_skb(struct cldma_ctrl *md_ctrl, int qno, struct sk_buff *skb
 
 allow_sleep:
 	t7xx_pci_enable_sleep(md_ctrl->t7xx_dev);
-	pm_runtime_mark_last_busy(md_ctrl->dev);
 	pm_runtime_put_autosuspend(md_ctrl->dev);
 	return ret;
 }
diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index 2310493203d3..b76bea6ab2d7 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -877,7 +877,6 @@ int t7xx_dpmaif_napi_rx_poll(struct napi_struct *napi, const int budget)
 		t7xx_dpmaif_clr_ip_busy_sts(&rxq->dpmaif_ctrl->hw_info);
 		t7xx_dpmaif_dlq_unmask_rx_done(&rxq->dpmaif_ctrl->hw_info, rxq->index);
 		t7xx_pci_enable_sleep(rxq->dpmaif_ctrl->t7xx_dev);
-		pm_runtime_mark_last_busy(rxq->dpmaif_ctrl->dev);
 		pm_runtime_put_autosuspend(rxq->dpmaif_ctrl->dev);
 		atomic_set(&rxq->rx_processing, 0);
 	} else {
@@ -1078,7 +1077,6 @@ static void t7xx_dpmaif_bat_release_work(struct work_struct *work)
 	}
 
 	t7xx_pci_enable_sleep(dpmaif_ctrl->t7xx_dev);
-	pm_runtime_mark_last_busy(dpmaif_ctrl->dev);
 	pm_runtime_put_autosuspend(dpmaif_ctrl->dev);
 }
 
diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
index 8dab025a088a..236d632cf591 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
@@ -185,7 +185,6 @@ static void t7xx_dpmaif_tx_done(struct work_struct *work)
 	}
 
 	t7xx_pci_enable_sleep(dpmaif_ctrl->t7xx_dev);
-	pm_runtime_mark_last_busy(dpmaif_ctrl->dev);
 	pm_runtime_put_autosuspend(dpmaif_ctrl->dev);
 }
 
@@ -468,7 +467,6 @@ static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 		t7xx_pci_disable_sleep(dpmaif_ctrl->t7xx_dev);
 		t7xx_do_tx_hw_push(dpmaif_ctrl);
 		t7xx_pci_enable_sleep(dpmaif_ctrl->t7xx_dev);
-		pm_runtime_mark_last_busy(dpmaif_ctrl->dev);
 		pm_runtime_put_autosuspend(dpmaif_ctrl->dev);
 	}
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
