Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B451485226F
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 00:28:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CF5AC6DD97;
	Mon, 12 Feb 2024 23:28:01 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7F8AC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 23:27:58 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-219108b8e9cso1835875fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 15:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707780477; x=1708385277;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/CDnTfe6nvQ55r7IK52xXS4oQavI5ZjAWN4vgbC1X28=;
 b=s1M9NfepnKKutpqNmX6Nfk2T1tiy4KIBMI5c/g38hAbzGvMxLWcGrTbmQtS1zzC2Cm
 mLbeOy0RYhQPn82jvix2Bv48gH8jF0PWIDa1vUQK+nU2howUcWlhyP7tGbFIvtVpoPXu
 L0EFU454liPGlwbZvM+Eb15/C5koXL9B5Ory0G5+lbjUzsp8OEkgL6JKf4xOXWhhfuCa
 hRZJOZwrc2jND6AtzQvE3aJL16tksyiQfkKPZNYUa8x6wszVwEg/PJ1rhlzSNLQBc52t
 nVkIn5LZgYyGxe+TN8zCJhPctFfko36qcr+aJsLTHIZboAMuDZF9YFwM+vQsu4izvfZK
 YXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707780477; x=1708385277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/CDnTfe6nvQ55r7IK52xXS4oQavI5ZjAWN4vgbC1X28=;
 b=cMnc/C/9zHJo4kWPoDxYVCPIO+Qpj35Qo64zmQEAG4QUUhcTxywgu3JtsrqfTNau0J
 KFz8TuBHw8e8dYPm9Fbgz9KFMfg3/xqI5oWPQnddSRg9AsUG3t66ZBNDESHW5OLhRJ3A
 3sGm095NKUznSrNrM0y6Ue7vn2Jii1mWtefsklEOyWUCF9wDcFri7q242qz+0oEEN0i6
 5iX46LVI50TFOSdTNwOmG+9VyjAonsBgvUNu6VdC1bd0laTl0l8J5qruU0VCC/L/VJIT
 fcCeC30Udw0lzmjcrouokZU7/G2xYO/lqM3J9y454w7xKRTgWdPEEegtsh1J/W47w00A
 arsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNuQNacHEanfoP6x4xTdr5n/NS6aaUIezRznFPm+4E6Vma7F/nWDkWEn27CH1g7YjJyX3CUa73U4M9UAAOSQakbiEiLJIBCQ7bYPTkPDPMCtzlwSQJa35F
X-Gm-Message-State: AOJu0YxDACj4XbZZdJIMggTg8beYHvV4RSvj4wpC77CIV5UOxNVCnTsc
 0sT+qAEINjHr5L2riZLQkdFAjGsJ7G2coPlTcOyVSa7b9nhteCqiJdneSvhMoX8=
X-Google-Smtp-Source: AGHT+IFB5BMY94ESp7KJjpv5JdpAU/tpvbuYuXHw2+mNPbkI1Ukm6LHnu4zxTlzwR9ndeIJuVaW/DQ==
X-Received: by 2002:a05:6870:c98e:b0:21a:47fc:4bcf with SMTP id
 hi14-20020a056870c98e00b0021a47fc4bcfmr8244258oab.29.1707780477681; 
 Mon, 12 Feb 2024 15:27:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXmAThv/8juXzf9mfLJyIKEgmDljh/Todw+KLIUx9gxl6haVS4PiqGhAXBBBtWjETVMr9PyQP32dLRyjAN/ELx2NsQX+J2CVBwF7rElKMmqRAGrSWTy0bpITdFHUKav9sX2g1m8B0PokQONqbek1aATCqIPG/6OFwYqjxh54DYpJRslItxMr0xXT4k+OBtPQbk2PgR2SVYRDiI51YKp6Jpnm5q2He9K2KJq+ige12IGcyYJeq+AwC2gZ+pPlZijbO9dCkgHWU2QaDWASE5mDCJgc7/+NAkeTE2Sg+nxaXR8yMtF3KBGjGwDYOPJNPzy3s6rFm79s5zxIUH/Hv/qqxwC4pPjC8ta645ynQAqa3XhikPFza9zF6ALx05/XuhBaHG34Nwq3bz2U88bl5uAqU5N00yJRy4KNq3i07oDEtSGUHhtHsSZngncZ99/PaGJxD/5JnvbkC19EZftclOQobnbO8MfFWmK1ghtKjQ7vnSJQ3jQvFbx/KMC+PNXlrmxOucutnfCsfbOmFY7bhwXgoZckU2oVao=
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net.
 [98.183.112.25]) by smtp.gmail.com with ESMTPSA id
 pk17-20020a0568704c1100b0021a7a45e0b1sm330141oab.35.2024.02.12.15.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 15:27:57 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 12 Feb 2024 17:26:44 -0600
