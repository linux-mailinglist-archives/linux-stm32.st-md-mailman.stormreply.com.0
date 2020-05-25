Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8706D1E0570
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 05:46:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E9BBC36B24;
	Mon, 25 May 2020 03:46:00 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 091F0C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 03:45:58 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id s69so8002889pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2020 20:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=STuSyGO/SfkcGFSauy0QHw5IqCNUH9D9huZMTiB2y2k=;
 b=L1v+SFIcuOBtC5uNb1/F9JwnI/MV2Y6r7KptSWJmyzbRBYesYs+bXxJUS4ItcP+FPT
 k2IVwpaEgQcZpIgX2E0nirnEIobOUQ4e/qQdA0x4hwmSnzKtTyzAZi8p0oTy3OOlJuRw
 9I5G0UpR1rGvA3BHzYOtSr5wiFI1hzoOIVYgloKziD7+HX2iVNwO1P4IAzl+gUmomQOl
 T7vo1xrCFWwOXCzPsh0LyH9KcnrN8yPtbib1XiSgVcErdtxLZl2AETvmALganitVM3N0
 ePpnyIyaNXbuk7rdgWBPzbsC9fzXx6cZVtiDu0SPRxJL32R/xBFQ/NM8l97RIbYBBFgA
 xiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=STuSyGO/SfkcGFSauy0QHw5IqCNUH9D9huZMTiB2y2k=;
 b=fvwjUC1mXO5pO71R1NpVcRm7dp+apQajBIk+dEGaW3n7/3fSD28mMkeKhCxUcedZRF
 MHcb/pfHnPsbyeTwFiIcG5GgxVJtkWQMEnCIxG2VMlJSrtoimF6/UJYjHIrA/vEUjpER
 tWYUaqOeaRMiXnpIMitrYgQOjKoZpj5i1VzEJn/+6/5NrXYXlYPOCzTeMR2BpBNSlAXz
 0SGS4EhHpZMo/r2i0qUHFXT7LNL+/JS8BBGWVdWXKCkzfhP7feU4v2OfWOKJvOxeXYT1
 3PAXWFqHf4ypOF02pqy+49lQxVarkrKQzLp4I2O0tiexxLGRo/RsGmx8i280CAprNBKz
 Hnaw==
X-Gm-Message-State: AOAM532AKVi56+/xQaMI7g20jTliNSNTJ5QSSPZU1maiK/fPBGzwkmhJ
 DabigOfMbDKK5N1r28HWYj0=
X-Google-Smtp-Source: ABdhPJwkmS1ZHDjTueCXUPGhysWGmBYPKk9BaU4KH5QdoOaLDJ+q+4xaTLSo+sj1pCIJ1ykv9lAZig==
X-Received: by 2002:a17:90a:a013:: with SMTP id
 q19mr18863765pjp.120.1590378356618; 
 Sun, 24 May 2020 20:45:56 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id i98sm12152831pje.37.2020.05.24.20.45.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:45:56 -0700 (PDT)
From: dillon.minfei@gmail.com
To: linus.walleij@linaro.org,
	broonie@kernel.org
Date: Mon, 25 May 2020 11:45:41 +0800
Message-Id: <1590378348-8115-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 1/8] ARM: dts: stm32: Add dma config for
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
