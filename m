Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85BA58EEB
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 10:05:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C04EEC78F9B;
	Mon, 10 Mar 2025 09:05:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCCE7C78F9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 09:05:13 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529LXgmM009677;
 Mon, 10 Mar 2025 09:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /aO5YbNlXTtwvmMBaXLCtlM0PhxiyAhiBZ9cxleLVVU=; b=VciTcfQq/5nJrX6N
 u/zYeEyfvvFKJZ6WB0k9LFEfSyi1Xc1LAhS5sfF9Dq9pOsJp0II5eDa7dY8i4SHY
 dq5V+tZ6ON4x0uDP/hUebjdaeMHgFPPr0F6qPyqAz3fVhFnl6qxruWbth6lMjtw0
 WgrTMqpK86Zm8yNM2o9jrMblv1REsQtyl7LBUbU6dVZUWS5GYWiIhLKLdPORGPqH
 DtJS9/PY0Xm8oDdvyHfO72iqZ7FpFDEBH7UAgZeoXwKPUzNITeUSXAqSdx6T1Z0T
 prLRsMqWt19ZfMKQWGLOgmT3DdZzLpvTQ61diUEbsKVmDPAMWMCU8oJ3MDDJP1bb
 omo6kA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eypc744-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Mar 2025 09:04:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A94oIB005905
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Mar 2025 09:04:50 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 02:04:44 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 10 Mar 2025 17:04:06 +0800
Message-ID: <20250310090407.2069489-4-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=A9yWP7WG c=1 sm=1 tr=0 ts=67ceab33 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=qkhKFYCmI9jF0lKWm-MA:9
 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: N1rXsQ1rDv0s7hLPhZCGklsCZJaP2Eft
