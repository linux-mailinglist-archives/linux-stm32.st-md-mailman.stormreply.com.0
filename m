Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD738A856F
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 16:00:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9821C6B444;
	Wed, 17 Apr 2024 14:00:17 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B9A6C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 14:00:16 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-516dc51bb72so6563985e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713362416; x=1713967216;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X8h9sytoh0eNCRrXIWGk2wWof0lykgyqJVSMJYB9Jf0=;
 b=mfXa8GkrvEUZdz7/RHALOHV3i/BjO3RknKPjN9LVwQdQJJWV36xuJ8gnIt3dmpyWBX
 +g8fM0BrR2l7dBNFAsoPSSg4IXJ7l7V6nAC9CTE6hfEh/xY9Q9Xsn8vHtiPkhtpIj5rd
 59kK6tALEl+uPfsD0GollztaSAD14DUkrCN5u/2TfzyKpULjwpKdYM98IAOixOqX3od5
 Ui/kYu3DnXSf4rmNmdeynIaHk+a4kcqrhx15q5Kx7LH0xmRWOKlc4FokihFhD8dvDBkp
 g6go/+RzFtZQqWjnbUQ1jWGw/DT1EhNTP0jqV7Lj2HOIyg+fVeeGBtIAPF8hcqpodDF9
 srHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713362416; x=1713967216;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X8h9sytoh0eNCRrXIWGk2wWof0lykgyqJVSMJYB9Jf0=;
 b=AV6c5aM4BuVNJhPLsBtjdDFblaO9/q33rm0NpyzFpFGW9zHsKUPe1BvkGvebOO+0ni
 nwChHLcwV3So7A+PBqZlf7mgZPROizGl9HRK6An65hDjbsindjnd+s7qQgulNNf9qYsb
 X8VqhHjfNg7tPt7dg56paZG/wFFfTxd9BDROi5bbLhlTbTlYJDBJaQBE/wiH7xDaPmMv
 43wiWRgXkofTY8hMTvvA4KPEJQHlO5+Fxiwwt3OE8373wmfwS9YIGxESIiCyqfssVARX
 EgvvSSHfmunEib/0ra4q9Py5UvVjgcuS7LNmFyj4JALW9ZNQwiX7lILtpHRq6NmTwf3Q
 s5ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmIkKQRYk/iP1a7rHvkVst6QhvhoLcJG5ESLS8VLScKtGxqAhxWkM87qIDCtidL+cBRC0mS45hXyLGoClC+P/lqD4EtPaNK9ti+EtOZJKPUrN4wzzi64fR
X-Gm-Message-State: AOJu0YzH45/piex6GP8mjC3egYV32a29GNjmLjKeRud65R8YxlGkzZ6W
 H0rnyuSMa3O35wPzkP73drwg0cqmdARtGYZ7U/zvrIO6NyPlXidb
X-Google-Smtp-Source: AGHT+IHYR8jJSuOJPPMs2fzwb2lRhApbksKgiORcX73kn7lgMCayLUhPAG0NkusHwU1eUl3geU6gaA==
X-Received: by 2002:a05:6512:1103:b0:519:3a8d:2ecb with SMTP id
 l3-20020a056512110300b005193a8d2ecbmr2701316lfg.5.1713362415457; 
 Wed, 17 Apr 2024 07:00:15 -0700 (PDT)
Received: from localhost ([94.125.187.42]) by smtp.gmail.com with ESMTPSA id
 g10-20020ac24d8a000000b005159fa03501sm1963673lfe.302.2024.04.17.07.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 07:00:15 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Yanteng Si <siyanteng@loongson.cn>,
 Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 17 Apr 2024 17:00:06 +0300
Message-ID: <20240417140013.12575-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Serge Semin <fancer.lancer@gmail.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/2] net: stmmac: Fix
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
