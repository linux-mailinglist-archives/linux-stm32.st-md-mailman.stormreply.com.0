Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AF585AE7E
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 23:35:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 634EBC6B47A;
	Mon, 19 Feb 2024 22:35:01 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6601EC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 22:34:58 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6e4351ce57aso1360627a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 14:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708382097; x=1708986897;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MLCTVGvQiuHnJPyCKcNxKRFg4bqjUrIJf0Fm+LcW4EY=;
 b=mFf+vFgBISQYSM5ZXb+LjzuFO8ezLAaNX72dsU7g86V5qFbcbv6ytehHpKlhZrg4a4
 4HzLCnGSdD+nrtHz4M5vBXsSDL7EtATCEmsKTAa2xFS3Vkz8Hik2HiMq11v/q6qbykA8
 SCaE2TkcnmaQBFiZR8YPpLevKKsBgMQLZMVUinJ9e4Wk0s3/0Vk4M9ZFQAaPUQt9+Rag
 k1CvmQEahy9HVSpVs6nKFbWoX0WBaq4aD2Aa1qFv2ZXy63IlGjZLTU+SyR2lQGvFfrbu
 matE/FaqhlMLSJU8FrYxN7XI2kj0XUir7QQ0NS5Bsz5yFom482Ejd7JI4IGjAxbykbjO
 LohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708382097; x=1708986897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLCTVGvQiuHnJPyCKcNxKRFg4bqjUrIJf0Fm+LcW4EY=;
 b=upmMhhwH95wLi3+6nMN9J635cFE4LjTPS+N+vBo0KQULoHw+gZyp7pNvZUrTkxTZPT
 FayhQMDkRv2GA+vCdqq3iUwZq8m7M9NXv4e6Flc+NbH0cQor7wLgk3pnIgxBSGfrsbEf
 MXxJueouK5DZoIjcSll62E23rzl6DRKT3eXwDcoNSqKCiUw61Fv0pLC4HNcalA+becPB
 d9/l68TwjRvX3t/QfyTtnpiwBuxPrzu6yRKPEeValeT9zx6+wEs8SJFNdEtx0NfSVGg7
 3xfkKe3qP1BTAiZeKl9GQr+6kZGWg/h8OfZUHIybI65+R9aTsbccxduafnuqfTtY0Tr6
 fQnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL+FOkVMrID93w3aiJtUJy5IhQcCQfc71rLnzYd4bf/owfdbyfJWBgpAXgXvNRTbvI59t5DMqBqItMbhD/5b8aRT/IR+zCHGdmzHp/ten92nPd6ig+8LJ9
X-Gm-Message-State: AOJu0YzzDv5/D6YvMQJRadth6S3tUIlwqFziLS1hw5+rg+njH1F4fH+0
 nxRi+GkbJ54veU47pCIMmAj2Jc8PtJGH2hQd0Shjsh9/sbilM598+wF0i2Jmf4M=
X-Google-Smtp-Source: AGHT+IHP4zUTpHEuoEmE8mkzQ+9x+MLJbxCoO4QYYH8sxBlCX0xIDb9RAyYTHoq04KPbcH/xboXfqg==
X-Received: by 2002:a9d:6a8c:0:b0:6e2:dd76:1ee0 with SMTP id
 l12-20020a9d6a8c000000b006e2dd761ee0mr12143722otq.35.1708382097231; 
 Mon, 19 Feb 2024 14:34:57 -0800 (PST)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net.
 [98.183.112.25]) by smtp.gmail.com with ESMTPSA id
 h25-20020a9d6419000000b006e45a5f0a70sm171776otl.49.2024.02.19.14.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 14:34:56 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 19 Feb 2024 16:33:18 -0600
Message-ID: <20240219-mainline-spi-precook-message-v2-1-4a762c6701b9@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-spi@vger.kernel.org, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v2 1/5] spi: add spi_optimize_message() APIs
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

This adds a new spi_optimize_message() function that can be used to
optimize SPI messages that are used more than once. Peripheral drivers
that use the same message multiple times can use this API to perform SPI
message validation and controller-specific optimizations once and then
reuse the message while avoiding the overhead of revalidating the
message on each spi_(a)sync() call.

Internally, the SPI core will also call this function for each message
if the peripheral driver did not explicitly call it. This is done to so
that controller drivers don't have to have multiple code paths for
optimized and non-optimized messages.

A hook is provided for controller drivers to perform controller-specific
optimizations.

