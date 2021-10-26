Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3543ACC3
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Oct 2021 09:11:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC227C5E2A5;
	Tue, 26 Oct 2021 07:11:47 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03188C5E2A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 07:11:47 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 k2-20020a17090ac50200b001a218b956aaso912860pjt.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 00:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uAZKiXpUPGIZiIsW4FDPovXA12YTx3ha3yV0CKfaMDE=;
 b=CUgE6eOteFF7HVr9n4neEhnLkgWwntU317UnwgwGQNeK8VHUJLR03gpCSopKua+RFq
 CcgGd7ON5Rlz86SdAAu5Tdnkp+dXUxFWzeUEtRdI4Y4Lcfp7V5FunND83X+0menFMsO4
 QpLl6UKxwrYGIWrKMS+XIHucfCo/0gOh3vCZGJF1g9HRB1SO61Bfr6vX0LMVEfYhpOWK
 hcX+eiFp2z1yiuf4gQFLX4Dkd6KvRHaIPqdHgRLW3PhTaPK0Qf+AFFnCYUukz5xx9PWn
 RU79vv3Wtfjz5NXA6DJUhnegYPBAqnil73V7nN/OovPr1uQ1Mg00FGVFK8GAiiDybeSh
 XDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uAZKiXpUPGIZiIsW4FDPovXA12YTx3ha3yV0CKfaMDE=;
 b=CsXBiAELI5Cz3wU5sRILb3ES5YD3y2cGJSX+2dE4b5ETDzvYTAl/6xF30WzKyf37GK
 GJ6DYetjStqmVUgluIUwjzVHJgOv9tQiFO1q+2BgncinkoDAL7t7q1tfxHtBkXZjgu1+
 1ZirJ2x8MMZVinuYgZBOyWb9jAiC2P2pczSX6h2yjM3AHMqrL+OC/4yPtSVzJMVejEOg
 SIm1duRA01eyJJRW9zrvK6riHuqfhlsdT4ufQMOir3GurTWDpet3Uf2yboZ0OnZkn33k
 TkFfrLU96GerxFfkvHwERr45/xGRdDolaugGNNZxO9A4iyo3dztbxDkckywnzldFTwd2
 A7mg==
X-Gm-Message-State: AOAM531R4j4J1Mk9skfjznkI+1KZjL7Sqp4F+umXc5vLpF7sGrT2EQRE
 swJTHza2hA+WTKQmcq2cI9Q=
X-Google-Smtp-Source: ABdhPJzqsIsQlmS7qLGltRQKqFMpDdbkzivkAz1AEn1u3VBA1G79oSi6CKqd4i91UMbldo41UQALVA==
X-Received: by 2002:a17:902:6bc8:b0:13f:8a54:1188 with SMTP id
 m8-20020a1709026bc800b0013f8a541188mr20653784plt.49.1635232305690; 
 Tue, 26 Oct 2021 00:11:45 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 00:11:45 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 26 Oct 2021 15:11:15 +0800
Message-Id: <1635232282-3992-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 hugues.fruchet@foss.st.com, llvm@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 03/10] ARM: dts: stm32: Add DMA2D support
	for STM32F429 series soc
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

Add DMA2D for STM32F429 series soc.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 8748d5850298..1d8be5e7c8b8 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -743,6 +743,16 @@
 			st,mem2mem;
 		};
 
+		dma2d: dma2d@4002b000 {
+			compatible = "st,stm32-dma2d";
+			reg = <0x4002b000 0xc00>;
+			interrupts = <90>;
+			resets = <&rcc STM32F4_AHB1_RESET(DMA2D)>;
+			clocks = <&rcc 0 STM32F4_AHB1_CLOCK(DMA2D)>;
+			clock-names = "dma2d";
+			status = "disabled";
+		};
+
 		mac: ethernet@40028000 {
 			compatible = "st,stm32-dwmac", "snps,dwmac-3.50a";
 			reg = <0x40028000 0x8000>;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
