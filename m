Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F57018BF35
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2020 19:19:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D1F5C36B0B;
	Thu, 19 Mar 2020 18:19:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A8C1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 18:19:18 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02JIEBPw006390; Thu, 19 Mar 2020 19:18:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=/NryDuotj7GwNZeRIKiNEE04efcoGmBTQAarcZjEeEM=;
 b=ilA6UgYTk/SDj4tn5Z6fnFBav5jjz1+QPUuhykOWCICXnTQbuN9lCImuGO5mfM74pK5G
 zwHzIGNe8OZtgvP8b5h5uHX0X664bbc8r2oBXBCViIyVq6UU8eCUfmYGPO8UL857euAg
 Gl2bMIbLLfn8BKroKXWRAudQVM0xht+L59+g07dQg8c9X9ox8mDre43QM2mDXwS8j4Ck
 v6Pfv3qj514b276Bct9qyAKQAjVmywK3rRSN3IDEN3TU36uvbU9i3ZJugxrVWoWsB56w
 SGT5h/Ct2mhkqEEqorqZVUL2hJ2XgJY3U4MJC3z/gG+fMxSwKZdKbI9BlZoXv0KbXF4e +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8etkc0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 19:18:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 733AC10002A;
 Thu, 19 Mar 2020 19:18:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3AC7A2A70CB;
 Thu, 19 Mar 2020 19:18:49 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 19 Mar 2020 19:18:48 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <robh+dt@kernel.org>, <jic23@kernel.org>
Date: Thu, 19 Mar 2020 19:18:27 +0100
Message-ID: <1584641907-8228-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_07:2020-03-19,
 2020-03-19 signatures=0
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lars@metafoo.de,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: iio: adc: stm32-adc: fix id
	relative path
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

Fix id relative path that shouldn't contain 'bindings', as pointed out
when submitting st,stm32-dac bindings conversion to json-schema [1].
[1] https://patchwork.ozlabs.org/patch/1257568/

Fixes: a8cf1723c4b7 ("dt-bindings: iio: adc: stm32-adc: convert bindings to json-schema")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
index 933ba37..dd8eb15 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/bindings/iio/adc/st,stm32-adc.yaml#"
+$id: "http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: STMicroelectronics STM32 ADC bindings
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
