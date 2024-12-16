Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B37989F34BC
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2024 16:40:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FB9EC7801C;
	Mon, 16 Dec 2024 15:40:55 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5AA9C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 15:40:49 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEYBor024315;
 Mon, 16 Dec 2024 16:40:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=u5wGE5wijHPgCUYNBXHSuk
 VMCuhvYNDhcscMJnWi4EI=; b=wDnQ/1e9NzRlJAEmmolrW6ZfzCwN5bhKfft1Ma
 HToVJAVUpNZSsw6/W3NtPZUSSdIBgeGQ1/S+t/Te6jQ7X3W0U23rJWJ6HR2RrGa1
 2xJI1QYNVTAg8lPQbWhzr+z3uwfu8b4kJEJFKGHSW2hKEBopC2VMmHSA9vdh8Qn4
 m5o1yNCDe+akkZc63m7wpZgZHyzT3WImJCVjoNtyJuPi8R1c4zfEIJwKrUvkkMWn
 s7u6ucNOtzACQMkWpIuBFkWkkl98QVNSOkxEisil+qIUtQkJ1SWhHw4Ca05Br4dQ
 g0riPTWuwuCyZvIjcf9RkVDQyG6oF+bY4jULKYmAd7sx1Saw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43jp3887bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 16:40:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8130440048;
 Mon, 16 Dec 2024 16:39:47 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6BECB277BE6;
 Mon, 16 Dec 2024 16:39:19 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Dec
 2024 16:39:19 +0100
Received: from localhost (10.252.30.129) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Dec
 2024 16:39:18 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>
Date: Mon, 16 Dec 2024 16:39:03 +0100
Message-ID: <20241216153908.3069548-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.30.129]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] ARM: dts: stm32: add counter nodes on
	stm32mp13 and stm32mp15
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

Counter driver originally had support limited to quadrature interface
and simple counter. It has been improved[1], so populate and enable
stm32 timer counter nodes on stm32mp13 and stm32mp15.

[1] https://lore.kernel.org/linux-arm-kernel/20240307133306.383045-1-fabrice.gasnier@foss.st.com/

Fabrice Gasnier (5):
  ARM: dts: stm32: populate all timer counter nodes on stm32mp13
  ARM: dts: stm32: populate all timer counter nodes on stm32mp15
  ARM: dts: stm32: add counter subnodes on stm32mp135f-dk
  ARM: dts: stm32: add counter subnodes on stm32mp157c-ev1
  ARM: dts: stm32: add counter subnodes on stm32mp157 dk boards

 arch/arm/boot/dts/st/stm32mp131.dtsi      | 40 ++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts   | 12 +++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi      | 41 +++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts  |  9 +++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 18 ++++++++++
 5 files changed, 120 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
