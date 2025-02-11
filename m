Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E6A308CF
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 11:40:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A541C78F9F;
	Tue, 11 Feb 2025 10:40:35 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01DB6C78F7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 10:40:27 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38de17a5fc9so1035120f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 02:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739270427; x=1739875227;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VrQhaC3gKZKDAc8Ce+Rq4JirL36T9Iu7HnsPcFoyuXk=;
 b=rElsLw4fPifDSqqfD0FDzBlDT38Vslhsnc5rK8Wt3g5S5wlboOtbgmW0s9aYgyenty
 GogGSFjY1RET6gjGspMs+7RO94AQoyxB8s0dUNAqdvaoEQ4/RN/twJ82fytGuHMCs1JN
 vGUqptKZjG6Bir0Tx2s4f41Y6AH5QDrjG2jqbPCzJIK5y2yzbSf2+HFJ+jhCz06tCOPB
 lOEDCKeWH7Z2nrm2pjVumNsIl9XoifLJXVGsuCe4ZrtXIv34aMdzeCeI8S2L1Hxs+mOE
 Q2VkHTy3kLjaYsO8s9w8XgOhIO8eHu9fBdl6GwV6RfdL/Ei9bIjjNruERSVS76OLO6vD
 do/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739270427; x=1739875227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VrQhaC3gKZKDAc8Ce+Rq4JirL36T9Iu7HnsPcFoyuXk=;
 b=tA5Iw2CiWBR0vM8s/qYfDLGAe6tnKiXfSU25DIKD2Xacs++JOBtFnpSdum70mSAAS/
 9akFiNprS7IiPrfwypwuNzQiJD+RCSiq3cYDJWBnC7XKnCf3l2obKuKDUGsYDlXzby9O
 1rPFXA5M6wg1cIIhUP08P4XAPSgZ05F4WxwmEOhC/H/g3GlpYB8JiGfTSfv39sGNkeZi
 Gvb4hl8+osmz5NMtnCF5SubZ7ngpMc/L2L+RLg5Gwdp27FkUn2LZ1e9srw/9K68I0BJ/
 g2G5qRjBW3DfwCTH5ifHmMMjnAQpn5TfFbF28o4jUXWUw3DciBn6XzW5Vo03Kjeou3sp
 T5KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgxPmpHuRoguSvUaOl7gwBRRldMHQGNEshbazmceD4j9OK7bgcpd116jnzgPzxwhpUJysj9qVYIb9/Rw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwjD3GL0TS8Ta2ShPBkC/3R8wtW2ztD4F2X952dfDtYG7lsLA7B
 YtLU34YNBs2qRyEu/hi4kfwY/ZcsT41NmooIbf0hCKfEYEJl/vZxYw/HK7zrH7Y=
X-Gm-Gg: ASbGncusJE3eujhTPYvhbq3/tSXgMAuaN4N3c7w9dkIbEaehx1szC0rma0GEgGTOFKn
 sgdkV/su7mpWqWf6VTAYajuf6huDvQcE0EKWJ7OqkyI9MXg+gHWHps6JMSn4dCxEzTWMnMVz5rB
 ieCbd55LmkRZloj0OB6uE202acGu9Yu4wCi2ypvvVoX5E+d3kDJfd88xBYgU2Gzrwb5f2kufkz5
 okWeQ87DaujAu/iq3JlpCeSCr4cGs/QJPlB/1tHQQ6tQKD74lczOYqGEWSNHBwR8sW8ds8IUrur
 U3xw8kNP05m+
X-Google-Smtp-Source: AGHT+IG4gEm4nSnw8t/iNqVVtVQKgUFA9cxJ4G6BsHMjOTxtxqqAhDt1o8nYwzMfYgssh++RTKqiSA==
X-Received: by 2002:a05:6000:402b:b0:386:3328:6106 with SMTP id
 ffacd0b85a97d-38dc9374026mr13853655f8f.35.1739270427442; 
 Tue, 11 Feb 2025 02:40:27 -0800 (PST)
Received: from pop-os.. ([145.224.65.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 02:40:27 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Date: Tue, 11 Feb 2025 10:39:36 +0000
Message-Id: <20250211103945.967495-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH 0/7] coresight: Clear self hosted claim tag on
	probe
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

James Clark (7):
  coresight: Rename coresight_{set,clear}_claim_tags()
  coresight: Convert disclaim functions to take a struct cs_access
  coresight: Only check bottom two claim bits
  coresight: Add claim tag warnings and debug messages
  coresight: Clear self hosted claim tag on probe
  coresight: Remove inlines from static function definitions
  coresight: Remove extern from function declarations

 drivers/hwtracing/coresight/coresight-catu.c  |  14 +-
 drivers/hwtracing/coresight/coresight-core.c  | 132 +++++++++++-------
 .../hwtracing/coresight/coresight-cti-core.c  |   8 +-
 drivers/hwtracing/coresight/coresight-etb10.c |   6 +-
 drivers/hwtracing/coresight/coresight-etm.h   |   6 +-
 .../coresight/coresight-etm3x-core.c          |  32 ++---
 .../coresight/coresight-etm3x-sysfs.c         |   8 +-
 .../coresight/coresight-etm4x-core.c          |  12 +-
 .../coresight/coresight-etm4x-sysfs.c         |   4 +-
 .../hwtracing/coresight/coresight-funnel.c    |   4 +-
 .../hwtracing/coresight/coresight-platform.c  |  26 ++--
 drivers/hwtracing/coresight/coresight-priv.h  |  20 +--
 .../coresight/coresight-replicator.c          |   7 +-
 drivers/hwtracing/coresight/coresight-stm.c   |   6 +-
 .../coresight/coresight-syscfg-configfs.c     |   2 +-
 .../hwtracing/coresight/coresight-tmc-core.c  |   9 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |   8 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |  20 ++-
 drivers/hwtracing/coresight/coresight-trbe.c  |  18 +--
 include/linux/coresight.h                     |  32 ++---
 20 files changed, 209 insertions(+), 165 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
