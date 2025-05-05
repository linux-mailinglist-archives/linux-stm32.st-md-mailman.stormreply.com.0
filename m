Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBD0AAA00D
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 00:31:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22CBAC57194;
	Mon,  5 May 2025 22:31:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCA0FC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 22:31:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4267B5C5521;
 Mon,  5 May 2025 22:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D396FC4CEF1;
 Mon,  5 May 2025 22:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484278;
 bh=g2l8e60TVojOygbW8eyFICSVVjr2ivWSE2C2kKPrgXI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m+PVU3wOOnnG2vNPqWGD826DoZkO5grGoRuoYr6IfWAZ9giht0tk5t82IKBFLUHcS
 TQ+uiJEIO50u73K2MhmubaQ0OgugMnl97RHhaZLi6DmlqGI8k1TuyjVEJEwuRs6n9B
 4tY1T9PjSw5Q8zE3F4g8G4EsNp/v3tue1KVs68SxOk4NCaoCaO73ghTLaKQYBqhL2l
 VNBt0bUj1q7RTU/tSI6kwtM0FFIbhdsOpc5OJSdjR75OGlNorwWPqxFi7XBUqX/3R7
 c8uoRsqXIAU/il6Oqm96UMnrpcgkw4DGseMcAjSdL7qfEbqW9ccFk7wnIhX4ApvMjm
 MI5735vo4r7XA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon,  5 May 2025 18:10:46 -0400
Message-Id: <20250505221419.2672473-430-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Cc: Sasha Levin <sashal@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 mcoquelin.stm32@gmail.com, mchehab@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH AUTOSEL 6.14 430/642] media: stm32: csi: use
	ARRAY_SIZE to search D-PHY table
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

From: Alain Volmat <alain.volmat@foss.st.com>

[ Upstream commit a3a91b6e62be24c5df47a800c367504cb41e502b ]

Within stm32_csi_start, use ARRAY_SIZE loop in order to search
for the right setting.
Avoid useless init of lanes_ie / lanes_en.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index 48941aae8c9b8..a4f8db608cedd 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -325,7 +325,6 @@ static const struct stm32_csi_mbps_phy_reg snps_stm32mp25[] = {
 	{ .mbps = 2400, .hsfreqrange = 0x47,	.osc_freq_target = 442 },
 	{ .mbps = 2450, .hsfreqrange = 0x48,	.osc_freq_target = 451 },
 	{ .mbps = 2500, .hsfreqrange = 0x49,	.osc_freq_target = 460 },
-	{ /* sentinel */ }
 };
 
 static const struct v4l2_mbus_framefmt fmt_default = {
@@ -444,13 +443,13 @@ static void stm32_csi_phy_reg_write(struct stm32_csi_dev *csidev,
 static int stm32_csi_start(struct stm32_csi_dev *csidev,
 			   struct v4l2_subdev_state *state)
 {
-	const struct stm32_csi_mbps_phy_reg *phy_regs;
+	const struct stm32_csi_mbps_phy_reg *phy_regs = NULL;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	const struct stm32_csi_fmts *fmt;
 	unsigned long phy_clk_frate;
+	u32 lanes_ie, lanes_en;
 	unsigned int mbps;
-	u32 lanes_ie = 0;
-	u32 lanes_en = 0;
+	unsigned int i;
 	s64 link_freq;
 	int ret;
 	u32 ccfr;
@@ -474,11 +473,14 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 	mbps = div_s64(link_freq, 500000);
 	dev_dbg(csidev->dev, "Computed Mbps: %u\n", mbps);
 
-	for (phy_regs = snps_stm32mp25; phy_regs->mbps != 0; phy_regs++)
-		if (phy_regs->mbps >= mbps)
+	for (i = 0; i < ARRAY_SIZE(snps_stm32mp25); i++) {
+		if (snps_stm32mp25[i].mbps >= mbps) {
+			phy_regs = &snps_stm32mp25[i];
 			break;
+		}
+	}
 
-	if (!phy_regs->mbps) {
+	if (!phy_regs) {
 		dev_err(csidev->dev, "Unsupported PHY speed (%u Mbps)", mbps);
 		return -ERANGE;
 	}
@@ -488,8 +490,8 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 		phy_regs->osc_freq_target);
 
 	/* Prepare lanes related configuration bits */
-	lanes_ie |= STM32_CSI_SR1_DL0_ERRORS;
-	lanes_en |= STM32_CSI_PCR_DL0EN;
+	lanes_ie = STM32_CSI_SR1_DL0_ERRORS;
+	lanes_en = STM32_CSI_PCR_DL0EN;
 	if (csidev->num_lanes == 2) {
 		lanes_ie |= STM32_CSI_SR1_DL1_ERRORS;
 		lanes_en |= STM32_CSI_PCR_DL1EN;
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
