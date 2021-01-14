Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E082F60CE
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 13:13:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6514DC5660F;
	Thu, 14 Jan 2021 12:13:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37D25C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 12:13:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10ECCe4e016159; Thu, 14 Jan 2021 13:13:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=JfIx5atQouE/R4/zGfspOhyNCyg29ivNiiZH2lPhL+E=;
 b=5Lv/q7+gtkL1gF7R6wp1As5lrIbScvigmNY7O56a+Cfq1JNB50jPjqtEBIXI3JReUCD9
 1+3kglTOSm2/N5tnnK0nW4TvNFBiZyGOJrJpeYzwgyO8cuCKfJFVqpqQRghb8kUhtvD6
 KjVG7P36+qwFt2a0EdQziltNuwR/06IJHVSkbBNPGZDDzia/4w86pvhzPeMXhDDko5BC
 TW+vqKtVn/isD4bsuSJ0Z6kTcc4+QZvs+C0AY20aKIx2qP1D9OP6r/pn//bziGRxJO9P
 W7Z0YrlTc/075vtCMUOG5dJ7ZIJTKQTR7YW+4u/Rg73kV8ckB79NMGTfVlubcMQOu74P JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5kywkmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 13:13:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFA1710002A;
 Thu, 14 Jan 2021 13:13:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C056823BD5F;
 Thu, 14 Jan 2021 13:13:10 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan 2021 13:13:10
 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Jan 2021 13:13:04 +0100
Message-ID: <20210114121308.31326-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_04:2021-01-14,
 2021-01-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/4] ARM: stm32: USBPHYC updates on stm32mp15
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

This series updates usbphyc parent and child nodes to follow latest DT
bindings.

Amelie Delaunay (4):
  ARM: dts: stm32: add usbphyc vdda1v1 and vdda1v8 supplies on
    stm32mp151
  ARM: dts: stm32: remove usbphyc ports vdda1v1-vdda1v8 on
    stm32mp157c-ed1
  ARM: dts: stm32: remove usbphyc ports vdda1v1-vdda1v8 on
    stm32mp15xx-dkx
  ARM: dts: stm32: add #clock-cells property to usbphyc node on
    stm32mp151

 arch/arm/boot/dts/stm32mp151.dtsi      | 3 +++
 arch/arm/boot/dts/stm32mp157c-ed1.dts  | 4 ----
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 4 ----
 3 files changed, 3 insertions(+), 8 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
