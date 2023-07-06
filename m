Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83305749687
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jul 2023 09:38:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49E86C6B45C;
	Thu,  6 Jul 2023 07:38:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8769C6B45C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jul 2023 07:38:23 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36634pK6012110; Thu, 6 Jul 2023 09:37:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=leUMqDJp8a4kVVlHQjIs5kBdTGi6ve5jmuhMSLqDE2A=;
 b=ubI37ovG2wEs4vOgesIDYAeOBeSrQIQqPQqbXVnp7v6vL110Lp5ZCEPEnKOmVw8Y712G
 sju/adoVPGIlid4zhlyoKma+AWOfEUWAhnx/4felMqH4elnFeq3JiLsuZYeHtKFxrakL
 s+W0kcJSnt3LUEKw6RwJLQ5rda5Q9QWSVPwbCAUeahnTozpTmKQkIUT8CyhynvloTCpf
 eb7f3T25oCTAPskr41DH53eAmcxLfS02x47b27ULmGqDSFOb0oLEbXdxhYPa51jKqXDZ
 zscAzwbvxXeNeZrhy3i66ZNOrguAe7E2nvxkVfG3UQ7ozAqdvgPruhXVUmHUpqKNNpzb kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rnnd49rma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jul 2023 09:37:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 03D4F100052;
 Thu,  6 Jul 2023 09:37:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0D10210F6B;
 Thu,  6 Jul 2023 09:37:42 +0200 (CEST)
Received: from localhost (10.201.22.9) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 6 Jul
 2023 09:37:42 +0200
From: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
To: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Jul 2023 09:37:13 +0200
Message-ID: <20230706073719.1156288-2-thomas.bourgoin@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230706073719.1156288-1-thomas.bourgoin@foss.st.com>
References: <20230706073719.1156288-1-thomas.bourgoin@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.9]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_04,2023-07-06_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/7] dt-bindings: crypto: add new compatible
	for stm32-hash
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

From: Lionel Debieve <lionel.debieve@foss.st.com>

Add a new compatible for stm32mp13 support.

Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
---
 Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
index b767ec72a999..ac480765cde0 100644
--- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
+++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
@@ -20,6 +20,7 @@ properties:
       - stericsson,ux500-hash
       - st,stm32f456-hash
       - st,stm32f756-hash
+      - st,stm32mp13-hash
 
   reg:
     maxItems: 1
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
