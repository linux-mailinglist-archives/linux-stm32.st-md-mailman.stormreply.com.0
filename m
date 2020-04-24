Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C8B1B808A
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 22:25:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C4B0C36B11;
	Fri, 24 Apr 2020 20:25:25 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF2B6C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 20:25:22 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z1so3657627pfn.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kG2iXiDOAlrBuv2wqeB6r8YKH3F8C14k21yMdoM6KR8=;
 b=IYmAPTxMHxW01D1OdVg6js0cI3JraeOKhnKiDvx7CwBKWa6HBJ5zMo2JXOk06e/Sk6
 z+nio/13fncpMdAUX7spt/kaAdFvjjhFr27I5IGkEnpyq5itIbJ0DZadSC1kV0kfU/VG
 KIXb/wx4Kwy0Mv7cMRsloIra5uyuvT9FtN9fxkamelqavtEsRm76jY+Wvkc4oyMTAquw
 rC3J1uAtJ2ew8ID6OijjWwnBJ8HaNk8LwVmSMfuZ5btvxQLoMOiTZl0oQtLYU4f9iD3j
 WRpWAniZVy7XJpx+Zexi4t9p9A9yjEGUR2K8OpOexgNyGxG/SY7LUmS5ytP8iAuFCN7J
 yHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kG2iXiDOAlrBuv2wqeB6r8YKH3F8C14k21yMdoM6KR8=;
 b=SzAI3SJlPqkLldQPybfIBL4u8EMhycWrKvShcXpSjSdzE/J80WlMs1G93igV9N6AGf
 JRarE7xHFfr9eJvi4CUDC7k8xxKzqq0SS36HdjQTFo4NqOHz8NxdeZRXXVzC2Dt8rl/l
 1Xd2ooXWHeYBFJci6o27GuaSpIOvtISj6WES2GF0ssVgMM17InIirhpAdvkOmb8BTYKt
 5gtuZ1mrQd1lxTNwAev6O0BX9j5NgxPO8ydXkPXadaq/CwQ6tpGlbXnC3UxkzZfKCAZK
 ztLkADSSadfRfbpZLFPadHaDqvYjsIybpIlHXUWmXkNzKMhfs7lCrwrUYhMS8hyzyjzE
 zxTw==
X-Gm-Message-State: AGi0PuZYmW5TwN6mG/LTmBVv53aroKAt2sTQXe6YwPjYZ1KqCzTcTy9A
 k78MuqYjQSNXT86xpP9+WnNP8A==
X-Google-Smtp-Source: APiQypKviZ6PkeE83136I1kJAdKrTrljVnv7Q8b8j/LsmS+zqipjOpZk/taRmaQdP/cWXjJXLqB8TA==
X-Received: by 2002:a63:4a59:: with SMTP id j25mr10666444pgl.336.1587759921334; 
 Fri, 24 Apr 2020 13:25:21 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 13:25:20 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Fri, 24 Apr 2020 14:25:05 -0600
Message-Id: <20200424202505.29562-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 12/12] remoteproc: stm32: Set
	synchronisation state machine if needed
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

Set the flags and operations to use if the M4 has been started
by another entity than the remoteproc core.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index dcae6103e3df..02dad3f51c7a 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -598,13 +598,20 @@ static struct rproc_ops st_rproc_ops = {
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
-static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
+static struct rproc_ops st_rproc_sync_ops = {
 	.start		= stm32_rproc_sync_start,
 	.stop		= stm32_rproc_stop,
+	.kick		= stm32_rproc_kick,
 	.parse_fw       = stm32_rproc_sync_parse_fw,
 	.find_loaded_rsc_table = stm32_rproc_sync_elf_find_loaded_rsc_table,
 };
 
+static struct rproc_sync_flags st_sync_flags = {
+	.on_init = true, /* sync with MCU when the kernel boots */
+	.after_stop = false, /* don't resync with MCU if stopped from sysfs */
+	.after_crash = false, /* don't resync with MCU after a crash */
+};
+
 static const struct of_device_id stm32_rproc_match[] = {
 	{ .compatible = "st,stm32mp1-m4" },
 	{},
@@ -803,6 +810,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
 	struct rproc *rproc;
+	struct rproc_sync_flags sync_flags = {0};
 	unsigned int state;
 	bool auto_boot = false;
 	int ret;
@@ -837,11 +845,17 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	}
 
 	if (state == M4_STATE_CRUN) {
+		auto_boot = true;
+		sync_flags = st_sync_flags;
 		ret = stm32_rproc_get_loaded_rsc_table(pdev, ddata);
 		if (ret)
 			goto free_rproc;
 	}
 
+	ret = rproc_set_state_machine(rproc, &st_rproc_sync_ops, sync_flags);
+	if (ret)
+		goto free_rproc;
+
 	rproc->auto_boot = auto_boot;
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
