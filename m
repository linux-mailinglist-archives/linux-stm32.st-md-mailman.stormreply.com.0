Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1CA439A45
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Oct 2021 17:18:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 908F0C5C825;
	Mon, 25 Oct 2021 15:18:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A50C8C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Oct 2021 15:18:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PDvnFP003305; 
 Mon, 25 Oct 2021 17:18:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=/B1ovPvs1F2t7y2D3TF9nCO3cWsr7QGR4ztsocLXIvc=;
 b=jjJriQBlTnnCoklBSJh/Pphqgq5qKXIYimCuw66IgPl+8PiDu2wZUvo/Brtog8ICmGWg
 lgBT31T+5qEpVDRtDKIbUXdkHOBqUsJfqZ5WzdpEis4iJOgZUoVgJwAYXUZJTWpqoMg7
 aSJ+ZEcBbHV2KZ9PUxFHC5NF/Ea55FxH6i60v8+6Hd12+GPZexloAC1v5rxBtLB293Ae
 v/myklU5jC0DqjGzyOi94oCQLP0o0PU/Vvvy0/i6P11b4PRq5K1dYPSHmWosNii6vLhh
 SuExehiBCHztbREcaTfaiQCDrtDa4q1Uy1VGz8riPSqSLpKWHUQUJYdcHZ7ypqsdGakl Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bwrvj2anx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 17:18:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A47BC100038;
 Mon, 25 Oct 2021 17:18:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D72324187B;
 Mon, 25 Oct 2021 17:18:04 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 25 Oct 2021 17:18:04
 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>
Date: Mon, 25 Oct 2021 17:17:48 +0200
Message-ID: <1635175070-28722-1-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_05,2021-10-25_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] tune the HS USB PHYs on stm32mp15 eval
	and disco boards
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

This series tune the HS USB PHYs on stm32mp15 eval and disco boards, now that
dt-bindings and drivers have been merged in [1].

[1] https://lore.kernel.org/all/20211015161427.220784-1-amelie.delaunay@foss.st.com/

Fabrice Gasnier (2):
  ARM: dts: stm32: tune the HS USB PHYs on stm32mp15xx-dkx
  ARM: dts: stm32: tune the HS USB PHYs on stm32mp157c-ev1

 arch/arm/boot/dts/stm32mp157c-ev1.dts  | 22 ++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 16 ++++++++++++++++
 2 files changed, 38 insertions(+)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
