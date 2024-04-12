Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C74D8A3546
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 20:04:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F523C6B47E;
	Fri, 12 Apr 2024 18:04:04 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B54F6CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 18:04:02 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-516a01c8490so1614034e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 11:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712945042; x=1713549842;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CocCrXTkILxb+H292FlYFL20d7nBS8XixYwTUqYokkU=;
 b=ZRKhuxTerHevZg3utQZ43HwrhipzjKm/7G2qc+FjBi9kph5rpw6McKOqh8T+62inWB
 Mj6GkLCuyCi6r3iu7UGCp/luDzr7T9n1HvXJ/lrPRviLAMxKfAF+7MBdcPcVwMEiX3d2
 vG2mYDHOofyMqA45yYqpZ64aEkkrnklbOUZ3PqrP2e+KBn5U8YHV3kNuF1/bJiLsDnBb
 Xmfplc+WFuLeH1SX58nJM01ngoyu10A6hdwek8bMu9AXuLiq7On89c0afFTtub7vVjKh
 73y9TxJI0R6X7vj4G8Ff3Ulfo2T9L+Q7Nmv9KL4EPONgp8xZZ1fK5rstVDAm66NXx75V
 eN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712945042; x=1713549842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CocCrXTkILxb+H292FlYFL20d7nBS8XixYwTUqYokkU=;
 b=JjwGH/+ObC05IRIpoAtlfjCqhAGUl8AyJxWZ+1sLvi2vYpTv1w59VNbrhUuXtnonWw
 CGGU9ZBWQwKwa+XlgprISm0hhqKhksciNLzioO0RDjM4ghC/P+jFchftXNVwefXoaGTK
 smphItL9eZukW8+N5gfPAfXRZH6Kv/styZV0Vx79q4YnAnzjAehdLg6vlmqCCS9orQU4
 4hB/2GcB1fbPWH7GDOAYPp+k1KSwQb+ZyAV2+pKAlrnyKo7L/iKJrTNRBT03pXu91ckz
 DufgYd14F1hUwXwdfDzjAA/YMHqI9MubYR3W9+83wSOEtO/4RcTy7iKs/sFBVG0zhXYd
 GFqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrZ7BxqUbJQZxfjUHANHNbaojQdcfcmh5d1BjyS1wT0FyESyx2nmgpe87wJtxbjY2PFrTOD4knggb3QwKW4YwZVTx/0AfaCbsujJCmUsqgWNrteeTEmg8q
X-Gm-Message-State: AOJu0Yz9P+QKjeNRE8s+ggFtOxpiTF9K6ES4UOSeCsi+XuWH0O2aiofW
 RKMZJb6xuiriTmKDxhytewomEr/Q2AqUPtqcKd9tUmt0XbDxa6c0
X-Google-Smtp-Source: AGHT+IE+YdnghDsV0obcJRUikyE+vRG7Z625VF2VfIjNL7bgReRC31FSjtwU16I1XuF0ATXWLD1vaw==
X-Received: by 2002:ac2:52a9:0:b0:515:c0cb:3ca2 with SMTP id
 r9-20020ac252a9000000b00515c0cb3ca2mr1979670lfm.16.1712945041542; 
 Fri, 12 Apr 2024 11:04:01 -0700 (PDT)
Received: from localhost ([95.79.241.172]) by smtp.gmail.com with ESMTPSA id
 s23-20020a197717000000b00516a25e9ce1sm576691lfc.294.2024.04.12.11.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 11:04:01 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Yanteng Si <siyanteng@loongson.cn>
Date: Fri, 12 Apr 2024 21:03:13 +0300
Message-ID: <20240412180340.7965-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Serge Semin <fancer.lancer@gmail.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/4] net: stmmac: Fix MAC-capabilities
	procedure
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

The series got born as a result of the discussions around the recent
Yanteng' series adding the Loongson LS7A1000, LS2K1000, LS7A2000, LS2K2000
MACs support:
Link: https://lore.kernel.org/netdev/fu3f6uoakylnb6eijllakeu5i4okcyqq7sfafhp5efaocbsrwe@w74xe7gb6x7p

In particular the Yanteng' patchset needed to implement the Loongson
MAC-specific constraints applied to the link speed and link duplex mode.
As a result of the discussion with Russel the next preliminary patch was
born:
Link: https://lore.kernel.org/netdev/df31e8bcf74b3b4ddb7ddf5a1c371390f16a2ad5.1712917541.git.siyanteng@loongson.cn

The patch above was a temporal solution utilized by Yanteng for further
developments and to move on with the on-going review. This patchset is a
refactored version of that single patch with formatting required for the
fixes patches.

In particular the series starts with fixing the half-duplex-less
constraint currently applied for all IP-cores. In fact it's specific for
the DW QoS Eth only (DW GMAC v4.x/v5.x).

The next patch fixes the MAC-capabilities setting up during the active
Tx/Rx queues re-initialization procedure. Particularly the procedure
missed the max-speed limit thus possibly activating speeds prohibited on
the respective platforms.

Third patch fixes the incorrect MAC-capabilities initialization for DW
MAC100, DW XGMAC and DW XLGMAC devices by moving the correct
initialization to the IP-core specific setup() methods.

Final patch is just a cleanup moving the MAC-capabilities init/re-init to
the phylink MAC-capabilities getter.

That's it for now. Thanks for review and testing in advance.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Simon Horman <horms@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

Serge Semin (4):
  net: stmmac: Apply half-duplex-less constraint for DW QoS Eth only
  net: stmmac: Fix max-speed being ignored on queue re-init
  net: stmmac: Fix IP-cores specific MAC capabilities
  net: stmmac: Move MAC caps init to phylink MAC caps getter

 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  2 +
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  2 +
 .../ethernet/stmicro/stmmac/dwmac100_core.c   |  2 +
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  7 ++-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 18 ++++----
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 43 ++++++++-----------
 7 files changed, 38 insertions(+), 37 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
