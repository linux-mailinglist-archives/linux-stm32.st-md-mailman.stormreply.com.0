Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46637ACC297
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Jun 2025 11:04:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E46CC3FACD;
	Tue,  3 Jun 2025 09:04:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AA40C3FACD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 09:04:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5538E90X006202;
 Tue, 3 Jun 2025 11:04:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=gSqlkIscU9UECxCqO78pkp
 9mEBkzMbraZvF9QyX2Jpo=; b=ThDKtrxysbVp91fh7r33bOjfUH9bYyA8VxbX9l
 JWfdnsmeKNgsFISaQDSEFgoA1ORVzNoLrwWODwPqb3mQayp7EDxmwayq2HAXauQo
 D03yXs8jLL7423a22It4jBnndNwShoAieoXWijt7nDP0IoYTsx6vk5qMM/lFBhpm
 1/QE40YdnlrYwVGSJc9HAgbO70QyzJttxYQacgCFPFICd4x8pQZXYZNGE6PasAcX
 TtlunUt+PkiuCfheaKBalQVvNwcxhzIGbavOdlUllySRJq8pPa5jm2LxmRIHQKCM
 f4zWwBiKqgJhytfmKRTyCxlYParsjg5QRQrquZiHCluHDyIQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g93aym9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jun 2025 11:04:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4E77F4005D;
 Tue,  3 Jun 2025 11:03:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 605D76CF2C0;
 Tue,  3 Jun 2025 11:02:31 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:02:31 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 3 Jun 2025 11:02:06 +0200
Message-ID: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA66PmgC/x3MQQqAIBBA0avIrBN0TKyuEi2kphpCC40IorsnL
 d/i/wcyJaYMnXgg0cWZ91iAlYBx9XEhyVMxoEKrLDqZz2AwHNq6WU4bSvR1U3ulW2c8lOpINPP
 9H/vhfT9M3JYNYQAAAA==
X-Change-ID: 20250527-stm32mp157f-dk2-2a484a01973a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.237]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/7] Introduce STM32MP157F-DK2 board
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

The main hardware difference with STM32MP157C-DK2 board is the SoC: 'F'
variant embeds a STM32MP157F SoC, which has the same level of features
than a STM32MP157C SoC but A7 clock frequency can reach 800Mhz (instead
of fixed 650Mhz for 'C' variant).
stm32mp157f-dk2 device tree reuses the existing sketeton for STM32MP15
DKx boards, but it is SCMI-based with I2C4 & PMIC managed by OP-TEE,
like other STM32 MPU boards (STM32MP135F-DK, STM32MP257F-DK/EV1, ...).
Himanshu's bindings patch [1] has been rerolled to introduce
st,stm32mp157f-dk2 compatible.

Link: https://lore.kernel.org/linux-arm-kernel/20250524100319.22521-3-himanshu.bhavani@siliconsignals.io/ [1]
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Changes in v2:
- Drop empty stm32mp15xa.dtsi and stm32mp15xd.dtsi files.
- Fulfill SCMI regulator defines and add Pascal's SoB
- Add patch [4/7] to use SCMI regulator defines
- Add patch [5/7] for OP-TEE async notif
- Link to v1: https://lore.kernel.org/r/20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com

---
Alexandre Torgue (1):
      ARM: dts: stm32: fullfill diversity with OPP for STM32M15xF SOCs

Amelie Delaunay (3):
      ARM: dts: stm32: use 'typec' generic name for stusb1600 on stm32mp15xx-dkx
      ARM: dts: stm32: use internal regulators bindings for MP15 scmi variants
      ARM: dts: stm32: add stm32mp157f-dk2 board support

Etienne Carriere (2):
      dt-bindings: regulator: Add STM32MP15 SCMI regulator identifiers
      ARM: dts: stm32: optee async notif interrupt for MP15 scmi variants

Himanshu Bhavani (1):
      dt-bindings: arm: stm32: add STM32MP157F-DK2 board compatible

 .../devicetree/bindings/arm/stm32/stm32.yaml       |   1 +
 arch/arm/boot/dts/st/Makefile                      |   3 +-
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi           |  10 +-
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi     | 196 +++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts           | 179 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp15xf.dtsi              |  17 ++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |   2 +-
 .../dt-bindings/regulator/st,stm32mp15-regulator.h |  40 +++++
 8 files changed, 443 insertions(+), 5 deletions(-)
---
base-commit: dc392342b7bb14b12f2de96201937cb02be7802f
change-id: 20250527-stm32mp157f-dk2-2a484a01973a

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
