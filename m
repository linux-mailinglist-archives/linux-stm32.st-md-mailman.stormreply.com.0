Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 911E8A83AC5
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 09:19:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F645C7A849;
	Thu, 10 Apr 2025 07:19:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02412CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:34:06 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HHPiT027492
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 10 Apr 2025 01:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Wi4lXP9W3EG
 bwQoH1fNQoNj4KY8C57elQ6SQxXyrbGE=; b=ehx+PJASkfjQjW1jy0pGt6lr+ml
 MjAgpwND1hPznp/TsmS4pNTXt6M4tx1VNZ5bVw0TzkhPaOBYyIJn9rWU7Asry0Br
 YhFa6C1ULZNjj7ggb55L3dxkZWOr1SbkSofGL3prtxOEDovY0YZhY/inmv5xR4sY
 kaB4XJ43hsIItLMJFecsrvTdaHTinzlcTwU99F+og6b3kCvBUFVQ8mE9FTdCthEX
 qTiwB3hwIlwOI9SV82kykI2imRUHGC2ygDthDefn4EOE+4tcm/KShL6+ERb4/dzu
 WZRV+aui9uDRWByTsMgxraw5MQZk0CVweGBoOrGIdD0ngbpiY57TWi/91MQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrnbkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:34:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-225429696a9so3346835ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Apr 2025 18:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744248844; x=1744853644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wi4lXP9W3EGbwQoH1fNQoNj4KY8C57elQ6SQxXyrbGE=;
 b=LfNtnqpFZw6t2ML+lu/QV6HHdRARqeH6mNbEsOnA+W+3L2+hR377u6iGc8m2MHX2O4
 k19jcd/0z8wqM+nIAac7JfCXqrjEgos7lSdZbDu3nyKiun086wVoUYV2o0dorWt4eA/8
 jYiwP+qgeHfN9/Ua6j8ciok8M1gPQVgqSX5tSDDxQRjIAVS9IWTMAQBLFrg9C7ZtlQvk
 FdT/Wci906Zm3PGviusctxZ+mKgnEaG0nHZpDqMLmoLzyvGkj0mwqJPfYILD1p3XVGXB
 IkfbIJ7TZ2ECDKncx9EQWTn5yPgNhZjX705ZbopG0Fiv+ftwZDNnokLadOMLUECHA2B7
 JS2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL/6SaZEKRsFkymhFe6kYxAE4KhWYzNu2DxOP1Y1NSNcNf2REb5nQKUhabcnlq4kRmVlvGzEJyuk/mmA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy5Quul29v5d8ZI2Q7ZIg40BE3wcC3gypu0bFfPzFTnKIIQa+3f
 v26V059ZUqraPs/j8D5uoBJYd77Mo7ok6e033Bp8AkcNDlwFK19pgfDmZDoZMG12Di6xSaWa6d2
 ZTJ3ZVGOq5/1qABDy2RPMLgfRrmGGEDx3X4yvIOZsp1qoxQk/bPKnRCAe3ZiYKQtLzgN0lff0gp
 sA5rc=
X-Gm-Gg: ASbGncvKL3kJRfZzI4Lgk50PxHDygvvtH9R4lUXioDKvitmKFIRUDOBXC5bbKkuO2O0
 3nCTKeQZJcGNpWrve9nYGuQ64SeFjiIdxLmIDzq18gDqxYMcCuxmJ0N57MX/q1l+S9Y163lDlva
 AGbN4KAlUGVMhJ0G3uQxJ69sZik7QCZyU2JQ3WGGMLU+s2lZSE7jl8NJ93s+Uuf5hCkMLarKmRf
 Zy3ILfTEyvaiGLxV4bLFI05W8HwjdhsY000EnxJDtq2gyZ7uBhD97qNV0/drBEqIZHBX7h3HKL2
 kx+H0soHfdmyD28xYFe7MBpymX15eQuAMC08Ftdzp8Ez23fbY3/HE7pDaWGnc3And8fTny8=
