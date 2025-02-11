Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CB9A308D4
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 11:40:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F058C7A820;
	Tue, 11 Feb 2025 10:40:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF3B8C78F9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 10:40:39 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so53523285e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 02:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739270439; x=1739875239;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKjlxs2/NLZM1oTa5EiDclwanqKKN/FNJx7pDcED3LQ=;
 b=aeWC9Ysn3d4jypFn6F4mciAudIsR11FqiEg9po/Eo5IAO+XmCPm4nT334NSvvKTFRp
 lACa2AqyGzHpadL4yydQ6qihP3Mk9+a+csUwFmxbFioRovUFKU3jpRwwgmLnlC4PpjpC
 NWNign86hmIEaD97tHasQqyOsVRaPyqGSkcemLghbu0iUd3cOpStoB8K0NbR196+lYxi
 bncI3lI4lBjQhkoArLJ3x84m9qaKx1LoULBk7TyKhGzGv0L+JbwfYJcoHRdt2rArF3to
 rYZ087aI5js1YwMjtrb6Euq6U/Quj+oFHx553lPFjlC4DFcY2IcWxMXiJk2cE+/h2eHB
 PQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739270439; x=1739875239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKjlxs2/NLZM1oTa5EiDclwanqKKN/FNJx7pDcED3LQ=;
 b=sjjI4kHI7mgb6dJTQG7KZoUHOj770a+InvyAuRSQkP4lAvSxLi3QhvcPdrDfYH28ZJ
 OVx5YXUCMyeODHW00rF/NGqlKXf0hW9ep6QMHrEAJoOPoopebh69GPoYy6BYcjhGe3tV
 4bYe4BRP+x3z06V4HxyR7XMFGAbeL8MpEZtTv8cstBDVY5LklEWRazajgAtUz/G2l9Q2
 q+n0LzcUaX5sQzZD4eQkFrOs6GLasnYWH0MnOUcOQvvCBhHc9PCi1KlzbVbguwP1S7a2
 VtZAnyxjzOviXsSonFbszD4IBRtQztismx4oVQBaqpzgIMSpSn3+cSG9m2z0Rvcvje8l
 aYLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR7UOWqr7dwSf9p4BuCJb6fHhozTjkF2cHx9bMKqGJ+a7Vr3MY5Muyr6wUnwAPNvzyyZ19N2V6IQezeQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzeBS/6rPvgFC1i/wjdG30/5p6NVfMT0twNBepXYNunwLE+2K1a
 je5d0k19MxIPfiocuoi83A+WujRcFe7whEP/fKOQfJ3AeoXyucPJA19w5cH9tQk=
X-Gm-Gg: ASbGnctbPTvWD/Q0o5vvrlqu/wso3Pfa7CiFFtFQCQx9Lb0BSUsqnlNTBP/zWjfhBIf
 wbYahcqSLkoKIO0yp+933zFxPTxYZ7gsdpYedfff0PL1F2xwL8mJlnNbMWKmXafiF5MPl0jz8My
 MgyzLbT0og4M1BW7P5ouR2TvcoSJdGsQuHTF572iq7MPhWVrRkbvBwUcNOclNTRQFZQKASovgAC
 sD3wphSPVUfVGlvib8WDJIw2I/VNsOwOLj9W1toc9oVX8MtXEGqwwPifapms6QMC7tLTRvMtUku
 6nJOd5DoRJFw
X-Google-Smtp-Source: AGHT+IHoYKN0xK20CRb2BG7n5QKE/mgzwqqJVxGvuUHYmxPDnLSwWVoOeaDFYouJ/QTG+TlYqu4pkQ==
X-Received: by 2002:a7b:cb88:0:b0:431:58cd:b259 with SMTP id
 5b1f17b1804b1-43924a27b05mr156406225e9.31.1739270439183; 
 Tue, 11 Feb 2025 02:40:39 -0800 (PST)
Received: from pop-os.. ([145.224.65.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 02:40:38 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Date: Tue, 11 Feb 2025 10:39:40 +0000
Message-Id: <20250211103945.967495-5-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211103945.967495-1-james.clark@linaro.org>
References: <20250211103945.967495-1-james.clark@linaro.org>
MIME-Version: 1.0
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH 4/7] coresight: Add claim tag warnings and
	debug messages
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

Add a dev_dbg() message so that external debugger conflicts are more
visible. There are multiple reasons for -EBUSY so a message for this
particular one could be helpful. Add errors for and enumerate all the
other cases that are impossible.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 48 ++++++++++++--------
 drivers/hwtracing/coresight/coresight-priv.h |  5 +-
 2 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7b53165c93af..7fe5d5d432c4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -133,16 +133,6 @@ static inline u32 coresight_read_claim_tags(struct csdev_access *csa)
 			 csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR));
 }
 
-static inline bool coresight_is_claimed_self_hosted(struct csdev_access *csa)
-{
-	return coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED;
-}
-
-static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
-{
-	return coresight_read_claim_tags(&csdev->access) != 0;
-}
-
 static inline void coresight_set_self_claim_tag(struct csdev_access *csa)
 {
 	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
@@ -169,18 +159,40 @@ static inline void coresight_clear_self_claim_tag(struct csdev_access *csa)
  */
 int coresight_claim_device_unlocked(struct coresight_device *csdev)
 {
+	int tag;
+	struct csdev_access *csa;
+
 	if (WARN_ON(!csdev))
 		return -EINVAL;
 
-	if (coresight_is_claimed_any(csdev))
+	csa = &csdev->access;
+	tag = coresight_read_claim_tags(csa);
+
+	switch (tag) {
+	case CORESIGHT_CLAIM_FREE:
+		coresight_set_self_claim_tag(csa);
+		if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED)
+			return 0;
+
+		/* There was a race setting the tag, clean up and fail */
+		coresight_clear_self_claim_tag(csa);
 		return -EBUSY;
 
-	coresight_set_self_claim_tag(&csdev->access);
-	if (coresight_is_claimed_self_hosted(&csdev->access))
-		return 0;
-	/* There was a race setting the tag, clean up and fail */
-	coresight_clear_self_claim_tag(&csdev->access);
-	return -EBUSY;
+	case CORESIGHT_CLAIM_EXTERNAL:
+		/* External debug is an expected state, so log and report BUSY */
+		dev_dbg(&csdev->dev, "Busy: Claimed by external debugger");
+		return -EBUSY;
+
+	default:
+	case CORESIGHT_CLAIM_SELF_HOSTED:
+	case CORESIGHT_CLAIM_INVALID:
+		/*
+		 * Warn here because we clear a lingering self hosted tag
+		 * on probe, so other tag combinations are impossible.
+		 */
+		dev_err_once(&csdev->dev, "Invalid claim tag state: %x", tag);
+		return -EBUSY;
+	}
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
 
@@ -205,7 +217,7 @@ EXPORT_SYMBOL_GPL(coresight_claim_device);
  */
 void coresight_disclaim_device_unlocked(struct csdev_access *csa)
 {
-	if (coresight_is_claimed_self_hosted(csa))
+	if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED)
 		coresight_clear_self_claim_tag(csa);
 	else
 		/*
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index cc7ff1e36ef4..a83113225797 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -36,7 +36,10 @@ extern const struct device_type coresight_dev_type[];
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
  */
 #define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
-#define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)
+#define CORESIGHT_CLAIM_FREE		0
+#define CORESIGHT_CLAIM_EXTERNAL	1
+#define CORESIGHT_CLAIM_SELF_HOSTED	2
+#define CORESIGHT_CLAIM_INVALID		3
 
 #define TIMEOUT_US		100
 #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
