Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C366CC74D
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 18:00:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85C08C6905A;
	Tue, 28 Mar 2023 16:00:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 961A8C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 16:00:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SE2FCt000530; Tue, 28 Mar 2023 18:00:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=oAuLL9E3dQSv/RZG+St8bKflmCvKwKf/3xQCNXsAZbI=;
 b=Ukug8FncPywnBZmTJ36/VVF+KiXJnnhqe7usSKdjgtPS/rZYQksFYAfjWaeEpYKYK2FL
 5xvW7hrwzAzBo/ZiSwfHgogjv0Q3pCtRrlagDBoYguU8ArpcwZ8Ser5IAnYyvitNygkg
 Hfq38ppX2PKo7fJ4G2OY2vADMLHIRwVI7JI3ViFF5P1MRev6QPlSd6kv77ii1F3MgP2k
 G0oBvyjZ/1sn3ACCiapHZsDCBtvSvq++Xg5zCUZIjlSdSt1Kiv+lB15pbUGvwVgdGxd9
 F4tChvKeaus7CjDWQpLoSLqFFdx4VQZWOQF6LFIknkgGCuSf+ZslbXtKRuossHOb+I+c Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pkvs4u1wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 18:00:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9CCEF100034;
 Tue, 28 Mar 2023 18:00:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59A2221A20D;
 Tue, 28 Mar 2023 18:00:29 +0200 (CEST)
Received: from localhost (10.48.0.175) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 18:00:29 +0200
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Date: Tue, 28 Mar 2023 17:58:17 +0200
Message-ID: <20230328155819.225521-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 0/2] mtd: rawnand: stm32_fmc2: do not
	support EDO mode
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

The first fix removes EDO mode support from FMC2 driver as the controller
does not support the feature (first fix is needed for v5.4+).
The second fix uses timings.mode instead of checking tRC_min timing
(second fix is needed for v5.10+).

Changes in v3:
 - The commit message of first patch has been reworked
 - Cc to stable added in each patch
 - Tudor Reviewed-by added in each patch

Changes in v2:
 - second patch added

Christophe Kerello (2):
  mtd: rawnand: stm32_fmc2: remove unsupported EDO mode
  mtd: rawnand: stm32_fmc2: use timings.mode instead of checking tRC_min

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
