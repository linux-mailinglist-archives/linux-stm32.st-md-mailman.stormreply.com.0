Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B0BD063AB
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 22:17:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21283C8F286;
	Thu,  8 Jan 2026 21:17:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B04F8C8F285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 21:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767907026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ne57iAfUngCEZ/eJnFXNUIoW6Gx1gYxdMUdG2ktOUNY=;
 b=JxU0u2rAqLLgObICtO/LydX4/F68sVrdPi7tDQ8qIcYcf/4q4vTBeCQt8APznRlIc3irsA
 mSc/8w1RSNM7WyKl/gEBKqBqeEZiGg3L+W8KZTE0V1EFK+kEMthHtMnwyKbSXzJ262L/Fp
 8K4OjlHCkk3MEkwSd5785vNfEzVmoCs=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-JDkS-NTBPNm0vUp54alp5A-1; Thu, 08 Jan 2026 16:17:05 -0500
X-MC-Unique: JDkS-NTBPNm0vUp54alp5A-1
X-Mimecast-MFC-AGG-ID: JDkS-NTBPNm0vUp54alp5A_1767907025
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-93f5ac349ecso3577921241.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jan 2026 13:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767907025; x=1768511825;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ne57iAfUngCEZ/eJnFXNUIoW6Gx1gYxdMUdG2ktOUNY=;
 b=SZDoovVgQUGzPWxnq3K7gKXrc1qu9/YvwEDT2ARcJ9C0q4rd02Mr2lBvEMgMNLX2b7
 cqBRpIZXY/kJtHHvCRdgYIqViv68XvCp5gfA4c5flTI4+gZj0SVl1/fY0IPwOhTFeym2
 2jV1eiwUKqD2zkk4d92+65OWDjKj+0pIn/FS5v03pFxqSrk1AqgtFAcVygk8/hq91COR
 TuYnr7jNlBdEcpeTF15puv/4Pf21SjFCEIl3/hnmYgveXniqIR31U4Kg+EE79bTZUsSn
 fFqWiz3JMyN+feWzsvzMKJzxrQ8IdEvikxhABrSKj4fEEioDqSMPwB3wS+ojXWqc+P2u
 Sc+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYz9scW5FONs3c4YoIP5fJ9KQJsg6VRWJo/CexSTNXAnriNu8nfqGAPFIhst/itmLTNQqSw2H0iGKQqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy81vgmITyxpK26PTd4REkxWNPbZih23Bg2DFam4izbbPd/jZqX
 2NCQ9mW+Z6U0l8YefDpLvVGwztpndr4uU5L9spVaO1PeEJRCzecgsL8utYp9KapLN7y7IiRTxcG
 laxWq+3HZFvdKocm7B00DrQKFJMiyhj3vXYoljmv8gIHm1P/9KkL1qGs7DMcYh/DA2a1byi5g+x
 OcDQHyVg==
X-Gm-Gg: AY/fxX56qksP981CQHsb+2mXMlMYNtZdTzITN4mcyI86PEIneO0Eexf8advtm+uVSaU
 j5e+fI5c+9912MxqFCZBhs/Ps2Ni2FhEQX/DLtD9l9amBN2muDmFr4KNpYZV3abtTnczGa6DwLr
 J/B0Z9hZbrstjbL5xnQOQmuBRtf3Jpi4fOe4BWaTAgqzP6jdVWjPUvgnhL+r1SYuA0TFsaAg/Gu
 LRgrLtSJjdMBbe/filVKTijvCghlgFOE9wMO/Z0t25NmI/575FHFcWBH9wO8ECcttlaOUPUmoTY
 1FDt8uWvouNh+5rS4/kOflit6EvwcLG+4KlgkP5nzi7M2fKH42J47W3zAGYvWFvHoSiu8LSm3Hg
 EwN0BgJd8nWJDNEw=
X-Received: by 2002:a05:6102:554b:b0:5ea:67f4:c1ad with SMTP id
 ada2fe7eead31-5ecb68aff05mr2988594137.21.1767907024797; 
 Thu, 08 Jan 2026 13:17:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz/p7kGP9fvfk2vXLPq3R9VUjKVw1cdN6NrP5mq/P0PGpCjqA4/hKeGKMrVWaYIPrb1wIVZw==
X-Received: by 2002:a05:6102:554b:b0:5ea:67f4:c1ad with SMTP id
 ada2fe7eead31-5ecb68aff05mr2988572137.21.1767907024314; 
 Thu, 08 Jan 2026 13:17:04 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 13:17:03 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:18 -0500
Message-Id: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnA0kHizsVcYO2kQNG3WkKkLpu
 6/s+B3+v0BWN83w6Aq4XpZtTw3cdxC3Ka2KJs0w0DASU8D4eaPYZaKOvp9J0KdDkeMizGGmMRC
 0+Ou62P0fP1+1/gDlVpEzaAAAAA==
X-Change-ID: 20260107-clk-divider-round-rate-1cfd117b0670
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5523; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=5gEzfGrJrZBcK9ab2+97vww3qO4uDY2TibGccFpsz3I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Lb+j2COyZDSrq1aGtHuW3Hnjb6jSZa7wqEZi1UKM
 +/wfPfoKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCLePxj+cE8JZ4ir1XC94hPf
 wLfqhfvjO0u5RdiClDPF9/n9TrNyZGT4NKcq8ciUz4qK0XG3a+4381Zd+31jtWu5nMfx+TvuVsY
 xAAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bshkr-h_ZF99H2fuNppap2Qg8ePmzh8DEA7MKI2g6pE_1767907025
