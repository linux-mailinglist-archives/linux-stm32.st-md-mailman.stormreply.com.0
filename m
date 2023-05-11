Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A54D76FE872
	for <lists+linux-stm32@lfdr.de>; Thu, 11 May 2023 02:20:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50FFDC6A5F2;
	Thu, 11 May 2023 00:20:10 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94EF1C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 May 2023 00:20:09 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3584D860B0;
 Thu, 11 May 2023 02:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683764409;
 bh=eo6OjRKTPtw7KrsHnlEmccaV42o2lfWM/x3sgpUKhVk=;
 h=From:To:Cc:Subject:Date:From;
 b=pL0gKYmEV4vryPnjk0Sj49GSSnvPfBjKOwG/+E1nL6l6LINjbHI96hMKL/HsXFgsn
 GpopeUKSuWiqGZrOunET/EWq45ZKvx/z0iwq+DmNvD6E7QAYihpAn/fSIYOvdc3Kd3
 /leAFVAElIp2Jup1RJ4zdrpUuB2kv/1FrVW6yRw6rqeEYYOYX0uPiJwUyd3ZK3e6D2
 3kgSKWO9wgng4W13r/9/ueqmKesXDN+zbalKIPiXCp5ZYyC8TywOuoV2t1kqbotcYd
 RWBiC1Ki5veDdyH7N2zaV26+Q4fQZ+qT3em0BT2/c3mfa6Saipr3e+cX6I8TWF2FWB
 E+H5r4VU1cJ6g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 11 May 2023 02:19:47 +0200
Message-Id: <20230511001949.179521-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/3] irqchip/stm32-exti: Add STM32MP15xx IWDG2
	EXTI to GIC map
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

The EXTI interrupt 46 is mapped to GIC interrupt 151. Add the
missing mapping, which is used for IWDG2 pretimeout interrupt
and wake up source.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-watchdog@vger.kernel.org
---
 drivers/irqchip/irq-stm32-exti.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 6a3f7498ea8ea..f684be77ba378 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -208,6 +208,7 @@ static const u8 stm32mp1_desc_irq[] = {
 	[31] = 53,
 	[32] = 82,
 	[33] = 83,
+	[46] = 151,
 	[47] = 93,
 	[48] = 138,
 	[50] = 139,
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
