Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B256977EC
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E19E8C6B443;
	Wed, 15 Feb 2023 08:18:43 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E52B3C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Feb 2023 03:19:01 +0000 (UTC)
Received: from localhost (unknown [86.120.32.152])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 80E466602127;
 Sat, 11 Feb 2023 03:19:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676085541;
 bh=XW8rElFUTfgsJr1jtp6+bs1URQt5kqLzyalOrXtwnI0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QRSffU9SmuyvwYAm+UPE3h0oUhI+XYMgdzYG7GG38kA0e0174udJj1lzuUqTkTAW5
 jJqKpWZ512dZgilIhNYQiB72no9UdbhJKRDCSU+ckWSBhW0NyvxAjkvC/8C0qyxK8e
 LFdZngHPm/fTyHwN8rONF8yB2RvwxPnTtwxTtIX0QoVsGCCr0dbtGF72hVIEcMJBlg
 83PRBJ822Q2NEowQn1EwN4+L4YRQG/ZPxscIT5XhGFC3xtO28HnnVxnIF++/evL3/Q
 lh9cxBQYChoB2YQUfa+g1a6o/IwTo8CgvVaThXXaQszH7k4cp8oHKUD7aRoofocVQi
 egZmlE6B9+bnw==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
Date: Sat, 11 Feb 2023 05:18:19 +0200
Message-Id: <20230211031821.976408-11-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:41 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 10/12] riscv: dts: starfive: jh7100: Add
	ccache DT node
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

Provide a DT node for the Sifive Composable Cache controller found on
the StarFive JH7100 SoC.

Note this is also used to support non-coherent DMA.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 7109e70fdab8..88f91bc5753b 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -32,6 +32,7 @@ U74_0: cpu@0 {
 			i-tlb-sets = <1>;
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc";
 			tlb-split;
 
@@ -57,6 +58,7 @@ U74_1: cpu@1 {
 			i-tlb-sets = <1>;
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc";
 			tlb-split;
 
@@ -116,6 +118,20 @@ soc {
 		ranges;
 		dma-noncoherent;
 
+		ccache: cache-controller@2010000 {
+			compatible = "starfive,jh7100-ccache", "cache";
+			reg = <0x0 0x2010000 0x0 0x1000>,
+			      <0x0 0x8000000 0x0 0x2000000>;
+			reg-names = "control", "sideband";
+			interrupts = <128>, <130>, <131>, <129>;
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <2048>;
+			cache-size = <2097152>;
+			cache-unified;
+			uncached-offset = <0xf 0x80000000>;
+		};
+
 		clint: clint@2000000 {
 			compatible = "starfive,jh7100-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0x10000>;
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
