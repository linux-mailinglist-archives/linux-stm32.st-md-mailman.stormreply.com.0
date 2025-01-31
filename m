Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA529A240AB
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2025 17:37:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 914CFC7128F;
	Fri, 31 Jan 2025 16:37:09 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7186C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 16:37:07 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so25619495e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738341427; x=1738946227;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G7MomK86+ouS/G5oAALpKpnv8TVzemPi9Q2kt64Ct2c=;
 b=AmJQTh4Qs2djbnOd8s/8Kf8rAFtM3YUs9cCs0albkr/r1N3RgeMUtFosHrRVpiDPuy
 cXkMNX+7dfsoFeiuvBeRPrK+cki7XOBGSOAUp6ALtV0UoxVGM0/THfwayeoewrPwINhG
 1ipewQysy0t3SoeSaTJuEP1AUITL3ycOWUuXcOYIBAcvzZn+ALG4AnEY9wX14YlUQBaS
 oHSJu3ZV04LnI6Gme2qJ1G7M4R6BGZYNoqWPCHe9ArxnczRAskwcOHMtJ1laCBiPEc8H
 vx3/zMlEYnaI6Tz2sSnK5gl/9jHr90p2WyWs4dSOedB8h7UVPGgKQp2ycGVhjTPxX1nV
 8Wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738341427; x=1738946227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G7MomK86+ouS/G5oAALpKpnv8TVzemPi9Q2kt64Ct2c=;
 b=P5aLrIHqfrECbQ7HImhWgjhfMF/u2gYMwOiAssYOttXp+/UNwirruRC+lIKVERY4HS
 17XdjqGc31kKmf5p2E1df036tFF5fcfZgQu2+48yupw2lF3MqKWU6TkdtpTyfQQU+doZ
 YXiCxKWIRgz3lnHpLkle02A21thkA6w+A854uK4W84glN+XTmUpVMeVp2zUXYnDRkOCn
 pXkCRakoP/+93xNErh5fphsh9vE2nAybanoYTT/eFE+jqd9ksbi59fBvoEjfjTtUV2Xv
 HG4Ed6mRhXKAoBXOHbfwCZW5qac5qJsdMI9kr3bBAa0B0ePLlA/oY3ofWaBmoO43vI+x
 Zspw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1d2id/WAYBbIM6dcaA6Yzdh+IMxPWDf/ngdJDKYOa9lW75gWjRu95bXWFxcnmy9+1yrjaH+6/EHDzGA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwZIBSpzPKz3y0VK2P0eYseYukfNDNuU73mMeeubQs2Z1g/AfJB
 jiIB66pIP05XZnVpGIJKdA6vzHIVdAgEV1kJ5jnDfbl/76M1md08Z3IHT8xRsK4=
X-Gm-Gg: ASbGncs6o8jVEfKqOKg9v9SwPe1LHBSdnBwfPjnmSPNfCVfltRglXLiSv2QI1zbNUHT
 pTzgAiTilLif/7F3yIirA/UTvF5MqxN1DV6UvioCQJhRuRZ0GIWy8OelAN3XGiM9yKzkWkCxQpO
 486Z8gyftEAe2o/b01BBp0cx+X1nLwdCcOo+Qh1zPrRk19Hv20GSsUi97jSWgU3VXhDgAZmLDRb
 hOrA8gB3410bOn3N/SYOXsP8r0BD3BusqaeN3ueQcGLa3KK6cUI+NI1Sll3ISTEllvT7U6sv2iu
 wlk9iNbjotzSpng=
X-Google-Smtp-Source: AGHT+IFW6UUx3VFvrhhQA0UKfWXPE61O1AfZdbHWQgh9U8vY75F7edI1Un+IGYs+RKA8bLLCI9gYtQ==
X-Received: by 2002:a7b:c347:0:b0:436:6460:e680 with SMTP id
 5b1f17b1804b1-438dc3cc9e6mr118298935e9.16.1738341427298; 
 Fri, 31 Jan 2025 08:37:07 -0800 (PST)
