Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8402385226B
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 00:27:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32432C6DD69;
	Mon, 12 Feb 2024 23:27:56 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30841C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 23:27:55 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-6e2da00185dso1390777a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 15:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707780474; x=1708385274;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3+egtMFSB5wP/JnRwyX/FLjZ4VS6y7AaGO4xFQVkuUk=;
 b=tQNTBfw3ka0VaEBxTVYeM5tuW/IyuabtPYOMjzA7mZDo9iOdwCZB80xv9LUbIKz+56
 iMg47Xm6r0aLrQUXG+WjMNPsLKjFTd8q/gPGRLxuK7kgLvPEzZRS5ub9vKmF7rO46/sj
 ZXxsHZcei7neCA4+EkwswxcZHIbiVyowmnibyXQJ+OxkP8g/iTpn63ZI/nbdqwS2eEYF
 cut0B7/UDZ13vY3OP267oFfpaKeCLIPw58wjz96ZUTsZR2WfL4oK3jBY8/PX/WvLk0a3
 Svqtd/f44ygEpmv53oIod3FD5DyKblPvAilWPtHIcaTlF13KJ8O+O5jirm+1y4+5h1nK
 eWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707780474; x=1708385274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3+egtMFSB5wP/JnRwyX/FLjZ4VS6y7AaGO4xFQVkuUk=;
 b=AZ3FkuObEUU6og2FbLk94sDQRFKVp2STVtyHIu08d/W+L0B9I02xhpaQf+g9NyOAll
 JeENJ6NwwLhRSHmi7wRYEO5g3RiUTCbdwfbXmiyAMQo/5epChgWc3Ep/7KU/K4Op0geP
 CqBGGhhCUv/mGHHT2efeKBawKiN6fnqiz2+wLP5VY5xp8x5OMbwYLgJcEZod1sNtWDbg
 EGAOUy+8W9MfP76hhC33alH59g3OAPGxa7ok6EdXDmDkXAsCsHReOU2nVmZ/jYqyVnA0
 kkzOQWG5DV74ENYCzOchuPdl957WCpUjntVYVwNSyD6fguVCdhzTAEnauzGWiFaRJLuo
 Di1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZwY68yZlK1TlAnkunvrU9BIA3HZb72KOJLek4DFkUgbaetV+/dlnt/5QESu7+/sLIdC2O0BVoX3aEEuo/XxXREFtb4sOnL2WC81BXaToSCxVIPsgaTH8c
X-Gm-Message-State: AOJu0Yy2zl9QY8RFGD91Eo9nme4h7h3eklODp0YcKwmj+a2rqo+Qzkl6
 S4xu/sTqMHB/KT8GXTxiGmB8mD9XDhg0eaZzl1QwgcsHghnE1IKZvf/9BapgdVo=
X-Google-Smtp-Source: AGHT+IEnqNuLs+L+SkljOkSHhq48382/YhpcidnWFKrPiXnIR0zV1wGkfWPgAvmmTXxR3uMFQYBdTw==
X-Received: by 2002:a05:6871:80f:b0:218:55c9:bb20 with SMTP id
 q15-20020a056871080f00b0021855c9bb20mr9748766oap.21.1707780473886; 
 Mon, 12 Feb 2024 15:27:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVBCLWzInzImFpjlEde3du9xxWbJtlsO+FIOwVJCqeIGb3XUsPpgQL9MqOSJhqdb/VUAjFuoxvugBtbTKi0LRU+DEKsVET+S1y2BKftd8n6uHN7eeWchHaIuejP1qVpCOCqRjZ3rAXp+AA2CHyMY/eGgTU4nz9PpqD+iqlOeB3kH1N1kKZ7mEr1PH+lJ7gWJDxlmsPqZZHS0DxgHZpOfGcmKawoi/MFfiLH+0ce4Kbn6Y+/gewTIz+E2ZdUOnbXW1TGZMKrbwASINXfQwv80bKsZ5NIf94Sw9NEVO3RBB/IIoXmP0ie0xeGEHT8UiIrqoS8kPntNLX8W8Hcdi3VobfLuV7GLDGv12WG9ityJo9cjFG26LHR7rP6t7f1S7xMAubULcG9BWN44pTpMGAE0FbXXrXzpPbX/+lBsk/NXOlX9/U2dLT7WeQc4mc9RSWZikiWe/v1k16bK24UkDKgHCLfm156oNu0rmFechfXGHcU4GPpxjnzd2n/gMlEIuV8Ejo2/TY2z3/Ue/fUm1amIh69Ij5EeMw=
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net.
 [98.183.112.25]) by smtp.gmail.com with ESMTPSA id
 pk17-20020a0568704c1100b0021a7a45e0b1sm330141oab.35.2024.02.12.15.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 15:27:53 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 12 Feb 2024 17:26:40 -0600
Message-ID: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-spi@vger.kernel.org, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH 0/5] spi: add support for pre-cooking messages
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

Finally, there has been quite a bit of discussion on the naming of the
API already. The most natural suggestion of spi_message_[un]prepare()
conflicts with the existing prepare_message controller callback which
does something a bit different. I've so far stuck with [un]optimize()
from [3], but am not partial to it. Maybe [un]cook() would makes more
sense to people? Or maybe we could rename the existing prepare_message
callback to free up the name?

[1]: https://lore.kernel.org/linux-spi/20240109-axi-spi-engine-series-3-v1-1-e42c6a986580@baylibre.com/T/
[2]: https://lore.kernel.org/linux-spi/E81F4810-48DD-41EE-B110-D0D848B8A510@martin.sperl.org/T/
[3]: https://lore.kernel.org/linux-spi/39DEC004-10A1-47EF-9D77-276188D2580C@martin.sperl.org/T/
[4]: https://lore.kernel.org/linux-spi/20220525163946.48ea40c9@erd992/T/

---
David Lechner (5):
      spi: add spi_optimize_message() APIs
      spi: move splitting transfers to spi_optimize_message()
      spi: stm32: move splitting transfers to optimize_message
      spi: axi-spi-engine: move message compile to optimize_message
      iio: adc: ad7380: use spi_optimize_message()

 drivers/iio/adc/ad7380.c         |  52 ++++++--
 drivers/spi/spi-axi-spi-engine.c |  40 +++----
 drivers/spi/spi-stm32.c          |  28 +++--
 drivers/spi/spi.c                | 253 ++++++++++++++++++++++++++++++++-------
 include/linux/spi/spi.h          |  19 +++
 5 files changed, 305 insertions(+), 87 deletions(-)
---
base-commit: 5111fd347aee731964993fc021e428f8cf46a076
prerequisite-patch-id: 844c06b6caf25a2724e130dfa7999dc90dd26fde
change-id: 20240208-mainline-spi-precook-message-189b2f08ba7f
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
