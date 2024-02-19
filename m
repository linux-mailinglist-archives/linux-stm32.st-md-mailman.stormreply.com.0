Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EA185A61B
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 15:37:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DBE1C69063;
	Mon, 19 Feb 2024 14:37:11 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67817C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 11:32:18 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-dcbfe1a42a4so9078679276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 03:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708342337; x=1708947137;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=F9Y8XdXv1kzTQtopo89RJ5Qe87rOsaXFYORvSusUYec=;
 b=BN8goNjDYARqOPa3kTTPMgpq2LDyff46Nn/dKRRkx7KKaTDIZERqc9HFvqxiNQR/JV
 KMdi5xUj7fauVauB1jR64YoGNPvqzHLuwL26/CZ37goAeisZXTco+IKo9xgVDL++td1b
 stJV+0a7Us+SvQ05lpYhBJlfjVhjwtiD5MPm5FT0AzGTyT54r4MucMunK0I9qOLLAUEL
 xM+FOTcdVnoGtvMUvLJ62SXYPIpnlsG9aFk0kmGbx1YmsRWRUPQhkIR8y30yk6PDnoe1
 rIqBRk2fUfrUEyVOWX7yoC/g5GcQwX4VGYh7yKTr8UwEzsKDenLemmnIS1vBP8Rj3V3M
 t6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708342337; x=1708947137;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F9Y8XdXv1kzTQtopo89RJ5Qe87rOsaXFYORvSusUYec=;
 b=Ms+r5xnqTHima9E+K7uUetJa3dw6hcyG09c6Jc1YVMuWbHP3WCBLQMxBWTYMfRz5gF
 gJpICHotTY2XMcdwdty4k3LDMaFnHYGrYzxaIVDtHuNCa0IiLxPcwsKoje+fhnQ5cqMj
 /nF2oVF4GedLVlIGZn+N0w9Z/KbVsOZidCxps0+p4i8k4Q9qnKY4ZYxmje6k3adZvvGn
 4hFnLPdD8BTf39PfB0VkGveocFcAb8d9/SDXa1MDp21W2+91ob6OvU06H/urG4HWLTLA
 7V/mYvyEvrVGu33B+1GXl4cNyB9IPverMoNnSzz7TkegjRPju8zBWnHGIvlC7UG9GeEx
 880w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDptDPKMNnufnfsr4XSo+U37DNueiGuBV1r8XN7LAs8mY4IkYA0MuP4gkFDjC6l/Gl+mVrUCAWah+zgviPcF9FTyUMjcfnyvQ/TfJpDFDVxz1DtgZWLrN9
X-Gm-Message-State: AOJu0YwjaTUg3ag2Ftgs36K1Txo72ScuG0yUGCbmP/vEHj26rJI9+2FJ
 1ieWRLgXhVWr9ESCRhpjVl46u4AputPmsjPitAfy3yDMjlX45Giv8CkBRsOmrUgy27y7po9dyWm
 0ZnG+g/RyWw==
X-Google-Smtp-Source: AGHT+IFrFQSwNuSWu6/Y6yp6TLKb1ES+/eMj+OGcS+zU6Jh3xmGly/67ECjCQIexHldo+hDW4MAPEIU45QbnUA==
X-Received: from joychakr.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:ced3:0:b0:dc2:3441:897f with SMTP id
 x202-20020a25ced3000000b00dc23441897fmr3248186ybe.6.1708342337288; Mon, 19
 Feb 2024 03:32:17 -0800 (PST)
Date: Mon, 19 Feb 2024 11:31:48 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240219113149.2437990-1-joychakr@google.com>
From: Joy Chakraborty <joychakr@google.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rafal Milecki <rafal@milecki.pl>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>
X-Mailman-Approved-At: Mon, 19 Feb 2024 14:37:10 +0000
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Joy Chakraborty <joychakr@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 0/1] nvmem: Handle actual amount of data
	read/written by suppliers
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

This Patch series stems from discussions in patchset,
"[PATCH v2] nvmem: rmem: Fix return value of rmem_read()"
(https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/).
Where we come across the fact that currently the nvmem suppliers do not
actually let the core know how much data has been actually read or written.
Instead they are expected to return 0 for success and the core assumes that
the amount of data written is equal to what the core has requested.

On addition this patchset will also add some guards and checks based on the
count of data returned by the nvmem supplier.
---
V1 Changes : Change read/write callback prototype to ssize_t and
supplier changes to accomodate the same with core checks and bounds.
---

Joy Chakraborty (1):
  nvmem: Change return type of reg read/write to ssize_t

 drivers/nvmem/apple-efuses.c        |  5 +-
 drivers/nvmem/bcm-ocotp.c           |  8 ++--
 drivers/nvmem/brcm_nvram.c          |  8 +++-
 drivers/nvmem/core.c                | 73 +++++++++++++----------------
 drivers/nvmem/imx-iim.c             |  4 +-
 drivers/nvmem/imx-ocotp-ele.c       |  4 +-
 drivers/nvmem/imx-ocotp-scu.c       |  8 ++--
 drivers/nvmem/imx-ocotp.c           |  6 +--
 drivers/nvmem/jz4780-efuse.c        |  5 +-
 drivers/nvmem/lan9662-otpc.c        |  8 ++--
 drivers/nvmem/layerscape-sfp.c      |  7 ++-
 drivers/nvmem/lpc18xx_eeprom.c      | 10 ++--
 drivers/nvmem/lpc18xx_otp.c         |  4 +-
 drivers/nvmem/meson-efuse.c         | 10 +++-
 drivers/nvmem/meson-mx-efuse.c      |  4 +-
 drivers/nvmem/microchip-otpc.c      |  4 +-
 drivers/nvmem/mtk-efuse.c           |  4 +-
 drivers/nvmem/mxs-ocotp.c           |  5 +-
 drivers/nvmem/nintendo-otp.c        |  4 +-
 drivers/nvmem/qcom-spmi-sdam.c      |  8 ++--
 drivers/nvmem/qfprom.c              | 10 ++--
 drivers/nvmem/qoriq-efuse.c         |  4 +-
 drivers/nvmem/rave-sp-eeprom.c      | 12 ++---
 drivers/nvmem/rmem.c                |  2 +-
 drivers/nvmem/rockchip-efuse.c      | 11 +++--
 drivers/nvmem/rockchip-otp.c        | 13 ++---
 drivers/nvmem/sc27xx-efuse.c        |  3 +-
 drivers/nvmem/sec-qfprom.c          |  4 +-
 drivers/nvmem/snvs_lpgpr.c          | 13 +++--
 drivers/nvmem/sprd-efuse.c          |  8 ++--
 drivers/nvmem/stm32-bsec-optee-ta.c |  8 ++--
 drivers/nvmem/stm32-bsec-optee-ta.h | 12 ++---
 drivers/nvmem/stm32-romem.c         | 16 +++----
 drivers/nvmem/sunplus-ocotp.c       |  4 +-
 drivers/nvmem/sunxi_sid.c           | 11 +++--
 drivers/nvmem/u-boot-env.c          |  4 +-
 drivers/nvmem/uniphier-efuse.c      |  4 +-
 drivers/nvmem/vf610-ocotp.c         |  5 +-
 drivers/nvmem/zynqmp_nvmem.c        |  2 +-
 include/linux/nvmem-provider.h      |  4 +-
 40 files changed, 180 insertions(+), 159 deletions(-)

-- 
2.44.0.rc0.258.g7320e95886-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