Received: from pop-os.. ([145.224.90.107]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1e8f53sm4975118f8f.100.2025.01.31.08.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:36:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: quic_jiegan@quicinc.com
Date: Fri, 31 Jan 2025 16:36:13 +0000
Message-Id: <20250131163617.1730505-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163617.1730505-1-james.clark@linaro.org>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
 <20250131163617.1730505-1-james.clark@linaro.org>
MIME-Version: 1.0
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 quic_jinlmao@quicinc.com, alexander.shishkin@linux.intel.com,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 suzuki.poulose@arm.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, James Clark <james.clark@linaro.org>,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, quic_tingweiz@quicinc.com,
 linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Subject: [Linux-stm32] [PATCH 1/3] coresight: Don't save handle in path
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c     | 10 +++++-----
 drivers/hwtracing/coresight/coresight-dummy.c    |  2 +-
 drivers/hwtracing/coresight/coresight-etb10.c    |  8 +++-----
 drivers/hwtracing/coresight/coresight-etm-perf.c |  3 +--
 drivers/hwtracing/coresight/coresight-priv.h     |  4 ++--
 drivers/hwtracing/coresight/coresight-sysfs.c    |  2 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c  |  9 ++++-----
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 13 +++++--------
 drivers/hwtracing/coresight/coresight-tmc.h      |  2 +-
 drivers/hwtracing/coresight/coresight-tpiu.c     |  2 +-
 drivers/hwtracing/coresight/coresight-trbe.c     |  4 +---
 drivers/hwtracing/coresight/ultrasoc-smb.c       |  8 +++-----
 include/linux/coresight.h                        |  2 +-
 13 files changed, 29 insertions(+), 40 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 11d5d5320b1a..253ef02fde12 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -272,9 +272,9 @@ void coresight_add_helper(struct coresight_device *csdev,
 EXPORT_SYMBOL_GPL(coresight_add_helper);
 
 static int coresight_enable_sink(struct coresight_device *csdev,
-				 enum cs_mode mode, void *data)
+				 enum cs_mode mode, struct perf_output_handle *handle)
 {
-	return sink_ops(csdev)->enable(csdev, mode, data);
+	return sink_ops(csdev)->enable(csdev, mode, handle);
 }
 
 static void coresight_disable_sink(struct coresight_device *csdev)
@@ -448,7 +448,8 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 	return 0;
 }
 
-int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode)
+int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode,
+			  struct perf_output_handle *handle)
 {
 	int ret = 0;
 	u32 type;
@@ -479,7 +480,7 @@ int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode)
 
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
-			ret = coresight_enable_sink(csdev, mode, cs_path);
+			ret = coresight_enable_sink(csdev, mode, handle);
 			/*
 			 * Sink is the first component turned on. If we
 			 * failed to enable the sink, there are no components
@@ -807,7 +808,6 @@ void coresight_release_path(struct coresight_path *cs_path)
 		kfree(nd);
 	}
 
-	cs_path->handle = NULL;
 	kfree(cs_path->path);
 	kfree(cs_path);
 }
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index dfcf24e9c49a..6f86d33efef4 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -54,7 +54,7 @@ static int dummy_source_trace_id(struct coresight_device *csdev, enum cs_mode mo
 }
 
 static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
-				void *data)
+				struct perf_output_handle *handle)
 {
 	dev_dbg(csdev->dev.parent, "Dummy sink enabled\n");
 
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 05430d8931d1..e373b0f590bf 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -167,14 +167,12 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
 	return ret;
 }
 
-static int etb_enable_perf(struct coresight_device *csdev, void *data)
+static int etb_enable_perf(struct coresight_device *csdev, struct perf_output_handle *handle)
 {
 	int ret = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct coresight_path *cs_path = (struct coresight_path *)data;
-	struct perf_output_handle *handle = cs_path->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -225,7 +223,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
 }
 
 static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data)
+		      struct perf_output_handle *handle)
 {
 	int ret;
 
@@ -234,7 +232,7 @@ static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
 		ret = etb_enable_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = etb_enable_perf(csdev, data);
+		ret = etb_enable_perf(csdev, handle);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index b6765abb0a26..0fad9968c2c0 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -501,9 +501,8 @@ static void etm_event_start(struct perf_event *event, int flags)
 	if (WARN_ON_ONCE(!sink))
 		goto fail_end_stop;
 
-	cs_path->handle = handle;
 	/* Nothing will happen without a path */
-	if (coresight_enable_path(cs_path, CS_MODE_PERF))
+	if (coresight_enable_path(cs_path, CS_MODE_PERF, handle))
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 8e02a222b9f8..7bd43304f461 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -112,7 +112,6 @@ struct cs_buffers {
  * @trace_id:		trace_id of the whole path.
  */
 struct coresight_path {
-	struct perf_output_handle	*handle;
 	struct list_head		*path;
 	u8				trace_id;
 };
@@ -142,7 +141,8 @@ static inline void CS_UNLOCK(void __iomem *addr)
 }
 
 void coresight_disable_path(struct coresight_path *cs_path);
-int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode);
+int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode,
+			  struct perf_output_handle *handle);
 struct coresight_device *coresight_get_sink(struct list_head *path);
 struct coresight_device *coresight_get_sink_by_id(u32 id);
 struct coresight_device *
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 04e76cc1bfdf..f9a6b838726c 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -209,7 +209,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		goto out;
 	}
 
