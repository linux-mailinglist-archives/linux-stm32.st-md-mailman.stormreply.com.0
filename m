Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE37329C7
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jun 2023 10:30:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4351EC6A610;
	Fri, 16 Jun 2023 08:30:38 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77DB5C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 08:30:36 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-4f63006b4e3so525848e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686904235; x=1689496235;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7vKo64noPUzmZ5wnrfcvYV8/sEIhIizmZh4/OwU3mns=;
 b=sFeppKjFj7fUbdOkZQlYUdA8n3OTsE5GNXVVXY/jzU9RaSIe5RLYGq8sMMCpMIlWSm
 QqJkeC6ExcJbn0wiQotJs3AiFAoKHhxD15OiKYCmtZt6p7folmWW4PXm22htpkR1j2at
 kiSMgQVf6zgofHzZUyef2iLjNixb+0U44IRyCMswqQcigl2vXQw2InQ9O6ZG9o0ftnVL
 aSFer1lO6nSqWBHZfqm5pTaqC/Ffr1AZhplR2pP5Ztt9vPlJPkQ+DEHireNCw3iaHFKn
 lk0BJWr6nxv94v/c8Ny5V6lIpUMwizz7ynV1LhVCQvgXlZvNsKw8CuObIX0OuzwC8h+n
 5RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686904235; x=1689496235;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7vKo64noPUzmZ5wnrfcvYV8/sEIhIizmZh4/OwU3mns=;
 b=ODRlfAQxCIdLdfURv9vqi0m4/eTgWI/8JAyo3e5LnnVbVlzPDaNesw2WFlaO0F0drx
 7DAbc9b938XZ+pgitK/NI2fACoiZX8d0Qn9biDxjSbS9cl13/N9Xch2UHqhILHTP9bEI
 fFgGeO052UTPzykyqA+/hVZ7u43JZ6rh8yRnEbl3VFbpKr16zfV1pG7KIJb6lfEzQPvT
 NmW3uDxSkluzbd1y5iT4vUUrVQ0+Q+9oLJatg9Z6bFBftQvUMZT8jbZGvUVoC25AEOJO
 PII5XHsOoppv5bewMc8i2xB2V16DUcqBGPoPFL972WnGIEF5nxO6jyMRDk0cP4jaiyw2
 is5Q==
X-Gm-Message-State: AC+VfDz1tQNAPw8+tMRzSbo+zgKkVKW03mJX0lTH/Ud3HAofwADyPbUW
 g3pN1RrIUvAdbl729vuXGKG/kQ==
X-Google-Smtp-Source: ACHHUZ4z/bW9iUhLwswcAbMMEItXOX77eDOVUv4l6Kb3UJSdNmrGfeQlgq2wqvsg80x/8J0pf4pTtg==
X-Received: by 2002:a19:690c:0:b0:4eb:c85:bdc2 with SMTP id
 e12-20020a19690c000000b004eb0c85bdc2mr615304lfc.2.1686904235473; 
 Fri, 16 Jun 2023 01:30:35 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 j8-20020ac25508000000b004eb44c2ab6bsm2918106lfk.294.2023.06.16.01.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 01:30:35 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 10:30:32 +0200
Message-Id: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKkdjGQC/43NTW7DIBAF4KtErEs1MEDsrHqPKosBJjFSakfgW
 o0s3z3YuyqLePnm53uzKJwTF3E6zCLzlEoa+hrcx0GEjvoryxRrFho0ggEr7zfVgPS/5RF55DD
 KS/qTzhGgg4htQ6K+eiosfaY+dOvzD5WR87q4Z673W9/3ueYulXHIj61+Uuv0TdOkJEjdUFAtH
 Q1b/rqlnvLwOeSrWMVJ71F0VZi9AtTorXEvCu5RsCohYrSttsTOvChmj2KqEi9taIIFgxb/Kcu
 yPAEEj4dkpAEAAA==
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 0/9] Fix busydetect on Ux500 PL180/MMCI
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

This series start to fix a pretty serious problem in the MMCI
busy detect handling, discovered only after going up and
down a ladder of refactorings.

