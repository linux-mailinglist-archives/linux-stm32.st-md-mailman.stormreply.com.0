Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D009C6072B4
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Oct 2022 10:45:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B58CC64116;
	Fri, 21 Oct 2022 08:45:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8033C64101
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Oct 2022 08:45:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29L6HQFj014461;
 Fri, 21 Oct 2022 10:44:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=nN+eZrxubuUpxtvA/HEiuz0ghp0wsel2bTnX1jUh+Mg=;
 b=rpnShfZowOwph9MLX1pAC7sSejMuGfhtta50et9sEhcUX1Uv1XsSenHCPriiu0ngpN+5
 r5EnoQjrK39JkeYHlBAYryo5JDXmdYDlUF+TBlSaPHgbi9edz1wgofhac4v2WMAo36op
 MLiRfJ0H/MpVfM+h2mm5WUOdSOxO+1WEMirBz50ZrmekMHicvo+sj+u0071tqZtMEHHI
 5P1QOaICAqqBXbvLHgGNqSwZzFrKySbnITdL+68wfeBOaAB1Nl/ll0ymy3iiJDVk7SjC
 G9FKSiI0wPe/9s9IcwhOsgckwbdqBZl1qe14SC0JWPWpO8sXxgGhPl3BT/t0rpILJHrG kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k9tfpy660-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 10:44:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 34DB7100034;
 Fri, 21 Oct 2022 10:44:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EC5F21B525;
 Fri, 21 Oct 2022 10:44:48 +0200 (CEST)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:44:47 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek
 <michal.lkml@markovi.net>, <robh+dt@kernel.org>
Date: Fri, 21 Oct 2022 10:44:47 +0200
Message-ID: <20221021084447.5550-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_03,2022-10-20_01,2022-06-22_01
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Subject: [Linux-stm32] [PATCH] scripts: dtc: only show unique unit address
	warning for enabled nodes
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

In some cases an hardware peripheral can be used for two exclusive usages.
For example, on STM32MP15 we have the same peripheral for I2S and SPI. We
have dedicated driver for each usage and so a dedicated device node in
devicetree.
To avoid to get useless warnings running "make W=1 dtbs", this patch adds
the "-Wunique_unit_address_if_enabled" flag for a make with W=1. In this
case we will detect a duplicate address only if both devices are
enabled in the devicetree, which is a real error case.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3aa384cec76b..6f077200b967 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -344,6 +344,9 @@ DTC_FLAGS += -Wno-unit_address_vs_reg \
 	-Wno-graph_child_address \
 	-Wno-simple_bus_reg \
 	-Wno-unique_unit_address
+else
+DTC_FLAGS += -Wno-unique_unit_address \
+        -Wunique_unit_address_if_enabled
 endif
 
 ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
