Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0DA4B68B
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Mar 2025 04:30:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C8EEC78F61;
	Mon,  3 Mar 2025 03:30:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFF51C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Mar 2025 03:30:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522MoK6Q003375;
 Mon, 3 Mar 2025 03:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sQcWpiJMjJYRN6pDKtY0r0UpjYP6awdBFpVOVPdR+i0=; b=K+T1EHOBsWGjDmxL
 Sw+hyrJAiuDC4WqEkKmBLMMNnMooIsCzefGFg9Bsuc/+50CpDUiD7QOS6APgDjRt
 GTcnSIUYzv56OEj7u6Nq8FpjjvilysI9fIpdX8w0UKGb9Z4VWC8VXfk1xdi0Ng/v
 7qIWUctByNa2T0DgVam75XshGSJh045PsK1sM9DXIctZDoFNJnBFw3DO1oQ5gIJq
 AVGy3gTrkD2gyon8j6RfKyd4qskVXElVXACl3tZYXLv8ShxS260sQOAcugoHJT+3
 CGztJ6g+oW3WCP92R+ocQn+jymns6iz8TcD3lfC3XnS/zJx2nwCkvsITV0m2oeSk
 M0Uc5Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t88ugf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Mar 2025 03:30:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5233U7aK022518
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Mar 2025 03:30:07 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Mar 2025 19:30:02 -0800
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 3 Mar 2025 11:29:23 +0800
Message-ID: <20250303032931.2500935-3-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ubSyGJfB0UM86DXDvDCGldpNBuluPnT5
X-Proofpoint-GUID: ubSyGJfB0UM86DXDvDCGldpNBuluPnT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503030026
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v15 02/10] Coresight: Add trace_id function to
	retrieving the trace ID
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

Add 'trace_id' function pointer in coresight_ops. It's responsible for retrieving
the device's trace ID.

Co-developed-by: James Clark <james.clark@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 30 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-dummy.c | 13 +++++++-
 .../coresight/coresight-etm3x-core.c          |  1 +
 .../coresight/coresight-etm4x-core.c          |  1 +
 drivers/hwtracing/coresight/coresight-stm.c   | 11 +++++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 11 +++++++
 include/linux/coresight.h                     |  5 ++++
 7 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index ab55e10d4b79..32aa07f4f8c1 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -24,6 +24,7 @@
 #include "coresight-etm-perf.h"
 #include "coresight-priv.h"
 #include "coresight-syscfg.h"
+#include "coresight-trace-id.h"
 
 /*
  * Mutex used to lock all sysfs enable and disable actions and loading and
@@ -1557,6 +1558,35 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
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
+		if (WARN_ON(!sink))
+			return -EINVAL;
+
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
index 9be53be8964b..b5692ba358c1 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -41,6 +41,16 @@ static void dummy_source_disable(struct coresight_device *csdev,
 	dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
 }
 
+static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
+				 __maybe_unused struct coresight_device *sink)
+{
+	struct dummy_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	return drvdata->traceid;
+}
+
 static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
 				void *data)
 {
@@ -62,7 +72,8 @@ static const struct coresight_ops_source dummy_source_ops = {
 };
 
 static const struct coresight_ops dummy_source_cs_ops = {
-	.source_ops = &dummy_source_ops,
+	.trace_id	= dummy_source_trace_id,
+	.source_ops	= &dummy_source_ops,
 };
 
 static const struct coresight_ops_sink dummy_sink_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index c103f4c70f5d..c1dda4bc4a2f 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -704,6 +704,7 @@ static const struct coresight_ops_source etm_source_ops = {
 };
 
 static const struct coresight_ops etm_cs_ops = {
+	.trace_id	= coresight_etm_get_trace_id,
 	.source_ops	= &etm_source_ops,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2c1a60577728..cfd116b87460 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1067,6 +1067,7 @@ static const struct coresight_ops_source etm4_source_ops = {
 };
 
 static const struct coresight_ops etm4_cs_ops = {
+	.trace_id	= coresight_etm_get_trace_id,
 	.source_ops	= &etm4_source_ops,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index b581a30a1cd9..aca25b5e3be2 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -281,12 +281,23 @@ static void stm_disable(struct coresight_device *csdev,
 	}
 }
 
+static int stm_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
+			__maybe_unused struct coresight_device *sink)
+{
+	struct stm_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	return drvdata->traceid;
+}
+
 static const struct coresight_ops_source stm_source_ops = {
 	.enable		= stm_enable,
 	.disable	= stm_disable,
 };
 
 static const struct coresight_ops stm_cs_ops = {
+	.trace_id	= stm_trace_id,
 	.source_ops	= &stm_source_ops,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 573da8427428..94c2201fc8d3 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -241,12 +241,23 @@ static void tpda_disable(struct coresight_device *csdev,
 	dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
 }
 
+static int tpda_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
+			 __maybe_unused struct coresight_device *sink)
+{
+	struct tpda_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	return drvdata->atid;
+}
+
 static const struct coresight_ops_link tpda_link_ops = {
 	.enable		= tpda_enable,
 	.disable	= tpda_disable,
 };
 
 static const struct coresight_ops tpda_cs_ops = {
+	.trace_id	= tpda_trace_id,
 	.link_ops	= &tpda_link_ops,
 };
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index c7cd5886c908..ce9a5e71b261 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -335,6 +335,7 @@ enum cs_mode {
 	CS_MODE_PERF,
 };
 
+#define coresight_ops(csdev)	csdev->ops
 #define source_ops(csdev)	csdev->ops->source_ops
 #define sink_ops(csdev)		csdev->ops->sink_ops
 #define link_ops(csdev)		csdev->ops->link_ops
@@ -421,6 +422,8 @@ struct coresight_ops_panic {
 };
 
 struct coresight_ops {
+	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
+			struct coresight_device *sink);
 	const struct coresight_ops_sink *sink_ops;
 	const struct coresight_ops_link *link_ops;
 	const struct coresight_ops_source *source_ops;
@@ -709,4 +712,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 
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
