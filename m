Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3448D3C8DCB
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:44:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC558C597B1;
	Wed, 14 Jul 2021 19:44:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5984C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:44:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E147F613CF;
 Wed, 14 Jul 2021 19:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291855;
 bh=kanAVcR/RsFXrB3aUwDCHE+QP+cJIKP6joJqfimnSQI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gR15yzAGHdIqMN9yg7Yz2gTTqjD2xfa5br+eLsxoATKFlSSbfVqDxq/e/7b4v38wF
 6Lu5jrR5uQR39axclua9+3FXfjK0bStI9KZaHz3Kz0pe7FwYIxOFlv3qPLHpvAAf0f
 K+peLrrc+Vgnyl10iGmVzrQ87YBiMBsNBuzf7YMib7c0qtD6+BDNVzEecDqufENsam
 sKNcmycO2008TO5AGJkgQHtcYEdrLILsQt24zy4+CAbk67m9yhZrx7ZHc81To24L4G
 TlcBh4idTZ0MlTPGoBPhw88tEPuctlqEbZ5fMc4CJXC5IbcK/8cly7N92DKzBmXNfs
 Gotaba75bI7aw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 14 Jul 2021 15:42:22 -0400
Message-Id: <20210714194303.54028-47-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194303.54028-1-sashal@kernel.org>
References: <20210714194303.54028-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.10 47/88] ARM: dts: stm32: Remove
	extra size-cells on dhcom-pdk2
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

[ Upstream commit 28b9a4679d8074512f12967497c161b992eb3b75 ]

Fix make dtbs_check warning:
arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml: gpio-keys-polled: '#address-cells' is a dependency of '#size-cells'
arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml: gpio-keys: '#address-cells' is a dependency of '#size-cells'

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index 8456f172d4b1..180a0187a956 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -34,7 +34,6 @@ display_bl: display-bl {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#size-cells = <0>;
 		poll-interval = <20>;
 
 		/*
@@ -60,7 +59,6 @@ button-2 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#size-cells = <0>;
 
 		button-1 {
 			label = "TA2-GPIO-B";
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
