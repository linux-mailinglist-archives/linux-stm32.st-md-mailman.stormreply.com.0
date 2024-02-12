Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A2285226C
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 00:27:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45546C6DD99;
	Mon, 12 Feb 2024 23:27:57 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDECCC6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 23:27:55 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-20536d5c5c7so2893581fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 15:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707780475; x=1708385275;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y5nlvb7whNQtUeaLVoTHbqmwre6mZQsRGTnIbxan8M0=;
 b=Mxe0f3DFmH4aVRHzOxq5u1vIZvfmLtKc38AS2hEHqaXgi7/29vQYFlzZhsSfz0UryP
 fxWeKaPYxvm+dt1IZ93ccTsmsu7Uvf4KtHUG1Gq1h09yDeMO3YFq5BfsFuu9d0/msABJ
 koinfUi7vMXCJRDMRmQSjTiPwP2c+nTsll01HTuKcaYHD9J57A5wNMs2m5Jy+vGC7ELx
 hXiHQFqYfJ/4jODtcITd4MVAgsJYl/OoLqTwxGXoXnGAifJ4n5mIE1T2FYENPX1B+oWT
 EiP6df4EKKeTuunbg75G3mMumiHj3erU3NZ/9DwRcM0X2DaDmr/1MXTRUrSw98oDQHme
 bIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707780475; x=1708385275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y5nlvb7whNQtUeaLVoTHbqmwre6mZQsRGTnIbxan8M0=;
 b=drzfBZi57jeyDzSovVSayebohCXfxiAlQa10kiWXA4sQ/hDPJuAtA+fwsKbSk+unfl
 peq4SEIYBVax9PnYQqcCwWpCF2BZ4v59HMg/Dgn29oaN9uSoS4m711nyKhPiAdxl9Arm
 l32b/WTMzW4FEsS+7O/D6Df5/FTyu90qEug10I3UiRTbd+Th6/61a+5ZO9iwmrciV/Xu
 pnbvXAHCwZBM6DnBuas/v1jpvJRep83YknhO50h0M8IF4nTioYWv4YItN0oxr3HtEybQ
 Z99byHdv49LfJyEA3ovvGMZDIZ8+mTBFA12k6WwG8tpxL1gkEhlKx3H3fFZAoOMlXOQb
 JFpg==
X-Gm-Message-State: AOJu0YyLykeqk5iitjPSr5oekMnDEPjxeRCTCZfARn6cS83muRQn++cG
 EpjihGxZSV+QhwBkbDQv4bG2KKjG4jsAROCeH7RI7/uQMi6R7eWF6SxXD8sFjBs=
X-Google-Smtp-Source: AGHT+IGvxMcOWZ2Dv756kXDAUlvzBSoSeQYwyeWZHoJaRDJmyJNey3V4uJB8Ovv52qzdBiAy2PaaGQ==
X-Received: by 2002:a05:6870:fb86:b0:21a:34e1:bfd3 with SMTP id
 kv6-20020a056870fb8600b0021a34e1bfd3mr7547301oab.25.1707780474781; 
 Mon, 12 Feb 2024 15:27:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVzhfZUuDWw4nNUdfIipHha2QvzEVJ76dXh2uwDGgQ+rFZOzT0PLSSkaWrB2H3bUw8a0n29HmiZAzDDSB0lhM/X5/S1OScQmG4U2gnkCboLBYHdwNUwIQTk9+8690fwmVyg1tAsEMX4cDQFTkDuOE7UNJLJdPZf779SrJwKwtsLLnq6HhsMwuV9HHlz81Re62ptX4dI5uPC1G0x3YZkgGPOU2DGQkeSEkjhN6fIR/a1GTScqced6k8YMphov6T9cfjsZPqf5L0ez1xk88FNiZbcC5jN+LKGW9lnk+8orNIDMCzU/tRBt4o5oVSLxngvZYiG0hlWfqbJfdUPau3lsnGT4GsZrDJVLsygXVR/Ogg8QyCzSHxg8BgxVuq/bpyQcp8ZpAW4iCvWiSwaw3e+1ILVtFO2TZN0tfNh75CSeNy/oZgnrvsKdlNzXmhFawU5t//LwrcguwbB13qIcxQMM3hLn1oRRdoicOlsuw1HCzyI6lksBbscW9Hnw0anWzfkZFG2ZOtAVCGCYwLMYIbjhvcAco81fmo=
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net.
 [98.183.112.25]) by smtp.gmail.com with ESMTPSA id
 pk17-20020a0568704c1100b0021a7a45e0b1sm330141oab.35.2024.02.12.15.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 15:27:54 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 12 Feb 2024 17:26:41 -0600
Message-ID: <20240212-mainline-spi-precook-message-v1-1-a2373cd72d36@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-spi@vger.kernel.org, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH 1/5] spi: add spi_optimize_message() APIs
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
 drivers/spi/spi.c       | 145 ++++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/spi/spi.h |  19 +++++++
 2 files changed, 160 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index c2b10e2c75f0..5bac215d7009 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2106,6 +2106,41 @@ struct spi_message *spi_get_next_queued_message(struct spi_controller *ctlr)
 }
 EXPORT_SYMBOL_GPL(spi_get_next_queued_message);
 
