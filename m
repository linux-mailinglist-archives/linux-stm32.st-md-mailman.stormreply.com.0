Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDEC9033EB
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 09:40:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3C46C78007;
	Tue, 11 Jun 2024 07:40:21 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84657C78003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 07:40:20 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B7YKJP027856;
 Tue, 11 Jun 2024 09:40:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 UmZaunEngilChyVpOjfu+oucX8sRZe6WEZJuExjJbN4=; b=oJ5zG3TkmHVB8+68
 53yJhi0/NHSfbLGbT2+db0zKzG8SKRwbx6XRRWsk+N3Jni4eT5lFf+z0cMIpdyHK
 H1alwTOrg7BL6r8MQQcVxzZzVnp7WxBhTTEl4C1Kl9X/dE/vidoObbEI6U6Z5LnU
 QlcQzpJusugyd5aGOh6Ksln5anyGnOJ0GDmRHvI7/0uChm2caSY/BS9ao3+Bq6xO
 rkHb37MHx42MbbAPWHW4huOBP1uSZo9ZqCMMJvOvYZE1+2EsDztYG1tErFtWeMR3
 ljAWBIKeKvJlqxRyeYZA5Sfj8aAa92bW2kpc3AE84SUCnJgQA4vUJxZSd/VRB8B3
 3QKEKQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp29fgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 09:40:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 89DFA4002D;
 Tue, 11 Jun 2024 09:39:57 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A202920F54D;
 Tue, 11 Jun 2024 09:39:10 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 09:39:10 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 09:39:10 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Date: Tue, 11 Jun 2024 09:39:01 +0200
Message-ID: <20240611073904.475019-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611073904.475019-1-arnaud.pouliquen@foss.st.com>
References: <20240611073904.475019-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_03,2024-06-11_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 2/5] remoteproc: Add TEE support
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

Add a remoteproc TEE (Trusted Execution Environment) driver
that will be probed by the TEE bus. If the associated Trusted
application is supported on secure part this driver offers a client
interface to load a firmware in the secure part.
This firmware could be authenticated by the secure trusted application.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
update from V
- Fix missing "{" in tee_rproc_find_loaded_rsc_table inline definition.

update from V5
- make tee_rproc_get_loaded_rsc_table() local and replace this API by
  tee_rproc_find_loaded_rsc_table()
- map and unmap the resource table in tee_rproc_parse_fw to make a cached copy
- use the new rproc_pa_to_va() API to map the resource table memory declared in carevout
- remove tee_rproc_release_loaded_rsc_table as no more used.
---
 drivers/remoteproc/Kconfig          |  10 +
 drivers/remoteproc/Makefile         |   1 +
 drivers/remoteproc/tee_remoteproc.c | 451 ++++++++++++++++++++++++++++
 include/linux/remoteproc.h          |   4 +
 include/linux/tee_remoteproc.h      | 100 ++++++
 5 files changed, 566 insertions(+)
 create mode 100644 drivers/remoteproc/tee_remoteproc.c
 create mode 100644 include/linux/tee_remoteproc.h

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48845dc8fa85..6c1c07202276 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -365,6 +365,16 @@ config XLNX_R5_REMOTEPROC
 
 	  It's safe to say N if not interested in using RPU r5f cores.
 
+
+config TEE_REMOTEPROC
+	tristate "Remoteproc support by a TEE application"
+	depends on OPTEE
+	help
+	  Support a remote processor with a TEE application. The Trusted
+	  Execution Context is responsible for loading the trusted firmware
+	  image and managing the remote processor's lifecycle.
+	  This can be either built-in or a loadable module.
+
 endif # REMOTEPROC
 
 endmenu
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 91314a9b43ce..fa8daebce277 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
 obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
 obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
 obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
+obj-$(CONFIG_TEE_REMOTEPROC)		+= tee_remoteproc.o
 obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
 obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o
 obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+= xlnx_r5_remoteproc.o
