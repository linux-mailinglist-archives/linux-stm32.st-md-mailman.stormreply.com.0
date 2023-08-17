Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED6780203
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3319C6C82E;
	Thu, 17 Aug 2023 23:59:09 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6928C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:08 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1bee82fad0fso2847675ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316747; x=1692921547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GBig4ojju35UeR5nYJdcskzCIyszltPP8aM7eZxhMAc=;
 b=CX+q3KLcZFLRq0HGaHxCoLa5L4myxQlB3+uLkExLgTIU/M13dAR+tuImGaMRsXlnIX
 5EiwzNERqO941u1ZgpeILGDAjF+aAXTGTWftiTYrIx49flrdRuPcBwQo92heAoso26aV
 L2seXLXD2MlKm/ksaN6j4O9A14UF3zqIGgNCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316747; x=1692921547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GBig4ojju35UeR5nYJdcskzCIyszltPP8aM7eZxhMAc=;
 b=AWr/qDu+UtOQqhAuBco6fP6/sOTsrorBeINGXLxqFHSH3tpJ6G7Vy0042O98sKvP+k
 xJkH9p+JrCgSeeepnRY576zbdI0A2TxakGHEtAMi6+oojzOP69oC1ed1j+PZBnj0Prs/
 0O3IkNT/MPNIPRfp2/8qU1Kuj7MKX+DZcuOE5yBsj2vkHvxBPWMVicA9TntQLTp7zLmr
 XFINkjDmtWCDQzMwvVMeicvuO2h/lY3FrwDKgebX+UmmgY/QdlCsMDW2oxhGJJXq/7l8
 zvE+R8hseZzFRc1zJGstf3Pwu1i4P8Y3bc2jX+mcaadd/gGC6D8qyvZNOUq/38sWbVrl
 P0/A==
X-Gm-Message-State: AOJu0YytlSH/gDYz3D+Csg5jRpB6QvXxur7QGINSc2gw9fIY5fp4NwKW
 nzWBabHlpC1s3GlW2CW1BnykZg==
X-Google-Smtp-Source: AGHT+IFtTiKmPIDtGWpZKY6Src1ZWuKVRaDR2AR8ZYsjCDrDdceH4jjvLBuUX2egDZo9GWTtP8NFrw==
X-Received: by 2002:a17:902:dacd:b0:1b8:adea:76d0 with SMTP id
 q13-20020a170902dacd00b001b8adea76d0mr1012481plx.31.1692316747494; 
 Thu, 17 Aug 2023 16:59:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 u7-20020a170902e80700b001b9e9f191f2sm342824plg.15.2023.08.17.16.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:45 -0700
Message-Id: <20230817235859.49846-8-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230; i=keescook@chromium.org; 
 h=from:subject;
 bh=xRJQQKdAwogb4vqWXbK3omVk8LQ2U1Kgbhap9AYkMvo=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRAxAkVjLsoroU7aJkr1WgWWzRBzbsR+tdxD
 lgeTVdiQveJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QAAKCRCJcvTf3G3A
 JspMD/9uCbBEkWVx4Whm0SjF91ZUEjFm+uw5va5kJYSQaUggli1PUAzEbtIfkqE0tHxpXylvHV6
 MZAMbsTTMc4sB4m4xnYRc0EoTzuMdduuaXj7l/sncv7/LmFSoowcBNgOyqPORRYUM775TWDHeXO
 KeoIqOfRBA1pU2p6SABeK4PvYr9w3rZRX+aZiNFriijmZlDDlbGfeq8v9uQ2Im17NvWmo78uSnB
 OkH0/Si61oGt8YkSxwx3WwhmqB2o702deHwP3SlOa/ZeqfTijE2YZhDmMuKHYx7QeBfC/eMcUiR
 Z5Ir99EHJYfiOQtN+yLXwoR+0SaqDwlthzf36cY91M4+RIxRUpoV7xLXmq2q4GCAdnuZf61znzs
 M6Bidmh9xg6pqyHEGPynCNRRpn/UsrhseCWdJGYMQZLkXP2bP0VJzaHIlfivSURYMQVXc4KQwBd
 DRji9b/iiSnnLi3fSIhaQxYXT5+Ps4Au0oZl5ksmYDaMky5nRGOgwaH8K/PsnaL2g5HvZnClItG
 bdITH1ZZpfW22BCSxjF6WLtrNaQQQACl25/pjzcUllaIN1ntJsfEnFtqBBzeDv+cMihyO6Z99a5
 Kmn4lAvlEhqg16rC1j3EkD7ZrTt+gPUQteXqDvYw1UUclntbSMql5Tik8DK4sYfnwMmbaR4qWIx
 Q6tm80uQco8mfqw==
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
Subject: [Linux-stm32] [PATCH 08/21] dmaengine: sa11x0: Annotate struct
	sa11x0_dma_desc with __counted_by
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

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct sa11x0_dma_desc.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/sa11x0-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
index a29c13cae716..e5849622f198 100644
--- a/drivers/dma/sa11x0-dma.c
+++ b/drivers/dma/sa11x0-dma.c
@@ -78,7 +78,7 @@ struct sa11x0_dma_desc {
 	bool			cyclic;
 
 	unsigned		sglen;
-	struct sa11x0_dma_sg	sg[];
+	struct sa11x0_dma_sg	sg[] __counted_by(sglen);
 };
 
 struct sa11x0_dma_phy;
@@ -558,6 +558,7 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_slave_sg(
 		dev_dbg(chan->device->dev, "vchan %p: kzalloc failed\n", &c->vc);
 		return NULL;
 	}
+	txd->sglen = j;
 
 	j = 0;
 	for_each_sg(sg, sgent, sglen, i) {
@@ -593,7 +594,6 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_slave_sg(
 
 	txd->ddar = c->ddar;
 	txd->size = size;
-	txd->sglen = j;
 
 	dev_dbg(chan->device->dev, "vchan %p: txd %p: size %zu nr %u\n",
 		&c->vc, &txd->vd, txd->size, txd->sglen);
@@ -628,6 +628,7 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_dma_cyclic(
 		dev_dbg(chan->device->dev, "vchan %p: kzalloc failed\n", &c->vc);
 		return NULL;
 	}
+	txd->sglen = sglen;
 
 	for (i = k = 0; i < size / period; i++) {
 		size_t tlen, len = period;
@@ -653,7 +654,6 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_dma_cyclic(
 
 	txd->ddar = c->ddar;
 	txd->size = size;
-	txd->sglen = sglen;
 	txd->cyclic = 1;
 	txd->period = sgperiod;
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
