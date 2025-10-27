Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE87C0D431
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 12:50:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51DACC6047A;
	Mon, 27 Oct 2025 11:50:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CC04C6046D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 11:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761565836; x=1793101836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Nq4OsIRGvzLFnYkMUeCuaM3aAF/kNBZikR/j5G0pus=;
 b=EdLzUZzXnUM6+hwJBoHIWJqefh8s71E5/o3dAUtXiYD3y/iIW5mjegxi
 gONlJp21IfJsi0D478EeM6mYl8ThttV66UP/EFg69UMMR0G9iZA8bf/0l
 D+8R0dQwKfV4AJDcoa/bNJAPDfbYahPbtI/htH/2uLBx4gVuygUml9vq0
 Y+Ro9QehiBW/RlOBZcPZDlF3Zg4DzDAXWmIIbrywBZRPratJlGkjfWOW6
 FsaN+5wlof751+/fOTbwV8pKUoWHnjTKXyGfkC2oUfiY9kDH0YEPSKIgn
 U6vKoEjamV8DeiqmySScJfFwsaftL94tHyZQbPMazVGuIkGCv+Zj+kgit g==;
X-CSE-ConnectionGUID: ON+JZ8COTF2FGqDWeQ2XPw==
X-CSE-MsgGUID: TApot9+OSvenojAkKNnNkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81272554"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="81272554"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:50:34 -0700
X-CSE-ConnectionGUID: yf4hwXKdT0u1qNVHr+E5xA==
X-CSE-MsgGUID: S5tKJIZWSy+k3nbfHateeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185370930"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.244.31])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:50:25 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id E4FCC121EC5;
 Mon, 27 Oct 2025 13:50:22 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
 (envelope-from <sakari.ailus@linux.intel.com>)
 id 1vDLjy-00000001dik-3coj; Mon, 27 Oct 2025 13:50:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: netdev@vger.kernel.org
Date: Mon, 27 Oct 2025 13:50:20 +0200
Message-ID: <20251027115022.390997-2-sakari.ailus@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH RESEND 2/4] net: ipa: Remove redundant
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
 drivers/net/ipa/ipa_interrupt.c | 1 -
 drivers/net/ipa/ipa_main.c      | 1 -
 drivers/net/ipa/ipa_modem.c     | 4 ----
 drivers/net/ipa/ipa_smp2p.c     | 2 --
 drivers/net/ipa/ipa_uc.c        | 2 --
 5 files changed, 10 deletions(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index 245a06997055..8336596b1247 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -149,7 +149,6 @@ static irqreturn_t ipa_isr_thread(int irq, void *dev_id)
 		iowrite32(pending, ipa->reg_virt + reg_offset(reg));
 	}
 out_power_put:
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 
 	return IRQ_HANDLED;
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 25500c5a6928..95a61bae3124 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -903,7 +903,6 @@ static int ipa_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_deconfig;
 done:
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/net/ipa/ipa_modem.c b/drivers/net/ipa/ipa_modem.c
index 8fe0d0e1a00f..9b136f6b8b4a 100644
--- a/drivers/net/ipa/ipa_modem.c
+++ b/drivers/net/ipa/ipa_modem.c
@@ -71,7 +71,6 @@ static int ipa_open(struct net_device *netdev)
 
 	netif_start_queue(netdev);
 
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -102,7 +101,6 @@ static int ipa_stop(struct net_device *netdev)
 	ipa_endpoint_disable_one(priv->rx);
 	ipa_endpoint_disable_one(priv->tx);
 out_power_put:
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -175,7 +173,6 @@ ipa_start_xmit(struct sk_buff *skb, struct net_device *netdev)
 
 	ret = ipa_endpoint_skb_tx(endpoint, skb);
 
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 
 	if (ret) {
@@ -432,7 +429,6 @@ static void ipa_modem_crashed(struct ipa *ipa)
 		dev_err(dev, "error %d zeroing modem memory regions\n", ret);
 
 out_power_put:
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 }
 
diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
index fcaadd111a8a..420098796eec 100644
--- a/drivers/net/ipa/ipa_smp2p.c
+++ b/drivers/net/ipa/ipa_smp2p.c
@@ -171,7 +171,6 @@ static irqreturn_t ipa_smp2p_modem_setup_ready_isr(int irq, void *dev_id)
 	WARN(ret != 0, "error %d from ipa_setup()\n", ret);
 
 out_power_put:
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 
 	return IRQ_HANDLED;
@@ -213,7 +212,6 @@ static void ipa_smp2p_power_release(struct ipa *ipa)
 	if (!ipa->smp2p->power_on)
 		return;
 
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 	ipa->smp2p->power_on = false;
 }
diff --git a/drivers/net/ipa/ipa_uc.c b/drivers/net/ipa/ipa_uc.c
index 2963db83ab6b..dc7e92f2a4fb 100644
--- a/drivers/net/ipa/ipa_uc.c
+++ b/drivers/net/ipa/ipa_uc.c
@@ -158,7 +158,6 @@ static void ipa_uc_response_hdlr(struct ipa *ipa)
 		if (ipa->uc_powered) {
 			ipa->uc_loaded = true;
 			ipa_power_retention(ipa, true);
-			pm_runtime_mark_last_busy(dev);
 			(void)pm_runtime_put_autosuspend(dev);
 			ipa->uc_powered = false;
 		} else {
@@ -203,7 +202,6 @@ void ipa_uc_deconfig(struct ipa *ipa)
 	if (!ipa->uc_powered)
 		return;
 
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 }
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
