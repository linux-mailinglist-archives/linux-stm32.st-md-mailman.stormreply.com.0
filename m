Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7159BBB65
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1FFCC78F75;
	Mon,  4 Nov 2024 17:18:37 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1BDBC78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:23:58 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-37d450de14fso530010f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233438; x=1730838238;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qk9braQhcUfjQhD1zhHgydTWlqcLCgBL7v99PtqcEgk=;
 b=ldcwbn/bLQvncjM7cefWaYdVb02Zc8dKbCiazqGSy4tkZ0kda8rHsT6kiEHgD3BNZN
 uHnE5RoHMgNfLUUH3H0us+xhmklhCFC8YEili0kzn/XLge7KAysn/bNLLGmfwSw5AD6A
 rKZKbP7age/tG+inX8uaKcPhH1pEYLOpDZSTD7Wb1hfMoyKxNwol6FWrKNZn98jtK+Rz
 0sTpkkUTJqJv7tHES6Zwj3UQoeGK6KCJuBy0j6baLtwz6uGRzdLb7DzHqHEEDxkrBDn8
 G7nLb4kOGgw4XPmkTWDUa+TAIBald4KEsMX4f27GwVYRa0sTUmV2ssbeZduFoUxwZIYq
 bcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233438; x=1730838238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qk9braQhcUfjQhD1zhHgydTWlqcLCgBL7v99PtqcEgk=;
 b=hrgf4F2zW0ThLqRMbASDLIu5vXwZOsDzObhpwo1+8hE2mJv5vKfDJoI4/vhbZBHmbn
 FxJYKaOs27a4h30YJb4f2URdiqP7kbxRLho3t+mXdhgkZQTcKPlPmk+u4NUBnjnqU3hg
 lpr90kVBJITSDVEHiEX0HtCiowaUTE5w4Rj/uDVcz/RfGNm1/1xopVZRP5ISpRGrwHzR
 2bHmHRxIpx/HVamQnMqc9sIsLTQTYoUTmEiqBpBLCF/Hd7sD+bpG8cMa3A0nq1QNz/dR
 vqT/GkaQ7GTyKMhrDaWpSzD+Wa7oaNXDGe6MyWHKsDlLaj/Mqt71s3Ykm6A/KNHywsgp
 xLgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOF+8eTL2yN6NMIJtUtRDOf8AWicAXWBioBxEO62eSERrbzt+UGotZOK2AB5I6Vbjvl7d+6774jQ4Jzg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzTpVeSHhbKcnr1GiV4V4MkVqmhUtl4pnVGVt/rNO4x14w5Rd3D
 uv9ze4FACj4+z0r9chqeBECIN1D6h2wuOM1LIZ+ktyUuOHPjuB3Z
X-Google-Smtp-Source: AGHT+IHXKDESh6R0R2pH+YTSOSGmekompPP5kRB3raByIC6HZykFMvR8z13eRdBzBJ15DbPxCjmrrQ==
X-Received: by 2002:a05:600c:1390:b0:431:4e33:98ae with SMTP id
 5b1f17b1804b1-4319ad14ca6mr47168295e9.5.1730233437588; 
 Tue, 29 Oct 2024 13:23:57 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:23:56 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:29 +0000
Message-Id: <20241029202349.69442-4-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 pabeni@redhat.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dinguyen@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, l.rubusch@gmail.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, s.trumtrar@pengutronix.de,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 03/23] ARM: dts: socfpga: align dma name
	with binding
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Binding expects the node name to match with dma-controller.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi         | 2 +-
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
index c7ba1e4c7..01cc5280f 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
@@ -68,7 +68,7 @@ bus {
 			#size-cells = <1>;
 			ranges;
 
-			pdma: pdma@ffe01000 {
+			pdma: dma-controller@ffe01000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0xffe01000 0x1000>;
 				interrupts = <0 104 4>,
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 7abb8a0c5..aa0e960a3 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -60,7 +60,7 @@ bus {
 			#size-cells = <1>;
 			ranges;
 
-			pdma: pdma@ffda1000 {
+			pdma: dma-controller@ffda1000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0xffda1000 0x1000>;
 				interrupts = <0 83 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
