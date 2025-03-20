Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0A0A6A8A4
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 15:35:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9459C78F64;
	Thu, 20 Mar 2025 14:35:09 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82674C78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 14:35:08 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so503574f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742481308; x=1743086108;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T3uKjmvKFIJwQeQjhs6y043yl808flrdLcwtYSXqapk=;
 b=MXR83yXf8lpodxSndqRQno5Ab/1xbiqrzyku/r+yjjFjGXWXZPpXhG9V3L56CVFf5l
 /Ntwp79SrTL+/YX6Kx/g5E649zqOJozB3+CIhUDpdgB8LmUACA7pp4CSRydSVs3dR/Jz
 AQy0CTvj3A9zl4TJovFRTM3wTmEHu43kkPdGuQ2mC98wz8MAaIaVcZ4Cj0OT+7e0Aa43
 znZCpG07nFzmzEKUgvxTeegqg0Y1hT54myeMGdoh+Daznvx7/Mdo3xYdvZo5mIlDzlHc
 tvg3BLyudmvvYUc+CmMhoFIvc0zwRDIvZRGr+MQc8v7jOJI4tFt0y9gGyqfapwMWd2n3
 DMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742481308; x=1743086108;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T3uKjmvKFIJwQeQjhs6y043yl808flrdLcwtYSXqapk=;
 b=frJlnYTnlCuGg+ky67ZNZt6o26mA0T3QmPutLrewqGt7hgld/OVn1c1N76Yvy3cwv2
 JiW1Ib8IiSmamyjxJg/dgzLMSkvPt59kr/Ggn/VDWCH2EiAPc9SD16JkIKpS8m4gZorY
 I8kPj3fpfQcg+2R3fvswltkegXwMJAbh8iNT0GJC8UkTeeBC82fz3HN539UVng9TkDT+
 ZjYnAYYyTGPdbeWmF+aQ09FaWya+7sMqgWiX1HE5p/4eRcMG+BTlP2ya7J8cUEiDFzPL
 lss/qhz1QE/2bQwA06C2upxMkTzCeVRfAoFqEyEZAeVGjwzo1sw+CRGtHzpfmIak4i55
 kZrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Nj4vklbQGPthkp6OOzQD3ziOpzOhlUHD6mUCYS5AqH6SHuLA6m9N6azNWK/on4xV712onZFS6GE2EQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz/OpXEE+d2jOuG1q0n4pyf2qf70fXFoz37j/vDZK6zpxe//c+8
 sICkYg9TBkyp4zs/qY8MSk8kBNnbyOlf72EGbrPYwPboF00f9EdhNZUWAZWbywI=
X-Gm-Gg: ASbGncuQYWf7vUh4FJPsHE2n2G6GvX5fIualKFJHwRPgqV5Jnz6b10NDZQIG3Nzh7m7
 s0LHSR20ri/2cmU0puAmsPK74eI8vbVP5N3794F6N5IjYJLIDqKvom57dKTAp+3LOpMuW+G9Yyy
 m/Wo6nGS5xwGC7u1KBoWGMMYyua55vJ60rPoWd/j6VwowT4BJXTmxRMjrI99xsdi0kbygGkc//c
 ZVW0xd+UiYVvtnWaI7JIDWU9/47TywnvwrD24xbG+Wvg9+IqnDJLsMvh3WLFc0eMoEfxvKZR0P4
 1WQ5YmLBPX2ZjG3wBtZAft9KIsVTM26xyzvB+O2LWdXLuzk=
X-Google-Smtp-Source: AGHT+IEi+3lvXUBBl0Xfy6+/zMNSE6JUBwO9nHsVgmXy4u5Zz77pany2bxefRYqYSeHLwQMSeBXSLA==
X-Received: by 2002:a5d:64c4:0:b0:391:2d97:7d0e with SMTP id
 ffacd0b85a97d-39973af6beamr6757865f8f.42.1742481307687; 
 Thu, 20 Mar 2025 07:35:07 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm24238187f8f.31.2025.03.20.07.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 07:35:07 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 20 Mar 2025 14:34:09 +0000
Message-Id: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGEn3GcC/33Oyw6CMBCF4VcxXTukLde68j0Mi6YMMF6omRKiI
 by7BWN05fIkk2/+WQRkwiAOu1kwThTID3Gk+51wvR06BGriFlrqXKaqhLO9YQDnGQN1/Qjuauk
 Go+0CWFRZoVrV5ihFBO6MLT02/FTH3bKPlz2j/ZJaKSVTk+WJKcrM5KDeH5Lo8uV4pcGyTzx3K
 9hTGD0/t9hJr+ynq/rXNWmQgMZV1rgGqwx/2XpZlheviR+aBgEAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
X-Mailer: b4 0.14.0
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 0/7] coresight: Clear self hosted claim tag
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
      coresight: Convert tag clear function to take a struct cs_access
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
