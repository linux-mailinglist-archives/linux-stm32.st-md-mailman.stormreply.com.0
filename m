Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC683C9B80
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 11:25:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72C90C597B1;
	Thu, 15 Jul 2021 09:25:14 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 362D6C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 09:25:12 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id u14so5421152pga.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 02:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aMXI9Mdj9z/HPVLPURXiRCm4s3Wy5duT1BMDaADDJh8=;
 b=auQS+BROwNqtVRP7Qn84WVKH3Y4tqxm9J/3ZatsQUFmc23gND63/rSF395jr23qOUs
 ouobJ3+L6TTOkBb5B906jVuoJNruU0BAXaGFmvchOy/bmVY6KEUdnN1xW8sTpPjIA4vf
 8Xes0Ul6+EH15JINwsUHfhRVpqhoKopHmHq9UmRveMiLfdnQvQkLH3rXN/biE9YGZtfW
 QeZk3r239/lH8s7kwCxDm1Je/lyDZecU4jKC9FKhz22/bexkHief0fwGAGSd6vFdv1JZ
 cnvO/imLr1LoRnat/+cz7DGyofzi10KLVsEdS0PsP4um6qOckdYuDp7k4aoiSjQ1kaQw
 cXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aMXI9Mdj9z/HPVLPURXiRCm4s3Wy5duT1BMDaADDJh8=;
 b=AZwbnprVio4Xv33rn6o1F14F7UMeD8GB6ASGzsEpvHgEXaKQycY+K5H+r2UFkrBGN6
 Ogi9DgdM6mxqN8OfqWdaxfLsYYU0askzJW89ctO9Umb/NCxUgS6A8LB6i0xi4pG6bDYF
 gXcQmT0mcZNxv59+jeAQLzBn9kFaIO+SzMgy0E8jKRGv61WSFSujk0H8HnUQnD/xR2VT
 zc7hrLJzESls6k81lSG/rY4ltTAu8pd96QMlyLCq/GmiCu5EJ+O3pnT016gJAYi4rW6q
 WqVxx8M8uaG3DZhDJWB4EgDR2gtj/QiIOfheYz2q3k9ESBo0y/PUFWGJanU0m3fRmrfq
 vKmg==
X-Gm-Message-State: AOAM533wAX679bnL7SnJ1lOS/TM2Uo9Un8myUvU1t6uPgLB/AFVMgF+W
 eO1/3NK78XmMcuT9vRrJstY=
X-Google-Smtp-Source: ABdhPJwLCNI8nTiJiTAxhrCC+BkGgmfpsr4JifdnchvanZM36aqP6C1wxyri8GmOxeiM8heOSrNJGQ==
X-Received: by 2002:a63:1324:: with SMTP id i36mr3677546pgl.8.1626341110807;
 Thu, 15 Jul 2021 02:25:10 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:25:10 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 15 Jul 2021 17:24:17 +0800
Message-Id: <1626341068-20253-9-git-send-email-dillon.minfei@gmail.com>
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
