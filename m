Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B0BC7CC7
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Oct 2025 09:53:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ACD7C35E3F;
	Thu,  9 Oct 2025 07:53:08 +0000 (UTC)
Received: from sender3-of-o55.zoho.com (sender3-of-o55.zoho.com
 [136.143.184.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A72F2C424C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Oct 2025 06:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759905404; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RvXluu+LG4xEx2IUCN2flQrwaliLEj0ZzPMIZ3cc2a9wpnuLG2qqoyNDOGS6tFVkfLE+m5T7d+yG2znveQcBO5ItbU3q7vV3UjWzfyefkgWvrJqiEaseCCxIyL8ADTTavQiI7a2+D7F5P0s2ys+YpAe/iB3FAx+1KC8a+QBM5tg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759905404;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6IBOQA4M72hbGFUcq0MN0QpmD5I8kL0OcEW2eCfRXqs=; 
 b=Dn9g7wMyRqX7ul2fu7ZQ2xwC5kFahdXqOgPfZAXSqXu46Ml0wR9h0GdXKsPpUMnCsExHzQSs0lTLQUF6pTLf0aKv96O4HegXjsFwPJ6ho576nxk2IveURkjdyElvifU5tkf57b0Uv/OiJjFu26lNT0z9+3UVNw8WFgnB1l7FuY8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=md.asadullah@eds-india.com;
 dmarc=pass header.from=<md.asadullah@eds-india.com>
Received: by mx.zohomail.com with SMTPS id 1759905402131883.049483352964;
 Tue, 7 Oct 2025 23:36:42 -0700 (PDT)
From: Asadeds <md.asadullah@eds-india.com>
To: u-boot@lists.denx.de
Date: Wed,  8 Oct 2025 12:06:23 +0530
Message-Id: <20251008063623.1233604-1-md.asadullah@eds-india.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Approved-At: Thu, 09 Oct 2025 07:53:07 +0000
Cc: trini@konsulko.com, linux-stm32@st-md-mailman.stormreply.com,
 Asadeds <md.asadullah@eds-india.com>
Subject: [Linux-stm32] [PATCH] arm: stm32mp25: add ethernet support for
	stm32mp255 series
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

Add missing CPU_STM32MP255* cases in get_eth_nb() so that U-Boot
correctly reports 2 Ethernet interfaces on stm32mp255 devices.
This fixes the "ethernet not found" error during boot.

Signed-off-by: Md Asadullah <md.asadullah@eds-india.com>
---
 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
index 0d199f6f903..48b452f01b1 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
@@ -78,6 +78,16 @@ int get_eth_nb(void)
 	case CPU_STM32MP257Axx:
 		nb_eth = 5; /* dual ETH with TSN support */
 		break;
+	case CPU_STM32MP255Dxx:
+		fallthrough;
+	case CPU_STM32MP255Axx:
+		fallthrough;
+	case CPU_STM32MP255Cxx:
+		fallthrough;
+	case CPU_STM32MP255Fxx:
+		fallthrough;
+		nb_eth = 2;
+		break;
 	case CPU_STM32MP253Fxx:
 		fallthrough;
 	case CPU_STM32MP253Dxx:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
