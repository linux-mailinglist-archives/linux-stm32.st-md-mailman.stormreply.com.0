Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82571A83AC4
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 09:19:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EB09C7A847;
	Thu, 10 Apr 2025 07:19:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD5AFCFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:34:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HG0bt015017
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 10 Apr 2025 01:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=zVEqVQGEb72
 vRCxRTT02PrU7JhEHIfl9uSaQKsq1qDA=; b=DywjHEYvi4SWvrc/FYGmdkuqu9n
 9mgN0lEYR7tup9vkExpdOTtCN8KpiRaTkbrO6daIQoroDwykdB93APYBVZd7u0SM
 gPTMzn8NEBcHkMMHEZjpsjoJR3U2zP6990z7tGD/PH7fPimOcpVxRfZ24+a2YsYZ
 cQF4A7AeC16KL0M+iXFbaEqHMd6Ml6X2bwgjEhlF2Gk+tCDROKkdR0KoLQjiEd9M
 MSaCO39gOgcI646cW3Zic6ucxDCPAAZhl7X7eMvS2oUoDps0Hx5J5xikks3w2g7M
 8kA8UNa9axSsrtwKzIDRHnwjMzzAXZkjuZqcr8svkBwwogttmUT9+c+1z2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbun897-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:34:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-224364f2492so2120005ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Apr 2025 18:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744248839; x=1744853639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zVEqVQGEb72vRCxRTT02PrU7JhEHIfl9uSaQKsq1qDA=;
 b=RGiFRnBLY6UaWKMg2jaZz9pp/jFDQhIhnKhMlAesf+bmDN8mO4t7CVd8hBgsuM6f8J
 bmJN+Bxq7ACFMw5gfzvxPPjdxkHVRiR3Pssgc3rICRnJqQfM2x/CAaFaBgtCyhJ3bc4E
 ekP4bb7VMKpiOoBHBsQbBfzOgOytdtzqF3dSffWv3tyY895xk3CgXjV5JfYLw4mVAdbr
 2m+ZUNCEew7+d5HaJodAV1ajQ1KdyYfLWMKX5qkLI/KhEY5cstMQCEj0ww+e3DCV5Z1U
 Ud4nibAG8n+bVm1cxTiD5IQVeh9KtUhWeeSlSUoxS5psVEOhf0zHZUXeJ3lxeuTZTCv4
 fRpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb7nLYJsk3QkR35LsNxA9ilwegrGJan9g4+snN0mEFWX/Wck2CG4pD1rkMJf1AzELUq0Bf4x/OkxpI0g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx3ZArA4tO2xxQxqD7l1/Rh4FSy6EbNpIeQ9/QeB4B9NfJ0s5PX
 YPibwzJBb9Qdn/FkR1UR9XFLBt/3hB/1wdEejdiArrAEYN1Yd3D42ksCyJBSIq8mY1EaHSJ9cR8
 OX8ksKqQoBZp8vdf+exj39qrgiXVVOLSFirADC0HanKVwnrii1VdYZxzAfgUwjDirabEqGQK8CO
 AKg0g=
X-Gm-Gg: ASbGncvbOqfXdOKsMVUjqx2FGSlo+jX+pVAmI1W+49jRb6j095fhqrvTapXS4rpp6RY
 ODr9SOMp8k86oH0xhFdbnWNLOhlUYnC3f0Eo8n0l/q8DKyijhxNb7G3yxkcTI4IdvjI8zvyZ7ZK
 89CJggFtrC+EvekoxAOVdRzvf5jpQQ6r35sSu4nXlVdlEaTnz5G6EEJKBcD4ykemzIRdATIdVhe
 LOsRLgo3/ibO9xcoljV+Hss5Nqnhq3WSSUAkTUNmbWhnoCgdzZUrA3uibt9Qk0lEk5NIAHb86hF
 e+fRDEUQp55pTiShCc78m3HuKIdWQDLbMMXPnVj7ZgDsCvwhqLZPpkrHhFbuGZMU0O6ZUwg=
X-Received: by 2002:a17:902:dacc:b0:224:93e:b5d7 with SMTP id
 d9443c01a7336-22b42c155a9mr16185075ad.34.1744248838942; 
 Wed, 09 Apr 2025 18:33:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEebPkxD9bBd6wdaOrItDYEFk+Xsh37X+Og/9rXFyiXINvdY73PqJch6YsnFc+Hx/fshtFykQ==
