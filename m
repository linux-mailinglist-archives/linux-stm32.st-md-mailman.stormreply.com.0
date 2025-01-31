Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A07A240B1
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2025 17:37:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7A9FC7128F;
	Fri, 31 Jan 2025 16:37:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28CF8C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 16:37:31 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3862a921123so1577766f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738341450; x=1738946250;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/EiIivNlSBmjlWurf1sXALCWljLg28qpqIa3tfnSxfs=;
 b=qGTzjKZXNdzE40+hUh4IEq2+Gy8214DGLEJU4o1CgGQK034vTdVqjWyW/I6gt8Aztt
 fZviBBAE39sqXgVKem3oTjWg92Us3ujPuc8XWX6n0h4LWTcnG7O9+ZYEd1YDJYD0LIDE
 PNsRkPOYHuTg9NPkCQhjzG/NW7n9bHLhSF4lL+9xYky7kkxjJ31W7QS1akK3YUyC91Zw
 s1FCxS+zGrAvqMe/T05uG78KVptoHf+6KZfzyI8ArcdtudAdQAx6d2gyiqEURX87qDR4
 E9UpIKDGDaZI+Fw4Pw43z92t8s8GqX9Xs5AugCoqpDl6setltH6YVMH7M7t/W7xfC7E6
 UNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738341450; x=1738946250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/EiIivNlSBmjlWurf1sXALCWljLg28qpqIa3tfnSxfs=;
 b=wNgc4SULW7CzjnmyjWHIbby5O0vXh7Iqag/dPn19K75/4RJJRKEauh07FaxFVRITRc
 Quok76fpApTw3bCM4/1M0090c1fpgQiYn96IztJYaJF/aD+dvTVXlRnsoJA1LyIBKEON
 ABJqAVJIPcq1VmOmaVt1npGZiD/kNYbzmVqbj7a/3JhxcjulEfYDZlZtiXJ6/yPKC/FL
 8YlyPZ3it47kzOz9oSdlAzp/SOBFi7YMezgRYwuMoqNH2IsEj27mA+ZQyG2dxSJ9JsY8
 oKXJRaRCBh7HL8NXqBAqstwXGluT5i5jO/SbP1Wyv02g3KHfkm8bTL2fAbRfXxEGkKvs
 SiIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK4yebdSXFvdRNIDx+vMPrTjRwYqtTYnEH0lKQ5ocQwPWbyBddDzlri0DQi0mo7WV3tSyL5+leRCCJlw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyt8wxz08mX/aF1y2Whq/vrnSVC1LV7BnIaYg0AkAHm3f23JAQ2
 s1KtNi9wAmX6EK2LEYDJAJQot1CHgavIyR8MZrTM4maCgLvuls6prvmlTmi2MKc=
X-Gm-Gg: ASbGnctM50D9cOLy+eNakpJK3MDSdpSvaFFJgWv44vzFoy2JerNauxRvUCZiz6lrn7U
 ILUGvwFHYn9k28zOE1AV0YUpVRqwo7hlxWWgsB5nK19XJYHUxUGdlIJ2D20H/S3BPuAgS2GN81G
 ULHeJsE7EEz9THfEnIFQSgRMjrr4R14XFo8psz9+/riktyKwzLKkIrXpD/ds2vWVpLZaLfkLFm+
 M5RpL3MTNdUy50vvw+ZCi0BwG9P5HxG/4qxheejrfTxs7pbiKD2L/wmCxqZFrtqNDHTgK21iX8T
 uUx9VzAdzPeS4HA=
X-Google-Smtp-Source: AGHT+IENp+rSeJRmG7qEFTxdRSKZm4Az560mKJ70dcuv6E5dHaMJ2QNoB38Or7CB4zxFd39142+2aw==
X-Received: by 2002:a05:6000:1fac:b0:386:3329:6a04 with SMTP id
 ffacd0b85a97d-38c51e8de63mr11672284f8f.39.1738341450438; 
 Fri, 31 Jan 2025 08:37:30 -0800 (PST)
