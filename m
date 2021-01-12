Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE4C2F2F6C
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jan 2021 13:56:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73E88C424C0;
	Tue, 12 Jan 2021 12:56:02 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 385ABC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jan 2021 12:56:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EBBC23129;
 Tue, 12 Jan 2021 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456158;
 bh=JhHkmBHJ/vjgN/AAPK9wad5MKz+neIePH2m0tWb8bxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FbpbhGSS226KUuKKru28wo2NziNtkH7aFR6M/xvWy+hZyu2edMlx64fSrLSaPF5Vi
 Al6l7jsl+ZISSKMpkobBf32eJVh7QMTM3Q6IOvF8ayVrj9oG0VMIuyLqfRBNEoYzx1
 IDIovzm+2j/o3u44+f1tNG+TULu/cQr/7KEEWca3zzJnxMSoRFDWboX67c+mTClB5o
 Cr49nmn1e+oIQmBs4cQ7FK9RmpbsrRaXgPPeT+zywBM/cv9IBVOjN6kr4rvVT5Uhyp
 /svSE3MbU07YVwa33VC9NsD4FpradypxVuIXzbPymGKVbyEDlBgVox/shr0B5KkUW9
 XbtbY2zlvQ5+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 12 Jan 2021 07:54:59 -0500
Message-Id: <20210112125534.70280-17-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125534.70280-1-sashal@kernel.org>
References: <20210112125534.70280-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Voon Weifeng <weifeng.voon@intel.com>,
 Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.10 17/51] stmmac: intel: Add PCI IDs
	for TGL-H platform
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

From: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>

[ Upstream commit 8450e23f142f629e40bd67afc8375c86c7fbf8f1 ]

Add TGL-H PCI info and PCI IDs for the new TSN Controller to the list
of supported devices.

Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
Link: https://lore.kernel.org/r/20201222160337.30870-1-muhammad.husaini.zulkifli@intel.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 81ee0a071b4e9..e5234bb02dafd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -725,6 +725,8 @@ static SIMPLE_DEV_PM_OPS(intel_eth_pm_ops, intel_eth_pci_suspend,
 #define PCI_DEVICE_ID_INTEL_EHL_PSE1_RGMII1G_ID		0x4bb0
 #define PCI_DEVICE_ID_INTEL_EHL_PSE1_SGMII1G_ID		0x4bb1
 #define PCI_DEVICE_ID_INTEL_EHL_PSE1_SGMII2G5_ID	0x4bb2
+#define PCI_DEVICE_ID_INTEL_TGLH_SGMII1G_0_ID		0x43ac
+#define PCI_DEVICE_ID_INTEL_TGLH_SGMII1G_1_ID		0x43a2
 #define PCI_DEVICE_ID_INTEL_TGL_SGMII1G_ID		0xa0ac
 
 static const struct pci_device_id intel_eth_pci_id_table[] = {
@@ -739,6 +741,8 @@ static const struct pci_device_id intel_eth_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_SGMII1G_ID, &ehl_pse1_sgmii1g_info) },
 	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_SGMII2G5_ID, &ehl_pse1_sgmii1g_info) },
 	{ PCI_DEVICE_DATA(INTEL, TGL_SGMII1G_ID, &tgl_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, TGLH_SGMII1G_0_ID, &tgl_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, TGLH_SGMII1G_1_ID, &tgl_sgmii1g_info) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, intel_eth_pci_id_table);
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
