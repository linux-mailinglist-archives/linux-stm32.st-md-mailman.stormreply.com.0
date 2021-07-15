Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B35D3C9B6F
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 11:25:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3403EC597B1;
	Thu, 15 Jul 2021 09:25:01 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFF0BC597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 09:24:58 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id p22so4610114pfh.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hAPQ7MKC9CHG6U3K/a3TvqmDvmez6ZMEcoHbCxgEOYg=;
 b=RU5JO/5JT50O87i5qjL6PPpeR4S8f7aBaV40CK2Ig650nzh1ioiShfkh2YZIlIrNIw
 mlLfHlPTRn7pWYh+Puw8EXHuSlrZvEA+qcKtqi5uRzwTjT4oz8R4sALdLuZdumS7ivMz
 YNhm7uXfS0LQvUCaIAPwUgBUiINJjCMMTWQQBAapyGS0iyqT9QSWDAWyL4sBaw3HmCiV
 +poiNPPghEP9jRl1FjDnew/lAQcAKZMa6ce8qeFMBaS9cjlv2x2Eg7X1m8z1dQTcft77
 NrzopgrDfOJNriUHLrlY1CEg+AodoLP7fbWX17QrI0c8XV2FhIx9e1PrnxtkmdpzxJTr
 Ly5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hAPQ7MKC9CHG6U3K/a3TvqmDvmez6ZMEcoHbCxgEOYg=;
 b=P6LVB5KGpyeJLwfLm1ak7VeVAOHHl9FAacSdEqCmSRGGA6R7TQxvnqcm9gPxoX1Mcp
 u7fVCy0gnNcgV1BpGtTzQHNvXRkxVEwsU9ncyRCZaLBA4EJYL0inHbv7qB3l1/bVA9iB
 6xaf+0MJ+CB4Q+qbGP7WPb+K3chlYT5JTBkUJjdrWU1bKhyvdDyCFO6xa0W+K8OhNxch
 evmwWs9laBz/qgvMKOfNxGouI9YB4DVdx1us7ogX2L3Atj7DJK9V8trIc3ytdY0G7oQ7
 84IfPwN2epUZ5HInZsCmJRfIDO8zGHOp1Hgl6dEgZPe8/HcZHggloM+eII5MFvs2obRZ
 dcRw==
X-Gm-Message-State: AOAM5333fJu11WPq5ouGpjZb2WpQa9IpOjdaVH9SyhFWyP1IBgrtCptD
 s4Dixx4Z0w59bmKQfv3KPrI=
X-Google-Smtp-Source: ABdhPJy/sqa6q3dA18rowkJ+YNSG9VF4aJd0H2sayqnU6BCWe1UhWNsvZGKkI9NKM5GwuwUNiP7Djg==
X-Received: by 2002:a63:5117:: with SMTP id f23mr3609877pgb.200.1626341097486; 
 Thu, 15 Jul 2021 02:24:57 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.24.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:24:57 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 15 Jul 2021 17:24:14 +0800
Message-Id: <1626341068-20253-6-git-send-email-dillon.minfei@gmail.com>
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
