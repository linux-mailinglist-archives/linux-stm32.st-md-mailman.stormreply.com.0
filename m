Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA9B4477B
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 22:39:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 681ABC36B29;
	Thu,  4 Sep 2025 20:39:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 027BAC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 20:39:54 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45b84367affso13422835e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Sep 2025 13:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757018394; x=1757623194;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VHuZOG1JpG+6j+YJABc/R/0AWg29WXqcswDzV+63td8=;
 b=eUWfvI3jh/5eBvGyWga2X/6nwIG+N5dGvAyoQV5L/wibLcaaMrZwsThbTc8F1Aai9H
 ullXIWD30YnI5XnrnVvATsFCRH1MV7CaiCVuMqsGUmaXyYhS5SjY68UwiMeOPO7+96Cg
 dBiVBMtBE1KfGu+QVCvUKWWmLUQvyIDOIbLcb+Sz5fnORNq831rL9l0r522SwXvACBOX
 +zVcj4tEPaNIFn/c8kyEv121nJiGkdlk6SWs6GfzUevhJFR+avSLb7Hy6KPkiqCztYBa
 R60W191h108oTuVeHIIUBQyR1C8lw90Zx5sRV0K2ltPT780aoNezqiErS5ykWgaRK5lc
 pu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757018394; x=1757623194;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VHuZOG1JpG+6j+YJABc/R/0AWg29WXqcswDzV+63td8=;
 b=g8NQGR0nGn7+KCb0D3sahmGehy41X0u/R1+ikDXOOqMKhTSzFrOpMZwmZL8yGJpqR6
 k6aog6IO2ruUgUmjNw2kKVJP8dvT4vD28nlRlEbqfv89VaoLkYF0TSy8VeDXHDHSK6Kf
 TTnuFI3Ep11tjvzUY/EO8xhN8oIW/4haw6VpDT8TI7CA4CJHfWJDylgw3WyXJBmM8zZ1
 FWop9KAq9QMJlmftLm0t52gRbnZOTdxo+cUdkRc6EFf21HwcH7Ie80yA1TiYTr8VNzhn
 Ag4V8o9fWGsx3ucAW7/O165FsVIgXJRJ9wyKOxYTNcsXM9Q1Re9zjp6vVbmsMiEziBlx
 dbAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSutU5GmCRPrK0FAGuNc8hU3yWWiCa5y6l9lJZfISxSMjOJbQJQei6iJ6KHCrpqqEdZR7LLmp0p0f0gA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzmAiRFM1pWphlUFydUYucbBa8PnuUmrYyKWdt2vz+5KwHCVliX
 1Ca+WmkMgc10RO+wBtSv+MimKR23W7Ps9aN+qn4uqyT7ZPOQH4T2Dqdh
X-Gm-Gg: ASbGncvWml4yVY7cHjAcmJReRWya1zWmfGVhOGhLL5lJHYdVajiSgNbRUivjyYiKHbh
 Iywa9+p/c6BgF2Lh+2FO8aM1hcy19ihNm8P0C8gYH0H+oC1s9TmJPrZLr5dgwusYq1FbTApXziL
 B+BUm2bzhzNzC+AVC/zaAEDNjkoVfVSZfnP7WwbfYIWUTpUVW/5dpnWhxVHc8TfzgsmMQWRAN2z
 IcDBl0qH3x2Fynz78s1Rt0miiw8E2pwdf+L+GjSmyCWB18xBLmy9PCl9wKTaYgv4SGAWNhDSqDQ
 G/HQjmNAwukFGygJNSyrp/gT2JZ8IiAQHPUs7E6iQGawBk1E8eYGQPjUx7/A1VdLM2AVGxdIcOI
 gT0AOd76BnWiuWxyRl6qNgcJHfteWzWTJ2vPCcT0Uw8HlgfmVgn94j4s1BQ==
X-Google-Smtp-Source: AGHT+IHlvUXFtdZ6T+mhP6WxjKgMVUGGmx3Q9V4gCTiNFzGUlsXnsJbQjfN4KMrRuKQgbFoPLcI9rg==
X-Received: by 2002:a05:600c:4f81:b0:45d:d1fe:804d with SMTP id
 5b1f17b1804b1-45dd1fe8388mr28814195e9.35.1757018393660; 
 Thu, 04 Sep 2025 13:39:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f306c93sm385528165e9.14.2025.09.04.13.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 13:39:53 -0700 (PDT)
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
 Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Thu,  4 Sep 2025 21:39:46 +0100
Message-ID: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/3] Add GMAC support for Renesas
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

The series first updates the generic dwmac binding to accommodate the
higher interrupt count, then extends the Renesas-specific binding with
a to document both SoCs.

The driver changes prepare for multi-SoC support by introducing OF match data
for per-SoC configuration, then add RZ/T2H support including PCS integration
through the existing RZN1 MIIC driver.

Note this patch series is dependent on the PCS driver [0] (not a build dependency).
[0] https://lore.kernel.org/all/20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v1->v2:
- Squshed incerasing interrupt count changes to snps,dwmac.yaml into this patch.
- Dropped un-necessary blank lines.
- Switched using "renesas,r9a09g077-gbeth" compatible string for RZ/T2H
  instead of "renesas,rzt2h-gbeth" and used it as a fallback for RZ/N2H.
- Updated description for reset property.
- Added pcs-handle property required for RZ/T2H.
- Updated commit message to reflect changes for patch 1/3.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and
    RZ/N2H SoCs
  net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC

 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 178 ++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |   9 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 109 ++++++++++-
 4 files changed, 243 insertions(+), 54 deletions(-)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
