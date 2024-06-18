Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8FF90D000
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 15:30:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ABDAC78001;
	Tue, 18 Jun 2024 13:30:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D891C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 13:30:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IAQ9b4022142;
 Tue, 18 Jun 2024 15:30:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=11DwoO2SWX8eyBwLh+xLeu
 RA7wZ4nhz85Dd9E+yYocs=; b=783wEJQ0aDuSD566NOC+elkNLZSaRBKE+g+HWr
 3fZ3QtqkAZlac6oCfEq/pKh/VyCPMQv5XeMYdbn6CEMxL7dQ709Mhh6rKjvnpS5/
 SmVepiMBuD5ScHT/AM4NoTbFOzAcydfoi9rDSs9d+FImL88fKAZbckcF/lrpWBAj
 1zIfx/p3i64+3brjUUWonY6z+bIpdqSqFfcLyrbgIMA1E8hcCoGriQqwDohusSeR
 JGJgHywLADt2CSWMH+XbhwIC+Qj/5/co9HLbmCNj/j79j9OWj4prfqO7vAiTwjdj
 4TvqPJcMM7SndjnjzSFOMbz1r2q6+I/8wodYYeh1xhqnn5dA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ys1ucueju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 15:30:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 416A240044;
 Tue, 18 Jun 2024 15:30:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5EFF7218624;
 Tue, 18 Jun 2024 15:29:55 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 18 Jun
 2024 15:29:55 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 18 Jun 2024 15:29:48 +0200
Message-ID: <20240618132951.2743935-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] spi: OCTAL mode fixes
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

During tests performed using spidev_test in OCTAL mode with spi-stm32-qspi.c,
several issues has been found :
  _ OCTAL mode wasn't supported in spi.c
  _ CCR register wasn't set correctly when OCTAL mode is set in spi-stm32-qspi.c.
  _ Fix dual flash mode sanity test in spi-stm32-qspi.c

Patrice Chotard (3):
  spi: stm32: qspi: Fix dual flash mode sanity test in
    stm32_qspi_setup()
  spi: stm32: qspi: Clamp stm32_qspi_get_mode() output to CCR_BUSWIDTH_4
  spi: add OCTAL mode support

 drivers/spi/spi-stm32-qspi.c | 12 +++++-------
 drivers/spi/spi.c            |  6 ++++--
 include/linux/spi/spi.h      |  5 +++--
 3 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
