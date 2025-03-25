Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D850FA6FA83
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 12:59:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 980CBC78F77;
	Tue, 25 Mar 2025 11:59:15 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8781CC78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 11:59:12 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso3262879f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 04:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742903952; x=1743508752;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=T/UNuURSLtrCWfGxAweNNVcnSfgmRZrsQu62GBrBcJ8=;
 b=Q5299JNrMiO966srF34TCZxiAFUrcNEb2t+xpeHZCBJ8+q4P5PN1yzzI4NMz/XKToT
 2OIJrcYH+09gRhJo5KA5cUUZb9CEp/mnUGqFXbdQhzpsqwel3q4mIejq9WmTV9ppQOmu
 3iDmoqgsbHWUQtzCjvHMTuyVeeEXXOgkDQhj2RE8KSLJq+q2JEmUEAa+ZFv8b0H2WW41
 j8YXIlTF6+eDI+SnoMhPOMBTgJAxRQHY7mr1Wcwq+4sI5nO67cNwoWOGJs212ZNIQK06
 J/7jLOj3lJwtzEK9Fwb6B8xuOLGzf5WrKSk+VsU3kzJlbRU8EiOsEW2aplKrsSaCDnAL
 CXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742903952; x=1743508752;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T/UNuURSLtrCWfGxAweNNVcnSfgmRZrsQu62GBrBcJ8=;
 b=aVRCjerrANBMYN4i09aylqy6ZV+fDGL/GCmAZ/tJXadjZeHed7t+iZvMsOpc1PMsQH
 cptOaPK/DFUDUiMsGVBpXdqLT3wPgQjayCBo6LBWRFVVVzrUdei3EjCgpJAFA2mAAY3G
 xq4F3R41oZuQ+8OMZ9tFxxgntzlKq5DMka9bvWl9ZzJnQRyzZfRmxDCvSOVneqNyZVEZ
 2gPE1ot3p1d73DvF0OWaaBQxguEUCwhWoEW9GE2DUsfAb6QOT/08x+/cva2r5XDpXPUe
 9q8a6ScPMzXl9WsIELwUrRBjuPoF2ng/N9cOJlBm6IPzqPTd+6kIS2OmmcFnT2Wxonn3
 xRcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN71QRTl13sGWUz+TsmwYTAFyq+JeTK0cunkVh/5yHGU//kyzTiP9QD4ursI+evpNldA2oWsL4g9GqlA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwBmJNahW+W4+tv/iYuiU0+lFgpl4kTk7agNCK23A41XofUwxVv
 zntrRvt0KuEe2bol/P/Rl5P2NhJgZiE7gcYeoTsmoiNQ+BDUWDaWYuJZaqnyNpk=
X-Gm-Gg: ASbGncvyKUyXImJLxk9RvgnOkItaV7uB3OpIuefRopeU3W6friyzo+yram9wLPS1gPA
 9bba7+b+2M3fw0wfTcUkqxn1n7+khQxJWolBduq6KVYUVzg+26Z0vEZy/RF9NViVcR01R/joCow
 fq6ZMcWJibqBYZ5IhNfPmDv/+A0kTmfvIAMOX4uWjra1sAvkJQqftDJW1JvuAUKth12yPqXvzKA
 yYVOjZDN+kdZQeDTsjLjTvLX31D6lA71kVLpydYB5icFj8vHosT3AdewkGKMGmAIFPT2VLJ+phZ
 b1hTceJG+0s0TSG0NoyNCOr69NrxnedOp8PNQLURcBz5awYF
X-Google-Smtp-Source: AGHT+IF8Oewoyaq+XKBMLaCapfCjhogHik6lfiKnm8UQ3WRDy17FimEPzUr4FkQxrwT2uHaots6ZYg==
X-Received: by 2002:a05:6000:2b0c:b0:391:4bfd:6d5 with SMTP id
 ffacd0b85a97d-3997f9389d0mr9529129f8f.52.1742903951913; 
 Tue, 25 Mar 2025 04:59:11 -0700 (PDT)
Received: from [10.42.0.1] ([145.224.90.136]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6676sm13687169f8f.62.2025.03.25.04.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 04:59:11 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 25 Mar 2025 11:58:50 +0000
MIME-Version: 1.0
Message-Id: <20250325-james-coresight-claim-tags-v4-5-dfbd3822b2e5@linaro.org>
References: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
In-Reply-To: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
X-Mailer: b4 0.14.0
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 5/7] coresight: Clear self hosted claim tag
	on probe
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

This can be left behind from a crashed kernel after a kexec so clear it
when probing each device. Clearing the self hosted bit even when claimed
externally is harmless, so do it unconditionally.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 1 +
 drivers/hwtracing/coresight/coresight-cti-core.c   | 2 ++
 drivers/hwtracing/coresight/coresight-etb10.c      | 2 ++
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 1 +
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 ++
 drivers/hwtracing/coresight/coresight-funnel.c     | 1 +
 drivers/hwtracing/coresight/coresight-replicator.c | 1 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
 8 files changed, 11 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index fa170c966bc3..deaacfd875af 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -558,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
 	catu_desc.ops = &catu_ops;
 
+	coresight_clear_self_claim_tag(&catu_desc.access);
 	drvdata->csdev = coresight_register(&catu_desc);
 	if (IS_ERR(drvdata->csdev))
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 80f6265e3740..8fb30dd73fd2 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -931,6 +931,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	cti_desc.ops = &cti_ops;
 	cti_desc.groups = drvdata->ctidev.con_groups;
 	cti_desc.dev = dev;
+
+	coresight_clear_self_claim_tag(&cti_desc.access);
 	drvdata->csdev = coresight_register(&cti_desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 7948597d483d..2bfcb669aa84 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -772,6 +772,8 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etb_groups;
+
+	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index cfd463ac715c..1c6204e14422 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -764,6 +764,7 @@ static void etm_init_arch_data(void *info)
 	drvdata->nr_ext_out = BMVAL(etmccr, 20, 22);
 	drvdata->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
 
+	coresight_clear_self_claim_tag_unlocked(&drvdata->csa);
 	etm_set_pwrdwn(drvdata);
 	etm_clr_pwrup(drvdata);
 	CS_LOCK(drvdata->csa.base);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index e5972f16abff..52c9aa56e8b9 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1372,6 +1372,8 @@ static void etm4_init_arch_data(void *info)
 	drvdata->nrseqstate = FIELD_GET(TRCIDR5_NUMSEQSTATE_MASK, etmidr5);
 	/* NUMCNTR, bits[30:28] number of counters available for tracing */
 	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
+
+	coresight_clear_self_claim_tag_unlocked(csa);
 	etm4_cs_lock(drvdata, csa);
 	cpu_detect_trace_filtering(drvdata);
 }
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0541712b2bcb..7249cc356ccb 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -255,6 +255,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 		drvdata->base = base;
 		desc.groups = coresight_funnel_groups;
 		desc.access = CSDEV_ACCESS_IOMEM(base);
+		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	dev_set_drvdata(dev, drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index ee7ee79f6cf7..b2acd4535c74 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -284,6 +284,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	desc.pdata = dev->platform_data;
 	desc.dev = dev;
 
+	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index a7814e8e657b..a09579eff3fd 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -869,6 +869,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 	desc.pdata = pdata;
 
+	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