X-Received: by 2002:a17:902:dacc:b0:224:93e:b5d7 with SMTP id
 d9443c01a7336-22b42c155a9mr16184635ad.34.1744248838458; 
 Wed, 09 Apr 2025 18:33:58 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 18:33:57 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 09:33:28 +0800
Message-Id: <20250410013330.3609482-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: xkFszTpGxcYvsYSOTPG0r38P2fHeiuZ0
X-Proofpoint-ORIG-GUID: xkFszTpGxcYvsYSOTPG0r38P2fHeiuZ0
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f72008 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VuEiWhZmLyiD4YjWg_QA:9 a=RVmHIydaz68A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100010
X-Mailman-Approved-At: Thu, 10 Apr 2025 07:19:28 +0000
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/5] coresight: ctcu: Enable byte-cntr for
	TMC ETR devices
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

The byte-cntr function provided by the CTCU device is used to transfer data
from the ETR buffer to the userspace. An interrupt is triggered if the data
size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions and the read function
will read the data from the ETR buffer if the IRQ count is greater than 0.
Each successful read process will decrement the IRQ count by 1.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/Makefile          |   2 +-
 .../coresight/coresight-ctcu-byte-cntr.c      | 119 ++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c |  88 ++++++++++++-
 drivers/hwtracing/coresight/coresight-ctcu.h  |  49 +++++++-
 drivers/hwtracing/coresight/coresight-tmc.h   |   1 +
 5 files changed, 252 insertions(+), 7 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 8e62c3150aeb..c90a06768a18 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -52,4 +52,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
-coresight-ctcu-y := coresight-ctcu-core.o
+coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
new file mode 100644
index 000000000000..db0bb5a71ed6
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/of_irq.h>
+#include <linux/uaccess.h>
+
+#include "coresight-ctcu.h"
+#include "coresight-priv.h"
+#include "coresight-tmc.h"
+
+static irqreturn_t byte_cntr_handler(int irq, void *data)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr *)data;
+
+	atomic_inc(&byte_cntr_data->irq_cnt);
+	wake_up(&byte_cntr_data->wq);
+
+	return IRQ_HANDLED;
+}
+
+/* Start the byte-cntr function when the path is enabled. */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct tmc_drvdata *tmcdrvdata;
+	int port_num;
+
+	if (!sink)
+		return;
+
+	tmcdrvdata = dev_get_drvdata(sink->dev.parent);
+	port_num = ctcu_get_active_port(sink, csdev);
+	if (port_num < 0)
+		return;
+
+	byte_cntr_data = &drvdata->byte_cntr_data[port_num];
+	/* Don't start byte-cntr function when threshold is not set. */
+	if (!byte_cntr_data->thresh_val)
+		return;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	tmcdrvdata->byte_cntr_data = byte_cntr_data;
+	byte_cntr_data->enable = true;
+}
+
+/* Stop the byte-cntr function when the path is disabled. */
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct tmc_drvdata *tmcdrvdata;
+	long w_offset;
+	int port_num;
+
+	if (!sink)
+		return;
+
+	port_num = ctcu_get_active_port(sink, csdev);
+	if (port_num < 0)
+		return;
+
+	byte_cntr_data = &drvdata->byte_cntr_data[port_num];
+	tmcdrvdata = dev_get_drvdata(sink->dev.parent);
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	/* Store the w_offset of the ETR buffer when stopping. */
+	w_offset = tmc_etr_get_rwp_offset(tmcdrvdata);
+	if (w_offset >= 0)
+		byte_cntr_data->w_offset = w_offset;
+
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	byte_cntr_data->read_active = false;
+	byte_cntr_data->enable = false;
+	/*
+	 * Wakeup once to force the read function to read the remaining
+	 * data of the ETR buffer.
+	 */
+	wake_up(&byte_cntr_data->wq);
+}
+
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct device_node *nd = dev->of_node;
+	int byte_cntr_irq, ret, i;
+
+	for (i = 0; i < etr_num; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		byte_cntr_irq = of_irq_get_byname(nd, byte_cntr_data->irq_name);
+		if (byte_cntr_irq < 0) {
+			dev_err(dev, "Failed to get IRQ from DT for %s\n",
+				byte_cntr_data->irq_name);
+			continue;
+		}
+
+		ret = devm_request_irq(dev, byte_cntr_irq, byte_cntr_handler,
+				       IRQF_TRIGGER_RISING | IRQF_SHARED,
+				       dev_name(dev), byte_cntr_data);
+		if (ret) {
+			dev_err(dev, "Failed to register IRQ for %s\n",
+				byte_cntr_data->irq_name);
+			continue;
+		}
+
+		byte_cntr_data->byte_cntr_irq = byte_cntr_irq;
+		atomic_set(&byte_cntr_data->irq_cnt, 0);
+		init_waitqueue_head(&byte_cntr_data->wq);
+	}
+}
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c6bafc96db96..fef516d7a474 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -46,16 +46,22 @@ DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
 #define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
 #define CTCU_ATID_REG_SIZE		0x10
 #define CTCU_ETR0_ATID0			0xf8