diff --git a/drivers/remoteproc/tee_remoteproc.c b/drivers/remoteproc/tee_remoteproc.c
new file mode 100644
index 000000000000..9455fd9d0d2d
--- /dev/null
+++ b/drivers/remoteproc/tee_remoteproc.c
@@ -0,0 +1,451 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) STMicroelectronics 2024 - All Rights Reserved
+ * Author: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
+ */
+
+#include <linux/firmware.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/remoteproc.h>
+#include <linux/slab.h>
+#include <linux/tee_drv.h>
+#include <linux/tee_remoteproc.h>
+
+#include "remoteproc_internal.h"
+
+#define MAX_TEE_PARAM_ARRY_MEMBER	4
+
+/*
+ * Authentication of the firmware and load in the remote processor memory
+ *
+ * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
+ * [in]	 params[1].memref:	buffer containing the image of the buffer
+ */
+#define TA_RPROC_FW_CMD_LOAD_FW		1
+
+/*
+ * Start the remote processor
+ *
+ * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
+ */
+#define TA_RPROC_FW_CMD_START_FW	2
+
+/*
+ * Stop the remote processor
+ *
+ * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
+ */
+#define TA_RPROC_FW_CMD_STOP_FW		3
+
+/*
+ * Return the address of the resource table, or 0 if not found
+ * No check is done to verify that the address returned is accessible by
+ * the non secure context. If the resource table is loaded in a protected
+ * memory the access by the non secure context will lead to a data abort.
+ *
+ * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
+ * [out]  params[1].value.a:	32bit LSB resource table memory address
+ * [out]  params[1].value.b:	32bit MSB resource table memory address
+ * [out]  params[2].value.a:	32bit LSB resource table memory size
+ * [out]  params[2].value.b:	32bit MSB resource table memory size
+ */
+#define TA_RPROC_FW_CMD_GET_RSC_TABLE	4
+
+/*
+ * Return the address of the core dump
+ *
+ * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
+ * [out] params[1].memref:	address of the core dump image if exist,
+ *				else return Null
+ */
+#define TA_RPROC_FW_CMD_GET_COREDUMP	5
+
+struct tee_rproc_context {
+	struct list_head sessions;
+	struct tee_context *tee_ctx;
+	struct device *dev;
+};
+
+static struct tee_rproc_context *tee_rproc_ctx;
+
+static void tee_rproc_prepare_args(struct tee_rproc *trproc, int cmd,
+				   struct tee_ioctl_invoke_arg *arg,
+				   struct tee_param *param,
+				   unsigned int num_params)
+{
+	memset(arg, 0, sizeof(*arg));
+	memset(param, 0, MAX_TEE_PARAM_ARRY_MEMBER * sizeof(*param));
+
+	arg->func = cmd;
+	arg->session = trproc->session_id;
+	arg->num_params = num_params + 1;
+
+	param[0] = (struct tee_param) {
+		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+		.u.value.a = trproc->rproc_id,
+	};
+}
+
+int tee_rproc_load_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
+	struct tee_rproc *trproc = rproc->tee_interface;
+	struct tee_ioctl_invoke_arg arg;
+	struct tee_shm *fw_shm;
+	int ret;
+
+	if (!trproc)
+		return -EINVAL;
+
+	fw_shm = tee_shm_register_kernel_buf(tee_rproc_ctx->tee_ctx, (void *)fw->data, fw->size);
+	if (IS_ERR(fw_shm))
+		return PTR_ERR(fw_shm);
+
+	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_LOAD_FW, &arg, param, 1);
+
+	/* Provide the address of the firmware image */
+	param[1] = (struct tee_param) {
+		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
+		.u.memref = {
+			.shm = fw_shm,
+			.size = fw->size,
+			.shm_offs = 0,
+		},
+	};
+
+	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(tee_rproc_ctx->dev,
+			"TA_RPROC_FW_CMD_LOAD_FW invoke failed TEE err: %x, ret:%x\n",
+			arg.ret, ret);
+		if (!ret)
+			ret = -EIO;
+	}
+
+	tee_shm_free(fw_shm);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tee_rproc_load_fw);
+
+static int tee_rproc_get_loaded_rsc_table(struct rproc *rproc, phys_addr_t *rsc_pa,
+					  size_t *table_sz)
+{
+	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
+	struct tee_rproc *trproc = rproc->tee_interface;
+	struct tee_ioctl_invoke_arg arg;
+	int ret;
+
+	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_GET_RSC_TABLE, &arg, param, 2);
+
+	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+	param[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+
+	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(tee_rproc_ctx->dev,
+			"TA_RPROC_FW_CMD_GET_RSC_TABLE invoke failed TEE err: %x, ret:%x\n",
+			arg.ret, ret);
+		return -EIO;
+	}
+
+	*table_sz = param[2].u.value.a;
+
+	if (*table_sz)
+		*rsc_pa = param[1].u.value.a;
+	else
+		*rsc_pa  = 0;
+
+	return 0;
+}
+
+int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	phys_addr_t rsc_table;
+	void __iomem *rsc_va;
+	size_t table_sz;
+	int ret;
+
+	ret = tee_rproc_load_fw(rproc, fw);
+	if (ret)
+		return ret;
+
+	ret = tee_rproc_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
+	if (ret)
+		return ret;
+
+	/*
+	 * We assume here that the memory mapping is the same between the TEE and Linux kernel
+	 * contexts. Else a new TEE remoteproc service could be needed to get a copy of the
+	 * resource table
+	 */
+	rsc_va = ioremap_wc(rsc_table, table_sz);
+	if (IS_ERR_OR_NULL(rsc_va)) {
+		dev_err(tee_rproc_ctx->dev, "Unable to map memory region: %pa+%zx\n",
+			&rsc_table, table_sz);
+		return -ENOMEM;
+	}
+
+	/*
+	 * Create a copy of the resource table to have the same behavior as the elf loader.
+	 * This cached table will be used after the remoteproc stops to free resources, and for
+	 * crash recovery to reapply the settings.
+	 */
+	rproc->cached_table = kmemdup((__force void *)rsc_va, table_sz, GFP_KERNEL);
+	if (!rproc->cached_table) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	rproc->table_ptr = rproc->cached_table;
+	rproc->table_sz = table_sz;
+
+out:
+	iounmap(rsc_va);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tee_rproc_parse_fw);
+
+struct resource_table *tee_rproc_find_loaded_rsc_table(struct rproc *rproc,
+						       const struct firmware *fw)
+{
+	struct tee_rproc *trproc = rproc->tee_interface;
+	phys_addr_t rsc_table;
+	size_t table_sz;
+	int ret;
+
+	if (!trproc)
+		return ERR_PTR(-EINVAL);
+
+	ret = tee_rproc_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
+	if (ret)
+		return ERR_PTR(ret);
+
+	rproc->table_sz = table_sz;
+	if (!table_sz)
+		return NULL;
+
+	/*
+	 * At this step the memory area that contains the resource table should have be declared
+	 * in the remote proc platform driver and allocated by rproc_alloc_registered_carveouts().
+	 */
+
+	return (struct resource_table *)rproc_pa_to_va(rproc, rsc_table, table_sz, NULL);
+}
+EXPORT_SYMBOL_GPL(tee_rproc_find_loaded_rsc_table);
+
+int tee_rproc_start(struct rproc *rproc)
+{
+	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
+	struct tee_rproc *trproc = rproc->tee_interface;
+	struct tee_ioctl_invoke_arg arg;
+	int ret = 0;
+
+	if (!trproc)
+		return -EINVAL;
+
+	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_START_FW, &arg, param, 0);
+
+	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(tee_rproc_ctx->dev,
+			"TA_RPROC_FW_CMD_START_FW invoke failed TEE err: %x, ret:%x\n",
+			arg.ret, ret);
+		if (!ret)
+			return  -EIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tee_rproc_start);
+
+int tee_rproc_stop(struct rproc *rproc)
+{
+	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
+	struct tee_rproc *trproc = rproc->tee_interface;
+	struct tee_ioctl_invoke_arg arg;
+	int ret;
+
+	if (!trproc)
+		return -EINVAL;
+
+	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_STOP_FW, &arg, param, 0);
+
+	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(tee_rproc_ctx->dev,
+			"TA_RPROC_FW_CMD_STOP_FW invoke failed TEE err: %x, ret:%x\n",
+			arg.ret, ret);
+		if (!ret)
+			ret = -EIO;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tee_rproc_stop);
+
+static const struct tee_client_device_id stm32_tee_rproc_id_table[] = {
+	{UUID_INIT(0x80a4c275, 0x0a47, 0x4905,
+		   0x82, 0x85, 0x14, 0x86, 0xa9, 0x77, 0x1a, 0x08)},
+	{}
+};
+
+struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc, unsigned int rproc_id)
+{
+	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
+	struct tee_ioctl_open_session_arg sess_arg;
+	struct tee_client_device *tee_device;
+	struct tee_rproc *trproc, *p_err;
+	int ret;
+
+	/*
+	 * Test if the device has been probed by the TEE bus. In case of failure, we ignore the
+	 * reason. The bus could be not yet probed or the service not available in the secure
+	 * firmware.The assumption in such a case is that the TEE remoteproc is not probed.
+	 */
+	if (!tee_rproc_ctx)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	/* Prevent tee rproc module from being removed */
+	if (!try_module_get(THIS_MODULE)) {
+		dev_err(tee_rproc_ctx->dev, "can't get owner\n");
+		p_err = ERR_PTR(-ENODEV);
+		goto module_put;
+	}
+
+	trproc =  devm_kzalloc(dev, sizeof(*trproc), GFP_KERNEL);
+	if (!trproc) {
+		p_err = ERR_PTR(-ENOMEM);
+		goto module_put;
+	}
+	tee_device = to_tee_client_device(tee_rproc_ctx->dev);
+	memset(&sess_arg, 0, sizeof(sess_arg));
+
+	memcpy(sess_arg.uuid, tee_device->id.uuid.b, TEE_IOCTL_UUID_LEN);
+
+	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
+	sess_arg.num_params = 1;
+
+	param[0] = (struct tee_param) {
+		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+		.u.value.a = rproc_id,
+	};
+
+	ret = tee_client_open_session(tee_rproc_ctx->tee_ctx, &sess_arg, param);
+	if (ret < 0 || sess_arg.ret != 0) {
+		dev_err(dev, "tee_client_open_session failed, err: %x\n", sess_arg.ret);
+		p_err = ERR_PTR(-EINVAL);
+		goto module_put;
+	}
+
+	trproc->parent =  dev;
+	trproc->rproc_id = rproc_id;
+	trproc->session_id = sess_arg.session;
+
+	trproc->rproc = rproc;
+	rproc->tee_interface = trproc;
+
+	list_add_tail(&trproc->node, &tee_rproc_ctx->sessions);
+
+	return trproc;
+
+module_put:
+	module_put(THIS_MODULE);
+	return p_err;
+}
+EXPORT_SYMBOL_GPL(tee_rproc_register);
+
+int tee_rproc_unregister(struct tee_rproc *trproc)
+{
+	struct rproc *rproc = trproc->rproc;
+	int ret;
+
+	ret = tee_client_close_session(tee_rproc_ctx->tee_ctx, trproc->session_id);
+	if (ret < 0)
+		dev_err(trproc->parent,	"tee_client_close_session failed, err: %x\n", ret);
+
+	list_del(&trproc->node);
+	rproc->tee_interface = NULL;
+
+	module_put(THIS_MODULE);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tee_rproc_unregister);
+
+static int tee_rproc_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	/* Today we support only the OP-TEE, could be extend to other tees */
+	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
+}
+
+static int tee_rproc_probe(struct device *dev)
+{
+	struct tee_context *tee_ctx;
+	int ret;
+
+	/* Open context with TEE driver */
+	tee_ctx = tee_client_open_context(NULL, tee_rproc_ctx_match, NULL, NULL);
+	if (IS_ERR(tee_ctx))
+		return PTR_ERR(tee_ctx);
+
+	tee_rproc_ctx = devm_kzalloc(dev, sizeof(*tee_ctx), GFP_KERNEL);
+	if (!tee_rproc_ctx) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	tee_rproc_ctx->dev = dev;
+	tee_rproc_ctx->tee_ctx = tee_ctx;
+	INIT_LIST_HEAD(&tee_rproc_ctx->sessions);
+
+	return 0;
+err:
+	tee_client_close_context(tee_ctx);
+
+	return ret;
+}
+
+static int tee_rproc_remove(struct device *dev)
+{
+	struct tee_rproc *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &tee_rproc_ctx->sessions, node) {
+		tee_client_close_session(tee_rproc_ctx->tee_ctx, entry->session_id);
+		list_del(&entry->node);
+		kfree(entry);
+	}
+
+	tee_client_close_context(tee_rproc_ctx->tee_ctx);
+
+	return 0;
+}
+
+MODULE_DEVICE_TABLE(tee, stm32_tee_rproc_id_table);
+
+static struct tee_client_driver tee_rproc_fw_driver = {
+	.id_table	= stm32_tee_rproc_id_table,
+	.driver		= {
+		.name		= KBUILD_MODNAME,
+		.bus		= &tee_bus_type,
+		.probe		= tee_rproc_probe,
+		.remove		= tee_rproc_remove,
+	},
+};
+
+static int __init tee_rproc_fw_mod_init(void)
+{
+	return driver_register(&tee_rproc_fw_driver.driver);
+}
+
+static void __exit tee_rproc_fw_mod_exit(void)
+{
+	driver_unregister(&tee_rproc_fw_driver.driver);
+}
+
+module_init(tee_rproc_fw_mod_init);
+module_exit(tee_rproc_fw_mod_exit);
+
+MODULE_DESCRIPTION(" TEE remote processor control driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 28aa62a3b505..6168f778414f 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -505,6 +505,8 @@ enum rproc_features {
 	RPROC_MAX_FEATURES,
 };
 
