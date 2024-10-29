Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B79BBB6B
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03270C78F83;
	Mon,  4 Nov 2024 17:18:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB7E3C78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:06 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43160c5bad8so6248875e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233446; x=1730838246;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QbnDXxocaCyheHFI8hTECOWKPKoXgfCmEGz3dctI1es=;
 b=IpwMUfBS18bQrrwvMNhTGWu7fqJFCEMgfmEAm3MnvQerHiOl/U1zPeZloYdQUYDCAa
 N2rm7N7wFtLzA0DD1aiYZHVuelNHSipykjlb6taOB10EtwsAZkwt7CYHXib8Vbix4X8f
 tGOJg+a4UacFSipXlQ0D3l+YmS4v88gTygFErjvW3U8YghGAIQPLr4OmhcDxP61UXvQk
 xvJu4ffVNRo9yaue5WfF/MIs+LTMoucSFQ/9KKiHhzOK7uizbon4UblVA47mPmqlF1XQ
 NAZuJ1nmBcSDrk4GcAJbo7Zbyj9OLiWjNMRD+yI7YyBkBPVmxI3JKhCDY8z4lazHNPhe
 NO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233446; x=1730838246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QbnDXxocaCyheHFI8hTECOWKPKoXgfCmEGz3dctI1es=;
 b=jCeKQuLeAJe92a3t4m/rS1/CoXvaPh9fyfP0lyphJCJCOVbzjIxy4KJNgw6OPYgK9R
 qNG3kGvpE75dyl1pjPgBpqEzWXeR1HrbulBWt1YwvhaeFPdXw0m1SCpjWjxuxTNNIVIx
 HhUmmf2q21DndREpSI5XOi1+l11ooMFJhSYfm1HqZw6NLHGVYGTjv4k3ElBUoFRlqT6+
 lmmKV+jcn+l5pw0YBn2q6j8fsNzDyNzblI0PpccnUzsiFoVqb6UQxUYDCsYlOroXe6Vo
 YreNrB5dlVlDrIUL53taJ0ySuT65ot1JD/MvbZR2rIpMM2GJHm6LprQgOXf1m5UEY9+f
 agjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURm8bWW2GttqweMCR3kzhHdJmKhrIspEN+rCj4DggkjNEIgfKmMjtCxsRp+cT+ayFlesxMmjnnd9Od2g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxy6KLlkcAUKpnNy/Uw/OJHGmv7MTgXolO9lLNjOMzZmSeuE1Uy
 bhaoCsYMimwSaj0Jv2v0xh+sfr0EUrSw+E42rTCLatgq9iLQu6r9
X-Google-Smtp-Source: AGHT+IETpjLLRg+7eXu2VyfPEE1vigfdrCP6sTkEwWApr6Df5/fyHL5jVC/64h7dxa0Nz1OLwcuYIA==
X-Received: by 2002:a05:600c:511b:b0:431:558c:d9e9 with SMTP id
 5b1f17b1804b1-4319ad24126mr50500115e9.5.1730233446109; 
 Tue, 29 Oct 2024 13:24:06 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:05 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:34 +0000
Message-Id: <20241029202349.69442-9-l.rubusch@gmail.com>
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
Subject: [Linux-stm32] [PATCH v4 08/23] ARM: dts: socfpga: add
	clock-frequency property
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

Add 'clock-frequency' is a required property by dtschema. Initialization
is open, similar to agilex devices.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 65d04339f..5f4bed187 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -99,21 +99,25 @@ clocks {
 					cb_intosc_hs_div2_clk: cb_intosc_hs_div2_clk {
 						#clock-cells = <0>;
 						compatible = "fixed-clock";
+						clock-frequency = <0>;
 					};
 
 					cb_intosc_ls_clk: cb_intosc_ls_clk {
 						#clock-cells = <0>;
 						compatible = "fixed-clock";
+						clock-frequency = <0>;
 					};
 
 					f2s_free_clk: f2s_free_clk {
 						#clock-cells = <0>;
 						compatible = "fixed-clock";
+						clock-frequency = <0>;
 					};
 
 					osc1: osc1 {
 						#clock-cells = <0>;
 						compatible = "fixed-clock";
+						clock-frequency = <0>;
 					};
 
 					main_pll: main_pll@40 {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
