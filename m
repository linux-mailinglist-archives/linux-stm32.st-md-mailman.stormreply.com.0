Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C41233F9317
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Aug 2021 05:49:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AC90C5A4D6;
	Fri, 27 Aug 2021 03:49:20 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43B71C5A4D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Aug 2021 03:49:18 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id e15so3099705plh.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Aug 2021 20:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tqQ1m9HdH9arCV4uY9wOlyOVXDQIIQIgjKnHJp9wmXU=;
 b=txUHC1vNQrWNqVLuOBkHbSKiZKi+il3a+S1OM9AJX++d9b14Fm9ecn744EsI4rC9Zc
 NdXFpb0aHg/bDSr3UEoaqBjtEeIXuadwmzGghj7xQDv2IkqMo6CNWxA6XkCIDSJ6sVMw
 hwH4ho1/Sw+zZfAp99MZqUKMdFuHJZzSMaOXatEng9DMCBbLdXjDhQEN0l4+U0EaFViJ
 yDMKV1yXGO3U8HNjE8+TSVhRbhoJ+6badBYCWOXE78p8IbXvjEfviycqbYzGyADQ57e5
 UpPtaBrInlvhUStBMspC9Yxa/Zb2N88L5/cjQNzENC6IsOraYulzuatUuiG9g3jJBwu5
 SC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tqQ1m9HdH9arCV4uY9wOlyOVXDQIIQIgjKnHJp9wmXU=;
 b=psdnjzqsYtZdjbv0538O0qJFOFtEEhY+BMX9XYabwXTh7DeYG33Z/U4fsCZEbSP2VH
 EXq2WqDnOmmHA2p4STCSVpkmL9P8FN7apiTjOvV6L/37U3qEmhb7WDPUoQzXPPWcBE9A
 HKASuObTTe+uAyU7cYXNRPurZQBVOmKJ37UoFLaV+iNlDZN7GfC0XSxuacd+lMAy/mLs
 3pNCsI6nF1uKCoQgfyhF2geURVYSQ8+y8Kz3vTRJnEP494rpR+IQmKi2q1HwtX3I6Ffu
 HzxBIjK5y0Cripw7jxTKzsNpcAYmLj2F1jY8silH7lgwSlEp3BQTNrL9d+hel223OOob
 gL8Q==
X-Gm-Message-State: AOAM530Yo7LJ1z8jlmAAUNTGtUVLaBQCTF9L0QVJLHtKnxpLzBaMEYWe
 REl1dXhz5ydTM7bT/vCu4fM=
X-Google-Smtp-Source: ABdhPJxBuwCeddVngu1e63yCxRiOTjEB3+68raG/qEUTpKgu+BU8zBCL+2yIC1xJy3ENQ6PU+N4TGg==
X-Received: by 2002:a17:902:6b84:b029:ee:f966:1911 with SMTP id
 p4-20020a1709026b84b02900eef9661911mr6723009plk.69.1630036156992; 
 Thu, 26 Aug 2021 20:49:16 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id o6sm4364693pjk.4.2021.08.26.20.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 20:49:16 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 27 Aug 2021 12:47:56 +0900
Message-Id: <b159f45c8f9dd383e44cdd5629573f28895bea47.1630031207.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1630031207.git.vilhelm.gray@gmail.com>
References: <cover.1630031207.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v16 12/14] counter: Implement
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
index 0ce16669157e..06c2b3e27e0b 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -233,6 +233,14 @@ Description:
 		shorter or equal to configured value are ignored. Value 0 means
 		filter is disabled.
 
+What:		/sys/bus/counter/devices/counterX/events_queue_size
+KernelVersion:	5.16
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
index 97d8d7c2a2b6..b90f404b1fa1 100644
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
@@ -783,12 +785,49 @@ static int counter_num_counts_read(struct counter_device *counter, u8 *val)
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
@@ -827,6 +866,12 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
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
