Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58A731188
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 09:59:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50F7FC6A610;
	Thu, 15 Jun 2023 07:59:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DB48C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 07:58:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35F6ZufH016146; Thu, 15 Jun 2023 09:58:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=qpy+o5laPne4j+FJxWvlTMZEusSxs73H8zYgkOpl2yA=;
 b=zf9EO38kI9GPhZ8KqZLMPbriVkd09aBQZxxpDkcl3zAsKnwGpzxkv7veriQqcNou/axp
 R5GnqUEHn+NQJwnnG9fL6Hy7udM98WSS7/ynIy/cePR23GVPdAGGQp+tFoFS6IDP4gwK
 qT17KwGwHEV+Q5ERx+pY3ahq3e016TSmzHLbBDYgMFIKWKQTVyx0S4CIMfxvDxSiNZ33
 r8DcgBSvt7810ZppQwYJiYONE5gKaNIgWKy+NxFXyeSepWWKwjIy9v2YBQds+sT5C5e8
 2lojUNtdNlqA7sbTgCUoAONVUQY0WLH4h3pyJQsh5aAjhKWS4gmgsUeRYKmyPcjb0/oC Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r7wgx0trp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 09:58:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2529100046;
 Thu, 15 Jun 2023 09:58:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8CF9D21682B;
 Thu, 15 Jun 2023 09:58:46 +0200 (CEST)
Received: from localhost (10.252.8.64) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 15 Jun
 2023 09:58:46 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 15 Jun 2023 09:58:11 +0200
Message-ID: <20230615075815.310261-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.8.64]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_04,2023-06-14_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/4] spi: stm32: add spi device mode
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

STM32 SPI can operate in device mode.
This series adds this functionnality in spi-stm32 driver.

Since v2:
 - Rename this series: spi device mode

Since v1:
 - Do not add #address-cells and #size-cells in st,stm32-spi.yaml
 - Do not add cs-gpio description in st,stm32-spi.yaml
 - Do not add st,spi-slave-underrun property to handle spi slave underrun

Alain Volmat (3):
  spi: stm32: renaming of spi_master into spi_controller
  spi: stm32: use dmaengine_terminate_{a}sync instead of _all
  dt-bindings: spi: stm32: disable spi-slave property for stm32f4-f7

Valentin Caron (1):
  spi: stm32: introduction of stm32h7 SPI device mode support

 .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 +
 drivers/spi/Kconfig                           |   1 +
 drivers/spi/spi-stm32.c                       | 274 ++++++++++--------
 3 files changed, 161 insertions(+), 115 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
