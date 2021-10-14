Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A59F742D9E6
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 15:13:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D0F2C5C837;
	Thu, 14 Oct 2021 13:13:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B44DC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 13:13:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19EBkTaA020330; 
 Thu, 14 Oct 2021 15:13:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=aV08SqbAMcMfMc2tv8tumhWBDoZ1vN9XbFUHNfHVQpM=;
 b=xRmAWxBDtlGttemkIwzllslb3vVnt7lHLVD2XHOHIUMUea8vil1gX6h1j1iVkS98OQ7o
 BwqZFNxX20mKpw4ujLrwFhgkfLNSRuufD3qywsWQz5oQ8EyXiOApGAVLy89zipui7nDA
 zsRIbqOHYeobY6GNnRSnGpn9LUil6Y1+OHTpkuAfHGe/DpvH9k1Nko4XC7TTCSUy1UxF
 cTVmJdxpdQYH20qNLqFDIZVXSTMUn+mkTWTppLR9UQV6SDIPZeaERM/FjEQ8jrbQ1496
 nCeUs22PVv/t45P5bTkHvNUZot/zbTwvMGCzTwQqYaqeKR1UmV2PTohz8yPlx6dfHBTA VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bpkye8fyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 15:13:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 06FDE10002A;
 Thu, 14 Oct 2021 15:13:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0039422179A;
 Thu, 14 Oct 2021 15:13:22 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 14 Oct 2021 15:13:21
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Oct 2021 15:12:23 +0200
Message-ID: <20211014131228.4692-3-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211014131228.4692-1-olivier.moysan@foss.st.com>
References: <20211014131228.4692-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_08,2021-10-14_02,2020-04-07_01
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 2/7] dt-bindings: iio: stm32-adc: add nvmem
	support for vrefint internal channel
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

Add support of nvmem. This allows to retrieve calibration data from OTP
for vrefint internal channel.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/iio/adc/st,stm32-adc.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
index 2083e1723970..ec0450d111a9 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
@@ -301,6 +301,14 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32-array
         deprecated: true
 
+      nvmem-cells:
+        items:
+          - description: Phandle to the calibration vrefint data provided by otp
+
+      nvmem-cell-names:
+        items:
+          - const: vrefint
+
     patternProperties:
       "^channel@([0-9]|1[0-9])$":
         type: object
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
