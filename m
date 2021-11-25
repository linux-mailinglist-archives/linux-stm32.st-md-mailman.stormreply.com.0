Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7196045DC8F
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Nov 2021 15:44:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A4DCC5EC75;
	Thu, 25 Nov 2021 14:44:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8896EC5A4D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Nov 2021 14:44:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1APCh81L016649;
 Thu, 25 Nov 2021 15:44:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=5G7tjLWLKet8xg5YJsAoPpj35mAfrj/N+DMrBK+bDV8=;
 b=zZpXPufZkASztY2jj1rW/QHbzyXnoi7OuNN0mURBLSkccpu3MG9iUDx7L0urBIVmOlRN
 w9D/9ixe+6k9IECv7lVETn12rtiS5nQhttqri0GTe43zCxEUpZ5nlOh1dhUaEYLD7F77
 PrcFBPJmCiJTi8TZE8KNLlgFIOK9EWyOzR6icuR7UM6O9Y1iOqaH/tJy9WZU6VoqbDTX
 oQZ8zZq+qH3xViIevgwOiE2Pe1TUolhXSguI0UbyHmEhPQ6Jv5cRCCxPYL8UbyEWx3W/
 jquMg4FQe1nqXu7JAFmjBHxMviRcVdMsOXNxaBczP9rG8N0IEOFFDlWHFZQuA3tbpJ9U oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cjar3gq2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 15:44:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A76F10002A;
 Thu, 25 Nov 2021 15:44:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 957E4237D97;
 Thu, 25 Nov 2021 15:44:20 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 25 Nov 2021 15:44:20
 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Olivier Moysan <olivier.moysan@st.com>, "Rob
 Herring" <robh+dt@kernel.org>, <arnaud.pouliquen@foss.st.com>,
 <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Date: Thu, 25 Nov 2021 15:40:49 +0100
Message-ID: <20211125144053.774-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_06,2021-11-25_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] ARM: dts: stm32: merge spi and i2s
	nodes
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

When a STM32 SPI instance offers I2S feature, two nodes are defined
in STM32 SoC device tree to support both SPI and I2S.
Merge SPI node and I2S nodes into a single node, to avoid
hardware description duplication and compilation warnings.

Changes in v2:
- Squash some patches in the serie to avoid dtbs check warnings
  on intermediate compilation steps.

Olivier Moysan (4):
  ASoC: dt-bindings: stm32: i2s: add audio-graph-card port
  ASoC: dt-bindings: stm32: i2s: allow additional properties.
  ASoC: dt-bindings: stm32: i2s: update example
  ARM: dts: stm32: merge spi and i2s nodes

 .../bindings/sound/st,stm32-i2s.yaml          |  9 ++++-
 arch/arm/boot/dts/stm32mp151.dtsi             | 39 ++-----------------
 arch/arm/boot/dts/stm32mp157c-ev1.dts         |  2 +-
 .../arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi |  2 +-
 .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  2 +-
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        |  7 +++-
 6 files changed, 18 insertions(+), 43 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
