Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E14F89C764
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Apr 2024 16:48:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67FF5C71295;
	Mon,  8 Apr 2024 14:48:27 +0000 (UTC)
Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87120C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 15:29:07 +0000 (UTC)
Received: from [10.86.249.198] (helo=asas054.asem.intra)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <f.suligoi@asem.it>) id 1rslV3-wSFIBV-0b
 for linux-stm32@st-md-mailman.stormreply.com;
 Fri, 05 Apr 2024 15:29:05 +0000
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
Date: Fri,  5 Apr 2024 17:27:59 +0200
Message-Id: <20240405152800.638461-6-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405152800.638461-1-f.suligoi@asem.it>
References: <20240405152800.638461-1-f.suligoi@asem.it>
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0719 (UTC)
 FILETIME=[FC6F5270:01DA876D]
X-smtpcorp-track: 1rs_V3wSFmUV0P.EuMjjfTvCqpvE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330947; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=6HGwCVZ1ZliNjksUiz6WB6FukgOBYyF3KdLTYEIBNkQ=;
 b=Bwzxuqu1gMP9aAZginbD4tC8vwh4RRM0EuNrg2LT9rKS5/W4TlFTAIQGcRTlN8l9U5fAd
 IYpIfQlTW4/TMEw71QwfAtKLndWVukuL3GN/ioHU5MHG0/nwX66ni6tJcLrp2Dm61gZzdQB
 ubN93ywF81AVtMpScSYw2TYs3WDyb41jB9KY1r6MI3GbAd/GkC5+hOpbUVU4czAIfsAevCj
 ceU5pUzo3YNu3hbw7GHfOE0A1BSWuICXPdBZ0jvQXy6mJkRUr50M687QgoHT9DEQUNn1FZ/
 jaeuDu58L6p7qgD4HjR4dT4iZElAeymcedCIGpntYW3h3+4vbd6DtWkaUn9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330947; h=from : subject : to
 : message-id : date; bh=6HGwCVZ1ZliNjksUiz6WB6FukgOBYyF3KdLTYEIBNkQ=;
 b=ltGt4Jk3FUdS/luWLMsWvoNhsCBkH+B0RIh51ZArshaizhETiAMiGWpvER0pViVXaM9Yn
 ai5At9O+uKPbDomdEDvm6yMT6v6DAP0PvNPxxE5oIERqSeLJVWy1si/vdPyUV3xbZ8ZjMgK
 CzfuLmT1Mfv4SiXj8UFGtIVpMmmwAbRcABY6c1c20gQF79P2nUc4F9Rh1RxXU7jaWxp10Ph
 UWv8jCGwsdjmuvYGxW4KcaGmZhejPA32zW8r62Voq/b8+/7MSqp0r6x2NiUia2CC2UsNmTo
 i7U2fycfQf2E6qjfUajSanQmWPssW1Kx52sFPLBpdZnQ/f62pJ8wAnxkxdFg==
X-Mailman-Approved-At: Mon, 08 Apr 2024 14:48:25 +0000
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Flavio Suligoi <f.suligoi@asem.it>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/6] arm64: dts: qcom: sa8540p-ride: remove
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
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 177b9dad6ff7..11663cf81e45 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -225,7 +225,6 @@ queue3 {
 
 	ethernet0_mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <1>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
@@ -302,7 +301,6 @@ queue3 {
 
 	ethernet1_mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <1>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
