Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5627A6A8AC
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 15:35:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BAADC78F83;
	Thu, 20 Mar 2025 14:35:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 036D6C78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 14:35:17 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso5794075e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742481316; x=1743086116;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ktzMOZYNlwNiDxoE8omHkFi9oPhb83P0wnx9jkyg590=;
 b=DxIkw9c6t4lnu/yC6UVF2f133af0kRcnHDguWuz1lJfV4uGxM9v18mDKlgIywl0p4n
 fb77TqXwzsVkxee4YSguz7A0BIKV4/gruvHgXyCEjKTNpU3JxIoZ/ub4cUQGRi119AgX
 h9Yh280FXrYHBtKT+f3TChlfyq/EKoK0uEIeodfZrvaqnGCZBN/sFa4i+HmLQ2Ek8VcJ
 kzucLejwcLqQdYIpCXPXNgRzzhHSnycCY/9TVnw0ROwX15ju97oD6hDAsi2VrH8IBE2Q
 /5vG74i6F/mLCToEf433lcROLfxl3Ru7wl4s7PDNb5lP4SGg4mcO+mnc2qspk2hzYa2H
 CtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742481316; x=1743086116;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ktzMOZYNlwNiDxoE8omHkFi9oPhb83P0wnx9jkyg590=;
 b=PyuxXPMpzukVLHKCckTmKBt1x1722EuQKuPdsEUobZpHXTjr8nYZwxzjytBgb+NXup
 VJ2b4pBfG9zS1AR90fxiVbdujj2n9TOehUShm5hIpCBdfo5qSfn9JvfZwaiRs0of34AO
 XkypMUzlaNfSitvuOqFI/QEtJ+JNzs6+EesSyDM3PtSAzEm7Dw8Ambv+Sje5hD9NBu6A
 zx4/R1HtA8mBIMedUUCL6aHgqhBuXCS0yJEW4vaVCPTPP/WCVXg6B+y5dMwYihap8qm5
 PZwL3oSjjv5/IV/HYXd6b0Go+NWcE2qjvEHB05dn2c1piwjCGA1jmuXFFoI8akJ8F+gu
 8PDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrb9Kb6BirNFMRE8qLLCoiJPbS5LUzkCAK9KlvfJoEBdC8crCMC0ddsHdm5hu7UJojqoSFum0JU0L/zA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz23F5NGOvrm8R3N1Z5z5pac26xoj9UrcqJED2fF6TwK2ATCPPB
 wvufEPCLrgKR6c7MH8AHVvOZjSorDJwKwXodhG6YSpSkjr/faYnhuv2aDGInCRI=
X-Gm-Gg: ASbGncsFsvn7SaAKn8iiaw+vhb4FwxM77Bv0lL0FGULESuuyKHQ4nF28RwCtrIS1QyK
 x5DwpvFRwlzNpcq921dEz4y3IbW7O5B2AlzMhHNKbJrru9e8ONOcDltOHVxABGsTPg5fp5BQBHq
 t2+S8dWTo+ZjVfBfRFa4jxNL8qbD283XGRhCK851LN7BGRfu34QbdfYdyxTbFpHnxCDApHyxEZT
 Lv1Gqi6fMt5Zr8mLNCf/vUpBdDGS4WaET9VhCbcE2x22w63tQkCGIFKGcICxpGDk00usYhCKf1r
 JxokxhgA2YR5LgJy/hnCk2SPQ/00g+OQuEYT1pdHI+5wREM=
X-Google-Smtp-Source: AGHT+IGWLVpm4TQ0kdAiwRFUVf9LxYmBruxCxdW+BZGKM/2Bj+7qbRWxjTO13KNGwhsfFVq1+NGRWQ==
X-Received: by 2002:a05:600c:b9b:b0:43b:cd0d:9466 with SMTP id
 5b1f17b1804b1-43d4378cf45mr58703935e9.9.1742481316328; 
 Thu, 20 Mar 2025 07:35:16 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm24238187f8f.31.2025.03.20.07.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 07:35:16 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 20 Mar 2025 14:34:16 +0000
