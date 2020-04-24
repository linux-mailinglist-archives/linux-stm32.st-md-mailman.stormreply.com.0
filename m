Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E23681B807E
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 22:25:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A95D6C36B0C;
	Fri, 24 Apr 2020 20:25:19 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 947DCC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 20:25:14 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id a5so4335302pjh.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8pkHvjPLwA96bIGz2NSSF7mXbbhD0VV71pWPGube4rE=;
 b=bBYjk7oGchLHLu2fhyb+5w8E3eMQmDXLajYwnSEoNKZRaYmkH0vi8FbFTDbUvVRsr8
 1kQ/9bmhSE9nEd0h8GciZnigyFT77H7YY3aEtLzrHHMfMG/paQO+0fWET24ArhZqHg3c
 vqdwlGoPskGInUqnaGxRnd2S8rBW6Fmj3W7VsY8JPtJkKnY/T5nKIfI7iR74vB69yuvV
 LmlaLQ8SiaFPpCkXS+0veavIxJ+YUQQsis25rSSvRTKWi/soBPN2Bdaf8IYVJ0TNJuqM
 zs5BXVrG20QdavJxkRWBiRJ0w9dkN4jxu1vN6mAggY6wBIiWECeO1jFR6r+iMr8S6B1k
 HarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8pkHvjPLwA96bIGz2NSSF7mXbbhD0VV71pWPGube4rE=;
 b=nVztyizqXv/LV3r85wy2OmFy9ai6WfeCq6dzPo4EI0t5r8sc1cV5yQPgjFCiFeWhQY
 Vw1vqo7KY8mC6hjqSEzntnP8z+PhV69nvlRuvpCwVjyfP9GTXZXl7v5JPfM+iat+nfR+
 PWATN921vdd4pKBGMpKMAiKocH57N6sSBv8w6AVvb7uuT8XTRlyvcy+xTuG6FUNsnOT9
 /UgLSa9QynGg/klSUcazAnahSgV6nzIOl7QTSvpMLrss1JZ7QeJOtVD4IJ2HmJNhePy6
 zasqAiG2SoSRL7rjGccL98lHp4+PayerlJZ4iXJ+rPtsP0DPIP6TZpkHQw6Jao4hPPig
 MV5g==
X-Gm-Message-State: AGi0Pub5NWyvJ2+HyRRSD6unNvuJRa2eKIcjbjnxTMH0DZve7/0/JtHL
 owXUbsO9m4bH+o9WKOz+yd4Fyw==
X-Google-Smtp-Source: APiQypI45S+tU5qGacvuJcZRdZ1Rko8UnR0Z/uIU3/5Gk8Rmx2uzncC3GiqshF8IMa1UpBS4OILd+Q==
X-Received: by 2002:a17:90a:101:: with SMTP id
 b1mr8385987pjb.154.1587759913129; 
 Fri, 24 Apr 2020 13:25:13 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 13:25:12 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Fri, 24 Apr 2020 14:24:58 -0600
Message-Id: <20200424202505.29562-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 05/12] remoteproc: stm32: Parse syscon that
	will manage M4 synchronisation
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

Get from the DT the syncon to probe the state of the remote processor
and the location of the resource table.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 658439d4b00a..a285f338bed8 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -70,6 +70,8 @@ struct stm32_rproc {
 	struct reset_control *rst;
 	struct stm32_syscon hold_boot;
 	struct stm32_syscon pdds;
+	struct stm32_syscon m4_state;
+	struct stm32_syscon rsctbl;
 	int wdg_irq;
 	u32 nb_rmems;
 	struct stm32_rproc_mem *rmems;
@@ -606,6 +608,30 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	*auto_boot = of_property_read_bool(np, "st,auto-boot");
 
+	/*
+	 * See if we can check the M4 status, i.e if it was started
+	 * from the boot loader or not.
+	 */
+	err = stm32_rproc_get_syscon(np, "st,syscfg-m4-state",
+				     &ddata->m4_state);
+	if (err) {
+		/* remember this */
+		ddata->m4_state.map = NULL;
+		/* no coprocessor state syscon (optional) */
+		dev_warn(dev, "m4 state not supported\n");
+
+		/* no need to go further */
+		return 0;
+	}
+
+	/* See if we can get the resource table */
+	err = stm32_rproc_get_syscon(np, "st,syscfg-rsc-tbl",
+				     &ddata->rsctbl);
+	if (err) {
+		/* no rsc table syscon (optional) */
+		dev_warn(dev, "rsc tbl syscon not supported\n");
+	}
+
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
