Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPbOAvVOkmlvswEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Feb 2026 23:55:49 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C8F13FFED
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Feb 2026 23:55:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 680C2C8F270;
	Sun, 15 Feb 2026 22:55:48 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20729C8F26F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Feb 2026 22:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=f63y7Wq2UjRJwaDurNk5EkD4fofDVgyaXt3x3vGItDA=; b=HsL6Kb
 oidDyjlA5DER1h1Z56zGsiZ/6NJLRuwIOww7Dc6aGPZWz6LWUs4qR7Ys/ezJMn91
 LiRJy4XDaPgHdGPCBkTF8zxI60/6w9E1c8KV4vAM6ep0Z2g27S3Gdv4QXkF3HhjU
 MCtmVaUdAu7r6PaRVvEE3/iTa4ziWloP4eokLNJ1F6ThkzxMVP6E2N/i/rKVzCzj
 /h50Zx+lD9zECGJZ72Kb1uva6TqLRW8kEyp+PWv7suKzg2y5AIj6wCHQ4pxvdEkX
 0B0rSikBDybvLhXumFb77OHI7nw1EbK72/QF+y51mCKDBulQmr532oTNREZNgD76
 oX10FSLJEvNERQew==
Received: (qmail 3011809 invoked from network); 15 Feb 2026 23:55:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 15 Feb 2026 23:55:22 +0100
X-UD-Smtp-Session: l3s3148p1@V3+qu+RKdOUujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Date: Sun, 15 Feb 2026 23:54:53 +0100
Message-ID: <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>,
 linux-remoteproc@vger.kernel.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Waiman Long <longman@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 driver-core@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Orson Zhai <orsonzhai@gmail.com>,
 David Lechner <dlechner@baylibre.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [RFC PATCH v2 13/13] hwspinlock: refactor consumer.h
	from public header
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:rafael@kernel.org,m:peterz@infradead.org,m:boqun@kernel.org,m:linux-remoteproc@vger.kernel.org,m:nuno.sa@analog.com,m:wsa+renesas@sang-engineering.com,m:longman@redhat.com,m:dakr@kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:driver-core@lists.linux.dev,m:andriy.shevchenko@intel.com,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:linux-iio@vger.kernel.org,m:mingo@redhat.com,m:orsonzhai@gmail.com,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:srini@kernel.org,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:broonie@kernel.org,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-doc@vger.kernel.org,m:linux-spi@vger.kernel.org,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:linusw@kernel.org,m:jic23@kernel.org,m:wsa@sang-engineering
 .com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,vger.kernel.org,analog.com,sang-engineering.com,redhat.com,st-md-mailman.stormreply.com,lists.linux.dev,intel.com,lwn.net,gmail.com,baylibre.com,arndb.de,linux.alibaba.com,linuxfoundation.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,sang-engineering.com:mid,sang-engineering.com:email,wizery.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: A3C8F13FFED
X-Rspamd-Action: no action

Factor out the entries only needed for consumers from the generic public
header. This allows for a clean separation between providers and
consumers.

FIXME: separate driver changes?

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
index f9131b8cd5d2..8141a8a5ea01 100644
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
index 4231e9d4b8ff..3f4c254e8ac7 100644
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
index e5d5def594f6..49473669e84e 100644
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
