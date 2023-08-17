Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F01C780206
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E760C6C829;
	Thu, 17 Aug 2023 23:59:13 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E6E3C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:10 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3a44cccbd96so227796b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316749; x=1692921549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aFfpOm3BUPwNUFmD6NhnAMbQ/2S0ir/QqXgwBqevnLk=;
 b=EqYcViRLy+hIr+dGw8oMOHY5NdZUL3VGgCCB1DCYkyJCtv9U0YnPuWHnP6ypMyMFrr
 Vk0YDZNsPMj8eHr69pt/3dPEPWWe0DnNmDTipbpAdcFo51ZUD3H+79JZFkylV+sVqmZL
 fM7pL/eKGfT2nw6+cn3duAt/BNduGqjmY/D3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316749; x=1692921549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aFfpOm3BUPwNUFmD6NhnAMbQ/2S0ir/QqXgwBqevnLk=;
 b=ShdnK/vBk2vghj6dcy43ufZbyNGkwQHUPLMLMYrQ2CBNMMku4WDqlBU/OivlvljWX1
 o2BJ3jteqJUNRJm8lxU7ETA+feqksPCMdd51j4j7yG8CGq0OMhdzCj4Cn4xHTtF0i3Zq
 8Tux8vt1yvmJyoUkOAquzJnBoyAXh4Xkp18Resyq9PA7MlmTjSTHKZ6gIuzYsgB88H+Z
 J5HqnRs6TnIekny+VHH9WeqNm8ZFN6dISLYMFwzuydUFae8xN8kMxMpiv3NxuMB7FCLI
 fq0Lw5t5cXy+MiIIcHgQzgH1JZtyy+4dGBa0RDIMg1fWtioVXceh02IJaII9+nUUYHdE
 zsXA==
X-Gm-Message-State: AOJu0Ywt+2Tu/Vh2ylBLK0uz9YUZXjxTFk3a/YgbpHfUK6U7sFQcgg63
 IBUPLrw/Qq7uFgB4ea6fCJuv5g==
X-Google-Smtp-Source: AGHT+IHtstSGrCASuEyhbAzUFkHex296TETFK9xFy7uimzuBnpJ+27CsVn7a16vwqiJacwvtpQrDaw==
X-Received: by 2002:a54:4098:0:b0:3a7:7bd3:7a7d with SMTP id
 i24-20020a544098000000b003a77bd37a7dmr1133716oii.23.1692316749254; 
 Thu, 17 Aug 2023 16:59:09 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 n7-20020a6543c7000000b005658d3a46d7sm195752pgp.84.2023.08.17.16.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:49 -0700
Message-Id: <20230817235859.49846-12-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3177; i=keescook@chromium.org; 
 h=from:subject;
 bh=4L1vW+SexsLQ4jAjdxhKOyEQSjWuUKIs12iHtuVmifc=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRAY4GtRmAVHf6Ya9dY+gshf8QSkUD7pnmTh
 rHHqQiA5g2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QAAKCRCJcvTf3G3A
 JkvpEACe4GyFK86EwP8rAzGWpbQmF4TLiOHpR/Sq37SBWAGhApzKHiufbeypSkbGVsc9zm8k6ox
 HqRPculRTXgBz6x5KLRagVnv6DvDL7Iz/CpcJo2cWK4ar0q8QnmYHWS6srfDmg7X2FS+zXcbV9b
 NgSTHPpW+Nm4j438UvFT7/zD5q5vDmD6KhRNDdvoJHlRVEuZHZTntNyzawnhyTbnhLQtndJ8D9B
 2XWAvz31M9/B7kXy3mdeWDAHS93cup09V731uJhDp2vl18OV2uu4ADKpwql478KUkL1/YQCXlqu
 MkwLExvrtT9pHo/FT6Kc4jg20iN0lHgOECgTK+knaJzWdKkTP30N0xQY+/BLEURfiZ3zccqfGJ3
 UQZSWxAWNhoDuwTvXMKczoJuCdQXuiM3LXEAkmQ7On812q7pqXHbwB4kiy6pWOMgbjmdeb+R//J
 xfTexss8BN1pf/RxPxWh7Chb4ZJ8NdVrkZBCHYaIRyq5auYyZthjKwR79bj1hXOk7XzTHzpxnx1
 rGYLSr63iThlFrUS+YwRldwE0xr7Kr7jgLVJkxC1tWSMA6e6tTOT1sOgg1SW0m13ukSAD3EK1FP
 faU8ba7KBOiO+J/s1i9j8OuxVMhUyNOYgZ8J667chD62Kn6PLWJan8xTbP4Dp3W/LZotOBsL30w
 oFDolQxdjzT8sBQ==
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
Subject: [Linux-stm32] [PATCH 12/21] dmaengine: stm32-dma: Annotate struct
	stm32_dma_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct stm32_dma_desc.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/stm32-dma.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 5c36811aa134..a732b3807b11 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -191,7 +191,7 @@ struct stm32_dma_desc {
 	struct virt_dma_desc vdesc;
 	bool cyclic;
 	u32 num_sgs;
-	struct stm32_dma_sg_req sg_req[];
+	struct stm32_dma_sg_req sg_req[] __counted_by(num_sgs);
 };
 
 /**
@@ -1105,6 +1105,7 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_slave_sg(
 	desc = kzalloc(struct_size(desc, sg_req, sg_len), GFP_NOWAIT);
 	if (!desc)
 		return NULL;
+	desc->num_sgs = sg_len;
 
 	/* Set peripheral flow controller */
 	if (chan->dma_sconfig.device_fc)
@@ -1141,8 +1142,6 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_slave_sg(
 			desc->sg_req[i].chan_reg.dma_sm1ar += sg_dma_len(sg);
 		desc->sg_req[i].chan_reg.dma_sndtr = nb_data_items;
 	}
-
-	desc->num_sgs = sg_len;
 	desc->cyclic = false;
 
 	return vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);
@@ -1216,6 +1215,7 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_cyclic(
 	desc = kzalloc(struct_size(desc, sg_req, num_periods), GFP_NOWAIT);
 	if (!desc)
 		return NULL;
+	desc->num_sgs = num_periods;
 
 	for (i = 0; i < num_periods; i++) {
 		desc->sg_req[i].len = period_len;
@@ -1232,8 +1232,6 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_cyclic(
 		if (!chan->trig_mdma)
 			buf_addr += period_len;
 	}
-
-	desc->num_sgs = num_periods;
 	desc->cyclic = true;
 
 	return vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);
@@ -1254,6 +1252,7 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_memcpy(
 	desc = kzalloc(struct_size(desc, sg_req, num_sgs), GFP_NOWAIT);
 	if (!desc)
 		return NULL;
+	desc->num_sgs = num_sgs;
 
 	threshold = chan->threshold;
 
@@ -1283,8 +1282,6 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_memcpy(
 		desc->sg_req[i].chan_reg.dma_sndtr = xfer_count;
 		desc->sg_req[i].len = xfer_count;
 	}
-
-	desc->num_sgs = num_sgs;
 	desc->cyclic = false;
 
 	return vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
