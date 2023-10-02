Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AB67B6C72
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 16:54:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB201C6C839;
	Tue,  3 Oct 2023 14:54:44 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C52F1C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 18:09:32 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-775810b032aso5662985a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 11:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1696270171; x=1696874971;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=enn49m+u5BPouPPBFnWi7pFBr5eL70bjzUn/Jw/Gb7Y=;
 b=J9PZ3A9z7lfG2Bvvr/OsG9OwM3b7COgrzZEkeseAgURPYBOYH00NilCG4FHTla6KZw
 G+2Yj1PQbuK7+O4EzRequylwUKl41CTPpB7m0dhCluD8uc049RCPThfVGTmGXH9Wk+MW
 BStyoxgMlWy5E7O7p5wVMd9VZzXuN+tsi3vBKp/4voOOMru18QLqj5C21oQdgtrOmEBe
 Uop2Lh+3VPg+GA6ZH+2WmMXsmOfd9Prs6E8voI7x7xWOfN7GqLzDz/x+8zwVulKZyBdB
 g7qbiMQa+8XxzgeBKn55JDzt3SCjb3iOtnC/O31/Nm7qZXOtvSrnwuA+xrLfQcwo2pCP
 Z7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696270171; x=1696874971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=enn49m+u5BPouPPBFnWi7pFBr5eL70bjzUn/Jw/Gb7Y=;
 b=jyRb9n6lYpe0zx+AkwwyNqJumDtIoTlgTu9NzAmmAhxTDPBJITfGNyP+9UkgM+sWRp
 4aukONW8cjJZXtLYQFLctnGccWNXqDQ9bn69WH0x420QuwomZt4ls/Gr0jPwwIIET418
 FKpVMNRNue+4ioRQWd/CMr8RHDFTIsObNs1Ggpi9i9w2xeejzmtP/yx4wbC9+tWwbPPd
 1mTyTCPNCuY/j8SEHBacmxzAh3PXoY58HHc7Rn705i/0eZv4cUdH22/+yNh96B0bappa
 Ba3M4yZJ9oC37BRqZeto25shdRXkKYxaeXHGBkXNPriWWfvhX864biG6ojMyxUxhZ0sH
 DujA==
X-Gm-Message-State: AOJu0YzTCKCtDyep1BJHSjPHzbERxNA7k7Lkqw0YBJCOrxEF5GkOwD07
 bVW+i8bCf2wF4o/JrUDPH9MJxAhCa4EXF/ItGgATcQ==
X-Google-Smtp-Source: AGHT+IGbm3hPu5C1IxAYRUSQ0N1W5PEJBkC2q3LNchbtHI/lAgmYwg34UKKjCKKoqU3EXFfTTbBBDQ==
X-Received: by 2002:a05:620a:294f:b0:775:8fcd:3b03 with SMTP id
 n15-20020a05620a294f00b007758fcd3b03mr11795348qkp.3.1696270171210; 
 Mon, 02 Oct 2023 11:09:31 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 w15-20020ae9e50f000000b0077423f849c3sm7390255qkf.24.2023.10.02.11.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 11:09:30 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date: Mon,  2 Oct 2023 14:08:54 -0400
Message-ID: <20231002180854.1603452-3-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002180854.1603452-1-ben.wolsieffer@hefring.com>
References: <20231002180854.1603452-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Oct 2023 14:54:42 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: add pwrcfg clock for
	stm32f4/7
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

Now that the circular dependency between syscon and clock initialization
has been resolved, we can add the clock that drives the pwrcfg syscon to
the device tree.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 arch/arm/boot/dts/st/stm32f429.dtsi | 1 +
 arch/arm/boot/dts/st/stm32f746.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st/stm32f429.dtsi
index 8efcda9ef8ae..7c9a9133cc86 100644
--- a/arch/arm/boot/dts/st/stm32f429.dtsi
+++ b/arch/arm/boot/dts/st/stm32f429.dtsi
@@ -665,6 +665,7 @@ spi6: spi@40015400 {
 		pwrcfg: power-config@40007000 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(PWR)>;
 		};
 
 		ltdc: display-controller@40016800 {
diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index d1802efd067c..cc8177466a51 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -510,6 +510,7 @@ pwm {
 		pwrcfg: power-config@40007000 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(PWR)>;
 		};
 
 		crc: crc@40023000 {
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
