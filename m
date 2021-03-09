Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E3C3326D0
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:22:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5B97C57B79;
	Tue,  9 Mar 2021 13:22:57 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA667C57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:22:55 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id x29so8758090pgk.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ImcimOQjpteeputqyYkCfESXcyDSfWhIx0TlBJ0SRw=;
 b=LAc0lWzR/uRULa/lND2735TKI21F3MRlGyK8UcuJRlO12n+7ByhrW5gfpI0nC5h3yS
 uuqgrunCElphTAIUpY5TwSZQMGisu/YRkQTqehyNE2BS0tJzE0NEqMOh1fRWBzQVXU0T
 2bKl+pc5sXh0mx5NvSPQZZ18PW10rlr9MEoJKAh8agMJt/DrdbUnhyadvbgSKE3reVL/
 2TYOKnrh6Ottv2Fayaspay0aUJ0cvHDxRCxukrROCk+bkWmo62pY0RR1A57mx/wLRSzK
 LkPjq99tCyuEUGN2M5u4vHgZEACd7yMQW1ws94EyWSuy+Q9Cz1GLRFYfxTBtpDHw1uhc
 /rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ImcimOQjpteeputqyYkCfESXcyDSfWhIx0TlBJ0SRw=;
 b=gOyCnO4YfHiNYYAgCGF84OFp8uphH1zRrp736v9YBaLayCZjOS0uXZlsog25lf4TTY
 uGEzKlhsLB+JBzT4O5h1311j2Mxwe8YD9neQHgqoiPbjDlYiazmMGETN4eRZ4dcOb5m8
 GKHp9Jf5ykTqMlMJnXURBH5a+Zfa8ndV+fs1Ja4KQvUkvdojDVjat7ggtEN/DB5zdKkl
 WbMwH+yZPXn76lOCUHBgGAEGgwWponumHL+IjfIKUCSw9K3Tvx2L53Fr07YzaiYRHBTR
 70XtzjGKw7kUnxfT7ktW1XlLsSdgj1TPt6u46Icy2tKVTHz1FcP5mb05iR9/2KWFrh08
 lhcA==
X-Gm-Message-State: AOAM530kDAH3uOltz8aCwH+P2lW15ApqcQMZHpsk+e9SlM7Lru9kKNMJ
 qJIXhUzX6aHxgOy45cDXJKk=
X-Google-Smtp-Source: ABdhPJwj7SaGxNLQagkdbr0BSwiMgB1gz6bYJykXMSqKVnYxX8jaPJ5n/kqnnXnzgotusvslKH5/dw==
X-Received: by 2002:a65:50c8:: with SMTP id s8mr25035165pgp.68.1615296174343; 
 Tue, 09 Mar 2021 05:22:54 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:22:53 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:44 +0900
Message-Id: <57ab5e4a4b273685ba9925fe7aaa520c4ce4be29.1615293276.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 31/33] counter: Implement events_queue_size
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
 Documentation/ABI/testing/sysfs-bus-counter |  8 ++++
 drivers/counter/counter-chrdev.c            |  4 ++
 drivers/counter/counter-sysfs.c             | 44 +++++++++++++++++++++
 include/linux/counter.h                     |  2 +
 4 files changed, 58 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
index 57b051ba53a9..a97d85e97184 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -224,6 +224,14 @@ Description:
 		Read-only attribute that indicates the component ID of the
 		respective extension or Synapse.
 
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
index d5f92b2d3bb4..d9f123ca0ed6 100644
--- a/drivers/counter/counter-chrdev.c
+++ b/drivers/counter/counter-chrdev.c
@@ -311,6 +311,9 @@ static int counter_chrdev_open(struct inode *inode, struct file *filp)
 							    typeof(*counter),
 							    chrdev);
 
+	if (!mutex_trylock(&counter->chrdev_lock))
+		return -EBUSY;
+
 	get_device(&counter->dev);
 	filp->private_data = counter;
 
@@ -327,6 +330,7 @@ static int counter_chrdev_release(struct inode *inode, struct file *filp)
 		return err;
 
 	put_device(&counter->dev);
+	mutex_unlock(&counter->chrdev_lock);
 
 	return 0;
 }
diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-sysfs.c
index 7c1f79766920..7d7f6cb44ca4 100644
--- a/drivers/counter/counter-sysfs.c
+++ b/drivers/counter/counter-sysfs.c
@@ -8,7 +8,9 @@
 #include <linux/err.h>
 #include <linux/gfp.h>
 #include <linux/kernel.h>
+#include <linux/kfifo.h>
 #include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
@@ -782,12 +784,48 @@ static int counter_num_counts_read(struct counter_device *counter, u8 *val)
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
+	int err;
+	DECLARE_KFIFO_PTR(events, struct counter_event);
+
+	/* Verify chrdev is not currently being used */
+	if (!mutex_trylock(&counter->chrdev_lock))
+		return -EBUSY;
+
+	/* Allocate new events queue */
+	err = kfifo_alloc(&events, val, GFP_ATOMIC);
+	if (err)
+		return err;
+
+	/* Swap in new events queue */
+	kfifo_free(&counter->events);
+	counter->events.kfifo = events.kfifo;
+
+	mutex_unlock(&counter->chrdev_lock);
+
+	return 0;
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
@@ -826,6 +864,12 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
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
diff --git a/include/linux/counter.h b/include/linux/counter.h
index 3f0bbe4ff702..854fcaf49c32 100644
--- a/include/linux/counter.h
+++ b/include/linux/counter.h
@@ -289,6 +289,7 @@ struct counter_ops {
  * @priv:		optional private data supplied by driver
  * @dev:		internal device structure
  * @chrdev:		internal character device structure
+ * @chrdev_lock:	lock to limit chrdev to a single open at a time
  * @events_list:	list of current watching Counter events
  * @events_list_lock:	lock to protect Counter events list operations
  * @next_events_list:	list of next watching Counter events
@@ -314,6 +315,7 @@ struct counter_device {
 
 	struct device dev;
 	struct cdev chrdev;
+	struct mutex chrdev_lock;
 	struct list_head events_list;
 	spinlock_t events_list_lock;
 	struct list_head next_events_list;
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
