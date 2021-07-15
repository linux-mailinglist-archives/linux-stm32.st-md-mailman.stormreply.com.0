Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9C93C9B8A
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 11:25:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55357C597B1;
	Thu, 15 Jul 2021 09:25:58 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27650C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 09:25:57 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id g24so3420061pji.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aMXI9Mdj9z/HPVLPURXiRCm4s3Wy5duT1BMDaADDJh8=;
 b=Ad280bKSABKLCLMpJBsFT0sTvaP2B4Yr6QaoxVuUKwmFMMa1w2TUdHDTY6Ev1mtXUG
 pWbET+qABYWxkGhKEeL34lbuYWgsjler/hWqeL7RUzvQjGopW8Rl5EBaQVvuzB9Nx64g
 vFE1fJj83uMG1U8LHveoLcve58URBZmRM7RD/G3qJQ40lnZJcCGdxXO48NU9G2JBh+eO
 i/5t1nXj2phT21JSy0J+++DssTwNY57rxCFbq9q9uQ4hZTu34C0oYLVqYXudgg3zN2nE
 iu8dVILctJ9D2WgMWXD4cclU8ODUSrla2owNRQ5fI9Y3y+J8CGLTrp+FVhNkAoNkUpmf
 Xing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aMXI9Mdj9z/HPVLPURXiRCm4s3Wy5duT1BMDaADDJh8=;
 b=fVNzQpLy31hpJc21fgxxyy+evSH2wM6Z3OYO1ncwxbGJwLaplqp061oWTVTEDqwGfm
 wrFsfbt18BoSJ1XhOS41aZTCk17n22I6/1k8MLpegoYJd8l7VXHSUf0GIUbEDbKQRAUF
 DHyF44lCO+DxPpMPPLKtyqqqzUoAJ0sFCxwgAfk2JpKkD2AYBf/JLqvGO0L9YYVc7ST8
 5eWvTN6qNv4hv5uKRX3xN/tmSKbc5+WRsN4xig/lIAGfhJxywb+OWoycQ3W4W6ux3yD0
 RKfPQYDLkGD4Z2be/NXgoN1GKIw4vht1LEc6PrUzCu5qJuYQIu2KpcEifdxzu3JXvfR+
 eiQw==
X-Gm-Message-State: AOAM531yhNETgXFcNpiYfXfG89GmmN7h+3iC/ZErONErUPXthqQVVgkS
 JRqEGj1LnFM8Pi6ROYK6HBQ=
X-Google-Smtp-Source: ABdhPJysCyoNhM0i2lSCi+LeiSv1Ani1Nyw3PAHKsMTj4pTTWSpC4Z7DAv2YdmHxLikUkvpMeU59+g==
X-Received: by 2002:a17:90a:4105:: with SMTP id
 u5mr9377171pjf.33.1626341155823; 
 Thu, 15 Jul 2021 02:25:55 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:25:55 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 15 Jul 2021 17:24:27 +0800
Message-Id: <1626341068-20253-19-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 8/9] media: v4l: uapi: Add user control
	base for stm32 dma2d controls
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

From: Dillon Min <dillon.minfei@gmail.com>

Add a control base for stm32 controls, and reserve 16 controls.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: reserved 16 ioctls from v4l2-controls.h for stm32, thanks Hans

 include/uapi/linux/stm32-media.h   | 12 ++++++++++++
 include/uapi/linux/v4l2-controls.h |  5 +++++
 2 files changed, 17 insertions(+)
 create mode 100644 include/uapi/linux/stm32-media.h

diff --git a/include/uapi/linux/stm32-media.h b/include/uapi/linux/stm32-media.h
new file mode 100644
index 000000000000..c5a05801a7a4
--- /dev/null
+++ b/include/uapi/linux/stm32-media.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/* Copyright (C) 2021 Dillon Min, <dillon.minfei@gmail.com> */
+
+#ifndef __UAPI_STM32_MEDIA_H__
+#define __UAPI_STM32_MEDIA_H__
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_DMA2D_R2M_COLOR		(V4L2_CID_USER_STM32_BASE + 1)
+#define V4L2_CID_DMA2D_R2M_MODE			(V4L2_CID_USER_STM32_BASE + 2)
+
+#endif
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index fdf97a6d7d18..72d0bb095732 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -212,6 +212,11 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_CCS_BASE			(V4L2_CID_USER_BASE + 0x10f0)
 
+/* The base for the stm32 dma2d driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_STM32_BASE		(V4L2_CID_USER_BASE + 0x1170)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