X-Received: by 2002:a17:902:f681:b0:223:6180:1bf7 with SMTP id
 d9443c01a7336-22b42c43a5bmr12196795ad.42.1744248844076; 
 Wed, 09 Apr 2025 18:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM5MLSaC5h0z0Nma92y/73HYdOvdIe7fjt5Tz++qKzvrLB+EeEnAMPV6E6WyIx8TKR//F42g==
X-Received: by 2002:a17:902:f681:b0:223:6180:1bf7 with SMTP id
 d9443c01a7336-22b42c43a5bmr12196485ad.42.1744248843598; 
 Wed, 09 Apr 2025 18:34:03 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 18:34:02 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 09:33:29 +0800
Message-Id: <20250410013330.3609482-5-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: cxIXWh7zx6KT6_LVVkKqRQlaFoS_O9bg
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f7200d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vnqp29LrZxOKxJPgRI8A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: cxIXWh7zx6KT6_LVVkKqRQlaFoS_O9bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1011 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100010
X-Mailman-Approved-At: Thu, 10 Apr 2025 07:19:28 +0000
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/5] coresight: tmc: add functions for
	byte-cntr operation
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

The byte-cntr function only copy trace data from etr_buf based on the
IRQ count number. The system will call byte-cntr realted functions when
the BYTECNTRVAL register has configured.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  |  29 ++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 113 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |   8 +-
 3 files changed, 146 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index a7814e8e657b..42707b5b6349 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -229,6 +229,7 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
 	int ret = 0;
 
 	switch (drvdata->config_type) {
@@ -237,7 +238,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_prepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_byte_cntr_prepare(drvdata);
+		else
+			ret = tmc_read_prepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
@@ -251,6 +255,7 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
 	int ret = 0;
 
 	switch (drvdata->config_type) {
@@ -259,7 +264,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_unprepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_byte_cntr_unprepare(drvdata);
+		else
+			ret = tmc_read_unprepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
@@ -290,11 +298,16 @@ static int tmc_open(struct inode *inode, struct file *file)
 static inline ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata,
 					  loff_t pos, size_t len, char **bufpp)
 {
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
 	case TMC_CONFIG_TYPE_ETF:
 		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
 	case TMC_CONFIG_TYPE_ETR:
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			return tmc_byte_cntr_get_data(drvdata, &len, bufpp);
+
 		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
 	}
 
@@ -308,6 +321,8 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 	ssize_t actual;
 	struct tmc_drvdata *drvdata = container_of(file->private_data,
 						   struct tmc_drvdata, miscdev);
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+
 	actual = tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
 	if (actual <= 0)
 		return 0;
@@ -318,7 +333,15 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (byte_cntr_data && byte_cntr_data->thresh_val) {
+		byte_cntr_data->total_size += actual;
+		if (byte_cntr_data->r_offset + actual >= drvdata->size)
+			byte_cntr_data->r_offset = 0;
+		else
+			byte_cntr_data->r_offset += actual;
+	} else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index ed8a89fcd3fc..dd9c6b541b60 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -18,6 +18,7 @@
 #include "coresight-etm-perf.h"
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 struct etr_flat_buf {
 	struct device	*dev;
@@ -1148,6 +1149,77 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
 	return rc;
 }
 
+/* Read the data from ETR's DDR buffer. */
+static ssize_t __tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata, size_t *len,
+					char **bufpp)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+	size_t actual, bytes = byte_cntr_data->thresh_val;
+	struct etr_buf *etr_buf = drvdata->sysfs_buf;
+	long r_offset = byte_cntr_data->r_offset;
+
+	if (*len >= bytes)
+		*len = bytes;
+	else if ((r_offset % bytes) + *len > bytes)
+		*len = bytes - (r_offset % bytes);
+
+	actual = tmc_etr_buf_get_data(etr_buf, r_offset, *len, bufpp);
+	if (actual == bytes || (actual + r_offset) % bytes == 0)
+		atomic_dec(&byte_cntr_data->irq_cnt);
+
+	return actual;
+}
+
+/* Flush the remaining data in the ETR buffer after the byte-cntr has stopped. */
+static ssize_t tmc_byte_cntr_flush_buffer(struct tmc_drvdata *drvdata, size_t len,
+					  char **bufpp)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+	struct etr_buf *etr_buf = drvdata->sysfs_buf;
+	long r_offset = byte_cntr_data->r_offset;
+	long w_offset = byte_cntr_data->w_offset;
+	ssize_t read_len = 0, remaining_len;
+
+	if (w_offset < r_offset)
+		remaining_len = drvdata->size + w_offset - r_offset;
+	else
+		remaining_len = w_offset - r_offset;
+
+	if (remaining_len > len)
+		remaining_len = len;
+
+	if (remaining_len > 0)
+		read_len = tmc_etr_buf_get_data(etr_buf, r_offset, remaining_len, bufpp);
+
+	return read_len;
+}
+
+ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata, size_t *len, char **bufpp)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+	ssize_t read_len;
+
+	/*
+	 * Flush the remaining data in the ETR buffer based on the write
+	 * offset of the ETR buffer when the byte cntr function has stopped.
+	 */
+	if (!byte_cntr_data->read_active || !byte_cntr_data->enable) {
+		read_len = tmc_byte_cntr_flush_buffer(drvdata, *len, bufpp);
+		if (read_len > 0)
+			return read_len;
+
+		return -EINVAL;
+	}
+
+	if (!atomic_read(&byte_cntr_data->irq_cnt))
+		if (wait_event_interruptible(byte_cntr_data->wq,
+					     atomic_read(&byte_cntr_data->irq_cnt) > 0 ||
+					     !byte_cntr_data->enable))
+			return -ERESTARTSYS;
+
+	return __tmc_byte_cntr_get_data(drvdata, len, bufpp);
+}
+
 /*
  * Return the available trace data in the buffer (starts at etr_buf->offset,
  * limited by etr_buf->len) from @pos, with a maximum limit of @len,
@@ -1963,6 +2035,32 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+int tmc_read_byte_cntr_prepare(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+	long r_offset;
+
+	if (byte_cntr_data->read_active)
+		return -EBUSY;
+
+	/*
+	 * The original r_offset is the w_offset of the ETR buffer at the
+	 * start of the byte-cntr.
+	 */
+	r_offset = tmc_etr_get_rwp_offset(drvdata);
+	if (r_offset < 0) {
+		dev_err(&drvdata->csdev->dev, "failed to get r_offset\n");
+		return r_offset;
+	}
+
+	enable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	byte_cntr_data->r_offset = r_offset;
+	byte_cntr_data->total_size = 0;
+	byte_cntr_data->read_active = true;
+
+	return 0;
+}
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
@@ -1999,6 +2097,21 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 	return ret;
 }
 
