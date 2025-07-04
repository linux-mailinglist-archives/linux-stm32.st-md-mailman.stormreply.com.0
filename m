Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC25AF8A10
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 09:54:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 285E4C36B19;
	Fri,  4 Jul 2025 07:54:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76A56C36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751615651; x=1783151651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=egUHL6RyLJfuRq1gVjjLudjmpTQnx+4gpQe9sleSvp8=;
 b=Ks6VBj1yQjCv+c27M89rcJP0mRijATTcUhyhmwnRlZ5V8sVJ2vkJXQnK
 0lCvzVqx1qhmtFu3rJ0KYYA8N4XRhwGSoLjR10y7SohJpbbAsOFtMsZds
 9/1GE3Shpk57+lUTI4YkREa0ockfOh0oZfotp6sL8IYMWxcMNMVMhwV2u
 IX5/xzE0mfxDbVok0rqBmYMYzWASQi89qWqOB0ZNT823qgShv7cW4pBKf
 mlG6dOf379X20XJr1eFO6qfD+Eb/NU95YzzmF4IE0UcAGtvrKbeacS6Ck
 Bc/kokw2Sp7qlOaeTWf7lJ/AMVqVbtkFY654zd0tgjMeZOt3Dpp/4LC/x g==;
X-CSE-ConnectionGUID: w/laCP1nS06W+5wkeRyAbg==
X-CSE-MsgGUID: QMbgf2AYTe6pavl/dow55Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494493"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="76494493"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:09 -0700
X-CSE-ConnectionGUID: phoA/CdOScGQ5w7h4YAwIw==
X-CSE-MsgGUID: nyKMon0+Sb2jJnHLR6QVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="158924179"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 svinhufvud.fi.intel.com) ([10.245.244.244])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:05 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
 by svinhufvud.fi.intel.com (Postfix) with ESMTP id AF13844419;
 Fri,  4 Jul 2025 10:54:02 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Gilad Ben-Yossef <gilad@benyossef.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Weili Qian <qianweili@huawei.com>,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Biggers <ebiggers@google.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Fri,  4 Jul 2025 10:54:02 +0300
Message-Id: <20250704075402.3217279-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 08/80] crypto: Remove redundant
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
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/crypto/ccree/cc_pm.c      | 1 -
 drivers/crypto/hisilicon/qm.c     | 1 -
 drivers/crypto/omap-aes-gcm.c     | 1 -
 drivers/crypto/omap-aes.c         | 1 -
 drivers/crypto/omap-des.c         | 1 -
 drivers/crypto/omap-sham.c        | 1 -
 drivers/crypto/stm32/stm32-cryp.c | 1 -
 drivers/crypto/stm32/stm32-hash.c | 1 -
 8 files changed, 8 deletions(-)

diff --git a/drivers/crypto/ccree/cc_pm.c b/drivers/crypto/ccree/cc_pm.c
index 6124fbbbed94..bbd118f8de0e 100644
--- a/drivers/crypto/ccree/cc_pm.c
+++ b/drivers/crypto/ccree/cc_pm.c
@@ -77,6 +77,5 @@ int cc_pm_get(struct device *dev)
 
 void cc_pm_put_suspend(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index 7c41f9593d03..2e4ee7ecfdfb 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -912,7 +912,6 @@ static void qm_pm_put_sync(struct hisi_qm *qm)
 	if (!test_bit(QM_SUPPORT_RPM, &qm->caps))
 		return;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index c498950402e8..1f4586509ca4 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -38,7 +38,6 @@ static void omap_aes_gcm_finish_req(struct omap_aes_dev *dd, int ret)
 
 	crypto_finalize_aead_request(dd->engine, req, ret);
 
-	pm_runtime_mark_last_busy(dd->dev);
 	pm_runtime_put_autosuspend(dd->dev);
 }
 
diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index 1ecf5f6ac04e..244e24e52987 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -400,7 +400,6 @@ static void omap_aes_finish_req(struct omap_aes_dev *dd, int err)
 
 	crypto_finalize_skcipher_request(dd->engine, req, err);
 
-	pm_runtime_mark_last_busy(dd->dev);
 	pm_runtime_put_autosuspend(dd->dev);
 }
 
diff --git a/drivers/crypto/omap-des.c b/drivers/crypto/omap-des.c
index a099460d5f21..9c5538ae17db 100644
--- a/drivers/crypto/omap-des.c
+++ b/drivers/crypto/omap-des.c
@@ -489,7 +489,6 @@ static void omap_des_finish_req(struct omap_des_dev *dd, int err)
 
 	crypto_finalize_skcipher_request(dd->engine, req, err);
 
-	pm_runtime_mark_last_busy(dd->dev);
 	pm_runtime_put_autosuspend(dd->dev);
 }
 
diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 56f192cb976d..6328e8026b91 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -1167,7 +1167,6 @@ static void omap_sham_finish_req(struct ahash_request *req, int err)
 	dd->flags &= ~(BIT(FLAGS_FINAL) | BIT(FLAGS_CPU) |
 			BIT(FLAGS_DMA_READY) | BIT(FLAGS_OUTPUT_READY));
 
-	pm_runtime_mark_last_busy(dd->dev);
 	pm_runtime_put_autosuspend(dd->dev);
 
 	ctx->offset = 0;
diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index 5ce88e7a8f65..a89b4c5d62a0 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -851,7 +851,6 @@ static void stm32_cryp_finish_req(struct stm32_cryp *cryp, int err)
 	if (!err && (!(is_gcm(cryp) || is_ccm(cryp) || is_ecb(cryp))))
 		stm32_cryp_get_iv(cryp);
 
-	pm_runtime_mark_last_busy(cryp->dev);
 	pm_runtime_put_autosuspend(cryp->dev);
 
 	if (is_gcm(cryp) || is_ccm(cryp))
diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 768b27de4737..a4436728b0db 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -1373,7 +1373,6 @@ static void stm32_hash_unprepare_request(struct ahash_request *req)
 		*preg++ = stm32_hash_read(hdev, HASH_CSR(i));
 
 pm_runtime:
-	pm_runtime_mark_last_busy(hdev->dev);
 	pm_runtime_put_autosuspend(hdev->dev);
 }
 
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
