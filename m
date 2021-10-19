Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5569433146
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 10:43:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DC10C5C84E;
	Tue, 19 Oct 2021 08:43:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD14FC5C84B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 08:43:35 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id t184so16160723pfd.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=h7PwAA40r7NAb/5FPeOofbMWfGdgtuL0HMPeau8hiKs=;
 b=f9BYB/zy0ezsm9GvxRsGFCm3tzHvyxphbpqvMbikWQZuxNqBYcAyHo1QbaFfgWXmoH
 Cpo6CxcVglX4DeZpRJGlniTbsu346xZVt+aI5GbxezOsBeuMLuvEyn1AJF8HgvI3REgc
 tmUVcHDWbD0rBV4cJN4s977jRVesLXrsbjNzTwW4qOIZUQLQmJenSOe/BgLk2Rc2maB8
 4NP5LY/4C/24wm+zuevlf/VaI51oyF1WGM78ZVKr6Rgtj1swmW4WEMfYcLYkfxXRyO9H
 du5SUiPRseqhEdEbxEuX+PE3ZciqjELGWavs1PhIzF5QkXTXbGGJD8pMkkyzkN9icGhn
 WW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=h7PwAA40r7NAb/5FPeOofbMWfGdgtuL0HMPeau8hiKs=;
 b=KX4CPSi1MhvIuO8n8A9WhFTQtzp5R3hmUB0jp5HdGeQIUiupV/T1D+6BIHuHCL706T
 KeTcqrwkShYnMOeTS7yuxzCfzwmPgtlrO/E+udN3xT85eb97XEjdmyEfu3bZlIUajjqh
 qGuG7NstwNb9bDRK6xqHzG/QJMNwUEH8kfktHFMcpmzp9CL6XpGGzDzEIU6jCKKTOI9j
 U5VCExDNYEJ2jrlV8NXtKwSvPPzWKX8vGpZPGJyJg3kj4tpt4/FhPNizYsJLMrqpyXvz
 7QkxXBxd9jHTtPvW4IW5JPdq5roA/ls/GAljbo9pYRFYV0+hfliY7F3dDRp1xML6S4OM
 BCKg==
X-Gm-Message-State: AOAM5301CYOG4yQu6BHkwt6jaa7HKRfNtbqr3O5X1z2bZufbL4fWKI4n
 CwEcm0sIrUCmLK2oe1znk3XqtD399NwsNc0l
X-Google-Smtp-Source: ABdhPJzKB3aEIRNO6YSO8LmXbk5VwNRtkkuZG53AggCZmIQ0r3UksdSPW1ndqT3alCgCZkgJ5PADMQ==
X-Received: by 2002:a05:6a00:1309:b0:44d:4d1e:c930 with SMTP id
 j9-20020a056a00130900b0044d4d1ec930mr34064397pfu.65.1634633014561; 
 Tue, 19 Oct 2021 01:43:34 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.43.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Oct 2021 01:43:34 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 19 Oct 2021 16:43:14 +0800
Message-Id: <1634633003-18132-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v6 01/10] media: admin-guide: add stm32-dma2d
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

add stm32-dma2d description for dma2d driver

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v6: no change.

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
