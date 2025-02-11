Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9DA308D8
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 11:40:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AC6EC7A824;
	Tue, 11 Feb 2025 10:40:49 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3901C7A82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 10:40:48 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-38dd14c99c3so1816776f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 02:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739270448; x=1739875248;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FLT+7yARFu+ZZe2jU+yKN61UJYeQ0L2gWO4wNTXz1Ac=;
 b=JSxzLe9e82NQPlTfy02e5NqWoCY+EVekNEeC1FH/ycNIYj/F5B7hKP5O4PjharqgkH
 npqjI20qpYsI0735gWGrAHhgWt8WMirpSy2waC4O6dX+wbQdpSsZjYY2hynuEklvsHtL
 omaRR7IOoUBjd1Va5PcWYsNozTvBv+fIvrK46+Uxq8gurhLWJf2F2jcrKad248STr4Kn
 0yht7Y5nSMwSxKEeobdDzJYL/uLq2bT76xnbXTx+laRb4Y4Sdb1zaAaYNAWglx9kzDil
 MTIhaXp+hQbGP/tHFuRxJddU0mZ9v7Pvw1RHIOhRJYHUk5+lGt70bxodV0cuNQ5xp9Ox
 LJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739270448; x=1739875248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FLT+7yARFu+ZZe2jU+yKN61UJYeQ0L2gWO4wNTXz1Ac=;
 b=kVSEkiS8mfBy7fEgN5TaAUBzuHqh8G6w62GynHo64weGUUkTOGPaaHQQzUYXfWJnN5
 D5e85WPG8ZtE5Iok1GPUrgBECPDryZGGuzNfbiqSdpTET/OpmEju8R2nmK5gdm1p4Mxf
 nKvX9oltobhrjg/BU7ZZeD7CzmXKiLyRE2OzwU7M7aJXXr+zxs1wnhZ6j453pp5sgzSM
 AUM9R2OSFuNErQiJE6dYLBhsfj3Rqd5YRpvoAGihwcIbFxeydxIhqRswht2VrH+8QJIC
 Ch13+KNn+gXby1s0ZU7tnrK9SCjUvNmGCdboxCNTg4y/0a8mMNB3dYMSP5Zkrjgueoxi
 5bNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtlOzIG5CN/CbMJ69E6zVOceS0kVD8PJheZSjs8kI22OiLr/4G9sjlBtFNZnO+N1MDduE5cRgSaI6rfQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxTzbGSNm8q+Ixkb/bQJyiiivuJkFHuUvzKw7vHXXJpXQTPmoE5
 MGc6JTaLVG6QT16KGuVk1YhWUBqR+C7SHsPQUAM5jPaXX0bue8jYtrgXrDJrzjY=
X-Gm-Gg: ASbGncv6gR4QYh4aLqWZFJDt/a8Qvaxvr+2G0kCWtKVD4NlqPhtYklmP0TGWyT+iMlf
 fXKOgBtzvaWI4dqfL1YZkkGIJo/iDOPGuyryWIt2q3FbhTnW+TUPF9xFMZPV6IGVtWq2YDsfAsZ
 RllMXgCieXScQGsZ6BGLMQmbpvxGCZc8787zqfr/IJDXj4rXhDO3tYWESSEoR2umUTODBbZBLlb
 1tMJPfWvrHtGNXDIiEz2ql7SJqIT2jeGwMQ+uipzTt1YdWIXfMsWW7YBRpHzQfcE2OS5p9aIL4u
 9nSAATZxNNRz
X-Google-Smtp-Source: AGHT+IGy0JfOP/A4JgJKJRQpoAKt5qMwRlzYsOwuh7SYJBs/gpNnWiLYzgaWj+n9Q0QUYJ0DnLVjhw==
X-Received: by 2002:a5d:6da1:0:b0:38d:d946:db15 with SMTP id
 ffacd0b85a97d-38dd946de79mr6670134f8f.5.1739270448056; 
 Tue, 11 Feb 2025 02:40:48 -0800 (PST)
