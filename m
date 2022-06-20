Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7C551656
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jun 2022 12:56:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B7DFC5EC6B;
	Mon, 20 Jun 2022 10:56:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C249EC03FDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 10:56:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K9DtVf018853;
 Mon, 20 Jun 2022 12:56:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=xX0JQsCAwh/4otRBiTOPMPm4L05+gcoRc59mIHpiUFM=;
 b=lldkRgFBi6RrJw0Brs+HtKYRPfH3QYGqMWIyVOQuQJBvgy5kF80tPKv7jUYlmV3lQmgu
 AHR/rUOokpouO0Mj5JKstF5swhXonxCkuGi76QiLEu8CNFt1hK+FU7WBe9bBwhXchC9d
 /TYYha3y7ux3/gYfV0caWdo1/vR/ViUQtGqHV8hKPgbT5BPiUJ0Ane8NiqQXFO53Dvmb
 SbdMqbApkjUKh+flEoeC59hEW0wRym6vHKdPp1ynp03ypikihCIfPGK6mYOclrgtnSjI
 hl5wS8CdLVh14DRb6X48xLviF4XD0DDUHd3u6tBzXEAMeBDgVVOPkApUgEIVobZK6ey5 dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gtp31rmrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 12:56:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 706FB100034;
 Mon, 20 Jun 2022 12:56:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AC3B21BF7F;
 Mon, 20 Jun 2022 12:56:16 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 12:56:16 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Mon, 20 Jun 2022 12:54:02 +0200
Message-ID: <20220620105405.145959-2-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620105405.145959-1-alain.volmat@foss.st.com>
References: <20220620105405.145959-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/4] dt-bindings: i2c: st,
	stm32-i2c: don't mandate a reset line
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

Update the dt-bindings of the i2c-stm32 drivers to avoid the
needs for a reset property in the device-tree.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index dccbb18b6dc0..8879144fbbfb 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -94,7 +94,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - resets
   - clocks
 
 unevaluatedProperties: false
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
