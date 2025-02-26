Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D83A45706
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 08:50:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E086C7A82F;
	Wed, 26 Feb 2025 07:50:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73DA6C7A82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 07:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740556223; x=1772092223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J2WrRdXsHM4g/4BW0LGzBua9ax0dXvOez2jZneAIugs=;
 b=fVgrWwimODL6PhXYiP/DF2WezFNTGQ0K4JoN/RGuNaktz5oCIDlNv/fn
 fDqo7zDkEwkTxtsEefa9B8uYMM2Hq2FNifz5mbEQ6d/vIFhrQU4ktmL83
 iizIJ4BAlnYd1YdiHvF6HGhy5IPEGe39g97kZKI6SsbOQ2eJwnfz40uKQ
 if1EZSKOrDCjZDXKBKwESXpx/9yjM5JR6gb6ZwIvf1UWZYHxAOOrfbYHx
 WaqvWKwjeOaFGE+Xvr9H5klDhDqUQl27jsvfn0iruSMrAisQtC36ewc3+
 vH41svmrmIutdCvucTtJRNzS4OqJPM9JeHy4fiqAjxCzNkJY8DT2pPSiF Q==;
X-CSE-ConnectionGUID: 5cgRUlwzQFub7d0e0Y2NYg==
X-CSE-MsgGUID: IT+jSgg+QLih8Bq1PAN4+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45305140"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="45305140"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 23:50:20 -0800
X-CSE-ConnectionGUID: QfjVcDevS3id+luAHduEVg==
X-CSE-MsgGUID: k29dyh/ITGCV0Y+PbmRcEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120743019"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
 by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2025 23:50:13 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 David E Box <david.e.box@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Wed, 26 Feb 2025 15:48:34 +0800
Message-Id: <20250226074837.1679988-4-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v8 3/6] arch: x86: add IPC mailbox
	accessor function and add SoC register access
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

From: "David E. Box" <david.e.box@linux.intel.com>

- Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
- Enables the host to access specific SoC registers through the PMC
firmware using IPC commands. This access method is necessary for
registers that are not available through direct Memory-Mapped I/O (MMIO),
which is used for other accessible parts of the PMC.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Chao Qin <chao.qin@intel.com>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 MAINTAINERS                                   |  1 +
 .../linux/platform_data/x86/intel_pmc_ipc.h   | 94 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 include/linux/platform_data/x86/intel_pmc_ipc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8019d5a97546..aff084824b89 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11864,6 +11864,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-platform-intel-pmc
 F:	drivers/platform/x86/intel/pmc/
+F:	linux/platform_data/x86/intel_pmc_ipc.h
 
 INTEL PMIC GPIO DRIVERS
 M:	Andy Shevchenko <andy@kernel.org>
diff --git a/include/linux/platform_data/x86/intel_pmc_ipc.h b/include/linux/platform_data/x86/intel_pmc_ipc.h
new file mode 100644
index 000000000000..6e603a8c075f
--- /dev/null
+++ b/include/linux/platform_data/x86/intel_pmc_ipc.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Intel Core SoC Power Management Controller Header File
+ *
+ * Copyright (c) 2025, Intel Corporation.
+ * All Rights Reserved.
+ *
+ */
+#ifndef INTEL_PMC_IPC_H
+#define INTEL_PMC_IPC_H
+#include <linux/acpi.h>
+
+#define IPC_SOC_REGISTER_ACCESS			0xAA
+#define IPC_SOC_SUB_CMD_READ			0x00
+#define IPC_SOC_SUB_CMD_WRITE			0x01
+#define PMC_IPCS_PARAM_COUNT			7
+#define VALID_IPC_RESPONSE			5
+
+struct pmc_ipc_cmd {
+	u32 cmd;
+	u32 sub_cmd;
+	u32 size;
+	u32 wbuf[4];
+};
+
+struct pmc_ipc_rbuf {
+	u32 buf[4];
+};
+
+/**
+ * intel_pmc_ipc() - PMC IPC Mailbox accessor
+ * @ipc_cmd:  Prepared input command to send
+ * @rbuf:     Allocated array for returned IPC data
+ *
+ * Return: 0 on success. Non-zero on mailbox error
+ */
+static inline int intel_pmc_ipc(struct pmc_ipc_cmd *ipc_cmd, struct pmc_ipc_rbuf *rbuf)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object params[PMC_IPCS_PARAM_COUNT] = {
+		{.type = ACPI_TYPE_INTEGER,},
+		{.type = ACPI_TYPE_INTEGER,},
+		{.type = ACPI_TYPE_INTEGER,},
+		{.type = ACPI_TYPE_INTEGER,},
+		{.type = ACPI_TYPE_INTEGER,},
+		{.type = ACPI_TYPE_INTEGER,},
+		{.type = ACPI_TYPE_INTEGER,},
+	};
+	struct acpi_object_list arg_list = { PMC_IPCS_PARAM_COUNT, params };
+	union acpi_object *obj;
+	int status;
+
+	if (!ipc_cmd || !rbuf)
+		return -EINVAL;
+
+	/*
+	 * 0: IPC Command
+	 * 1: IPC Sub Command
+	 * 2: Size
+	 * 3-6: Write Buffer for offset
+	 */
+	params[0].integer.value = ipc_cmd->cmd;
+	params[1].integer.value = ipc_cmd->sub_cmd;
+	params[2].integer.value = ipc_cmd->size;
+	params[3].integer.value = ipc_cmd->wbuf[0];
+	params[4].integer.value = ipc_cmd->wbuf[1];
+	params[5].integer.value = ipc_cmd->wbuf[2];
+	params[6].integer.value = ipc_cmd->wbuf[3];
+
+	status = acpi_evaluate_object(NULL, "\\IPCS", &arg_list, &buffer);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	obj = buffer.pointer;
+
+	if (obj && obj->type == ACPI_TYPE_PACKAGE &&
+	    obj->package.count == VALID_IPC_RESPONSE) {
+		const union acpi_object *objs = obj->package.elements;
+
+		if ((u8)objs[0].integer.value != 0)
+			return -EINVAL;
+
+		rbuf->buf[0] = objs[1].integer.value;
+		rbuf->buf[1] = objs[2].integer.value;
+		rbuf->buf[2] = objs[3].integer.value;
+		rbuf->buf[3] = objs[4].integer.value;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+#endif /* INTEL_PMC_IPC_H */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
