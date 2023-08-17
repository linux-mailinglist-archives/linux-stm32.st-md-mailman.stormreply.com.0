Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 284AE7801FF
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86209C6C821;
	Thu, 17 Aug 2023 23:59:06 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0851C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:04 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-26b4cf4f7b9so267426a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316743; x=1692921543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gLiCnBbyPzaic/GZ7z4G3P0cbvM2XGBwdo50oYhUApk=;
 b=P5Pp0wwT5nzP3n43DVWzU0GTRLBYDoDSQDfCmbHmbAyHke8vM3wJwLlQCndFTYZ7KE
 ZVi1VZoSjZdpJ+Cv7UQqBsqf+jX/87/JGb0fruxGutn29PXRZMDB9jPSZIrj3VxbaicZ
 bNJeGzg/zR8SLlYCw17rI+RJwBXQBpyTYDPlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316743; x=1692921543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gLiCnBbyPzaic/GZ7z4G3P0cbvM2XGBwdo50oYhUApk=;
 b=If3hZ4BATufGt2ki5szhqP1COpTJZ4oCYDJ30llJu7etNmuT6YNZ1w2M91J5j/Cfka
 MNTaZk0WS+wy0e3r8E/oUVTnX/me+JiFHve3KElizUN1LZAweBilngyZzEgaBmClAyWq
 ab9A8lWT7Zc4oUOm85WPXloU0md+T5lNF+5vWosnyWbfxTPQlPaYv6A+OVqWoXa+9XFE
 L4zKunjElMpLSHmAvrCo86M9D/bfH0udk/P+uen0Vd4ez+8N4UF9EUiwlgTRx83vqySB
 x49taBl7/F7L61TgXh6L5UOD1dNukPxLutKs8nkcS5/cZbmn1gyPQUb37dTFVAYMSRBz
 V/TA==
X-Gm-Message-State: AOJu0Yyo8BWmDIETPB5MDbJMpxirZHvbvlsW9/pTpJm1vX1Gj9cvRKzE
 gD7exv6TL3wel36E5LJ1NsSQXw==
X-Google-Smtp-Source: AGHT+IG7Ur7jvG1Cor78dTTxi94xoQ0HyBPagkNa35jw/ciTiPyRGRuVsIer724v3p+TKZGgt/zcZQ==
X-Received: by 2002:a17:90a:7564:b0:262:d7db:2520 with SMTP id
 q91-20020a17090a756400b00262d7db2520mr994346pjk.26.1692316743403; 
 Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 s10-20020a17090a948a00b00263cca08d95sm2101254pjo.55.2023.08.17.16.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:00 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:37 -0700
Message-Id: <20230817235428.never.111-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2707; i=keescook@chromium.org; 
 h=from:subject:message-id;
 bh=X+13aptrkzlZofkuldd+d07374jzvU5KMGSMFeBiQiA=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rQ/Y/4ffzo1IbZvWMUH7ld52PtnkCTORxyHK
 CIS35jFSfGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60PwAKCRCJcvTf3G3A
 Jmk6D/91xaM88OIg15Z+90cr21kEhBomkBw2kzWyeOFGSeWZfWBT9v5HW3rrVN64Q7kDB9XAJal
 nI4M0KHJ8cUO6Y8Oww5+x4tmVhFS+/yiSYyxDNbGtiEP8zwAJazWBFG/VAIXoqJgr65f9N5MrMB
 tpMNT5QDBa+NOdvwfEWIqptgdiUfftpp3/JCQpoUJZ4170WFUNdylNkOKOPlZWzpB/Z7GOnXskj
 Y1F1IK0F8spqaHu/QGQTnrZa1o6gGjKYuxFrbZ4zlMZRP6cXwRZ0m6mDTeTaaItw3X13J97fgUo
 +KCUF1tsNSs50HZwRVPdXjSJj7iidcnHdBsGgUJixBqnHI+eUuwI/fXIEDWrZi5f6nl8i+4okPg
 VnbPoCI4gD1g9nfDtXklxQcCpgY6Jz519HM0b2UWNjQi8Nwc4DAovAEsCwLNvgdZtD+p832lPfn
 YSpjXkaDWrfN2tgUC/YmPkkuGyybh/vqVuNhp78qD1aXxmydmnU5+5WL2AyRzmP6Y/xlHa5wO4g
 b/PSScMBx7nKATYBufXnhc8uQfrucLW4+GkmubGiNp03RUxPh5cKo2hoJtIZWTZCsuMKQhS8gdD
 YLlNjS9qafx1FicrUpVmxB5pFplJDCN/02onKYItefjjDduHSTMCC4tIJ//0yRQN+DfP5lzceR4
 h6gsvBD jioTUffw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-hardening@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jie Hai <haijie1@huawei.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, asahi@lists.linux.dev,
 Kees Cook <keescook@chromium.org>, Sven Peter <sven@svenpeter.dev>,
 linux-arm-msm@vger.kernel.org, Green Wan <green.wan@sifive.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Yu Kuai <yukuai3@huawei.com>,
 linux-tegra@vger.kernel.org, Jordy Zomer <jordy@pwning.systems>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Zhou Wang <wangzhou1@hisilicon.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org