Suggested-by: Martin Sperl <kernel@martin.sperl.org>
Link: https://lore.kernel.org/linux-spi/39DEC004-10A1-47EF-9D77-276188D2580C@martin.sperl.org/
Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v2 changes:
- Removed pre_optimized parameter from __spi_optimize_message()
- Added comment explaining purpose of pre_optimized flag
- Fixed missing doc comment for @pre_optimized
- Removed kernel doc inclusion (/** -> /*) from static members
- Removed unrelated comment about calling spi_finalize_current_message()

 drivers/spi/spi.c       | 151 ++++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/spi/spi.h |  20 +++++++
 2 files changed, 167 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index c2b10e2c75f0..f68d92b57543 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2106,6 +2106,41 @@ struct spi_message *spi_get_next_queued_message(struct spi_controller *ctlr)
 }
 EXPORT_SYMBOL_GPL(spi_get_next_queued_message);
 
+/*
+ * __spi_unoptimize_message - shared implementation of spi_unoptimize_message()
+ *                            and spi_maybe_unoptimize_message()
+ * @msg: the message to unoptimize
+ *
+ * Peripheral drivers should use spi_unoptimize_message() and callers inside
+ * core should use spi_maybe_unoptimize_message() rather than calling this
+ * function directly.
+ *
+ * It is not valid to call this on a message that is not currently optimized.
+ */
+static void __spi_unoptimize_message(struct spi_message *msg)
+{
+	struct spi_controller *ctlr = msg->spi->controller;
+
+	if (ctlr->unoptimize_message)
+		ctlr->unoptimize_message(msg);
+
+	msg->optimized = false;
+	msg->opt_state = NULL;
+}
+
+/*
+ * spi_maybe_unoptimize_message - unoptimize msg not managed by a peripheral
+ * @msg: the message to unoptimize
+ *
+ * This function is used to unoptimize a message if and only if it was
+ * optimized by the core (via spi_maybe_optimize_message()).
+ */
+static void spi_maybe_unoptimize_message(struct spi_message *msg)
+{
+	if (!msg->pre_optimized && msg->optimized)
+		__spi_unoptimize_message(msg);
+}
+
 /**
  * spi_finalize_current_message() - the current message is complete
  * @ctlr: the controller to return the message to
@@ -2153,6 +2188,8 @@ void spi_finalize_current_message(struct spi_controller *ctlr)
 
 	mesg->prepared = false;
 
+	spi_maybe_unoptimize_message(mesg);
+
 	WRITE_ONCE(ctlr->cur_msg_incomplete, false);
 	smp_mb(); /* See __spi_pump_transfer_message()... */
 	if (READ_ONCE(ctlr->cur_msg_need_completion))
@@ -4194,6 +4231,110 @@ static int __spi_validate(struct spi_device *spi, struct spi_message *message)
 	return 0;
 }
 
+/*
+ * __spi_optimize_message - shared implementation for spi_optimize_message()
+ *                          and spi_maybe_optimize_message()
+ * @spi: the device that will be used for the message
+ * @msg: the message to optimize
+ *
+ * Peripheral drivers will call spi_optimize_message() and the spi core will
+ * call spi_maybe_optimize_message() instead of calling this directly.
+ *
+ * It is not valid to call this on a message that has already been optimized.
+ *
+ * Return: zero on success, else a negative error code
+ */
+static int __spi_optimize_message(struct spi_device *spi,
+				  struct spi_message *msg)
+{
+	struct spi_controller *ctlr = spi->controller;
+	int ret;
+
+	ret = __spi_validate(spi, msg);
+	if (ret)
+		return ret;
+
+	if (ctlr->optimize_message) {
+		ret = ctlr->optimize_message(msg);
+		if (ret)
+			return ret;
+	}
+
+	msg->optimized = true;
+
+	return 0;
+}
+
+/*
+ * spi_maybe_optimize_message - optimize message if it isn't already pre-optimized
+ * @spi: the device that will be used for the message
+ * @msg: the message to optimize
+ * Return: zero on success, else a negative error code
+ */
+static int spi_maybe_optimize_message(struct spi_device *spi,
+				      struct spi_message *msg)
+{
+	if (msg->pre_optimized)
+		return 0;
+
+	return __spi_optimize_message(spi, msg);
+}
+
+/**
+ * spi_optimize_message - do any one-time validation and setup for a SPI message
+ * @spi: the device that will be used for the message
+ * @msg: the message to optimize
+ *
+ * Peripheral drivers that reuse the same message repeatedly may call this to
+ * perform as much message prep as possible once, rather than repeating it each
+ * time a message transfer is performed to improve throughput and reduce CPU
+ * usage.
+ *
+ * Once a message has been optimized, it cannot be modified with the exception
+ * of updating the contents of any xfer->tx_buf (the pointer can't be changed,
+ * only the data in the memory it points to).
+ *
+ * Calls to this function must be balanced with calls to spi_unoptimize_message()
+ * to avoid leaking resources.
+ *
+ * Context: can sleep
+ * Return: zero on success, else a negative error code
+ */
+int spi_optimize_message(struct spi_device *spi, struct spi_message *msg)
+{
+	int ret;
+
+	ret = __spi_optimize_message(spi, msg);
+	if (ret)
+		return ret;
+
+	/*
+	 * This flag indicates that the peripheral driver called spi_optimize_message()
+	 * and therefore we shouldn't unoptimize message automatically when finalizing
+	 * the message but rather wait until spi_unoptimize_message() is called
+	 * by the peripheral driver.
+	 */
+	msg->pre_optimized = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spi_optimize_message);
+
+/**
+ * spi_unoptimize_message - releases any resources allocated by spi_optimize_message()
+ * @msg: the message to unoptimize
+ *
+ * Calls to this function must be balanced with calls to spi_optimize_message().
+ *
+ * Context: can sleep
+ */
+void spi_unoptimize_message(struct spi_message *msg)
+{
+	__spi_unoptimize_message(msg);
+	msg->pre_optimized = false;
+}
+EXPORT_SYMBOL_GPL(spi_unoptimize_message);
+
 static int __spi_async(struct spi_device *spi, struct spi_message *message)
 {
 	struct spi_controller *ctlr = spi->controller;
@@ -4258,8 +4399,8 @@ int spi_async(struct spi_device *spi, struct spi_message *message)
 	int ret;
 	unsigned long flags;
 
-	ret = __spi_validate(spi, message);
-	if (ret != 0)
+	ret = spi_maybe_optimize_message(spi, message);
+	if (ret)
 		return ret;
 
 	spin_lock_irqsave(&ctlr->bus_lock_spinlock, flags);
@@ -4271,6 +4412,8 @@ int spi_async(struct spi_device *spi, struct spi_message *message)
 
 	spin_unlock_irqrestore(&ctlr->bus_lock_spinlock, flags);
 
+	spi_maybe_unoptimize_message(message);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(spi_async);
@@ -4331,8 +4474,8 @@ static int __spi_sync(struct spi_device *spi, struct spi_message *message)
 		return -ESHUTDOWN;
 	}
 
