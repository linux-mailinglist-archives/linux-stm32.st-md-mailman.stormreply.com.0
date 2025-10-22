Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6DDC0C4E6
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 09:30:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FFC7C6047B;
	Mon, 27 Oct 2025 08:30:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 321FCC57B68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 07:23:38 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2oIZt029823
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 22 Oct 2025 07:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=jQbMCxbpPfrhzFinfDjeulS4YqB0f4rNQAR
 ialM8XFo=; b=D5tEew0VV8bv0QeKM5DVdTHh4RsBXQW+zw14Awj7vpk1LRG47du
 S4omI6pFIX6wbSrAOmJ8jMEw6nIT63Xp8VVokkOUAn9/Ckde14+0XLo2oPOSiw3G
 lw/sEo84TiRoRoXp7Zve/BRRJULjYmum/dVTgDyhuqHa9Q2/CJxexJzmHmOP0YuR
 +SwUEpoVK0AawY25hIrvHcHCKLy+SUrYRKiuZsO2jG3nDHVFbwFLJa/igZlHzXp8
 xPfKJa7tF8dlzohzeydGic5qq8cdZF2i1faovfWIAkOWN2sV+zRK02sQ6n1kQIMv
 3rfwHMCn2raj+6N8jBoykFSvacIKGBXTV8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge3nq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 07:23:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-33bcb779733so5670135a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761117816; x=1761722616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQbMCxbpPfrhzFinfDjeulS4YqB0f4rNQARialM8XFo=;
 b=u+wtSuwFsy9W0XN3FiaO/Ws4CqIyf4iC34s0ZHTiUF0noz0VFW7MkYYpnyZlbPi4ot
 IhVQ9g2WdYF7Hy+c2b34RL795cjgw5o/UQr76Pn+yaKfqgGaSEBjyB40bIeA1wDqifsZ
 Zd6opqMKt6VMsWrBWLZsdkNRdgO+Ez9KK1qvQCVKAhEvOgOHSOizN8GlpozY8aNGXkr6
 Cfxfwn/bBvOZztEr27Bim4KfMI39VoEj343pd4Je+u7Sij6WNu9lqGiNqKlEhArIkFL2
 lJ70H+5gIeJMUg8PwaDmJ6DBjkYioVBwAxfsa2ReX7NJt2JO22JLKWq+dj88h1GX9L3o
 A0Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD8ppNov4I7yIQ1juevfG7YEYcgv4MrIRTv2kGHpKtL+98MWQ+9MNC6y2LE79HyjQhXWN+2KxfphK/8Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxflhgHnKOAK8khWia2XZ8XYTGzC9Fyqz9egevZ1TC8rvfpCZv0
 eG7k1jS9IncESJjYV2iaGbsqBHMSV3uGr3g82EhAYM4P5TYKz8XThIDPhLLl4eOhIM2+8uyf/L2
 EZfPb175Mp84e36BzQYMIdfCHhYmLDt+JQ60mC1JZIbQTQiIXqh7RiK+D7UfBF4xmo/FFANN232
 dTo0+05LU=
X-Gm-Gg: ASbGncuxKL6Qtc3+Nnbd+lLwZAISct6741F8DGKmiTN29tdQfKENo/MInEFcsxIJEq9
 9rh6wLZi5d1lcgVKUDrw12NK2zT84rVOjgHbHZxc1fhr1LTkAK0jzbBdh1mf9+G5vqAWXJcCu7r
 6V6bpc7s+5uqu4O47GSQD59mCtfyJGKzkEPRIt7cFsSABKpPFL0lYXjtF8QlH5KWPozu6ztLzdc
 xBLgN3DcnYQINOmmpJVwkFSFLgYuzUC1P3raETiFbCngTUPQ+t71hPNAOAywu/sSo9rUkSX0Xdn
 +kUk3RGUCWwGuXv48ySjKgiK97Zko6c3OPLgscRHfBkP2x59sIf6B09lD7z5nZ1Fjc98cp9GLtK
 N+NbouMk4wz5AtXue/Z/aWbFXGyfgJJV1WhUdd0RE9oIfn56T1vHRFj5h9iHBIbdgmC8=
