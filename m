Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E71D6AFF44
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22E43C6A612;
	Wed,  8 Mar 2023 07:00:28 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61A67C65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 19:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678132535; x=1709668535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oNHVpcFZrYbfI1Ngidi0XIrUh6MQDoXmEl3L94PnfHU=;
 b=hcZ5YSD2EhPztBBCcmWUMSNf6W134V2hVdfuoC7EzseEV/Wi740pkfkJ
 IH1YAS9QiumV+rKwE2nrYMf7mWpUUNkqLgfvGTWBdAPC97EtB2VSIjx/u
 daDymwEEiNoaYklykmzNPXi/IqDAj2MCbBHjjeUW0I6h7PojT3k/vhzdj
 6kZul1AJYcm+LUA+BVpjjKDqYw5ifbe1DTAMWkdpgPAX+QSaAbPHxlceR
 3488RFTOMMwSQbUBS+tQECdvYKm8ECcmstCw1dvvD9dAvX4CGqmcNWVnE
 /EOtX3ibWWtLwy0RU6Bixl+vU3rLmuhacnsklHxuCAj4tKpfkz3DeD9FD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400483859"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="400483859"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 11:55:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005549561"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="1005549561"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2023 11:55:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 57F61354; Mon,  6 Mar 2023 21:56:12 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
Date: Mon,  6 Mar 2023 21:55:42 +0200
Message-Id: <20230306195556.55475-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
References: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Mar 2023 07:00:24 +0000
Cc: Andy Shevchenko <andy@kernel.org>, Semi Malinen <semi.malinen@ge.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Nandor Han <nandor.han@ge.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [Linux-stm32] [PATCH v1 02/16] lib/string_helpers: Split out
	string_choices.h
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

Some users may only need the string choice APIs. Split
the respective header, i.e. string_choices.h. Include
it in the string_helpers.h for backward compatibility.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS                    |  1 +
 include/linux/string_choices.h | 32 ++++++++++++++++++++++++++++++++
 include/linux/string_helpers.h | 26 +-------------------------
 3 files changed, 34 insertions(+), 25 deletions(-)
 create mode 100644 include/linux/string_choices.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ee157981c4cf..64f19e200191 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8616,6 +8616,7 @@ GENERIC STRING LIBRARY
 R:	Andy Shevchenko <andy@kernel.org>
 S:	Maintained
 F:	include/linux/string.h
+F:	include/linux/string_choices.h
 F:	include/linux/string_helpers.h
 F:	lib/string.c
 F:	lib/string_helpers.c
diff --git a/include/linux/string_choices.h b/include/linux/string_choices.h
new file mode 100644
index 000000000000..b7e7b9fd098c
--- /dev/null
+++ b/include/linux/string_choices.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_STRING_CHOICES_H_
+#define _LINUX_STRING_CHOICES_H_
+
+#include <linux/types.h>
+
+static inline const char *str_enable_disable(bool v)
+{
+	return v ? "enable" : "disable";
+}
+
+static inline const char *str_enabled_disabled(bool v)
+{
+	return v ? "enabled" : "disabled";
+}
+
+static inline const char *str_read_write(bool v)
+{
+	return v ? "read" : "write";
+}
+
+static inline const char *str_on_off(bool v)
+{
+	return v ? "on" : "off";
+}
+
+static inline const char *str_yes_no(bool v)
+{
+	return v ? "yes" : "no";
+}
+
+#endif
diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index fae6beaaa217..0f2255738940 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -5,6 +5,7 @@
 #include <linux/bits.h>
 #include <linux/ctype.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 struct device;
@@ -113,29 +114,4 @@ void kfree_strarray(char **array, size_t n);
 
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n);
 
-static inline const char *str_yes_no(bool v)
-{
-	return v ? "yes" : "no";
-}
-
-static inline const char *str_on_off(bool v)
-{
-	return v ? "on" : "off";
-}
-
-static inline const char *str_enable_disable(bool v)
-{
-	return v ? "enable" : "disable";
-}
-
-static inline const char *str_enabled_disabled(bool v)
-{
-	return v ? "enabled" : "disabled";
-}
-
-static inline const char *str_read_write(bool v)
-{
-	return v ? "read" : "write";
-}
-
 #endif
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
