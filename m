Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D038B678
	for <lists+linux-stm32@lfdr.de>; Thu, 20 May 2021 21:01:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAFEBC57B60;
	Thu, 20 May 2021 19:01:10 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2ABDC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 19:01:09 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id x8so18707969wrq.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 12:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2DRojMIGvqGqfd6599LIXINUCsrKqBTGuM0HeJNOCqY=;
 b=BhW/gXf8pWSAZIebe6nxATFBDBMilShlmVRZzJL0Z7cmhZ34wH8yiODRYqZmjd0Bbw
 5FLnj7yUL68hbF/XNuFKxoi0pfP4IxkJ9c+tMdT028yF+NF5NC4AbnGloFwc4U/IgJJb
 HkBmb6/op7D4qo7GUrP+MqqfwZ6YMDM+Oxk8Miamy9HC5vBwZMh5J6OxRXCPhVYondTN
 OQQCjBR3wG190MivkxGFRMZfvJSZhA+Pb19zi5r6dE1ffLHfPQK8OngnGA2VqwGj8doy
 fyt+TWfbk49ktvoZDPBPDYLY6+bP73h8SefLmUIpQlMpElMBtYVTr7MMgHl7IQ2YM0NU
 tiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2DRojMIGvqGqfd6599LIXINUCsrKqBTGuM0HeJNOCqY=;
 b=d9IGkldcOf5EhQ2NAFsLCMCxA9g1vBqk+Vy7yK3pOXlBH6biIH2Bmem8OybVrIKOfh
 7u8ppgoC7cwM8UJ36gQE2ka1RElKVSLP8UYPabmdkwl7dRLuS4LK9Orl4X9h9WwZ7p+y
 OniMq6Xz4ffVt+utv082F4LG4N7DI1Przc354m3WBDqVTF7il0rhtqSPRFofBTVqZgKb
 Chf82MSkUBjc2OoluggBa4nXBCHO+l6ZRHDG7teM7fP6dBgbnsD2blbI+aTUrS4pSsJB
 Ycj44FjWmlaMRnVLPLLMvNDJwY0kXUULkX+3bs+MSl18sctcPh2LahRNESn4PmK7HQ8U
 H9bg==
X-Gm-Message-State: AOAM533CAd9I34lRmJpOe5yuBwyxYwOyU4ydrd/w/IlnflWcYWklp/m3
 cBa4LikHOzV0o6st8mtSJWGv2g==
X-Google-Smtp-Source: ABdhPJyFFyrDcMhhbJFcjr+Bz0N+pSMlyvPDFQtGOrLH3IV1YMX4KzVeEjRTqSnwuhvjNtamRbprxA==
X-Received: by 2002:adf:f58e:: with SMTP id f14mr5759911wro.258.1621537269261; 
 Thu, 20 May 2021 12:01:09 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 12:01:08 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu, 20 May 2021 20:00:49 +0100
Message-Id: <20210520190105.3772683-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Thor Thayer <thor.thayer@linux.intel.com>,
 Tomoya MORINAGA <tomoya.rohm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Andreas Larsson <andreas@gaisler.com>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Rudolf Marek <r.marek@assembler.cz>, linux-i2c@vger.kernel.org,
 Sachin Verma <sachin.verma@st.com>,
 Cedric Madianga <cedric.madianga@gmail.com>, linux-riscv@lists.infradead.org,
 Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Marek Vasut <marex@denx.de>,
 Peter Korsgaard <peter@korsgaard.com>, Vitaly Wool <vwool@ru.mvista.com>,
 Fabio Estevam <festevam@gmail.com>,
 Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Anders Berg <anders.berg@lsi.com>,
 Jean Delvare <jdelvare@suse.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Dennis Kovalev <dkovalev@ru.mvista.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <maxime.coquelin@st.com>, Max Schwarz <max.schwarz@online.de>,
 Doug Anderson <dianders@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Shariff Md <smohammed@nvidia.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Peter Rosin <peda@axentia.se>
Subject: [Linux-stm32] [PATCH 00/16] Rid W=1 warnings from I2C
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

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (16):
  i2c: busses: i2c-nomadik: Fix formatting issue pertaining to 'timeout'
  i2c: muxes: i2c-arb-gpio-challenge: Demote non-conformant kernel-doc
    headers
  i2c: busses: i2c-ali1563: File headers are not good candidates for
    kernel-doc
  i2c: busses: i2c-altera: Fix formatting issue in struct and demote
    unworthy kernel-doc headers
  i2c: busses: i2c-axxia: Fix formatting issue in struct and demote
    unworthy kernel-doc headers
  i2c: busses: i2c-cadence: Fix incorrectly documented 'enum
    cdns_i2c_slave_mode'
  i2c: busses: i2c-designware-master: Fix misnaming of
    'i2c_dw_init_master()'
  i2c: busses: i2c-eg20t: Fix 'bad line' issue and provide description
    for 'msgs' param
  i2c: busses: i2c-mxs: Demote barely half complete kernel-doc header
  i2c: busses: i2c-ocores: Place the expected function names into the
    documentation headers
  i2c: busses: i2c-pnx: Provide descriptions for 'alg_data' data
    structure
  i2c: busses: i2c-rk3x: Demote unworthy headers and help more complete
    ones
  i2c: busses: i2c-st: Fix copy/paste function misnaming issues
  i2c: busses: i2c-stm32f4: Remove incorrectly placed ' ' from function
    name
  i2c: busses: i2c-tegra-bpmp: Demote kernel-doc abuses
  i2c: busses: i2c-st: trivial: Fix spelling issue 'enmpty => empty'

 drivers/i2c/busses/i2c-ali1563.c           |  2 +-
 drivers/i2c/busses/i2c-altera.c            |  9 ++++-----
 drivers/i2c/busses/i2c-axxia.c             | 11 +++++------
 drivers/i2c/busses/i2c-cadence.c           |  2 +-
 drivers/i2c/busses/i2c-designware-master.c |  2 +-
 drivers/i2c/busses/i2c-eg20t.c             |  3 ++-
 drivers/i2c/busses/i2c-mxs.c               |  2 +-
 drivers/i2c/busses/i2c-nomadik.c           |  2 +-
 drivers/i2c/busses/i2c-ocores.c            |  8 ++++----
 drivers/i2c/busses/i2c-pnx.c               |  8 ++++----
 drivers/i2c/busses/i2c-rk3x.c              | 18 +++++++++---------
 drivers/i2c/busses/i2c-st.c                |  4 ++--
 drivers/i2c/busses/i2c-stm32f4.c           |  2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c        |  4 ++--
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c |  4 ++--
 15 files changed, 40 insertions(+), 41 deletions(-)

Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Anders Berg <anders.berg@lsi.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Cedric Madianga <cedric.madianga@gmail.com>
Cc: Dennis Kovalev <dkovalev@ru.mvista.com>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-tegra@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Coquelin <maxime.coquelin@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Max Schwarz <max.schwarz@online.de>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc: Rudolf Marek <r.marek@assembler.cz>
Cc: Sachin Verma <sachin.verma@st.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shariff Md <smohammed@nvidia.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thor Thayer <thor.thayer@linux.intel.com>
Cc: Tomoya MORINAGA <tomoya.rohm@gmail.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Vitaly Wool <vwool@ru.mvista.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Wolfram Sang <wsa@kernel.org>
-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
