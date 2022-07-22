Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 063E657E201
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jul 2022 15:07:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE000C640EF;
	Fri, 22 Jul 2022 13:07:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B464C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 13:07:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26M9svFk006924;
 Fri, 22 Jul 2022 15:06:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=cw2AD1st0JuNEu+P5TanJG8XAn7GOmY0IA1vt5jOvSc=;
 b=VUWjrAGK2D/FJgQjr81KKp7RIqvI+3GqWZ4x8XEvZPsxnme2Wop+iVg3JMKrvrF/kqDM
 3XAUP6cY0Rzmph++qU5dppvGelfOUd4ISoOqXsVcj6mLeqbCSIgNgRKZF+c39zGTnC09
 mhkMJXUJEdTRRws0qhHaEHD7sJffcuZRfxV0EYDmUTH3CGYIMJ+izRPUujWiqgDs1+Un
 s4odqOG5aO1exwDeINeGhsZoZmegFQDfRmWYnwyUhuhtAta9NxfzVLkFw8ti0C5qAH7G
 Rb67acMhGs0FKLOGEWMWSKb99+8zyh28XLlj1aHMW+Rns2R35jP+lMLCt8EGRIu0fwBg GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hbnp6jxv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 15:06:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23FB810002A;
 Fri, 22 Jul 2022 15:06:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EC46228A4F;
 Fri, 22 Jul 2022 15:06:41 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Jul
 2022 15:06:38 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mka@chromium.org>,
 <alexandre.torgue@foss.st.com>
Date: Fri, 22 Jul 2022 15:05:51 +0200
Message-ID: <20220722130554.236925-2-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722130554.236925-1-fabrice.gasnier@foss.st.com>
References: <20220722130554.236925-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_04,2022-07-21_02,2022-06-22_01
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/4] dt-bindings: usb: generic-ehci: allow
	usb-hcd schema properties
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

Allow properties and usb-device child nodes as defined in usb-hcd.yaml, by
using unevaluatedProperties: false. By the way, remove the "companion"
property as it's redundant with usb-hcd.yaml.
As example, this allows an onboard hub, to be described in generic-ehci
controller node:
usb {
  compatible = "generic-ehci";
  #address-cells = <1>;
  #size-cells = <0>;
  /* onboard HUB */
  hub@1 {
    compatible = "usb424,2514";
    reg = <1>;
    vdd-supply = <&v3v3>;
  };
};

Without this, dtbs_check complains on '#address-cells', '#size-cells',
'hub@1' do not match any of the regexes: 'pinctrl-[0-9]+'
From schema: ..../generic-ehci.yaml

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 1e84e1b7ab271..e50c1cfaa1972 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -130,11 +130,6 @@ properties:
       Set this flag to indicate that the hardware sometimes turns on
       the OC bit when an over-current isn't actually present.
 
-  companion:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      Phandle of a companion.
-
   phys:
     minItems: 1
     maxItems: 3
@@ -155,7 +150,7 @@ required:
   - reg
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
