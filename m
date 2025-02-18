Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C593A39CB2
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 14:02:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D397C78F98;
	Tue, 18 Feb 2025 13:02:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05929C78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 13:02:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ICTR5o017234;
 Tue, 18 Feb 2025 14:02:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 L+7sXH1zQ3Bs1zuV6xldCwud87Dn2o2qNqX9CUqAE+w=; b=gmSr6x/+CHsp6Q9+
 0KqjY2+mj2qsUHFDQBt/G05UPyMU0P4Ddpy/Eew+aN51eNUgXW6ZT+jKBLauVqrm
 nHFVUFeTtXj52iQhv92m3tawpSP4E7KWCYCRdgSUxtyl2GxcPmwVTY46SKGW5anV
 eUjr7zlADEuGdAUrsCchL/8YKwLIYv/jajjq9iI+VEp7UmEmfRe0v7bQqiwy+3ll
 AqRfJRxmkhk4q65TCEHcCgiJE/xfyf9TEaGqjh3XMklmfmnSp5PPiNPV7mhPDgij
 mRfTyOmysESL1xSVlVvV8qmCmpWogpyx02ehT7EqlRl0JAi5dthodW+Py24IMr/0
 Eae64Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44tkvmmcs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2025 14:02:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3FEAC40051;
 Tue, 18 Feb 2025 14:01:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8F933C139B;
 Tue, 18 Feb 2025 14:00:08 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 14:00:08 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Tue, 18 Feb 2025 14:00:00 +0100
Message-ID: <20250218130000.87889-9-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250218130000.87889-1-patrice.chotard@foss.st.com>
References: <20250218130000.87889-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_05,2025-02-18_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 8/8] arm64: defconfig: Enable STM32 Octo
	Memory Manager and OcstoSPI driver
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Enable STM32 OctoSPI driver.
Enable STM32 Octo Memory Manager (OMM) driver which is needed
for OSPI usage on STM32MP257F-EV1 board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 246a13412bf0..b089cf4b90a1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -577,6 +577,7 @@ CONFIG_SPI_QUP=y
 CONFIG_SPI_QCOM_GENI=m
 CONFIG_SPI_S3C64XX=y
 CONFIG_SPI_SH_MSIOF=m
+CONFIG_SPI_STM32_OSPI=m
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_TEGRA210_QUAD=m
 CONFIG_SPI_TEGRA114=m
@@ -1506,6 +1507,7 @@ CONFIG_EXTCON_USB_GPIO=y
 CONFIG_EXTCON_USBC_CROS_EC=y
 CONFIG_FSL_IFC=y
 CONFIG_RENESAS_RPCIF=m
+CONFIG_STM32_OMM=m
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y
 CONFIG_IMX8QXP_ADC=m
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
