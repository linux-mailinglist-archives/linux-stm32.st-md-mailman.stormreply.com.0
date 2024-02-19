Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D32DB85AE80
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 23:35:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78D9DC6C83D;
	Mon, 19 Feb 2024 22:35:01 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F360C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 22:35:00 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6e2df9e9074so1600758a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 14:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708382099; x=1708986899;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aiEnyHrsiH+BHrvR4qpLSBhsawzqJKIHbW1KRtu4mJg=;
 b=Z0d9T2f5cuXZ8c+Oj+MCKbpiiNsqXBNiElebtxXTIDl7QbbutgyCinz2OK53YUqJt+
 frNHhmEUdXJ5//z91BxBXiB1CJrzKZ9OFtuI9x8DOSHv8UeiMbPr+GgpIZ1vrUIiSVNP
 sS7bGLr5K/9mlfTyPFk1U9p+nfkyM0vwetNIGkcgGHCwyK4JbJju1tNuqM9+Fj36mWZX
 fp4MMMRSkhNuVIKfe/8jwEKj+Ajnoxe8FmnBYIqtV396OB+xczJErjPtT6/TRAk6Vp+n
 gWxDKfoE7XL/wJAQWdp+EaMdkWEV4tFQYNtpE5Oqw43oNz/Fjo90cXm4Mp5XdF4YHU2p
 kzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708382099; x=1708986899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aiEnyHrsiH+BHrvR4qpLSBhsawzqJKIHbW1KRtu4mJg=;
 b=CS3IVlYAB7esm2RpnioUJnPHzNSQpCcY9tZ4LCyJFJnRC7u8w9aampZ8Xt+0ITVDQh
 yZbhQv5rsBWKZk6ugBEIYNc+mAliEyB32OVACiZAAByOEHat1D7Rmp2aVjJHNAe/H+xI
 tSKN8LF3s6st2pCvIcADWex02epZH3r+UUmFsVCqrYJ2vB5ol7BlwGMh6mRijWrDcpbK
 AaiZME+gXs27tzakA2CCeHB1MCgbffAeWCJcvB7lDY9X25aJAUuRUcWvMrinB+Q97Ie7
 tbllGpCnU99g/Y9aSMvL8OrDsgtBeGd2HW9b5fUg3MLF90cnNjhH1mlwZAS3Y5C2lTx6
 cctg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVVsbjpBGyuq20OJvWUCHLodrGJY+KKTozRVnHC6S6iQn90u1iFhkr2bbuHqUxpX59W3IhT33mmgC/ONJMh5ylc8R80U9SOOxXeAwG5I9svPDXY6i7k0s1
X-Gm-Message-State: AOJu0YxvAsqAvaqWmqISCApdj6OZC9PmkoZT9tIGs8UrvUEaq6grt5YU
 upPkU/t6mgYlZVkdTx427z8D6nORmNRPnDtKY0HQR7KeYUX6d4ZGAH8Pv+ls7Fs=
X-Google-Smtp-Source: AGHT+IHGLW0jWfaSjhHMOVF9xvUXiSSL99uSISV2aKB6gkc+n1TPuLNFLEUSx9bHBGaXBwNUybqK9g==
X-Received: by 2002:a9d:7a97:0:b0:6e2:d93f:376 with SMTP id
 l23-20020a9d7a97000000b006e2d93f0376mr13724839otn.8.1708382099209; 
 Mon, 19 Feb 2024 14:34:59 -0800 (PST)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net.
 [98.183.112.25]) by smtp.gmail.com with ESMTPSA id
 h25-20020a9d6419000000b006e45a5f0a70sm171776otl.49.2024.02.19.14.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 14:34:58 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 19 Feb 2024 16:33:20 -0600
Message-ID: <20240219-mainline-spi-precook-message-v2-3-4a762c6701b9@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 Julien Stephan <jstephan@baylibre.com>, linux-spi@vger.kernel.org,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v2 3/5] spi: stm32: move splitting transfers
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

Since splitting transfers was moved to spi_optimize_message() in the
core SPI code, we now need to use the optimize_message callback in the
STM32 SPI driver to ensure that the operation is only performed once
when spi_optimize_message() is used by peripheral drivers explicitly.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v2 changes: none

 drivers/spi/spi-stm32.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index c32e57bb38bd..e4e7ddb7524a 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1118,6 +1118,21 @@ static irqreturn_t stm32h7_spi_irq_thread(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int stm32_spi_optimize_message(struct spi_message *msg)
+{
+	struct spi_controller *ctrl = msg->spi->controller;
+	struct stm32_spi *spi = spi_controller_get_devdata(ctrl);
+
+	/* On STM32H7, messages should not exceed a maximum size set
+	 * later via the set_number_of_data function. In order to
+	 * ensure that, split large messages into several messages
+	 */
+	if (spi->cfg->set_number_of_data)
+		return spi_split_transfers_maxwords(ctrl, msg, spi->t_size_max);
+
+	return 0;
+}
+
 /**
  * stm32_spi_prepare_msg - set up the controller to transfer a single message
  * @ctrl: controller interface
@@ -1163,18 +1178,6 @@ static int stm32_spi_prepare_msg(struct spi_controller *ctrl,
 		!!(spi_dev->mode & SPI_LSB_FIRST),
 		!!(spi_dev->mode & SPI_CS_HIGH));
 
-	/* On STM32H7, messages should not exceed a maximum size setted
-	 * afterward via the set_number_of_data function. In order to
-	 * ensure that, split large messages into several messages
-	 */
-	if (spi->cfg->set_number_of_data) {
-		int ret;
-
-		ret = spi_split_transfers_maxwords(ctrl, msg, spi->t_size_max);
-		if (ret)
-			return ret;
-	}
-
 	spin_lock_irqsave(&spi->lock, flags);
 
 	/* CPOL, CPHA and LSB FIRST bits have common register */
@@ -2180,6 +2183,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	ctrl->max_speed_hz = spi->clk_rate / spi->cfg->baud_rate_div_min;
 	ctrl->min_speed_hz = spi->clk_rate / spi->cfg->baud_rate_div_max;
 	ctrl->use_gpio_descriptors = true;
+	ctrl->optimize_message = stm32_spi_optimize_message;
 	ctrl->prepare_message = stm32_spi_prepare_msg;
 	ctrl->transfer_one = stm32_spi_transfer_one;
 	ctrl->unprepare_message = stm32_spi_unprepare_msg;

-- 
2.43.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
