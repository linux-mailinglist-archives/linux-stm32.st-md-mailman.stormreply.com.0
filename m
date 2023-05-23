Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCB470DB5F
	for <lists+linux-stm32@lfdr.de>; Tue, 23 May 2023 13:19:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68A89C6B442;
	Tue, 23 May 2023 11:19:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A55CC6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 May 2023 07:42:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34N41JOv005315; Tue, 23 May 2023 09:42:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=9KXPbntQJjThryM7ZH+pOmBiljxCSklz9zzzhSCRtqg=;
 b=vzn1lJK0lbm2qCgl4ZlUV3WkI6TBP5LXnDCzBKN3h5AMCc4l89PALKf0inFqgHv3GNIb
 FyTU3E6hOFkgVYlWPhq48V0jHVMNhLnzywb8QgX7fUoiMXsKUMPl8CWonDg9+P+2khI2
 qPAfrNdkIosUy5McwJb6O9+tdb66W69dDFsgtv+SZw3Lv5ZaTM6fMbKJ0s+xPcPgijHh
 tGnPM+cCCAmTgFF4PM45QK4x5/cHFkFntylMC1uKsACtF1j9L3zsjZSa+4Giko/a2mDQ
 CfKAVweB9JHSgRXbA8vRh15ovPlmdrB66LZLE4PtRPdSgZy0ny3jgcSWUb67PqFTOvJ4 dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qpnj1fkaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 09:42:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA7A910002A;
 Tue, 23 May 2023 09:42:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BF2B221ADC9;
 Tue, 23 May 2023 09:42:11 +0200 (CEST)
Received: from localhost (10.201.22.238) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 23 May
 2023 09:42:10 +0200
From: <p.paillet@foss.st.com>
To: <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Pascal Paillet <p.paillet@foss.st.com>
Date: Tue, 23 May 2023 09:42:06 +0200
Message-ID: <20230523074206.201962-1-p.paillet@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.238]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_04,2023-05-22_03,2023-05-22_02
X-Mailman-Approved-At: Tue, 23 May 2023 11:19:29 +0000
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dt-bindings: mfd: add vref_ddr supply for
	STPMIC1
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

From: Pascal Paillet <p.paillet@foss.st.com>

Add vref_ddr supply description for the STPMIC1.

Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
---
 Documentation/devicetree/bindings/mfd/st,stpmic1.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
index 9573e4af949e..97c61097f9e2 100644
--- a/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
@@ -184,7 +184,7 @@ properties:
         additionalProperties: false
 
     patternProperties:
-      "^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":
+      "^(buck[1-4]|ldo[1-6]|vref_ddr|boost|pwr_sw[1-2])-supply$":
         description: STPMIC1 voltage regulators supplies
 
       "^(buck[1-4]|ldo[1-6]|boost|vref_ddr|pwr_sw[1-2])$":
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
