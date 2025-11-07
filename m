Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4FFC3FB05
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 12:17:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8131C5F1FF;
	Fri,  7 Nov 2025 11:17:39 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF475C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 11:17:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2947d345949so5042705ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 03:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762514256; x=1763119056;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LN8J2MPpiqnkZZeP9rMuN2R02piDWN78Q70NiOhBpfM=;
 b=arKVdgMIRGwytQV3hdXQfkQFPXJA6rOlc8rDzBe21zceb/3yGnIOMeUAaqtXEcE+hR
 3H+1mRbhm165MTWB6oZDVFWTDDDzSRb41JZOIHPHi4ThSHpcu6Vxn3dsrMYQYeqh4Aer
 rb3AgZftZo5rjrdb27hlrsoAcuXZxg1PtxYLQJx9hbggidOSqxvy68C24Sz2VIFS2pgO
 TEXSVBSPBrTsuTtxH6zsFxBjDiQeCi2GqFsnJWRjcNwnMwTLMOTbupXfSTlEC3dc8Tw7
 3t8V/wGblkAXqCBi3xGNXNWU+nXsmfTkNp60QLqBZ9P6pvJd9BvzMcidff9LxBr3TLHc
 8k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762514256; x=1763119056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LN8J2MPpiqnkZZeP9rMuN2R02piDWN78Q70NiOhBpfM=;
 b=cNbqTLuiU5HbQLqS7arfVAYm9HFYUoAyS2DjP3tThix8Ey72zauDMTVG1MrutXIdUc
 FA007eekMCXI/4et/x6Weo9NyLx3zNZ3yLADm4eBFnMBGoaLqO4UlNtC7c15paUD4ES8
 +0ruONEComqrw2T8JgN2Z6S89AzPTqXg+KQoKlaeGW0Ls/0haTtUlfY3fNVKrbhx++f0
 b9kRjNal4w7/WAAxlkk5fIosZORkT7TInawcPrm/WPIVdd3cFWEBivtf9Qgi8soQKClW
 q+wRIIOkvniWtCSFljhl51mQ3916CYffBNw+jwL0JvRfItpM1NTf1xhazUZHPgc3+ST0
 a92g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN2Oix8HS8DGbqJpu6IN6VXAy1s98KeEhq0IpnrjCj3aBhqbTIZHbVnZfO79S8xgjAb3rsppUTcU5o4w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxxJvdQvv5Fm0S++kxBgSZNhnmgCQnIGM0Sd5sfaY8i9YoWx1uP
 tPVB6e4wAZLue65ETzy6THpnkplxA2SHGJq4CSKuLALsUxIanZ2QB67d
X-Gm-Gg: ASbGncvwhPJLFUtRL13NhyLnfnfOmV/Vr489tXClrU2+fN3CAi1nmKk0h0CIIk0LJt+
 EZuG3JGN0hMb+vAAXPZvl0594rjL9eV6k+LyFf3GgmjBI3UEB4SjLiS7ZjB/r7sBx36Hsb9bAZj
 VtGPLlr43dv2psS52MT+/eF6//X0veMlOpuDM6c6gxmzhxzeagevdVtJxLj5ZlMEf6IOPUel/Q3
 fv62RnYGRXmiLtQdoGYKP6S0kH/Kzixx7O2ZJKZoz+iUcDiO603RtFvfq1hLVWDLU8fDLtqomO6
 oXPyiCimGTIaC7kLmOG5TKScQhRYoItvvZ5PKU1phzNLvbD+h2tSlfw8ajQdzuN6ueLQ2+sU+7g
 OgGTd5x+MZBjf1pFpuCRX+7Zcifu9c383NUKeVOwrr2Z1TwDWrH4CHe9nvrVQff41AVBujceCF3
 prwMWTcgWUvw==
X-Google-Smtp-Source: AGHT+IE6dkmZ1xSfeQ8gFlQLsPa6AwKU7ATxDW7ucEzzW+bfiWTWRF3rzrVJ+aYG0hm2l5jNpYpSqw==
X-Received: by 2002:a17:903:19cd:b0:268:cc5:5e4e with SMTP id
 d9443c01a7336-297c0386b92mr39537185ad.1.1762514256178; 
 Fri, 07 Nov 2025 03:17:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c6f6cdsm58791375ad.71.2025.11.07.03.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 03:17:35 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Fri,  7 Nov 2025 19:17:12 +0800
Message-ID: <20251107111715.3196746-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 0/3] net: stmmac: dwmac-sophgo: Add phy
	interface filter
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

As the SG2042 has an internal rx delay, the delay should be remove
when init the mac, otherwise the phy will be misconfigurated.

Since this delay fix is common for other MACs, add a common helper
for it. And use it to fix SG2042.

Change from v6:
- https://lore.kernel.org/all/20251103030526.1092365-1-inochiama@gmail.com
1. patch 2: fixed kdoc warning

Change from v5:
- https://lore.kernel.org/all/20251031012428.488184-1-inochiama@gmail.com
1. patch 1: remove duplicate empty line

Change from v4:
- https://lore.kernel.org/all/20251028003858.267040-1-inochiama@gmail.com
1. patch 3: add const qualifier to struct sg2042_dwmac_data

Change from v3:
- https://lore.kernel.org/all/20251024015524.291013-1-inochiama@gmail.com
1. patch 1: fix binding check error

Change from v2:
- https://lore.kernel.org/all/20251020095500.1330057-1-inochiama@gmail.com
1. patch 3: fix comment typo
2. patch 3: add check for PHY_INTERFACE_MODE_NA.

Change from v1:
- https://lore.kernel.org/all/20251017011802.523140-1-inochiama@gmail.com
1. Add phy-mode property to dt-bindings of sophgo,sg2044-dwmac
2. Add common helper for fixing RGMII phy mode
3. Use struct to hold the compatiable data.

Inochi Amaoto (3):
  dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
  net: phy: Add helper for fixing RGMII PHY mode based on internal mac
    delay
  net: stmmac: dwmac-sophgo: Add phy interface filter

 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 ++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 84 insertions(+), 1 deletion(-)

--
2.51.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
