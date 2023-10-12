Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A99F7C6A79
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Oct 2023 12:08:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31CAAC6B44B;
	Thu, 12 Oct 2023 10:08:37 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65C55C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 10:08:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-32d8c2c6dfdso753192f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 03:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697105316; x=1697710116;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T61YK6EFuEDV5qJWA4z7WzFbSG37tp0bqVIjSbOkXyE=;
 b=PqYoDL4XkcKIkQ6AXwXaQ4+d1g4FoAwWGLAjW7T5dmWizhX8XJ7u77egPeTAVvqJBG
 fkXk8UDmKbB1Va5cA6hY3vJB7cLbiZHufJ5y9wVvsocgg2ST+DNfZNUiJDpj+XJF3gOi
 FT+Yqk/cgpyYebgWmah/RbWwZpLVkOXKXm7oJEdkTat4rp4TB2TDSfldORcGb87K49dm
 cjcCD4xZG51pgC2szPFsuWx3/2d+xnQurIb+sp2ggYOMJtaO7e1outKn2YM73gmZ8YyV
 rlTbLQsZHbpsMnMsGWo89OV35d7z5jk0Ld7a5/gJ2y4MGZPOwQKrxujMOg171QGCbL4Q
 vXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697105316; x=1697710116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T61YK6EFuEDV5qJWA4z7WzFbSG37tp0bqVIjSbOkXyE=;
 b=GthLEnBQ02qfkj+a9UdXyx26KOYTvbU8LQZuz0HNJ81Ayh5Ck1HlaM/1rxaEfCkY15
 A2+NT9bdwLFwYpAthX/z/ktt1XNUPkbbox4CZ4XxmxKHgrFbami3YgMxACyA3HlhD5Sh
 9d7gvrxCsM3hYy3N00SRAj6LE5z3jBS8wM4VB/f40kH7Lg24wJoNeC6eYLOCEBkYO6vl
 QYbySWwVGd0oLULXTtq3Ojd0hH+gj3icFNTEafj0x3r97+Np3EZQbngqg6xVhC+YMVPF
 N8H/WKCNLzpIdz/K+KD3OupoFozErp2WdrpdO4d063wjiKHq6IHH+sSWpViJQTxXQKtj
 BkdA==
X-Gm-Message-State: AOJu0Yy4NIlFc3WTYWE6ESdib00ScjLskbFIcOMFZLRSe8JGxMGkJj8L
 5YLvGewirIJ0V5ueuVX2OB8=
X-Google-Smtp-Source: AGHT+IGY5/V2HmMll0R7ee8D+XKgPX1fVMvqjMxzETQE5YP729txcGhYLYxlO8b4P76nKez6ryZjLw==
X-Received: by 2002:a5d:6447:0:b0:31f:fb5d:96da with SMTP id
 d7-20020a5d6447000000b0031ffb5d96damr21560136wrw.64.1697105315533; 
 Thu, 12 Oct 2023 03:08:35 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 dj16-20020a0560000b1000b003198a9d758dsm922737wrb.78.2023.10.12.03.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:08:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Raju Rangoju <rajur@chelsio.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 Simon Horman <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jiri Pirko <jiri@resnulli.us>, Hangbin Liu <liuhangbin@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Thu, 12 Oct 2023 12:04:55 +0200
Message-Id: <20231012100459.6158-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v2 0/4] net: stmmac: improve tx timer
	logic
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

This series comes with the intention of restoring original performance
of stmmac on some router/device that used the stmmac driver to handle
gigabit traffic.

More info are present in patch 3. This cover letter is to show results
and improvements of the following change.

The move to hr_timer for tx timer and commit 8fce33317023 ("net: stmmac:
Rework coalesce timer and fix multi-queue races") caused big performance
regression on these kind of device.

This was observed on ipq806x that after kernel 4.19 couldn't handle
gigabit speed anymore.

The following series is currently applied and tested in OpenWrt SNAPSHOT
and have great performance increase. (the scenario is qca8k switch +
stmmac dwmac1000) Some good comparison can be found here [1].

The difference is from a swconfig scenario (where dsa tagging is not
used so very low CPU impact in handling traffic) and DSA scenario where
tagging is used and there is a minimal impact in the CPU. As can be
notice even with DSA in place we have better perf.

It was observed by other user that also SQM scenario with cake scheduler
were improved in the order of 100mbps (this scenario is CPU limited and
any increase of perf is caused by removing load on the CPU)

Been at least 15 days that this is in use without any complain or bug
reported about queue timeout. (was the case with v1 before the
additional patch was added, only appear on real world tests and not on
iperf tests)

[1] https://forum.openwrt.org/t/netgear-r7800-exploration-ipq8065-qca9984/285/3427?u=ansuel

Changes v2:
- Add patch to move tx timer arm outside tx clean.

Christian Marangi (4):
  net: introduce napi_is_scheduled helper
  net: stmmac: improve TX timer arm logic
  net: stmmac: move TX timer arm after DMA enable
  net: stmmac: increase TX coalesce timer to 5ms

 drivers/net/ethernet/chelsio/cxgb3/sge.c      |  8 ----
 drivers/net/ethernet/stmicro/stmmac/common.h  |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 37 +++++++++++++++----
 drivers/net/wireless/realtek/rtw89/core.c     |  2 +-
 include/linux/netdevice.h                     | 23 ++++++++++++
 net/core/dev.c                                |  2 +-
 6 files changed, 56 insertions(+), 18 deletions(-)

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
