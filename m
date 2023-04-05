Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C44236D74A3
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73673C6A60A;
	Wed,  5 Apr 2023 06:50:36 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97880C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:34 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id c9so34891739lfb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677434;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t1f4W5nQPbYeNaKqHsc1ito3X+7lccB4+/1nqAy/3Fw=;
 b=ahcX1Mj/Lz8JlGmHoQMhBmG286JRJ+psLEZRIr5cwEc0xQvzs4vdjPksPVR1FBWIpU
 Djn9PqQGlEIUD4t0147DTiPGuqmvveSHhD7dtNfz4ScGz5IIM7zo2H3COfVdGj6WWt8H
 RXwSbyud7Wm9r6D8LHd09HPyPSWSb6iKA+xCpyCivOR1kgcu2rkQ7Z6s/Y182rrRftru
 oEsms1Y2yO+rn0W7dwIXXQq3rMDAGKNgb96RZyhw14vGoW2CHNFnY4ppxyvg37f5es+t
 wIRKv20wAUiQSHBM3VuPp8JIAq7Y8uosXjuIVt4x9uS0EjidzsC+v7A7nsHx1JfSTqdH
 dKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677434;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t1f4W5nQPbYeNaKqHsc1ito3X+7lccB4+/1nqAy/3Fw=;
 b=0M6mj9x5P8PUTWIcMiiSYg7yc597MW7YWpGjrMFQ0m29t1EF1Q5oQFtmM96M18a4Xw
 8gqwpAkGHgIJ2XNwuaYpfWmpZtccI4dnvQyZtkdo2EldK7TDkoQ4Xz6815t+fE3fyU01
 FHBHABWs+mjrqYeJmE/v1My6A/N1buiOHOxpFZDM5TOc1r09jBS39920y9dCyq0ywj7e
 6tXfRuy5t6ESNU8GGe9xPy0G8w5XSkgYu8rLIzxM6Uv9mNLyOYKbgPHKmWAwSjAtMM3k
 v5vOhmZITne601EBt3YtwSYVJc9xdjcl59K4382/0z6yh3EGEy8iSk1ajjKIr6L16rUY
 nTMQ==
X-Gm-Message-State: AAQBX9ePEdsGc9qarkSfqgCj7utOZRo0Nd5MiFEj2gNk4mb95fFues3l
 SFz9VktcSe0DZoYPlcGU3G3v3A==
X-Google-Smtp-Source: AKy350aafRTQRZv1RBmxir0BrkSNZZANJ0/Oi8m+R1lGq57377+Q7VZbW6GtW5JS1sds7/u432YZXA==
X-Received: by 2002:a05:6512:143:b0:4eb:1048:1285 with SMTP id
 m3-20020a056512014300b004eb10481285mr1241185lfo.47.1680677433734; 
 Tue, 04 Apr 2023 23:50:33 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:33 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:26 +0200
Message-Id: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADIaLWQC/x2N0QrCMAxFf2Xk2UC2apn+iviQttEVtI6kijL27
 3Y+Hs493AVMNIvBqVtA5Z0tP0uDftdBnLjcBHNqDAMNjvZ0wPnej4ThZd8kVWLFa/6g90zOU3L
 HkaGlgU0wKJc4bfGDrYpuYlZp+//f+bKuP+AQnhB/AAAA
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 00/13] Fix busydetect on Ux500 PL180/MMCI
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

This series fixes a pretty serious problem in the MMCI
busy detect handling, discovered only after going up and
down a ladder of refactorings.

The code is written expecting the Ux500 busy detect
to fire two interrupts: one at the start of the busy
signalling and one at the end of the busy signalling.

The root cause of the problem seen on some devices
is that only the first IRQ arrives, and then the device
hangs, waiting perpetually for the next IRQ to arrive.

This is eventually solved by adding a timeout using
a delayed work that fire after 10 ms if the busy detect
has not stopped at this point. (Other delay spans can
be suggested.) This is the last patch in the series.

I included the rewrite of the entire busy detect logic
to use a state machine as this makes it way easier to
debug and will print messages about other error
conditions as well.

The problem affects especially the Skomer
(Samsung GT-I9070) and Kyle (Samsung SGH-I407).

It is fine to just apply this for the -next kernel,
despite it fixes the busy detect that has been broken
for these devices for a while, we can think about
backporting a simpler version of the timeout for
stable kernels if we want.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (13):
      mmc: mmci: Only call busy_complete if callback defined
      mmc: mmci: Clear busy_status when starting command
      mmc: mmci: Unwind big if() clause
      mmc: mmci: Stash status while waiting for busy
      mmc: mmci: Break out error check in busy detect
      mmc: mmci: Make busy complete state machine explicit
      mmc: mmci: Retry the busy start condition
      mmc: mmci: Use state machine state as exit condition
      mmc: mmci: Use a switch statement machine
      mmc: mmci: Break out a helper function
      mmc: mmci: mmci_card_busy() from state machine
      mmc: mmci: Drop end IRQ from Ux500 busydetect
      mmc: mmci: Add busydetect timeout

 drivers/mmc/host/mmci.c             | 165 +++++++++++++++++++++++++++---------
 drivers/mmc/host/mmci.h             |  17 ++++
 drivers/mmc/host/mmci_stm32_sdmmc.c |   6 +-
 3 files changed, 149 insertions(+), 39 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230405-pl180-busydetect-fix-66a0360d398a

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
