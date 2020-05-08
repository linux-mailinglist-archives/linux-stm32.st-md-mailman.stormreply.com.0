Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 648FC1CA039
	for <lists+linux-stm32@lfdr.de>; Fri,  8 May 2020 03:46:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 207ABC3F95F;
	Fri,  8 May 2020 01:46:37 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7699BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 01:46:35 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id q124so98683pgq.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 18:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=alS8Kr7RIS62zN20gJA22RVwlZfBznZKCMd7Fh+rxNs=;
 b=GeSWVtCymiM2pRkZiRajPWrIg9Phe4A4Dum5/RXbulyy2pTFx37DkoJ3vgJQPbq9MW
 mf3uvUdLVFUtj9TWWhRT4xsy8nPUrV4+kNmUbV+M7J5x3KDLwvZrEpcORIanmdZcqaot
 xVrXu8dWMeOmcaGLN/uQNUT78TTuflDHZl2mgS0hD4Fv30ARH5wq6EYUkk7d2cVLE3o1
 VVGDDhKvyXHaYrqSX8RUuNe7an0f+NXBxeHDBAvAekTxjoSMyhjFrFuWV5ms0PxgUn++
 DCWmhcZ0pwc2yf9xKUCbHIMTNVAujIBZ8dFVTgSZ+bE6FWjuSyjf9XidcD1luwSLW9Z4
 hiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=alS8Kr7RIS62zN20gJA22RVwlZfBznZKCMd7Fh+rxNs=;
 b=J729FLb4XOjJTK/omgVtrJT7IuaicGAC6Evvl/IWJSRMhlRFlSqL4xo3it0v5tqDtx
 Jdcz0qUdmPHPWbJWbm7Qw/KPeN7DVrapK3V4R/qhIrnFw1Adc2EtECCOPhz7av+SWyU3
 xPmk/kYydfInU+7nIG4o3DYIWDRRCwrxqAkmjGyvIqu54MYO/4hHy8jg0dDmvn/XDBpe
 /5EWudYGrfxTgzq/ivO2E+ZSHgWUeU9Bn0DHm489jkqUCAtXlG4gUrnVbAAtiOvb6hOK
 jMioW1y1c0wmru13sH8VpCtH9Sjs4K8LDLhQV9REcRY90gMKImyh7TR1pPBbXnocmRZm
 Byog==
X-Gm-Message-State: AGi0PuZt6kBGkCELsnhn1k2ZGAzRE2whY7rcPT98rymMFsI9qustF4gc
 otv3BBtwFihXcZbdQlwGe6g=
X-Google-Smtp-Source: APiQypJnSQcMaolrg+UI+/NNrYXp5sdhjMIzzc+8xWsfA0ZYycN3cwtOCSb4v/IJVPkWRFUHNgwBkg==
X-Received: by 2002:a05:6a00:c8:: with SMTP id e8mr275081pfj.206.1588902393523; 
 Thu, 07 May 2020 18:46:33 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id f74sm9270816pje.3.2020.05.07.18.46.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 18:46:33 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Fri,  8 May 2020 09:46:24 +0800
Message-Id: <1588902388-4596-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 0/4] Enable stmpe811 touch screen on
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
 drivers/i2c/busses/i2c-stm32f4.c       |  6 ++---
 4 files changed, 74 insertions(+), 3 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
