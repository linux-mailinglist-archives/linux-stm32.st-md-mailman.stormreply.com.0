Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8698A99C3
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 14:29:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3982C6DD66;
	Thu, 18 Apr 2024 12:29:34 +0000 (UTC)
Received: from e3i51.smtp2go.com (e3i51.smtp2go.com [158.120.84.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84DA7C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 12:29:31 +0000 (UTC)
Received: from [10.86.249.198] (helo=asas054.asem.intra)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <f.suligoi@asem.it>) id 1rxQtM-Dv9DR6-2d
 for linux-stm32@st-md-mailman.stormreply.com;
 Thu, 18 Apr 2024 12:29:28 +0000
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
Date: Thu, 18 Apr 2024 14:28:55 +0200
Message-Id: <20240418122859.2079099-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418122859.2079099-1-f.suligoi@asem.it>
References: <20240418122859.2079099-1-f.suligoi@asem.it>
MIME-Version: 1.0
X-OriginalArrivalTime: 18 Apr 2024 12:29:23.0610 (UTC)
 FILETIME=[0B8D27A0:01DA918C]
X-smtpcorp-track: 1rxQtuDv9DR62d.mcmpue4G5urqg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1713443371; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=beW9HQTGOr0BFT9gN6HwTnSdPZIL/FVSpOfiqm6uGb4=;
 b=Nj1kZZNLt+uXOmQeqiLdjyaoJUhos6oa522ySIWZ8fKlrylDn98+hfxSPeFg0gF46BK9a
 4t985XYUxzjSPECgyh8s1QcpPLIt7nB91NXSJK55Zl92qQpDhT2fW2D+7Sg9+PTsZ4ncnMQ
 pfBiRKHx29ooj0p+xNKtWDcUemfP3nqCy/ISh78Bd74e3r9VS3OkNjNiUl2OX8+Z9AG9Nmm
 ZyHotfRvwg2zhhbTj27bYCTnT9XAoq4iM171ys6evKi8zGjvDKfpgWYZDlRcl5UkwgWTUvm
 HAy6qqU5djS08iFNgbGitsPhe4yQNBePYFhoR2lwU2stCnCLdCIkrz7Yemzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1713443371; h=from : subject : to
 : message-id : date; bh=beW9HQTGOr0BFT9gN6HwTnSdPZIL/FVSpOfiqm6uGb4=;
 b=Jm3dakOdV6JcRqD+9GpC0uBibtrGKixzUahVhzEXnFIDxkygaTEepSDhludCGr6L4dmO8
 q6ouk+Ywg6x12FIvuXfTSVE6VI8JoeH74IeHpolxbdn1ioNMZLbxSnW4pKhLYHkPZ/Pbiwj
 zNjKHKv8Q2UlcH+zBzFVKNm5p94Y7JRnn7HMdiNySAwG9jmjus0tjE5AYjbUEEblK6q24xJ
 taRWgSxXumJ1bOVQSeTj0Ejg/jLXxLW6xB6qLcWaumxLtzvQArJ9mszbVjEl0+uhp/N50iF
 7BlIDBNIHWLHqukH4uj3BXzlP9uSRUmTLJ4RTxORgDsx8iL4XkBbho5QSXWg==
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-msm@vger.kernel.org, Flavio Suligoi <f.suligoi@asem.it>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/5] arm64: dts: freescale: imx8mp-beacon:
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
 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 8be251b69378..34339dc4a635 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -106,7 +106,6 @@ queue4 {
 
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