+int tmc_read_byte_cntr_unprepare(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+	struct device *dev = &drvdata->csdev->dev;
+
+	disable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	byte_cntr_data->read_active = false;
+	dev_dbg(dev, "send data total size: %llu bytes, r_offset: %ld w_offset: %ld\n",
+		byte_cntr_data->total_size, byte_cntr_data->r_offset,
+		byte_cntr_data->w_offset);
+
+	return 0;
+}
+
 int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 {
 	unsigned long flags;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 015592863352..1b838e4fc9e8 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -14,6 +14,8 @@
 #include <linux/refcount.h>
 #include <linux/crc32.h>
 
+#include "coresight-ctcu.h"
+
 #define TMC_RSZ			0x004
 #define TMC_STS			0x00c
 #define TMC_RRD			0x010
@@ -334,11 +336,15 @@ ssize_t tmc_etb_get_sysfs_trace(struct tmc_drvdata *drvdata,
 /* ETR functions */
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata);
 int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata);
+int tmc_read_prepare_etr(struct tmc_drvdata *drvdata);
+int tmc_read_byte_cntr_prepare(struct tmc_drvdata *drvdata);
+int tmc_read_byte_cntr_unprepare(struct tmc_drvdata *drvdata);
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata);
 extern const struct coresight_ops tmc_etr_cs_ops;
 ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 				loff_t pos, size_t len, char **bufpp);
-
+ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata, size_t *len,
+			       char **bufpp);
 
 #define TMC_REG_PAIR(name, lo_off, hi_off)				\
 static inline u64							\
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
