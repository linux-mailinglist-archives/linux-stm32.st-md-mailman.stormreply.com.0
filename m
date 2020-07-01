Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B3210C19
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Jul 2020 15:25:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A751C36B2A;
	Wed,  1 Jul 2020 13:25:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6553C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2020 13:25:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061DNuk1002958; Wed, 1 Jul 2020 15:25:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=PXXZtQ5Os6lwz0ufC9ZTnIj88Nqg0GFEDPYR/vcbKrc=;
 b=P5fNiWgBtUk/WbSj8bQgj3OeJKocF17NeAtZSbCB3zJNmIzjGOzV0u0ZMGuMivSypVvF
 xOELZhF8HpVLzxi0XmHXNtUXQoogrMbxvhTikvGgd8VOCyWgMv/PfdWC5e3ps+f81xFo
 lVgnYaHtPEdJofzhw3El/NYlenDuNjTVgb/Lq84sU24NgLqkgGhhSM6Mt0Eyg+lYzSL7
 5ss0QPI6NDPvLjTXitrAs3e6C/p8MXpaJgOJMyOqnafxg1bg6dcqM0U5Qjql5NPPWwu9
 3IvbzPmh+QkF/Fpic1aYXor+dyJ2H74ibny/iHDhVM/DTsgHlOfLwVfFXecDdWiyIjye cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1j93b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 15:25:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77F8110002A;
 Wed,  1 Jul 2020 15:25:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 648DD2B6DD8;
 Wed,  1 Jul 2020 15:25:30 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul 2020 15:25:29
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <robh+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <linus.walleij@linaro.org>,
 <gregkh@linuxfoundation.org>
Date: Wed, 1 Jul 2020 15:25:20 +0200
Message-ID: <20200701132523.32533-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200701132523.32533-1-benjamin.gaignard@st.com>
References: <20200701132523.32533-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_08:2020-07-01,
 2020-07-01 signatures=0
Cc: devicetree@vger.kernel.org, tomase@xilinx.com, linux-kernel@vger.kernel.org,
 stefano.stabellini@xilinx.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 2/5] bus: stm32: Introduce firewall
	controller helpers
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

The goal of these helpers are to offer an interface for the
hardware blocks controlling bus accesses rights.

Bus firewall controllers are typically used to control if a
hardware block can perform read or write operations on bus.

Smarter firewall controllers could be able to define accesses
rights per hardware blocks to control where they can read
or write.

Firewall controller configurations are provided in device node,
parsed by the helpers and send to the driver to apply them.
Each controller may need different number and type of inputs
to configure the firewall so device-tree properties size have to
be define by using "#firewall-cells".
Firewall configurations properties have to be named "firewall-X"
on device node.
"firewall-names" keyword can also be used to give a name to
a specific configuration.

Example of device-tree:
ctrl0: firewall@0 {
	#firewall-cells = <2>;
      };

foo: foo@0 {
	firewall-names = "default", "setting1";
	firewall-0 = <&ctrl0 1 2>;
	firewall-1 = <&ctrl0 3 4>;
};

Configurations could be applied with functions like
firewall_set_config_by_index() or firewall_set_config_by_name().

firewall_set_default_config() function will apply the
configuration named "default" (if existing) or the configuration
with index 0 (i.e. firewall-0).

Drivers could register/unregister themselves be calling
firewall_register/firewall_unregister functions.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
version 4:
- use bus API

 drivers/bus/Kconfig          |   2 +
 drivers/bus/Makefile         |   2 +
 drivers/bus/stm32/Kconfig    |   3 +
 drivers/bus/stm32/Makefile   |   1 +
 drivers/bus/stm32/firewall.c | 251 +++++++++++++++++++++++++++++++++++++++++++
 drivers/bus/stm32/firewall.h |  66 ++++++++++++
 6 files changed, 325 insertions(+)
 create mode 100644 drivers/bus/stm32/Kconfig
 create mode 100644 drivers/bus/stm32/Makefile
 create mode 100644 drivers/bus/stm32/firewall.c
 create mode 100644 drivers/bus/stm32/firewall.h

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 6d4e4497b59b..843b356322d9 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -203,4 +203,6 @@ config DA8XX_MSTPRI
 source "drivers/bus/fsl-mc/Kconfig"
 source "drivers/bus/mhi/Kconfig"
 
+source "drivers/bus/stm32/Kconfig"
+
 endmenu
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 05f32cd694a4..5e0e34b10235 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -37,3 +37,5 @@ obj-$(CONFIG_DA8XX_MSTPRI)	+= da8xx-mstpri.o
 
 # MHI
 obj-$(CONFIG_MHI_BUS)		+= mhi/