X-Received: by 2002:a17:90b:3fcc:b0:33b:cb9c:6f71 with SMTP id
 98e67ed59e1d1-33bcf85a9f4mr23984851a91.1.1761117816205; 
 Wed, 22 Oct 2025 00:23:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDxR3o7v8rSGdDOSOtPiAeegaDr0tXs44OIwJVMqccRN926+CF1wCU9+iGlDSpgmUzi6qB4A==
X-Received: by 2002:a17:90b:3fcc:b0:33b:cb9c:6f71 with SMTP id
 98e67ed59e1d1-33bcf85a9f4mr23984793a91.1.1761117815540; 
 Wed, 22 Oct 2025 00:23:35 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6a7aa27ff1sm11377217a12.32.2025.10.22.00.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 00:23:35 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 22 Oct 2025 15:18:31 +0800
Message-ID: <20251022071834.1658684-1-yingchao.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX4rIRWdXOssEO
 b/XrDDTZEVv2RV+ipkkXoEQroOdjrvq7Z7xibS0pco+4sHfZ6BVlMPwgSUTUFiIYfHyEo4rVAWX
 nFBHLmR4enXlox5yWXRxZkH5nWaGk1qspWyo2lEFVEtdpuzny7wUH/6KATz8fdqW3c8S9J7MPM5
 qZI/F1L8SEcr2yGOwGP1oiRTDDHaIvcHh8PFcz1Hh+Bhip7KGCToQpPkl2GsroGmUurRYp+e+GP
 vD4Qi8oSc5QOoR5oPNzmVW8WvlTzFeD9OUFVAboPA/ZWd/pFeJfk0EgfZ/k6ZGtrOynesRROidQ
 UVK/uS6Ao9dHOIq3jh8QflrgGF0OyWkhtANckoC5bUJ9SxXKuMnn/v5fx8kMa3dB0jpo3qcCimx
 djwV6JQphd2Y1TGG7WFZRMH+SLbHmg==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f88679 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=eBY3WRN5359KEgwcfnIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: KbuYl9RiUwZ7KEr_vDS_4sr6g9wN3X4k
X-Proofpoint-ORIG-GUID: KbuYl9RiUwZ7KEr_vDS_4sr6g9wN3X4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
X-Mailman-Approved-At: Mon, 27 Oct 2025 08:30:00 +0000
Cc: linux-doc@vger.kernel.org, quic_yingdeng@quicinc.com,
 linux-kernel@vger.kernel.org, Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3] stm: class: Add MIPI OST protocol support
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

Add MIPI OST(Open System Trace) protocol support for stm to format the
traces. The OST Protocol abstracts the underlying layers from the sending
and receiving applications, thus removing dependencies on the connection
media and platform implementation.

OST over STP packet consists of Header/Payload/End. Header is designed to
include the information required by all OST packets. Information  that is
not shared by all packets is left to the higher layer protocols. Thus, the
OST Protocol Header can be regarded as the first part of a complete OST
Packet Header, while a higher layer header can be regarded as an extension
designed for a specific purpose.

+--------+--------+--------+--------+
| start  |version |entity  |protocol|
+--------+--------+--------+--------+
|    stm version  |      magic      |
+-----------------------------------+
|                cpu                |
+-----------------------------------+
|              timestamp            |
|                                   |
+-----------------------------------+
|                tgid               |
|                                   |
+-----------------------------------+
|               payload             |
+-----------------------------------+
|                 ...      |  end   |
+-----------------------------------+

In header, there will be STARTSIMPLE/VERSION/ENTITY/PROTOCOL.
STARTSIMPLE is used to signal the beginning of a simplified OST protocol.
The Version field is a one byte, unsigned number identifying the version
of the OST Protocol. The Entity ID field is a one byte unsigned number
that identifies the source.

