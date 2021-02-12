Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C058F319E0D
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 13:16:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 893A1C57B5E;
	Fri, 12 Feb 2021 12:16:01 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39C1FC57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 12:16:00 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id h8so8415852qkk.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 04:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/dq5yGecHRhOL4H/a5G1r5U6YeS+IFkmZnnpivpRxz0=;
 b=tXuGmxOXZjyIYnc4JHpPzHer/gQ/umhTIRqUuJ8cQa50uqekdJsbA3h4EjtioeGFxf
 JzwqtuRbhjg93Xn6RmJKEsnyxlyrkHHxrrQ3KqFTY/T2O2DY8j5ewbwqeCk+s+3zpwxH
 xNxCx1U3I/x3naLWre8EkQ/OBUhzEvBxw+H6FBh1qkwk1EVwxgBHk7FKb/YNSitaE6Ej
 3m0tTTFo1DhblZnvyD1mCLom3p4J8e+rikkdVJEGIYeT1vrZVN5WaerN6EK41zEHUOOd
 2ExeSBjDylw5hwCmMp/7gg0C37QwFBoEUp2jbcN/jBB2T1r1cKcP3CNwX4My6Qu3Vk3t
 4fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/dq5yGecHRhOL4H/a5G1r5U6YeS+IFkmZnnpivpRxz0=;
 b=I7Dum7WcfLgWjtl2p7mUkl2ATok+8p1hnk+xCiGgUzjG0BrgbvIKRfBhMkq3Nlk+vW
 FrTcudStZN5uUsluqXvazT3O85BMatCMPeUhwHRHgqqpNI53G5NQcWylcIr8qH5FNn6Q
 OehcqGdzpzYKOTS+7X17GxRtHTHac8ZTKmZZB0k2j6kaDpajPtVBTNfIJXc2xk6uRR2q
 g6Mf1ozFwQGSk0YIHN1BkkvOGy+0n7ZUzgT3MO140QHNiV1/NoU+36HoHG03klP5egnp
 zb5GTSs9DjDSyStqA6deq77S/XoZR6TvuTMRc/Zr3JVgUT1luuERehVO8yDtGh9Gfr2e
 VDmg==
X-Gm-Message-State: AOAM533L4VaoTZKJH4sfccj8rUNImxwqN4NJexGmD5YS899CI/5NjkKP
 VvpT/YGGFcP5Qnq/0bSLy4o=
X-Google-Smtp-Source: ABdhPJx+MOrmlkkISgi4I5vYgi3Ar2qnU+GE7hatn2Dxgegz33X0EKpQOMpBeF7PGWv4qKwzr0vY+Q==
X-Received: by 2002:a05:620a:b13:: with SMTP id
 t19mr2354370qkg.300.1613132159258; 
 Fri, 12 Feb 2021 04:15:59 -0800 (PST)
Received: from localhost.localdomain ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id y135sm6278534qkb.14.2021.02.12.04.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 04:15:58 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 12 Feb 2021 21:13:44 +0900
Message-Id: <013b2b8682ddc3c85038083e6d5567696b6254b3.1613131238.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1613131238.git.vilhelm.gray@gmail.com>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v8 20/22] counter: Implement events_queue_size
	sysfs attribute
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
 Documentation/ABI/testing/sysfs-bus-counter |  8 +++++++
 drivers/counter/counter-chrdev.c            | 23 +++++++++++++++++++
 drivers/counter/counter-chrdev.h            |  2 ++
 drivers/counter/counter-sysfs.c             | 25 +++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
index 847e96f19d19..f6cb2a8b08a7 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -212,6 +212,14 @@ Description:
 		both edges:
 			Any state transition.
 
+What:		/sys/bus/counter/devices/counterX/events_queue_size
+KernelVersion:	5.13
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
index 16f02df7f73d..53eea894e13f 100644
--- a/drivers/counter/counter-chrdev.c
+++ b/drivers/counter/counter-chrdev.c
@@ -375,6 +375,29 @@ void counter_chrdev_remove(struct counter_device *const counter)
 	cdev_del(&counter->chrdev);
 }
 
+int counter_chrdev_realloc_queue(struct counter_device *const counter,
+				 size_t queue_size)
+{
+	int err;
+	DECLARE_KFIFO_PTR(events, struct counter_event);
+	unsigned long flags;
+
+	/* Allocate new events queue */
+	err = kfifo_alloc(&events, queue_size, GFP_ATOMIC);
+	if (err)
+		return err;
+
+	raw_spin_lock_irqsave(&counter->events_list_lock, flags);
+
+	/* Swap in new events queue */
+	kfifo_free(&counter->events);
+	counter->events.kfifo = events.kfifo;
+
+	raw_spin_unlock_irqrestore(&counter->events_list_lock, flags);
+
+	return 0;
+}
+
 static int counter_get_data(struct counter_device *const counter,
 			    const struct counter_comp_node *const comp_node,
 			    u64 *const value)
diff --git a/drivers/counter/counter-chrdev.h b/drivers/counter/counter-chrdev.h
index cf5a318fe540..ff7fb0191852 100644
--- a/drivers/counter/counter-chrdev.h
+++ b/drivers/counter/counter-chrdev.h
@@ -12,5 +12,7 @@
 int counter_chrdev_add(struct counter_device *const counter,
 		       const dev_t counter_devt);
 void counter_chrdev_remove(struct counter_device *const counter);
+int counter_chrdev_realloc_queue(struct counter_device *const counter,
+				 size_t queue_size);
 
 #endif /* _COUNTER_CHRDEV_H_ */
diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-sysfs.c
index 0cb3dba950bc..9abc821a3871 100644
--- a/drivers/counter/counter-sysfs.c
+++ b/drivers/counter/counter-sysfs.c
@@ -13,6 +13,7 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
+#include "counter-chrdev.h"
 #include "counter-sysfs.h"
 
 /**
@@ -737,12 +738,30 @@ static int counter_num_counts_read(struct counter_device *counter, u8 *val)
 	return 0;
 }
 
+static int counter_events_queue_size_read(struct counter_device *counter,
+					  u64 *val)
+{
+	*val = counter->events.kfifo.mask + 1;
+	return 0;
+}
+
+static int counter_events_queue_size_write(struct counter_device *counter,
+					   u64 val)
+{
+	return counter_chrdev_realloc_queue(counter, val);
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
 				  struct counter_attribute_group *group)
 {
@@ -781,6 +800,12 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
 	if (err < 0)
 		return err;
 
+	/* Create num_counts attribute */
+	err = counter_attr_create(dev, group, &counter_events_queue_size_comp,
+				  scope, NULL);
+	if (err < 0)
+		return err;
+
 	/* Create an attribute for each extension */
 	for (i = 0; i < counter->num_ext; i++) {
 		ext = counter->ext + i;
-- 
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
