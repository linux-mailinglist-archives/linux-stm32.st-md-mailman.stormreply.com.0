Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4E79BBB67
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6A54C78F79;
	Mon,  4 Nov 2024 17:18:37 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCE08C78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:23:59 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3807e72c468so244933f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233439; x=1730838239;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQnRaKE3CWs3EWJZg8TyJXymOuu8Xu8+zwME5vygCHY=;
 b=MebCgo2PZ3zhCETMMhChuvMQa+q/9fyWQIwJqIJ7bo7h3ftqz1EV8E3HwRXolokWJa
 3kzZfzR11WykwBu555OqwhMofF1Mqcwk2unvbgCSQ5b4piK+tZe+kWeIKF5FftKUBqHd
 30L3kl1jqm5am2PXymRcSpW7zWCe5oD5ZZBry4vNBNdui/15qjvcCYxzH3JsMMdQF8gT
 2QUjO+r39Inka46HiyMfspQ3XZ1ljZX1mPlXbfbOFcViNW8uePWCUjG1eEiPwufc52Cg
 M/t3FiV9BBws5QtcBqp9IwIEOAh5CX+FPfwj+SnN3lDnqe/KJ5utMrcUb5Yq4Wr31748
 03UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233439; x=1730838239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQnRaKE3CWs3EWJZg8TyJXymOuu8Xu8+zwME5vygCHY=;
 b=UM7YnBNMfyvr4AI5lTH2lcPoxjtX1oxv1IR2qBsuFxVhVYF69D/hiuDWPbeaKykW/t
 GB+dG4uhzoI1wtDaIECksKEfpAbV8Sc5NR4FCfvkAehQYTGD7DBsi0SmBt30gdHa1yoR
 wYELhScrwsM7+PtenmW7ckBCwsakfWw2fAPCg/s+4mT3b+fHkkguTTBtIiwNGwOuuK7M
 PWat2/UTr4y23HnxawSmil6ZlOQkIt2jjZU3Qoh7m1UmunTQxZINSpXJShKg9OvK4/HI
 tGSjeCwF2trKrXMWJcpn9vvWBRbOkkyA6ZFSU51VUb+5RBw2Le/LPEPx12jyGJnwtD5b
 QmEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvuvYUalJrv4VfKalRizxsEXX8oTrBJ9qdatIMsoQ/dBPsopzTX90Lo+SzLcbvo7bWg/Cn0BrrNIpQfQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzqy0u0Et4bydFEhtmAoRjg+sdLGSehoRO105h7x9S2kft97p8q
 JcLKgDaaTGWGP542aRKJE9NGgp8I/F8C3rszHgHrS/V8djEAKYDq
X-Google-Smtp-Source: AGHT+IFiCWzYB+aEmSCBowk9yZWznrjM4cZYnTvHKYnqO8xrzv6uwlDNRcSX/uRWMq3BlsdvGSQiQA==
X-Received: by 2002:a05:600c:19c7:b0:431:5632:448d with SMTP id
 5b1f17b1804b1-4319ad76115mr50108665e9.9.1730233439113; 
 Tue, 29 Oct 2024 13:23:59 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:23:58 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:30 +0000
Message-Id: <20241029202349.69442-5-l.rubusch@gmail.com>
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
Subject: [Linux-stm32] [PATCH v4 04/23] ARM: dts: socfpga: align fpga-region
	name
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

Binding and setup expects to match fpga-region instead of old naming.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi         | 2 +-
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
index 01cc5280f..1562669b3 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
@@ -87,7 +87,7 @@ pdma: dma-controller@ffe01000 {
 			};
 		};
 
-		base_fpga_region {
+		fpga-region {
 			compatible = "fpga-region";
 			fpga-mgr = <&fpgamgr0>;
 
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index aa0e960a3..90e4ea61d 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -80,7 +80,7 @@ pdma: dma-controller@ffda1000 {
 			};
 		};
 
-		base_fpga_region {
+		fpga-region {
 			#address-cells = <0x1>;
 			#size-cells = <0x1>;
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
