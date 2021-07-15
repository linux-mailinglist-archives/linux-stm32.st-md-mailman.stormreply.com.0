Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3CD3C9B7F
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 11:25:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64F96C597B0;
	Thu, 15 Jul 2021 09:25:09 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B814EC597B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 09:25:07 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id o8so2890857plg.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 02:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nuloZLenal/UheIEhaBZVdFRbceClqyoioQrDZ98xwM=;
 b=YX6Dv7CoBYCPBMVzgSnETwLBtpDq3GHnrDQWprPjwKYVdT8DjPy/lxOP8RSBnB0XbH
 z9k6L3NBuo3qPRyMB6i2S9A5X/BKcNZnbbHyI+SPaTOAdZ+nN9/wQOsQGCVO23XIkCh4
 Q+ZBIIaQSA2Xqbv5D8mXvVw3jDc4NoZbUNoD4TVY+PwV3pmmTB8DlovyBvUjHFam1bl+
 7W1OWL2LJLKAKeYbQpTjwZeuwHvCGZQWI2ntWFHF+VM+F5qL2LBy8DcNJeVfVC9XV/a2
 ACFhTKYcM0usP9v4RynjvsbP+zDoqtESZMq5rBrtpWyEPnlvHeMdPPpzzoUQSeoHjRAQ
 CCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nuloZLenal/UheIEhaBZVdFRbceClqyoioQrDZ98xwM=;
 b=icIIUp/gjeYUXSZOVRfP/Vr+6020G2qj7CQS2Rw6+l96Ac7LMjDiMQSLEadIXJcEu/
 7bs8h/Cj9jMKRePK/lCdu/omI5dhrN+LiryX/cDiwHb16zmt9OUEmzdYMFmCwWXgNvLt
 jr4cQGqkYxK2WmNftdvZRMPGH3GzUKK6rOX0QfJ+EAxoOwUiKTwmPLSTXzj6x/uyK6h7
 c+1d9xCc6nUXaw2V1xBX6TIhuW8NdfWiZaW2AGBCbGe+twiG9Ql7DiynzBR5uUPEzqGx
 Pyq79gEmGMvM3b3gHVYv56JxHhLZD8ykkXFORcClsBt+uRCpxN0GRW4IJf5qNsa0vyuC
 ZgeQ==
X-Gm-Message-State: AOAM531igKU2BkDlgS5UJpkslFSwWU6K10qAMRro5GRlaLopTjqwsBqV
 /z2pMbCLJ3KPCbBWgcHTXKw=
X-Google-Smtp-Source: ABdhPJzlKUuZqqZ0SeRjLt0pUzE1LDwnOSdCyljcnofT5mqCIEhUZDeISmb/o2e79VB5I+2NfDmrrg==
X-Received: by 2002:a17:902:6acb:b029:fc:4d8c:cfba with SMTP id
 i11-20020a1709026acbb02900fc4d8ccfbamr2633129plt.29.1626341106357; 
 Thu, 15 Jul 2021 02:25:06 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:25:06 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 15 Jul 2021 17:24:16 +0800
Message-Id: <1626341068-20253-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 7/9] media: docs: add doc for the stm32
	dma2d driver
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

add stm32-uapi.rst for stm32's dma2d driver, explain the details of ioctl
V4L2_CID_DMA2D_R2M_MODE, V4L2_CID_DMA2D_R2M_COLOR.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: introduce the stm32-uapi.rst to explain the detail of dma2d's ioctl.

 .../userspace-api/media/drivers/index.rst          |  1 +
 .../userspace-api/media/drivers/stm32-uapi.rst     | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/stm32-uapi.rst

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 12e3c512d718..ce42915d48f4 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -38,4 +38,5 @@ For more details see the file COPYING in the source distribution of Linux.
 	max2175
 	meye-uapi
 	omap3isp-uapi
+	stm32-uapi
 	uvcvideo
diff --git a/Documentation/userspace-api/media/drivers/stm32-uapi.rst b/Documentation/userspace-api/media/drivers/stm32-uapi.rst
new file mode 100644
index 000000000000..d7a4f717387d
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/stm32-uapi.rst
@@ -0,0 +1,22 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+STM32 Chrom-Art 2D Graphics Accelerator unit (DMA2D) driver
+================================================
+
+The DMA2D driver implements the following driver-specific controls:
+
+``V4L2_CID_DMA2D_R2M_MODE``
+-------------------------
+    Enable/Disable the Register-To-Memory mode, filling a part or the
+    whole of a destination image with a specific color.
+
+    1 for enable, 0 for disable.
+
+``V4L2_CID_DMA2D_R2M_COLOR``
+-------------------------------
+    Set the color to fill a part or the whole of a destination image.
+    only used under Register-To-Memory mode, to set the DMA2D_OCOLR register
+    (RED, GREEN, BLUE) which is:
+
+    31 .. 24    23 .. 16  15 .. 8     7 .. 0
+    ALPHA[7:0]  RED[7:0]  GREEN[7:0]  BLUE[7:0]
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
