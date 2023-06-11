Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 212FA72B3BD
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jun 2023 21:41:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3BB8C6A60F;
	Sun, 11 Jun 2023 19:41:42 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D4C7C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 19:41:41 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-4f6454a21a9so4141335e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 12:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686512501; x=1689104501;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0dCXyL73MENjnJLZrDVn/k8iJuoy5Z0Z1mdSZ8sB38w=;
 b=XK8sREUjk0GSyAhNQDJzl+5DxmiNPghVE+wm+pq45QHd9vbbPhYyj++UEZkAqUSr/N
 5DF3NS3l/6v/lgR0dFp41C5Hteew8/t89nhA8DXxBM4ZIYztriwQP0Zc6qu7MvHSUovM
 36VDk+RUA4HRYOYmt1IJcit+lCvWz+Mzk5vGfJ92dRzZYXZN96ieQtZSXpU7OGI/buOT
 meALOAlqSYQEq/jiGwDtoBxyS6GB6+F7oYAKaogR36mo9kvNDSnUcuLh0VOA4Y0R5ZUf
 uv7Y5RZlKAvkQRAvZE+GavJMw/mkqBol0o0d7QOYe/gTkRbYH6dp9CrS+VTaGd1hKpJk
 bixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686512501; x=1689104501;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0dCXyL73MENjnJLZrDVn/k8iJuoy5Z0Z1mdSZ8sB38w=;
 b=VdNqIqJqzZyqBsUrEWiQ5Ln3UMAHDwcsOPCdqr785c4g7ZtuYGYkJeeTfibE/+01m+
 ypnZSMUcdiUrley2XF3RFUe4Kc2djI/ad8hae/XO9kr/mh9gmfGDG+Ilj5Qe88d+UE87
 vZtgzcJ0oV2Z4j1sj+htshhDER7+4M/Gq0vFOfxVW1t7uLP9QLNvSHW41vhQaSu+BfgH
 xCFUQG0JbyjrDe4LC/5IRgGZwVqUTB42wbSlWCQOU+hGa8PJPZUJ7lCfABma4k9YciFf
 WhCA/IXMBa+OnGjgDfSVjnf4FIiaj3NTriyqFWST/a5m+KHxt2a8TiNMQd/s3be7xCeD
 B3pA==
X-Gm-Message-State: AC+VfDwpOTSxcL6LLeXa7vdKbNu4OYQohopzW81I9kyGRSCmLzfm5jgx
 mzxnLYSyWNvjRXEfC2mwjD2dYA==
X-Google-Smtp-Source: ACHHUZ4dB6la9H99qaKDz3r4JiemAkTGYy9i0eOq6GbEuFY6SpCRtu6IimVSrhSiCXfIZ59y+lLbiQ==
X-Received: by 2002:a19:4359:0:b0:4f3:b4a9:a619 with SMTP id
 m25-20020a194359000000b004f3b4a9a619mr2622572lfj.40.1686512500535; 
 Sun, 11 Jun 2023 12:41:40 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac243d8000000b004f14ae5ded8sm1246960lfl.28.2023.06.11.12.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 12:41:39 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 11 Jun 2023 21:41:26 +0200
Message-Id: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGYjhmQC/42Nyw7CIBBFf8WwFsOjxdaV/2FcDHRsSWppAIlN0
 38XunOlyztz7zkrCegtBnI5rMRjssG6KQd5PBAzwNQjtV3ORDAhWcVqOo+8YVS/wtJhRBPpw76
 pUsCkYp1sGyB5qiEg1R4mM5TxE0JEXx6zx9zffbd7zoMN0fll1yderj9MiVNGRQOGt3CusMbra
 Cfw7uR8TwoxiX8oIlMQNWdSSF1X6ouybdsHVYBB6BgBAAA=
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 00/10] Fix busydetect on Ux500 PL180/MMCI
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
Linus Walleij (10):
      mmc: mmci: Clear busy_status when starting command
      mmc: mmci: Unwind big if() clause
      mmc: mmci: Stash status while waiting for busy
      mmc: mmci: Break out error check in busy detect
      mmc: mmci: Make busy complete state machine explicit
      mmc: mmci: Retry the busy start condition
      mmc: mmci: Use state machine state as exit condition
      mmc: mmci: Use a switch statement machine
      mmc: mmci: Break out a helper function
      mmc: mmci: Add busydetect timeout

 drivers/mmc/host/mmci.c             | 139 ++++++++++++++++++++++++++++--------
 drivers/mmc/host/mmci.h             |  15 ++++
 drivers/mmc/host/mmci_stm32_sdmmc.c |   6 +-
 3 files changed, 130 insertions(+), 30 deletions(-)
---
base-commit: ac9a78681b921877518763ba0e89202254349d1b
change-id: 20230405-pl180-busydetect-fix-66a0360d398a

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