Received: from pop-os.. ([145.224.90.107]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1e8f53sm4975118f8f.100.2025.01.31.08.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:37:22 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: quic_jiegan@quicinc.com
Date: Fri, 31 Jan 2025 16:36:15 +0000
Message-Id: <20250131163617.1730505-4-james.clark@linaro.org>
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
Subject: [Linux-stm32] [PATCH 3/3] coresight: Alloc trace ID after building
	the path
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

This reduces the number of places that the ID allocation happens to just
sysfs trctraceid_show() and when the path is built. And it consolidates
some duplicate code by doing everything the same way whether it's sysfs
mode, Perf mode, or if the trace ID is needed in advance for helper
devices like CTCUs.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c  | 96 ++++++++++++++-----
 drivers/hwtracing/coresight/coresight-dummy.c |  7 +-
 .../hwtracing/coresight/coresight-etm-perf.c  | 17 ++--
 drivers/hwtracing/coresight/coresight-etm.h   |  1 -
 .../coresight/coresight-etm3x-core.c          | 84 ++--------------
 .../coresight/coresight-etm3x-sysfs.c         |  3 +-
 .../coresight/coresight-etm4x-core.c          | 83 ++--------------
 .../coresight/coresight-etm4x-sysfs.c         |  4 +-
 drivers/hwtracing/coresight/coresight-etm4x.h |  1 -
 drivers/hwtracing/coresight/coresight-priv.h  | 13 +--
 drivers/hwtracing/coresight/coresight-stm.c   |  5 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |  4 +
 drivers/hwtracing/coresight/coresight-tpda.c  |  3 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  |  3 +-
 include/linux/coresight.h                     | 23 ++++-
 15 files changed, 129 insertions(+), 218 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f31c8477f7b7..88041000c0e9 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -657,6 +657,51 @@ static void coresight_drop_device(struct coresight_device *csdev)
 	}
 }
 
+/**
+ * Links or sources will read their existing or alloc a trace ID, if their ID
+ * callback is set.
+ */
+static int coresight_get_trace_id(struct coresight_device *csdev,
+				     enum cs_mode mode,
+				     struct coresight_device *sink)
+{
+	if (csdev->type == CORESIGHT_DEV_TYPE_LINK && link_ops(csdev)->trace_id)
+		return link_ops(csdev)->trace_id(csdev, mode, sink);
+
+	if (csdev->type == CORESIGHT_DEV_TYPE_SOURCE && source_ops(csdev)->trace_id)
+		return source_ops(csdev)->trace_id(csdev, mode, sink);
+
+	return 0;
+}
+
+/**
+ * Call this after creating the path and before enabling it. This leaves
+ * the trace ID set on the path and returns the ID, or an error if it
+ * couldn't be assigned.
+ */
+int coresight_path_assign_trace_id(struct coresight_path *path,
+				  enum cs_mode mode)
+{
+	struct coresight_device *sink = coresight_get_sink(path->path);
+	struct coresight_node *nd;
+	int ret;
+
+	list_for_each_entry(nd, path->path, link) {
+		/* Assign a trace ID to the path for the first device that wants to do it */
+		ret = coresight_get_trace_id(nd->csdev, mode, sink);
+
+		/*
+		 * 0 in this context is that it didn't want to assign so keep searching.
+		 * Non 0 is either success or fail, return it either way.
+		 */
+		if (ret != 0) {
+			path->trace_id = ret;
+			return ret;
+		}
+	}
+	return 0;
+}
+
 /**
  * _coresight_build_path - recursively build a path from a @csdev to a sink.
  * @csdev:	The device to start from.
@@ -691,15 +736,6 @@ static int _coresight_build_path(struct coresight_device *csdev,
 		}
 	}
 
-	/* Attempt to read the trace_id from TPDA device */
-	if (!IS_VALID_CS_TRACE_ID(cs_path->trace_id) &&
-	    (csdev->type == CORESIGHT_DEV_TYPE_LINK) &&
-	    (link_ops(csdev)->trace_id != NULL)) {
-		ret = link_ops(csdev)->trace_id(csdev);
-		if (IS_VALID_CS_TRACE_ID(ret))
-			cs_path->trace_id = ret;
-	}
-
 	/* Not a sink - recursively explore each port found on this element */
 	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
 		struct coresight_device *child_dev;
@@ -762,22 +798,6 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
 
 	INIT_LIST_HEAD(path);
 	cs_path->path = path;
