Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E57420B120
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jun 2020 14:08:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD4E7C36B14;
	Fri, 26 Jun 2020 12:08:55 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDB1EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 12:05:36 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id a1so9084845ejg.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 05:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nR2VtgwF7F9W5HFmQx6MyGh5iwe4EvSvTxPQrcM2OfA=;
 b=QfLAPtlSom2vjh/UgG3x+Z9xdz8P8W5cPtskt7nvEXO6gtIvbXVuLLkzagDi4PjsFa
 StIMhc182BACUjaLImZVGhSOkurSTQ98vBP7h4q1W5nlAhyYkIridmDDZG/pkyVc1prf
 7bpm0EvCuk5ZiZy2j5yJDpNkjsieQ0oUyghQz+PNNopk9kkt1kzUej63Fr8zHmvhuuMt
 tef0eCnPojyQd7q18LDo8A6+yDLWnXOkxq6nbKBzXn6NRpq3bJOhWd86hRB7zqbZIvBx
 M/UsF0HLUAGp29/fZNb4BwXADD/Vv1I9QyZ6gzFApQUoYhKs3zHZHS9T+KV4ZUg9rEef
 IK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nR2VtgwF7F9W5HFmQx6MyGh5iwe4EvSvTxPQrcM2OfA=;
 b=YEVy80626tWcpRXBFk9mK/8hgGbx//jFZfqk3sNFpflV7ZHTXEAhbA6InE0XNlZdo1
 dI41ex3Lo8fWnTUY8zVXConA7dhG3QTbXFGARYJ3m8srZ7rfM7mO0FheFfJxu8g4cwET
 1CCM2sPGBMuAJ/gCwCe5udoMMZxEfGniYiBrFab7xJ8lKgyqAab/+ANKMSzubW/94JL0
 aNJ/fZ4B28NsYWILav880bIyC85iJ7H5QZL/S2cLEXQvTtpaYAT7hpw7Gjpfq9wovO4k
 yWc+Tt5VaMaoqZP4rGI0RuNqDO4NAbEYpq6cc8aAM3KN4dtQjq+gRJvyUinQzBArMCnT
 CNaQ==
X-Gm-Message-State: AOAM531Ua6qjLHbRrVndw8jxJdgXa5GNCy8T4aAKbWiS/zERn0XBHdRL
 xqMD9ltXTVugKDNO1MENFgI=
X-Google-Smtp-Source: ABdhPJwZ8M1BQ2yH0DeD+1br27YkhVt9aUJrcA1oAtfzVrHHpr0ijzgJNJUutvTNYuggWpiGff/Gbg==
X-Received: by 2002:a17:906:7247:: with SMTP id
 n7mr2244351ejk.105.1593173136604; 
 Fri, 26 Jun 2020 05:05:36 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id l27sm5024153ejk.25.2020.06.26.05.05.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 05:05:36 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: peppe.cavallaro@st.com
Date: Fri, 26 Jun 2020 14:05:27 +0200
Message-Id: <20200626120527.10562-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200626120527.10562-1-jbx6244@gmail.com>
References: <20200626120527.10562-1-jbx6244@gmail.com>
X-Mailman-Approved-At: Fri, 26 Jun 2020 12:08:54 +0000
Cc: heiko@sntech.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] net: stmmac: add Rockchip as supported
	platform in STMMAC_PLATFORM help text
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The Kconfig menu has an option for DWMAC_ROCKCHIP.
Then add Rockchip also as supported platform in the help text
of STMMAC_PLATFORM.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 8f7625cc8..8309e05b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -33,7 +33,7 @@ config STMMAC_PLATFORM
 	---help---
 	  This selects the platform specific bus support for the stmmac driver.
 	  This is the driver used on several SoCs:
-	  STi, Allwinner, Amlogic Meson, Altera SOCFPGA.
+	  STi, Allwinner, Amlogic Meson, Altera SOCFPGA, Rockchip.
 
 	  If you have a controller with this interface, say Y or M here.
 
-- 
2.11.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
