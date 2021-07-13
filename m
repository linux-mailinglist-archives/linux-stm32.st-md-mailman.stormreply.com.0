Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 980B53C6DFA
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jul 2021 11:55:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F93CC597AA;
	Tue, 13 Jul 2021 09:55:05 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45378C59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 09:55:03 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id p36so9353184pfw.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 02:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gWjLrUHBiLSo33bWGjicMkKY6TK3RrLryAVl43qJWWE=;
 b=POBRJFxcN2v8dWroVk7UINXfSAA3ELwRmTDuXOb81+CzLxsSXoPd/FbwflwrRRiQFl
 skst+uvIpQYyGpOpqXKO0cGj7zLYyV7DySuxO3XV78xjnzyyakt3r2rzvt41NdiFbJWf
 HEhXFiITo50LxunLCZOY+ptk4/PF8gRaVB7V+JxgPjxjNATNWHxbKe2JeGJgeBCwa/t2
 0Q0kiH9FFLgM8VAl0MRga9BgSX7RhVHKj75vTHI1PsuZau+UDu9GwtK0zBr6VSdeJD/+
 BR+mFoHras6XRSFQ40AWlPvyCPOmYe51/OBY4OtNclGtyHMV+Ay6p9Olhwt9KWKEdF2B
 XFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gWjLrUHBiLSo33bWGjicMkKY6TK3RrLryAVl43qJWWE=;
 b=dFTSQH94zRHBzJac6eJ085hEeWNBH00aixgNO9691W/u6qFX7xn7Vlu7+DFfz9LFhM
 hyT03HmTKj7LiQ+70ny66grUT4I9FNLcqn/R2VDJFsFFA9DL/Fg+y6Qg3hHp0sMkbwwE
 OGm16MPXKCaFmoGf72q3t3LX4FDmivUkrAFofOru9hRqow9gnqHsqT0j/8H6NNqz0xz5
 hlhDcKdKJ7aEc5Sg7eU1ggEqIToVwP0+LlIt8ETmttL25MfMpZOezwuepS+bg5uZo4W4
 SD3Vk/PwyFka0OG+CWUL++ZZ7mw2d9wbcgzOsAwZZCadRo7pIv0c7nDdogdiCoez6P7S
 ejVA==
X-Gm-Message-State: AOAM532Dl4lj0fjEXDqPVblpQZqcs91aSMphLi1BCWi3M7omzMPHFC3a
 UVe/iXNcYA/1R/Hil3bgQxo=
X-Google-Smtp-Source: ABdhPJxHZ4bdBYrcOXBls+u/zUk8LYHEBtv5ijVOofd2p5c1gibDWG+URMgApG7KCLv1D0XA+tLbOg==
X-Received: by 2002:a63:1252:: with SMTP id 18mr2599232pgs.126.1626170101855; 
 Tue, 13 Jul 2021 02:55:01 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id f6sm18153854pfj.28.2021.07.13.02.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 02:55:01 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue, 13 Jul 2021 18:53:19 +0900
Message-Id: <7ec39add7db353b4e8d1c53f52b356007364ad14.1626165765.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626165764.git.vilhelm.gray@gmail.com>
References: <cover.1626165764.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v13 15/17] counter: Implement
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
 drivers/counter/counter-chrdev.c            |  6 +++
 drivers/counter/counter-sysfs.c             | 45 +++++++++++++++++++++
 include/linux/counter.h                     |  2 +
 4 files changed, 61 insertions(+)

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
diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter-chrdev.c
index d5af82d3c04b..cf94e8f1c4ea 100644
--- a/drivers/counter/counter-chrdev.c
+++ b/drivers/counter/counter-chrdev.c
@@ -3,6 +3,7 @@
  * Generic Counter character device interface
  * Copyright (C) 2020 William Breathitt Gray
  */
+#include <linux/bitops.h>
 #include <linux/cdev.h>
 #include <linux/counter.h>
 #include <linux/err.h>
@@ -336,6 +337,9 @@ static int counter_chrdev_open(struct inode *inode, struct file *filp)
 							    typeof(*counter),
 							    chrdev);
 
+	if (test_and_set_bit_lock(0, counter->chrdev_lock))
+		return -EBUSY;
+
 	get_device(&counter->dev);
 	filp->private_data = counter;
 
@@ -352,6 +356,7 @@ static int counter_chrdev_release(struct inode *inode, struct file *filp)
 		return err;
 
 	put_device(&counter->dev);
+	clear_bit_unlock(0, counter->chrdev_lock);
 
 	return 0;
 }
@@ -376,6 +381,7 @@ int counter_chrdev_add(struct counter_device *const counter)
 	mutex_init(&counter->events_lock);
 
 	/* Initialize character device */
+	clear_bit(0, counter->chrdev_lock);
 	cdev_init(&counter->chrdev, &counter_fops);
 
 	/* Allocate Counter events queue */
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
diff --git a/include/linux/counter.h b/include/linux/counter.h
index 895d60a238a9..bfd96fa1f7fe 100644
--- a/include/linux/counter.h
+++ b/include/linux/counter.h
@@ -297,6 +297,7 @@ struct counter_ops {
  * @events:		queue of detected Counter events
  * @events_wait:	wait queue to allow blocking reads of Counter events
  * @events_lock:	lock to protect Counter events queue read operations
+ * @chrdev_lock:	lock to limit chrdev to a single open at a time
  */
 struct counter_device {
 	const char *name;
@@ -323,6 +324,7 @@ struct counter_device {
 	DECLARE_KFIFO_PTR(events, struct counter_event);
 	wait_queue_head_t events_wait;
 	struct mutex events_lock;
+	DECLARE_BITMAP(chrdev_lock, 1);
 };
 
 int counter_register(struct counter_device *const counter);
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
