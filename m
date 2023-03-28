Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 730226CBDB6
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 13:31:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25880C6905A;
	Tue, 28 Mar 2023 11:31:13 +0000 (UTC)
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [94.124.121.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D33BC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonic.nl; s=202111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=bpgSkZ5zx/R2k7vE5MA+GtuUcZGBjFY+KrjObI3nadY=;
 b=gg+oV7GqDbOQPiwgw3yhmsvareFaRM5ijLAOCT7nfvy/QWU1gCEv4c2O/RQstwOofNJ/YsFcd7fkx
 qoXdH3gyz+2nThgmB6621cv6SfFy3GXT2NVzYR8VxeNhzA1yoPO6pnfkJV79jJmt0QvQv5zAVPaAbj
 dozvLcgK+12V+ffOXKKtj9hfQUVu5yFFwA++R3rsGImJWtaGGkp50fuJqsPxENK3kdSMAk9CQe3ZBO
 l8BfVruogSdQrYurvWDsBUDTgnmswlld4WiDyTEA12IOJU+FIj1HQRMbYC91/6iTs8t/6tGKO2xSsy
 lklPaAuVCzL0uJHlRMhVTuty/txaZXg==
X-MSG-ID: b09f73ec-cd4b-11ed-829c-0050569d2c73
From: Roan van Dijk <roan@protonic.nl>
To: linux@armlinux.org.uk
Date: Tue, 28 Mar 2023 11:33:11 +0200
Message-Id: <20230328093311.1258948-1-roan@protonic.nl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Mar 2023 11:31:12 +0000
Cc: linux-kernel@vger.kernel.org, Roan van Dijk <roan@protonic.nl>,
 mcoquelin.stm32@gmail.com, David Jander <david@protonic.nl>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] arm: mach-stm32: board-dt.c: Add support for
	STM32MP151
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

This patch adds initial support of STM32MP151 microprocessor (MPU)
based on Arm Cortex-A7. New Cortex-A infrastructure (gic, timer,...)
are selected if ARCH_MULTI_V7 is defined.

Signed-off-by: David Jander <david@protonic.nl>
Signed-off-by: Roan van Dijk <roan@protonic.nl>

---
 arch/arm/mach-stm32/board-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
index 2ccaa11aaa56..5dcc4ddd1a56 100644
--- a/arch/arm/mach-stm32/board-dt.c
+++ b/arch/arm/mach-stm32/board-dt.c
@@ -21,6 +21,7 @@ static const char *const stm32_compat[] __initconst = {
 	"st,stm32mp131",
 	"st,stm32mp133",
 	"st,stm32mp135",
+	"st,stm32mp151",
 	"st,stm32mp157",
 	NULL
 };
-- 
2.37.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
