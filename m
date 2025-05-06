Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A35BAABF9B
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 11:33:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEF27C78F83;
	Tue,  6 May 2025 09:33:36 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 179EAC78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 09:33:36 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4768f90bf36so60556541cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 May 2025 02:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746524015; x=1747128815;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TalyY7f0z8WFpKTCKpbbWsIQgKcxq7l3XWcN5VvgXPM=;
 b=Ofihq4P102rh/rHi3Lhsv9LGexoM3UULccAiwDVALtnILCRWP3k3z8CIGDN2V51h/h
 kgyEh9axE9ZWnJfKnWFoBdamtl6D3pTWXb9vkJKuSkBxpvWQqvz1TAz8ozUYgj8k+Bkq
 JPvEFdkA729lPMT334yRqLBMa6xRht3jIh78uZbBHNQn1GiDEXZyJk4kOdW9OV1kM1iS
 wb8wgwmHvH4t6g2fAeH4tHn2pimhOBhWEXMGduBqKkEsk+hiue3f0dYxvPG4Ny8CSrUg
 EynPZ3vhi3PalJqfLSxfP/6w9VW2EjJnZ/rRTr+EtmKg5vLZgBAiR+P+4gE73CgQ1s8o
 WDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746524015; x=1747128815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TalyY7f0z8WFpKTCKpbbWsIQgKcxq7l3XWcN5VvgXPM=;
 b=hxTTOoJ4IpiqLeObHKSl6ogXN8ZcPwcm0hSnMi19qGqqBNAkABM3CBggaG22SZ8NMX
 gTFVPh1M99G93ilKAb7UQHXI+bzBPUJaMJUSP1aYk+hDPkR9zUCUQnjSLR45QyoE465l
 NLF3ty2Yf2uJyMgLPXp1rZWgXQnNtdJua564uWNg7RV24Ki2uhlj3AeK69uBJtdngBNd
 R8Fnz1mkgZj0aYg+1N7sd2aVZxD7/HUYk+ti64bWJeoqz/q7RJvMoA3IQeuUPSCCByf/
 hqIHwuADrGhBg7CifIsl1IX9DPt7WTWFuAgAEZl5AwidL/QtI/xVp8lJDKDNu7y0yT2J
 lGnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViW6N60/Qusn72khZED+pR4ds7WUcfQJFc+iVJiw4KmlHihbQPb0haMT/YtDk3llHaX1ocvJjiJrhp3Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz9Xk4gdKYDOf1Kc0nfcU/k9pF3M55A6vtX+qy5hpEj/+aJGgaB
 AC/rl3X2kmmAxowSIKvYV/BJdj9aL0QdCLIPpk/6XXKadgiQn0/D
X-Gm-Gg: ASbGnctXdMXDczkqq0VdBQ8SwFK2R8dPy4423GBA10g17yoH2abrpgUl6tLHDa3Pn6C
 U6B7SiNPCz8iMXvOCTlNYzK+qye7ZFn2YM3x0/boyp67qcUFvelhMzTJBsqkK+43BAk215TjgQ5
 UR29YbGJ4oFC4piMEDNtUnuWKGTRcGrexoDOljAbA1JGqUC/Opss7ZYKvGPigCg+HJgsMs9mvvd
 3ZEypIGSV0RHUIgmpiC4JmXPM1bUR57RhJsU6fBCXEYTxPd0osNbIOuRi2iGDcyrnCm91DCQQ2L
 xJwdljHMeMXakzbc
X-Google-Smtp-Source: AGHT+IEXTIp4yFfB4Q9w6fbdseD2o1pqfO5Hhy0H0j3RnKD3vdKl89OZk1qQra91sAFPJlTcnfVM6w==
X-Received: by 2002:a05:622a:288:b0:476:8eb5:1669 with SMTP id
 d75a77b69052e-490f2d813f1mr47198331cf.32.1746524014995; 
 Tue, 06 May 2025 02:33:34 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 d75a77b69052e-48b98721c43sm69901391cf.63.2025.05.06.02.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 02:33:34 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue,  6 May 2025 17:32:54 +0800
Message-ID: <20250506093256.1107770-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506093256.1107770-1-inochiama@gmail.com>
References: <20250506093256.1107770-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/4] riscv: dts: sophgo: add ethernet
	GMAC device for sg2042
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

Add ethernet GMAC device node for the sg2042.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 62 ++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index f61de4788475..886c13cef6ba 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -543,6 +543,68 @@ uart0: serial@7040000000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@7040026000 {
+			compatible = "sophgo,sg2042-dwmac", "snps,dwmac-5.00a";
+			reg = <0x70 0x40026000 0x0 0x4000>;
+			clocks = <&clkgen GATE_CLK_AXI_ETH0>,
+				 <&clkgen GATE_CLK_PTP_REF_I_ETH0>,
+				 <&clkgen GATE_CLK_TX_ETH0>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			dma-noncoherent;
+			interrupt-parent = <&intc>;
+			interrupts = <132 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&rstgen RST_ETH0>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <1>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <32>;
+			snps,rxpbl = <32>;
+			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+			snps,axi-config = <&gmac0_stmmac_axi_setup>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac0_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				snps,rx-sched-wsp;
+				queue0 {};
+				queue1 {};
+				queue2 {};
+				queue3 {};
+				queue4 {};
+				queue5 {};
+				queue6 {};
+				queue7 {};
+			};
+
+			gmac0_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+				queue0 {};
+				queue1 {};
+				queue2 {};
+				queue3 {};
+				queue4 {};
+				queue5 {};
+				queue6 {};
+				queue7 {};
+			};
+
+			gmac0_stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <16 8 4 0 0 0 0>;
+				snps,wr_osr_lmt = <1>;
+				snps,rd_osr_lmt = <2>;
+			};
+		};
+
 		emmc: mmc@704002a000 {
 			compatible = "sophgo,sg2042-dwcmshc";
 			reg = <0x70 0x4002a000 0x0 0x1000>;
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
