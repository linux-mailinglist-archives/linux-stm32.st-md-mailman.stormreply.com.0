Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 040983326BB
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:22:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C147EC57B78;
	Tue,  9 Mar 2021 13:22:26 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53884C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:22:24 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id y13so6010691pfr.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jtnafmPIEm/uciDz91Y90561rS0hqXgRCMM9b1KyMxI=;
 b=hm1K7gbeZ4zkZ3VpuaV5XXFT1+qMm+LLu2X2wNAQNYhVlW4p/KCUkFQogQc9yYsLmg
 D2iCzYeoQHJAmHgUAtWsr+jIBKsL8LTFWXRgDmroQeInG1PRLKKlTTxIT1Tzd2kaTuw/
 X/ugI1Erldi4aOrE2Z10M11hlQcTfVaCffGHhSwFxTY+aizrMGq2xHi/jdl7vgeDBsiV
 leYifI2NoDdzHkF6mcOKRcMPnm+9hZUodm0Uw3RT+wYwZfAzrBS8JGEEb4PjcaxajG7n
 1OAhZPECwgw8lcWEhVPwjoCKfmY/E6DoZWiNbnGODyTjF3QDVRUELzAAStMhYyRXhmQN
 0h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jtnafmPIEm/uciDz91Y90561rS0hqXgRCMM9b1KyMxI=;
 b=loovw81bnXDMhMBW1dnXhVUmaVB0D8ejSTgFEcADXJKyJrHgwCwdmRyn//Clp9POJv
 YP627k6SX2zng5YewLuD5nVk0XEw3QobbXDmZwEzHw+4N7i+phgjVukhrANMBPgQ1OMl
 5k2QSXxLzOJQd3mX/17D7Qq8SNhZ2ZfDHS6jVIbjwhSAZ5nWWugsAYxPKMYho+Sm/GBa
 yQXtN3oJnpVJYEEu3l1H9QtM71fw6AmReCCwazRqLcupaWvypwPk2VInB6opNa7FqoBK
 qTlBaZr0VpdC4DUDWSmgrXTvmGFYA9oYI6cVzqELmkzhYb2CdPBH/bjq6pKoCEvCEqUI
 PsPw==
X-Gm-Message-State: AOAM531m5QeOW0dB3LTYsi9IaYxbbBejJNvob7MP2kvP3aOKwBtzkPEV
 85tm6x/zbo6aXHYvbbUJHsg=
X-Google-Smtp-Source: ABdhPJzje+jktfJMmynWKmgW9FgFg+J2/kZcAFyYOfDhvG55M+0C0LOdPRjRE6WaIdu37SpCZCBYiA==
X-Received: by 2002:a63:fb18:: with SMTP id o24mr24474588pgh.55.1615296142824; 
 Tue, 09 Mar 2021 05:22:22 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:22:22 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:38 +0900
Message-Id: <ff1c4bb1556a0cb4b9e693dc0c0ba1c49a08394d.1615293276.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1615293276.git.vilhelm.gray@gmail.com>
References: <cover.1615293276.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v9 25/33] counter: Move counter enums to uapi
	header
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

This is in preparation for a subsequent patch implementing a character
device interface for the Counter subsystem.

Reviewed-by: David Lechner <david@lechnology.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 MAINTAINERS                  |  1 +
 include/linux/counter.h      | 42 +--------------------------
 include/uapi/linux/counter.h | 56 ++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 41 deletions(-)
 create mode 100644 include/uapi/linux/counter.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 1508db256784..93233a07f5aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4581,6 +4581,7 @@ F:	Documentation/ABI/testing/sysfs-bus-counter
 F:	Documentation/driver-api/generic-counter.rst
 F:	drivers/counter/
 F:	include/linux/counter.h
+F:	include/uapi/linux/counter.h
 
 CPMAC ETHERNET DRIVER
 M:	Florian Fainelli <f.fainelli@gmail.com>
diff --git a/include/linux/counter.h b/include/linux/counter.h
index e7fd6d81a929..eee85db8e332 100644
--- a/include/linux/counter.h
+++ b/include/linux/counter.h
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
+#include <uapi/linux/counter.h>
 
 struct counter_device;
 struct counter_count;
@@ -27,47 +28,6 @@ enum counter_comp_type {
 	COUNTER_COMP_COUNT_MODE,
 };
 
