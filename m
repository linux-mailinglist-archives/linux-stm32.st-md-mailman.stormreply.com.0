Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF4F85AE7D
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 23:34:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5585DC6B45E;
	Mon, 19 Feb 2024 22:34:59 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 833B2C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 22:34:57 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6e44c9a62b6so668703a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 14:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708382096; x=1708986896;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gpwEAehth1tWZQpA0TjLevm8DWTiiteNXTP4U1INUoM=;
 b=SJP0f+aWZAQc6wBwQVRZ62BbcVO+LS/vBvoR9rXCNdkg7g9RK5pCp0HoMEwpLq8I7n
 6W/gp9kj5aEvRrnKrbwXHcj+1yQf9qhZ2zWSHl0YYKLwOjrFUKrKY+936Tt1ZPIAb3Ek
 3khxQctZ9k/U69VXlLiKEbiAjgLcCMHUkMyUmnGZ+v/IR6hhI2dxQad/3LSQfCqQ4NJI
 czc7uNmfQnQ4J/Y/dJ9lGG2iTrP4f5IsS4tuD6c0i0e7hHysMmGaPEOLgUSky55XOW65
 Q/bcJPel5Bc4tP+SJHJ7W+/rgR6fvYI3BJ8SximnOLBt1+sazCQ8G6lv+wUTbKSVpnIo
 AagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708382096; x=1708986896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gpwEAehth1tWZQpA0TjLevm8DWTiiteNXTP4U1INUoM=;
 b=w3MIaYcVWhncbhXHIFJejGevUsPjmZMzNXiiymbJwG65aUG9LasKHQl5Qe29s4XrZz
 5gj5ku6of2nAMFbX0URIiDJK1JtiH39wsG1eUz1+wKv7lDuUpm4UnPxUbCmBNStvQ46N
 eZc+UX/iCmK1hVv3WVVz7gH3cW6p9kjdIsxmqKT3Z8parJJC0W5h7Zm3sa0ElQCN1zjU
 79WRgQOZgFxWXHnqIdOs2zQFOXOVNMhGu2gBT5aA/oJG3Ay+QPzFyKMaXFP71fgiQHGX
 fXX9c4pA6BWVejeXWGYPBxBAuU+kCsGgQPtskufNCdtbtYGFjRmXBMdpEsx4bv+zo/et
 pPhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqqqjzNvt+fxHqrexpJQnzP9fdrAV7RoanwCCcORxjguXbhXh9kvHrMeOzzWYdjPyHJntq6zHJqTac00W7V0B03e4zlcPhbXZK+GODPRP+wiEYE38ikGbZ
X-Gm-Message-State: AOJu0YwEENiJ7B6mfWv671/K59SVVCTYC4lbNV07Zbb+ymkRqN91FFcJ
 23Wih+ItefPkWZrqFx5CtIVbpoIQZR+4E1FEfVtCgNRopAJjgP7TK+8cWugFOiU=
X-Google-Smtp-Source: AGHT+IE2e9IPdvZzRdmlGUC/m+SCrl+vlfAO1vOVWnmmv6s7Y3hILnYtoJnl9bqMN42qD9thWqnGRA==
X-Received: by 2002:a05:6830:4cb:b0:6e4:3cef:5e0b with SMTP id
 s11-20020a05683004cb00b006e43cef5e0bmr8226071otd.13.1708382096244; 
 Mon, 19 Feb 2024 14:34:56 -0800 (PST)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net.
 [98.183.112.25]) by smtp.gmail.com with ESMTPSA id
 h25-20020a9d6419000000b006e45a5f0a70sm171776otl.49.2024.02.19.14.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 14:34:55 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 19 Feb 2024 16:33:17 -0600
Message-ID: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 Julien Stephan <jstephan@baylibre.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-spi@vger.kernel.org,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v2 0/5] spi: add support for pre-cooking
	messages
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

This is a follow-up to [1] where it was suggested to break down the
proposed SPI offload support into smaller series.

This takes on the first suggested task of introducing an API to
"pre-cook" SPI messages. This idea was first discussed extensively in
2013 [2][3] and revisited more briefly 2022 [4].

The goal here is to be able to improve performance (higher throughput,
and reduced CPU usage) by allowing peripheral drivers that use the
same struct spi_message repeatedly to "pre-cook" the message once to
avoid repeating the same validation, and possibly other operations each
time the message is sent.

This series includes __spi_validate() and the automatic splitting of
xfers in the optimizations. Another frequently suggested optimization
is doing DMA mapping only once. This is not included in this series, but
can be added later (preferably by someone with a real use case for it).

To show how this all works and get some real-world measurements, this
series includes the core changes, optimization of a SPI controller
driver, and optimization of an ADC driver. This test case was only able
to take advantage of the single validation optimization, since it didn't
require splitting transfers. With these changes, CPU usage of the
threaded interrupt handler, which calls spi_sync(), was reduced from
83% to 73% while at the same time the sample rate (frequency of SPI
xfers) was increased from 20kHz to 25kHz.

[1]: https://lore.kernel.org/linux-spi/20240109-axi-spi-engine-series-3-v1-1-e42c6a986580@baylibre.com/T/
[2]: https://lore.kernel.org/linux-spi/E81F4810-48DD-41EE-B110-D0D848B8A510@martin.sperl.org/T/
[3]: https://lore.kernel.org/linux-spi/39DEC004-10A1-47EF-9D77-276188D2580C@martin.sperl.org/T/
[4]: https://lore.kernel.org/linux-spi/20220525163946.48ea40c9@erd992/T/

---
Changes in v2:
- Removed pre_optimized parameter from __spi_optimize_message()
- Added comment explaining purpose of pre_optimized flag
- Fixed missing doc comment for @pre_optimized
- Removed kernel doc inclusion (/** -> /*) from static members
- Removed unrelated comment about calling spi_finalize_current_message()
- Reworked IIO driver patch
- Link to v1: https://lore.kernel.org/r/20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com

---
David Lechner (5):
      spi: add spi_optimize_message() APIs
      spi: move splitting transfers to spi_optimize_message()
      spi: stm32: move splitting transfers to optimize_message
      spi: axi-spi-engine: move message compile to optimize_message
      iio: adc: ad7380: use spi_optimize_message()

 drivers/iio/adc/ad7380.c         |  36 +++++-
 drivers/spi/spi-axi-spi-engine.c |  40 +++---
 drivers/spi/spi-stm32.c          |  28 +++--
 drivers/spi/spi.c                | 259 ++++++++++++++++++++++++++++++++-------
 include/linux/spi/spi.h          |  20 +++
 5 files changed, 297 insertions(+), 86 deletions(-)
---
base-commit: 55072343f1df834879b8bae9e419cd5cbb5f3259
prerequisite-patch-id: 844c06b6caf25a2724e130dfa7999dc90dd26fde
change-id: 20240208-mainline-spi-precook-message-189b2f08ba7f
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