The Protocol ID field is a one byte unsigned number identifying the higher
layer protocol of the OST Packet, i.e. identifying the format of the data
after the OST Protocol Header. OST Control Protocol ID value represents
the common control protocol, the remaining Protocol ID values may be used
by any higher layer protocols capable of being transported by the OST
Protocol.

Signed-off-by: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 .../ABI/testing/configfs-stp-policy-p_ost     |   6 +
 Documentation/trace/p_ost.rst                 |  36 +++
 drivers/hwtracing/stm/Kconfig                 |  14 +
 drivers/hwtracing/stm/Makefile                |   2 +
 drivers/hwtracing/stm/p_ost.c                 | 239 ++++++++++++++++++
 5 files changed, 297 insertions(+)
 create mode 100644 Documentation/ABI/testing/configfs-stp-policy-p_ost
 create mode 100644 Documentation/trace/p_ost.rst
 create mode 100644 drivers/hwtracing/stm/p_ost.c

diff --git a/Documentation/ABI/testing/configfs-stp-policy-p_ost b/Documentation/ABI/testing/configfs-stp-policy-p_ost
new file mode 100644
index 000000000000..498739b49da0
--- /dev/null
+++ b/Documentation/ABI/testing/configfs-stp-policy-p_ost
@@ -0,0 +1,6 @@
+What:		/config/stp-policy/<device>:p_ost.<policy>/<node>/entity
+Date:		Oct 2025
+KernelVersion:	6.18
+Description:
+		Set the entity which is to identify the source, RW.
+
diff --git a/Documentation/trace/p_ost.rst b/Documentation/trace/p_ost.rst
new file mode 100644
index 000000000000..df93b889eb4c
--- /dev/null
+++ b/Documentation/trace/p_ost.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================
+MIPI OST over STP
+===================
+
+The OST(Open System Trace) driver is used with STM class devices to
+generate standardized trace stream. Trace sources can be identified
+by different entity ids.
+
+CONFIG_STM_PROTO_OST is for p_ost driver enablement. Once this config
+is enabled, you can select the p_ost protocol by command below:
+
+# mkdir /sys/kernel/config/stp-policy/stm0:p_ost.policy
+
+The policy name format is extended like this:
+    <device_name>:<protocol_name>.<policy_name>
+
+With coresight-stm device, it will be look like "stm0:p_ost.policy".
+
+With MIPI OST protocol driver, the attributes for each protocol node is:
+# mkdir /sys/kernel/config/stp-policy/stm0:p_ost.policy/default
+# ls /sys/kernel/config/stp-policy/stm0:p_ost.policy/default
+channels  entity    masters
+
+The entity here is the set the entity that p_ost supports. Currently
+p_ost supports ftrace, console and diag entity.
+
+Set entity:
+# echo 'ftrace' > /sys/kernel/config/stp-policy/stm0:p_ost.policy/default/entity
+
+Get available and currently selected (shown in square brackets) entity that p_ost supports:
+# cat /sys/kernel/config/stp-policy/stm0:p_ost.policy/default/entity
+[ftrace] console diag
+
+See Documentation/ABI/testing/configfs-stp-policy-p_ost for more details.
diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
index eda6b11d40a1..daa4aa09f64d 100644
--- a/drivers/hwtracing/stm/Kconfig
+++ b/drivers/hwtracing/stm/Kconfig
@@ -40,6 +40,20 @@ config STM_PROTO_SYS_T
 
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
index 1692fcd29277..d9c8615849b9 100644
--- a/drivers/hwtracing/stm/Makefile
+++ b/drivers/hwtracing/stm/Makefile
@@ -5,9 +5,11 @@ stm_core-y		:= core.o policy.o
 
 obj-$(CONFIG_STM_PROTO_BASIC) += stm_p_basic.o
 obj-$(CONFIG_STM_PROTO_SYS_T) += stm_p_sys-t.o
+obj-$(CONFIG_STM_PROTO_OST)   += stm_p_ost.o
 
 stm_p_basic-y		:= p_basic.o
 stm_p_sys-t-y		:= p_sys-t.o
