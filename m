Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 015483AAACF
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 07:18:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84244C597AF;
	Thu, 17 Jun 2021 05:18:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C249C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 05:18:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H5GOY7012622; Thu, 17 Jun 2021 07:18:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=cKOxNgfRpQTaTDcU09CJ9+c+Vza1nWkUrMA2FzJj6hM=;
 b=48mJ1TW9E/fCMZUvOY5LdAhzr9ooOEn0bh+popP5Euwr1lsrv7Ajw3uRT3lM4UtfzzPm
 maoKkjiRHBC+aDoEggVmuchGQ8ZpQvIC4gG0MlcMyvnfWksDxVvNwJDgka54dkUZhXRY
 mO7VcXLbaWqeAYCu4givAKuugHdgqk2INl5Z09HSpxRVCl+RfOz7hsTixaXyikIIDxbM
 D0g0LjzgpO90KwzMuGUQeOqWnbbh6Q8Id6VMJ+wIKJ9oBAcaovAo9iEtBzWHIkvBt5CI
 BZuN6JfWKs7KHutyJKEtgZ7XE+Gfa5wBbO13YVkpWp8nr22Xw8Y259QX+FObR9STbtPb eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 397mmvatk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:18:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B932100034;
 Thu, 17 Jun 2021 07:18:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 39811211278;
 Thu, 17 Jun 2021 07:18:27 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun 2021 07:18:26
 +0200
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Etienne Carriere
 <etienne.carriere@foss.st.com>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, <marex@denx.de>
Date: Thu, 17 Jun 2021 07:18:13 +0200
Message-ID: <20210617051814.12018-11-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_01:2021-06-15,
 2021-06-17 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RESEND PATCH v3 10/11] dt-bindings: clock: stm32mp1
	new compatible for secure rcc
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Introduce new compatible string "st,stm32mp1-rcc-secure" for
stm32mp1 clock driver when the device is configured with RCC
security support hardened.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/st,stm32mp1-rcc.yaml          | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index 4e385508f516..8b1ecb2ecdd5 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -54,7 +54,9 @@ properties:
 
   compatible:
     items:
-      - const: st,stm32mp1-rcc
+      - enum:
+          - st,stm32mp1-rcc-secure
+          - st,stm32mp1-rcc
       - const: syscon
 
   reg:
@@ -71,7 +73,7 @@ additionalProperties: false
 examples:
   - |
     rcc: rcc@50000000 {
-        compatible = "st,stm32mp1-rcc", "syscon";
+        compatible = "st,stm32mp1-rcc-secure", "syscon";
         reg = <0x50000000 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
