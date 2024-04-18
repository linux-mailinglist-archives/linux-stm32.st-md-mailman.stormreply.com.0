Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 286F18A99C4
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 14:29:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC03CC6DD6D;
	Thu, 18 Apr 2024 12:29:34 +0000 (UTC)
Received: from e3i51.smtp2go.com (e3i51.smtp2go.com [158.120.84.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 738F5C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 12:29:32 +0000 (UTC)
Received: from [10.86.249.198] (helo=asas054.asem.intra)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <f.suligoi@asem.it>) id 1rxQtN-Dv9DR6-1y
 for linux-stm32@st-md-mailman.stormreply.com;
 Thu, 18 Apr 2024 12:29:29 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Thu, 18 Apr 2024 14:29:23 +0200
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
Date: Thu, 18 Apr 2024 14:28:56 +0200
Message-Id: <20240418122859.2079099-3-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418122859.2079099-1-f.suligoi@asem.it>
References: <20240418122859.2079099-1-f.suligoi@asem.it>
MIME-Version: 1.0
X-OriginalArrivalTime: 18 Apr 2024 12:29:23.0689 (UTC)
 FILETIME=[0B993590:01DA918C]
X-smtpcorp-track: 1rxQtNDv9DR61y.mcmoue4H1m2he
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1713443372; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=fXsxedbQ0ISYSt3uugliVFnw2OGttnVGjhOOYD7fjmM=;
 b=spBrFUI63TDQyLOCP8U1OR7feiDcSW2ohKHRfWsYWFHZmGT33ahOPB5I7fGan63avJyeU
 BhtFB9zXPWQdfoLvaiiLgSlxfBEuWQq7G+mv9G8iRzRKqgYqZQM/2ymgDb/b/6mVnfXlHEb
 3yx+COXDGit2oTNoHooV6UxbyDrljsAt54JLyDAY9HXiE/DB8i/L7zE+arCTHPpIab0AqXG
 mmnd3+qxU9BElx8PEwnw6PiJurzBmqi7g3UeEgNJq8O9LQ7OvmOV66jSW5VZvuGkdRQ47RY
 957M8wL/zfq3KXanUzoeNLpk2kEmnhcMO6LC6B0XhoUDCpAKn1f3B84IvkCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1713443372; h=from : subject : to
 : message-id : date; bh=fXsxedbQ0ISYSt3uugliVFnw2OGttnVGjhOOYD7fjmM=;
 b=aVZsp9cOSNDstbVOO2W6tcBI5NIZSnZc2d6bUdFcp2hjVTnmOKXmhAUAU/2TZ1H8EGt4K
 A8Efhy9xsv+TH1jGzGI4kPSnItY1LaXw/1a8Zc7c5+EtDs5Nl4gxcmMdev3fCoM3TBgEncm
 IFOYwETmVCx2B1QZfQuhKuyHq231usUu8hw7XPTLSdosmj75LPiJByPYC33JyqUIG5+f2hi
 LBdAkLGcJ3SdeWJpIl4KzegZwMQzS4RKBHquuiFg9d8DyX/2n8RGLEP3lNzXMoZJ5isIOO1
 JPSUpkyRphmNIuFG89TiDu6LsqXn5LBkcgBENEg0K63goe/jUQIx0ms2A+Iw==
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-msm@vger.kernel.org, Flavio Suligoi <f.suligoi@asem.it>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/5] arm64: dts: freescale: imx8mp-evk:
	remove tx-sched-sp property
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

Strict priority for the tx scheduler is by default in Linux driver, so the
tx-sched-sp property was removed in commit aed6864035b1 ("net: stmmac:
platform: Delete a redundant condition branch").

So we can safely remove this property from this device-tree.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 9beba8d6a0df..8747c86689cc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -226,7 +226,6 @@ ethphy0: ethernet-phy@1 {
 
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