Subject: [Linux-stm32] [PATCH 00/21] dmaengine: Annotate with __counted_by
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

Hi,

This annotates several structures with the coming __counted_by attribute
for bounds checking of flexible arrays at run-time. For more details, see
commit dd06e72e68bc ("Compiler Attributes: Add __counted_by macro").

Thanks!

-Kees

Kees Cook (21):
  dmaengine: apple-admac: Annotate struct admac_data with __counted_by
  dmaengine: at_hdmac: Annotate struct at_desc with __counted_by
  dmaengine: axi-dmac: Annotate struct axi_dmac_desc with __counted_by
  dmaengine: fsl-edma: Annotate struct fsl_edma_desc with __counted_by
  dmaengine: hisilicon: Annotate struct hisi_dma_dev with __counted_by
  dmaengine: moxart-dma: Annotate struct moxart_desc with __counted_by
  dmaengine: qcom: bam_dma: Annotate struct bam_async_desc with
    __counted_by
  dmaengine: sa11x0: Annotate struct sa11x0_dma_desc with __counted_by
  dmaengine: sf-pdma: Annotate struct sf_pdma with __counted_by
  dmaengine: sprd: Annotate struct sprd_dma_dev with __counted_by
  dmaengine: st_fdma: Annotate struct st_fdma_desc with __counted_by
  dmaengine: stm32-dma: Annotate struct stm32_dma_desc with __counted_by
  dmaengine: stm32-mdma: Annotate struct stm32_mdma_desc with
    __counted_by
  dmaengine: stm32-mdma: Annotate struct stm32_mdma_device with
    __counted_by
  dmaengine: tegra: Annotate struct tegra_dma_desc with __counted_by
  dmaengine: tegra210-adma: Annotate struct tegra_adma with __counted_by
  dmaengine: ti: edma: Annotate struct edma_desc with __counted_by
  dmaengine: ti: omap-dma: Annotate struct omap_desc with __counted_by
  dmaengine: uniphier-xdmac: Annotate struct uniphier_xdmac_desc with
    __counted_by
  dmaengine: uniphier-xdmac: Annotate struct uniphier_xdmac_device with
    __counted_by
  dmaengine: usb-dmac: Annotate struct usb_dmac_desc with __counted_by

 drivers/dma/apple-admac.c      |  2 +-
 drivers/dma/at_hdmac.c         |  2 +-
 drivers/dma/dma-axi-dmac.c     |  5 ++---
 drivers/dma/fsl-edma-common.h  |  2 +-
 drivers/dma/hisi_dma.c         |  2 +-
 drivers/dma/moxart-dma.c       |  5 ++---
 drivers/dma/qcom/bam_dma.c     |  2 +-
 drivers/dma/sa11x0-dma.c       |  6 +++---
 drivers/dma/sf-pdma/sf-pdma.h  |  2 +-
 drivers/dma/sh/usb-dmac.c      |  2 +-
 drivers/dma/sprd-dma.c         |  2 +-
 drivers/dma/st_fdma.h          |  2 +-
 drivers/dma/stm32-dma.c        | 11 ++++-------
 drivers/dma/stm32-mdma.c       |  9 ++++-----
 drivers/dma/tegra186-gpc-dma.c |  2 +-
 drivers/dma/tegra210-adma.c    |  2 +-
 drivers/dma/ti/edma.c          |  2 +-
 drivers/dma/ti/omap-dma.c      |  5 ++---
 drivers/dma/uniphier-xdmac.c   |  8 ++++----
 19 files changed, 33 insertions(+), 40 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
