Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 349C5A67914
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 17:22:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE386C7803B;
	Tue, 18 Mar 2025 16:22:25 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC5DEC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 16:22:24 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-394780e98easo3834676f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 09:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742314944; x=1742919744;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IS58nPgz/vhhwTrnHBcU78ZbfsRgzftJFesloBEwajk=;
 b=g6+81/XXc/SmBeWYaIj4TDhSi9wBvv1uIe7UEAZamH6AbUcdChYxPxQtvdGimLz3Lp
 oST4r1WgtECK8z7T2S0u7OlqRBcu/w6mK/aJyNbevyzdH+OZNdNKsHiC6LRE8DhH2fsv
 /Jk3jVYXq6EcXdVczo2cHNAXwKxbJWfOa0bZi70tefi47daQstRUt+/AKpc1YsWnK8uP
 +9msWhGLa3Tx26hsaSn8TYzMed1mCC3BzkNwScnKvmzQF76wOs9wg0T97cZGjBF0SM7p
 GCNN0jc2AvlZ5IdkKoQn3CZyO17iV8m3W0VJK68a15Z9TkhqDaZiRtIEdbpViSiueoIA
 p2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742314944; x=1742919744;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IS58nPgz/vhhwTrnHBcU78ZbfsRgzftJFesloBEwajk=;
 b=BuhikzLEgwvsgIGfNyeSx4VXUXc0KN/ofGsvQ4+fGGwOepRQpOx6p/AWDg5O1lToAh
 ZgyyjdYrEjtbOUlC/PGrZVhm5JDCKnEi0pIlTMCQ6hfLRzdzH1JG/9gtCW5vUMZfmBwf
 QrBOvouEI5HrHTFoOpvOvkyCTHxqrLIvu1U+8y/dquJ3mdqH4rcMc36nZtLRC9aAPNRS
 noHiYvPF9xtLS/vMrTWb8EgiNlvBVYn8id/4/gnrhoCVKuMNHxHKlbse/0S3kOfkubeU
 VsZtToK6dcgFzfQni56vYfvgyMv46T4m8PyMoo+WyWbg8KWfQGJ6oUYW9HRFrodWxEfD
 H46A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8USstZi+Cm1eSlbLgnC5PH9lIWX8z7TulkP8dbQiD4IfoIP8tdcA9knPlfu3GzOikDVjnoN3zUmOJ0Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2y3NWid/kX2FoQ910A3Xksc7wxUKORq0LiXvBsjBD51gdgn1D
 DwH9Rj05DU+styUpFpUzvxvs9MVBPFK9EiUMb/OMZPU2zSAvoLZHSS8tUDpB2pc=
X-Gm-Gg: ASbGncuZmRygVKRHBbjKE/YzzIlsvpAjy3zS3pemgTL48ycBgMvztm0hn3WHNMFM90q
 XybPaXWp4b66FrJaBj/WpzJPBxfBlTwAtol+6y0OzkRmXMJlaen9KB6E1lNZurqpfv51iIN0juS
 cYENQTckXtQzlZmtzVSHECAyF/pgjGEdmnrcOPlvcIsnNg+mmoL7tpucvuJqxM0EKTREnALKYkq
 JLLt5+2qAkwxCPuXZBP7Vm12hMOAbOL/oCOMkTN3n4FXieVXo5gtRNbbUF+sW4LEIQ5AH2kZYHZ
 lfJQNPQp71YjKM7o3xZ5PnmynYivAPB6b7NqRzbN9WS3B4k=
X-Google-Smtp-Source: AGHT+IEwJEcXk3dumIi7rBste16wPAh7uoKDuJkycvX07wE3srIa49dtB8OVLWB1K6r6+XwTz4wL1g==
X-Received: by 2002:adf:9b89:0:b0:391:3fa7:bf66 with SMTP id
 ffacd0b85a97d-3996b46892bmr3310969f8f.31.1742314943988; 
 Tue, 18 Mar 2025 09:22:23 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 09:22:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:21:54 +0000
Message-Id: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKKd2WcC/0XNQQrCMBCF4auUrJ2SSZuWuvIe4mKok3S0NjIpI
 pTe3aALlz88vreZzCqczbHajPJLsqSlhDtUZpxoiQxyLW2cdd422MONHpxhTMpZ4rTCOJM8YKW
 YgRjbDgMGz9YU4Kkc5P3Fz5fSQVNZTsr0Jx0i2mZofT10fTt4wN9DXVy9n2ZZSFOdNJp9/wDJh
 P2LrQAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
X-Mailer: b4 0.14.0
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/8] coresight: Clear self hosted claim tag
	on probe
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

I've gotten stuck a few times with unusable Coresight after a warm boot
due to lingering claim tags, especially when testing the Coresight
panic patchsets.

This change does some tidy ups, adds some debug messages and clears the
self hosted claim tag on probe. The last two commits are unrelated
tidyups but they touch some of the same functions so to avoid extra
conflicts I'm including them here.

This gets as far as fixing the claim tag issue, but there is some other
state not being cleared on probe that results in the following error.
This can be fixed up as a later change:

  coresight tmc_etf0: timeout while waiting for TMC to be Ready
  coresight tmc_etf0: Failed to enable : TMC is not ready

Changes in v2:
 * Revert most of the interface changes, just call
   coresight_clear_self_claim_tag() directly. This is possible because
   we're not doing the read first, so it has fewer knock on effects.
 * Split out the change to add struct cs_access to etm3x
 * Add another warning for racing with external debugger

--
2.34.1

---
James Clark (8):
      coresight: Rename coresight_{set,clear}_claim_tags()
      coresight: Convert tag clear function to take a struct cs_access
      coresight: Only check bottom two claim bits
      coresight: Add claim tag warnings and debug messages
      coresight: etm3x: Convert raw base pointer to struct coresight access
      coresight: Clear self hosted claim tag on probe
      coresight: Remove inlines from static function definitions
      coresight: Remove extern from function declarations

 drivers/hwtracing/coresight/coresight-catu.c       | 12 +--
 drivers/hwtracing/coresight/coresight-core.c       | 85 ++++++++++++++--------
 drivers/hwtracing/coresight/coresight-cti-core.c   |  2 +
 drivers/hwtracing/coresight/coresight-etb10.c      |  4 +-
 drivers/hwtracing/coresight/coresight-etm.h        |  6 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 28 +++----
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    |  8 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 ++-
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    |  4 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |  1 +
 drivers/hwtracing/coresight/coresight-platform.c   | 26 +++----
 drivers/hwtracing/coresight/coresight-priv.h       | 20 ++---
 drivers/hwtracing/coresight/coresight-replicator.c |  3 +-
 drivers/hwtracing/coresight/coresight-stm.c        |  6 +-
 .../coresight/coresight-syscfg-configfs.c          |  2 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  9 ++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 16 ++--
 drivers/hwtracing/coresight/coresight-trbe.c       | 18 ++---
 include/linux/coresight.h                          | 40 +++++-----
 19 files changed, 166 insertions(+), 134 deletions(-)
---
base-commit: 5442d22da7dbff3ba8c6720fc6f23ea4934d402d
change-id: 20250317-james-coresight-claim-tags-ae1461f1f5e0

Best regards,
-- 
James Clark <james.clark@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
