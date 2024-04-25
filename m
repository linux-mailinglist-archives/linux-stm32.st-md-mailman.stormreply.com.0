Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7C58B1C2A
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 09:49:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE9B7C7128B;
	Thu, 25 Apr 2024 07:49:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB49EC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 07:49:47 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P5kYQs018290;
 Thu, 25 Apr 2024 09:49:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=37REsQ2
 FIwtIHcuFXf9WH6rSdUEg9FqQ4fkZiZRMvHk=; b=lHSbkGyjPRhga+SPcpoHitc
 PP270bH2xydSDknnFzA7E2oOQ3ZenAWl9PHI0y3oJXFxsqXEnCbgnbZQPuNeli1k
 dZCyyBdtHgtcGD38csJEKE53N3GO6PbiMGcyuyPWSsXcErSuYyF9Dv7eBHu1lqeo
 BjG/keNpuifVGltVeJTKoRZl7BqMKnJIUKUh1tV6Bvfy6gevDWvEBQDPBbMs2m2/
 IZ0o3v225ZsWJKvCJt6lzaDCxL7kUThYgTbct60cjhPHgloDukGVWU+yuJbXJk15
 iUQ/XasKvdpKK1biABBJszXBftCtu2wmVd/snwCrOPJKPu8fYHjJZ8gAwtl6EDg=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4cnmupb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Apr 2024 09:49:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8CFDB4002D;
 Thu, 25 Apr 2024 09:49:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4F4C212FD7;
 Thu, 25 Apr 2024 09:48:51 +0200 (CEST)
Received: from localhost (10.48.86.112) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 09:48:51 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>
Date: Thu, 25 Apr 2024 09:48:31 +0200
Message-ID: <20240425074835.760134-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_06,2024-04-25_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/3] ARM: st: use a correct pwr compatible for
	stm32mp15
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


This patchset removes the unexpected comma in the PWR compatible
"st,stm32mp1,pwr-reg" and uses a new compatible "st,stm32mp1-pwr-reg"
in STM3MP15 device trees.

The support of old compatible is keep to avoid ABI break.



Patrick Delaunay (3):
  dt-bindings: regulator: st,stm32mp1-pwr-reg: add correct compatible
  regulator: stm32-pwr: add support of correct compatible
  ARM: dts: st: update the pwr compatible for stm32mp15

 .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml  | 6 ++++--
 arch/arm/boot/dts/st/stm32mp151.dtsi                        | 2 +-
 drivers/regulator/stm32-pwr.c                               | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
