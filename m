Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F6AB2F98
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 08:31:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74D6FC78F8C;
	Mon, 12 May 2025 06:31:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D63DEC78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 06:31:17 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BMG0Xq027496;
 Mon, 12 May 2025 08:30:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=xEvO38UxR3TTkIts3bIi48
 jhoAAjtchguqrU+RI62HM=; b=HW1wDHX4Qlx6OJht/bWKC3Dh3vYO6re6KsO+Uv
 nhTdTTAG56fDwHJlLcO+pF7yyrht76c95x9kMlQW8GkMD3pVtvSyaNVPz6sPm5z2
 aAHhopqPiEMs9KHQpq+MdoDXAZUBJAa3cgNoADHvrvnDYFK9dE+4tIvgkAeuUl9L
 s7dOOJ6CGd7i22GhPnshQmTHZUnozxt73ZOLzbyQjoiuoDMr3V1u6KuIaDuqQQ1y
 D3pFABosKN3dlA2AvD5ScLzuFkp2GpOG/5OdEZ11kFqyOV2a4q3DdvPvL9it0uZS
 49vZZPsEmVuuQvr5OtzNHvXS0e/S6HxwZjTdcKj1g66VW8YQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46jgc437yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 May 2025 08:30:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E6FF64006D;
 Mon, 12 May 2025 08:29:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D124A4B610;
 Mon, 12 May 2025 08:29:38 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 08:29:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 12 May 2025 08:29:30 +0200
Message-ID: <20250512-upstream_omm_ospi_dts-v10-0-fca0fbe6d10a@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEqVIWgC/3WNwQ6CMBBEf8Xs2ZJlA2o9+R+GECiL7AFKupVoC
 P9uJV49zOFNMm9WUA7CCtfDCoEXUfFTghyPB3BDMz3YSJcKIKQSixzNc9YYuBlrP6boLHUX1WD
 R2rNzSFwSpO0cuJfXLr5XiQfR6MN7/1nst/0Z6fLHuFiD5kQlUZu3aIluvVfNNGbOj1Bt2/YBQ
 ZZHdL0AAAA=
X-Change-ID: 20250410-upstream_omm_ospi_dts-04b97cc02e52
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_02,2025-05-09_01,2025-02-21_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v10 0/3] arm64: dts: st: Add SPI NOR support
 for stm32mp257f-ev1
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

Add SPI NOR support for stm32mp257f-ev1 board by adding:
  _ Octo memory Manager node in stm32mp251.dtsi
  _ OSPI port1 pinctrl entries in stm32mp25-pinctrl.dtsi
  _ Add SPI NOR support for stm32mp257f-ev1.dts

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Changes in v10:
- rebase on top of next-20250509 to fix DTB warnings.
- Link to v9: https://lore.kernel.org/r/20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com

Changes in v9:
  - split patchset by susbsystem, current one include only DTS related
    patches.
  - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com

---
Patrice Chotard (3):
      arm64: dts: st: Add OMM node on stm32mp251
      arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
      arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 51 +++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 54 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 32 ++++++++++++++++
 3 files changed, 137 insertions(+)
---
base-commit: ed61cb3d78d585209ec775933078e268544fe9a4
change-id: 20250410-upstream_omm_ospi_dts-04b97cc02e52

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
