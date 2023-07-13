Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D348752675
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 17:16:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD70DC6B459;
	Thu, 13 Jul 2023 15:16:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17C68C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 15:16:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36DE74to025596; Thu, 13 Jul 2023 17:15:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=gqU03mIrfJto315haOMHxZz3gN7Skher3I8wxR/4UKE=;
 b=VHGck6+taCaA6om7NkBVzk8OsCTqu7KcjXGTIzs8jtUlceKTbQ4yYzELQxqnIu3SslW7
 MEYLYHUxrNyYTC9bJ9p0djVtrqivHaxNkjJCfVUBxjdw5QG8xr9Edz8gLKIEaifW3X6e
 UOWiA5ehA6Wpmb2/2LW0/La+9ymPhbklcZRWuQS2Pv7l9l+IyeyxdPAEFpZYnOJc4K9R
 nCJT2IQ0no3v4g1vAPzufduXCmE3hHwyhYHSbenJByGXIsVZYHCMbaVs6QYnZEpcwdJ7
 2R14wyLQU+rwC+tbgOsRZwCWLxC5Os/vU/ISNWpSO9lRRICEDTqePOpV8QZNReGaQdTa 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rtjrc8edu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 17:15:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 92D41100056;
 Thu, 13 Jul 2023 17:15:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C86A22A6D7;
 Thu, 13 Jul 2023 17:15:51 +0200 (CEST)
Received: from localhost (10.201.22.9) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 13 Jul
 2023 17:15:53 +0200
From: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jul 2023 17:15:11 +0200
Message-ID: <20230713151518.1513949-1-thomas.bourgoin@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.9]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_05,2023-07-13_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/7] Support of HASH on STM32MP13
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

From: Thomas Bourgoin <thomas.bourgoin@foss.st.com>

The STM32MP13 platform introduces a new version of the IP HASH.
This version of the IP support SHA1, SHA2, SHA3 algorithms and HMAC.
This serie also add some fixes when using the DMA to feed data to the IP.

1. Add new YAML compatible st,stm32mp13-hash.

2. Update driver to support SHA2, SHA3 algorithms for the compatible
st,stm32mp13-hash.

3. Argument bufcnt is unused in function stm32_hash_write_ctrl. Removes it
to simplify the declaration of the function.

4-7. DMA fixes

Changes in v2:
 - Add SoB in dt-bindings: crypto: add new compatible for stm32-hash

 - Fix regression in crypto: stm32 - add new algorithms support
   The macro HASH_CSR_NB_SHA256 was equal to 22 change to 38.

 - Update commit message of crypto: stm32 - fix MDMAT condition
       Cc: stable@vger.kernel.org and
       Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Lionel Debieve (1):
  dt-bindings: crypto: add new compatible for stm32-hash

Thomas Bourgoin (6):
  crypto: stm32 - add new algorithms support
  crypto: stm32 - remove bufcnt in stm32_hash_write_ctrl.
  crypto: stm32 - fix loop iterating through scatterlist for DMA
  crypto: stm32 - check request size and scatterlist size when using
    DMA.
  crypto: stm32 - fix MDMAT condition
  crypto: stm32 - remove flag HASH_FLAGS_DMA_READY

 .../bindings/crypto/st,stm32-hash.yaml        |   1 +
 drivers/crypto/stm32/Kconfig                  |   2 +
 drivers/crypto/stm32/stm32-hash.c             | 710 ++++++++++++++----
 3 files changed, 566 insertions(+), 147 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