+
+obj-$(CONFIG_MACH_STM32MP157) 	+= stm32/
\ No newline at end of file
diff --git a/drivers/bus/stm32/Kconfig b/drivers/bus/stm32/Kconfig
new file mode 100644
index 000000000000..57221e833e2d
--- /dev/null
+++ b/drivers/bus/stm32/Kconfig
@@ -0,0 +1,3 @@
+config FIREWALL_CONTROLLERS
+	bool "Support of bus firewall controllers"
+	depends on OF
diff --git a/drivers/bus/stm32/Makefile b/drivers/bus/stm32/Makefile
new file mode 100644
index 000000000000..eb6b978d6450
--- /dev/null
+++ b/drivers/bus/stm32/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_FIREWALL_CONTROLLERS) += firewall.o
diff --git a/drivers/bus/stm32/firewall.c b/drivers/bus/stm32/firewall.c
new file mode 100644
index 000000000000..234571b8ad11
--- /dev/null
+++ b/drivers/bus/stm32/firewall.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
+ * Author: Benjamin Gaignard <benjamin.gaignard@st.com> for STMicroelectronics.
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+
+#include "firewall.h"
+
+struct firewall_device {
+	struct device		dev;
+	struct firewall_ops	*ops;
+};
+
+struct device firewall_bus = {
+	.init_name	= "firewall",
+};
+
+static inline struct firewall_device *to_firewall_device(struct device *d)
+{
+	return container_of(d, struct firewall_device, dev);
+}
+
+static struct bus_type firewall_bus_type = {
+	.name		= "firewall",
+};
+
+static struct firewall_device *firewall_from_node(struct device_node *np)
+{
+	struct device *dev;
+
+	dev = bus_find_device_by_of_node(&firewall_bus_type, np);
+
+	return dev ? to_firewall_device(dev) : NULL;
+}
+
+/**
+ * firewall_dt_has_default
+ *
+ * Check if the device node provide firewall configuration
+ *
+ * @np: device node with possible firewall configuration
+ *
+ * Return: true is firewall-0 property exist in the device node
+ */
+static bool firewall_dt_has_default(struct device_node *np)
+{
+	struct property *prop;
+	int size;
+
+	if (!np)
+		return false;
+
+	prop = of_find_property(np, "firewall-0", &size);
+
+	return prop ? true : false;
+}
+
+/**
+ * firewall_set_config_by_index
+ *
+ * Set a firewall controller configuration based on given index.
+ *
+ * @np: device node with firewall configuration to apply.
+ * @index: the index of the configuration in device node.
+ *
+ * Return: 0 if OK, -EPROBE_DEFER if waiting for firewall controller to be
+ * registered or negative value on other errors.
+ */
+int firewall_set_config_by_index(struct device_node *np, int index)
+{
+	char *propname;
+	int configs, i, err = 0;
+
+	if (!np)
+		return 0;
+
+	propname = kasprintf(GFP_KERNEL, "firewall-%d", index);
+	configs = of_count_phandle_with_args(np, propname, "#firewall-cells");
+	if (configs < 0) {
+		err = -EINVAL;
+		goto error;
+	}
+
+	for (i = 0; i < configs; i++) {
+		struct firewall_device *firewall;
+		struct of_phandle_args args;
+
+		err = of_parse_phandle_with_args(np, propname,
+						 "#firewall-cells",
+						 i, &args);
+		if (err)
+			goto error;
+
+		/* Test if the controller is (or will be) available */
+		if (!of_device_is_available(args.np)) {
+			of_node_put(args.np);
+			continue;
+		}
+
+		firewall = firewall_from_node(args.np);
+		of_node_put(args.np);
+
+		/* Firewall is not yet registered */
+		if (!firewall) {
+			err = -EPROBE_DEFER;
+			goto error;
+		}
+
+		err = firewall->ops->set_config(&firewall->dev, &args);
+		if (err)
+			goto error;
+	}
+
+error:
+	kfree(propname);
+	return err;
+}
+EXPORT_SYMBOL_GPL(firewall_set_config_by_index);
+
+/**
+ * firewall_set_config_by_name
+ *
+ * Set a firwall controller configuration based on given name.
+ *
+ * @np: device node with firewall configuration to apply.
+ * @name: the name of the configuration in device node.
+ *
+ * Return: 0 if OK, -EPROBE_DEFER if waiting for firewall controller to be
+ * registered or negative value on other errors.
+ */
+int firewall_set_config_by_name(struct device_node *np, char *name)
+{
+	const char *configname;
+	int count, i;
+
+	count = of_property_count_strings(np, "firewall-names");
+	for (i = 0; i < count; i++) {
+		int err;
+
+		err = of_property_read_string_index(np,
+						    "firewall-names",
+						    i, &configname);
+		if (err)
+			return err;
+
+		if (strcmp(name, configname))
+			continue;
+
+		return firewall_set_config_by_index(np, i);
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(firewall_set_config_by_name);
+
+/**
+ * firewall_set_default_config
+ *
+ * Set the default configuration for device.
+ * First try to apply configuration named "default", if it fails
+ * or doesn't exist, try to apply firewall-0 configuration.
+ *
+ * @np: device node with firewall configuration to apply.
+ *
+ * Return: 0 if OK, -EPROBE_DEFER if waiting for firewall controller to be
+ * registered or negative value on other errors.
+ */
+int firewall_set_default_config(struct device_node *np)
+{
+	int ret;
+
+	/* Nothing to do if device node doesn't contain at least
+	 * one configuration
+	 */
+	if (!firewall_dt_has_default(np))
+		return 0;
+
+	ret = firewall_set_config_by_name(np, "default");
+	if (!ret || (ret == -EPROBE_DEFER))
+		return ret;
+
+	return firewall_set_config_by_index(np, 0);
+}
+EXPORT_SYMBOL_GPL(firewall_set_default_config);
+
+/**
+ * firewall_register
+ *
+ * Register a firewall controller.
+ *
+ * @np: node implementing firewall controller.
+ * @ops: firewall controller operations.
+ *
+ * Return: a pointer on the device if OK or NULL on error.
+ */
+struct device *firewall_register(struct device_node *np,
+				 struct firewall_ops *ops)
+{
+	struct firewall_device *firewall;
+
+	if (!np || !ops || !ops->set_config)
+		return NULL;
+
+	firewall = kzalloc(sizeof(*firewall), GFP_KERNEL);
+	if (!firewall)
+		return NULL;
+
+	device_initialize(&firewall->dev);
+	firewall->dev.init_name = devm_kstrdup(&firewall->dev,
+					       np->name, GFP_KERNEL);
+	firewall->dev.bus = &firewall_bus_type;
+	firewall->dev.parent = &firewall_bus;
+	firewall->dev.of_node = np;
+	firewall->ops = ops;
+
+	if (device_add(&firewall->dev)) {
+		kfree(firewall);
+		return NULL;
+	}
+
+	return &firewall->dev;
+}
+EXPORT_SYMBOL_GPL(firewall_register);
+
+static int __init firewall_init(void)
+{
+	int ret;
+
+	ret = device_register(&firewall_bus);
+	if (ret) {
+		put_device(&firewall_bus);
+		return ret;
+	}
+
+	ret = bus_register(&firewall_bus_type);
+	if (ret)
+		device_unregister(&firewall_bus);
+
+	return ret;
+}
+
+/* Init early since drivers really need to configure firewall early */
+core_initcall(firewall_init);
diff --git a/drivers/bus/stm32/firewall.h b/drivers/bus/stm32/firewall.h
new file mode 100644
index 000000000000..ea38f9f7e4ee
--- /dev/null
+++ b/drivers/bus/stm32/firewall.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
+ * Author: Benjamin Gaignard <benjamin.gaignard@st.com> for STMicroelectronics.
+ */
+
+#ifndef _FIREWALL_H_
+#define _FIREWALL_H_
+
+#include <linux/device.h>
+#include <linux/of.h>
+
+/**
+ * struct firewall_ops
+ *
+ * Firewall controller operations structure to be filled by drivers.
+ */
+struct firewall_ops {
+	/**
+	 * @set_config:
+	 *
+	 * Driver callback to set a firewall configuration on a controller.
+	 * Configuration arguments are provided in out_args parameter.
+	 *
+	 * Return: 0 on success, a negative error code on failure.
+	 */
+	int (*set_config)(struct device *dev, struct of_phandle_args *out_args);
+};
+
+#ifdef CONFIG_FIREWALL_CONTROLLERS
+
+int firewall_set_config_by_index(struct device_node *np, int index);
+int firewall_set_config_by_name(struct device_node *np, char *name);
+int firewall_set_default_config(struct device_node *np);
+
+struct device *firewall_register(struct device_node *np,
+				 struct firewall_ops *ops);
+
+#else
+
+static inline int firewall_set_config_by_index(struct device_node *np,
+					       int index)
+{
+	return 0;
+}
+
+static inline int firewall_set_config_by_name(struct device_node *np,
+					      char *name)
+{
+	return 0;
+}
+
+static inline int firewall_set_default_config(struct device_node *np)
+{
+	return 0;
+}
+
+static inline struct device *firewall_register(struct device_node *np,
+					       struct firewall_ops *ops)
+{
+	return NULL;
+}
+
+#endif
+
+#endif /* _FIREWALL_H_ */
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