+stm_p_ost-y		:= p_ost.o
 
 obj-$(CONFIG_STM_DUMMY)	+= dummy_stm.o
 
diff --git a/drivers/hwtracing/stm/p_ost.c b/drivers/hwtracing/stm/p_ost.c
new file mode 100644
index 000000000000..98bb62dfc5d3
--- /dev/null
+++ b/drivers/hwtracing/stm/p_ost.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ * MIPI OST framing protocol for STM devices.
+ */
+
+#include <linux/configfs.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/sched/clock.h>
+#include <linux/slab.h>
+#include <linux/stm.h>
+#include "stm.h"
+
+/*
+ * OST Base Protocol Header
+ *
+ * Position	Bits	Field Name
+ *      0       8       STARTSIMPLE
+ *      1       8       Version
+ *      2       8       Entity ID
+ *      3       8       protocol ID
+ */
+#define OST_FIELD_STARTSIMPLE		0
+#define OST_FIELD_VERSION		8
+#define OST_FIELD_ENTITY		16
+#define OST_FIELD_PROTOCOL		24
+
+#define OST_TOKEN_STARTSIMPLE		0x10
+#define OST_VERSION_MIPI1		0x10
+
+/* entity id to identify the source*/
+#define OST_ENTITY_FTRACE		0x01
+#define OST_ENTITY_CONSOLE		0x02
+#define OST_ENTITY_DIAG			0xEE
+
+#define OST_CONTROL_PROTOCOL		0x0
+
+#define DATA_HEADER ((OST_TOKEN_STARTSIMPLE << OST_FIELD_STARTSIMPLE) | \
+		     (OST_VERSION_MIPI1 << OST_FIELD_PROTOCOL) | \
+		     (OST_CONTROL_PROTOCOL << OST_FIELD_PROTOCOL))
+
+#define STM_MAKE_VERSION(ma, mi)	(((ma) << 8) | (mi))
+#define STM_HEADER_MAGIC		(0x5953)
+
+enum ost_entity_type {
+	OST_ENTITY_TYPE_NONE,
+	OST_ENTITY_TYPE_FTRACE,
+	OST_ENTITY_TYPE_CONSOLE,
+	OST_ENTITY_TYPE_DIAG,
+};
+
+static const char * const str_ost_entity_type[] = {
+	[OST_ENTITY_TYPE_NONE]		= "none",
+	[OST_ENTITY_TYPE_FTRACE]	= "ftrace",
+	[OST_ENTITY_TYPE_CONSOLE]	= "console",
+	[OST_ENTITY_TYPE_DIAG]		= "diag",
+};
+
+static const u32 ost_entity_value[] = {
+	[OST_ENTITY_TYPE_NONE]		= 0,
+	[OST_ENTITY_TYPE_FTRACE]	= OST_ENTITY_FTRACE,
+	[OST_ENTITY_TYPE_CONSOLE]	= OST_ENTITY_CONSOLE,
+	[OST_ENTITY_TYPE_DIAG]		= OST_ENTITY_DIAG,
+};
+
+struct ost_policy_node {
+	enum ost_entity_type	entity_type;
+};
+
+struct ost_output {
+	struct ost_policy_node	node;
+};
+
+/* Set default entity type as none */
+static void ost_policy_node_init(void *priv)
+{
+	struct ost_policy_node *pn = priv;
+
+	pn->entity_type = OST_ENTITY_TYPE_NONE;
+}
+
+static int ost_output_open(void *priv, struct stm_output *output)
+{
+	struct ost_policy_node *pn = priv;
+	struct ost_output *opriv;
+
+	opriv = kzalloc(sizeof(*opriv), GFP_ATOMIC);
+	if (!opriv)
+		return -ENOMEM;
+
+	memcpy(&opriv->node, pn, sizeof(opriv->node));
+	output->pdrv_private = opriv;
+	return 0;
+}
+
+static void ost_output_close(struct stm_output *output)
+{
+	kfree(output->pdrv_private);
+}
+
+static ssize_t ost_t_policy_entity_show(struct config_item *item,
+					char *page)
+{
+	ssize_t sz = 0;
+	int i;
+	struct ost_policy_node *pn = to_pdrv_policy_node(item);
+
+	for (i = 1; i < ARRAY_SIZE(str_ost_entity_type); i++) {
+		if (i == pn->entity_type)
+			sz += sysfs_emit_at(page, sz, "[%s] ", str_ost_entity_type[i]);
+		else
+			sz += sysfs_emit_at(page, sz, "%s ", str_ost_entity_type[i]);
+	}
+
+	sz += sysfs_emit_at(page, sz, "\n");
+	return sz;
+}
+
+static int entity_index(const char *str)
+{
+	int i;
+
+	for (i = 1; i < ARRAY_SIZE(str_ost_entity_type); i++) {
+		if (sysfs_streq(str, str_ost_entity_type[i]))
+			return i;
+	}
+
+	return 0;
+}
+
+static ssize_t
+ost_t_policy_entity_store(struct config_item *item, const char *page,
+			  size_t count)
+{
+	struct ost_policy_node *pn = to_pdrv_policy_node(item);
+	int i;
+
+	i = entity_index(page);
+	if (i)
+		pn->entity_type = i;
+	else
+		return -EINVAL;
+
+	return count;
+}
+CONFIGFS_ATTR(ost_t_policy_, entity);
+
+static struct configfs_attribute *ost_t_policy_attrs[] = {
+	&ost_t_policy_attr_entity,
+	NULL,
+};
+
+static ssize_t
+notrace ost_write(struct stm_data *data, struct stm_output *output,
+		  unsigned int chan, const char *buf, size_t count,
+		  struct stm_source_data *source)
+{
+	unsigned int c = output->channel + chan;
+	unsigned int m = output->master;
+	const unsigned char nil = 0;
+	u32 header = DATA_HEADER;
+	struct trc_hdr {
+		u16 version;
+		u16 magic;
+		u32 cpu;
+		u64 timestamp;
+		u64 tgid;
+	} hdr;
+	ssize_t sz;
+	int i;
+	struct ost_output *op = output->pdrv_private;
+
+	/*
+	 * Identify the source by entity type.
+	 * If entity type is not set, return error value.
+	 */
+	if (op->node.entity_type)
+		header |= ost_entity_value[op->node.entity_type];
+	else
+		return -EINVAL;
+
+	/*
+	 * STP framing rules for OST frames:
+	 *   * the first packet of the OST frame is marked;
+	 *   * the last packet is a FLAG with timestamped tag.
+	 */
+	/* Message layout: HEADER / DATA / TAIL */
+	/* HEADER */
+	sz = data->packet(data, m, c, STP_PACKET_DATA, STP_PACKET_MARKED,
+			  4, (u8 *)&header);
+	if (sz <= 0)
+		return sz;
+
+	/* DATA */
+	hdr.version	= STM_MAKE_VERSION(0, 3);
+	hdr.magic	= STM_HEADER_MAGIC;
+	hdr.cpu		= raw_smp_processor_id();
+	hdr.timestamp = sched_clock();
+	hdr.tgid	= task_tgid_nr(current);
+	sz = stm_data_write(data, m, c, false, &hdr, sizeof(hdr));
+	if (sz <= 0)
+		return sz;
+
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
+	.policy_attr		= ost_t_policy_attrs,
+	.output_open		= ost_output_open,
+	.output_close		= ost_output_close,
+	.policy_node_init	= ost_policy_node_init,
+};
+
+static int ost_stm_init(void)
+{
+	return stm_register_protocol(&ost_pdrv);
+}
+module_init(ost_stm_init);
+
+static void ost_stm_exit(void)
+{
+	stm_unregister_protocol(&ost_pdrv);
+}
+module_exit(ost_stm_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MIPI Open System Trace STM framing protocol driver");
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
