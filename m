Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D35BF830758
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jan 2024 14:53:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F19DC6DD74;
	Wed, 17 Jan 2024 13:53:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3917DC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 13:53:27 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40HBLSrG008575; Wed, 17 Jan 2024 14:53:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=1qNhrPs
 JgbVSkEdgh8//+X6VT70i4GD3Lsqz0cPBVKE=; b=f80FNgBLPiuFX9L00KgWoBH
 AvjnRhfZA4IGYB8rWrAAK0EQlOWjhaiSZ9r0VFOUmuNbLZhrnPnuUdqTnd8eouvF
 yqfjmJRAvzb16mirihHNSjhCK3Vhb80Hmh614Oe4unMrP/ZGXzPlW+RsI+3YgyRx
 razv3uSTABWJJ+ZHZWmhrIa65fz+sXTLuU7vOzJo5D4wkjuFs81qqJ8TUKZDVGh8
 9vHJ7LSEa0nX9FhZFSka4eo8F2qvC2wVYnEV6mtQr7jT8tUtjgPA6ZsmoT/EqANk
 cXNP3JaRNbH7AwSN62SAUZ9gk5JV2ohB6p/+JZmBoprXl5JFr4qOVyqJqr6dHOw=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vm4y51rn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jan 2024 14:53:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A79E100079;
 Wed, 17 Jan 2024 14:53:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F417C209BD9;
 Wed, 17 Jan 2024 14:53:21 +0100 (CET)
Received: from localhost (10.252.22.63) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 17 Jan
 2024 14:53:21 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Wed, 17 Jan 2024 14:53:10 +0100
Message-ID: <20240117135312.3381936-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.22.63]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_08,2024-01-17_01,2023-05-22_02
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/2] remoteproc: stm32: Fix sparse warnings
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

Fix warnings reported by sparse using make option "C=1"

Arnaud Pouliquen (2):
  remoteproc: stm32: Fix incorrect type in assignment for va
  remoteproc: stm32: Fix incorrect type assignment returned by
    stm32_rproc_get_loaded_rsc_tablef

 drivers/remoteproc/stm32_rproc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)


base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