-	ret = coresight_enable_path(cs_path, CS_MODE_SYSFS);
+	ret = coresight_enable_path(cs_path, CS_MODE_SYSFS, NULL);
 	if (ret)
 		goto err_path;
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index e6b07f917556..fdf1c2511d67 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -244,14 +244,13 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
 	return ret;
 }
 
-static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
+static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
+				    struct perf_output_handle *handle)
 {
 	int ret = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct coresight_path *cs_path= (struct coresight_path *)data;
-	struct perf_output_handle *handle = cs_path->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -303,7 +302,7 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 }
 
 static int tmc_enable_etf_sink(struct coresight_device *csdev,
-			       enum cs_mode mode, void *data)
+			       enum cs_mode mode, struct perf_output_handle *handle)
 {
 	int ret;
 
@@ -312,7 +311,7 @@ static int tmc_enable_etf_sink(struct coresight_device *csdev,
 		ret = tmc_enable_etf_sink_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = tmc_enable_etf_sink_perf(csdev, data);
+		ret = tmc_enable_etf_sink_perf(csdev, handle);
 		break;
 	/* We shouldn't be here */
 	default:
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 82a872882e24..2d0bd06bab2a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1252,10 +1252,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 }
 
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
-				   enum cs_mode mode, void *data)
+				   enum cs_mode mode, struct perf_output_handle *handle)
 {
-	struct coresight_path *cs_path = (struct coresight_path *)data;
-	struct perf_output_handle *handle = cs_path->handle;
 	struct etr_perf_buffer *etr_perf;
 
 	switch (mode) {
@@ -1643,14 +1641,13 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 	return size;
 }
 
-static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
+static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
+				    struct perf_output_handle *handle)
 {
 	int rc = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct coresight_path *cs_path = (struct coresight_path *)data;
-	struct perf_output_handle *handle = cs_path->handle;
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -1698,13 +1695,13 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 }
 
 static int tmc_enable_etr_sink(struct coresight_device *csdev,
-			       enum cs_mode mode, void *data)
+			       enum cs_mode mode, struct perf_output_handle *handle)
 {
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		return tmc_enable_etr_sink_sysfs(csdev);
 	case CS_MODE_PERF:
-		return tmc_enable_etr_sink_perf(csdev, data);
+		return tmc_enable_etr_sink_perf(csdev, handle);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 2671926be62a..e991afd43742 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -336,7 +336,7 @@ struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
-				   enum cs_mode mode, void *data);
+				   enum cs_mode mode, struct perf_output_handle *handle);
 extern const struct attribute_group coresight_etr_group;
 
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 97ef36f03ec2..ccf463ac7bf5 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -75,7 +75,7 @@ static void tpiu_enable_hw(struct csdev_access *csa)
 }
 
 static int tpiu_enable(struct coresight_device *csdev, enum cs_mode mode,
-		       void *__unused)
+		       struct perf_output_handle *__unused)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 5005efd88a66..997d5976d2d2 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1009,12 +1009,10 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
 }
 
 static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
-			   void *data)
+			   struct perf_output_handle *handle)
 {
 	struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
-	struct coresight_path *cs_path = (struct coresight_path *)data;
-	struct perf_output_handle *handle = cs_path->handle;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 
 	WARN_ON(cpudata->cpu != smp_processor_id());
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index 9be88394b3bb..1574b5067206 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -213,11 +213,9 @@ static void smb_enable_sysfs(struct coresight_device *csdev)
 	coresight_set_mode(csdev, CS_MODE_SYSFS);
 }
 
-static int smb_enable_perf(struct coresight_device *csdev, void *data)
+static int smb_enable_perf(struct coresight_device *csdev, struct perf_output_handle *handle)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct coresight_path *cs_path = (struct coresight_path *)data;
-	struct perf_output_handle *handle = cs_path->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 	pid_t pid;
 
@@ -241,7 +239,7 @@ static int smb_enable_perf(struct coresight_device *csdev, void *data)
 }
 
 static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data)
+		      struct perf_output_handle *handle)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
@@ -262,7 +260,7 @@ static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
 		smb_enable_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = smb_enable_perf(csdev, data);
+		ret = smb_enable_perf(csdev, handle);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 87f9baa7fefe..a859fc00eef9 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -353,7 +353,7 @@ enum cs_mode {
  */
 struct coresight_ops_sink {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data);
+		      struct perf_output_handle *handle);
 	int (*disable)(struct coresight_device *csdev);
 	void *(*alloc_buffer)(struct coresight_device *csdev,
 			      struct perf_event *event, void **pages,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