-	status = __spi_validate(spi, message);
-	if (status != 0)
+	status = spi_maybe_optimize_message(spi, message);
+	if (status)
 		return status;
 
 	SPI_STATISTICS_INCREMENT_FIELD(ctlr->pcpu_statistics, spi_sync);
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 2b8e2746769a..ddfb66dd4caf 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -475,6 +475,8 @@ extern struct spi_device *spi_new_ancillary_device(struct spi_device *spi, u8 ch
  *
  * @set_cs: set the logic level of the chip select line.  May be called
  *          from interrupt context.
+ * @optimize_message: optimize the message for reuse
+ * @unoptimize_message: release resources allocated by optimize_message
  * @prepare_message: set up the controller to transfer a single message,
  *                   for example doing DMA mapping.  Called from threaded
  *                   context.
@@ -715,6 +717,8 @@ struct spi_controller {
 	struct completion               xfer_completion;
 	size_t				max_dma_len;
 
+	int (*optimize_message)(struct spi_message *msg);
+	int (*unoptimize_message)(struct spi_message *msg);
 	int (*prepare_transfer_hardware)(struct spi_controller *ctlr);
 	int (*transfer_one_message)(struct spi_controller *ctlr,
 				    struct spi_message *mesg);
@@ -1111,6 +1115,8 @@ struct spi_transfer {
  * @spi: SPI device to which the transaction is queued
  * @is_dma_mapped: if true, the caller provided both DMA and CPU virtual
  *	addresses for each transfer buffer
+ * @pre_optimized: peripheral driver pre-optimized the message
+ * @optimized: the message is in the optimized state
  * @prepared: spi_prepare_message was called for the this message
  * @status: zero for success, else negative errno
  * @complete: called to report transaction completions
@@ -1120,6 +1126,7 @@ struct spi_transfer {
  *	successful segments
  * @queue: for use by whichever driver currently owns the message
  * @state: for use by whichever driver currently owns the message
+ * @opt_state: for use by whichever driver currently owns the message
  * @resources: for resource management when the SPI message is processed
  *
  * A @spi_message is used to execute an atomic sequence of data transfers,
@@ -1143,6 +1150,11 @@ struct spi_message {
 
 	unsigned		is_dma_mapped:1;
 
+	/* spi_optimize_message() was called for this message */
+	bool			pre_optimized;
+	/* __spi_optimize_message() was called for this message */
+	bool			optimized;
+
 	/* spi_prepare_message() was called for this message */
 	bool			prepared;
 
@@ -1172,6 +1184,11 @@ struct spi_message {
 	 */
 	struct list_head	queue;
 	void			*state;
+	/*
+	 * Optional state for use by controller driver between calls to
+	 * __spi_optimize_message() and __spi_unoptimize_message().
+	 */
+	void			*opt_state;
 
 	/* List of spi_res resources when the SPI message is processed */
 	struct list_head        resources;
@@ -1255,6 +1272,9 @@ static inline void spi_message_free(struct spi_message *m)
 	kfree(m);
 }
 
+extern int spi_optimize_message(struct spi_device *spi, struct spi_message *msg);
+extern void spi_unoptimize_message(struct spi_message *msg);
+
 extern int spi_setup(struct spi_device *spi);
 extern int spi_async(struct spi_device *spi, struct spi_message *message);
 extern int spi_slave_abort(struct spi_device *spi);

-- 
2.43.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
