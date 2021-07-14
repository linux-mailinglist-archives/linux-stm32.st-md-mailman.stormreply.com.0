Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E99D33C8D69
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:42:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B59C0C597B4;
	Wed, 14 Jul 2021 19:42:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1F89C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:42:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A102613D6;
 Wed, 14 Jul 2021 19:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291742;
 bh=zQwGF7FYOzS9A3/b35r9uSjCfXpspF/d10Zu18b6t5c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GsmeEp9DN2TsyduEBTAAJOHLTGB21P4PYiZ3tThC532KKi0DMIkzLm20/JW/Pc4da
 hzqxIJd5JzHvE9X0jDvbzxauHHkrsUO5zXBPnj+HBaxNZibaDuIsKKpGLfcHRj8nRj
 ojc5QdYH6yzEB+C8AzL5dIsA1mlGFhr5fVFnpPMAtcxOz2XFRLypfQftdzIH0niciW
 PcI36H2Hp5SYn9pfwC8iwPOe/an/ay5hCFS7FSxO02LtCr7Vq7EKSy9M5/x8dh0/o2
 dZpSresH7wsz4hvwSPBHf6/NQMjKY1bVcMtzQNWXjLFz0ShJGOiJfRoIeQDmKWVYVE
 6NlOFmVb/bDTQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 14 Jul 2021 15:40:07 -0400
Message-Id: <20210714194036.53141-74-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194036.53141-1-sashal@kernel.org>
References: <20210714194036.53141-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 kernel@dh-electronics.com, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.12 074/102] ARM: dts: stm32: Rename
	spi-flash/mx66l51235l@N to flash@N on DHCOM SoM
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

[ Upstream commit 9b8a9b389d8464e1ca5a4e92c6a4422844ad4ef3 ]

Fix the following dtbs_check warning:
spi-flash@0: $nodename:0: 'spi-flash@0' does not match '^flash(@.*)?$'

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
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 2 +-
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 1c1c4198f2c1..6c8930fc1632 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -367,7 +367,7 @@ &qspi {
 	#size-cells = <0>;
 	status = "okay";
 
-	flash0: mx66l51235l@0 {
+	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-rx-bus-width = <4>;
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
index 803eb8bc9c85..a9eb82b2f170 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
@@ -194,7 +194,7 @@ &qspi {
 	#size-cells = <0>;
 	status = "okay";
 
-	flash0: spi-flash@0 {
+	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-rx-bus-width = <4>;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
