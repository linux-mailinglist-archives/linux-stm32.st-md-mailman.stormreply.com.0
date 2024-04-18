Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0828A99C7
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 14:29:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9C10C6DD9D;
	Thu, 18 Apr 2024 12:29:35 +0000 (UTC)
Received: from e3i51.smtp2go.com (e3i51.smtp2go.com [158.120.84.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBE88C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 12:29:34 +0000 (UTC)
Received: from [10.86.249.198] (helo=asas054.asem.intra)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <f.suligoi@asem.it>) id 1rxQtP-Dv9DR6-38
 for linux-stm32@st-md-mailman.stormreply.com;
 Thu, 18 Apr 2024 12:29:31 +0000
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
Date: Thu, 18 Apr 2024 14:28:59 +0200
Message-Id: <20240418122859.2079099-6-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418122859.2079099-1-f.suligoi@asem.it>
References: <20240418122859.2079099-1-f.suligoi@asem.it>
MIME-Version: 1.0
X-OriginalArrivalTime: 18 Apr 2024 12:29:23.0923 (UTC)
 FILETIME=[0BBCEA30:01DA918C]
X-smtpcorp-track: 1rxQteDv9DR638.mcmque4Fq5qsP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1713443374; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=V+1vvwjdWgujcNcq0BbcQl1Gr7TpP6SphXfO1RK3Fmk=;
 b=jcRGHdyIofHSucmMUyQXbBkFkgn6gkVcGDr8uL1dZwUr6MuQAhZjWjCDR9TTE9fbCgvuv
 3jLRyLNwD/D0j0F+GN2zm/b5o29+8gabgk1lTSo4+udFeRv5RuP9rX414ISDfvHxFkFJfkE
 dH/0qiCPnSOab7ErSuzxOsG4KYKyS3sVFKitbXjg9GXI+FvmUASPj60RgHiDVZpL7eSvkxZ
 ZUO2gkC2NWXkwEK/an3BSngnX2rguNZ11gB0poZhUpl5HUT1J0Bq0Frhaih+nv8iXpfk23x
 +8XIRtClYrYcaVm1qFV9Qdivd58693goUqRbioEbSnfzNsJrtk/p9P8Btz9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1713443374; h=from : subject : to
 : message-id : date; bh=V+1vvwjdWgujcNcq0BbcQl1Gr7TpP6SphXfO1RK3Fmk=;
 b=axVDVccjkpsTjhLyGJ8gu/vfWhx0Q/rgmVDLeTNigcITC06hzJjWUGTTrAmshIDw/XMt3
 ratZ1SYwUcUoWFCJbfVPcJKMrlxzLd1mfapWxFJ5DbccbK2PKDt79saDLm4jlldKaqjeO+l
 4X9WX6Pfa44wCcgA3AqT6Q5IKG8s94Gyq0Zt39/tbTB7OTy5WjwtPixeYdI85EGngSMF9ia
 jY68pf4qVRooF1oJfeVKevQVf4xuRfTr8XSYB5K6LvFo1QhG+FgER6GJkbNM+BwPH/hiAjq
 13cbvs434Rwy2GTGcZH+dCwiL1ggh5B8CJ+A+ndoKNUsnsKBgsHcu267lBQA==
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-msm@vger.kernel.org, Flavio Suligoi <f.suligoi@asem.it>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/5] arm64: dts: qcom: sa8775p-ride: remove
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

Strict priority for the tx scheduler is by default in Linux driver, so the
tx-sched-sp property was removed in commit aed6864035b1 ("net: stmmac:
platform: Delete a redundant condition branch").

So we can safely remove this property from this device-tree.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 26ad05bd3b3f..2e1770e07f45 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -334,7 +334,6 @@ queue3 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <4>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
@@ -404,7 +403,6 @@ queue3 {
 
 	mtl_tx_setup1: tx-queues-config {
 		snps,tx-queues-to-use = <4>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
