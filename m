Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C4103D6E
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2019 15:41:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4C6BC36B0B;
	Wed, 20 Nov 2019 14:41:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 892D6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 14:41:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKEbSIp013729; Wed, 20 Nov 2019 15:41:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=3MWRZoNQW6NvMtgqGH/E+ItGRfzo79zhMRPs9a8JyAI=;
 b=eVUeeJjoxT5BdFlIGtFkk+WoCeJt2zWo+It4cnAUWYWu2yI6F9iP9KyK9opca4tVtC1S
 83aWypYGaKkXItKp5BfZyBZ/jor1vDsvqkKh75LUCGIMtolIQ1bCWoD2JRg2eVtG0hl9
 P84oreGkkTaX+pNx7tfuFkzAmWtx0MkC/+WWxmarBOMekfwSQMxJPuouw6duH9NoubAj
 Dkco5m7pCe6DbgagMO+wZJkVZOHIyvSP3PzoUA26RKHqfChRTn1mLifCT5U//E6zeb09
 fkMFHt7/3kr27oDAQIOqP9o0qrPTRmvtqauJR9pp2yDorf18NpXshq4xDomAXack0/D/ QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wa9up6hy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 15:41:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63F6C10002A;
 Wed, 20 Nov 2019 15:41:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 327B82BE22E;
 Wed, 20 Nov 2019 15:41:11 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 20 Nov 2019 15:41:10
 +0100
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, <arnd@arndb.de>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Date: Wed, 20 Nov 2019 15:41:03 +0100
Message-ID: <20191120144109.25321-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_04:2019-11-15,2019-11-20 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] STM32 DT: Updates for SOC diversity
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

This series updates stm32mp device tree files in order to handle the STM32MP15
part numbers diversity. STM32MP15 part numbers are built in this way:

-STM32MP15X: X = [1, 3, 7] for IPs diversity:
 -STM32MP151 = basic part
 -STM32MP153 = STM32MP153  + a second CPU A7 + MCAN(x2)
 -STM32MP157 = STM32MP153 + DSI + GPU

-STMM32MP15xY: Y = [a, c] for security diversity:
 -STM32MP15xA: basic part.
 -STM32MP15xC: adds crypto IP.

-STM32MP15xxZZ: ZZ = [aa, ab, ac, ad] for packages (IO) diversity:
 -STM32MP15xxAA: TFBGA448 18x18
 -STM32MP15xxAB: LFBGA354 16x16
 -STM32MP15xxAC: TFBGA361 12x12
 -STM32MP15xxAD: TFBGA257 10x10

New device tree files are created and some existing are renamed to match with
this split.

In this way it is easy to assemble (by inclusion) those files to match with the
SOC partnumber used on board, and then it's simpler for users to create their
own device tree board file using the correct SOC.

For more details:

See STM32MP151 [1], STM32MP153 [2], STM32MP157 [3] reference manuals:
 [1] https://www.st.com/resource/en/reference_manual/dm00366349.pdf
 [2] https://www.st.com/resource/en/reference_manual/dm00366355.pdf
 [3] https://www.st.com/resource/en/reference_manual/dm00327659.pdf

Product family:
 https://www.st.com/en/microcontrollers-microprocessors/stm32-arm-cortex-mpus.html#products

regards
Alex

Alexandre Torgue (6):
  ARM: dts: stm32: Adapt stm32mp157 pinctrl to manage STM32MP15xx SOCs
    family
  ARM: dts: stm32: Update stm32mp157 pinctrl files
  ARM: dts: stm32: Introduce new STM32MP15 SOCs: STM32MP151 and
    STM32MP153
  ARM: dts: stm32: Manage security diversity for STM32M15x SOCs
  ARM: dts: stm32: Adapt STM32MP157 DK boards to stm32 DT diversity
  ARM: dts: stm32: Adapt STM32MP157C ED1 board to STM32 DT diversity

 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi      | 1087 +++++++++++++++
 .../dts/{stm32mp157c.dtsi => stm32mp151.dtsi} |  218 ++-
 arch/arm/boot/dts/stm32mp153.dtsi             |   45 +
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi     | 1240 -----------------
 arch/arm/boot/dts/stm32mp157.dtsi             |   31 +
 arch/arm/boot/dts/stm32mp157a-avenger96.dts   |    5 +-
 arch/arm/boot/dts/stm32mp157a-dk1.dts         |  604 +-------
 arch/arm/boot/dts/stm32mp157c-dk2.dts         |    6 +-
 arch/arm/boot/dts/stm32mp157c-ed1.dts         |    6 +-
 arch/arm/boot/dts/stm32mp157xaa-pinctrl.dtsi  |   90 --
 arch/arm/boot/dts/stm32mp157xab-pinctrl.dtsi  |   62 -
 arch/arm/boot/dts/stm32mp157xac-pinctrl.dtsi  |   78 --
 arch/arm/boot/dts/stm32mp157xad-pinctrl.dtsi  |   62 -
 arch/arm/boot/dts/stm32mp15xc.dtsi            |   18 +
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        |  606 ++++++++
 arch/arm/boot/dts/stm32mp15xxaa-pinctrl.dtsi  |   85 ++
 arch/arm/boot/dts/stm32mp15xxab-pinctrl.dtsi  |   57 +
 arch/arm/boot/dts/stm32mp15xxac-pinctrl.dtsi  |   73 +
 arch/arm/boot/dts/stm32mp15xxad-pinctrl.dtsi  |   57 +
 19 files changed, 2232 insertions(+), 2198 deletions(-)
 create mode 100644 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
 rename arch/arm/boot/dts/{stm32mp157c.dtsi => stm32mp151.dtsi} (91%)
 create mode 100644 arch/arm/boot/dts/stm32mp153.dtsi
 delete mode 100644 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp157.dtsi
 delete mode 100644 arch/arm/boot/dts/stm32mp157xaa-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/stm32mp157xab-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/stm32mp157xac-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/stm32mp157xad-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp15xc.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp15xxaa-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp15xxab-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp15xxac-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp15xxad-pinctrl.dtsi

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