-	/*
-	 * Since not all source devices have a defined trace_id function,
-	 * make sure to check for it before use.
-	 *
-	 * Assert the mode is CS_MODE_SYSFS, the trace_id will be assigned
-	 * again later if the mode is CS_MODE_PERF.
-	 */
-	if (source_ops(source)->trace_id != NULL) {
-		rc = source_ops(source)->trace_id(source, CS_MODE_SYSFS, NULL);
-		if(IS_VALID_CS_TRACE_ID(rc))
-			cs_path->trace_id = rc;
-		else 
-			cs_path->trace_id = 0;
-	}
-	else
-		cs_path->trace_id = 0;
 
 	rc = _coresight_build_path(source, source, sink, cs_path);
 	if (rc) {
@@ -1555,6 +1575,32 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
 }
 EXPORT_SYMBOL_GPL(coresight_remove_driver);
 
+int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
+			       struct coresight_device *sink)
+{
+	int trace_id;
+	int cpu = source_ops(csdev)->cpu_id(csdev);
+
+	switch (mode) {
+	case CS_MODE_SYSFS:
+		trace_id = coresight_trace_id_get_cpu_id(cpu);
+		break;
+	case CS_MODE_PERF:
+		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
+		break;
+	default:
+		trace_id = -EINVAL;
+		break;
+	}
+
+	if (!IS_VALID_CS_TRACE_ID(trace_id))
+		dev_err(&csdev->dev,
+			"Failed to allocate trace ID on CPU%d\n", cpu);
+
+	return trace_id;
+}
+EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
 MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index 6f86d33efef4..a8a991e81725 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -22,9 +22,8 @@ struct dummy_drvdata {
 DEFINE_CORESIGHT_DEVLIST(source_devs, "dummy_source");
 DEFINE_CORESIGHT_DEVLIST(sink_devs, "dummy_sink");
 
-static int dummy_source_enable(struct coresight_device *csdev,
-			       struct perf_event *event, enum cs_mode mode,
-			       __maybe_unused struct coresight_trace_id_map *id_map)
+static int dummy_source_enable(struct coresight_device *csdev, struct perf_event *event,
+			       enum cs_mode mode, struct coresight_path *path)
 {
 	if (!coresight_take_mode(csdev, mode))
 		return -EBUSY;
@@ -42,7 +41,7 @@ static void dummy_source_disable(struct coresight_device *csdev,
 }
 
 static int dummy_source_trace_id(struct coresight_device *csdev, enum cs_mode mode,
-				 struct coresight_trace_id_map *id_map)
+				 struct coresight_device *sink)
 {
 	struct dummy_drvdata *drvdata;
 
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 0fad9968c2c0..e5bd8d577259 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -407,17 +407,16 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 			cpumask_clear_cpu(cpu, mask);
 			continue;
 		}
-
 		/* ensure we can allocate a trace ID for this CPU */
-		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
-		if (!IS_VALID_CS_TRACE_ID(trace_id)) {
+		trace_id = coresight_path_assign_trace_id(cs_path, CS_MODE_PERF);
+
+		/* Can be 0 and valid, ETE doesn't need an ID */
+		if (trace_id < 0) {
 			cpumask_clear_cpu(cpu, mask);
 			coresight_release_path(cs_path);
 			continue;
 		}
-
 		coresight_trace_id_perf_start(&sink->perf_sink_id_map);
-		cs_path->trace_id = trace_id;
 		*etm_event_cpu_path_ptr(event_data, cpu) = cs_path;
 	}
 
@@ -463,7 +462,6 @@ static void etm_event_start(struct perf_event *event, int flags)
 	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
 	struct coresight_path *cs_path;
 	u64 hw_id;
-	u8 trace_id;
 
 	if (!csdev)
 		goto fail;
@@ -506,8 +504,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
-	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF,
-				      &sink->perf_sink_id_map))
+	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF, cs_path))
 		goto fail_disable_path;
 
 	/*
@@ -517,13 +514,11 @@ static void etm_event_start(struct perf_event *event, int flags)
 	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
 		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
 
-		trace_id = coresight_trace_id_read_cpu_id_map(cpu, &sink->perf_sink_id_map);
-
 		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
 				CS_AUX_HW_ID_MAJOR_VERSION);
 		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
 				CS_AUX_HW_ID_MINOR_VERSION);
-		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, trace_id);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, cs_path->trace_id);
 		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
 
 		perf_report_aux_output_id(event, hw_id);
diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index e02c3ea972c9..171f1384f7c0 100644
--- a/drivers/hwtracing/coresight/coresight-etm.h
+++ b/drivers/hwtracing/coresight/coresight-etm.h
@@ -284,6 +284,5 @@ extern const struct attribute_group *coresight_etm_groups[];
 void etm_set_default(struct etm_config *config);
 void etm_config_trace_mode(struct etm_config *config);
 struct etm_config *get_etm_config(struct etm_drvdata *drvdata);
-int etm_read_alloc_trace_id(struct etm_drvdata *drvdata);
 void etm_release_trace_id(struct etm_drvdata *drvdata);
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 74c6a2ffd07a..cb8a30a3b48e 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -455,26 +455,6 @@ static int etm_cpu_id(struct coresight_device *csdev)
 	return drvdata->cpu;
 }
 
-int etm_read_alloc_trace_id(struct etm_drvdata *drvdata)
-{
-	int trace_id;
-
-	/*
-	 * This will allocate a trace ID to the cpu,
-	 * or return the one currently allocated.
-	 *
-	 * trace id function has its own lock
-	 */
-	trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu);
-	if (IS_VALID_CS_TRACE_ID(trace_id))
-		drvdata->traceid = (u8)trace_id;
-	else
-		dev_err(&drvdata->csdev->dev,
-			"Failed to allocate trace ID for %s on CPU%d\n",
-			dev_name(&drvdata->csdev->dev), drvdata->cpu);
-	return trace_id;
-}
-
 void etm_release_trace_id(struct etm_drvdata *drvdata)
 {
 	coresight_trace_id_put_cpu_id(drvdata->cpu);
@@ -482,38 +462,22 @@ void etm_release_trace_id(struct etm_drvdata *drvdata)
 
 static int etm_enable_perf(struct coresight_device *csdev,
 			   struct perf_event *event,
-			   struct coresight_trace_id_map *id_map)
+			   struct coresight_path *path)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	int trace_id;
 
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
 		return -EINVAL;
 
 	/* Configure the tracer based on the session's specifics */
 	etm_parse_event_config(drvdata, event);
