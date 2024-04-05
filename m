Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C941C89C761
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Apr 2024 16:48:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46ADCC7128C;
	Mon,  8 Apr 2024 14:48:27 +0000 (UTC)
Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F297C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 15:29:05 +0000 (UTC)
Received: from [10.86.249.198] (helo=asas054.asem.intra)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <f.suligoi@asem.it>) id 1rslV1-wSFIBV-00
 for linux-stm32@st-md-mailman.stormreply.com;
 Fri, 05 Apr 2024 15:29:03 +0000
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
Date: Fri,  5 Apr 2024 17:27:55 +0200
Message-Id: <20240405152800.638461-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405152800.638461-1-f.suligoi@asem.it>
References: <20240405152800.638461-1-f.suligoi@asem.it>
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0385 (UTC)
 FILETIME=[FC3C5B90:01DA876D]
X-smtpcorp-track: 1rs_V1wSFmUV00.EuiAjfSRHVa48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330944; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=5jJHGZta+4HpJK5sG35qXkW6G+1lFaAs7ITAMPwZI1s=;
 b=LPsjuZL5DPsVtR/g7cCyZNSnZ++3TpdXBtN8XJMJoTY8ohqqQZWu92+V63yOaVhlG6YK6
 XVzBLLahyllexrcr916gwdRRuvLQ4OrLXYZpkUL+6slCULnMKDVtQoOKSBszPH0FQXUnSTj
 RCnxGmSDKPMv1lClCiTsbcudVwOAVpwfuWNif1RusY4W2hDvFG6aG3TpEt0/kj9Wc4Xm4MN
 lsw0+cfkBT9tyZc0K3Cw8PMB9P2zpgzq1f3O1jpNO5QfaPgLsPbS6xJ9F/lvOKqZstwtwIS
 W/McrnxR4TV7KY2qbEtFEa3K/4gFJWHjR/6wVe9bcA+g7lyqG+UiIOfxx1Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330944; h=from : subject : to
 : message-id : date; bh=5jJHGZta+4HpJK5sG35qXkW6G+1lFaAs7ITAMPwZI1s=;
 b=PamySyuJIONXOv4K4Ic1UV258nObi+3vVPH3HHrsvCzvu/kCGOfkbp769VuM9V72WYvOk
 Bj4VcdCpURakZVpCKAN5d+7TD0a1YldTxUxqVUIxVo0pw9MnZW6jV3FjqmXAAO+6ObHifvp
 eu0beg4Qk4jpL9j0EjlKAvXVNSNEdO2Obua7Je9b0tSS24zlAE9lmi60SC0YKwS6XGbCw7W
 h9RmWpNGc8SNMn8qdiUfo2Pot/1nK32RV+0JDte7Z3tkrUsG0ZX2WuKlmUpobCKtDQeEkuO
 1X6ypvjRO3UsLOzJX3yUCSvTUChMNpHylXOcWNJ0Tekco6RsiKgoDnwSv16w==
X-Mailman-Approved-At: Mon, 08 Apr 2024 14:48:25 +0000
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Flavio Suligoi <f.suligoi@asem.it>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/6] dt-bindings: net: snps,
	dwmac: remove tx-sched-sp property
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
 .../devicetree/bindings/net/snps,dwmac.yaml        | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 15073627c53a..21cc27e75f50 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -328,9 +328,6 @@ properties:
       snps,tx-sched-dwrr:
         type: boolean
         description: Deficit Weighted Round Robin
-      snps,tx-sched-sp:
-        type: boolean
-        description: Strict priority
     allOf:
       - if:
           required:
@@ -339,7 +336,6 @@ properties:
           properties:
             snps,tx-sched-wfq: false
             snps,tx-sched-dwrr: false
-            snps,tx-sched-sp: false
       - if:
           required:
             - snps,tx-sched-wfq
@@ -347,7 +343,6 @@ properties:
           properties:
             snps,tx-sched-wrr: false
             snps,tx-sched-dwrr: false
-            snps,tx-sched-sp: false
       - if:
           required:
             - snps,tx-sched-dwrr
@@ -355,15 +350,6 @@ properties:
           properties:
             snps,tx-sched-wrr: false
             snps,tx-sched-wfq: false
-            snps,tx-sched-sp: false
-      - if:
-          required:
-            - snps,tx-sched-sp
-        then:
-          properties:
-            snps,tx-sched-wrr: false
-            snps,tx-sched-wfq: false
-            snps,tx-sched-dwrr: false
     patternProperties:
       "^queue[0-9]$":
         description: Each subnode represents a queue.
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
