Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C84DAD3CDF
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 17:24:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 453ECC36B38;
	Tue, 10 Jun 2025 15:24:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17CCDC36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 15:24:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AEYo1Q005348;
 Tue, 10 Jun 2025 17:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=Mmod6GyCvN+xKlhUHyHmJv
 0MBU3r0IJh4g+WMqECjq0=; b=TpN4N10TD7/Ta96HeLV3PHeOLQVvVjlxnjEF4Z
 sUyPyu98fN+cdvqhcpjiUX2r0yiMIrvY08OU6f8qEKcFvWDRWnHzz/c0Z7kCYw7q
 rxilDs7VK+yG9zU0UVYvKBcqAt+2P6tWbeuR5YyMQPeKIKvNcJfrjn19zmAoAK08
 O1Jm8q3CgGYZvxwh0FrFIuUyVmtOwTHEmKqrdFMRteYnCd5sE2sZA9b82Luwq/J9
 js3ZeEjewG43OJ7BQJXYiLPUtFV+6gUSDlgSMm/uw200CTSYqOsayj9CxreZ4p2I
 eAh4+LZ2fAYt7D7Nuj6WPq96ZvTtWe5A86GWG6FALPnQX5Fg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2nuej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 17:24:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8AA5B4002D;
 Tue, 10 Jun 2025 17:23:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0B50B79BB7;
 Tue, 10 Jun 2025 17:23:12 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:23:12 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 10 Jun 2025 17:23:04 +0200
Message-ID: <20250610152309.299438-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [RESEND PATCH v2 0/5] STM32 pinctrl: Add mux function
	RSVD
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

This v2 is a subset of the v1, split-out to simplify the review.

This subset:
- introduces the pinctrl mux function RSVD,
- adds two use cases requiring RSVD,
- minor re-format of the dt-bindings.

Changes v1 -> v2 subset:
- rebased on v6.16-rc1,
- added use cases of the new mux function RSVD,
- added Reviewed-by: on 2/5 (former 04/14 in v1),
- added commit to re-format the dt-bindings,
- Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/


Antonio Borneo (3):
  ARM: dts: stm32: Add pinmux for CM4 leds pins
  ARM: dts: stm32: Add leds for CM4 on stm32mp15xx-ed1 and
    stm32mp15xx-dkx
  dt-bindings: pinctrl: stm32: Add missing blank lines

Fabien Dessenne (2):
  pinctrl: stm32: Handle RSVD pin configuration
  dt-bindings: pinctrl: stm32: Add RSVD mux function

 .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 25 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 14 +++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts      |  2 ++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi     |  2 ++
 drivers/pinctrl/stm32/pinctrl-stm32.c         |  9 +++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h         |  3 ++-
 include/dt-bindings/pinctrl/stm32-pinfunc.h   |  1 +
 7 files changed, 55 insertions(+), 1 deletion(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