-
-	/*
-	 * perf allocates cpu ids as part of _setup_aux() - device needs to use
-	 * the allocated ID. This reads the current version without allocation.
-	 *
-	 * This does not use the trace id lock to prevent lock_dep issues
-	 * with perf locks - we know the ID cannot change until perf shuts down
-	 * the session
-	 */
-	trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
-	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
-		dev_err(&drvdata->csdev->dev, "Failed to set trace ID for %s on CPU%d\n",
-			dev_name(&drvdata->csdev->dev), drvdata->cpu);
-		return -EINVAL;
-	}
-	drvdata->traceid = (u8)trace_id;
+	drvdata->traceid = path->trace_id;
 
 	/* And enable it */
 	return etm_enable_hw(drvdata);
 }
 
-static int etm_enable_sysfs(struct coresight_device *csdev)
+static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etm_enable_arg arg = { };
@@ -521,10 +485,7 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
 
 	spin_lock(&drvdata->spinlock);
 
-	/* sysfs needs to allocate and set a trace ID */
-	ret = etm_read_alloc_trace_id(drvdata);
-	if (ret < 0)
-		goto unlock_enable_sysfs;
+	drvdata->traceid = path->trace_id;
 
 	/*
 	 * Configure the ETM only if the CPU is online.  If it isn't online
@@ -545,7 +506,6 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
 	if (ret)
 		etm_release_trace_id(drvdata);
 
-unlock_enable_sysfs:
 	spin_unlock(&drvdata->spinlock);
 
 	if (!ret)
@@ -554,7 +514,7 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
 }
 
 static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
-		      enum cs_mode mode, struct coresight_trace_id_map *id_map)
+		      enum cs_mode mode, struct coresight_path *path)
 {
 	int ret;
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
@@ -566,10 +526,10 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
 
 	switch (mode) {
 	case CS_MODE_SYSFS:
-		ret = etm_enable_sysfs(csdev);
+		ret = etm_enable_sysfs(csdev, path);
 		break;
 	case CS_MODE_PERF:
-		ret = etm_enable_perf(csdev, event, id_map);
+		ret = etm_enable_perf(csdev, event, path);
 		break;
 	default:
 		ret = -EINVAL;
@@ -697,39 +657,11 @@ static void etm_disable(struct coresight_device *csdev,
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
-static int etm_trace_id(struct coresight_device *csdev, enum cs_mode mode,
-			struct coresight_trace_id_map *id_map)
-{
-	struct etm_drvdata *drvdata;
-	int trace_id;
-
-	if (csdev == NULL)
-		return -EINVAL;
-
-	drvdata = dev_get_drvdata(csdev->dev.parent);
-	switch (mode) {
-	case CS_MODE_SYSFS:
-		trace_id = etm_read_alloc_trace_id(drvdata);
-		break;
-	case CS_MODE_PERF:
-		trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
-		if (IS_VALID_CS_TRACE_ID(trace_id))
-			drvdata->traceid = (u8)trace_id;
-		break;
-	default:
-		trace_id = -EINVAL;
-		break;
-	}
-
-	return trace_id;
-}
-
-
 static const struct coresight_ops_source etm_source_ops = {
 	.cpu_id		= etm_cpu_id,
 	.enable		= etm_enable,
 	.disable	= etm_disable,
-	.trace_id	= etm_trace_id,
+	.trace_id	= coresight_etm_get_trace_id,
 };
 
 static const struct coresight_ops etm_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 68c644be9813..b9006451f515 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -1190,10 +1190,9 @@ static DEVICE_ATTR_RO(cpu);
 static ssize_t traceid_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
-	int trace_id;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int trace_id = coresight_etm_get_trace_id(drvdata->csdev, CS_MODE_SYSFS, NULL);
 
-	trace_id = etm_read_alloc_trace_id(drvdata);
 	if (trace_id < 0)
 		return trace_id;
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 0ca8868a7ebf..d7e7703123d2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -232,25 +232,6 @@ static int etm4_cpu_id(struct coresight_device *csdev)
 	return drvdata->cpu;
 }
 
-int etm4_read_alloc_trace_id(struct etmv4_drvdata *drvdata)
-{
-	int trace_id;
-
-	/*
-	 * This will allocate a trace ID to the cpu,
-	 * or return the one currently allocated.
-	 * The trace id function has its own lock
-	 */
-	trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu);
-	if (IS_VALID_CS_TRACE_ID(trace_id))
-		drvdata->trcid = (u8)trace_id;
-	else
-		dev_err(&drvdata->csdev->dev,
-			"Failed to allocate trace ID for %s on CPU%d\n",
-			dev_name(&drvdata->csdev->dev), drvdata->cpu);
-	return trace_id;
-}
-
 void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
 {
 	coresight_trace_id_put_cpu_id(drvdata->cpu);
@@ -753,9 +734,9 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 
 static int etm4_enable_perf(struct coresight_device *csdev,
 			    struct perf_event *event,
-			    struct coresight_trace_id_map *id_map)
+			    struct coresight_path *path)
 {
-	int ret = 0, trace_id;
+	int ret = 0;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
@@ -768,22 +749,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	if (ret)
 		goto out;
 
-	/*
-	 * perf allocates cpu ids as part of _setup_aux() - device needs to use
-	 * the allocated ID. This reads the current version without allocation.
-	 *
-	 * This does not use the trace id lock to prevent lock_dep issues
-	 * with perf locks - we know the ID cannot change until perf shuts down
-	 * the session
-	 */
-	trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
-	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
-		dev_err(&drvdata->csdev->dev, "Failed to set trace ID for %s on CPU%d\n",
-			dev_name(&drvdata->csdev->dev), drvdata->cpu);
-		ret = -EINVAL;
-		goto out;
-	}
-	drvdata->trcid = (u8)trace_id;
+	drvdata->trcid = path->trace_id;
 
 	/* And enable it */
 	ret = etm4_enable_hw(drvdata);
