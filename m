Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 106F9BF0544
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Oct 2025 11:55:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE955C5A4E2;
	Mon, 20 Oct 2025 09:55:57 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F1FEC05857
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 09:55:56 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-782023ca359so4102623b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760954154; x=1761558954;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HnjCj7JbAdjNvBUGLpD1SpiGs6GWZ/iOIsdOQuRNQDA=;
 b=fwEv5u+IYuiQw6xDnPWmKOIGzihPZ+/+FWV4Yt+sZbmcVErickykHBFlyuxPtuYjXx
 JHWI0toinZq35PTwwP15PWAIlb87oaVFpxu11KDzu1zV4vJx7FYwg3PHPebUPj14IHlU
 Hb6rtNvIeEBaWdoszOWxVjkuykK25fAoOyb6oyDxzYcr6C2KjSMSfVv/hCYE33unj46/
 9zJzv8/bkE28PrWQOn/jigEF9gF6wStvKi6wO1UYP4TYGJ1G5VO2TR8zY1C31/cOcJZf
 5Bi77o2eXCat67vlE7cAzaRzlODfqn0pWUe2A3tvnEYYigtoTJxtD/cVf9MWVtJKpKXX
 JDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760954154; x=1761558954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HnjCj7JbAdjNvBUGLpD1SpiGs6GWZ/iOIsdOQuRNQDA=;
 b=JwmSj/o1ZhGrbrqCxVdndU8cGLqXbwn/9U2kkrgdFi7uRDtTEwysH2b/DRaYs13SUx
 L6FoyhCXqcSuyv9t3XCusJdh795L88/vZCqUWb4OqQCB2YVtU53BIboSMfweiFxIDSzT
 8glvvMSEjgTXL9ybN5z2IR/5TO8Qhd9bHrBAx02JOLWtP87E+wqdqa2WecR1/RuCtBCE
 pdjQmz0itqUSgrh889u1X2xNPnQ20gj8ka5LQKJEwa1bz59E484P2tWj/hULeJ2e51d1
 5plx1s/AJJXJ0IBF7RScEgfEe/tYNbGYlrxfg7BxfrMbDTW8P04r/gsUl+I6/eaBSqQk
 YNog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq+CtHNEC+Iko9vNFbZkznOrdZIFQqxjJZa48B9rUajrySvzIyR/gq8zDeXu5BJl2IvWsFEwzMuKUXcA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2KjknVuWnoSkFoWlbkF/OXrwm9THp30kKb1ftqc/T+T3xv28R
 EmV9qzsGEksV45R7fUr8yZwwgxWplWxNXoU4PVZMKmXATCPJSeudE/rT
X-Gm-Gg: ASbGncuiwuybWBJCRdog763Ngik3kT9V2E1ZFbXYx+HG6B6M1v3YfLrPN5WkgIojUqK
 c/OdZYoXYKZjWkaGUIZaquMQM6n9P6WQ4lkjbTOrpzgoz8BT/wP5aTF0jDHQ3AwLTBUIh184hiq
 4nhyVcv7kZY+qVjJXG3pnjYbuyQiatgUhofBMGdigDDJXsOe7xCbaHJHYCxzIKAWLynD495beFa
 QzWzlI7gT5y6sfNa2KhX7Azp5fOwtkrh8POZ1vPbfpTkenufhX5ngKpxNfyaePp/YHfeWe2eNeV
 ZylczkakQcmhL06neWetzrleT6jlQZNg75/F70Q7xO9cYFjD0Ld6+Rl1Kd7xAiR8DHVEj2d4Psr
 2fDGWB9Q5fGX0rHlGOu9ObbZvhnywO6qnexYobUZhjkxoNtosIz2Lud7VX+ltxas9iKLgQ4RvPE
 g=
X-Google-Smtp-Source: AGHT+IGgDyGZ3OQ57iwdb2555NKJghSCCZpCKxoCPXr9rM53NE7X3m8ehUVd2NOzuBByD+q6WjfyCA==
X-Received: by 2002:a05:6300:8088:b0:334:b8bc:1031 with SMTP id
 adf61e73a8af0-334b8bc1040mr10403992637.58.1760954154496; 
 Mon, 20 Oct 2025 02:55:54 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6a76b6f302sm7256845a12.38.2025.10.20.02.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 02:55:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>
Date: Mon, 20 Oct 2025 17:54:56 +0800
Message-ID: <20251020095500.1330057-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/3] net: stmmac: dwmac-sophgo: Add phy
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

 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 17 ++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 17 +++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 79 insertions(+), 1 deletion(-)

--
2.51.1.dirty

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
