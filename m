Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B77F8438F9
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 09:27:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C631FC6C841;
	Wed, 31 Jan 2024 08:27:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E8EEC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 08:27:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40V7fBiJ011244; Wed, 31 Jan 2024 08:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=x6b9QJbN/4opz0IFJtOwxH/Vn5GmCg0lvfo4hoEWj0s=; b=Sv
 naHswfoqJShvWeGhp7wbsWxHwolN1bsDD7szaPAjhJThSxX3nBVS7wgsZmiFbw6i
 eQkvmpnuUP0u9IZjoH3iZwDQzyPr5G8AGOVJwXWg4Um+udtnb1v3h/NyvbZYi6OU
 ayOtZ5TEcwI3tZjKNSsvYSByaz8PPY/NIDIn2tq9beaJPie5QDsSq2J7y5Nr8QmW
 FFbGp3nlxjoynLwIp4u7mVCmZ0Y43Uor9ztGsWsB6kZ9Koiz1SEC3UgPlCePRD10
 EVQt8TWMpdOCzWOnpCGlPsImIQvBy//EDVWggngovbqUgLHZl4XifpPCT1bRK3lv
 oDjxazOSdW3DfIsY0ukw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyj1483h5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Jan 2024 08:26:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40V8QeOs006056
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Jan 2024 08:26:40 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 31 Jan 2024 00:26:40 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Leo Yan
 <leo.yan@linaro.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>
Date: Wed, 31 Jan 2024 00:26:25 -0800
Message-ID: <20240131082628.6288-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240131082628.6288-1-quic_jinlmao@quicinc.com>
References: <20240131082628.6288-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oG6TbRR8vUUXrEvwSJ8ukAKcqMvDvyxj
X-Proofpoint-ORIG-GUID: oG6TbRR8vUUXrEvwSJ8ukAKcqMvDvyxj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_03,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310063
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mao Jinlong <quic_jinlmao@quicinc.com>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>, linux-kernel@vger.kernel.org,
 Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/2] coresight: core: Add device name
	support
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

For some coresight components like CTI and TPDM, there could be
numerous of them. From the node name, we can only get the type and
register address of the component. We can't identify the HW or the
system the component belongs to. Add the device-name support for
adding the intuitive name of the device.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 37 ++++++++++---------
 .../hwtracing/coresight/coresight-platform.c  | 31 ++++++++++++++++
 include/linux/coresight.h                     |  3 +-
 3 files changed, 53 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 5dde597403b3..8e836e8f407c 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1766,33 +1766,36 @@ EXPORT_SYMBOL_GPL(coresight_loses_context_with_cpu);
  * duplicate indices for the same device (e.g, if we defer probing of
  * a device due to dependencies), in case the index is requested again.
  */
-char *coresight_alloc_device_name(struct coresight_dev_list *dict,
+const char *coresight_alloc_device_name(struct coresight_dev_list *dict,
 				  struct device *dev)
 {
 	int idx;
-	char *name = NULL;
+	const char *name = NULL;
 	struct fwnode_handle **list;
 
 	mutex_lock(&coresight_mutex);
 
-	idx = coresight_search_device_idx(dict, dev_fwnode(dev));
-	if (idx < 0) {
-		/* Make space for the new entry */
-		idx = dict->nr_idx;
-		list = krealloc_array(dict->fwnode_list,
-				      idx + 1, sizeof(*dict->fwnode_list),
-				      GFP_KERNEL);
-		if (ZERO_OR_NULL_PTR(list)) {
-			idx = -ENOMEM;
-			goto done;
+	name = coresight_get_device_name(dev);
+	if (!name) {
+		idx = coresight_search_device_idx(dict, dev_fwnode(dev));
+		if (idx < 0) {
+			/* Make space for the new entry */
+			idx = dict->nr_idx;
+			list = krealloc_array(dict->fwnode_list,
+					      idx + 1, sizeof(*dict->fwnode_list),
+					      GFP_KERNEL);
+			if (ZERO_OR_NULL_PTR(list)) {
+				idx = -ENOMEM;
+				goto done;
+			}
+
+			list[idx] = dev_fwnode(dev);
+			dict->fwnode_list = list;
+			dict->nr_idx = idx + 1;
 		}
 
-		list[idx] = dev_fwnode(dev);
-		dict->fwnode_list = list;
-		dict->nr_idx = idx + 1;
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s%d", dict->pfx, idx);
 	}
-
-	name = devm_kasprintf(dev, GFP_KERNEL, "%s%d", dict->pfx, idx);
 done:
 	mutex_unlock(&coresight_mutex);
 	return name;
diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 9d550f5697fa..c6c68fc9f787 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -183,6 +183,22 @@ static int of_coresight_get_cpu(struct device *dev)
 	return cpu;
 }
 
+static const char *of_coresight_get_device_name(struct device *dev)
+{
+	const char *name = NULL;
+
+	if (!dev->of_node)
+		return NULL;
+
+	/*
+	 * Get the device name from DT. The name describes the HW or
+	 * system the device is for.
+	 */
+	of_property_read_string(dev->of_node, "device-name", &name);
+
+	return name;
+}
+
 /*
  * of_coresight_parse_endpoint : Parse the given output endpoint @ep
  * and fill the connection information in @pdata->out_conns
@@ -315,6 +331,12 @@ static inline int of_coresight_get_cpu(struct device *dev)
 {
 	return -ENODEV;
 }
+
+static inline const char *of_coresight_get_device_name(struct device *dev)
+{
+	return NULL;
+}
+
 #endif
 
 #ifdef CONFIG_ACPI
@@ -794,6 +816,15 @@ int coresight_get_cpu(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(coresight_get_cpu);
 
+const char *coresight_get_device_name(struct device *dev)
+{
+	if (is_of_node(dev->fwnode))
+		return of_coresight_get_device_name(dev);
+	else
+		return NULL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_device_name);
+
 struct coresight_platform_data *
 coresight_get_platform_data(struct device *dev)
 {
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index e8b6e388218c..9d50a91a3fc7 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -582,7 +582,7 @@ extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
 
 extern void coresight_disclaim_device(struct coresight_device *csdev);
 extern void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
-extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
+extern const char *coresight_alloc_device_name(struct coresight_dev_list *devs,
 					 struct device *dev);
 
 extern bool coresight_loses_context_with_cpu(struct device *dev);
@@ -676,6 +676,7 @@ static inline void coresight_write64(struct coresight_device *csdev, u64 val, u3
 #endif		/* IS_ENABLED(CONFIG_CORESIGHT) */
 
 extern int coresight_get_cpu(struct device *dev);
+extern const char *coresight_get_device_name(struct device *dev);
 
 struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
 struct coresight_connection *
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
