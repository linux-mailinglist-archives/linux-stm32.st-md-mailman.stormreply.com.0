Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AD68AAB22
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 11:04:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D20EAC6DD66;
	Fri, 19 Apr 2024 09:04:06 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C634EC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 09:04:05 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d715638540so22655781fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 02:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713517445; x=1714122245;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RZYagrKgL3oRgietAYozGj1whRQiP+RdxmQVuv0PkQ4=;
 b=nf1w8eO8p/u3OcLF8qO0P97tNWva5j91Owtiq3dfaR6+7ijQGCWdgmr/VI3Y7zCaMt
 mk04unYmGT8XVn0sJGmLKffYqVWLxke1C3P6cbUwG3vkwdukMf9s/mjRhTwja7biHIrH
 1hzb/kej6/W3difZqmAzL2qaRhpJ1Yb5MORaCGVn/hRUxXGDPlBDUkuH2mgqIeKlG3wK
 MccyXXvUnTAiJrBnTNfsfPhczIeQxOiZnJ8Rq2tPT7vbIsxMKWpYXnypIaLejp9Vtewq
 TSGQbuKFF+wsXPiHaWCQG3SX6i8DN+nyyb9l2KZEiTJW++uCOEbB11rhuqEkfHyf3aJG
 9F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713517445; x=1714122245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RZYagrKgL3oRgietAYozGj1whRQiP+RdxmQVuv0PkQ4=;
 b=shjgxOBxosueSBQeMGiXpwJ5LfpU7GWMA6Fne2UrPaEqkpChSs7etd/teJzjdsi9Hl
 WGZMcaRZhDKc+jjvW4piFSob0f+hkeWlPhLo8WzwgLLUr5EJeaZ83HnFtViFvQgvuOlO
 eGBf+Yl/76NufWxz+jgw+LCGn/vBosMzBlv6T9WGxKeuYuMQ0g5qyUqxhGTSHmB4zQ7H
 pwpru1vyaWhBs5n7j18kAbSZiC7TnWYJqmDD/1WwtV7Bn2GRirSDeazpMjs7JJvb1zNU
 T6mTg+qB485HVwrxEXhibUnlVfekrpFlumxkgUasORVUZjwLIkq2A29NB7kHx0lzOwy8
 MzRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/ySv9MxF5poAjt6iQI97Ot79fKChFT1uBcd2V3n9eFFJPS/6XeYLoVZcfwtAQYzfVCm9Ww+IuN2o1ndspGtVlgLY9RhJbshJhlF9reod5ZVRNMwXFiHYf
X-Gm-Message-State: AOJu0YzPpF8rQW/U3tK5+BAJQ5xJ5LjRU8AIZTFhvWij1UGgN19Tw1NR
 c5j26qpj+gm0cICAXjhzCsBvPcfKSOafERhJBXicceZE8UZoO3B+
X-Google-Smtp-Source: AGHT+IGg1RrYLe0BtHyA885HiTeG8lWReO6DWGy/i3pNp212dINrX0hNxqF4nt96xYKpLfOiYPULBQ==
X-Received: by 2002:a2e:b90d:0:b0:2d8:a921:dfbf with SMTP id
 b13-20020a2eb90d000000b002d8a921dfbfmr863882ljb.19.1713517444592; 
 Fri, 19 Apr 2024 02:04:04 -0700 (PDT)
Received: from localhost (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a05651c032a00b002dcafaa0993sm355004ljp.14.2024.04.19.02.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 02:04:04 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Yanteng Si <siyanteng@loongson.cn>,
 Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 19 Apr 2024 12:03:04 +0300
Message-ID: <20240419090357.5547-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Serge Semin <fancer.lancer@gmail.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND net-next v3 0/2] net: stmmac: Fix
	MAC-capabilities procedure
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

The main part of the series has already been merged in on v1 stage. The
leftover is the cleanup patches which rename
stmmac_ops::phylink_get_caps() callback to stmmac_ops::update_caps() and
move the MAC-capabilities init/re-init to the phylink MAC-capabilities
getter.

Link: https://lore.kernel.org/netdev/20240412180340.7965-1-fancer.lancer@gmail.com/
Changelog v2:
- Add a new patch (Romain):
  [PATCH net-next v2 1/2] net: stmmac: Rename phylink_get_caps() callback to update_caps()
- Resubmit the leftover patches to net-next tree (Paolo).

Link: https://lore.kernel.org/netdev/20240417140013.12575-1-fancer.lancer@gmail.com/
Changelog v3:
- Just resubmit (Jakub).

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

Serge Semin (2):
  net: stmmac: Rename phylink_get_caps() callback to update_caps()
  net: stmmac: Move MAC caps init to phylink MAC caps getter

 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  8 ++---
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  8 ++---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 36 +++++++++----------
 3 files changed, 25 insertions(+), 27 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
