Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDSrNzo3p2mUfwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 20:32:10 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A14C91F605C
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 20:32:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C32EC87ECE;
	Tue,  3 Mar 2026 19:32:10 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7D2FC87ECC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2026 19:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=j/Bo7yrFMAchCRfI3p9FgYu/8TRsrIClVI/vqJrM62s=; b=cw10SY
 VSDDBIMncjsw9I85vcm2bgHLq7GMJJRqXG4XOCLpKthxayrGp0paHslau+AHGd1s
 dR41SlnooKWBRS8WQoeERXhsFMeKBFnUJHbpmo0xuvwX11+tn20s+k0HMLsgSdLY
 xjO7f7YY6NifLL67g3Pa2rMyTfIz/05/F4/m0Sa53CMoMzd260GMPJQiALXfCYOb
 aTFMxQa0XV8IO7FniitASuMiiUYnduYueiKjggYfTq83Ux53lIZcymTfSxrbz1bO
 Rk6viyJBLq9nz++IZTB+sXzV85siip/fIdJy0H5nZjq5esig8X24Hlkx9QtEe41R
 eAsC59fy2I51GD0A==
Received: (qmail 430895 invoked from network); 3 Mar 2026 20:31:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 3 Mar 2026 20:31:43 +0100
X-UD-Smtp-Session: l3s3148p1@/BzYwCNMXKgujnu+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Date: Tue,  3 Mar 2026 20:26:07 +0100
Message-ID: <20260303192600.7224-32-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 linux-remoteproc@vger.kernel.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Waiman Long <longman@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 driver-core@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-iio@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Orson Zhai <orsonzhai@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v3 15/15] hwspinlock/treewide: refactor
	consumer.h from public header
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
X-Rspamd-Queue-Id: A14C91F605C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:rafael@kernel.org,m:peterz@infradead.org,m:boqun@kernel.org,m:jonathan.cameron@huawei.com,m:linux-remoteproc@vger.kernel.org,m:nuno.sa@analog.com,m:wsa+renesas@sang-engineering.com,m:longman@redhat.com,m:dakr@kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:driver-core@lists.linux.dev,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:linux-iio@vger.kernel.org,m:mingo@redhat.com,m:orsonzhai@gmail.com,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:srini@kernel.org,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:broonie@kernel.org,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:linusw@kernel.org,m:jic23@ke
 rnel.org,m:wsa@sang-engineering.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[39];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.960];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,huawei.com,vger.kernel.org,analog.com,sang-engineering.com,redhat.com,st-md-mailman.stormreply.com,lists.linux.dev,lwn.net,gmail.com,baylibre.com,arndb.de,linux.alibaba.com,linuxfoundation.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,ti.com:url,stormreply.com:url,stormreply.com:email,wizery.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,intel.com:email,huawei.com:email,sang-engineering.com:mid,sang-engineering.com:email]
X-Rspamd-Action: no action

Factor out the entries only needed for consumers from the generic public
header. This allows for a clean separation between providers and
consumers. Also remove contact field in favor of MAINTAINERS entries.
Fix the users, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com> # for IIO
---
 Documentation/locking/hwspinlock.rst              |  2 +-
 MAINTAINERS                                       |  1 -
 drivers/base/regmap/regmap.c                      |  2 +-
 drivers/hwspinlock/hwspinlock_core.c              |  2 +-
 drivers/iio/adc/sc27xx_adc.c                      |  2 +-
 drivers/irqchip/irq-stm32mp-exti.c                |  2 +-
 drivers/mfd/syscon.c                              |  2 +-
 drivers/nvmem/sc27xx-efuse.c                      |  2 +-
 drivers/nvmem/sprd-efuse.c                        |  2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c             |  2 +-
 drivers/soc/qcom/smem.c                           |  2 +-
 drivers/spi/spi-sprd-adi.c                        |  2 +-
 .../linux/{hwspinlock.h => hwspinlock/consumer.h} | 15 ++++++---------
 13 files changed, 17 insertions(+), 21 deletions(-)
 rename include/linux/{hwspinlock.h => hwspinlock/consumer.h} (98%)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index a737c702a7d1..001bcab86690 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -306,7 +306,7 @@ Typical usage
 
 ::
 
