Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D39C040D1
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 03:55:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49CBDC5EC79;
	Fri, 24 Oct 2025 01:55:39 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38491C5A4D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 01:55:38 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-33d28dbced5so1965455a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 18:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761270936; x=1761875736;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qM2K5UWuNXprZvBDJ5c1mMhJQmIFaH7Nb7GuoKXsnbg=;
 b=In1Lxt4BMq+ZiWfJJKBonpnn1BmOTkaKNzo4pdFuYrGFNKMNPcM4hnNmRwEq88hcnr
 AeiVnAD4LEU7yOKQo25nC/rriAFdT2qxRFTRHLnz1IbPur9Gi2gqjbwwwFGVcDH2Megs
 mZ7FNUjInIqvxPDwdrJShQ0XIHufdj59ebIBz3sb+wLj8QhQPzN2K6aU5CwVr9wVFNS+
 XrwCBfmp2zl/pUiKQhvihEJ8s9UfCERVfo0SESqb8wZyTW1xsuUjDCLmFXa8d//kzcfS
 THy+r+wxUPaZG4K9vFFy80RyRsdK3aOEgBXGgG8nN5I6fV8qPXMJLgVyJdPd+bC2rbid
 /hKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761270936; x=1761875736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qM2K5UWuNXprZvBDJ5c1mMhJQmIFaH7Nb7GuoKXsnbg=;
 b=LG0oKfJWSxsgZO2EJZgtAarQqMD0j6I/ndBmRg4/tAtAbzNao898Nhc5Xy2GeuZUwH
 MQoqZTnZg5I00Nu4SIN50Jhr0eL/Vivrjp4O5LXytK25WJdkTI6B+0pGSvzc0qbDlEYF
 7V1zjGuct2uWzYUdfHpRgeRuV2nt1I7XkQfC4VBvBh9Tn4bUDUGh+8woI2lBeDFcsiRV
 Dju9qCBcp0jzMSk2ATd00VcmaDwCYexa1Iv9SsdqlC/bZjEb/IV36IULP/gwSWR3NWQC
 4uAVNB8bpgN1pBLKxAI8f58ifoUS3csecYYQyiZb5/e2LpABAJCI2J2VLv9Zbvj4OPeW
 DKGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQg7PYWcRkqjrJ1mrrmbm7BUiQSQPigVz1Jbgi2pBZuwSwlFerpovPKgzdBYX30Tj+4EgguYtSMkYupg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz5qdNpE9u6UkDD056Xf8/lLaQEP6kI87wLRSk5OU+8QNm/xbh8
 aZjH5jNZm2zR69EkLCozpGHsuwWH4zKZ2nmfl0IhaRk20GGR4e0QknFl
X-Gm-Gg: ASbGncsJ3BHZyq2EWjT0+ZldmDuxZ7ocabFNTYG8pRGgw9NK257EwRq/OoPHVecO00v
 0eQuyv3CmoK18b/AK4hK+WlDOw6vxt9YEicURYCwj/DcMpGYoOByqdz3b8MxCyXl0kWcdxbOEvD
 wMvkRtJ8CGFyHnqFRXOrRRkqAF7Z5MQG/u8FUo1ouGZmcGciZCzufPfgXTA8p5BauoMWA6gmuQd
 t/0CR2LWW4reDfWG5uS2gkClNi9q97JgNyU53fl3uS4N0o7HIFMFtb7fe0R8d2+tVPmcCxABlOR
 D/sDigDGissrOdgRFI7nADi6rr2dq//VOC9gULg5ae/EEvQSX6j+DrLQH/18o5NMa4yqqom38Js
 EEjph34RdUwYexgVyLUJPE0aoRIfrYrTHuAK0EImsaZPmwR1X1KWqDS0zbBdWqik0hKXO0asuw4
 3dJcOSYArk1w==
X-Google-Smtp-Source: AGHT+IFGuiuD5qMaB237ASMVYM5OY1+My1nEaULow6/U2LgSioG18/RvbKuul7ZQNTuvhLccqeac+g==
X-Received: by 2002:a17:90b:5386:b0:32e:749d:fcb6 with SMTP id
 98e67ed59e1d1-33bcf86b5c6mr38689912a91.12.1761270936488; 
 Thu, 23 Oct 2025 18:55:36 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33dff3c3a6csm4951393a91.5.2025.10.23.18.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 18:55:36 -0700 (PDT)
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
Date: Fri, 24 Oct 2025 09:55:21 +0800
Message-ID: <20251024015524.291013-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/3] net: stmmac: dwmac-sophgo: Add phy
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

 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 17 ++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 82 insertions(+), 1 deletion(-)

--
2.51.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