Message-ID: <20240212-mainline-spi-precook-message-v1-4-a2373cd72d36@baylibre.com>
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
Subject: [Linux-stm32] [PATCH 4/5] spi: axi-spi-engine: move message compile
	to optimize_message
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

In the AXI SPI Engine driver, compiling the message is an expensive
operation. Previously, it was done per message transfer in the
prepare_message hook. This patch moves the message compile to the
optimize_message hook so that it is only done once per message in
cases where the peripheral driver calls spi_optimize_message().

This can be a significant performance improvement for some peripherals.
For example, the ad7380 driver saw a 13% improvement in throughput
when using the AXI SPI Engine driver with this patch.

Since we now need two message states, one for the optimization stage
that doesn't change for the lifetime of the message and one that is
reset on each transfer for managing the current transfer state, the old
msg->state is split into msg->opt_state and spi_engine->msg_state. The
latter is included in the driver struct now since there is only one
current message at a time that can ever use it and it is in a hot path
so avoiding allocating a new one on each message transfer saves a few
cpu cycles and lets us get rid of the prepare_message callback.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/spi/spi-axi-spi-engine.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-axi-spi-engine.c b/drivers/spi/spi-axi-spi-engine.c
index ca66d202f0e2..6177c1a8d56e 100644
--- a/drivers/spi/spi-axi-spi-engine.c
+++ b/drivers/spi/spi-axi-spi-engine.c
@@ -109,6 +109,7 @@ struct spi_engine {
 	spinlock_t lock;
 
 	void __iomem *base;
+	struct spi_engine_message_state msg_state;
 	struct completion msg_complete;
 	unsigned int int_enable;
 };
@@ -499,17 +500,11 @@ static irqreturn_t spi_engine_irq(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static int spi_engine_prepare_message(struct spi_controller *host,
-				      struct spi_message *msg)
+static int spi_engine_optimize_message(struct spi_message *msg)
 {
 	struct spi_engine_program p_dry, *p;
-	struct spi_engine_message_state *st;
 	size_t size;
 
-	st = kzalloc(sizeof(*st), GFP_KERNEL);
-	if (!st)
-		return -ENOMEM;
-
 	spi_engine_precompile_message(msg);
 
 	p_dry.length = 0;
@@ -517,31 +512,22 @@ static int spi_engine_prepare_message(struct spi_controller *host,
 
 	size = sizeof(*p->instructions) * (p_dry.length + 1);
 	p = kzalloc(sizeof(*p) + size, GFP_KERNEL);
-	if (!p) {
-		kfree(st);
+	if (!p)
 		return -ENOMEM;
-	}
 
 	spi_engine_compile_message(msg, false, p);
 
 	spi_engine_program_add_cmd(p, false, SPI_ENGINE_CMD_SYNC(
 						AXI_SPI_ENGINE_CUR_MSG_SYNC_ID));
 
-	st->p = p;
-	st->cmd_buf = p->instructions;
-	st->cmd_length = p->length;
-	msg->state = st;
+	msg->opt_state = p;
 
 	return 0;
 }
 
-static int spi_engine_unprepare_message(struct spi_controller *host,
-					struct spi_message *msg)
+static int spi_engine_unoptimize_message(struct spi_message *msg)
 {
-	struct spi_engine_message_state *st = msg->state;
-
-	kfree(st->p);
-	kfree(st);
+	kfree(msg->opt_state);
 
 	return 0;
 }
@@ -550,10 +536,18 @@ static int spi_engine_transfer_one_message(struct spi_controller *host,
 	struct spi_message *msg)
 {
 	struct spi_engine *spi_engine = spi_controller_get_devdata(host);
-	struct spi_engine_message_state *st = msg->state;
+	struct spi_engine_message_state *st = &spi_engine->msg_state;
+	struct spi_engine_program *p = msg->opt_state;
 	unsigned int int_enable = 0;
 	unsigned long flags;
 
+	/* reinitialize message state for this transfer */
+	memset(st, 0, sizeof(*st));
+	st->p = p;
+	st->cmd_buf = p->instructions;
+	st->cmd_length = p->length;
+	msg->state = st;
+
 	reinit_completion(&spi_engine->msg_complete);
 
 	spin_lock_irqsave(&spi_engine->lock, flags);
@@ -658,8 +652,8 @@ static int spi_engine_probe(struct platform_device *pdev)
 	host->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 32);
 	host->max_speed_hz = clk_get_rate(spi_engine->ref_clk) / 2;
 	host->transfer_one_message = spi_engine_transfer_one_message;
-	host->prepare_message = spi_engine_prepare_message;
-	host->unprepare_message = spi_engine_unprepare_message;
+	host->optimize_message = spi_engine_optimize_message;
+	host->unoptimize_message = spi_engine_unoptimize_message;
 	host->num_chipselect = 8;
 
 	if (host->max_speed_hz == 0)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
