Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A752A85226E
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 00:27:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7122BC6DD69;
	Mon, 12 Feb 2024 23:27:59 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D784DC6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 23:27:57 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-218e3197784so2361955fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 15:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707780477; x=1708385277;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wgg1LuqsL+txmWYsX1bhtUmhJO0NDo1N/7wvtQZvjZE=;
 b=G778Umzj18wQLH8QcQ1Kxgru8FUsS+lncriS5JYcA5qHo7sPPkeq2bdQtSk1wis9p+
 8Cz9jbRDlR8fi65ifSeqrjdVZvWEiwCDC/RDSbc4JoPeV462KNzo/Ro+XOsb2ZyAbX8Q
 Z/T2kCNrPxyl1Qo3mU59VPmaLY1OulT1jogqkOYiGQkIEnHL2QDtgZA4Uid8Vg359FOB
 o7fgMyp8hNWW10cA+E+S2NrRzeXnLjLEkIn6FCwVncwx/W5CmJYbf4s9qvYH0gIh3Qo0
 e4u0vZ3jsTz24MGpIRigq/kRx8uo3kqx/ajz4A5IHZeFst6d6KAbHUbYVKbGDV25skLr
 KbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707780477; x=1708385277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wgg1LuqsL+txmWYsX1bhtUmhJO0NDo1N/7wvtQZvjZE=;
 b=SqHylb94EaILUleAADry53HNsd4sWPE0iOc+Szx1xPR3D4p1E1I3LFkVhgYKwkwYt8
 R9Hk1TpCaBOjek0bNn+DWKBQ643byki7B2L45myBhagsLkk5W07l2t4cQnV8McizvBz9
 q26P8wjQWkSx7w6MBM99sPN+sOVNWpI5kKRYMhSMAWgm8vAK6pa+f3mKdxVqlwIyMix4
 NhsYx60hdGk181LJph6O5iEAn7v103UnCPuuq6J3drl7/+KdvKzKtgWjl9qoeiZrwMSB
 osizNO8DHIWPbL+Np46WBk/US501xMwnvvfz61geJBFIMAFZbuz8demEVr+zgBxp6y91
 frZQ==
X-Gm-Message-State: AOJu0Yw9mFWSMfD/dQWyr5w6zfP1JbiW0fkUBvqkolcGK/ziKYw78IC4
 n8uAACYtgoM9mcOFVi4R0jYekbAgST8LoSf+uMWdAQpYGLG1TtZKEwOF8haf4cMUQ7rgb0u3hSG
 X
X-Google-Smtp-Source: AGHT+IELT5R44AE8dFtwqd5bl+J3kkdcmv8gPvy1/OPh7cRterQinbELctzOchigcD1RHaK44PYXvQ==
X-Received: by 2002:a05:6871:20a:b0:219:77b5:efea with SMTP id
 t10-20020a056871020a00b0021977b5efeamr9731725oad.52.1707780476826; 
 Mon, 12 Feb 2024 15:27:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVC+/BMjkbKS/YbJkbW+yDdREhJQUURkROBdWkmvdgRrc4cmkOXx308t4GOolDYtSDjDM4HHnBMbUlxYSyyBsZcnfq1pLOJPF1oWxWk+zFOQY+ub9Z3iflpRl3q/QflYQh9UbrZtPKEPnnZMGKjsTCpXvqIH2flK1o/rPQYVBd3YfK7H7H8RABG1U8jTCfjhFL7DiRSQZNeelRZRZmhWBzsFEUhtOu1564EhwvNzr/gDVT5spJByD6wHVyvHex1sasvrnGLyi2jxwKPJgBwlUK2wXNw5vuat3K3S9Nk2vra0WgOf+JOXZndnhfTDdJgm51LYnCIPmwumgUzRD0jAlbH9vEkRHDdfw5S+8hrGkbFiIWX/SBpaUaaBJiL8cZ54jW8JcRGdKHmm5dQd76JHjX78uoX8NMgKNMpcTxmzHSk2zqGRh8/Xqeaa+fcMSfACkuZ9BVZjuGOUo0ZyHGGGAqhme0nqmaSTsP34XSiGFNloQm86nymrhYFEvhsUyYbchCU8/NnRS6yWt7hJiblyWzf44YQ/3Y=
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net.
 [98.183.112.25]) by smtp.gmail.com with ESMTPSA id
 pk17-20020a0568704c1100b0021a7a45e0b1sm330141oab.35.2024.02.12.15.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 15:27:56 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 12 Feb 2024 17:26:43 -0600
Message-ID: <20240212-mainline-spi-precook-message-v1-3-a2373cd72d36@baylibre.com>
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
Subject: [Linux-stm32] [PATCH 3/5] spi: stm32: move splitting transfers to
	optimize_message
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
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
