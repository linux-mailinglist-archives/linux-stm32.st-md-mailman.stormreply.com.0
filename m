Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1D786119E
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 13:39:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBFDAC6B47E;
	Fri, 23 Feb 2024 12:38:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E441CC6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 12:38:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N8GlAX022193; Fri, 23 Feb 2024 13:38:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=selector1; bh=F8zN5Yz0CWcU425g4AE37w9LRhYp8Zn5uSxrL8yHXMQ
 =; b=KLgrMambOr1HfgvJtNKE7rQUf6tvKRDf6amCBEY4a+YxJLQ2vW9rBQpmOWB
 mcPSA/SY3aBdumAM0cZqIUgqAYTHizi52XjhPq9axXa6/yRcGy0LiJVPuKxBJrLn
 TxSl0Ms0KDygiNyBkwj8b3668ZBS0U6PRKlorg0T3uC1yj2EttYL1IZmMZ5b1TUj
 r2JqlSdJqLxHmVYKIbIKeBEHCVi+lLucpCvAL4IgI0lBUpz8Oya9Sf50DiINKP07
 dp08Vb1O4Lq72eaGhLCX6cTaHCZ7rWyTa0hwv0osL0AdPrrY51nV4LwZ7SgeWdg3
 LVUCVnxahCO4nOcUpXvvHGdBC4g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wd2034kjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 13:38:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 64DDC40046;
 Fri, 23 Feb 2024 13:38:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7BC428DDC3;
 Fri, 23 Feb 2024 13:36:54 +0100 (CET)
Received: from localhost (10.129.178.151) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 23 Feb
 2024 13:36:54 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 23 Feb 2024 13:36:51 +0100
MIME-Version: 1.0
Message-ID: <20240223-ltdc_mp13-v3-4-7f92a59ca11f@foss.st.com>
References: <20240223-ltdc_mp13-v3-0-7f92a59ca11f@foss.st.com>
In-Reply-To: <20240223-ltdc_mp13-v3-0-7f92a59ca11f@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Originating-IP: [10.129.178.151]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 4/4] dt-bindings: display: simple: allow
 panel-common properties
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

This device inherits properties from panel-common. Those should be allowed
to use, instead of specifying properties to true for each specific use.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Changes in v3:
  - Allow every properties instead of adding each properties to true as
    Rob suggested
  - Rewrite commit log to match changes

Changes in v2:
  - Added this patch

Fixes following warnings:
arch/arm/boot/dts/st/stm32mp135f-dk.dtb: panel-rgb: 'height-mm', 'panel-timing', 'width-mm' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
---
 .../devicetree/bindings/display/panel/panel-simple.yaml       | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 634a10c6f2dd..01c9153da3d3 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -344,15 +344,6 @@ properties:
         # Yes Optoelectronics YTC700TLAG-05-201C 7" TFT LCD panel
       - yes-optoelectronics,ytc700tlag-05-201c
 
-  backlight: true
-  ddc-i2c-bus: true
-  enable-gpios: true
-  port: true
-  power-supply: true
-  no-hpd: true
-  hpd-gpios: true
-  data-mapping: true
-
 if:
   not:
     properties:
@@ -363,7 +354,7 @@ then:
   properties:
     data-mapping: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