@@ -792,7 +758,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	return ret;
 }
 
-static int etm4_enable_sysfs(struct coresight_device *csdev)
+static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etm4_enable_arg arg = { };
@@ -809,10 +775,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
 
 	spin_lock(&drvdata->spinlock);
 
-	/* sysfs needs to read and allocate a trace ID */
-	ret = etm4_read_alloc_trace_id(drvdata);
-	if (ret < 0)
-		goto unlock_sysfs_enable;
+	drvdata->trcid = path->trace_id;
 
 	/*
 	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
@@ -829,7 +792,6 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
 	if (ret)
 		etm4_release_trace_id(drvdata);
 
-unlock_sysfs_enable:
 	spin_unlock(&drvdata->spinlock);
 
 	if (!ret)
@@ -838,7 +800,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
 }
 
 static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
-		       enum cs_mode mode, struct coresight_trace_id_map *id_map)
+		      enum cs_mode mode, struct coresight_path *path)
 {
 	int ret;
 
@@ -849,10 +811,10 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
 
 	switch (mode) {
 	case CS_MODE_SYSFS:
-		ret = etm4_enable_sysfs(csdev);
+		ret = etm4_enable_sysfs(csdev, path);
 		break;
 	case CS_MODE_PERF:
-		ret = etm4_enable_perf(csdev, event, id_map);
+		ret = etm4_enable_perf(csdev, event, path);
 		break;
 	default:
 		ret = -EINVAL;
@@ -1025,38 +987,11 @@ static void etm4_disable(struct coresight_device *csdev,
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
-static int etm4_trace_id(struct coresight_device *csdev, enum cs_mode mode,
-			 struct coresight_trace_id_map *id_map)
-{
-	struct etmv4_drvdata *drvdata;
-	int trace_id;
-
-	if (csdev == NULL)
-		return -EINVAL;
-
-	drvdata = dev_get_drvdata(csdev->dev.parent);
-	switch (mode) {
-	case CS_MODE_SYSFS:
-		trace_id = etm4_read_alloc_trace_id(drvdata);
-		break;
-	case CS_MODE_PERF:
-		trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
-		if (IS_VALID_CS_TRACE_ID(trace_id))
-			drvdata->trcid = (u8)trace_id;
-		break;
-	default:
-		trace_id = -EINVAL;
-		break;
-	}
-
-	return trace_id;
-}
-
 static const struct coresight_ops_source etm4_source_ops = {
 	.cpu_id		= etm4_cpu_id,
 	.enable		= etm4_enable,
 	.disable	= etm4_disable,
-	.trace_id	= etm4_trace_id,
+	.trace_id	= coresight_etm_get_trace_id,
 };
 
 static const struct coresight_ops etm4_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index a9f19629f3f8..922c63477db1 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -4,6 +4,7 @@
  * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
  */
 