The code is written expecting the Ux500 busy detect
to fire two interrupts: one at the start of the busy
signalling and one at the end of the busy signalling.

DAT0 busy          +-----------------+
                   |                 |
DAT0 not busy  ----+                 +--------

                   ^                 ^
                   |                 |
                  IRQ1              IRQ2

The root cause of the problem seen on some devices
is that only the first IRQ arrives, and then the device
hangs, waiting perpetually for the next IRQ to arrive.

Sometimes neither IRQ arrives! This could be because
the card is so fast that the MCLK does not have time
to latch out the IRQ signal to the bus before it is
gone.

I included the rewrite of the entire busy detect logic
to use a state machine as this makes it way easier to
debug and will print messages about other error
conditions as well.

The problem affects especially the Skomer
(Samsung GT-I9070) and Kyle (Samsung SGH-I407).

This series does not finally solve the problem, but
prepares the ground by making it possible to solve.
I see no regressions on the HREF boards or the
known-good Golden device, but enabling the debug
prints reveals why we have problems on the Skomer:

U8500 HREFv60 TVK:

[    2.343785] mmci-pl18x 80114000.mmc: mmc3: PL180 manf 80 rev4 at 0x80114000 irq 83,0 (pio)
[    2.352789] mmci-pl18x 80114000.mmc: DMA channels RX dma0chan8, TX dma0chan9
[    2.609727] mmc3: new high speed MMC card at address 0001
[    2.610762] mmcblk3: mmc3:0001 008G03 7.38 GiB
[    2.612989]  mmcblk3: p1
[    2.613824] mmcblk3boot0: mmc3:0001 008G03 2.00 MiB
[    2.615367] mmcblk3boot1: mmc3:0001 008G03 2.00 MiB
[    2.616721] mmcblk3rpmb: mmc3:0001 008G03 128 KiB, chardev (246:1)

Then I can mount partitions etc.

U8500 HREF520P TVK:

[    3.064950] mmci-pl18x 80114000.mmc: mmc3: PL180 manf 80 rev4 at 0x80114000 irq 88,0 (pio)
[    3.075458] mmci-pl18x 80114000.mmc: DMA channels RX dma0chan10, TX dma0chan11
[    3.558157] mmc3: new high speed MMC card at address 0001
[    3.573992] mmcblk3: mmc3:0001 SEM16G 14.8 GiB
[    3.595782] mmcblk3boot0: mmc3:0001 SEM16G 2.00 MiB
[    3.610788] mmcblk3boot1: mmc3:0001 SEM16G 2.00 MiB
[    3.633313] mmcblk3rpmb: mmc3:0001 SEM16G 128 KiB, chardev (246:0)

Golden:

[    2.993989] mmci-pl18x 80005000.mmc: mmc2: PL180 manf 80 rev4 at 0x80005000 irq 82,0 (pio)
[    3.003348] mmci-pl18x 80005000.mmc: DMA channels RX dma0chan4, TX dma0chan5
[    3.134052] mmci-pl18x 80005000.mmc: no busy signalling in time
[    3.142300] mmc2: new DDR MMC card at address 0001
[    3.148051] mmcblk2: mmc2:0001 SEM08G 7.28 GiB
[    3.155668] mmc1: new high speed SDIO card at address 0001
[    3.167170]  mmcblk2: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25
[    3.232390] mmcblk2boot0: mmc2:0001 SEM08G 2.00 MiB
[    3.242865] mmcblk2boot1: mmc2:0001 SEM08G 2.00 MiB
[    3.249808] mmcblk2rpmb: mmc2:0001 SEM08G 128 KiB, chardev (246:0)

Notice an initial error message, then it stabilizes.

Then I can mount partitions etc.

Skomer:

[    2.659027] mmci-pl18x 80005000.mmc: mmc2: PL180 manf 80 rev4 at 0x80005000 irq 81,0 (pio)
[    2.670135] mmci-pl18x 80005000.mmc: DMA channels RX dma0chan4, TX dma0chan5
[    3.380554] mmci-pl18x 80005000.mmc: no busy signalling in time
[    3.387420] mmci-pl18x 80005000.mmc: no busy signalling in time
[    3.394561] mmci-pl18x 80005000.mmc: lost busy status when waiting for busy start IRQ
[    3.402893] mmci-pl18x 80005000.mmc: no busy signalling in time
[    3.409088] mmc2: new DDR MMC card at address 0001
[    3.433166] mmcblk2: mmc2:0001 M4G1YC 3.69 GiB
[    3.466766]  mmcblk2: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25
[    3.485076] mmcblk2boot0: mmc2:0001 M4G1YC 2.00 MiB
[    3.503265] mmcblk2boot1: mmc2:0001 M4G1YC 2.00 MiB
[    3.524993] mmcblk2rpmb: mmc2:0001 M4G1YC 128 KiB, chardev (246:0)
[    4.470245] mmci-pl18x 80005000.mmc: no busy signalling in time
[    4.489227] mmci-pl18x 80005000.mmc: no busy signalling in time
[    5.457244] mmci-pl18x 80005000.mmc: no busy signalling in time
[    5.469512] mmci-pl18x 80005000.mmc: lost busy status when waiting for busy start IRQ
[    7.133880] mmci-pl18x 80005000.mmc: no busy signalling in time
[    7.154541] mmci-pl18x 80005000.mmc: no busy signalling in time
[    7.189270] mmci-pl18x 80005000.mmc: no busy signalling in time
[    7.542175] mmci-pl18x 80005000.mmc: no busy signalling in time
[    7.552886] mmci-pl18x 80005000.mmc: no busy signalling in time
[    8.277618] mmci-pl18x 80005000.mmc: timeout waiting for busy IRQ

This is why the Skomer isn't working.

Next up will be a patch or patches fixing the issue.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v6:
- Fix up the busy end IRQ in the state machine rewrite: we
  need to check if busy is de-asserted, not asserted!
- Change the timeout handling such that we cancel the timeout
  also on error paths.
- Link to v5: https://lore.kernel.org/linux-mmc/20230614194312.1158498-1-linus.walleij@linaro.org/

Changes in v5:
- Single patch revision to just add the timeout. This
  didn't work out.
- Link to v4: https://lore.kernel.org/r/20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org

Changes in v4:
- Fix an unrelated change in patch 1
- Move MMCI_BUSY_DONE initialization outside the if()-clause
  for busy detection.
- Use the per-command ->busy_timeout as calculated by the
  core.
- Link to v3: https://lore.kernel.org/r/20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org

Changes in v3:
- Unconditionally assign busy_status = 0
- Rewrite state machine states to just three
- Drop a patch that gets absorbed into another patch
- Drop patch to get busy state from the state machine, it was
  fishy, based on a misunderstanding and not needed
- Link to v2: https://lore.kernel.org/r/20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org

Changes in v2:
- Drop pointless patch nr 1
- Unconditionally intialize some state variables
- Use a less fragile method to look for busy status when
  using busy detect, should fix Yann's problem
- Link to v1: https://lore.kernel.org/r/20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org

---
Linus Walleij (9):
      mmc: mmci: Clear busy_status when starting command
      mmc: mmci: Unwind big if() clause
      mmc: mmci: Stash status while waiting for busy
      mmc: mmci: Break out error check in busy detect
      mmc: mmci: Make busy complete state machine explicit
      mmc: mmci: Retry the busy start condition
      mmc: mmci: Use state machine state as exit condition
      mmc: mmci: Use a switch statement machine
      mmc: mmci: Break out a helper function

 drivers/mmc/host/mmci.c             | 114 +++++++++++++++++++++++++++---------
 drivers/mmc/host/mmci.h             |  14 +++++
 drivers/mmc/host/mmci_stm32_sdmmc.c |   6 +-
 3 files changed, 105 insertions(+), 29 deletions(-)
---
base-commit: 3dff3b32d4752f4a0655fad3c8669978c291ae59
change-id: 20230405-pl180-busydetect-fix-66a0360d398a

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
