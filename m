Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 253383C9B5E
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 11:24:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA6E1C597B1;
	Thu, 15 Jul 2021 09:24:43 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04C20C597B1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 09:24:41 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id h4so5452558pgp.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 02:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mCcTQBeV0g268A2M9TPD/9QxrKalElJIkYLfh3ClvtQ=;
 b=D99wtn8wtJqlxMGxhop5T2Yo3g3c/yFYlIdtnEENUOdBj+MCucLhXkpDFur5az+DH4
 Qr1IbFzcUgyShr/hoOTrAFeRmBWTr2q5+JdZBdzYDip+Iz01z1AnsubHGLd8MLG+m5rW
 jWsj+39Tr94sIAIlQyAkaJp+0BxhzapuXGsvkqN+gJ/qumSzRX6TdsNQz+Xy/dJsYLSd
 NJrRISx3+A3+BGbjZQkJ/S3Lxx+0Cp8KNQOgmuNk70TdvkHPAQC5X9yZ/H5CaTe5iPUe
 wshmHgfvp9op32oU3OABpXoAp0HPL+jzlCxX2TYUDaDQawP2qp/0qD2NodPnF6KsqCqb
 RFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mCcTQBeV0g268A2M9TPD/9QxrKalElJIkYLfh3ClvtQ=;
 b=t8G85/j4FHf7XxHZbz5aBMZ6Dx1vynGuF7N0sSSQKIP0A+pHt+lPwk1CQrMkTMDVHG
 E/fASWS/F2fesriuXYXv/A9i6Ei4WRC3dJ44psWrZ74pLQTsSQ/GMX4Yy9QUWr8/smPE
 gS2OIm3cfSdNolNI5Z9Ek9+5NgwP7iezVYk/4+xRNkXsn/dZ7KVrCVWqGg9PAikUGz8a
 I3bhtAD1nmOODOJQ/E9jgUeVNx6OvMMqLNtmx+S5qbSXhe1oSuqPK2lGbsIm+dh0rWVb
 nGTiRTQPxlyhAxuC9nbslAz3VmXAcqepBLeIJ0XWLY3bHt0wmu0CuuEHroIJYMlrjNS/
 fXNw==
X-Gm-Message-State: AOAM533OsfmVcHlKtrH3tMxnlV9gMaRP/WMylqFkgLer98xXIoiJ3xwB
 qcSFKPM/kXnY03KPSavQ5tw=
X-Google-Smtp-Source: ABdhPJyq2IMUZzj4mXVdAOMYq+8wYB3Ec3J9hZefg1LJkBMlIRND2+2geTj9ctMba06OJhb/muIpRQ==
X-Received: by 2002:a63:1215:: with SMTP id h21mr3546057pgl.173.1626341079670; 
 Thu, 15 Jul 2021 02:24:39 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.24.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:24:39 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 15 Jul 2021 17:24:10 +0800
Message-Id: <1626341068-20253-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 1/9] media: admin-guide: add stm32-dma2d
	description
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

add stm32-dma2d description for dma2d driver

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: no change

 Documentation/admin-guide/media/platform-cardlist.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/media/platform-cardlist.rst b/Documentation/admin-guide/media/platform-cardlist.rst
index 261e7772eb3e..ac73c4166d1e 100644
--- a/Documentation/admin-guide/media/platform-cardlist.rst
+++ b/Documentation/admin-guide/media/platform-cardlist.rst
@@ -60,6 +60,7 @@ s5p-mfc            Samsung S5P MFC Video Codec
 sh_veu             SuperH VEU mem2mem video processing
 sh_vou             SuperH VOU video output
 stm32-dcmi         STM32 Digital Camera Memory Interface (DCMI)
+stm32-dma2d        STM32 Chrom-Art Accelerator Unit
 sun4i-csi          Allwinner A10 CMOS Sensor Interface Support
 sun6i-csi          Allwinner V3s Camera Sensor Interface
 sun8i-di           Allwinner Deinterlace
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
