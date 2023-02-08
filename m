Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5058368EF33
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Feb 2023 13:41:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F41FFC6A5E9;
	Wed,  8 Feb 2023 12:41:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69110C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 12:41:36 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318Bhm9K022985; Wed, 8 Feb 2023 12:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=RnyquygMV6RL9lpIAcJihukRnFxLLlbA1AaqdIttOSI=;
 b=HK7lodvHQQMdqmnJ6U0m/WiAJqzaNePDT9sb3xmx6vmyjggclMyQUbC4V7G8C6pm84jC
 78tuSdpmaZPluJ55KDCGrtMeS5eMpIxZC+4LDTTrAE8GXuz0f+09LRxbqotcjReMoT6X
 uokODdObbYkgb0sbhNRulT6KPwaa96ctVq586l4RqTviItS5cyyeJE+102xKLgGmN/8r
 b5PFSQ1xL0fF+jgV1t1WOeRYeb7aQWAI6ak5Gaqpt3qN38EHokOX7YiqTk4CFxJHfCSV
 EPvA7mNhRw+bb7Qpvs3lE05G+GRjz/OnNrL1TU37BmI5kZNghKxIetxHM9dLhQcT7U3W pg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkga2v33t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 12:41:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 318Cf7ZQ031847
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Feb 2023 12:41:07 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 8 Feb 2023 04:41:07 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 8 Feb 2023 04:40:53 -0800
Message-ID: <20230208124053.18533-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ztnzml8Ig5I07g2-QZzIhZvS9kKwdp-5
X-Proofpoint-ORIG-GUID: ztnzml8Ig5I07g2-QZzIhZvS9kKwdp-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_04,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080113
Cc: linux-arm-msm@vger.kernel.org, Mao Jinlong <quic_jinlmao@quicinc.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Tao
 Zhang <quic_taozha@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Hao Zhang <quic_hazha@quicinc.com>, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] stm: class: Add MIPI OST protocol support
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

