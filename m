Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A2C11C361
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2019 03:42:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43257C36B0B;
	Thu, 12 Dec 2019 02:42:16 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2534C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 02:42:12 +0000 (UTC)
X-UUID: dbebac3d474c4adf8342a6dc070e59d7-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VDJkFfjQ2A7EK11jJQUQ+/nDT660s5v+Di1gVGNcQ80=; 
 b=XM2eXN50fH9j2JUNXqxJH0wn5y6GFhzQqRoDcacXkOkr0RimKdKu+gXqxGf/rnWfO3xEY50jcJjcNx57n+CAyzOcxYvViPuYy9dwsnVnV/e4C4ojKPtiXgwn3DowQBUQAeq9kOTv5ODIYxnJQl+c3ZFtA6ygftPYMpAK5h37kTg=;
X-UUID: dbebac3d474c4adf8342a6dc070e59d7-20191212
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 460475510; Thu, 12 Dec 2019 10:42:11 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 10:42:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 10:42:05 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 12 Dec 2019 10:41:45 +0800
Message-ID: <20191212024145.21752-3-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191212024145.21752-1-biao.huang@mediatek.com>
References: <20191212024145.21752-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, yt.shen@mediatek.com,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] net-next: dt-binding: dwmac-mediatek: add
	more description for RMII
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

MT2712 SoC can provides RMII reference clock,
so add corresponding description in dt-binding.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../devicetree/bindings/net/mediatek-dwmac.txt  | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt b/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
index 8a08621a5b54..34f692ea0406 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
@@ -14,7 +14,9 @@ Required properties:
 	Should be "macirq" for the main MAC IRQ
 - clocks: Must contain a phandle for each entry in clock-names.
 - clock-names: The name of the clock listed in the clocks property. These are
-	"axi", "apb", "mac_main", "ptp_ref" for MT2712 SoC
+	"axi", "apb", "mac_main", "ptp_ref" for MT2712 SoC.
+	"rmii_internal" is optional, only for RMII when the reference clock is
+	from MT2712 SoC.
 - mac-address: See ethernet.txt in the same directory
 - phy-mode: See ethernet.txt in the same directory
 - mediatek,pericfg: A phandle to the syscon node that control ethernet
@@ -23,8 +25,10 @@ Required properties:
 Optional properties:
 - mediatek,tx-delay-ps: TX clock delay macro value. Default is 0.
 	It should be defined for RGMII/MII interface.
+	It should be defined for RMII interface when the reference clock is from MT2712 SoC.
 - mediatek,rx-delay-ps: RX clock delay macro value. Default is 0.
-	It should be defined for RGMII/MII/RMII interface.
+	It should be defined for RGMII/MII interface.
+	It should be defined for RMII interface.
 Both delay properties need to be a multiple of 170 for RGMII interface,
 or will round down. Range 0~31*170.
 Both delay properties need to be a multiple of 550 for MII/RMII interface,
@@ -34,13 +38,20 @@ or will round down. Range 0~31*550.
 	reference clock, which is from external PHYs, is connected to RXC pin
 	on MT2712 SoC.
 	Otherwise, is connected to TXC pin.
+- mediatek,rmii-clk-from-mac: boolean property, if present indicates that
+	MT2712 SoC provides the RMII reference clock, which outputs to TXC pin only.
 - mediatek,txc-inverse: boolean property, if present indicates that
 	1. tx clock will be inversed in MII/RGMII case,
 	2. tx clock inside MAC will be inversed relative to reference clock
 	   which is from external PHYs in RMII case, and it rarely happen.
+	3. the reference clock, which outputs to TXC pin will be inversed in RMII case
+	   when the reference clock is from MT2712 SoC.
 - mediatek,rxc-inverse: boolean property, if present indicates that
 	1. rx clock will be inversed in MII/RGMII case.
-	2. reference clock will be inversed when arrived at MAC in RMII case.
+	2. reference clock will be inversed when arrived at MAC in RMII case, when
+	   the reference clock is from external PHYs.
+	3. the inside clock, which be sent to MAC, will be inversed in RMII case when
+	   the reference clock is from MT2712 SoC.
 - assigned-clocks: mac_main and ptp_ref clocks
 - assigned-clock-parents: parent clocks of the assigned clocks
 
-- 
2.18.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
