Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A88C1FB8
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2024 10:29:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36167C62EFE;
	Fri, 10 May 2024 08:29:45 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 515CDC030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2024 08:29:37 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-de610854b8bso3015556276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2024 01:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715329776; x=1715934576;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dnr78Drl0hwy8QosBN5FMiEeANWK1Ml2Xi29sDzFrpE=;
 b=aZb4kEcnAtjD1SgeByg9pE2cI6pAH5FqbycOzeNM2+q+Rvc9E0Xk9THt4/DUuiA+XJ
 fuctSMNH5L8j4kP/wktgoV3JUe3jy0zjAmLb1hK85MzvmuX0xZpVTp5hNSpAdBC77LEd
 1QTxRWFmL0nrV+TsS9c9GidYi//fKPxjqz1TY6g4IjFMhZfCtmwVgy+m9/+CzVSDQz66
 TDxoYyAMgpaAMiQ1+xVjDuAlP3IebWTSdyysCT/5Z8Nxdmcv3MDY9uJWZiVKFF6mIkh6
 eSwUgnQWJyiy3mkYdrtnPM4jmrwii3bFiZZKAK0zP5UemnRNTviqQDE9uWWIFRppwKpc
 lH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715329776; x=1715934576;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dnr78Drl0hwy8QosBN5FMiEeANWK1Ml2Xi29sDzFrpE=;
 b=O1vGruvUGVCL3BffHSh0sTmAd5S4h0JEbp/Vm72wWvQqWNBLh9Q8K1TlsUZSZInyBa
 p7BOzCsjL+9axTZJkrVQMgLP1I+AW54J5WTLmCX+iqV4XLQwE4lQYONblJORUwdwPhW8
 uP8JnxzclAENeCZ1jYVjxa0MtOszVQK9IJBkTQZDPHEWD1e2EtwuGMDMxApQN9rxDiLE
 YLYAsRpJ55Z/CGGchhvtI+uUyQK/RyweIA7zGNkIAhBxOnIcNH3TSot/5sOXUBNcD24P
 3Ik+8wYaDhpITs/za/XTthqWLNplMcI7EVCVmALTOOZ2E4cogmJTunj8PqaSNy+WchFq
 VuCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk2qBfvNmFlUQW3vrQVp8WTqsb5h3CTqPOEKZO17sVkx6WVx+aKibIFn0Yev4bYkvAihEGcGgpYazXIs5Ik+KFkBJf38TFfeQlukaTlLBVzATLtmcJjveQ
X-Gm-Message-State: AOJu0Yz71yXY9Q6TQRE+xJpsUqdPVfRrx+A/J7rNMsox2kgJfIK0Ad3k
 /UULKxQ/ieP+PJyHYBn08TKyj+U6gtBKV5Z3laWVDWaUvMRiOXq1+zkNaqjkUgYjZwWcmApgA8B
 qPE8WzoFbig==
X-Google-Smtp-Source: AGHT+IEiknRtBHdrQ2HgiFa5pD74L/Ye3Nv3Q0grhoikyts9vAUMehW+Dt9fd3K3/ZrjmNUP76nhD8GAX7HaoA==
X-Received: from joychakr.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:c09:b0:de5:5304:3206 with SMTP
 id 3f1490d57ef6-dee4f52d715mr180759276.11.1715329776091; Fri, 10 May 2024
 01:29:36 -0700 (PDT)
Date: Fri, 10 May 2024 08:29:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510082929.3792559-1-joychakr@google.com>
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
Cc: manugautam@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Joy Chakraborty <joychakr@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/1] nvmem: Handle actual amount of data
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
V3 Changes : Fix return value of reg_read in sunxi_sid.c driver
---
V2 Changes : Rebase on for-next.
---
V1 Changes : Change read/write callback prototype to ssize_t and
supplier changes to accomodate the same with core checks and bounds.
---

Joy Chakraborty (1):
  nvmem: Change return type of reg read/write to ssize_t

 drivers/nvmem/apple-efuses.c        |  7 +--
 drivers/nvmem/bcm-ocotp.c           | 12 ++---
 drivers/nvmem/brcm_nvram.c          | 10 ++--
 drivers/nvmem/core.c                | 83 +++++++++++++----------------
 drivers/nvmem/imx-iim.c             |  6 +--
 drivers/nvmem/imx-ocotp-ele.c       |  4 +-
 drivers/nvmem/imx-ocotp-scu.c       | 12 ++---
 drivers/nvmem/imx-ocotp.c           | 10 ++--
 drivers/nvmem/jz4780-efuse.c        |  7 +--
 drivers/nvmem/lan9662-otpc.c        | 12 ++---
 drivers/nvmem/layerscape-sfp.c      | 11 ++--
 drivers/nvmem/lpc18xx_eeprom.c      | 14 ++---
 drivers/nvmem/lpc18xx_otp.c         |  6 +--
 drivers/nvmem/meson-efuse.c         | 22 +++++---
 drivers/nvmem/meson-mx-efuse.c      |  6 +--
 drivers/nvmem/microchip-otpc.c      |  6 +--
 drivers/nvmem/mtk-efuse.c           |  6 +--
 drivers/nvmem/mxs-ocotp.c           |  7 +--
 drivers/nvmem/nintendo-otp.c        |  6 +--
 drivers/nvmem/qcom-spmi-sdam.c      | 12 ++---
 drivers/nvmem/qfprom.c              | 14 ++---
 drivers/nvmem/qoriq-efuse.c         |  6 +--
 drivers/nvmem/rave-sp-eeprom.c      | 18 +++----
 drivers/nvmem/rmem.c                |  4 +-
 drivers/nvmem/rockchip-efuse.c      | 19 +++----
 drivers/nvmem/rockchip-otp.c        | 19 +++----
 drivers/nvmem/sc27xx-efuse.c        |  3 +-
 drivers/nvmem/sec-qfprom.c          |  4 +-
 drivers/nvmem/snvs_lpgpr.c          | 17 +++---
 drivers/nvmem/sprd-efuse.c          |  8 +--
 drivers/nvmem/stm32-bsec-optee-ta.c | 12 ++---
 drivers/nvmem/stm32-bsec-optee-ta.h | 20 +++----
 drivers/nvmem/stm32-romem.c         | 26 ++++-----
 drivers/nvmem/sunplus-ocotp.c       |  4 +-
 drivers/nvmem/sunxi_sid.c           | 18 ++++---
 drivers/nvmem/u-boot-env.c          |  6 +--
 drivers/nvmem/uniphier-efuse.c      |  6 +--
 drivers/nvmem/vf610-ocotp.c         |  7 +--
 drivers/nvmem/zynqmp_nvmem.c        | 13 ++---
 include/linux/nvmem-provider.h      |  4 +-
 40 files changed, 255 insertions(+), 232 deletions(-)

-- 
2.45.0.118.g7fe29c98d7-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
