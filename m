Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31E88989F
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Mar 2024 10:44:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EF3EC71281;
	Mon, 25 Mar 2024 09:44:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66EBFC6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 09:44:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P8eGmA028115; Mon, 25 Mar 2024 10:44:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=ffbGzpk
 ISaeUbR7jR83UhYzV507/spEZuEB2LJi1r+s=; b=n0gWS2ha/eKuYFCL9oX5EIw
 Bg1NzsCkqiDc38Ee7IZOEEquoBhLx1EaZb9TR8oJrEoGFxG/It5WfZz8u4gIrBIO
 zCtpuleSZQiiAGVo7tjql9EqoFb7EVWKk8eZG0vQnWWXY50LgRMo1DlPUfCzbV3u
 FZnJVzhzWgLHwvN92OKahVOhJMGsbxXgcPfLGUiq4HtPDQcdsjtk/3Bb4STstH7f
 8FNTkLl0qR9CxiphXXpbYDeCP1xRe2d0gifbzRQB9fPaV/xY86jZstEQujuWN8St
 h/unnqrnwyUHPSOHcs7VixG+EUBQjojj/2ZK1kzGZlCcHEGA5W6LjgWiREkkMqw=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x1n3977fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Mar 2024 10:44:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6101240045;
 Mon, 25 Mar 2024 10:43:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A8F3216EF3;
 Mon, 25 Mar 2024 10:42:43 +0100 (CET)
Received: from localhost (10.201.21.128) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 25 Mar
 2024 10:42:42 +0100
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>, Marek Vasut <marex@denx.de>
Date: Mon, 25 Mar 2024 10:42:16 +0100
Message-ID: <20240325094218.56934-1-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.128]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_07,2024-03-21_02,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 0/2] Add properties in dwmac-stm32
	documentation
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

Introduce 2 new properties in dwmac-stm32 documentation

 - phy-supply: to manage PHY regulator.
 - st,ext-phyclk: is present since 2020 in driver so need to explain
   it and avoid dtbs check issue : views/kernel/upstream/net-next/arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: 
ethernet@5800a000: Unevaluated properties are not allowed 
('st,ext-phyclk' was unexpected)
   Furthermore this property will be use in upstream of MP13 dwmac glue. (next step)

V2: - Drop deprecated: property for st,eth-clk-sel and st,eth-ref-clk-sel
V3: - Rework commit message

Christophe Roullier (2):
  dt-bindings: net: add phy-supply property for stm32
  dt-bindings: net: dwmac: Document STM32 property st,ext-phyclk

 Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