+#include <linux/coresight.h>
 #include <linux/pid_namespace.h>
 #include <linux/pm_runtime.h>
 #include <linux/sysfs.h>
@@ -2402,10 +2403,9 @@ static ssize_t trctraceid_show(struct device *dev,
 			       struct device_attribute *attr,
 			       char *buf)
 {
-	int trace_id;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int trace_id = coresight_etm_get_trace_id(drvdata->csdev, CS_MODE_SYSFS, NULL);
 
-	trace_id = etm4_read_alloc_trace_id(drvdata);
 	if (trace_id < 0)
 		return trace_id;
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 9e9165f62e81..d70f52ff4606 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1066,6 +1066,5 @@ static inline bool etm4x_is_ete(struct etmv4_drvdata *drvdata)
 	return drvdata->arch >= ETM_ARCH_ETE;
 }
 
-int etm4_read_alloc_trace_id(struct etmv4_drvdata *drvdata);
 void etm4_release_trace_id(struct etmv4_drvdata *drvdata);
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 7bd43304f461..979b1ae18b55 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -105,17 +105,6 @@ struct cs_buffers {
 	void			**data_pages;
 };
 
-/**
- * struct coresight_path - data needed by enable/disable path
- * @handle:		perf aux handle for ETM.
- * @path:		path from source to sink.
- * @trace_id:		trace_id of the whole path.
- */
-struct coresight_path {
-	struct list_head		*path;
-	u8				trace_id;
-};
-
 static inline void coresight_insert_barrier_packet(void *buf)
 {
 	if (buf)
@@ -160,6 +149,8 @@ int coresight_make_links(struct coresight_device *orig,
 void coresight_remove_links(struct coresight_device *orig,
 			    struct coresight_connection *conn);
 u32 coresight_get_sink_id(struct coresight_device *csdev);
+int coresight_path_assign_trace_id(struct coresight_path *path,
+				  enum cs_mode mode);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 extern int etm_readl_cp14(u32 off, unsigned int *val);
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 13efd5c2e0c4..3dc85c1a2f7e 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -194,8 +194,7 @@ static void stm_enable_hw(struct stm_drvdata *drvdata)
 }
 
 static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
-		      enum cs_mode mode,
-		      __maybe_unused struct coresight_trace_id_map *trace_id)
+		      enum cs_mode mode, struct coresight_path *path)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
@@ -282,7 +281,7 @@ static void stm_disable(struct coresight_device *csdev,
 }
 
 static int stm_trace_id(struct coresight_device *csdev, enum cs_mode mode,
-			struct coresight_trace_id_map *id_map)
+			struct coresight_device *sink)
 {
 	struct stm_drvdata *drvdata;
 
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index f9a6b838726c..09506ca5207e 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -209,6 +209,10 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		goto out;
 	}
 
