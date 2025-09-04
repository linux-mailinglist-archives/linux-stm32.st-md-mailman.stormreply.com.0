Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3480EB43C7D
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 15:05:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBA64C36B1F;
	Thu,  4 Sep 2025 13:05:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F416C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 13:05:19 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45b8b2712d8so8792675e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Sep 2025 06:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756991118; x=1757595918;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wYkWbCvyzrXYcRtGccULZYx96qOTZhMo/W/nEtVwCNo=;
 b=vw3/H1BVWi9TLgUEuZE5N6tRiA7lNFj7f/WggupDA534AsRBIOJA01nohMDSR50xTZ
 CaGkx8FM4A2S6hiJ7a0a6aq6ohc3Nj2F/Rp1TNS0aRQ4hTwrMjTN57KsB+XqXQ1WKUiA
 mkdT+L1tDRQ43aW3RbsaKEosVqq72zv8EcfUT2ZzRGJbO8vk3HnL+5CN8ADEFbgQwvbB
 SxFhsHxA9IADem/w5bnFytLtxUpqqm0iw3mBmaVRh/m+5icd7TYX7KDgmK8pkouv9l+C
 YByHn8lHUpTr5Z/ap8Bz+URr0p1Y7BEC5AQcQvNi0oJbkwGdRcDmCaHCloBnf7Fb7lPq
 LJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756991118; x=1757595918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wYkWbCvyzrXYcRtGccULZYx96qOTZhMo/W/nEtVwCNo=;
 b=vZ23/mkp0YRLRghy/JLwC00IYnRO8GKFSbTCf9kE9WjNKajnTDAiHTCo7tTqjzfFyx
 XH6VHXut326njdA15VDktCpBjsYknq6o27SMbAjQ8lzMKZwtqsLaQgO3Fif8rCaKXZPY
 +6uC9kOTeq+sF7hE/tMT5XnhdqYmMnHUMJmaG+w00OsQhtTjo9hVzxsAFb7LpcsbR11J
 zFoLyJ2TbsLDxS4EF89szRRSYkOe3gEuoknVQOmJ352isW6qIunDCAHfVYXtmBBp06eE
 Jp0H/ZFwVsVhzzlUygwNPQCl5xsyWoobp8f8jc379/+a544aUWb/anz0dwa6zmyDhFRx
 Lruw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiU/6jCIzazT6VwjNWCGkbTsK9Ch8nIhzxYnwajcLYaDDMmm6wkZDTYszVj5EdUfoJEMh0opk5t1/a/g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJQSBcSf8TIACaj6Yp7XyG3AO+ulEgo2+lRkV9DvSF2l+ceyD2
 BKcmrh2cZduualCIAfxv7ZBhOeGb+3ACh1fvNOVQBczshFg1QMEsbyBRTTOQBxHCHdg=
X-Gm-Gg: ASbGncuCNXeAX4NCuYwjcGms3r3wtxFO1i19DUFD1hIfsKF6LKsze/QM4bEweXvJdvB
 tC7jQjjNgb8nRW34TB9wQgDhI5624e2/cgiYYEp7GimsLkB5/qcT8cbM/XcOYtQXFFq0xEXxZZk
 HE8fKxtT70jrttZ2jAKgKTO9uaC+Cu+wUu0qZTq7M/5zScBNptBEf08VPQwMWEc/b1bTyYcLra6
 rQGiOYJegeZLjFBkgbQt9S7S0ZmI1rsBfZaxEqKQvJqFg4qdv3Oesr/kQ5WQGQ8UAKFJ+gVUub8
 +eGYf6KRcMfNy34SVIpri65tTiZAG9+ZOuM0JYSbXlD0YqQDjSb27yJ0+ahPM/sNmTkHjpEdTFg
 aAo0f3r/Zs5hxWbHMahmD5R0tJ3s3crJEew==
X-Google-Smtp-Source: AGHT+IGeiyinvVoDIY4X2T0SG++4d/2SLzsdQmO+tL6RfTknWDo1frGnFfVgbdD6pRFAo9bc8mLUsQ==
X-Received: by 2002:a05:600c:190f:b0:45b:8939:8b03 with SMTP id
 5b1f17b1804b1-45b89398d27mr126045955e9.27.1756991118284; 
 Thu, 04 Sep 2025 06:05:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6e82:a4aa:49e0:a7d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b93fae643sm131185925e9.3.2025.09.04.06.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 06:05:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Thu,  4 Sep 2025 15:05:16 +0200
Message-ID: <20250904130516.72266-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [GIT PULL] Immutable branch between the MFD and GPIO
	trees for v6.18-rc1
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Lee,

Please pull the following MFD changes that depend on commits I already
have in the GPIO tree for the next merge window.

Thanks,
Bartosz

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio/mfd-stmpe-for-v6.18-rc1

for you to fetch changes up to df6a44003953fb23ad67f82d299e439e7ff7150a:

  mfd: stmpe: Allow building as module (2025-09-04 15:00:53 +0200)

----------------------------------------------------------------
Immutable branch between the MFD and GPIO trees for v6.18-rc1

Allow building the MFD STMPE driver as module.

----------------------------------------------------------------
Alexander Stein (1):
      mfd: stmpe: Allow building as module

 drivers/mfd/Kconfig | 10 +++++-----
 drivers/mfd/stmpe.c |  6 ++++++
 2 files changed, 11 insertions(+), 5 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
