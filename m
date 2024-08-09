Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E6C94D725
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 21:22:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 641BAC78021;
	Fri,  9 Aug 2024 19:22:02 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC2F7C78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 19:21:55 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ef1c12ae23so24270341fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Aug 2024 12:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723231315; x=1723836115;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3zQR5I5Z9YI9eBNAvBlhP8v0AMty41l/RawM3riRFrM=;
 b=Jdh7zOCH0kg1Kml4Czv/JG6tPcq9d6s/mlPlgz6IwrOSv4bOk/pS2Id53yOBVRZf32
 fZ7AV/Sng9VupwYsryca2E5rUN/tWZ8R9oEB4h+lZ0MBg22JMU9Flz0O7ONtB9zFDqDk
 5ixsVpy5FFO0rjmrqI4wW05xCNZpXR86Z5cqe2XZxiN8m0VIDOJuD3DZjEpMztc5Eoah
 3YHfx2G2V/O6rElo68i7aBD5GJEiKcrrUmhMpYJ7R4d39toF+mrAy/35v8RUZRYHPByP
 X0O4vs0THeT9ipTwVDaswJ8L3eDnxksh24CjvUC0tcTBBEBcLeqmlGlTnAU1WO/dlOoN
 jZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723231315; x=1723836115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3zQR5I5Z9YI9eBNAvBlhP8v0AMty41l/RawM3riRFrM=;
 b=AGp1K0pUo4SWq8YpACeufZ/DWKOvn3Tm6jCmPfrFURrBNa8Yso6Jj8Qa4yWQuLRo92
 F+mXiSFcE+gnqvmXPE1Ov1aFGjYbFVIu72R6JU/DL7nq6M7OZ02rEkvTCrRTNR42CePG
 w7YTZ7SJMyqe0oQOaN2kjiBiNMcAwSbKDdkgdRV+lvRv1m3pgTcZhaUgL9/kMhiMetEz
 oI6s2O8RqraJV0BOoP4mKxBPdJJ7G/rANt0QVTPcEPn3+tCI6NstsfE8/vhmDtq3um/8
 1W6ir7ZFa6on0I+x5GU3WO44BHu9Y43epqb4ETEFPoPq7CvmOCPlM/ABbJdYS2Oh09wN
 HkYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhq+kdiDVE1OXf3Rzc9CMmU4NgMoONrsmau1KYbndCS6HZSt64bHircS7HFATBIoWY7jBKgJmoN4QWKqnWzzoWr8+SuyDOmzdusNCDdIoKh1mzVu784+B+
X-Gm-Message-State: AOJu0YwVxmymdpru+g4LAm8keNU6IkXjK/taJ1gbbb4tIUclpvvViQ0D
 u+nkD6D929cX3qjAPLW6e9f74SIiKLLR8DH+lJjHs5LA+jglRiua
X-Google-Smtp-Source: AGHT+IFZsdAmeqUUT6dg+xSHUP03KteOOKTe2JhiKfH0J1W1ciDN8u2ABk4LKTPDoact9/vXoMGhSg==
X-Received: by 2002:a2e:9dc5:0:b0:2ef:21e5:1f01 with SMTP id
 38308e7fff4ca-2f1a6d1da0dmr19326411fa.20.1723231314255; 
 Fri, 09 Aug 2024 12:21:54 -0700 (PDT)
Received: from localhost ([109.197.207.99]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f291ddbbb0sm435501fa.8.2024.08.09.12.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 12:21:53 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>
Date: Fri,  9 Aug 2024 22:21:39 +0300
Message-ID: <20240809192150.32756-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Serge Semin <fancer.lancer@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net] net: stmmac: Fix false "invalid port
	speed" warning
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

If the internal SGMII/TBI/RTBI PCS is available in a DW GMAC or DW QoS Eth
instance and there is no "snps,ps-speed" property specified (or the
plat_stmmacenet_data::mac_port_sel_speed field is left zero), then the
next warning will be printed to the system log:

> [  294.611899] stmmaceth 1f060000.ethernet: invalid port speed

By the original intention the "snps,ps-speed" property was supposed to be
utilized on the platforms with the MAC2MAC link setup to fix the link
speed with the specified value. But since it's possible to have a device
with the DW *MAC with the SGMII/TBI/RTBI interface attached to a PHY, then
the property is actually optional (which is also confirmed by the DW MAC
DT-bindings). Thus it's absolutely normal to have the
plat_stmmacenet_data::mac_port_sel_speed field zero initialized indicating
that there is no need in the MAC-speed fixing and the denoted warning is
false.

Fix the warning by permitting the plat_stmmacenet_data::mac_port_sel_speed
field to have the zero value in case if the internal PCS is available.

Fixes: 02e57b9d7c8c ("drivers: net: stmmac: add port selection programming")
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Note this fix will get to be mainly actual after the next patch is merged
in:
https://lore.kernel.org/netdev/E1sauuS-000tvz-6E@rmk-PC.armlinux.org.uk/

Cc: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f3a1b179aaea..fb63df1b99c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3422,7 +3422,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 		if ((speed == SPEED_10) || (speed == SPEED_100) ||
 		    (speed == SPEED_1000)) {
 			priv->hw->ps = speed;
-		} else {
+		} else if (speed) {
 			dev_warn(priv->device, "invalid port speed\n");
 			priv->hw->ps = 0;
 		}
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
