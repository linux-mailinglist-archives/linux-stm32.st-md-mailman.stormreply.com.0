Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15443404ACC
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Sep 2021 13:48:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D043AC5A4D8;
	Thu,  9 Sep 2021 11:48:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB0D0C59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Sep 2021 11:48:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30FB4619FA;
 Thu,  9 Sep 2021 11:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188097;
 bh=CMqxuankr/nLAtF68BcOJcYLaZl/uFUfJwFMddfQBVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VI7bnl3BXq2+NPjBQwTOERcohHyd2tSCJLeqDlyKMBx+0/mL7M3/ff2N69J+WxR4N
 bS5qgHtfuEzKIWsQloz9oQAQoJkL5BMvM/emh2E4NkgVil2qqLBOIZmBrl4OPhvK/j
 Nf9sofHSG4JDqi2UC3binUC+jBtPITcuEihY7FI27JnB2+qZGXOaAUIy/oUsSqdWQ3
 Z0so1vvK4K36GRemEEDhS9fcGDiBG7r/pUSAwOh9r5ZbuwLRVNtIFrb5LrDzb5I4pk
 2Yw3x9PYPWZGCo9AcyWCjVwkj4Ilw9B0zI08QX6YXv7ib/d3Rzw/GhFe8G90aAVnBL
 bdcGD3g7GtfmA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Sep 2021 07:44:15 -0400
Message-Id: <20210909114635.143983-79-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114635.143983-1-sashal@kernel.org>
References: <20210909114635.143983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 kernel@dh-electronics.com, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.13 079/219] ARM: dts: stm32: Set
	{bitclock, frame}-master phandles on DHCOM SoM
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

From: Marek Vasut <marex@denx.de>

[ Upstream commit a79e78c391dc074742c855dc0108a88f781d56a3 ]

Fix the following dtbs_check warning:
arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml: codec@a: port:endpoint@0:frame-master: True is not of type 'array'
arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml: codec@a: port:endpoint@0:bitclock-master: True is not of type 'array'

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: kernel@dh-electronics.com
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index 6cf1c8b4c6e2..c9577ba2973d 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -172,15 +172,15 @@ sgtl5000_port: port {
 			sgtl5000_tx_endpoint: endpoint@0 {
 				reg = <0>;
 				remote-endpoint = <&sai2a_endpoint>;
-				frame-master;
-				bitclock-master;
+				frame-master = <&sgtl5000_tx_endpoint>;
+				bitclock-master = <&sgtl5000_tx_endpoint>;
 			};
 
 			sgtl5000_rx_endpoint: endpoint@1 {
 				reg = <1>;
 				remote-endpoint = <&sai2b_endpoint>;
-				frame-master;
-				bitclock-master;
+				frame-master = <&sgtl5000_rx_endpoint>;
+				bitclock-master = <&sgtl5000_rx_endpoint>;
 			};
 		};
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
