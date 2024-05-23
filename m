Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1728CD99F
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2024 20:05:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6D9EC6C83C;
	Thu, 23 May 2024 18:05:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4226C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2024 18:05:43 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NHUR7w016252;
 Thu, 23 May 2024 20:05:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=DH8LgcGQni+MPZrykXYaYa
 wW21NSo9zAq2v3pQC/Wms=; b=g71+vPPcNMk3qJKETtWwdKKi3gp8Dwm7pTkEcu
 UlqyHB+nc2XPNi9vnomYZq41Rt1R46bUbfgmDDDmuJOJuzxcqDnX5JgoHTItoWWU
 pIjSUWR2QSwXZgp0jlemCelUplSbaBBe2tRnlcXstdwZk62yxa5IKTUYhvjknISh
 5lZ9o2fFBOt6wRUaSf/k9tjO9ZTfmbBPmNPlmy5ZbnHC8AMDYep/jDSzDZHTj8At
 WV0t5Xm+JaepV8oI7naOiL+iDw+TLi0MEWXOFgIemQx9FBPcNvhPvq3e35yjU3hw
 uPZyNLZ9pn9B8x2pTItfbwvgKuENX6SKg5cQlpVznrF9omdg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yaa8qg2h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 May 2024 20:05:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A084E4002D;
 Thu, 23 May 2024 20:05:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 412EC21BF58;
 Thu, 23 May 2024 20:04:38 +0200 (CEST)
Received: from localhost (10.48.87.205) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 20:04:37 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pascal
 Paillet <p.paillet@foss.st.com>
Date: Thu, 23 May 2024 20:04:32 +0200
Message-ID: <20240523180435.583257-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.205]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_11,2024-05-23_01,2024-05-17_01
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/2] ARM: st: add new compatible for PWR
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


Changes in v4:
- use fallback as proposed by Marek on V3 for STM32MP13:
  compatible = "st,stm32mp13-pwr-reg", "st,stm32mp1,pwr-reg"

Changes in v3:
- Replace oneOf/const by enum; solve the V2 issues for dt_binding_check

Changes in v2:
- Add new compatible for STM32MP13 and change title after Rob remarks
  V1: "ARM: st: use a correct pwr compatible for stm32mp15"

Patrick Delaunay (2):
  dt-bindings: regulator: st,stm32mp1-pwr-reg: add compatible for
    STM32MP13
  regulator: stm32-pwr: add support of STM32MP13

 .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml | 7 ++++++-
 drivers/regulator/stm32-pwr.c                              | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