X-Mimecast-Originator: redhat.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Shan-Chun Hung <schung@nuvoton.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chen Wang <unicorn_wang@outlook.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 linux-sunxi@lists.linux.dev, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Simona Vetter <simona@ffwll.ch>, Jacky Huang <ychuang3@nuvoton.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org,
 Brian Masney <bmasney@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, sophgo@lists.linux.dev,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Chen-Yu Tsai <wens@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Inochi Amaoto <inochiama@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-mips@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Takao Orito <orito.takao@socionext.com>, freedreno@lists.freedesktop.org,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: [Linux-stm32] [PATCH 00/27] clk: remove deprecated API
 divider_round_rate() and friends
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

Here's a series that gets rid of the deprecated APIs
divider_round_rate(), divider_round_rate_parent(), and
divider_ro_round_rate_parent() since these functions are just wrappers
for the determine_rate variant.

Note that when I converted some of these drivers from round_rate to
determine_rate, this was mistakenly converted to the following in some
cases:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value. So this series fixes those bugs and removes
the deprecated APIs all in one go.

Three of the patches ended up being a more complicated migration, and I
put them as the first three patches in this series (clk: sophgo:
cv18xx-ip), (clk: sunxi-ng), and (rtc: ac100). The remaining patches I
feel are all straight forward.

Merge strategy
==============

Only three of the patches are outside of drivers/clk (drm/msm, phy, and
rtc). For simplicity, I think it would be easiest if Stephen takes this
whole series through the clk tree. Subsystem maintainers please leave an
Acked-by for Stephen. Thanks!

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (27):
      clk: sophgo: cv18xx-ip: convert from divider_round_rate() to divider_determine_rate()
      clk: sunxi-ng: convert from divider_round_rate_parent() to divider_determine_rate()
      rtc: ac100: convert from divider_round_rate() to divider_determine_rate()
      clk: actions: owl-composite: convert from owl_divider_helper_round_rate() to divider_determine_rate()
      clk: actions: owl-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: bm1880: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: bm1880: convert from divider_round_rate() to divider_determine_rate()
      clk: hisilicon: clkdivider-hi6220: convert from divider_round_rate() to divider_determine_rate()
      clk: loongson1: convert from divider_round_rate() to divider_determine_rate()
      clk: milbeaut: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: milbeaut: convert from divider_round_rate() to divider_determine_rate()
      clk: nuvoton: ma35d1-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: nxp: lpc32xx: convert from divider_round_rate() to divider_determine_rate()
      clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
      clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: sophgo: sg2042-clkgen: convert from divider_round_rate() to divider_determine_rate()
      clk: sprd: div: convert from divider_round_rate() to divider_determine_rate()
      clk: stm32: stm32-core: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: stm32: stm32-core: convert from divider_round_rate_parent() to divider_determine_rate()
      clk: versaclock3: convert from divider_round_rate() to divider_determine_rate()
      clk: x86: cgu: convert from divider_round_rate() to divider_determine_rate()
      clk: zynqmp: divider: convert from divider_round_rate() to divider_determine_rate()
      drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
      phy: ti: phy-j721e-wiz: convert from divider_round_rate() to divider_determine_rate()
      clk: divider: remove divider_ro_round_rate_parent()
      clk: divider: remove divider_round_rate() and divider_round_rate_parent()

 drivers/clk/actions/owl-composite.c        |  11 +--
 drivers/clk/actions/owl-divider.c          |  17 +---
 drivers/clk/actions/owl-divider.h          |   5 -
 drivers/clk/clk-bm1880.c                   |  13 +--
 drivers/clk/clk-divider.c                  |  44 ---------
 drivers/clk/clk-loongson1.c                |   5 +-
 drivers/clk/clk-milbeaut.c                 |  15 +--
 drivers/clk/clk-versaclock3.c              |   7 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c  |   6 +-
 drivers/clk/nuvoton/clk-ma35d1-divider.c   |   7 +-
 drivers/clk/nxp/clk-lpc32xx.c              |   6 +-
 drivers/clk/qcom/clk-alpha-pll.c           |  21 ++--
 drivers/clk/qcom/clk-regmap-divider.c      |  16 +--
 drivers/clk/sophgo/clk-cv18xx-ip.c         | 154 ++++++++++++++++-------------
 drivers/clk/sophgo/clk-sg2042-clkgen.c     |  15 +--
 drivers/clk/sprd/div.c                     |   6 +-
 drivers/clk/stm32/clk-stm32-core.c         |  42 +++-----
 drivers/clk/sunxi-ng/ccu_div.c             |  25 +++--
 drivers/clk/sunxi-ng/ccu_mp.c              |  26 ++---
 drivers/clk/sunxi-ng/ccu_mult.c            |  16 +--
 drivers/clk/sunxi-ng/ccu_mux.c             |  49 +++++----
 drivers/clk/sunxi-ng/ccu_mux.h             |   8 +-
 drivers/clk/sunxi-ng/ccu_nkm.c             |  25 ++---
 drivers/clk/x86/clk-cgu.c                  |   6 +-
 drivers/clk/zynqmp/divider.c               |   5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c |   7 +-
 drivers/phy/ti/phy-j721e-wiz.c             |   5 +-
 drivers/rtc/rtc-ac100.c                    |  75 +++++++-------
 include/linux/clk-provider.h               |  28 ------
 29 files changed, 257 insertions(+), 408 deletions(-)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260107-clk-divider-round-rate-1cfd117b0670

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