-	#include <linux/hwspinlock.h>
+	#include <linux/hwspinlock/consumer.h>
 	#include <linux/err.h>
 
 	int hwspinlock_example(void)
diff --git a/MAINTAINERS b/MAINTAINERS
index 4e95cbb48dd8..e1acfc1d6656 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11216,7 +11216,6 @@ F:	Documentation/devicetree/bindings/hwlock/
 F:	Documentation/locking/hwspinlock.rst
 F:	drivers/hwspinlock/
 F:	include/linux/hwspinlock/
-F:	include/linux/hwspinlock.h
 
 HARDWARE TRACING FACILITIES
 M:	Alexander Shishkin <alexander.shishkin@linux.intel.com>
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 607c1246d994..d25494495469 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -16,7 +16,7 @@
 #include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/log2.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/unaligned.h>
 
 #define CREATE_TRACE_POINTS
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 6c8a03deb00c..e78ec4b5cfa3 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -12,7 +12,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/hwspinlock/provider.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
diff --git a/drivers/iio/adc/sc27xx_adc.c b/drivers/iio/adc/sc27xx_adc.c
index 6209499c5c37..8a881d63b7dd 100644
--- a/drivers/iio/adc/sc27xx_adc.c
+++ b/drivers/iio/adc/sc27xx_adc.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2018 Spreadtrum Communications Inc.
 
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/iio/iio.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm32mp-exti.c
index a24f4f1a4f8f..25d5aa67728a 100644
--- a/drivers/irqchip/irq-stm32mp-exti.c
+++ b/drivers/irqchip/irq-stm32mp-exti.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 21a7fcdd2737..8ec74f8513d7 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -11,7 +11,7 @@
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
diff --git a/drivers/nvmem/sc27xx-efuse.c b/drivers/nvmem/sc27xx-efuse.c
index 4e2ffefac96c..309090cd4ff0 100644
--- a/drivers/nvmem/sc27xx-efuse.c
+++ b/drivers/nvmem/sc27xx-efuse.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2018 Spreadtrum Communications Inc.
 
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
index 1a7e4e5d8b86..92e3092719ba 100644
--- a/drivers/nvmem/sprd-efuse.c
+++ b/drivers/nvmem/sprd-efuse.c
@@ -3,7 +3,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 6a99708a5a23..17b2072d609e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -10,7 +10,7 @@
 #include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/gpio/driver.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index d5c94b47f431..6d574d65b4a3 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
  */
 
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
diff --git a/drivers/spi/spi-sprd-adi.c b/drivers/spi/spi-sprd-adi.c
index e7d83c16b46c..04313e4a63dd 100644
--- a/drivers/spi/spi-sprd-adi.c
+++ b/drivers/spi/spi-sprd-adi.c
@@ -5,7 +5,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock/consumer.h
similarity index 98%
rename from include/linux/hwspinlock.h
rename to include/linux/hwspinlock/consumer.h
index 4fe1c8831cd1..f476222ec924 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock/consumer.h
@@ -1,17 +1,16 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Hardware spinlock public header
+ * Hardware spinlock public header for consumers
  *
  * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
- *
- * Contact: Ohad Ben-Cohen <ohad@wizery.com>
+ * Copyright (C) 2026 Sang Engineering
+ * Copyright (C) 2026 Renesas Solutions Corp.
  */
 
-#ifndef __LINUX_HWSPINLOCK_H
-#define __LINUX_HWSPINLOCK_H
+#ifndef __LINUX_HWSPINLOCK_CONSUMER_H
+#define __LINUX_HWSPINLOCK_CONSUMER_H
 
 #include <linux/err.h>
-#include <linux/sched.h>
 
 /* hwspinlock mode argument */
 #define HWLOCK_IRQSTATE		0x01 /* Disable interrupts, save state */
@@ -22,8 +21,6 @@
 struct device;
 struct device_node;
 struct hwspinlock;
-struct hwspinlock_device;
-struct hwspinlock_ops;
 
 #ifdef CONFIG_HWSPINLOCK
 
@@ -403,4 +400,4 @@ static inline void hwspin_unlock(struct hwspinlock *hwlock)
 	__hwspin_unlock(hwlock, 0, NULL);
 }
 
-#endif /* __LINUX_HWSPINLOCK_H */
+#endif /* __LINUX_HWSPINLOCK_CONSUMER_H */
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