X-Proofpoint-GUID: N1rXsQ1rDv0s7hLPhZCGklsCZJaP2Eft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_03,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100071
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 3/4] coresight: ctcu: Enable byte-cntr for
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

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/Makefile          |   2 +-
 .../coresight/coresight-ctcu-byte-cntr.c      | 339 ++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c |  96 ++++-
 drivers/hwtracing/coresight/coresight-ctcu.h  |  59 ++-
 .../hwtracing/coresight/coresight-tmc-etr.c   |   5 +-
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
 6 files changed, 493 insertions(+), 10 deletions(-)
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
index 000000000000..0d16385663f5
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/of_irq.h>
+#include <linux/property.h>
+#include <linux/uaccess.h>
+
+#include "coresight-ctcu.h"
+#include "coresight-priv.h"
+#include "coresight-tmc.h"
+
+#define BYTE_CNTR_CLASS_STR "byte-cntr-class"
+
+static struct class *byte_cntr_class;
+static dev_t byte_cntr_base;
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
+/* Read the data from ETR's DDR buffer. */
+static void __ctcu_byte_cntr_read_etr_bytes(struct ctcu_byte_cntr *byte_cntr_data,
+					    size_t *len, char **bufp)
+{
+	struct tmc_drvdata *tmcdrvdata = dev_get_drvdata(byte_cntr_data->sink->dev.parent);
+	size_t actual, bytes = byte_cntr_data->thresh_val;
+	struct etr_buf *etr_buf = tmcdrvdata->sysfs_buf;
+	long r_offset;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	r_offset = byte_cntr_data->r_offset;
+	if (*len >= bytes)
+		*len = bytes;
+	else if ((r_offset % bytes) + *len > bytes)
+		*len = bytes - (r_offset % bytes);
+
+	actual = tmc_etr_buf_get_data(etr_buf, r_offset, *len, bufp);
+	*len = actual;
+	if (actual == bytes || (actual + r_offset) % bytes == 0)
+		atomic_dec(&byte_cntr_data->irq_cnt);
+}
+
+/* Flush the remaining data in the ETR buffer after the byte cntr has stopped. */
+static ssize_t ctcu_flush_etr_buffer(struct ctcu_byte_cntr *byte_cntr_data, size_t len,
+				     char **bufpp)
+{
+	struct tmc_drvdata *tmcdrvdata = dev_get_drvdata(byte_cntr_data->sink->dev.parent);
+	struct etr_buf *etr_buf = tmcdrvdata->sysfs_buf;
+	ssize_t read_len = 0, remaining_len;
+	long r_offset, w_offset;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	r_offset = byte_cntr_data->r_offset;
+	w_offset = byte_cntr_data->w_offset;
+	if (w_offset < r_offset)
+		remaining_len = tmcdrvdata->size + w_offset - r_offset;
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
+static ssize_t ctcu_byte_cntr_copy_data(char __user *data, size_t len, char *bufp,
+					struct ctcu_byte_cntr *byte_cntr_data,
+					struct tmc_drvdata *tmcdrvdata)
+{
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	if (copy_to_user(data, bufp, len))
+		return -EFAULT;
+
+	byte_cntr_data->total_size += len;
+	if (byte_cntr_data->r_offset + len >= tmcdrvdata->size)
+		byte_cntr_data->r_offset = 0;
+	else
+		byte_cntr_data->r_offset += len;
+
+	return len;
+}
+
+/* The read function for /dev/byte-cntr%d */
+static ssize_t ctcu_byte_cntr_read_etr_bytes(struct file *fp, char __user *data,
+					     size_t len, loff_t *ppos)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = fp->private_data;
+	struct tmc_drvdata *tmcdrvdata = dev_get_drvdata(byte_cntr_data->sink->dev.parent);
+	char *bufp = NULL;
+	ssize_t read_len;
+
+	if (!data)
+		return -EINVAL;
+
+	/*
+	 * Flush the remaining data in the ETR buffer based on the write
+	 * offset of the ETR buffer when the byte cntr function has stopped.
+	 */
+	if (!byte_cntr_data->read_active || !byte_cntr_data->enable) {
+		read_len = ctcu_flush_etr_buffer(byte_cntr_data, len, &bufp);
+		if (read_len > 0)
+			return ctcu_byte_cntr_copy_data(data, read_len, bufp,
+							byte_cntr_data, tmcdrvdata);
+
+		return -EINVAL;
+	}
+
+	if (!atomic_read(&byte_cntr_data->irq_cnt)) {
+		if (wait_event_interruptible(byte_cntr_data->wq,
+					     atomic_read(&byte_cntr_data->irq_cnt) > 0 ||
+					     !byte_cntr_data->enable))
+			return -ERESTARTSYS;
+	}
+
+	__ctcu_byte_cntr_read_etr_bytes(byte_cntr_data, &len, &bufp);
+
+	return ctcu_byte_cntr_copy_data(data, len, bufp, byte_cntr_data, tmcdrvdata);
+}
+
+/* Start the byte-cntr function when the path is enabled. */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
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
+	/* Don't start byte-cntr function when threshold is not set. */
+	if (!byte_cntr_data->thresh_val)
+		return;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	byte_cntr_data->sink = sink;
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
+	tmcdrvdata = dev_get_drvdata(byte_cntr_data->sink->dev.parent);
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	/* Store the w_offset of the ETR buffer when stopping. */
+	byte_cntr_data->w_offset = tmc_get_rwp_offset(tmcdrvdata);
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
+static int ctcu_byte_cntr_release(struct inode *in, struct file *fp)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = fp->private_data;
+	struct device *dev = &byte_cntr_data->sink->dev;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	byte_cntr_data->read_active = false;
+	disable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	dev_dbg(dev, "send data total size: %llu bytes, r_offset: %ld w_offset: %ld\n",
+		byte_cntr_data->total_size, byte_cntr_data->r_offset,
+		byte_cntr_data->w_offset);
+
+	return 0;
+}
+
+static int ctcu_byte_cntr_open(struct inode *in, struct file *fp)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = container_of(in->i_cdev,
+							     struct ctcu_byte_cntr, c_dev);
+	struct tmc_drvdata *tmcdrvdata;
+
+	if (byte_cntr_data->read_active)
+		return -EBUSY;
+
+	if (!byte_cntr_data->thresh_val || !byte_cntr_data->sink ||
+	    (coresight_get_mode(byte_cntr_data->sink) !=  CS_MODE_SYSFS))
+		return -EINVAL;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	enable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	fp->private_data = byte_cntr_data;
+	nonseekable_open(in, fp);
+	tmcdrvdata = dev_get_drvdata(byte_cntr_data->sink->dev.parent);
+	/*
+	 * The original r_offset is the w_offset of the ETR buffer at the
+	 * start of the byte-cntr.
+	 */
+	byte_cntr_data->r_offset = tmc_get_rwp_offset(tmcdrvdata);
+	byte_cntr_data->total_size = 0;
+	byte_cntr_data->read_active = true;
+	byte_cntr_data->enable = true;
+
+	return 0;
+}
+
+static const struct file_operations byte_cntr_fops = {
+	.owner		= THIS_MODULE,
+	.open		= ctcu_byte_cntr_open,
+	.read		= ctcu_byte_cntr_read_etr_bytes,
+	.release	= ctcu_byte_cntr_release,
+};
+
+static int ctcu_byte_cntr_register_chardev(struct ctcu_byte_cntr *byte_cntr_data,
+					   int port_num)
+{
+	struct device *device;
+	dev_t devt;
+	int ret;
+
+	cdev_init(&byte_cntr_data->c_dev, &byte_cntr_fops);
+	devt = MKDEV(MAJOR(byte_cntr_base), MINOR(byte_cntr_base) + port_num);
+	ret = cdev_add(&byte_cntr_data->c_dev, devt, 1);
+	if (ret < 0)
+		return -ENOMEM;
+
+	device = device_create(byte_cntr_class, NULL, devt, byte_cntr_data,
+			       byte_cntr_data->name);
+
+	if (IS_ERR(device))
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void ctcu_byte_cntr_unregister_chardev(struct ctcu_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	int i;
+
+	for (i = 0; i < ETR_MAX_NUM; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		device_destroy(byte_cntr_class, byte_cntr_data->c_dev.dev);
+	}
+}
+
+int ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct device_node *nd = dev->of_node;
+	int byte_cntr_irq, ret, i;
+
+	ret = alloc_chrdev_region(&byte_cntr_base, 0, ETR_MAX_NUM, BYTE_CNTR_CLASS_STR);
+	if (ret < 0)
+		return -ENOMEM;
+
+	byte_cntr_class = class_create(BYTE_CNTR_CLASS_STR);
+	if (IS_ERR(byte_cntr_class)) {
+		unregister_chrdev_region(byte_cntr_base, ETR_MAX_NUM);
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < etr_num; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		byte_cntr_irq = of_irq_get_byname(nd, byte_cntr_data->irq_name);
+		if (byte_cntr_irq < 0) {
+			ret = byte_cntr_irq;
+			goto err_exit;
+		}
+
+		ret = devm_request_irq(dev, byte_cntr_irq, byte_cntr_handler,
+				       IRQF_TRIGGER_RISING | IRQF_SHARED,
+				       dev_name(dev), byte_cntr_data);
+		if (ret) {
+			dev_err(dev, "Failed to register IRQ for %s\n",
+				byte_cntr_data->name);
+			goto err_exit;
+		}
+
+		ret = ctcu_byte_cntr_register_chardev(byte_cntr_data, i);
+		if (ret) {
+			dev_err(dev, "Failed to register chardev for %s\n",
+				byte_cntr_data->name);
+			goto err_exit;
+		}
+
+		byte_cntr_data->byte_cntr_irq = byte_cntr_irq;
+		atomic_set(&byte_cntr_data->irq_cnt, 0);
+		init_waitqueue_head(&byte_cntr_data->wq);
+	}
+
+	return 0;
+
+err_exit:
+	ctcu_byte_cntr_unregister_chardev(drvdata);
+	class_destroy(byte_cntr_class);
+	unregister_chrdev_region(byte_cntr_base, ETR_MAX_NUM);
+	return ret;
+}
+
+void ctcu_byte_cntr_remove(struct ctcu_drvdata *drvdata)
+{
+	ctcu_byte_cntr_unregister_chardev(drvdata);
+	class_destroy(byte_cntr_class);
+	unregister_chrdev_region(byte_cntr_base, ETR_MAX_NUM);
+}
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index da35d8b4d579..5782655a5f39 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -46,16 +46,24 @@ DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
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
+		.byte_cntr_name		= "byte-cntr0",
+		.port_num		= 0,
 	},
 	{
-		.atid_offset	= CTCU_ETR1_ATID0,
-		.port_num	= 1,
+		.atid_offset		= CTCU_ETR1_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR1_IRQCTRL,
+		.irq_name		= "etr1",
+		.byte_cntr_name		= "byte-cntr1",
+		.port_num		= 1,
 	},
 };
 
