Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4F9BBB6D
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D183C78F87;
	Mon,  4 Nov 2024 17:18:38 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15998C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:10 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-37d450de14fso530054f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233449; x=1730838249;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vySvn0PrZ5KmWWRcUjB0f7ffbO3G5ojONpptbAIcwaU=;
 b=KUJS+h5QBOW7k0GtaFwpopOkd2v9cLP0t0v4D9Q3P8qc67nJ6InYZUlYRKL7GT68Ow
 WvsagwiuGiN7+guOx9NNUd8bv52ZwHnxv/+0yarB08FnA6z1QA1loGptY/PQZklaBm3g
 4JbzgO776C/3n3Sa6CceHbPrEmcDULbUbBfzDNtYaFC8FXs/RWnAWdC871ADGMWPdD6/
 ik2oObEgnNWPMzSYxZXpb0m1EPVSsQnIImSnlL4hoIF7H2vLjB/7cncNf3hVnbzMSUaM
 TO8DqZ/ymXA40g3C6lQVhSWzNX8Uqj6cRod0Wl/vmr3DUbDHVJktq78ECpEBNW4XOveZ
 VmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233449; x=1730838249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vySvn0PrZ5KmWWRcUjB0f7ffbO3G5ojONpptbAIcwaU=;
 b=KZI3v8/9+8NwtnANkFIl3N/sCUonypZEjX8R0N0Y7dyQXhZzZPs75zamrAp5smf4ti
 slSiVGBCsnOfv+gAnztvqvuYCi7SPm/zGYqmnK9K5CiVO0TkYSixFxWmC2wqgoZGBo7Y
 8pyY05/I6Lu/YVM+Nb1RsCPO4UwDZ1c8CUGcwF7AZuciR1fW5hvSjOT1i8CkEjnDF+2g
 IKGoJEDev/CY8maXxHNwuFVveKmdfWxlWMMyrYUNNMNBPjtu3iIAKWrKD2fvCTao6vxO
 RcKBQSqo1iokxjN+j4FgVvsIeytVBq35POCWQJJhVy5PpKuEYhbhgi81ZSESKD9MJSa0
 wwsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtoHwDNfkGsl0XLEMyZUuLffV5o7DyxWeap7UAFZFQMuFY1X8ErdAZQ6Xk6zDGZ5hh1dMw2+HdL7yySg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxKi1nff34wa53Oh/GF1p0r+61xo1KaCcE98T35FLCJH/Tqtt7Y
 pcp5h5CGpiERYuQN3WgwBuNM52dV4ali2yNxI124obSuJ8ZUGrwz
X-Google-Smtp-Source: AGHT+IFSpTV0Tj7I6mQHfK9STG9/cLahfdy+XF2noCCt0RfKclZZKLKsVyDf7dEs0S7eg2BUhcBLuA==
X-Received: by 2002:a05:600c:45cf:b0:42c:aeee:d8ee with SMTP id
 5b1f17b1804b1-4319ad4adc4mr46799135e9.8.1730233449432; 
 Tue, 29 Oct 2024 13:24:09 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:09 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:36 +0000
Message-Id: <20241029202349.69442-11-l.rubusch@gmail.com>
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
Subject: [Linux-stm32] [PATCH v4 10/23] ARM: dts: socfpga: remove arria10
	reset-names
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

Remove the reset-names since the binding does not mention them, and they
seem not to be used in arria10 (similarily to agilex).

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 6a2ecc7ed..005c57843 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -818,7 +818,6 @@ timer0: timer0@ffc02700 {
 			clocks = <&l4_sp_clk>;
 			clock-names = "timer";
 			resets = <&rst SPTIMER0_RESET>;
-			reset-names = "timer";
 		};
 
 		timer1: timer1@ffc02800 {
@@ -828,7 +827,6 @@ timer1: timer1@ffc02800 {
 			clocks = <&l4_sp_clk>;
 			clock-names = "timer";
 			resets = <&rst SPTIMER1_RESET>;
-			reset-names = "timer";
 		};
 
 		timer2: timer2@ffd00000 {
@@ -838,7 +836,6 @@ timer2: timer2@ffd00000 {
 			clocks = <&l4_sys_free_clk>;
 			clock-names = "timer";
 			resets = <&rst L4SYSTIMER0_RESET>;
-			reset-names = "timer";
 		};
 
 		timer3: timer3@ffd00100 {
@@ -848,7 +845,6 @@ timer3: timer3@ffd00100 {
 			clocks = <&l4_sys_free_clk>;
 			clock-names = "timer";
 			resets = <&rst L4SYSTIMER1_RESET>;
-			reset-names = "timer";
 		};
 
 		uart0: serial@ffc02000 {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
