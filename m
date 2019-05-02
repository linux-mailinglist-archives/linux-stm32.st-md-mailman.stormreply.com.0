Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB58114F3
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 10:10:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01EEFC0B796
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 08:10:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45123C0B797
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 08:10:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x42860sX006127; Thu, 2 May 2019 10:10:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qsRqvviEBACZshMNCC3W3q/ZdBJX0rfci2XIVx7jSmI=;
 b=gtqhfvIFelmsDDXXiKo+qWnGfPERQFXm5QUB+bxBUrKSZlqNZAJBbJaeivuxIDYFo/hG
 gmMFFBsI4fvBeanBlap4vbwGi/OU5xjvV3WYRf2v0c79YzdShdQgOH6Lr48RWKNcIVKP
 Ja/lE4wan/zEDCkeMglLfZCxd6EZJwbOSJj1NQqO6PJZVlsG87CbEFvJp8sdCBs4RijF
 pLiioChEh1TST6BKJ2BzRUoYcI2CEoopfieKB6Phy6YybWp/joJM3bT8XInc5hNyqmWh
 arPegyuncEohWfkCDILU1pwXpKO273nVIvnM608O/cTF4H/bxUmjabNBzS5x29OVqAS4 Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s6xgcq494-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 02 May 2019 10:10:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 046A831;
 Thu,  2 May 2019 08:10:17 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D060BEDE;
 Thu,  2 May 2019 08:10:17 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.361.1; Thu, 2 May 2019
 10:10:17 +0200
Received: from localhost (10.129.4.86) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.361.1;
 Thu, 2 May 2019 10:10:17 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>
Date: Thu, 2 May 2019 10:09:59 +0200
Message-ID: <1556784606-3016-2-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556784606-3016-1-git-send-email-fabien.dessenne@st.com>
References: <1556784606-3016-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.4.86]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_03:, , signatures=0
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Linux-stm32] [PATCH v3 1/8] dt-bindings: stm32: add bindings for
	ML-AHB interconnect
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

Document the ML-AHB interconnect for stm32 SoCs.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 .../devicetree/bindings/arm/stm32/mlahb.txt        | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt

diff --git a/Documentation/devicetree/bindings/arm/stm32/mlahb.txt b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
new file mode 100644
index 0000000..3f5b779
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
@@ -0,0 +1,37 @@
+ML-AHB interconnect bindings
+
+These bindings describe the STM32 SoCs ML-AHB interconnect bus which connects
+a Cortex-M subsystem with dedicated memories.
+The MCU SRAM and RETRAM memory parts can be accessed through different addresses
+(see "RAM aliases" in [1]) using different buses (see [2]) : balancing the
+Cortex-M firmware accesses among those ports allows to tune the system
+performance.
+
+[1]: https://www.st.com/resource/en/reference_manual/dm00327659.pdf
+[2]: https://wiki.st.com/stm32mpu/wiki/STM32MP15_RAM_mapping
+
+Required properties:
+- compatible: should be "simple-bus"
+- dma-ranges: describes memory addresses translation between the local CPU and
+	   the remote Cortex-M processor. Each memory region, is declared with
+	   3 parameters:
+		 - param 1: device base address (Cortex-M processor address)
+		 - param 2: physical base address (local CPU address)
+		 - param 3: size of the memory region.
+
+The Cortex-M remote processor accessed via the mlahb interconnect is described
+by a child node.
+
+Example:
+mlahb {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	dma-ranges = <0x00000000 0x38000000 0x10000>,
+		     <0x10000000 0x10000000 0x60000>,
+		     <0x30000000 0x30000000 0x60000>;
+
+	m4_rproc: m4@38000000 {
+		...
+	};
+};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
