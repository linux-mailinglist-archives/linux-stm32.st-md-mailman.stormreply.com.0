Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9638CA6FA7E
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 12:59:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A1E6C78F68;
	Tue, 25 Mar 2025 11:59:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A697C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 11:59:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so33150225e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742903944; x=1743508744;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jGTI6dUm2MRiVeGplFX7z/KtFfB0S3Uj2G+oen7A4jo=;
 b=xTsf1nefoArtycmDOfJdS4AVemTculwAyeftoMiOwULofacTtkZqqz6P8iJkELs/9b
 3kQKZ4M8+FTzWPwSAje5+60Ly5WqTeCUH8vetHnIY95LUZwjaf2cHQYdnibWZpPGUSr7
 1dHq6KdsxLIWnnQrPwM61weFOpqgm3MCsMEadQsYf3fJ7i0ueDoZY49LisXV4s6DxueS
 KPMxeS+NMcqioqGCe0C8F+klH1Juescu6fCjptZS4Tu3JbxczPnwmpcre2FcKzSJXuoD
 A50SuIeFHu1CSposWoUicQsPLwkQaTsCuy2cSrg85aL/ckLzAfbziVOWrvW0gZtb35WH
 tYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742903944; x=1743508744;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jGTI6dUm2MRiVeGplFX7z/KtFfB0S3Uj2G+oen7A4jo=;
 b=KLqALi6u8GfDolzioJP6aGbuIxQTmbLlRQq7aAR++feg0uShhnUKmE+ABS1KRuhZkM
 hNujqBtSJtRYRQNSjNQK5xB4cvv4XChzObdQDaZo6m8+jnhiNDwap/hsd4C0op0O1JMe
 WeGvHMdrSBQpFLcRDIAI5dyy1Bkl3R+tkUlkjc5xJ2CXbp6kR2JZR5tSBEMpI5GK5VKg
 QrX8HwvQSyM2Hbl06+ehpNP9MheuMtTXeFKqLQWYqzrcSc15qMiG/l3dvxjQvY84FyWS
 yTfzS8Sh6av8InU6DYZsFz6kK6d8fo0xBu68thz4khntsQV04yGTo+LaPCvvSp9/pYKX
 tA2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdwuv6pY58aX7SO6NQAeUeZ5hTfXWuKKKNW18WVhzkj3lfDyDLowgictPweUKOhfCsWsUdItFLho/MfA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzS0GHHvH3lCg58DqWoUOUqqNghdPT7qUKaKHaEJYRYfvUqvMYJ
 H1EaRZ39fhizqhJYPuHCeRpSlRI+f1O28YoR6hiW/8NZAzukrkQ6UDYtxnU/83Q=
X-Gm-Gg: ASbGnctNhzPDKX8KWFGN8fSLayohDuAfmIbgYlOf+QUOYtJLF2pwWA4vyiCZXB0yiFf
 LXBP651oYViv7o4YBr3M5cOEcX8Yj8S//oTDrI5SS/+q4YKQYJvAwFjZy4HN3eW7akH5RkK+Vnj
 s4n9KBxgpRK1ywbU+Wzit8DM3N5Ly48Pxea0Q3U/VtpDt1zPu7t1XOHdBZP+fXzwJLlFavBwB1n
 nmRlHDzgrURKbPwN+m8ozqBDb0/i3cQDvKtPMefCxJkBo6jB5T/LWncM1WSabDJpViOD1uNvPdj
 tCcqso+oEph6yWpp1FuCXc9Qv+1PleOMxKDRk70+FtN04y3mWW4wMLMvKbI=
X-Google-Smtp-Source: AGHT+IGi3f+WduASAoJyESw/dkvZV/1xs7w/6CimQs/4qOoGd+9PrfPjTXiaYW1ipNvTLM3qNBE+cQ==
X-Received: by 2002:a05:600c:4995:b0:43c:ed33:a500 with SMTP id
 5b1f17b1804b1-43d491b7dc5mr162584035e9.10.1742903944481; 
 Tue, 25 Mar 2025 04:59:04 -0700 (PDT)
Received: from [10.42.0.1] ([145.224.90.136]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6676sm13687169f8f.62.2025.03.25.04.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 04:59:04 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 25 Mar 2025 11:58:45 +0000
Message-Id: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHaa4mcC/33OTWrDMBCG4asErTtGo5/Eyqr3KFkIeWxPm1hlZ
 ExD8N0rp5Smmyw/GJ55b6qQMBV13N2U0MKF81SHe9mpNMZpIOCubmW08driAd7jhQqkLFR4GGd
 I58gXmONQIBK6PfbYe9KqAp9CPX/d8bdT3b3kejkKxT/SIKK2wfkm7A8ueMCfD0115eP1zFOU3
 GQZNnDkMme53mMXs7G/Xe2zrsWABgqpjSF11Dp6ZLewxT5YRj+1bLU6i84n9LY1+p+1rus3IFN
 REFIBAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
X-Mailer: b4 0.14.0
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 0/7] coresight: Clear self hosted claim tag
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

Changes in v4:
- Add _unlocked() suffix for consistency
- s/cs_access/csdev_access/

- Link to v3: https://lore.kernel.org/r/20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org

Changes in v3:
- Collapse rename and locked/unlocked addition commits of
  coresight_clear_self_claim_tag() so we don't change the name twice.
- Make coresight_clear_self_claim_tag() a bit more generic by only
  doing UNLOCK for MMIO devices (although there is no use of this right
  now)
- Link to v2: https://lore.kernel.org/r/20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org

Changes in v2:
 * Revert most of the interface changes, just call
   coresight_clear_self_claim_tag() directly. This is possible because
   we're not doing the read first, so it has fewer knock on effects.
 * Split out the change to add struct cs_access to etm3x
 * Add another warning for racing with external debugger

--
2.34.1

---
James Clark (7):
      coresight: Convert tag clear function to take a struct csdev_access
      coresight: Only check bottom two claim bits
      coresight: Add claim tag warnings and debug messages
      coresight: etm3x: Convert raw base pointer to struct coresight access
      coresight: Clear self hosted claim tag on probe
      coresight: Remove inlines from static function definitions
      coresight: Remove extern from function declarations

 drivers/hwtracing/coresight/coresight-catu.c       | 12 +--
 drivers/hwtracing/coresight/coresight-core.c       | 87 ++++++++++++++--------
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
 19 files changed, 168 insertions(+), 134 deletions(-)
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