MIME-Version: 1.0
Message-Id: <20250320-james-coresight-claim-tags-v3-7-d3145c153820@linaro.org>
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
Subject: [Linux-stm32] [PATCH v3 7/7] coresight: Remove extern from function
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

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-priv.h | 14 +++++------
 include/linux/coresight.h                    | 35 ++++++++++++++--------------
 2 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 6e8cf55aee0a..ce91e0fbb497 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -60,10 +60,8 @@ struct cs_off_attribute {
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
@@ -160,8 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
-extern int etm_readl_cp14(u32 off, unsigned int *val);
-extern int etm_writel_cp14(u32 off, u32 val);
+int etm_readl_cp14(u32 off, unsigned int *val);
+int etm_writel_cp14(u32 off, u32 val);
 #else
 static inline int etm_readl_cp14(u32 off, unsigned int *val) { return 0; }
 static inline int etm_writel_cp14(u32 off, u32 val) { return 0; }
@@ -172,8 +170,8 @@ struct cti_assoc_op {
 	void (*remove)(struct coresight_device *csdev);
 };
 
-extern void coresight_set_cti_ops(const struct cti_assoc_op *cti_op);
-extern void coresight_remove_cti_ops(void);
+void coresight_set_cti_ops(const struct cti_assoc_op *cti_op);
+void coresight_remove_cti_ops(void);
 
 /*
  * Macros and inline functions to handle CoreSight UCI data and driver
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 00134a80d358..8cb07c132b01 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -671,28 +671,27 @@ static inline void coresight_set_mode(struct coresight_device *csdev,
 	local_set(&csdev->mode, new_mode);
 }
 
-extern struct coresight_device *
-coresight_register(struct coresight_desc *desc);
-extern void coresight_unregister(struct coresight_device *csdev);
-extern int coresight_enable_sysfs(struct coresight_device *csdev);
-extern void coresight_disable_sysfs(struct coresight_device *csdev);
-extern int coresight_timeout(struct csdev_access *csa, u32 offset,
-			     int position, int value);
+struct coresight_device *coresight_register(struct coresight_desc *desc);
+void coresight_unregister(struct coresight_device *csdev);
+int coresight_enable_sysfs(struct coresight_device *csdev);
+void coresight_disable_sysfs(struct coresight_device *csdev);
+int coresight_timeout(struct csdev_access *csa, u32 offset, int position, int value);
 typedef void (*coresight_timeout_cb_t) (struct csdev_access *, u32, int, int);
-extern int coresight_timeout_action(struct csdev_access *csa, u32 offset,
-					int position, int value,
-					coresight_timeout_cb_t cb);
+int coresight_timeout_action(struct csdev_access *csa, u32 offset, int position, int value,
+			     coresight_timeout_cb_t cb);
+int coresight_claim_device(struct coresight_device *csdev);
+int coresight_claim_device_unlocked(struct coresight_device *csdev);
 
-extern int coresight_claim_device(struct coresight_device *csdev);
-extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
+int coresight_claim_device(struct coresight_device *csdev);
+int coresight_claim_device_unlocked(struct coresight_device *csdev);
 void coresight_clear_self_claim_tag(struct csdev_access *csa);
 void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa);
-extern void coresight_disclaim_device(struct coresight_device *csdev);
-extern void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
-extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
+void coresight_disclaim_device(struct coresight_device *csdev);
+void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
+char *coresight_alloc_device_name(struct coresight_dev_list *devs,
 					 struct device *dev);
 
-extern bool coresight_loses_context_with_cpu(struct device *dev);
+bool coresight_loses_context_with_cpu(struct device *dev);
 
 u32 coresight_relaxed_read32(struct coresight_device *csdev, u32 offset);
 u32 coresight_read32(struct coresight_device *csdev, u32 offset);
@@ -705,8 +704,8 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
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
