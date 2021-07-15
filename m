Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1593C9B87
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 11:25:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3EA7C597B1;
	Thu, 15 Jul 2021 09:25:44 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EA1FC597B0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 09:25:43 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id o201so4640290pfd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hAPQ7MKC9CHG6U3K/a3TvqmDvmez6ZMEcoHbCxgEOYg=;
 b=P9aP8xXebYqM5eL86zMabjl81y3vJ5Hf8Luzlw1sM4prphVoBHQ9J9LwBfmc5AQErm
 47bmfMcZOjqOq/0MdKJNowvyRKiMC8xJIp4vRSKe0mwuUZMLVXTFQmPIM2FQe0XLYwX2
 92w989aQ7EKAE4KMzOfqnNjfwEguT1TqWfZTGlcdkrIJWTmzDyXInGxxp7ING0Bt4K03
 NEdc1m1cerCbX6cl5dTXsf+cFnoqUkPG4RW6bHnxH4KgkE/qJ18VdwtIFi5Qgr9RACty
 zFOPUpYpyDUU+HhfSiJvD5yBhMx9LQeduRlujeKIZQ4m/sdHE2WVOzrEIZL2MwoEBKdj
 z4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hAPQ7MKC9CHG6U3K/a3TvqmDvmez6ZMEcoHbCxgEOYg=;
 b=qDBHEIpUP95DZ4wRgGxkozwDlgZmGT5dH697m1P1t61oza1k2nZc+fhtb6by62LKV5
 O9ndYr05w3/4c0MjWE9PqFAWr2OBYVSGolke8SqfNcxpbZLw1m87+7HYKecx1Z0fxyfg
 eM6xbpJv+gGhMYx2MxAQJq1N5p9FOsFzUYwDT/tDhfro5H+rigZ/HbVnR16DhN34+RHa
 VSFtCfFhW31e536E1V9habnKu328hHLjbu8MNqZe5rOWemIgB3KCVgSITA8Vi8RvyoC8
 FmjsKBF8uNT506ajthrWkQecQ0MPN6Twa0w4nh7czb2Rm9HiqO4yexPv9Ka/w5VdSSSd
 s0WA==
X-Gm-Message-State: AOAM531s5GsrIIohs2oDXAW4rtUStUIev0gGcxCbxl2qbPtbZhUDg5xB
 69jDt+tZ4tsxLrZuxFNMlTQ=
X-Google-Smtp-Source: ABdhPJxfZg3HBz3NZSalF2W5+UNgrMbPPOljW0yieY3sK5IsSH20lECUe4fiRAka40yA/dec/ZTydg==
X-Received: by 2002:a63:5117:: with SMTP id f23mr3612640pgb.200.1626341142320; 
 Thu, 15 Jul 2021 02:25:42 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:25:42 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 15 Jul 2021 17:24:24 +0800
Message-Id: <1626341068-20253-16-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 5/9] ARM: dts: stm32: Enable DMA2D on
	STM32F469-DISCO board
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

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: no change

 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 8c982ae79f43..da2f80e73f43 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -132,6 +132,10 @@
 	clock-frequency = <8000000>;
 };
 
+&dma2d {
+	status = "okay";
+};
+
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
