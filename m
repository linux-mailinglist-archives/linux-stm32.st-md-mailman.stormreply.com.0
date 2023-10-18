Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F107CDBC7
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 14:36:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E52AAC6C83E;
	Wed, 18 Oct 2023 12:35:59 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5E94C6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 12:35:57 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4081ccf69dcso10049885e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 05:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697632557; x=1698237357;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+z2DeuWbLpI7AEzz9he/oetq9pODDYK4Bo2MZwm1LlY=;
 b=gQhje1iLLqrFyCPSKWum8hNmX+JMg8nQeC8WoJ3/pFlkwB+a3T0xl3j9ayCZgVE37E
 OHQbz3LAjRv5JkUF0T6mlymAdHjcWqNK6a6RCZPL+z5rZ3u+f0Bz4CvPUDJfzQbv4pXq
 zbNw5lLJC8nqQRHmevYNUmK3ILGvyXuwTvbRqo70n538PfCf1PECa8xYYnD+YS3yeiLA
 bsQZPNf1mkKXAqryop2hNrgsCwjuElKnJbofw9QLZGIXYG7rpbzo9Gg5lx8if2EwfIyi
 HyY/7OFbcb/nxAhrlZCdjI3/yD/h7pBeoikOcSj6i5pVx31b9FN4tIKnoJVeYM714b3K
 HkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697632557; x=1698237357;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+z2DeuWbLpI7AEzz9he/oetq9pODDYK4Bo2MZwm1LlY=;
 b=MhRDG4+gK0QTVwcULnPHj130x8+8j4QjOavNUCqfhWMGEjwM2kkJ5Na5aqzCndL0nK
 NPvauGOVEX/U2V6A0/zPHmfql+N9U2gUY1ycNnn/Du/B5JuhlmHk8Bf/mULSjxdCxZyU
 ZCisZrJ9oycTLpvtlvIZBzJ11FwMocnEpNC1Mws3TIiygFk410Q+5KbOnlO4Glh1V6YG
 hN8Pd8Mh8R1GxkCMSvOAqh3RlrNn+8gQfYonbZ+hM9Gwas56++myZ4o36OfNkfwru+aS
 1U1UjADZPEwwJF8RG/orvx7tXUkAedR71/WnNcR1lqzwggtpX0RZ8x4c7Vi5fSx5dwu7
 uH3g==
X-Gm-Message-State: AOJu0YzIUvo5Zm4I7Yva0vg8nuyLGujvBGiMAF1uYtsqY0i5o/lV8LPM
 w4k0txEgcmLNZQ+wk2ceIgE=
X-Google-Smtp-Source: AGHT+IHi7O1ZsGGb+3ZGVPAoATB5PmPAZWxpAXGDGRKLUdLuB4yOu6xE3tV0+2ka93mWmWLL4vJhfw==
X-Received: by 2002:adf:9b95:0:b0:31f:fc9a:a03 with SMTP id
 d21-20020adf9b95000000b0031ffc9a0a03mr4367013wrc.20.1697632556892; 
 Wed, 18 Oct 2023 05:35:56 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 q28-20020adfab1c000000b003248a490e3asm2048211wrc.39.2023.10.18.05.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 05:35:56 -0700 (PDT)
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
Date: Wed, 18 Oct 2023 14:35:46 +0200
Message-Id: <20231018123550.27110-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v4 0/4] net: stmmac: improve tx timer
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

Changes v4:
- Fix W=1 warning for missing define of pending_packets
Changes v3:
- Fix compilation error for missing comma
Changes v2:
- Add patch to move tx timer arm outside tx clean.

Christian Marangi (4):
  net: introduce napi_is_scheduled helper
  net: stmmac: improve TX timer arm logic
  net: stmmac: move TX timer arm after DMA enable
  net: stmmac: increase TX coalesce timer to 5ms

 drivers/net/ethernet/chelsio/cxgb3/sge.c      |  8 ----
 drivers/net/ethernet/stmicro/stmmac/common.h  |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 +++++++++++++++----
 drivers/net/wireless/realtek/rtw89/core.c     |  2 +-
 include/linux/netdevice.h                     | 23 +++++++++++
 net/core/dev.c                                |  2 +-
 6 files changed, 59 insertions(+), 18 deletions(-)

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
