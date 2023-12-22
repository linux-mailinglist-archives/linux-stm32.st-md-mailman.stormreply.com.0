Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A8F81C7D5
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 11:10:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DE3EC6C841;
	Fri, 22 Dec 2023 10:10:05 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 749C8C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703239803;
 bh=sOvFaR1NZ9Jh9l7ePgit1IhBHGU3t9hoYasnTch1on0=;
 h=From:To:Cc:Subject:Date:From;
 b=Ivr/vWLxd06/abc0srWkJe31YnwBPe4FM/GeC2JhVeVwItQ71/tG++Tf1N1zAz2dJ
 ha0XR6bRgIQ7XXEZt7VN77vhdQz1XLDDGa3JEjGMKFsL2LdJcutpntXSkc6Rd6nluV
 WkYvPju9/yI96zSjwK0BMoHrEfEPhxB9Xlscy58sLEm3PikQNG1IQ7Iq4ukFVGrUVV
 CWVnlD7SAzilSj7RvP7/7txeAPYzCOl7mqZarGCqAYWsP6JbGGclutTS4NN/UCmlkv
 Y3728o0ktMZJMC4pvZiNlVy7S/j4sr2WPWxMwd2y4JkFxDepiG1S8INOLLNteqG6zs
 zTVAWrOH5uY0w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8A9183781F92;
 Fri, 22 Dec 2023 10:10:03 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Andrew Lunn <andrew@lunn.ch>,
 Jacob Keller <jacob.e.keller@intel.com>
Date: Fri, 22 Dec 2023 12:09:58 +0200
Message-ID: <20231222101001.2541758-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/2] StarFive DWMAC support for JH7100
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

This is just a subset of the initial patch series [1] adding networking
support for StarFive JH7100 SoC.

[1]: https://lore.kernel.org/lkml/20231218214451.2345691-1-cristian.ciocaltea@collabora.com/

Changes in v3:
 - Optimized jh7110 resets & reset-names properties (Rob)
 - Added R-b tag from Jacob in PATCH 1
 - v2:
   https://lore.kernel.org/lkml/20231220002824.2462655-1-cristian.ciocaltea@collabora.com/

Changes in v2:
 - Add the missing binding patch (Conor)
 - v1:
   https://lore.kernel.org/lkml/20231219231040.2459358-1-cristian.ciocaltea@collabora.com/

Cristian Ciocaltea (2):
  dt-bindings: net: starfive,jh7110-dwmac: Add JH7100 SoC compatible
  net: stmmac: dwmac-starfive: Add support for JH7100 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   | 11 +--
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 72 +++++++++++++------
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  6 +-
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 32 +++++++--
 4 files changed, 88 insertions(+), 33 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