Received: from pop-os.. ([145.224.65.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 02:40:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Date: Tue, 11 Feb 2025 10:39:43 +0000
Message-Id: <20250211103945.967495-8-james.clark@linaro.org>
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
Subject: [Linux-stm32] [PATCH 7/7] coresight: Remove extern from function
	declarations
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

Function declarations are extern by default so remove the extra noise
and inconsistency.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-priv.h | 14 ++++-----
 include/linux/coresight.h                    | 33 +++++++++-----------
 2 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index a83113225797..e09071a720f0 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -57,10 +57,8 @@ struct cs_off_attribute {
 	u32 off;
 };
 
-extern ssize_t coresight_simple_show32(struct device *_dev,
-				     struct device_attribute *attr, char *buf);
-extern ssize_t coresight_simple_show_pair(struct device *_dev,
-				     struct device_attribute *attr, char *buf);
+ssize_t coresight_simple_show32(struct device *_dev, struct device_attribute *attr, char *buf);
+ssize_t coresight_simple_show_pair(struct device *_dev, struct device_attribute *attr, char *buf);
 
 #define coresight_simple_reg32(name, offset)				\
 	(&((struct cs_off_attribute[]) {				\
@@ -155,8 +153,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
-extern int etm_readl_cp14(u32 off, unsigned int *val);
-extern int etm_writel_cp14(u32 off, u32 val);
+int etm_readl_cp14(u32 off, unsigned int *val);
+int etm_writel_cp14(u32 off, u32 val);
 #else
 static inline int etm_readl_cp14(u32 off, unsigned int *val) { return 0; }
 static inline int etm_writel_cp14(u32 off, u32 val) { return 0; }
@@ -167,8 +165,8 @@ struct cti_assoc_op {
 	void (*remove)(struct coresight_device *csdev);
 };
 
-extern void coresight_set_cti_ops(const struct cti_assoc_op *cti_op);
-extern void coresight_remove_cti_ops(void);
+void coresight_set_cti_ops(const struct cti_assoc_op *cti_op);
+void coresight_remove_cti_ops(void);
 
 /*
  * Macros and inline functions to handle CoreSight UCI data and driver
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 11808aee9d1d..2b43698c0b25 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -642,26 +642,23 @@ static inline void coresight_set_mode(struct coresight_device *csdev,
 	local_set(&csdev->mode, new_mode);
 }
 
-extern struct coresight_device *
-coresight_register(struct coresight_desc *desc);
-extern void coresight_unregister(struct coresight_device *csdev);
-extern int coresight_enable_sysfs(struct coresight_device *csdev);
-extern void coresight_disable_sysfs(struct coresight_device *csdev);
-extern int coresight_timeout(struct csdev_access *csa, u32 offset,
-			     int position, int value);
-
-extern int coresight_claim_device(struct coresight_device *csdev);
-extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
-
-extern void coresight_disclaim_device(struct csdev_access *csa);
-extern void coresight_disclaim_device_unlocked(struct csdev_access *csa);
+struct coresight_device *coresight_register(struct coresight_desc *desc);
+void coresight_unregister(struct coresight_device *csdev);
+int coresight_enable_sysfs(struct coresight_device *csdev);
+void coresight_disable_sysfs(struct coresight_device *csdev);
+int coresight_timeout(struct csdev_access *csa, u32 offset, int position, int value);
+
+int coresight_claim_device(struct coresight_device *csdev);
+int coresight_claim_device_unlocked(struct coresight_device *csdev);
+
+void coresight_disclaim_device(struct csdev_access *csa);
+void coresight_disclaim_device_unlocked(struct csdev_access *csa);
 int coresight_reset_claim_unlocked(struct csdev_access *csa);
 int coresight_reset_claim(struct csdev_access *csa);
 
-extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
-					 struct device *dev);
+char *coresight_alloc_device_name(struct coresight_dev_list *devs, struct device *dev);
 
-extern bool coresight_loses_context_with_cpu(struct device *dev);
+bool coresight_loses_context_with_cpu(struct device *dev);
 
 u32 coresight_relaxed_read32(struct coresight_device *csdev, u32 offset);
 u32 coresight_read32(struct coresight_device *csdev, u32 offset);
@@ -674,8 +671,8 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
 			       u64 val, u32 offset);
 void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
 
-extern int coresight_get_cpu(struct device *dev);
-extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
+int coresight_get_cpu(struct device *dev);
+int coresight_get_static_trace_id(struct device *dev, u32 *id);
 
 struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
 struct coresight_connection *
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
