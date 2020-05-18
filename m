Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5238B1D760A
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2020 13:09:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16DA4C36B22;
	Mon, 18 May 2020 11:09:41 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5412BC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 11:09:39 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id l73so6288031pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 04:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=STuSyGO/SfkcGFSauy0QHw5IqCNUH9D9huZMTiB2y2k=;
 b=dsYJfxLEd6xbVQlENcWPZzU+WfiP29b3NMO5WPeGK9V/39gTQ7A+H7bFPOu4Kv9N1r
 6IDQH14A5+eKS7P5FL0Sq/5SiYYqyMtcIxg2wrkQN4/A17gljEPX0iDZllkLx9w6/bO6
 +TwDy196nfJdIdS9ROL+TE2Jw5nc3tgtYxhQDGvjdo0FciStS01boz11hBGliU01WiC4
 K+KGnpLlMie0QC8MqcgIsvYASooQm1WAdJ7Lso/HjuXkQZCifiOc7i/ODp6kXbNBzdsb
 rzb/jmP35rtmcaRxVvcZah+syxO1XpzSaSwS1ndM7XP2cqA1meMSUDpuTvbSaH3QF2Bf
 fOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=STuSyGO/SfkcGFSauy0QHw5IqCNUH9D9huZMTiB2y2k=;
 b=XDkCch5n2yrUfwLEleTyZZJqwqdnOjA1oqG1u83ptvgO823slEEQMbL1zmfE9/eunB
 A1BnbIgF2FbfSX+F4ySRpgomuwsPlSbDmPOAM0WklXk8sU7YhNTJQKeVmcegeLFaik1Q
 ag+EYEv2mFhEaxVcmaTFr62wqGGNd92CQrlrPdsA72UsdR8g3Pjb4D9nY4bloBlw2gN6
 RRySQq2h+yOktK5zEVnAhepV+BphDrPslxNxHA/tNTnAUsuCLnGbZZwzkTxiIoZ6x1D7
 K+42iX8bBNibgMX750llMIvjDPvUlPFQ21URu8Es3oH7xCVktM3R3487WzfNUcoihUta
 FPBQ==
X-Gm-Message-State: AOAM531fdS+R9FBCCkH66lg1310syWPqHOCn33GEKNxURPsTNkgEheu3
 q7gXxHfkhyM3Jw9N+acQmbU=
X-Google-Smtp-Source: ABdhPJy4R9lorCsfCy2+A+sDPo3PPj1Wk+rtgXPYIIzgip88QiSihh3BtYXToRutgkUN36Ums0zoEQ==
X-Received: by 2002:a17:90a:f098:: with SMTP id
 cn24mr6322869pjb.201.1589800177920; 
 Mon, 18 May 2020 04:09:37 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id a15sm8290630pju.3.2020.05.18.04.09.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 04:09:37 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Date: Mon, 18 May 2020 19:09:18 +0800
Message-Id: <1589800165-3271-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/8] ARM: dts: stm32: Add dma config for
	spi5
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

Enable spi5's dma configuration. for graphics data output to
ilitek ili9341 panel via mipi dbi interface

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index d777069..5820b11 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -660,6 +660,9 @@
 			reg = <0x40015000 0x400>;
 			interrupts = <85>;
 			clocks = <&rcc 0 STM32F4_APB2_CLOCK(SPI5)>;
+			dmas = <&dma2 3 2 0x400 0x0>,
+				<&dma2 4 2 0x400 0x0>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
