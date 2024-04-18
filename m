Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 249AB8A99C6
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 14:29:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF6A2C6DD9B;
	Thu, 18 Apr 2024 12:29:35 +0000 (UTC)
Received: from e3i51.smtp2go.com (e3i51.smtp2go.com [158.120.84.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DDB3C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 12:29:34 +0000 (UTC)
Received: from [10.86.249.198] (helo=asas054.asem.intra)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <f.suligoi@asem.it>) id 1rxQtP-Dv9DR6-0b
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
Date: Thu, 18 Apr 2024 14:28:58 +0200
Message-Id: <20240418122859.2079099-5-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418122859.2079099-1-f.suligoi@asem.it>
References: <20240418122859.2079099-1-f.suligoi@asem.it>
MIME-Version: 1.0
X-OriginalArrivalTime: 18 Apr 2024 12:29:23.0845 (UTC)
 FILETIME=[0BB10350:01DA918C]
X-smtpcorp-track: 1rxQteDv9DR60P.mcmque4FpxA7o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1713443373; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=KyzVo69ICVJHxwsHXC+wYoJ2MHvwOdDQY4E0c7AHxy0=;
 b=bwJqNPUAzd2BuzYEW4uwrxRWOJ/1WIEzzkac52o/52tVsWVToHzMVB/8Rk8cYF7xOlQIt
 ueC9GURBdYZDaH+cRI9lNa16aQEiYRMLczXzRcBBumlcYr7xK+yy2PZjH74Q0WbCNbymBW1
 DcBx313xgvB9sjCgj3kIC6Vnq8ideU9C3uZplSN6bq3vdN9DDMSYCgHmE/KsfFrCaVzm28j
 24GFx3hLO6k4BKLugT8ksV0S8hBr9+HODUvee+gaI2Ix8hxjNq7tU5h+xW7tU4SyuNvHhf7
 ZNQ5ROTwjEHQhmzTCqmh72r2tUd81AS1slcZrJ5vDH/XnfYJ0B5IoH64q/Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1713443373; h=from : subject : to
 : message-id : date; bh=KyzVo69ICVJHxwsHXC+wYoJ2MHvwOdDQY4E0c7AHxy0=;
 b=RRFOGmomD9qXjs0Ivn9pnJjSHUjxguXmYTJcdYGSiWJS+pT1c1gs6xf/GdabPVb2rMDTj
 9/KvwUJr54a0+lzGkAAJqvzQdPRbQXC3XuvU1ipbj4MsCDKzptIfPsGtP7Cqj0VTHT+TdLV
 Mek8y5ypSiS/YaF21jDFTBzQ48n5GrPjhJPXljygdOj9nTfi26C8nRgzNV9kiMqLVHpxT8d
 E7oCu2wlvMq/5u4HNEgmhNOEbyifHR6GbWq/+5V7wnSxHoW4DbXiwdq4b4Bht99jF/Bjiit
 n9uvYVcAHvZBhgS71Qav+oAnRdVQ7aXQeCs2H2HArmE574txBji9WfmoXqDA==
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-msm@vger.kernel.org, Flavio Suligoi <f.suligoi@asem.it>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/5] arm64: dts: qcom: sa8540p-ride: remove
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
