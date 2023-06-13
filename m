Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3BB72ECFE
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 22:34:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39E6AC6A61A;
	Tue, 13 Jun 2023 20:34:28 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 739FAC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 20:34:26 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4f762b3227dso447747e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 13:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686688465; x=1689280465;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kcednvuw8fADgko4gaPCVbyMHgDDWwuaOkWQxVwp51M=;
 b=pnMxNNJfdw1IBpNxhkCM6K0PzTpizLvKArBACiw75rZaJlDHN7J0xh4QeXnjC90UAh
 I8Ffae/S2VH5HPur6P4n5c6NyuTDP33KUor/dpWFdO/z6yj3ayMNcXAta6SeuyhP5mOx
 +QVuAHDFGsOTaLd0KHw/c8IGFkHnfCI9QaxJcYpKgrt/bKTE7Xd5gCYFFcfJIZK2U24p
 TbdLWW7OqS8vEPS+DGuPFCi+/YXZi5aZrtkYvTWf/V51+pw4+xwA9QKXUP1+BdSzTs9G
 0WBQdr64bDqmNcQWxINUTE8rfXVM3llbx8jtwi4OcuVyZpg0PijmAgfPwQg1sJii2cPY
 +7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686688465; x=1689280465;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kcednvuw8fADgko4gaPCVbyMHgDDWwuaOkWQxVwp51M=;
 b=JkjJsDKNBpRcMd1UrC2qpItKguwZ8byTZTJTuh1vU0zveln2emKKgjRF4TavDKp23r
 FVxHbj2cb0xu+BsK5KuQbQx1mrSDxEYvSlDKQqInWnsFgpMx/sXb7jCjfCrddgTy1UN8
 k9FbhhSVy2vFRMMaqE9q7rJIY2Jrr88cEwAzW5rzAMPt5PEdo9jMYk0B60nhn/MW/vzq
 2htEw3GQYIJHJMbNYuKGSXeyJGAmIlyDqmCOZFNKyHD3O+yNCbXkl7Gq2VRn0By4XRbp
 4RMbQLPWLk0gaFaHkRzQRZMe4ci/ZlYuWuGh9J1Iq/kcj+uijZToINQSDNdUSWzA5bHP
 aYig==
X-Gm-Message-State: AC+VfDxtCbpzS2W1I9lHFVNXn17Vb76kTaW9QbVFuUK3siaS1Q2wP/2t
 SKCfHdjL2oHg4lTIPRIjj2oobQ==
X-Google-Smtp-Source: ACHHUZ48mfM5/P9A9Y94JYt91moM59ya3XvByPtbOhrQ1lXNFI4yAnplunN5bnR6u5YtNucWiQzkUw==
X-Received: by 2002:a05:6512:32a9:b0:4f7:6404:4638 with SMTP id
 q9-20020a05651232a900b004f764044638mr221697lfe.17.1686688465473; 
 Tue, 13 Jun 2023 13:34:25 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 l12-20020a19c20c000000b004f26f699e9dsm1897813lfc.184.2023.06.13.13.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:34:25 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Jun 2023 22:34:16 +0200
Message-Id: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMnSiGQC/43Nyw6CMBAF0F8xXVvTt+DK/zAupu0ITRBIi0RC+
 HcLO+NClnce584kYQyYyOUwk4hjSKFrc1DHA3E1tBXS4HMmggnJFNO0b3jBqH2lyeOAbqCP8Kb
 GAJOGeVkWQPKrhYTURmhdvT4/IQ0Y10UfMd9vfbd7znVIQxenrX7k6/RP08gpo6IAx0s4K9R4b
 UILsTt1sSKrOIo9isgKouVMCmm1Mj+K3KPIrDgvvS6FBjTqS1mW5QOn6WraXgEAAA==
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 00/10] Fix busydetect on Ux500 PL180/MMCI
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
a delayed work that fire after a timeout if the busy detect
has not stopped. This is the last patch in the series.

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

 drivers/mmc/host/mmci.c             | 143 ++++++++++++++++++++++++++++--------
 drivers/mmc/host/mmci.h             |  15 ++++
 drivers/mmc/host/mmci_stm32_sdmmc.c |   6 +-
 3 files changed, 132 insertions(+), 32 deletions(-)
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