+struct tee_rproc;
+
 /**
  * struct rproc - represents a physical remote processor device
  * @node: list node of this rproc object
@@ -547,6 +549,7 @@ enum rproc_features {
  * @cdev: character device of the rproc
  * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
  * @features: indicate remoteproc features
+ * @tee_interface: pointer to the remoteproc tee context
  */
 struct rproc {
 	struct list_head node;
@@ -588,6 +591,7 @@ struct rproc {
 	struct cdev cdev;
 	bool cdev_put_on_release;
 	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
+	struct tee_rproc *tee_interface;
 };
 
 /**
diff --git a/include/linux/tee_remoteproc.h b/include/linux/tee_remoteproc.h
new file mode 100644
index 000000000000..c9ae4f60e844
--- /dev/null
+++ b/include/linux/tee_remoteproc.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright(c) 2024 STMicroelectronics - All Rights Reserved
+ */
+
+#ifndef TEE_REMOTEPROC_H
+#define TEE_REMOTEPROC_H
+
+#include <linux/tee_drv.h>
+#include <linux/firmware.h>
+#include <linux/remoteproc.h>
+
+struct rproc;
+
+/**
+ * struct tee_rproc - TEE remoteproc structure
+ * @node:		Reference in list
+ * @rproc:		Remoteproc reference
+ * @parent:		Parent device
+ * @rproc_id:		Identifier of the target firmware
+ * @session_id:		TEE session identifier
+ */
+struct tee_rproc {
+	struct list_head node;
+	struct rproc *rproc;
+	struct device *parent;
+	u32 rproc_id;
+	u32 session_id;
+};
+
+#if IS_REACHABLE(CONFIG_TEE_REMOTEPROC)
+
+struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc,
+				     unsigned int rproc_id);
+int tee_rproc_unregister(struct tee_rproc *trproc);
+int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw);
+int tee_rproc_load_fw(struct rproc *rproc, const struct firmware *fw);
+struct resource_table *tee_rproc_find_loaded_rsc_table(struct rproc *rproc,
+						       const struct firmware *fw);
+int tee_rproc_start(struct rproc *rproc);
+int tee_rproc_stop(struct rproc *rproc);
+
+#else
+
+static inline struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc,
+						   unsigned int rproc_id)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+static inline int tee_rproc_unregister(struct tee_rproc *trproc)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+static inline int tee_rproc_load_fw(struct rproc *rproc,  const struct firmware *fw)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+static inline int tee_rproc_start(struct rproc *rproc)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+static inline int tee_rproc_stop(struct rproc *rproc)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+static inline struct resource_table *
+tee_rproc_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return NULL;
+}
+#endif /* CONFIG_TEE_REMOTEPROC */
+#endif /* TEE_REMOTEPROC_H */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
