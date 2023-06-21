Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B158738276
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 13:56:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B2E8C6B443;
	Wed, 21 Jun 2023 11:56:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B22AEC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 11:56:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35L8OqRH006129; Wed, 21 Jun 2023 13:55:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=YxBtpSM5sSg0wVwpGUcq/kres7yIfCpVOY8/p11inRU=;
 b=I5v523/vgZDUjaL9k74Z0R4EUpR6/9hhODi4Iyccc+FNBJBIuyfV2j4KzcL05V7ClDvb
 7jTU7gmaiCCTvmblVQl8rCpHqJjEoBKxsRmjdvp+oYtmDhpoGaBEIVUFoZKlHI2BhvkV
 zyEDbZcFcHjxiP6f1xxwTPqt4FMegbV1LGZ8y9igfAup1zkU0nGIxitRE+yAy5/nR6ji
 UsuosGv7R4SknRftrFHSkk8sKrJJWDtWy12znp4nw+LJ+FMnEBviAqvggNsQUqPPS+BB
 NTIrmXrIX8p+kZJyNnNSQ51zy11Sbl/OFCYOkL1/dg8d9dHiblDZnaHdoEAEaN7ce9Jb Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rbutsannu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jun 2023 13:55:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3011F100069;
 Wed, 21 Jun 2023 13:55:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17C25235F39;
 Wed, 21 Jun 2023 13:55:54 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 21 Jun
 2023 13:55:53 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
Date: Wed, 21 Jun 2023 13:55:21 +0200
Message-ID: <20230621115523.923176-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_07,2023-06-16_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] spi: stm32: disable spi device mode for
	stm32f4-f7
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

This series follows this thread:
https://lore.kernel.org/all/20230615075815.310261-1-valentin.caron@foss.st.com/

As STM32F4-F7 hardware can handle device mode and stm32 spi kernel
driver can't, a restriction should be put in the kernel driver and
not in the device-tree bindings. This series fixes that.

Valentin Caron (2):
  spi: stm32: disable device mode with st,stm32f4-spi compatible
  spi: dt-bindings: stm32: do not disable spi-slave property for
    stm32f4-f7

 .../devicetree/bindings/spi/st,stm32-spi.yaml     |  1 -
 drivers/spi/spi-stm32.c                           | 15 ++++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
