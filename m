Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1E91F3C4A
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 15:26:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41B93C36B21;
	Tue,  9 Jun 2020 13:26:53 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE2BFC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 13:26:50 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d8so4860022plo.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2020 06:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=PjgYBNZkkJ+Dumdoc0Hlqfs0IRx7oFITY6Yyd4osHSM=;
 b=qlWkEznIMn5JbwERE/cmdiBazioDv1eZrG6VG5S/M5gPRqhS99hbVPE22TkTnN1d0B
 bPEUEE+QfHcp3rG0vk4cBhQPyULjAXBoN6eZ3vInSBQZezYpO5OH662IVjbDHdDQM7Pn
 hmVlApyWWPV1Dl8fQYMK/0ztzObKC+hDYu9Ag2iLsHAuBxtuWYIHEIhsIWkNJL8TJyVS
 POwrnx2FsVRGqPFILSnEylscqhuiYMuobqB9oqpHXUK3qclRlF+NY1rIXG1iMyB92duk
 u7KGuZae9lhXYVh0uHWA2njeca95MdeTGBxNOa8HjxQPyGiPRzC+kLtVRj3zigIKaTS8
 sLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PjgYBNZkkJ+Dumdoc0Hlqfs0IRx7oFITY6Yyd4osHSM=;
 b=UfaLL/YF4Us7pNRR5k8VVGS9fOHauMmeXe/3PSPPkQkQfImVWbOzsyrBMqGyJpoJkB
 zbn90pMJxvtM8rs0OC6PlDIkRUbS4XHb0Yx3H/kD9G+21tdSn/768hUZ1VpNp2OhR3lz
 gPKkPdFB95gImYMo1+tZ59lOlqgGMl6Bjkw7w0PR6Y0rv2cbzbTwHQtgUW/d10gjIV4T
 V3pA45wNTLQvhliAWjd08fODGE8fKs3Ew3qn8D9NChgNWEJnCyPWCMMokEegGG+EHjZ2
 30SydQaJk/Dzsu6wCIe6gtBdtFxYbWrjftTr9rWQVbNhnc1D0kvLTwrTc10b+3IxIqIU
 k1sA==
X-Gm-Message-State: AOAM532qoK8aDdCKnW2YdUNezb3HFdGq/hvVwxNXM9oezpDwIeqN/lY+
 lHIAG40nGhomYKGAMRe29aY=
X-Google-Smtp-Source: ABdhPJxxfhUMGVH6Bs+zE9AXCufQP4t+CEN0WSM3o76ybXzA0BlMm1MQxbpCBPvFTgA2PHmmY4X1tQ==
X-Received: by 2002:a17:902:aa4a:: with SMTP id
 c10mr3469848plr.0.1591709209326; 
 Tue, 09 Jun 2020 06:26:49 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.42])
 by smtp.gmail.com with ESMTPSA id b5sm2624348pjz.34.2020.06.09.06.26.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 06:26:48 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 p.zabel@pengutronix.de, pierre-yves.mordret@st.com,
 philippe.schenker@toradex.com
Date: Tue,  9 Jun 2020 21:26:39 +0800
Message-Id: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/4] Enable stmpe811 touch screen on
	stm32f429-disco board
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

This patchset is intend to enable stmpe811 touch screen on stm32f429-disco
board with three dts and one i2c driver changes.

has been validated by ts_print tool

Changes log:
V4: indroduce 'IIC_LAST_BYTE_POS' to compatible with xipkernel boot

V3: just add change log in [PATCH V3 3/4] below ---

V2: remove id, blocks, irq-trigger from stmpe811 dts

V1:
ARM: dts: stm32: add I2C3 support on STM32F429 SoC
ARM: dts: stm32: Add pin map for I2C3 controller on stm32f4
ARM: dts: stm32: enable stmpe811 on stm32429-disco board
i2c: stm32f4: Fix stmpe811 get xyz data timeout issue

dillon min (4):
  ARM: dts: stm32: add I2C3 support on STM32F429 SoC
  ARM: dts: stm32: Add pin map for I2C3 controller on stm32f4
  ARM: dts: stm32: enable stmpe811 on stm32429-disco board
  i2c: stm32f4: Fix stmpe811 get xyz data timeout issue

 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 12 +++++++++
 arch/arm/boot/dts/stm32f429-disco.dts  | 47 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32f429.dtsi       | 12 +++++++++
 drivers/i2c/busses/i2c-stm32f4.c       | 12 ++++++---
 4 files changed, 80 insertions(+), 3 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
