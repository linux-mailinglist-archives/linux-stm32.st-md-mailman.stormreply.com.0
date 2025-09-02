Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A5DB3F175
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 02:13:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30196C3FACA;
	Tue,  2 Sep 2025 00:13:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61514C32E92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 00:13:06 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45b7ebe667cso29861635e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Sep 2025 17:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756771985; x=1757376785;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q1mPp0F3Ah67cHyiE48MxxmEH4zAc3hcVRk+cgDLZL0=;
 b=TOCl8OPdTb+deXiRi/SWBU7HScQNoUW03D+zH0XEonzx9bv7frXLMTU+MYdalJPwN+
 EvytmQhlxG3H0LpMhqfydeRnHAJwxrRx2uwKCNNjw6gEYcdLpTmKxSydzzlpOHfBC0oM
 wqsG0eKAhWQ616qaJ3b/LTWIWZPBQBd9eXlMIlhbKyJOemJMc95eT1GNPUgj5KfIm2wg
 CTEjKddoDjcOLJ5mmhU6jxZb/00SOLeKzpbfJtUACLkY2Nrjbm1EkHr8fidK2MBAtrDh
 PB6T17Jkd2LjXNZoAXtCUg1oKahNjg4ntRUQhPjZSP6M5RXbEdSANhCQ8zZrOkA/K7SN
 okIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756771985; x=1757376785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q1mPp0F3Ah67cHyiE48MxxmEH4zAc3hcVRk+cgDLZL0=;
 b=l+CfRRwdtlg4YePG+5JaJ50P4D2p+xw9uDYBduUigEf/LEmSZXytum1a9x5AjimePs
 J3BgxRCYqBf6uBVJnHHbbu6WCo9flZhBn+G0G0pUc9C+lL45fZlSH0hDhnMYBfk2kf1x
 WOtnY1p8YgJzy62FrOLkbmTfMCxJiBfHzs0ofyfXHmIJu09armgw35DzMQuIr8RdjY9Z
 kGO5xvyGSN3Q177IJcaLxeS+q9m5xKTSwSmtqavt4zRG22+GhqgX3QXyffMrXuJcj5yz
 ZXK18Y8uLMCW4Swzq3SM39XHe8jLRM1jNwAgH7/q2xMFbfvFRMx/olRN557D2/xKTdq3
 vv5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/JJKaphpJndKQvyP2btnTJHXUc3LZylUUpYx6XjmASNmO0ETak9V2YuV7aIWI5BU4vFJGA0/yRA0Aug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwIKj7MUekSSNOfo/DmFGO/WCSWIYM+oGbW+hcuJnS2KhZC5BmB
 fkGpoIXz7PiaKRV3/+hwXd9a57nUUl/eL2h8oq3BT+2262k+4Mok+EYB
X-Gm-Gg: ASbGncv3iWqSZ11tcuiAib44tyEh8dndV2TrVHycGM4DQ7YCzui1SpOirsi3Ya9DCzO
 PL6knYGmB2LBjWcTTYjR79ZT3gIBSgO+xibYqE+87IrIxrFLmwmmGYBbC9dzZ5Uq1zZPsxZeQ+K
 SQ5yhN8sSCle9AKRVlKvXKwnymUnLd3X4Lz5dGxv9WsYjKyUMRiaRRia81PKIFHJuOTWE02DuYv
 VfGnKSlgv0+Q58dccM/YTfBY6KHM0YmzfbaFMX2XNBQ1L0D9ofOJw4ei2NNl1Q6PTdhkpzOP0Qi
 DsjcHOgobbmErFQSYRDZodYiJJnTFMQZpXgVXYOEzlMyTgLG9qgTmBuzzuUTP16htVvzN685zC/
 Z1xm+qDTKzXIgubdWAue8n7mpEgZibqHWJ/0arxeZm05Yenxw5QRJbnTu
X-Google-Smtp-Source: AGHT+IHlL6b2SMKKVhDDUJtZ+fYdvzkf8dl0zJkUIm+063lRCpw2Z5DZm3K8fgdPIHbsJgZXADiykg==
X-Received: by 2002:a05:6000:3106:b0:3d1:c805:812 with SMTP id
 ffacd0b85a97d-3d1d9ac1cbfmr6494920f8f.0.1756771985380; 
 Mon, 01 Sep 2025 17:13:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 17:13:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Date: Tue,  2 Sep 2025 01:12:58 +0100
Message-ID: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/4] Add GMAC support for Renesas
	RZ/{T2H, N2H} SoCs
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series adds support for the Ethernet MAC (GMAC) IP present on
the Renesas RZ/T2H and RZ/N2H SoCs.

While these SoCs use the same Synopsys DesignWare MAC IP (version 5.20) as
the existing RZ/V2H(P), the hardware is synthesized with different options
that require driver and binding updates:
- 8 RX/TX queue pairs instead of 4 (requiring 19 interrupts vs 11)
- Different clock requirements (3 clocks vs 7)
- Different reset handling (2 named resets vs 1 unnamed)
- Split header feature enabled
- GMAC connected through a MIIC PCS on RZ/T2H

The series first updates the generic dwmac binding to accommodate the higher
interrupt count, then extends the Renesas-specific binding with a new generic
compatible string "renesas,rzt2h-gbeth" for both SoCs since they share
identical GMAC IP.

The driver changes prepare for multi-SoC support by introducing OF match data
for per-SoC configuration, then add RZ/T2H support including PCS integration
through the existing RZN1 MIIC driver.

Note this patch series is dependent on the PCS driver [0].
[0] https://lore.kernel.org/all/20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and
    'interrupt-names'
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and
    RZ/N2H SoCs
  net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC

 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 177 ++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |   9 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 109 ++++++++++-
 4 files changed, 242 insertions(+), 54 deletions(-)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
