Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4038A6A8AB
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 15:35:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3639AC78F75;
	Thu, 20 Mar 2025 14:35:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 688DCC78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 14:35:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so5309745e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742481314; x=1743086114;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JDldgEKP21N20uoAtepE5Q3RPhmylKc6wagJ8mfYRwY=;
 b=nxla7HJRnkBVJBqo8Y6mKkAW+CGI8Ci9IQTVNs0Jh34t3obIKXNreU7g044z9ZCBbe
 ZkAUFXO4PbK38rSwU6J5JQ3TPariDo5fA9bJmQ1YVHDDq7PlWhlxHbhyY1B8D+/xGzAQ
 3RhjorWXgWKwpr9cA1pM0GmdBeFOeQg233Fc3XRMucymH4uhelLLLQuS7Xxm7brThy2I
 q6dO0QAnB1NKFHzMB3UZhla+4RYuSO9BChVgSzcBsQVTNZMckWvIJv9kP4jDOW8+qRD+
 leUHynT7tNOIpL15W+9npbraPECjq4gBkfgd2jcx66ZEl3uJAfVECZtlr4VQGf8IrIXz
 OvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742481314; x=1743086114;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JDldgEKP21N20uoAtepE5Q3RPhmylKc6wagJ8mfYRwY=;
 b=NpTrsFiUVq2mUybQhhpEd09/evp3kVwlRmac5HCrSpSqSQh7r6x++4/Rkz29xQ62WL
 y2R8lZuAQIjCrebZG1ANLcCY/qfaaQ8+MUsBz1PlBg9L7fyDIA6EGeNMDD+NpxVESUmI
 SNFNuwqnOT5scZ1j65GO4qzuK8Jl5Q05tSvUfmlRF56pt8PKw88KsXu5pX+mLSikv5YZ
 X+m6lOUQIoIXY7e7uW5TD9zPkPZNdJ6Mdzhs7YBXQjHL1tkByJ77UhSkJWVJGNGPtAfG
 J7+TDnthxNInlVXyNhOof607RrtfkRZ0OGVDpxSNehOC5HX9jdzuFtfKMJDARvyXNB6D
 n1Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsJWhBZZF1g7RTKs86N6t8wIQaK3jhX/Xmdx+GkatnX+RvPgLdQdS7S4F0trSYLOtEpfnFKQka90sKbg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy/3FPQ/GsKb2p6yY88qczeeSROLPJeOybOvYSxT2P5BamzQEbN
 yWRujyA/HOlGCk7jZIUF1xOkbW+qFc/x9bHZ+N+/LkwzvOULNTJ+l1/VBh+/XEY=
X-Gm-Gg: ASbGncuv9UbHBjwaKGTFiBaVuhuUHshY05HYvXqa1IsAYtaCSwsmjePobdY8rOh5rWy
 oeilAdotjt7vbTp+CuCqh8SYxMCEI8rOgSkZMMW4dwuXDzrmoWpoNCayEjxo5a5sXsBd/l36xzv
 dCTH3OVVDRYtYztZcHyijn5okD7K4y4/tJfBmqRcBUanVx4292OgZyoXPi0y7e2Q3ZRDLdUfa8v
 QAmOe3AK86uj6p8TPWSxOxeRei7IZ8GffZJiol9DIyFLlLjOI4UKYPzrprvuKgl2PPeMfKAf5PJ
 uT6bRSM6UVkOxTEseOPFDjfIPVGRyN93cR2SFA4mVqgFWAk=
X-Google-Smtp-Source: AGHT+IFP4ya3uVnn9lss7Z9uy/QUwk8dHMMYU3s0EZOI0v9F/UhLzEo0uzWD2sePXj7PQ3GAwNSmkA==
X-Received: by 2002:a05:600c:1da1:b0:43c:fe15:41d4 with SMTP id
 5b1f17b1804b1-43d437c3379mr75983075e9.18.1742481313810; 
 Thu, 20 Mar 2025 07:35:13 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm24238187f8f.31.2025.03.20.07.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 07:35:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 20 Mar 2025 14:34:14 +0000
MIME-Version: 1.0
Message-Id: <20250320-james-coresight-claim-tags-v3-5-d3145c153820@linaro.org>
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
In-Reply-To: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
X-Mailer: b4 0.14.0
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 5/7] coresight: Clear self hosted claim tag
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