+#define CTCU_ETR0_IRQCTRL		0x6c
 #define CTCU_ETR1_ATID0			0x108
+#define CTCU_ETR1_IRQCTRL		0x70
 
 static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
 	{
-		.atid_offset	= CTCU_ETR0_ATID0,
-		.port_num	= 0,
+		.atid_offset		= CTCU_ETR0_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR0_IRQCTRL,
+		.irq_name		= "etr0",
+		.port_num		= 0,
 	},
 	{
-		.atid_offset	= CTCU_ETR1_ATID0,
-		.port_num	= 1,
+		.atid_offset		= CTCU_ETR1_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR1_IRQCTRL,
+		.irq_name		= "etr1",
+		.port_num		= 1,
 	},
 };
 
@@ -64,6 +70,69 @@ static const struct ctcu_config sa8775p_cfgs = {
 	.num_etr_config	= ARRAY_SIZE(sa8775p_etr_cfgs),
 };
 
+static ssize_t byte_cntr_val_show(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int i, len = 0;
+
+	for (i = 0; i < ETR_MAX_NUM; i++) {
+		if (drvdata->byte_cntr_data[i].irq_ctrl_offset)
+			len += scnprintf(buf + len, PAGE_SIZE - len, "%u ",
+					 drvdata->byte_cntr_data[i].thresh_val);
+	}
+
+	len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
+
+	return len;
+}
+
+static ssize_t byte_cntr_val_store(struct device *dev, struct device_attribute *attr,
+				   const char *buf, size_t size)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u32 thresh_vals[ETR_MAX_NUM] = { 0 };
+	u32 irq_ctrl_offset;
+	int num, i;
+
+	num = sscanf(buf, "%i %i", &thresh_vals[0], &thresh_vals[1]);
+	if (num <= 0 || num > ETR_MAX_NUM)
+		return -EINVAL;
+
+	/* Threshold 0 disables the interruption. */
+	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
+	for (i = 0; i < num; i++) {
+		/* A small threshold will result in a large number of interruptions */
+		if (thresh_vals[i] && thresh_vals[i] < 4096)
+			return -EINVAL;
+
+		if (drvdata->byte_cntr_data[i].irq_ctrl_offset) {
+			drvdata->byte_cntr_data[i].thresh_val = thresh_vals[i];
+			irq_ctrl_offset = drvdata->byte_cntr_data[i].irq_ctrl_offset;
+			CS_UNLOCK(drvdata->base);
+			writel_relaxed(thresh_vals[i], drvdata->base + irq_ctrl_offset);
+			CS_LOCK(drvdata->base);
+		}
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(byte_cntr_val);
+
+static struct attribute *ctcu_attrs[] = {
+	&dev_attr_byte_cntr_val.attr,
+	NULL,
+};
+
+static struct attribute_group ctcu_attr_grp = {
+	.attrs = ctcu_attrs,
+};
+
+static const struct attribute_group *ctcu_attr_grps[] = {
+	&ctcu_attr_grp,
+	NULL,
+};
+
 static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
 				       u8 bit, bool enable)
 {
@@ -122,7 +191,7 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
  * Searching the sink device from helper's view in case there are multiple helper devices
  * connected to the sink device.
  */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
+int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
 {
 	struct coresight_platform_data *pdata = helper->pdata;
 	int i;
@@ -160,6 +229,8 @@ static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode, void *
 {
 	struct coresight_path *path = (struct coresight_path *)data;
 
+	ctcu_byte_cntr_start(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, true);
 }
 
@@ -167,6 +238,8 @@ static int ctcu_disable(struct coresight_device *csdev, void *data)
 {
 	struct coresight_path *path = (struct coresight_path *)data;
 
+	ctcu_byte_cntr_stop(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, false);
 }
 
@@ -217,7 +290,11 @@ static int ctcu_probe(struct platform_device *pdev)
 			for (i = 0; i < cfgs->num_etr_config; i++) {
 				etr_cfg = &cfgs->etr_cfgs[i];
 				drvdata->atid_offset[i] = etr_cfg->atid_offset;
+				drvdata->byte_cntr_data[i].irq_name = etr_cfg->irq_name;
+				drvdata->byte_cntr_data[i].irq_ctrl_offset =
+					etr_cfg->irq_ctrl_offset;
 			}
+			ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
 		}
 	}
 
