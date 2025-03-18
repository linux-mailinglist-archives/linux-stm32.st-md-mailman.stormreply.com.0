Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7573A67920
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 17:22:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D4AFC78F8E;
	Tue, 18 Mar 2025 16:22:38 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EA60C78F74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 16:22:35 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so36120225e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 09:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742314955; x=1742919755;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ktzMOZYNlwNiDxoE8omHkFi9oPhb83P0wnx9jkyg590=;
 b=C0a0SWbg1bPV27TNcKKZ+ajStKjDeHPBF50PYtEFNdDm40vFuLjNmOCG3IIxHcLUTZ
 wYlDSPNxmWJVjDIJpYv2X+HY7E7RTc6kgZ9tPozN53XQBAJFamJyb28EfhzzqeS2SuFF
 kVszBnYIAv1TTyww2k1LN/tHHbBNbtZJVdwrz3oPd4chM2Fp5pltiFrzA7cPpgLdbNVV
 2nZ6j4SFSYLmDm0wiUE9B4N+FvONvmOpWTmKw5B5TJ90sG5a0S4CvkBwHN5w9ruc0/Zl
 8qBmLevPepJ8Du9Y1TdJkvH2PSBCvnw4iLF1fiBn59rdExH9fw3U1s107716P8GaZUS1
 7CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742314955; x=1742919755;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ktzMOZYNlwNiDxoE8omHkFi9oPhb83P0wnx9jkyg590=;
 b=EKgOm4WPLqgd7tL6kcy2q/WuxwmbksNxe7jKqSjDgxDA4NSv9laOuCGyFg2KZxj1oT
 aYU+fPANBt+s/B8wTpU1fqx2Dp0LxLNL5IoMc0QdyxPi3pYgFsRF7Z3iqxDcTV2ARhdY
 ZR9qSHApLIs+KsEhDs6fsQ5Gc9bHIHuGVOVJvpAbmf/cuIdMiJnbjzzp4gHSFfSBRxpK
 YTDUmWFATP/vMU/dZMbTPv9uKIsj6REWEt0VJwvgMCEu/T50wtUQWyA99WOGHuwqhUk2
 z6Oc2/RWlygVpS3PGwhTYjroioDRM5zu7mxpYlhJuBJGRFvVGabTtq42Enl7y4oLf7Q8
 Vwyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlR7ziYtc2B/9k8IejeqxmQJy/PaT4jp+63FqY25I0Reu+Q36yQsL6rFJnnUT59Rux/77zoTDwnfTuEw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyvGMNNENexmPvpy/cUUQ3B+Bn/gJgqdIJ/NmrDmDiCj6S/P+nT
 jpTlyco+2VpC7Z//iTQ4288qQWWVyDxTE2/pTmGvlnvmg4Oyv+OYyHDOPIrLte4=
X-Gm-Gg: ASbGncuQ4EBmCWIU+PRErxnKv+/KbZ+rms0M/HBQ2pNAekkGoHM9awQjXESGYu1pxz5
 WLa5ZEzSc/B4tTgCoxIOoYI7CumKAGnW99PjgfXne4i7EM9kChlD+tvThMbIwPqAx0Mxhk5IoX/
 PfnnCXLBwLcCUWM8gXllLbb0JsM2retwaB7wYvovrJB5z/oMTRjNO/ODnziAPbh+7y/vmB0g05x
 mVDn2M7XwbP3TuMRHu2h0PUFPwRIbuWAsWatZOlGqsfFZ5Qor2CYOFnc/xJgamYIsS7csBVPcah
 lJOLALdtgzWS8ZA2t9XQExHYvZulrnF2wMpG5EL6qSwRVKI=
X-Google-Smtp-Source: AGHT+IGJ+MGp/aQ7ouZ/3tsk70ncM8V1wNpnssWoc4eHTIu28PpPLIFGuzYHt7Mmu48slGPW7y2ccA==
X-Received: by 2002:a5d:5e0c:0:b0:390:fe4b:70b9 with SMTP id
 ffacd0b85a97d-3971daeb6cdmr13373876f8f.21.1742314954910; 
 Tue, 18 Mar 2025 09:22:34 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 09:22:34 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:22:02 +0000
MIME-Version: 1.0
Message-Id: <20250318-james-coresight-claim-tags-v2-8-e9c8a9cde84e@linaro.org>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
In-Reply-To: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
X-Mailer: b4 0.14.0
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 8/8] coresight: Remove extern from function
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
