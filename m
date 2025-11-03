Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23751C29E86
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 04:05:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB9B5C62D20;
	Mon,  3 Nov 2025 03:05:45 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EDB7C628DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 03:05:44 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b95cdcacd95so1127148a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Nov 2025 19:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762139143; x=1762743943;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sf2MtafIziFxv0+iZSQBAt6orU3b9FFBk8saiJeqI+U=;
 b=jwRcLbGfQ70sNAoEtjKrMEmhg8/5PutX7gY8ZKF+FSLf137CBqhk2xCqKdb7axK2zO
 xSytESvD7En6TcOcseOP5s/YMh2d7RPye7Pxn7EQnriryf1BbF7RqWuZ2Ihx9/ip5B8P
 w+J/ZQiDqlfP6/85LnOtZo1UbwjTyerjwpU5sgVahAGlKQXZm9+8sEQoMPeIrHKK+2Bq
 g0mdPhH5d/xk6vWkgIccPrU2QzMOUbU1U2hs/+LWC2xU+6seOZNH+GI8KcgoqtfSKmgD
 iqkZ7IuqH+NfFM2XXUp8wGb9XORnCqLv3695WvkhlR1jNKxTlTJLpI1iJLZqreMqIyO0
 bcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762139143; x=1762743943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sf2MtafIziFxv0+iZSQBAt6orU3b9FFBk8saiJeqI+U=;
 b=RmP6oFjUvtubSy3q8g1mHi0YzD7m6KXSXHa+RzKKpeElSa+csNq5tdWNwb4no5Dios
 t5fpJFq289PlaYWn2aAIoeHXjQxRQjVzVQr+/v8JQ7PDZ+YJLR7+3LyfLK0kQfX6k1we
 EPutrRQa28slBxOD1ucNl/U2ghK1z10bLY346RXX0Gs4HYRDnBp+yT0ftxRWo3vHFQfV
 Fxve5zKhLH31t8pfN8nhkdVDxXGkjFn9rpxTIOvm38cUqhBJKySraUFU9fBNYQTZgWj0
 PGwCKA+bxQKI5ZB4t7ChorNKJzChUwiWPBiUFzvlkCpTaH/vW7Y847yYsJg6S7SeTVtJ
 AC/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAWbXnhYpy7QxZrVAsoBXnbJ4TSGKjFbHvXwvvJYZlEioFec9fb85ggEgh4YHR6WVwEjYkv4/P87ndOA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxv5efMUCT9DdZOezkk2DL7hPPz90ReZXI3dIqi8lmNI4dbs5JM
 6nMaP56BqULJp2+n8ik3K5C5jnL7lgrHmmzBtgis0a6/9DmLmwl4nBvc
X-Gm-Gg: ASbGncuDpB/ydgaHmHnh3qvCOu+dRdLitMbZc/ljhcMAivAvGlV97KngZR0Mxdtdx6O
 ki/fMeZCX+fkyeOSuVqtVXLNXmYZl5iT9kXihJBDqd8Ho+yoevkqbUBJV/0GJvH5PWmaaZyAerE
 R+XbxDKYyNqPX7rT6q0/VFAbTI6YHVeCdmK669pw1W6gJig5i1cuOZRSFHs5kEcKQnjgGNFqNKq
 JcQCOFdjyZ5RwMkKFLUWYmV2gs8wjdqAA4ih7Dg79ZL4DL9T/F1Yf8CM4b9NNZqAVBUpVSLY3s5
 kp574nvaVeU3uhyl+Vv2+/6GMoHBV/EoqwjoYdvTwcae1e1160W0ZEBKjv6q7oEWK6aOFSoBsUW
 +1O3PNZLkNK69n0+gC6Na9KWIojCEKsZogoBWgSrEMtsuVLSy5bazMwAPztN0HVh6mshfVr5Fh6
 jEHViXsC+eeA==
X-Google-Smtp-Source: AGHT+IGYS/nnpitzE/eUQ+F68Ex58b2ct1BccZhqdFnCOq0bLpSK6sj1xCHRpQ3LEE1D/LOlqIwsLQ==
X-Received: by 2002:a17:903:2286:b0:295:4d24:31bd with SMTP id
 d9443c01a7336-2954d243448mr108631195ad.17.1762139142642; 
 Sun, 02 Nov 2025 19:05:42 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-295c2eb15f5sm11691785ad.2.2025.11.02.19.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 19:05:42 -0800 (PST)
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
Date: Mon,  3 Nov 2025 11:05:23 +0800
Message-ID: <20251103030526.1092365-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 0/3] net: stmmac: dwmac-sophgo: Add phy
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