Add MIPI OST protocol support for stm to format the traces.
Framework copied from drivers/hwtracing/stm.p-sys-t.c as of
commit d69d5e83110f ("stm class: Add MIPI SyS-T protocol
support").

Signed-off-by: Tingwei Zhang <quic_tingweiz@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/stm/Kconfig  | 14 +++++
 drivers/hwtracing/stm/Makefile |  2 +
 drivers/hwtracing/stm/p_ost.c  | 95 ++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 drivers/hwtracing/stm/p_ost.c

diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
index aad594fe79cc..0b52901125f7 100644
--- a/drivers/hwtracing/stm/Kconfig
+++ b/drivers/hwtracing/stm/Kconfig
@@ -41,6 +41,20 @@ config STM_PROTO_SYS_T
 
 	  If you don't know what this is, say N.
 
+config STM_PROTO_OST
+	tristate "MIPI OST STM framing protocol driver"
+	default CONFIG_STM
+	help
+	  This is an implementation of MIPI OST protocol to be used
+	  over the STP transport. In addition to the data payload, it
+	  also carries additional metadata for entity, better
+	  means of trace source identification, etc.
+
+	  The receiving side must be able to decode this protocol in
+	  addition to the MIPI STP, in order to extract the data.
+
+	  If you don't know what this is, say N.
+
 config STM_DUMMY
 	tristate "Dummy STM driver"
 	help
diff --git a/drivers/hwtracing/stm/Makefile b/drivers/hwtracing/stm/Makefile
index 1692fcd29277..715fc721891e 100644
--- a/drivers/hwtracing/stm/Makefile
+++ b/drivers/hwtracing/stm/Makefile
@@ -5,9 +5,11 @@ stm_core-y		:= core.o policy.o
 
 obj-$(CONFIG_STM_PROTO_BASIC) += stm_p_basic.o
 obj-$(CONFIG_STM_PROTO_SYS_T) += stm_p_sys-t.o
+obj-$(CONFIG_STM_PROTO_OST) += stm_p_ost.o
 
 stm_p_basic-y		:= p_basic.o
 stm_p_sys-t-y		:= p_sys-t.o
+stm_p_ost-y		:= p_ost.o
 
 obj-$(CONFIG_STM_DUMMY)	+= dummy_stm.o
 
diff --git a/drivers/hwtracing/stm/p_ost.c b/drivers/hwtracing/stm/p_ost.c
new file mode 100644
index 000000000000..2ca1a3fda57f
--- /dev/null
+++ b/drivers/hwtracing/stm/p_ost.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copied from drivers/hwtracing/stm.p-sys-t.c as of commit d69d5e83110f
+ * ("stm class: Add MIPI SyS-T protocol support").
+ *
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2020 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018, Intel Corporation.
+ *
+ * MIPI OST framing protocol for STM devices.
+ */
+
+#include <linux/configfs.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/slab.h>
+#include <linux/stm.h>
+#include <linux/sched/clock.h>
+#include "stm.h"
+
+#define OST_TOKEN_STARTSIMPLE		(0x10)
+#define OST_VERSION_MIPI1		(0x10 << 8)
+#define OST_ENTITY_FTRACE		(0x01 << 16)
+#define OST_CONTROL_PROTOCOL		(0x0 << 24)
+
+#define DATA_HEADER (OST_TOKEN_STARTSIMPLE | OST_VERSION_MIPI1 | \
+			OST_ENTITY_FTRACE | OST_CONTROL_PROTOCOL)
+
+#define STM_MAKE_VERSION(ma, mi)	((ma << 8) | mi)
+#define STM_HEADER_MAGIC		(0x5953)
+
+static ssize_t notrace ost_write(struct stm_data *data,
+		struct stm_output *output, unsigned int chan,
+		const char *buf, size_t count)
+{
+	unsigned int c = output->channel + chan;
+	unsigned int m = output->master;
+	const unsigned char nil = 0;
+	u32 header = DATA_HEADER;
+	u8 trc_hdr[24];
+	ssize_t sz;
+
+	/*
+	 * STP framing rules for OST frames:
+	 *   * the first packet of the OST frame is marked;
+	 *   * the last packet is a FLAG.
+	 */
+	/* Message layout: HEADER / DATA / TAIL */
+	/* HEADER */
+
+	sz = data->packet(data, m, c, STP_PACKET_DATA, STP_PACKET_MARKED,
+			  4, (u8 *)&header);
+	if (sz <= 0)
+		return sz;
+	*(uint16_t *)(trc_hdr) = STM_MAKE_VERSION(0, 3);
+	*(uint16_t *)(trc_hdr + 2) = STM_HEADER_MAGIC;
+	*(uint32_t *)(trc_hdr + 4) = raw_smp_processor_id();
+	*(uint64_t *)(trc_hdr + 8) = sched_clock();
+	*(uint64_t *)(trc_hdr + 16) = task_tgid_nr(get_current());
+	sz = stm_data_write(data, m, c, false, trc_hdr, sizeof(trc_hdr));
+	if (sz <= 0)
+		return sz;
+
+	/* DATA */
+	sz = stm_data_write(data, m, c, false, buf, count);
+
+	/* TAIL */
+	if (sz > 0)
+		data->packet(data, m, c, STP_PACKET_FLAG,
+			STP_PACKET_TIMESTAMPED, 0, &nil);
+
+	return sz;
+}
+
+static const struct stm_protocol_driver ost_pdrv = {
+	.owner			= THIS_MODULE,
+	.name			= "p_ost",
+	.write			= ost_write,
+};
+
+static int ost_stm_init(void)
+{
+	return stm_register_protocol(&ost_pdrv);
+}
+
+static void ost_stm_exit(void)
+{
+	stm_unregister_protocol(&ost_pdrv);
+}
+
+module_init(ost_stm_init);
+module_exit(ost_stm_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MIPI Open System Trace STM framing protocol driver");
-- 
2.39.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