@@ -229,6 +306,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU;
 	desc.pdata = pdata;
 	desc.dev = dev;
+	desc.groups = ctcu_attr_grps;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 
diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
index e9594c38dd91..bc54cce358da 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu.h
+++ b/drivers/hwtracing/coresight/coresight-ctcu.h
@@ -5,6 +5,7 @@
 
 #ifndef _CORESIGHT_CTCU_H
 #define _CORESIGHT_CTCU_H
+
 #include "coresight-trace-id.h"
 
 /* Maximum number of supported ETR devices for a single CTCU. */
@@ -13,10 +14,14 @@
 /**
  * struct ctcu_etr_config
  * @atid_offset:	offset to the ATID0 Register.
- * @port_num:		in-port number of CTCU device that connected to ETR.
+ * @irq_ctrl_offset:	offset to the BYTECNTRVAL register.
+ * @irq_name:		IRQ name in dt node.
+ * @port_num:		in-port number of the CTCU device that connected to ETR.
  */
 struct ctcu_etr_config {
 	const u32 atid_offset;
+	const u32 irq_ctrl_offset;
+	const char *irq_name;
 	const u32 port_num;
 };
 
@@ -25,15 +30,57 @@ struct ctcu_config {
 	int num_etr_config;
 };
 
+/**
+ * struct ctcu_byte_cntr
+ * @enable:		indicates that byte_cntr function is enabled or not.
+ * @read_active:	indicates that byte-cntr node is opened or not.
+ * @thresh_val:		threshold to trigger a interruption.
+ * @total_size		total size of transferred data.
+ * @byte_cntr_irq:	IRQ number.
+ * @irq_cnt:		IRQ count.
+ * @wq:			workqueue of reading ETR data.
+ * @read_work:		work of reading ETR data.
+ * @spin_lock:		spinlock of byte cntr data.
+ * @r_offset:		offset of the pointer where reading begins.
+ * @w_offset:		offset of the write pointer in the ETR buffer when
+ *			the byte cntr is stopped.
+ * @irq_ctrl_offset:	offset to the BYTECNTVAL Register.
+ * @irq_name:		IRQ name in DT.
+ */
+struct ctcu_byte_cntr {
+	bool			enable;
+	bool			read_active;
+	u32			thresh_val;
+	u64			total_size;
+	int			byte_cntr_irq;
+	atomic_t		irq_cnt;
+	wait_queue_head_t	wq;
+	struct work_struct	read_work;
+	raw_spinlock_t		spin_lock;
+	long			r_offset;
+	long			w_offset;
+	u32			irq_ctrl_offset;
+	const char		*irq_name;
+};
+
 struct ctcu_drvdata {
 	void __iomem		*base;
 	struct clk		*apb_clk;
 	struct device		*dev;
 	struct coresight_device	*csdev;
+	struct ctcu_byte_cntr   byte_cntr_data[ETR_MAX_NUM];
 	raw_spinlock_t		spin_lock;
 	u32			atid_offset[ETR_MAX_NUM];
 	/* refcnt for each traceid of each sink */
 	u8			traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
 };
 
+/* Generic functions */
+int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper);
+
+/* Byte-cntr functions */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
+
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 945c69f6e6ca..015592863352 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -271,6 +271,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct ctcu_byte_cntr   *byte_cntr_data;
 };
 
 struct etr_buf_operations {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
