Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8861B3E45D2
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 14:38:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 520A2C5A4CF;
	Mon,  9 Aug 2021 12:38:52 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B5BEC5A4CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 12:38:50 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id k2so16122715plk.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Aug 2021 05:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=501FGUGr+wDXj4ObY1nsPy9qx/iYl7JAzl3fYbbvm8A=;
 b=vFk+k/wjVuJo+igVsNhV6wdTtKMuXAnR2yr+MiHGWE3fKGc3Ml+t3vhdHW0+up/KQe
 73jMtpNQmGzFUKwd6th60kFX9y49D85FMPbQ1X4CcAfYx0WEp0m101bCdLuqtMOZfVMs
 iphczO7cZNwFuUnQZJ9j2LwOnp/ONpHXTHWd/hO3t9cgC2ADZl6TBQNvA4+tqkB3apsF
 1PLej3XK5eqBA2nX9d4CrrBVqaqwiPT6eMn5Rn0n7qDAYUdE3IZ4DQlmF5pc8InuPA1Z
 uIkg2vYBf0YNm+MorP2GqQrqVFXEKWRWiK+LM77wqPeiThsbA7R2ATlJAvLA8l9/7QTO
 UAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=501FGUGr+wDXj4ObY1nsPy9qx/iYl7JAzl3fYbbvm8A=;
 b=ILeOuALXndEdTp8CMHe7DHAcPY4YBpf0BirHv7aLZuCgUdY/ouGrTdbvmlpYqm0ZNI
 W+tudrgsYuEXNshy6fuOrnbompSv5FI0ZZqPAWP7bMZ0iaXDY27yVsyJbMElKwvtYp14
 Wv4TaRirmGfB1nS8svoXQ+hwnzYNvxqsuZaIaqHQGV3bHjkBtxDIxgTjkbAxR7WERB0h
 /ori3T1x8rjSMWrWx/E8he5eE4erOpGaQp57CGm7KVnewXHGJMR8oMOIA38mMVapwHpe
 dPBUYNy0NECQmQl0r0PyeCsERrGqBRH1aTh1MhR/jaEfRkz2u3KuV6LPCJ3ANTwLhsb2
 YO7Q==
X-Gm-Message-State: AOAM530I2Pp7vw3qbQUJDPbzcnjxl0fOtV2mXCtY8PllVMNT6nr1l4dd
 7N+PbHtW5M3CHnAvG1SZh10=
X-Google-Smtp-Source: ABdhPJwQDlKYj82TU8roh5g3IqMy+LnGDP83kJy0n1ymNIJYAj/6/mFdXBp7Gt8ROA1bBpiw+lEQWw==
X-Received: by 2002:a65:63d7:: with SMTP id n23mr523128pgv.46.1628512729135;
 Mon, 09 Aug 2021 05:38:49 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id e35sm22382177pjk.28.2021.08.09.05.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 05:38:48 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Mon,  9 Aug 2021 21:37:36 +0900
Message-Id: <ca9595cfd824a2a21399b21906aacad18b5f9328.1628511445.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628511445.git.vilhelm.gray@gmail.com>
References: <cover.1628511445.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v15 11/13] counter: Implement
	events_queue_size sysfs attribute
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

The events_queue_size sysfs attribute provides a way for users to
dynamically configure the Counter events queue size for the Counter
character device interface. The size is in number of struct
counter_event data structures. The number of elements will be rounded-up
to a power of 2 due to a requirement of the kfifo_alloc function called
during reallocation of the queue.

Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 Documentation/ABI/testing/sysfs-bus-counter |  8 ++++
 drivers/counter/counter-sysfs.c             | 45 +++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
index e0e99adb0ecc..84ebb1ed28ed 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -233,6 +233,14 @@ Description:
 		shorter or equal to configured value are ignored. Value 0 means
 		filter is disabled.
 
+What:		/sys/bus/counter/devices/counterX/events_queue_size
+KernelVersion:	5.15
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Size of the Counter events queue in number of struct
+		counter_event data structures. The number of elements will be
+		rounded-up to a power of 2.
+
 What:		/sys/bus/counter/devices/counterX/name
 KernelVersion:	5.2
 Contact:	linux-iio@vger.kernel.org
diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-sysfs.c
index df1d75e0d7b8..d2d6495f73c5 100644
--- a/drivers/counter/counter-sysfs.c
+++ b/drivers/counter/counter-sysfs.c
@@ -3,11 +3,13 @@
  * Generic Counter sysfs interface
  * Copyright (C) 2020 William Breathitt Gray
  */
+#include <linux/bitops.h>
 #include <linux/counter.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gfp.h>
 #include <linux/kernel.h>
+#include <linux/kfifo.h>
 #include <linux/kstrtox.h>
 #include <linux/list.h>
 #include <linux/string.h>
@@ -785,12 +787,49 @@ static int counter_num_counts_read(struct counter_device *counter, u8 *val)
 	return 0;
 }
 
+static int counter_events_queue_size_read(struct counter_device *counter,
+					  u64 *val)
+{
+	*val = kfifo_size(&counter->events);
+	return 0;
+}
+
+static int counter_events_queue_size_write(struct counter_device *counter,
+					   u64 val)
+{
+	DECLARE_KFIFO_PTR(events, struct counter_event);
+	int err = 0;
+
+	/* Verify chrdev is not currently being used */
+	if (test_and_set_bit_lock(0, counter->chrdev_lock))
+		return -EBUSY;
+
+	/* Allocate new events queue */
+	err = kfifo_alloc(&events, val, GFP_KERNEL);
+	if (err)
+		goto exit_early;
+
+	/* Swap in new events queue */
+	kfifo_free(&counter->events);
+	counter->events.kfifo = events.kfifo;
+
+exit_early:
+	clear_bit_unlock(0, counter->chrdev_lock);
+
+	return err;
+}
+
 static struct counter_comp counter_num_signals_comp =
 	COUNTER_COMP_DEVICE_U8("num_signals", counter_num_signals_read, NULL);
 
 static struct counter_comp counter_num_counts_comp =
 	COUNTER_COMP_DEVICE_U8("num_counts", counter_num_counts_read, NULL);
 
+static struct counter_comp counter_events_queue_size_comp =
+	COUNTER_COMP_DEVICE_U64("events_queue_size",
+				counter_events_queue_size_read,
+				counter_events_queue_size_write);
+
 static int counter_sysfs_attr_add(struct counter_device *const counter,
 				  struct counter_attribute_group *cattr_group)
 {
@@ -829,6 +868,12 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
 	if (err < 0)
 		return err;
 
+	/* Create events_queue_size attribute */
+	err = counter_attr_create(dev, cattr_group,
+				  &counter_events_queue_size_comp, scope, NULL);
+	if (err < 0)
+		return err;
+
 	/* Create an attribute for each extension */
 	for (i = 0; i < counter->num_ext; i++) {
 		ext = &counter->ext[i];
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