@@ -64,6 +72,69 @@ static const struct ctcu_config sa8775p_cfgs = {
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
@@ -122,7 +193,7 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
  * Searching the sink device from helper's view in case there are multiple helper devices
  * connected to the sink device.
  */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
+int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
 {
 	struct coresight_platform_data *pdata = helper->pdata;
 	int i;
@@ -160,6 +231,8 @@ static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode, void *
 {
 	struct coresight_path *path = (struct coresight_path *)data;
 
+	ctcu_byte_cntr_start(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, true);
 }
 
@@ -167,6 +240,8 @@ static int ctcu_disable(struct coresight_device *csdev, void *data)
 {
 	struct coresight_path *path = (struct coresight_path *)data;
 
+	ctcu_byte_cntr_stop(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, false);
 }
 
@@ -188,7 +263,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	const struct ctcu_config *cfgs;
 	struct ctcu_drvdata *drvdata;
 	void __iomem *base;
-	int i;
+	int ret, i;
 
 	desc.name = coresight_alloc_device_name(&ctcu_devs, dev);
 	if (!desc.name)
@@ -217,7 +292,14 @@ static int ctcu_probe(struct platform_device *pdev)
 			for (i = 0; i < cfgs->num_etr_config; i++) {
 				etr_cfg = &cfgs->etr_cfgs[i];
 				drvdata->atid_offset[i] = etr_cfg->atid_offset;
+				drvdata->byte_cntr_data[i].irq_name = etr_cfg->irq_name;
+				drvdata->byte_cntr_data[i].name = etr_cfg->byte_cntr_name;
+				drvdata->byte_cntr_data[i].irq_ctrl_offset =
+					etr_cfg->irq_ctrl_offset;
 			}
+			ret = ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
+			if (ret < 0)
+				dev_warn(dev, "Byte cntr init failed\n");
 		}
 	}
 
