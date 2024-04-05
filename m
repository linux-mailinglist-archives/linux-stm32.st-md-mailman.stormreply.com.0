Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3737D89C766
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Apr 2024 16:48:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73530C71297;
	Mon,  8 Apr 2024 14:48:27 +0000 (UTC)
Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E08A3C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 15:29:24 +0000 (UTC)
Received: from [10.86.249.198] (helo=asas054.asem.intra)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <f.suligoi@asem.it>) id 1rslV2-wSFIBV-0I
 for linux-stm32@st-md-mailman.stormreply.com;
 Fri, 05 Apr 2024 15:29:04 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Fri, 5 Apr 2024 17:29:01 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri,  5 Apr 2024 17:27:57 +0200
Message-Id: <20240405152800.638461-4-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405152800.638461-1-f.suligoi@asem.it>
References: <20240405152800.638461-1-f.suligoi@asem.it>
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0558 (UTC)
 FILETIME=[FC56C160:01DA876D]
X-smtpcorp-track: 1rs_V2wSFmUV0m.EuMUjfTIWR19u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330964; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=oi48LbG1I/VP5W3WKG7O4Eeo5cePw11MKZR9VfWSCRk=;
 b=f4XA7mRJ8pXS/gozWgJi8unGfQE7qFo9J5Jcu557rRl6G+J9C+C2dRrV9oqLy/AWbhmOX
 A9OxEhq07BgPzYCL6Aaw5bBMfTL4q5mshlKDSuPOFlebt2o5LlXDjxZswQOrBgnfezlhsNf
 p6mw2iuoy9O6fW8rm8eV5Bf7mKLCbvfFiWm2PCrHEoBBNORXgpT0n1tdPWmFQ+qrBBUIvc0
 NbDpesw9iTmDY6NFcz/oOWZ1l3vxBnnzR+g/xuUQXvy+TTh8zo+s6uk5x2FR+5hMr3YBjta
 ZMKvMoAqyhN97zY24zK/4ac9leAsbUHjscet0527ZeDYJhACyzp7qDmZDhdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330964; h=from : subject : to
 : message-id : date; bh=oi48LbG1I/VP5W3WKG7O4Eeo5cePw11MKZR9VfWSCRk=;
 b=KhiriRtfGXeM9Bd1OgdIvrDBj5S1GD4EoTZxJqAzGJi85yYUi4KbKP1F2SKlk0QWG9IBS
 cYHMuNTV2ZCkg7vtcSI2sOnGvB1k3/qUD15iQkmKM+eDAO4dScaMMfkMCuU1IlW5XpqA2px
 NUqba8buZaOt7hNwlYFPIOy4kTagGRUMGKs0V9wrgED216pptTWu1PSwrg269RLzvcI8+R8
 xhB+jvCVbpKUWC0IqKrHOX5AUv0otfnJxW/WpBqkJaovIWLS+p8qKcqpvV8HitWB4R/2rkk
 o30JbLZfX9OLIdSKgh/49t4LtY0BweFuCAb7UEuyGismnhqkCIw6WdH8Qxqg==
X-Mailman-Approved-At: Mon, 08 Apr 2024 14:48:25 +0000
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Flavio Suligoi <f.suligoi@asem.it>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/6] arm64: dts: imx8mp-evk: remove
	tx-sched-sp property
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

The property "tx-sched-sp" no longer exists, as it was removed from the
file:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

by the commit:

commit aed6864035b1 ("net: stmmac: platform: Delete a redundant condition
branch")

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 8be5b2a57f27..bb1003363e3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -251,7 +251,6 @@ ethphy0: ethernet-phy@1 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <5>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
