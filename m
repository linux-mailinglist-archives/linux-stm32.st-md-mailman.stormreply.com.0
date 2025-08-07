Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1220B1DA69
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Aug 2025 16:51:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FB83C3F951;
	Thu,  7 Aug 2025 14:51:31 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6CADC3F950
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 14:51:29 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-76bd9d723bfso1023396b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Aug 2025 07:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754578288; x=1755183088;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
 b=eKrsSRJsaYkkyL5nP5fMFs9XjTjftUfjv0NxHN9+qYaa+SacldP6IT4DDi3IM9djJk
 PIpoDbVea305eoze5S1l0izlbuGzkwSsVUzw5ls9N2Nrmk5qtFVP2BPx1tlhBJfFihVM
 tgr7zPDSbw9QLzIXpu9f0J89eEsACxuj1a3zbCjmN9l1F0KfJc1Xk3xTqNCxFebNmem8
 CXrSZhDeLbrtCA4cGDAtg+EMTaKoNYjnWp9OYiY8h2apUoGu2/TzAEvHZ0nXlYu0OTWS
 FLMUeub93ijEaP+lO/J9uFvRAZ9xr/QN69R5nyXDKXUNLcZApGt0SzI/QzcNAL6cZzai
 /lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754578288; x=1755183088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
 b=R5ngh5gjgpuvP6aye8UX8TqK9pI/JJ3MtypZhoZynz21iDP/InYhs72lxtV+NtxL6b
 VIQAP10QgQmK38IGM0As5AVLCFSsdPlATjvTMYOFyh/8iNlL9Z5lP7FAaI+TCyuZo7A8
 M9jVqBLG2/NvVzZc5tXeUNN3gE8zTOQMtVf7OBgWHcrYwSVu18wuU6fs53GsmyhEkbVj
 G9a/1uW8MGs88ldsyPmqYMFwh999WeVQMFpmfMoUIZB6UYcDyti6UZ5w0Xx0po6IMozG
 GszoPjFnsJpc5Ng9B8Zb0G45FQm9y9j9T1mVd3UsifHmeb3C1Huru4zJoqRLm6fEwbU5
 tXQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULxxFDrx06rpXxqHBz2ze5ShJ/n274a4g96zDhQvPIqJ/a/I2AJnUL2s8MqbNn4JRcV2pyuonKqj3BzQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxwZUPwEHgM+Bkx4ekGu4IIwtro59nuXuNP11l0s50hhpWyez9C
 2SPbeD16vKkJY5oBMQbkZxAFVuivMMUrf1PCBFJoP7BTRbkxvqBiKaMO
X-Gm-Gg: ASbGncsunVy0dcycc0AjRbT9BOeSyN3Jm61Na78sTUAogCRMjXf8iNt5Q4St+cpOcNI
 YBOcE5nLjCiTvRRBhtqHkHYFHT3P+GDpIXN7oo0LpwuxxLzQGOe7yMYkEsKcugNjdxLVi7c580r
 /1b3HceS3wZVyezMeclfWTugiPfBFhagi542bHlaWNdqPoHHfT3e0Ms19SUBBo0WficCHdc3XrT
 l8NrO3oGrWx/L/in5JQFLRddua8TNYtAueSBJglji78Svy67KQ1L0FY8BqeLTbyQ/D0CgA7BfjM
 29irYjan7XRXi578m+cP2Wpku1VFDVjsWG7/s27OSkQi8dIaXU8WgT7mk60R9QNFe6pJ9Zv3XdM
 nhmNY5a64HMcp9n/+a9y1pi09PWeILDvk/ms1dRVth9TinmXTlXkIJx5CHD4CDAc=
X-Google-Smtp-Source: AGHT+IGtphOkrCppTiHiV45+Qe9W2hQNmX+FpcoXnXXadWOHWcmzG19NrBZWjxt3jESoe+Rbd+mthQ==
X-Received: by 2002:a05:6300:210c:b0:23d:c4c6:f406 with SMTP id
 adf61e73a8af0-2403159487dmr11371637637.43.1754578288227; 
 Thu, 07 Aug 2025 07:51:28 -0700 (PDT)
Received: from ak-workspace.tail730999.ts.net ([49.207.200.134])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422bac0d6csm15569174a12.38.2025.08.07.07.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 07:51:27 -0700 (PDT)
From: Akshaykumar Gunari <akshaygunari@gmail.com>
To: corbet@lwn.net,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Date: Thu,  7 Aug 2025 20:21:19 +0530
Message-ID: <20250807145119.2214-1-akshaygunari@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Akshaykumar Gunari <akshaygunari@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: [Linux-stm32] [PATCH RESEND] docs: arm: stm32: fix typo "busses" ->
	"buses"
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

Fix the spelling of "busses" to the preferred form "buses" in STM32 ARM
architecture documentation.

Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>
---
 Documentation/arch/arm/stm32/stm32f746-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32f769-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32h743-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32h750-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32mp13-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32mp151-overview.rst | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/arm/stm32/stm32f746-overview.rst b/Documentation/arch/arm/stm32/stm32f746-overview.rst
index 78befddc7740..335f0855a858 100644
--- a/Documentation/arch/arm/stm32/stm32f746-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32f746-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32f769-overview.rst b/Documentation/arch/arm/stm32/stm32f769-overview.rst
index e482980ddf21..ef31aadee68f 100644
--- a/Documentation/arch/arm/stm32/stm32f769-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32f769-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support*2
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C*4, SPI*6, CAN*3 busses support
+- I2C*4, SPI*6, CAN*3 buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface*2
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32h743-overview.rst b/Documentation/arch/arm/stm32/stm32h743-overview.rst
index 4e15f1a42730..7659df24d362 100644
--- a/Documentation/arch/arm/stm32/stm32h743-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32h743-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32h750-overview.rst b/Documentation/arch/arm/stm32/stm32h750-overview.rst
index 0e51235c9547..be032b77d1f1 100644
--- a/Documentation/arch/arm/stm32/stm32h750-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32h750-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32mp13-overview.rst b/Documentation/arch/arm/stm32/stm32mp13-overview.rst
index 3bb9492dad49..b5e9589fb06f 100644
--- a/Documentation/arch/arm/stm32/stm32mp13-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32mp13-overview.rst
@@ -24,7 +24,7 @@ More details:
 - ADC/DAC
 - USB EHCI/OHCI controllers
 - USB OTG
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32mp151-overview.rst b/Documentation/arch/arm/stm32/stm32mp151-overview.rst
index f42a2ac309c0..b58c256ede9a 100644
--- a/Documentation/arch/arm/stm32/stm32mp151-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32mp151-overview.rst
@@ -23,7 +23,7 @@ More details:
 - ADC/DAC
 - USB EHCI/OHCI controllers
 - USB OTG
-- I2C, SPI busses support
+- I2C, SPI buses support
 - Several general purpose timers
 - Serial Audio interface
 - LCD-TFT controller
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