@@ -229,6 +311,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU;
 	desc.pdata = pdata;
 	desc.dev = dev;
+	desc.groups = ctcu_attr_grps;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 
@@ -247,6 +330,7 @@ static void ctcu_remove(struct platform_device *pdev)
 {
 	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
 
+	ctcu_byte_cntr_remove(drvdata);
 	coresight_unregister(drvdata->csdev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
index e9594c38dd91..e38535c91090 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu.h
+++ b/drivers/hwtracing/coresight/coresight-ctcu.h
@@ -5,6 +5,8 @@
 
 #ifndef _CORESIGHT_CTCU_H
 #define _CORESIGHT_CTCU_H
+#include <linux/cdev.h>
+
 #include "coresight-trace-id.h"
 
 /* Maximum number of supported ETR devices for a single CTCU. */
@@ -13,10 +15,16 @@
 /**
  * struct ctcu_etr_config
  * @atid_offset:	offset to the ATID0 Register.
- * @port_num:		in-port number of CTCU device that connected to ETR.
+ * @irq_ctrl_offset:	offset to the BYTECNTRVAL register.
+ * @irq_name:		IRQ name in dt node.
+ * @byte_cntr_name:	name of the byte cntr device node.
+ * @port_num:		in-port number of the CTCU device that connected to ETR.
  */
 struct ctcu_etr_config {
 	const u32 atid_offset;
+	const u32 irq_ctrl_offset;
+	const char *irq_name;
+	const char *byte_cntr_name;
 	const u32 port_num;
 };
 
@@ -25,15 +33,64 @@ struct ctcu_config {
 	int num_etr_config;
 };
 
+/**
+ * struct ctcu_byte_cntr
+ * @c_dev:		cdev for byte_cntr.
+ * @sink		csdev of sink device.
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
+ * @irq_ctrl_offset:	offset to the BYTECNTRVAL Register.
+ * @name:		the name of byte cntr device node.
+ * @irq_name:		IRQ name in DT.
+ */
+struct ctcu_byte_cntr {
+	struct cdev		c_dev;
+	struct coresight_device	*sink;
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
+	const char		*name;
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
+int ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
+void ctcu_byte_cntr_remove(struct ctcu_drvdata *drvdata);
+
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index ec636ab1fd75..5dc94e890927 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1040,14 +1040,15 @@ static void tmc_free_etr_buf(struct etr_buf *etr_buf)
  * Returns: The size of the linear data available @pos, with *bufpp
  * updated to point to the buffer.
  */
-static ssize_t tmc_etr_buf_get_data(struct etr_buf *etr_buf,
-				    u64 offset, size_t len, char **bufpp)
+ssize_t tmc_etr_buf_get_data(struct etr_buf *etr_buf,
+			     u64 offset, size_t len, char **bufpp)
 {
 	/* Adjust the length to limit this transaction to end of buffer */
 	len = (len < (etr_buf->size - offset)) ? len : etr_buf->size - offset;
 
 	return etr_buf->ops->get_data(etr_buf, (u64)offset, len, bufpp);
 }
+EXPORT_SYMBOL_GPL(tmc_etr_buf_get_data);
 
 static inline s64
 tmc_etr_buf_insert_barrier_packet(struct etr_buf *etr_buf, u64 offset)
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index baedb4dcfc3f..2fc77fd4ea25 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -443,5 +443,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data);
 extern const struct attribute_group coresight_etr_group;
 long tmc_get_rwp_offset(struct tmc_drvdata *drvdata);
+ssize_t tmc_etr_buf_get_data(struct etr_buf *etr_buf, u64 offset, size_t len,
+			     char **bufpp);
 
 #endif
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
