Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E35C5ACAF
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 01:38:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4420FC628B7;
	Fri, 14 Nov 2025 00:38:35 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CA6AC1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 00:38:34 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7ba55660769so312896b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 16:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763080713; x=1763685513;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FVPzw5zfoDTWTXFnR/h7NqjV1cTezTe2Ib/OrTkeKgU=;
 b=NBfIiaFyxkVwFSjj0/h6KIH9fgQm+9wz0p5wdqaqK7UPMzqboLj/SJTCkpzV/nCrPN
 WBt6g/8hieLdCM3CKrJI2uHKUSsDDaKVHSoeS4HN+GQ4LrTFcNLa3tUp1XoRJF2vAsUM
 z16d3zLRngroX0XLCvfIwSdW0VRp7JNzPfVjuAAw8R4znlR4h524oT3lpmGohljCssyX
 graJWe5kDmS5dB6dE7Zprftg1o5+GKAzugdlM4u67WcaXrm1kGIm8MCDOtx2F+g6T5LZ
 7bI0LJSpWwJ2PqJGDrCICL/s7+qDHb6m1jUTubF9iG9KXFuE0km27iPysyg7LQZgemQr
 Qi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763080713; x=1763685513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVPzw5zfoDTWTXFnR/h7NqjV1cTezTe2Ib/OrTkeKgU=;
 b=mHeyp592QwQoPuJNbiPQlDggm3Wp8igsA0VEphRj0S/gh4YiwAOiK8lMqxNGTC2yZC
 7YgasRToW1u86CiMwbAZnUKM2xYuhgqRLZ4s79DbsqgJsX45KNDzJM+zwjU5aKJ1uhC4
 ctDVXrJxCBvERgUz0NAptLlke+WaPwGY5xHXbnmqbe2fCVSeaDdVlYHkKtO9kB8MWdgw
 MVYKL5iCYPti781kJDnnc63SoP0IlmszjBrMgcTQvKgkvr1Gu9ma8NDXBdr4m37xYriH
 MzK9XlP6njSWMj6JdUPeAPcPRanPHtM2HibOs2CSktvuJgCRxu6VwyzeU6rT1kENTxt7
 vjGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJxDKF0o9KkKZEAL/5A76tC4dY23NN8PjWgdi7bBe40tKaHj3acwEJuqMPNfNT+PYyry9HIFZ8+yn9kg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzRIl5ndbfJ051/lKh32rsOQDIKDLWZnV8z3WLgEXNCfBs1uEIB
 h9zeLCAASTzZRkFZ64En6xLbMAeC6LyEHQfe+JiW4S6E9qzXGM2VuNZ3
X-Gm-Gg: ASbGncvL4zYneIW45Z1ftX8yMMom9DHJ0yCV0aoloaphUDoueDsUN8oW03LkfNIyC3s
 8DhqdKeA27Y7Xympb/HEAal8VdvhcbN0gloifqiMthDL0ouEJWkbR+QeG+pN1/iVG6VSdGF7Ufa
 OdB0yYSMrA2AInYhK+8C+7tDSKhKF6mkX7OAKmh0k3JC/rlLsGgBRi53iHrAJphvI2tiuSAE6Tq
 C8PZB+mjWs3p5n/wXvzPs34iqZa+SPZgoC1w3dEC57X3DPffi9axumYUBx49JAoT+1+IMv+7rlx
 BTv6qMIVWIIKOHmzihHyJolS8Uwg/dFpWzzeqt6oC+21TLxuVta1RiIAFHFdojOoDp3HKHNssOZ
 eOITV6foF8PJy23kf/D5d+alaPnZBQ/v0Fn2hgyMxESzJC4AtD9P8KOJHex58af2tezXg4tDzvK
 A=
X-Google-Smtp-Source: AGHT+IFMN4Id0VDWD4vgNY5yrLAnESY2doxKYngxGOLEfNZ2u1GtM7J0GBLB9kpY4AWTmMpVtXfBvw==
X-Received: by 2002:a05:7022:6284:b0:119:e56b:91ed with SMTP id
 a92af1059eb24-11b412096e8mr571996c88.30.1763080712752; 
 Thu, 13 Nov 2025 16:38:32 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b060885c0sm3384978c88.3.2025.11.13.16.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 16:38:32 -0800 (PST)
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
Date: Fri, 14 Nov 2025 08:38:02 +0800
Message-ID: <20251114003805.494387-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 0/3] net: stmmac: dwmac-sophgo: Add phy
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

Change from v7:
- https://lore.kernel.org/all/20251107111715.3196746-1-inochiama@gmail.com
1. patch 1: fix a mistake that using rgmii-txid instead of rgmii-rxid
            for SG2042

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
