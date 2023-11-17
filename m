Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB977EF48C
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 15:34:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DBF3C6C85D;
	Fri, 17 Nov 2023 14:34:28 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E7FEC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 14:34:27 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AHBMVhP011100; Fri, 17 Nov 2023 15:34:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=8xdj8SH
 PK8NulxaFgQvXVA78MnGud+kVb8iCWdM/E9g=; b=Tz6QUcA4VJLYeONM5WzysQY
 QlED5ROx7HvSoiDqkWKoYlAj+1P3bi39M4jlXnZbOQESzK/Wz5B7xCiX67CYpUmS
 Zmd6h7SYj4oyWrydcCqj774qcp3pLlvdlYHK5QW7sjDwYb8u9xZ4Giae9Yg+Hf8u
 pXkQHuNUzua73agN+gHmdbdXrk+cl+Sa7b+4B0KlnyCQJe6be4a7TySaw2gUh+Ur
 H1hMjQBjmnF7E1kp1H8woyHh7ygPTz71HX7XjU4NrHN3aCTd8TIO+rmxhiWYYRo2
 QWGpVOVZOjme/eD3Jf2r5/84G4SkcMRr9Se2xL19Ld6o9FlBTB6iFRXUIIQhbVQ=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uanep98k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 15:34:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE4F410002A;
 Fri, 17 Nov 2023 15:33:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C06F12309EB;
 Fri, 17 Nov 2023 15:33:46 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 17 Nov
 2023 15:33:46 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 17 Nov 2023 15:33:33 +0100
Message-ID: <20231117143338.1173475-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_13,2023-11-17_01,2023-05-22_02
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Udit Kumar <u-kumar1@ti.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Linux-stm32] [PATCH 0/4] stm32: add support for STM32MP25 BSEC to
	control OTP data
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


Non volatile memory area is available on STM32MP25 with OTP in BSEC.

The 12 Kbits of OTP (effective) for STM32MP25x SoC Family
are organized into the following regions:
- lower OTP (OTP0 to OTP127) = 4096 lower OTP bits,
  bitwise (1-bit) programmable
- mid OTP (OTP128 to OTP255) = 4096 middle OTP bits,
  bulk (32-bit) programmable
- upper OTP (OTP256 to OTP383) = 4096 upper OTP bits,
  bulk (32-bit) programmable,
  only accessible when BSEC is in closed state.

BSEC is only accessible by secure world, so the OTP access is done
by driver with OP-TEE TA, as on STM32MP13x family.



Patrick Delaunay (4):
  dt-bindings: nvmem: add new stm32mp25 compatible for stm32-romem
  nvmem: stm32: add support for STM32MP25 BSEC to control OTP data
  arm64: defconfig: enable NVMEM STM32 ROMEM for stm32mp25
  nvmem: add bsec support to stm32mp25

 .../bindings/nvmem/st,stm32-romem.yaml           |  1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi           | 16 ++++++++++++++++
 arch/arm64/configs/defconfig                     |  1 +
 drivers/nvmem/stm32-romem.c                      | 16 ++++++++++++++++
 4 files changed, 34 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
