Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B27CA0B1F0
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 10:00:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2EEAC7802D;
	Mon, 13 Jan 2025 09:00:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6EEDC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 09:00:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5kEGo011711;
 Mon, 13 Jan 2025 10:00:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=IBTkV7f3tHLL3a0/+LFUjq
 8XSR+FbJv2mVoRlaCf1rc=; b=zB/xkpxP3y7ogr9OMuZMglx/AL5ur2pcsS3ggR
 P7ZlZyHRSXBjoPdh0ECDzpo80CxJvjS23OSX6rPNQPHx5y6gnNNNfJLZIwzf9Aqs
 mlrPGLRlV/KgvGA6guQkEKHuURhlvzT7k3BCO38fQW0iw5YN3o8tWAse3Zxk/kx0
 ihVMYbfhVQJjipl1a0F6/khTUQA4e8cp6WS4xXiscaO2WJbugRChmp2lwj4lRtsa
 C8Nyr+WHWTD6g+TAnYYKcFhCUcoJ0HKgA0WVPBcdb832T5EQ5lXJ0iZclZKKB8Ut
 RMORrVSMniExrWVEQY82CIrKSs2uJm5iu6MlSkgzccw8Uq5Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444vyr0p8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 10:00:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 041934004F;
 Mon, 13 Jan 2025 09:59:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49A4A231332;
 Mon, 13 Jan 2025 09:58:12 +0100 (CET)
Received: from localhost (10.129.178.39) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:58:11 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 13 Jan 2025 09:57:50 +0100
Message-ID: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI7VhGcC/43NTQqDMBCG4atI1o1MosHYVe9RitRkrFnkB0ekR
 bx7o9BFV+3y/RieWRnh5JDYuVjZhIsjF0OO6lQwM97DA7mzuZkEWQspGm7IddZ4l1Lnk1Qdhnx
 m0GOYiesWAXEQbd0PLBNpwsE9D/56yz06muP0Or4tYl//hBfBgcu+rqQGZUVjL0MkKmkuTfRsp
 xf54RQI0D84mTlQGrRBBViLb27btjdkw5BjGQEAAA==
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.129.178.39]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 0/9] media: stm32: csi / dcmipp corrections
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

Various fixes within the stm32 csi bindings/drivers and
stm32 dcmipp driver.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Changes in v3:
- Add commit 'media: stm32: dcmipp: correct ret type in dcmipp_graph_notify_bound'
- Link to v2: https://lore.kernel.org/r/20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com

Changes in v2:
- Correct commit message within the dt-binding commit, related to
  removal of bus-type property from the example.
- Link to v1: https://lore.kernel.org/r/20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com

---
Alain Volmat (9):
      media: stm32: dcmipp: correct ret type in dcmipp_graph_notify_bound
      dt-bindings: media: clarify stm32 csi & simplify example
      media: stm32: csi: add missing pm_runtime_put on error
      media: stm32: csi: register subdev only at end of probe
      media: stm32: csi: use ARRAY_SIZE to search D-PHY table
      media: stm32: csi: simplify enable_streams error handling
      media: stm32: csi: remove useless fwnode_graph_get_endpoint call
      media: stm32: csi: correct unsigned or useless variable settings
      media: stm32: dcmipp: add has_csi2 & needs_mclk in match data

 .../bindings/media/st,stm32mp25-csi.yaml           |   5 +-
 drivers/media/platform/st/stm32/stm32-csi.c        | 102 +++++++++++----------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  23 +++--
 3 files changed, 67 insertions(+), 63 deletions(-)
---
base-commit: d216d9cb4dd854ef0a2ec1701f403facb298af51
change-id: 20241217-csi_dcmipp_mp25_enhancements-89e0eef194bf

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