+/**
+ * __spi_unoptimize_message - shared implementation of spi_unoptimize_message()
+ *                            and spi_maybe_unoptimize_message()
+ * @msg: the message to unoptimize
+ *
+ * Periperhal drivers should use spi_unoptimize_message() and callers inside
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
+/**
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
@@ -4194,6 +4231,99 @@ static int __spi_validate(struct spi_device *spi, struct spi_message *message)
 	return 0;
 }
 
+/**
+ * __spi_optimize_message - shared implementation for spi_optimize_message()
+ *                          and spi_maybe_optimize_message()
+ * @spi: the device that will be used for the message
+ * @msg: the message to optimize
+ * @pre_optimized: whether the message is considered pre-optimized or not
+ *
+ * Peripheral drivers will call spi_optimize_message() and the spi core will
+ * call spi_maybe_optimize_message() instead of calling this directly.
+ *
+ * It is not valid to call this on a message that has already been optimized.
+ *
+ * Return: zero on success, else a negative error code
+ */
+static int __spi_optimize_message(struct spi_device *spi,
+				  struct spi_message *msg,
+				  bool pre_optimized)
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
+	msg->pre_optimized = pre_optimized;
+	msg->optimized = true;
+
+	return 0;
+}
+
+/**
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
+	return __spi_optimize_message(spi, msg, false);
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
+	return __spi_optimize_message(spi, msg, true);
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
@@ -4258,8 +4388,8 @@ int spi_async(struct spi_device *spi, struct spi_message *message)
 	int ret;
 	unsigned long flags;
 
-	ret = __spi_validate(spi, message);
-	if (ret != 0)
+	ret = spi_maybe_optimize_message(spi, message);
+	if (ret)
 		return ret;
 
 	spin_lock_irqsave(&ctlr->bus_lock_spinlock, flags);
@@ -4271,6 +4401,8 @@ int spi_async(struct spi_device *spi, struct spi_message *message)
 
 	spin_unlock_irqrestore(&ctlr->bus_lock_spinlock, flags);
 
+	spi_maybe_unoptimize_message(message);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(spi_async);
@@ -4331,10 +4463,15 @@ static int __spi_sync(struct spi_device *spi, struct spi_message *message)
 		return -ESHUTDOWN;
 	}
 
-	status = __spi_validate(spi, message);
-	if (status != 0)
+	status = spi_maybe_optimize_message(spi, message);
+	if (status)
 		return status;
 
+	/*
+	 * NB: all return paths after this point must ensure that
+	 * spi_finalize_current_message() is called to avoid leaking resources.
+	 */
+
 	SPI_STATISTICS_INCREMENT_FIELD(ctlr->pcpu_statistics, spi_sync);
 	SPI_STATISTICS_INCREMENT_FIELD(spi->pcpu_statistics, spi_sync);
 
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 2b8e2746769a..f7a269f4956b 100644
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
@@ -1111,6 +1115,7 @@ struct spi_transfer {
  * @spi: SPI device to which the transaction is queued
  * @is_dma_mapped: if true, the caller provided both DMA and CPU virtual
  *	addresses for each transfer buffer
+ * @optimized: spi_optimize_message was called for the this message
  * @prepared: spi_prepare_message was called for the this message
  * @status: zero for success, else negative errno
  * @complete: called to report transaction completions
@@ -1120,6 +1125,7 @@ struct spi_transfer {
  *	successful segments
  * @queue: for use by whichever driver currently owns the message
  * @state: for use by whichever driver currently owns the message
+ * @opt_state: for use by whichever driver currently owns the message
  * @resources: for resource management when the SPI message is processed
  *
  * A @spi_message is used to execute an atomic sequence of data transfers,
@@ -1143,6 +1149,11 @@ struct spi_message {
 
 	unsigned		is_dma_mapped:1;
 
+	/* spi_optimize_message() was called for this message */
+	bool			pre_optimized;
+	/* __spi_optimize_message() was called for this message */
+	bool			optimized;
+
 	/* spi_prepare_message() was called for this message */
 	bool			prepared;
 
@@ -1172,6 +1183,11 @@ struct spi_message {
 	 */
 	struct list_head	queue;
 	void			*state;
+	/*
+	 * Optional state for use by controller driver between calls to
+	 * spi_optimize_message() and spi_unoptimize_message().
+	 */
+	void			*opt_state;
 
 	/* List of spi_res resources when the SPI message is processed */
 	struct list_head        resources;
@@ -1255,6 +1271,9 @@ static inline void spi_message_free(struct spi_message *m)
 	kfree(m);
 }
 
+extern int spi_optimize_message(struct spi_device *spi, struct spi_message *msg);
+extern void spi_unoptimize_message(struct spi_message *msg);
+
 extern int spi_setup(struct spi_device *spi);
 extern int spi_async(struct spi_device *spi, struct spi_message *message);
 extern int spi_slave_abort(struct spi_device *spi);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
