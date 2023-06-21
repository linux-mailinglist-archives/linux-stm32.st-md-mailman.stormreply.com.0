Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D05738275
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 13:56:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24E2BC6907C;
	Wed, 21 Jun 2023 11:56:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 908BEC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 11:56:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35L9Sdb4029657; Wed, 21 Jun 2023 13:55:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=6Y4rx4Xj5s3qtyBRS58Z8cPaCYz9f9KZEBVnJjkIz3k=;
 b=4VzIOh9uyiQgK/LY3cMVMb8WnOm2daHpGDHP0dD7wjecbSEuwxH07pmdO/18RaqjtwoG
 0LHx0mieRzrLdKO3QWoZqp0L9qb/hnkkLREnbGowxACAXwaLM7Wo3q3RX37vuZROlxS9
 xIKZrjvqPHUUNCVUysDOavqA/A3c6d0bZMpWRJFzuroumkMVDynh7Q+61fBWL+Dtz/TT
 jREbpa8165XbqMcB7vSSaxQrU5nM/gMJOeyqYqF3g9vBtyW2zpphIiosDCn3t48192FJ
 sOEetlIBPzbGsasbHdtBL300yBXcbaBzok9cvZmpA6bC8bBWIm6FQ+SYecIK8ewagMiH Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rbrtgbmk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jun 2023 13:55:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1A6110006B;
 Wed, 21 Jun 2023 13:55:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB5B7235F39;
 Wed, 21 Jun 2023 13:55:55 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 21 Jun
 2023 13:55:55 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
Date: Wed, 21 Jun 2023 13:55:23 +0200
Message-ID: <20230621115523.923176-3-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230621115523.923176-1-valentin.caron@foss.st.com>
References: <20230621115523.923176-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_07,2023-06-16_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] spi: dt-bindings: stm32: do not disable
	spi-slave property for stm32f4-f7
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

STM32F4-F7 are, from hardware point of view, capable to handle device mode.
So this property should not be forced at false in dt-bindings.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 Documentation/devicetree/bindings/spi/st,stm32-spi.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index f1c86e694af1..9ca1a843c820 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -27,7 +27,6 @@ allOf:
     then:
       properties:
         st,spi-midi-ns: false
-        spi-slave: false
 
 properties:
   compatible:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
