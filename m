Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4DE73972B
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 08:01:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22246C6B456;
	Thu, 22 Jun 2023 06:01:54 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AA28C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 15:37:01 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3f9bece8d1bso8545925e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 08:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687361821; x=1689953821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ClAzoGuEp9Q2PcVgXbgejHlPiXITPfjrxWcfTJEqc0=;
 b=AQIraaew2/zXvqE91YbkJxU/ss1rbUIc/5WuQ2mQSwEYNaPiuXgCTioCRnA75I2VFH
 +aCknfvR8zMLhgxgFgf+R4+5qcdatJMkGa8KNvvRfJbcxnUJU0FfInDocxRWkmdMvjXV
 jA6Ng/H7tcLwo0B5fe3RuLLWT368fspgiGisI9e7Y1/7perYFhsqalEbkJsnHZwzepPc
 +84/bY1JMoZu5qIIxGa5K2tC0byJVnDuBDEJxR+EkG17r1y/ENGmCwG/xT7yUoz/itB7
 8j2kOORbFrSvtdFFb4XNZSbKY7GQ0oPbztBfJ+cawzxzNLskGBR3+E7rrS3ryhjOVjTq
 eyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361821; x=1689953821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ClAzoGuEp9Q2PcVgXbgejHlPiXITPfjrxWcfTJEqc0=;
 b=HWGeRtDySzVq0xmqi4pOaSQVZyIZpEHV2WHz3eU588KLrhWmtOfKzJGl3653X5hHvZ
 6Dz92u411QXc8cI3U3XOsP8GJKGiqn7yPx3rxveUvVlZuda39lBySXwPb95XY+JD+6zj
 AzP508FTBPbx+2DkQdin1OliTExFO5Vp/cT6qM7ocHOZgSo913ISNuIyg4qA4yBVfKV/
 XiW3TgIgMe7e+qFxen9MFhNmUDgRaygXhn/ZKx1VKzLGSdWbb+sWw8/3ipWIdefpy1bc
 QlLZaIx1w69+BxPKKO3uh0VrEctYlhM8Xwm1WgLPZO/u2Nk/rPg8IqhsptFDW8cVp2mj
 EXEw==
X-Gm-Message-State: AC+VfDwR5DxPXGGZ4xAFanjer4/s0UxvnqMLdrrI9MHfCRAXJfmr3ohI
 oZ/h5YihwWs13h18mv/+s9AxKQ==
X-Google-Smtp-Source: ACHHUZ6HAkXFQk8+aVBXjAYvPLGkmxJv5JHJtkveKCNtpBoYsdRohmCW1C61OJtW2Tm6Xb1OgI9RQQ==
X-Received: by 2002:a7b:c38f:0:b0:3f8:ff4e:8ba3 with SMTP id
 s15-20020a7bc38f000000b003f8ff4e8ba3mr11474166wmj.38.1687361821346; 
 Wed, 21 Jun 2023 08:37:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1c790d000000b003f7ed463954sm5322491wme.25.2023.06.21.08.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:37:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date: Wed, 21 Jun 2023 17:36:39 +0200
Message-Id: <20230621153650.440350-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Jun 2023 06:01:52 +0000
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 00/11] net: stmmac: introduce devres
	helpers for stmmac platform drivers
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The goal of this series is two-fold: to make the API for stmmac platforms more
logically correct (by providing functions that acquire resources with release
counterparts that undo only their actions and nothing more) and to provide
devres variants of commonly use registration functions that allows to
significantly simplify the platform drivers.

The current pattern for stmmac platform drivers is to call
stmmac_probe_config_dt(), possibly the platform's init() callback and then
call stmmac_drv_probe(). The resources allocated by these calls will then
be released by calling stmmac_pltfr_remove(). This goes against the commonly
accepted way of providing each function that allocated a resource with a
function that frees it.

First: provide wrappers around platform's init() and exit() callbacks that
allow users to skip checking if the callbacks exist manually.

Second: provide stmmac_pltfr_probe() which calls the platform init() callback
and then calls stmmac_drv_probe() together with a variant of
stmmac_pltfr_remove() that DOES NOT call stmmac_remove_config_dt(). For now
this variant is called stmmac_pltfr_remove_no_dt() but once all users of
the old stmmac_pltfr_remove() are converted to the devres helper, it will be
renamed back to stmmac_pltfr_remove() and the no_dt function removed.

Finally use the devres helpers in dwmac-qco-ethqos to show how much simplier
the driver's probe() becomes.

This series obviously just starts the conversion process and other platform
drivers will need to be converted once the helpers land in net/.

Bartosz Golaszewski (11):
  net: stmmac: platform: provide stmmac_pltfr_init()
  net: stmmac: dwmac-generic: use stmmac_pltfr_init()
  net: stmmac: platform: provide stmmac_pltfr_exit()
  net: stmmac: dwmac-generic: use stmmac_pltfr_exit()
  net: stmmac: platform: provide stmmac_pltfr_probe()
  net: stmmac: dwmac-generic: use stmmac_pltfr_probe()
  net: stmmac: platform: provide stmmac_pltfr_remove_no_dt()
  net: stmmac: platform: provide devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-qco-ethqos: use devm_stmmac_probe_config_dt()
  net: stmmac: platform: provide devm_stmmac_pltfr_probe()
  net: stmmac: dwmac-qcom-ethqos: use devm_stmmac_pltfr_probe()

 .../ethernet/stmicro/stmmac/dwmac-generic.c   |  14 +-
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  48 ++----
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 158 +++++++++++++++++-
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  14 ++
 4 files changed, 179 insertions(+), 55 deletions(-)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
