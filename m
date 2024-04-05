Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AA489C765
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Apr 2024 16:48:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84C70C71299;
	Mon,  8 Apr 2024 14:48:27 +0000 (UTC)
Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF2C0C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 15:29:25 +0000 (UTC)
Received: from [10.86.249.198] (helo=asas054.asem.intra)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <f.suligoi@asem.it>) id 1rslV3-wSFIBV-2M
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
Date: Fri,  5 Apr 2024 17:28:00 +0200
Message-Id: <20240405152800.638461-7-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405152800.638461-1-f.suligoi@asem.it>
References: <20240405152800.638461-1-f.suligoi@asem.it>
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0798 (UTC)
 FILETIME=[FC7B6060:01DA876D]
X-smtpcorp-track: 1rs_V3wSFmUV2u.EuMjjfTv1CKZn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330965; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=ZlqPPXH5bNJhEltSGKCBrMvzg4Eqwu2ZB1ba92tVMY8=;
 b=zF7pBqSqGW+kB9P9sF055wEhQq0TjeggiNC7BcLrsxtYTZde7iDmhpMhpS941bDQ9YUGj
 NLUp5sa8iHCnxQjpyF65KM6SxZn1tX93pia3LIqo/vFtXJ7bWrdzHHHXD0CcbIXY656c8oS
 YuPxNptyerCirV0nfMhdcTppZZyGQ0gZO5+OdwFmYMmj1GH+cO+7zTCQKenODtCmjo1AJiJ
 hhVp0wt+VgdS69kH9Yrrj9/fJy1xzDQQ4UtU/wLRlM7t3dMg4miXAT9yhYR3ybo+klhwFrd
 Ok7CLod7g+7j6QtnnLySLFyEA+CidqREODuCDmNMzhKX1LnqKPnpP+jwGaoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330965; h=from : subject : to
 : message-id : date; bh=ZlqPPXH5bNJhEltSGKCBrMvzg4Eqwu2ZB1ba92tVMY8=;
 b=MuVReDwfTcjcZLA9EHz9nDNDwiYtxLxNhWxt9KVo7iepl2B4BcNQKb8Te7S5v3WGOkXnu
 hl1eNd92Wtk/KaS4JirzbHdoTLmaqmype2IQxCQu0s3zNDPdDpS5DMLe3LKm+2TveMziNnA
 Z0+kq+P3cYqtsHc+5P7lJXWdeZn3gNE2bDsMxvPCV3QGBUgRpKXp5S9mbze69MMHeo8NrJ5
 D2mPwNWYTlV5TlwDfbEsrFTBkBTw3cuZhENz4p/64umnN5QBzPGtiKTGuz+uSM9r7nKs8oy
 zzPXLmLCk9i6ir60hbU/Fdb4obLhE9kvcqVed9/pOXJ1joScEOdMCfoGqP+w==
X-Mailman-Approved-At: Mon, 08 Apr 2024 14:48:25 +0000
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Flavio Suligoi <f.suligoi@asem.it>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/6] dts: qcom: sa8775p-ride: remove
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
