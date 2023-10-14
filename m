Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C221A7C93CF
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Oct 2023 11:30:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79A1DC6B444;
	Sat, 14 Oct 2023 09:30:29 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E85AC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 09:30:28 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-507a29c7eefso469742e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697275827; x=1697880627;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vVgxHCn/B7V074W174vEDwqS68k37Kzh+EyWr5cIE3M=;
 b=DGWoap00mTUh343glPxEBOgkFfRyw601EZ39Uh2EYGDF4D686jxOOEV84eeHjOaSsn
 BrUuR/v0i3TadtEPT3ejW9RbaAyr9BDQV6eAizGF5AEqgphGsQq7ipGbyMK8Xo2Ru6Or
 5fROE0c2ya57ssV9GT2QLLVVqR7ZqOdJlOhto2NaoMTYl50TCUDvmei4tjAURcgFg6tE
 8OknWMxM3pE8gUYgWdkx8XVeLYPHGCAe2CloYo5TCrfPtpbxUS+bQtzfPHbRX3Z2goms
 CNWi6NOQyzJSAZqMy8UdI053NXyaveYhSTwd5xOr4BvVWn8lMHZVGF66WVQRca0itvhY
 QOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697275827; x=1697880627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vVgxHCn/B7V074W174vEDwqS68k37Kzh+EyWr5cIE3M=;
 b=jyaOcae8MI5+UKPIBVx/cBCEzIiNvo3Cj1Gj8ziajzYwaeO3FTnpL59qEp5gbxWu3J
 bhMG6FFu5rNin7ZIb3/kmudJSP/RKGlyXSkYL0XWkN+C+nvO5DYwxSV2d3mOGxoGuKAM
 Ao9UeQYF31CDcRx7cCVEltcz5NSzuEvStS/izyHKk5Efc5wPjnk/rYjZdvuZ3diSG7WM
 wsLaORbolDAVHnEoNrnbIGF1cFwhK49lvSsnBWY+vi++Msiwg3irN94lDPCfS1cvOsjx
 YFies6VroBz8jnSlxKWKJ52Ft0p5Px6E2rRc1DXj+lCrx4Ah9IRw4D6MNWYq5+6a+du7
 aYIg==
X-Gm-Message-State: AOJu0Yz8Enhzx4iRSRIG6hNKKpdhIsHD+fYWvEk3AgCuOWGsvVgiodLI
 gXmJ53yb7LXDS0LbCVCF+OY=
X-Google-Smtp-Source: AGHT+IGJJJQm7yfJhqss5S4XY8Bm6bfFs0fCEocRUTeiHfSNoKjAzN8d4DstSYgAxtzxjhfGDA7Lxg==
X-Received: by 2002:a05:6512:695:b0:503:28cb:c087 with SMTP id
 t21-20020a056512069500b0050328cbc087mr37064060lfe.29.1697275826447; 
 Sat, 14 Oct 2023 02:30:26 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 u12-20020adff88c000000b0032d9a1f2ec3sm3691564wrp.27.2023.10.14.02.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 02:30:26 -0700 (PDT)
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
Date: Sat, 14 Oct 2023 11:29:50 +0200
Message-Id: <20231014092954.1850-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v3 0/4] net: stmmac: improve tx timer
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
