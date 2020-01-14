Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AEC13AB94
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 14:59:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CCA9C36B0D;
	Tue, 14 Jan 2020 13:59:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B5AAC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 13:59:51 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id q9so13890850wmj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 05:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WxdkQ4fln/Ubg69SQWZPku8d8xfNPtcWo6lDszFAgoU=;
 b=W5yD7THh9GoPrqpAR+V6A99baoCffIA80ESDKdfUT4jQ43HWe7mgvJtpFBECNzWpfo
 bz8xxkmz7NEenvBfXfcRuOdyeWxr/pUVVyFOh9D5p9Nqf4DNNkAg8yMwt2KipmDXSA4m
 F/Xi7b8c+8LkgBp35W80e9OVXqAPJNH2bBe+He6wKRT0YZa0l/hFhJpvHkcEUovLUEpi
 UHyC1DShgeL4HbPe4cvV8l153bzO81NZY3bLWpc1uh9L8pOP8grJOHDrSBs/SEUo7Q/G
 C6IkbFOdSBNykmToWLZSS6dvZWgV7mwwdZTUK+lIjdgNba/X1T0dVEkSEzSu50mSY97i
 xWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WxdkQ4fln/Ubg69SQWZPku8d8xfNPtcWo6lDszFAgoU=;
 b=MRRa+3DnhMA0yi94+Gk5v252TfNHPudTgpzbJ/wge7Y8QaFY1QAUcoT2SsxchhB4fc
 ugvnF5O5VBQS4vn4wQnDx5kf3bTPezvxXlUwOAmaWnA5xFZErZm/3hE4ierdFvwl0O6f
 eUhLV3SsBFwDkGXF1J35JXYvW6aj1CfXlxCPd7lo3Nw+WFP30pU3c25oiOqM54iqBKCi
 goya4rfGf2NlwvYKznksLKLnMNC0fV9569ixbLn3E5YtQTemce83DfDrz+cIoclmGcNJ
 EtPnzXCD+ngbzdFCkZLbFlLBPeIFq+cen7tKl5xqvNCZANnW3Rzn2sqpG1D2GpN5aSn/
 1eWw==
X-Gm-Message-State: APjAAAXMEUk2qvK/YnR3QsOJw9/TJp/300D2IJGnhPMc/HaCrT8M3E1Y
 8h5GH/vf6vWAAJAqCYCxjSA=
X-Google-Smtp-Source: APXvYqzNVQbW7IsfrQ2HGsc5vwBjjCjT9FNXhoYr/xxz+X6aphiPMpyQ6yCNL9Z9aspgGTjXkf82iw==
X-Received: by 2002:a05:600c:20e:: with SMTP id
 14mr19620970wmi.104.1579010389767; 
 Tue, 14 Jan 2020 05:59:49 -0800 (PST)
Received: from Red.localdomain ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id 4sm17854448wmg.22.2020.01.14.05.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 05:59:49 -0800 (PST)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: alexandre.torgue@st.com, davem@davemloft.net, herbert@gondor.apana.org.au,
 mcoquelin.stm32@gmail.com, mripard@kernel.org, wens@csie.org,
 iuliana.prodan@nxp.com, horia.geanta@nxp.com, aymen.sghaier@nxp.com
Date: Tue, 14 Jan 2020 14:59:26 +0100
Message-Id: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 00/10] crypto: engine: permit to batch
	requests
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

Hello

The sun8i-ce hardware can work on multiple requests in one batch.
For this it use a task descriptor, and chain them.
For the moment, the driver does not use this mechanism and do requests
one at a time and issue an irq for each.

Using the chaning will permit to issue less interrupts, and increase
thoughput.

But the crypto/engine can enqueue lots of requests but can ran them only
one by one.

This serie introduce a way to batch requests in crypto/engine by
- setting a batch limit (1 by default)
- refactor the prepare/unprepare code to permit to have x requests
  prepared/unprepared at the same time.

For testing the serie, the selftest are not enough, since it issue
request one at a time.
I have used LUKS for testing it.

Please give me what you think about this serie, specially maintainers
which have hardware with the same kind of capability.

Regards

Corentin Labbe (10):
  crypto: sun8i-ce: move iv data to request context
  crypto: sun8i-ce: increase task list size
  crypto: sun8i-ce: split into prepare/run/unprepare
  crypto: sun8i-ce: introduce the slot number
  crypto: engine: transform cur_req in an array
  crypto: engine: introduce ct
  crypto: sun8i-ce: handle slot > 0
  crypto: engine: add slot parameter
  crypto: engine: permit to batch requests
  crypto: sun8i-ce: use the new batch mechanism

 crypto/crypto_engine.c                        |  76 +++++++----
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 121 +++++++++++++-----
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  17 ++-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  17 ++-
 drivers/crypto/omap-aes-gcm.c                 |   2 +-
 drivers/crypto/omap-aes.c                     |   4 +-
 drivers/crypto/omap-des.c                     |   4 +-
 drivers/crypto/stm32/stm32-cryp.c             |   8 +-
 drivers/crypto/stm32/stm32-hash.c             |   4 +-
 include/crypto/engine.h                       |  27 +++-
 10 files changed, 201 insertions(+), 79 deletions(-)

-- 
2.24.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
