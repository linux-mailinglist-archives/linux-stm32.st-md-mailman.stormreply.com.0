Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75092275255
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 09:36:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FC0EC3FADE;
	Wed, 23 Sep 2020 07:36:56 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8525C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 19:27:07 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id k25so15107235ljg.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 12:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9cpt1dNCJgsbEN9MEo3XnIHRq7hWgh7WobDyOrCQzvU=;
 b=l6g/u5iSTbtjMW/bXos5i0WqnL8nhP75EMh0pcnRL0UBt6+z8EX+9l54qOXuBWLpqe
 DjFcpWZjC9hsG+pjhbdzjZ4hooccZEzgn9hey+kNwdjlhbycJxXzWSfr/hmviRi/vOPg
 s5UWyZH1QATu8x2AZLPnXnaeB4BvZjvFT+6HWVTgtKLwEobQehUp0p31i7RI/LdBt3zB
 mTxRD3WXVZc8lym+JJXWS78pOD/r/CblS+fzxq+tl2/QXuppW3g9NLUBcxK381CZkV/N
 S7ZzHtpD1sVeo4u19IJnqI9uP/PVv6U/7VAsCKL9ZE0Bw6RqmwI4p6qOS31j7umJKrEF
 mV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9cpt1dNCJgsbEN9MEo3XnIHRq7hWgh7WobDyOrCQzvU=;
 b=i992V//5JyxCaAKC5W4qWv82dYYNb4Q7805mCnTz0gvAe57owoDTsNaxsEXoNoQJxe
 /hI34Cjn8uOy1wwsXTMp9goI9qVuZrLR80kaSXw2ns+ykn49ANO5OZ9+RGSDl2PFpmdh
 CTsC9ceIb13yH3v+QfrEiosUTCK8Ye+RiMODrt2m7mHT0HbODES4hiF6Zc18WYrdWWKH
 r/9ZTSqK1W8mqbQBmJaOJ3ASEKG91mJsEjJ0lamGc4olkp9KbC7ydC8FZFnc/63A9GJU
 RKgKeAgCTpHXO7qfHfq+xx81trHcHa2XQyw86ilg2zfNSLITwaRNRBX+EYNqp0KSkXmY
 sbcg==
X-Gm-Message-State: AOAM532Ukr+jaiakfSqtiqZlY+R6FsmGoXb0uH0Y5CP9IpzyBRAzzwkr
 QW7psTGADT0G2H4S9BVIYjI=
X-Google-Smtp-Source: ABdhPJyAx7qCmFwloXWmCYvXS52s5OAJho5iDN1YztW7szjWbufuaIE/wh5LtJgNJ5Dg086XE0wm7A==
X-Received: by 2002:a2e:95d3:: with SMTP id y19mr969054ljh.393.1600802826938; 
 Tue, 22 Sep 2020 12:27:06 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se.
 [82.196.111.59])
 by smtp.gmail.com with ESMTPSA id r132sm3770013lff.167.2020.09.22.12.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 12:27:06 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Tue, 22 Sep 2020 21:26:51 +0200
Message-Id: <20200922192659.14535-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:36:54 +0000
Cc: Milo Kim <milo.kim@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 support.opensource@diasemi.com, Tony Lindgren <tony@atomide.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/8] drivers/mfd: Constify static struct
	resource
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

Constify a number of static struct resource to allow the compiler to put
them in read-only memory. Typically, the only usage of these is to assign
their address to the resources field in the mfd_cell struct, which is a
const pointer (a few drivers also read the value of the start field).

I went through the rest of the static instances of struct resource in
drivers/mfd and all of them are either directly modified by the driver
or has its address passed to mfd_add_devices() which takes a non-const
pointer.

The series is compile-tested only.

I split this into patches per maintainer, I'll happily split it (or squash
it) some other way if that's preferable.

Rikard Falkeborn (8):
  mfd: da: Constify static struct resource
  mfd: intel: Constify static struct resource
  mfd: Constify static struct resource in OMAP2+ drivers
  mfd: wm: Constify static struct resource
  mfd: lp8788: Constify static struct resource
  mfd: stmpe: Constify static struct resource
  mfd: sun4i-gpadc: Constify static struct resource
  mfd: Constify static struct resource

 drivers/mfd/88pm800.c                 |  2 +-
 drivers/mfd/88pm860x-core.c           | 50 ++++++++++++------------
 drivers/mfd/da9055-core.c             |  8 ++--
 drivers/mfd/da9062-core.c             | 24 ++++++------
 drivers/mfd/da9063-core.c             |  8 ++--
 drivers/mfd/da9150-core.c             |  6 +--
 drivers/mfd/hi655x-pmic.c             |  2 +-
 drivers/mfd/intel_msic.c              | 18 ++++-----
 drivers/mfd/intel_quark_i2c_gpio.c    |  4 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c    | 14 +++----
 drivers/mfd/intel_soc_pmic_chtdc_ti.c | 10 ++---
 drivers/mfd/intel_soc_pmic_chtwc.c    |  4 +-
 drivers/mfd/intel_soc_pmic_crc.c      | 10 ++---
 drivers/mfd/ioc3.c                    | 16 ++++----
 drivers/mfd/lp8788.c                  |  4 +-
 drivers/mfd/max8925-core.c            | 56 +++++++++++++--------------
 drivers/mfd/rdc321x-southbridge.c     |  4 +-
 drivers/mfd/retu-mfd.c                |  4 +-
 drivers/mfd/rk808.c                   |  8 ++--
 drivers/mfd/stmpe.c                   | 10 ++---
 drivers/mfd/sun4i-gpadc.c             |  2 +-
 drivers/mfd/tc3589x.c                 |  4 +-
 drivers/mfd/tc6387xb.c                |  2 +-
 drivers/mfd/tc6393xb.c                |  6 +--
 drivers/mfd/tps65090.c                |  2 +-
 drivers/mfd/tps65217.c                |  4 +-
 drivers/mfd/tps6586x.c                |  2 +-
 drivers/mfd/tps65910.c                |  2 +-
 drivers/mfd/tps80031.c                |  2 +-
 drivers/mfd/wm831x-core.c             | 52 ++++++++++++-------------
 drivers/mfd/wm8994-core.c             |  4 +-
 31 files changed, 172 insertions(+), 172 deletions(-)

-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
