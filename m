Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0720554DBFE
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 09:40:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AECB3C5E2CC;
	Thu, 16 Jun 2022 07:40:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 433C1C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 07:40:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G4cRO8008239;
 Thu, 16 Jun 2022 09:40:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=SipFXcGwtRjKmtMkah7OgGa+SDsq/sC6LlzRtxjzz1Q=;
 b=Iu1xrDjMQnngH3NDjfLk7RYH1PcGlevXAJbB6+ZGPPGw/jcqkMTCxjXFDUHaz7kH4eqX
 0l787Yz7xLO+ayJ0xMFYxd6XSPiC3ktbb0Gz8J2276Ab4BHI4zP8V7xhapNSYMmEUf7A
 S2hr9MBoSfHE6kl21tdKDeX9FtnlUOEFhjEv+f+bFGK5nhp761/ldV4XtkCDqaOV+K3T
 xz1S9HOiR3mHHDH92IBXy+JAT2iZGjAVQKo5NlVFFDqKzwQNxlgY0/s++EvydvAvB0q4
 UgHENjluQ/B4PyRyTD/vT7sDiPUpTHYwHbe9lNwh0Uwb8xW9Brhp0mt8SnuNcQoeizL6 QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gqeb0wy48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jun 2022 09:40:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE7EC10002A;
 Thu, 16 Jun 2022 09:40:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA24421160A;
 Thu, 16 Jun 2022 09:40:01 +0200 (CEST)
Received: from localhost (10.48.0.175) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 16 Jun
 2022 09:39:59 +0200
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Date: Thu, 16 Jun 2022 09:39:43 +0200
Message-ID: <20220616073943.669332-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_03,2022-06-15_01,2022-02-23_01
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH mtd-utils] nandflipbits: fix corrupted oob
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

If a bit is flipped in block 1 or higher, the OOB is corrupted with the
OOB of block 0. Mtd_read_oob API has to take into account the block number
to be able to calculate the right offset.

Fixes: 9fc8db29cf62 ("mtd-utils: Add nandflipbits tool")
Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 nand-utils/nandflipbits.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/nand-utils/nandflipbits.c b/nand-utils/nandflipbits.c
index aa6850f..cd66d0b 100644
--- a/nand-utils/nandflipbits.c
+++ b/nand-utils/nandflipbits.c
@@ -249,7 +249,9 @@ int main(int argc, char **argv)
 
 			bufoffs += mtd.min_io_size;
 
-			ret = mtd_read_oob(mtd_desc, &mtd, fd, blkoffs,
+			ret = mtd_read_oob(mtd_desc, &mtd, fd,
+					   bit_to_flip->block * mtd.eb_size +
+					   blkoffs,
 					   mtd.oob_size, buffer + bufoffs);
 			if (ret) {
 				fprintf(stderr, "MTD OOB read failure\n");
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