+	ret = coresight_path_assign_trace_id(cs_path, CS_MODE_SYSFS);
+	if (ret < 0)
+		goto err_path;
+
 	ret = coresight_enable_path(cs_path, CS_MODE_SYSFS, NULL);
 	if (ret)
 		goto err_path;
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 3632c1791c96..829dc804d573 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -241,7 +241,8 @@ static void tpda_disable(struct coresight_device *csdev,
 	dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
 }
 
-static int tpda_trace_id(struct coresight_device *csdev)
+static int tpda_trace_id(struct coresight_device *csdev, enum cs_mode mode,
+			 struct coresight_device *sink)
 {
 	struct tpda_drvdata *drvdata;
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index c38f9701665e..f0880a62028f 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -439,8 +439,7 @@ static void __tpdm_enable(struct tpdm_drvdata *drvdata)
 }
 
 static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
-		       enum cs_mode mode,
-		       __maybe_unused struct coresight_trace_id_map *id_map)
+		      enum cs_mode mode, struct coresight_path *path)
 {
 	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index a859fc00eef9..e4d32a239ae5 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -330,6 +330,16 @@ static struct coresight_dev_list (var) = {				\
 
 #define to_coresight_device(d) container_of(d, struct coresight_device, dev)
 
+/**
+ * struct coresight_path - data needed by enable/disable path
+ * @path:		path from source to sink.
+ * @trace_id:		trace_id of the whole path.
+ */
+struct coresight_path {
+	struct list_head		*path;
+	u8				trace_id;
+};
+
 enum cs_mode {
 	CS_MODE_DISABLED,
 	CS_MODE_SYSFS,
@@ -369,7 +379,7 @@ struct coresight_ops_sink {
  * Operations available for links.
  * @enable:	enables flow between iport and oport.
  * @disable:	disables flow between iport and oport.
- * @trace_id:	Collect the traceid.
+ * @trace_id:	alloc or read the traceid.
  */
 struct coresight_ops_link {
 	int (*enable)(struct coresight_device *csdev,
@@ -378,7 +388,8 @@ struct coresight_ops_link {
 	void (*disable)(struct coresight_device *csdev,
 			struct coresight_connection *in,
 			struct coresight_connection *out);
-	int (*trace_id)(struct coresight_device *csdev);
+	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
+			struct coresight_device *sink);
 };
 
 /**
@@ -388,16 +399,16 @@ struct coresight_ops_link {
  *		is associated to.
  * @enable:	enables tracing for a source.
  * @disable:	disables tracing for a source.
- * @trace_id:	collect the traceid.
+ * @trace_id:	alloc or read the traceid.
  */
 struct coresight_ops_source {
 	int (*cpu_id)(struct coresight_device *csdev);
 	int (*enable)(struct coresight_device *csdev, struct perf_event *event,
-		      enum cs_mode mode, struct coresight_trace_id_map *id_map);
+		      enum cs_mode mode, struct coresight_path *path);
 	void (*disable)(struct coresight_device *csdev,
 			struct perf_event *event);
 	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
-			struct coresight_trace_id_map *id_map);
+			struct coresight_device *sink);
 };
 
 /**
@@ -703,4 +714,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 
 void coresight_remove_driver(struct amba_driver *amba_drv,
 			     struct platform_driver *pdev_drv);
+int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
+			       struct coresight_device *sink);
 #endif		/* _LINUX_COREISGHT_H */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