-enum counter_scope {
-	COUNTER_SCOPE_DEVICE,
-	COUNTER_SCOPE_SIGNAL,
-	COUNTER_SCOPE_COUNT,
-};
-
-enum counter_count_direction {
-	COUNTER_COUNT_DIRECTION_FORWARD,
-	COUNTER_COUNT_DIRECTION_BACKWARD,
-};
-
-enum counter_count_mode {
-	COUNTER_COUNT_MODE_NORMAL,
-	COUNTER_COUNT_MODE_RANGE_LIMIT,
-	COUNTER_COUNT_MODE_NON_RECYCLE,
-	COUNTER_COUNT_MODE_MODULO_N,
-};
-
-enum counter_function {
-	COUNTER_FUNCTION_INCREASE,
-	COUNTER_FUNCTION_DECREASE,
-	COUNTER_FUNCTION_PULSE_DIRECTION,
-	COUNTER_FUNCTION_QUADRATURE_X1_A,
-	COUNTER_FUNCTION_QUADRATURE_X1_B,
-	COUNTER_FUNCTION_QUADRATURE_X2_A,
-	COUNTER_FUNCTION_QUADRATURE_X2_B,
-	COUNTER_FUNCTION_QUADRATURE_X4,
-};
-
-enum counter_signal_level {
-	COUNTER_SIGNAL_LEVEL_LOW,
-	COUNTER_SIGNAL_LEVEL_HIGH,
-};
-
-enum counter_synapse_action {
-	COUNTER_SYNAPSE_ACTION_NONE,
-	COUNTER_SYNAPSE_ACTION_RISING_EDGE,
-	COUNTER_SYNAPSE_ACTION_FALLING_EDGE,
-	COUNTER_SYNAPSE_ACTION_BOTH_EDGES,
-};
-
 /**
  * struct counter_comp - Counter component node
  * @type:		Counter component data type
diff --git a/include/uapi/linux/counter.h b/include/uapi/linux/counter.h
new file mode 100644
index 000000000000..6113938a6044
--- /dev/null
+++ b/include/uapi/linux/counter.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Userspace ABI for Counter character devices
+ * Copyright (C) 2020 William Breathitt Gray
+ */
+#ifndef _UAPI_COUNTER_H_
+#define _UAPI_COUNTER_H_
+
+/* Component scope definitions */
+enum counter_scope {
+	COUNTER_SCOPE_DEVICE,
+	COUNTER_SCOPE_SIGNAL,
+	COUNTER_SCOPE_COUNT,
+};
+
+/* Count direction values */
+enum counter_count_direction {
+	COUNTER_COUNT_DIRECTION_FORWARD,
+	COUNTER_COUNT_DIRECTION_BACKWARD,
+};
+
+/* Count mode values */
+enum counter_count_mode {
+	COUNTER_COUNT_MODE_NORMAL,
+	COUNTER_COUNT_MODE_RANGE_LIMIT,
+	COUNTER_COUNT_MODE_NON_RECYCLE,
+	COUNTER_COUNT_MODE_MODULO_N,
+};
+
+/* Count function values */
+enum counter_function {
+	COUNTER_FUNCTION_INCREASE,
+	COUNTER_FUNCTION_DECREASE,
+	COUNTER_FUNCTION_PULSE_DIRECTION,
+	COUNTER_FUNCTION_QUADRATURE_X1_A,
+	COUNTER_FUNCTION_QUADRATURE_X1_B,
+	COUNTER_FUNCTION_QUADRATURE_X2_A,
+	COUNTER_FUNCTION_QUADRATURE_X2_B,
+	COUNTER_FUNCTION_QUADRATURE_X4,
+};
+
+/* Signal values */
+enum counter_signal_level {
+	COUNTER_SIGNAL_LEVEL_LOW,
+	COUNTER_SIGNAL_LEVEL_HIGH,
+};
+
+/* Action mode values */
+enum counter_synapse_action {
+	COUNTER_SYNAPSE_ACTION_NONE,
+	COUNTER_SYNAPSE_ACTION_RISING_EDGE,
+	COUNTER_SYNAPSE_ACTION_FALLING_EDGE,
+	COUNTER_SYNAPSE_ACTION_BOTH_EDGES,
+};
+
+#endif /* _UAPI_COUNTER_H_ */
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
