Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6517A8B3F4B
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 20:33:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EDEEC7128D;
	Fri, 26 Apr 2024 18:33:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A97EC7128C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 18:33:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43QFwHXd014451;
 Fri, 26 Apr 2024 20:33:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=TZDi4Op
 neSHTSlKaSSY7T8giniYvYjtEGyDW0Hog8Z4=; b=ku3J/CbmfnXnLS70TA9PBQP
 s9Xfy94D5J82ONwpGxylsyVKJ9XgeldAzVYDo5GFzy7ok6wXwciYPkxQQkWsXc7e
 Gu9rmNgw5NfT150D6wqUYRNbB13A86su7g0j6dErzduTsxRFzRLqvVurciKk9RWa
 jr32s+T8cN4pug91GQTX9uli6roC+Hc+ZiIZAPtH/ksd9AGC1TbCm/NIWfbCnPOr
 RB/QCIeJfL9hmpt184tb5d/RQv18ueBqMfROyFt8u6D/zNtTcRpWTdo5c4RC1Ep2
 B03iH3/AqRI1mquaPLu39M2XJr+9QsF/KzpQHRJKVoDoQ+4fCNWWERLhyriOciQ=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4kbjscy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 20:33:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3965940044;
 Fri, 26 Apr 2024 20:33:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C5DCF22FA32;
 Fri, 26 Apr 2024 20:32:56 +0200 (CEST)
Received: from localhost (10.48.86.112) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 20:32:56 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pascal
 Paillet <p.paillet@foss.st.com>
Date: Fri, 26 Apr 2024 20:32:49 +0200
Message-ID: <20240426183253.1360098-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_16,2024-04-26_02,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/2] ARM: st: add new compatible for PWR
	regulators on STM32MP13
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


This patchset adds the new PWR regulators compatible for STM32MP13:
"st,stm32mp13-pwr-reg".

As this node is just introduced by [1] and it is is not used by any
board in Linux,  it is the good time to introduced this compatible
and update the STM32MP13 SoC dtsi without ABI break.

A new compatible is needed as the content of the PWR_CR3 register,
used by this driver change with new bits on STM32MP13 for SD IO domain:
- bit 23: VDDSD2VALID
- bit 22: VDDSD1VALID
- bit 16: VDDSD2RDY
- bit 15: VDDSD2EN
- bit 14: VDDSD1RDY
- bit 13: VDDSD1EN

I will push a update on STM32MP13 SoC dtsi if this new compatible
is accepted to preserve the bisectability.

[1] commit f798f7079233 ("ARM: dts: stm32: add PWR regulators support on stm32mp131")
    https://lore.kernel.org/linux-arm-kernel/b89d0531-067f-4356-91b0-ed7434cee3d7@foss.st.com/


Changes in v2:
- Add new compatible for STM32MP13 and change title after Rob remarks
  V1: "ARM: st: use a correct pwr compatible for stm32mp15"

Patrick Delaunay (2):
  dt-bindings: regulator: st,stm32mp1-pwr-reg: add compatible for
    STM32MP13
  regulator: stm32-pwr: add support of STM32MP13

 .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml    | 4 +++-
 drivers/regulator/stm32-pwr.c                                 | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
