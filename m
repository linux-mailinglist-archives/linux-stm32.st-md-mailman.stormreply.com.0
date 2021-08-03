Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 395C63DED8C
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Aug 2021 14:08:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F31DBC5A4D0;
	Tue,  3 Aug 2021 12:08:11 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9B79C5A4CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 12:08:09 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so3567919pjs.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Aug 2021 05:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=501FGUGr+wDXj4ObY1nsPy9qx/iYl7JAzl3fYbbvm8A=;
 b=qlb0Pg8Z2sxZpfE/7kIP6ga7BhRE5IJQlkgcnqMCeqNiCjf4m9HF2R+mjiVDr0GOC3
 5xWEtOiqQFNSWUpLJedN/vFXJju301LT1izE/p+EoP50OSZgnjQiksRe4PSMAzBssOrn
 CkW7tIDUYzkAicGr+GvST9ocGtlkiEGmx4FMXAMWXy/Ej65lMjpwnmnJKuCpUdRmAhsF
 WY5dQtpAhrCuZXVi3tiqVViSUabSxp9rTckn8BJIBDtFtnAQM1lCb33fiBQDOVqMuOCE
 yOZ3sUVbuqL1j8UVpJaqOSH0hKAY+aGHMoG4L7qmZc6QYglYBs9HFlA7TMyWDgpNj8y0
 0ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=501FGUGr+wDXj4ObY1nsPy9qx/iYl7JAzl3fYbbvm8A=;
 b=LN+g+Xwebyt2v7LEHDrItOwGxkyxlpYDtn8vL4Ck/miyN5T5YMegAzFyHYoCxokQcl
 8cOWWxf8nvR0w7O0Gf09GKuqQ4CIa1urXwFFjgOllfViaNIMjtCN4bkHEozk/lmkHfGU
 BDWZ5wJfxhnwcOwmomNSRY+zmUC7whXNiE3dfZfFaR+3k6qRyHpLSGqFS84nnOCKBGhk
 djZKiRIqQG22zutdXk37UZpgw17p11ztPi5DOV38c94Yj1plVbsiB5EY+/jj5hY6CNDm
 ShgPbcQq8JwD5zUGN21NUUzNozoToAv5IWehULzwq8/xb3ONPgpl5ZJAqV9DAU/OoaHL
 xBcw==
X-Gm-Message-State: AOAM530FPYcLbIgufTAkVTpdks9eoZm0dRsDry8p2iGgS3/h4r4fO9kJ
 amQ/gkXlhPvHCQnkWpw9Csc=
X-Google-Smtp-Source: ABdhPJxEesajGKEIQhtGzkslsvrJkluGB50it7++nhfjHg85zq2a8a0USBbxLYNfCX4E8rlKmAs3Hg==
X-Received: by 2002:a17:90a:fd10:: with SMTP id
 cv16mr4132237pjb.134.1627992488359; 
 Tue, 03 Aug 2021 05:08:08 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id n35sm7197502pfv.152.2021.08.03.05.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:08:07 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  3 Aug 2021 21:06:25 +0900
Message-Id: <f96446090ae4a671ca310a01920eaf4db70bfc84.1627990337.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1627990337.git.vilhelm.gray@gmail.com>
References: <cover.1627990337.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v14 15/17] counter: Implement
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
