Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F5E6F175B
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Apr 2023 14:16:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08914C6A5E6;
	Fri, 28 Apr 2023 12:16:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 176DDC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Apr 2023 12:16:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SADpqd030542; Fri, 28 Apr 2023 14:16:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=85jl4gZs80ETP6AjY8It7o3CevTJ65Dn1pr+nB8DQUA=;
 b=n4qgZ3w0q5NPN1360Fb/tHLIYhkLld9EY74NauyP5JLa7b9hhjens0SfnrVn8/hNbMDw
 zJtON++ufDHsqqWnAQudEAnWR52l2uXbJwsGs6JEunApCv+vo6Ww6dfwcTd8bYtSBvt+
 Ge4GzdpqdI+ll+OKMDMVi/mlvSD+ZYn65p+EBdoOvoX7mL4jyqlMpOMo7vXGb9scqaNR
 lIIH6rP8Ph4qEenihUqbeNzDlkLTQcIitiw/TyLeQ9OdY8/EZ4BWp3nICGP0yeIc/eZH
 SMTphs//bkGfsPP0UArZecBUu3+Xw/DJ3tjn5u7k+Y49IP9zi6VYQo10hVIwloiPeyQR uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q7x8dduh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 14:16:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CD5F710002A;
 Fri, 28 Apr 2023 14:16:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB9BA227EE0;
 Fri, 28 Apr 2023 14:16:10 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 28 Apr
 2023 14:16:10 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 28 Apr 2023 14:15:17 +0200
Message-ID: <20230428121524.2125832-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_04,2023-04-27_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/7] spi: stm32: add spi slave mode
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

STM32 SPI can operate in slave mode.
This series add this functionnality in spi-stm32 driver.

The device-tree property st,spi-slave-underrun can configure STM32 SPI
reaction to an underrun.

Alain Volmat (3):
  spi: stm32: renaming of spi_master into spi_controller
  spi: stm32: use dmaengine_terminate_{a}sync instead of _all
  dt-bindings: spi: stm32: add bindings regarding stm32h7 spi slave

Valentin Caron (4):
  dt-bindings: spi: stm32: add address-cells and size-cells into yaml
  spi: stm32: introduction of stm32h7 SPI slave support
  dt-bindings: spi: stm32: add stm32h7 st,spi-slave-underrun property
  spi: stm32: add support for stm32h7 SPI slave underrun detection

 .../devicetree/bindings/spi/st,stm32-spi.yaml |  19 +
 MAINTAINERS                                   |   1 +
 drivers/spi/Kconfig                           |   1 +
 drivers/spi/spi-stm32.c                       | 386 ++++++++++++------
 include/dt-bindings/spi/spi-stm32.h           |  15 +
 5 files changed, 307 insertions(+), 115 deletions(-)
 create mode 100644 include/dt-bindings/spi/spi-stm32.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
