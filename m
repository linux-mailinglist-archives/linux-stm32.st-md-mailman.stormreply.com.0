Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4934E430F7B
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 07:05:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DFD0C5C848;
	Mon, 18 Oct 2021 05:05:19 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B306C5C845
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 05:05:17 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so11631724pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Oct 2021 22:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PzGkUsbLWrD/fizVl6QbcWER2UnDlXJ5Kvt3KlRxinw=;
 b=iJkleu9vPyrl+MLBEf1JKcbvSB5unQ9NbyHJ7fzqtoXdt6FOXerNLXhD31ERZAcNDN
 0fejkyn1dAbqJntVNSqWJ+a9FBKjKIcywdXKLKWcUMv/ilPOUVj3/NPXIm2NA0U+iQNd
 N6PUa2NI3iVYNPmlUM4x31yvfSniA0IAMVj9490PmmoU5UmGN1/5YRWrqQcqnx0cp5mU
 GyYQdZDM6ywVao6Xw+3EzfM0zzIKHU8QfXAzCeXeB3tDDSjaa/vfZqgewmBpurh+iHgb
 vVWRoQPDNCq//24Fc9QhCJ+k3jBGL4SEYDu7N2NNhTuGvr3wQETrVJIdKdI+9TIXA99K
 GKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PzGkUsbLWrD/fizVl6QbcWER2UnDlXJ5Kvt3KlRxinw=;
 b=UNRzz7EpSYi/l+ppXWtlk4Nu0xAP3b9cBn8YODDtDOwCM14z4yaPbPsWZEB2f9833W
 Ecz4vwstSfnvY2AdTarF0+CEhSjLXIaVkvrCCOdAKw6vD9aNTukEhgvZsuV1N/j7Usom
 ZjrqHNCC/o37kn2pahACkutlUIwuDPK/RfvYVWJ4Gfr5lYqN1M1+LoF+u4RFnkhNdzXY
 BlOGEd+tMM+ctcnn/oNZ7ZByh3E4A0oR/7PGn8VoSphiEW2IERVnTSzOUvQ/PXXKTTiz
 Z5zDLR2g8YbRFf2Ew5xJDAUBX3Ro+uiPts0y+FDOqLIfpxImFDiNW22Z9TBme6U+wf1V
 8m3w==
X-Gm-Message-State: AOAM530UQVm0r0RYJeYPgx/+8axvh58KdcjX5wo1xizBLOOhwNxo+D6J
 39webxnnsscS0eWh2+sCY9s=
X-Google-Smtp-Source: ABdhPJzFIGL/C3R/Jx+goNAzsN41+4QdhLrtABR4a7qLxtm7YYYOXpSVS7AYDqWe/lbixFNQSl9fwQ==
X-Received: by 2002:a17:902:ce85:b0:13f:9678:ecd2 with SMTP id
 f5-20020a170902ce8500b0013f9678ecd2mr15598799plg.39.1634533515562; 
 Sun, 17 Oct 2021 22:05:15 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.05.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 Oct 2021 22:05:15 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Mon, 18 Oct 2021 13:04:42 +0800
Message-Id: <1634533488-25334-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 04/10] ARM: dts: stm32: Enable DMA2D on
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
v5: no change.

 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 30905ce672a0..ba26a3375b0d 100644
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
