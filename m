Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1231E7FD74A
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Nov 2023 13:59:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCF90C6A613;
	Wed, 29 Nov 2023 12:59:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C3F0C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Nov 2023 12:59:53 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3ATAIMa3005577; Wed, 29 Nov 2023 13:59:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=Dsc+9GR
 NBqoX2xM/+cUi2k9N29c+u17aO3+kBjb/00A=; b=c5OPaNy1YGyH5IUu0NTi8bk
 UX5zL86rlRA8hZ5gJttIBhIzvpdrqyUu9AC3bZj1LM7QnaUOJinm+by4Ldu3T3O5
 gJsY8L/w3uuPWi3RzTvIIJcocJL0gc+rRIZR+5YSPQVxbGh8vu3mKIWhe3wFNsAU
 nItYSBvKjFWyNMPW64YFfK+NPWtmp/rmWjY3VPg1jDdJSZqpLWcU2RHQA9ErBY6+
 yu4/CAnYZ8RSSra5wMs0Wzwmt7Dp2yUnVSbIM8aJ3Dpr8RcT3ytbyxKkhhY0gPSP
 FHD3cXVyrsXxYu974OqNWL2vhR1IiU5tRyMi4IX7y7uiC3UeMRe7eUBKM4FewUA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3unxcj22cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Nov 2023 13:59:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 238B310002A;
 Wed, 29 Nov 2023 13:59:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A372B21BF60;
 Wed, 29 Nov 2023 13:59:36 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 29 Nov
 2023 13:59:36 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Pierre-Yves MORDRET
 <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 29 Nov 2023 13:59:09 +0100
Message-ID: <20231129125920.1702497-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_09,2023-11-29_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/7] i2c: stm32f7: enhancements and support
	for stm32mp25
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

This series first perform enhancements in the way interrupt are handled
and cleanup in messages.
Then it adds support for the stm32mp25 which differs in that
it only has a single irq line for both event/error and has a
different handling of the FastModePlus.
Support is then enabled within the stm32mp25 related device-trees.

Alain Volmat (7):
  i2c: stm32f7: perform most of irq job in threaded handler
  i2c: stm32f7: simplify status messages in case of errors
  dt-bindings: i2c: document st,stm32mp25-i2c compatible
  i2c: stm32f7: add support for stm32mp25 soc
  arm64: dts: st: add all 8 i2c nodes on stm32mp251
  arm64: dts: st: add i2c2/i2c8 pins for stm32mp25
  arm64: dts: st: add i2c2 / i2c8 properties on stm32mp257f-ev1

 .../devicetree/bindings/i2c/st,stm32-i2c.yaml |  49 ++-
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  36 ++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  96 +++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  20 ++
 drivers/i2c/busses/i2c-stm32f7.c              | 334 ++++++++++--------
 5 files changed, 369 insertions(+), 166 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
