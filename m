Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B128978026A
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 02:08:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 668A4C6B475;
	Fri, 18 Aug 2023 00:08:39 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20139C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 00:08:38 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6889078ee66so323681b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 17:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692317316; x=1692922116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tw3mq684+whK6uKOynb1W+N9Akg0MMK/g1IkFySIc8I=;
 b=U1Ql9EGHlOBTPrW5bL2Ok4+erX+CbKhnNGfZphwdeK5/sSer+Dv9zaDdyL99t5kQSD
 oVVYPsE4KZXAOvConcm32MRJdr18Bx9PwBisXAgii1AKUSf7mEWmJ+3ZGyjcMvcSMRK+
 uuJgcdJJkESYr89h3AGNPJ1b01jI5wOOP77Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692317316; x=1692922116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tw3mq684+whK6uKOynb1W+N9Akg0MMK/g1IkFySIc8I=;
 b=DN+vVMgvlUxTsb8+24KBdgOl4gqzivNdQY+t/SPWcqzkSvqV6CNZ1xLUvKbvhhoM9M
 xaXU52Sh6p92LzU1FJe8AXc64Kajsl8pdiM9W4qoG2wH5VdBRq2UmRL+EBsvt6ysRjDK
 G0cDcipTwFoevEr2oXQ9Wg0iLpH6Mlq4bGJ6ycsrTXzjQll1UjUBmdpp7ejaXIWrg4TN
 Gz/+kLG9NFZh7kZ6hVJnmIbpNgLc52I++9uKthnwjsoqfB8sFjn0eJuuJ/wci7gPJgXv
 /W17kOcY5dC3Bz4az5AS95X7zoNoZu1VkhdCdPMgSle0M8X706jdtjIReQGC77GZd1Lk
 HUGg==
X-Gm-Message-State: AOJu0YyOqqWHXdTwn/y4p7GT8nnS9dpZSjX8tYQyMMZzcVbb5UTQJIL6
 NHMIwpul4+ENx0xX3MvfJHAJ+w==
X-Google-Smtp-Source: AGHT+IHs/L0G5amaCA6JJvfdUyFtovSh7NJ6wrF/mSJ+6v8gdiNumAUBZr2Hy1k5HkwEvQ967UeD3A==
X-Received: by 2002:a05:6a20:918e:b0:133:dc0a:37e7 with SMTP id
 v14-20020a056a20918e00b00133dc0a37e7mr1594302pzd.13.1692317316564; 
 Thu, 17 Aug 2023 17:08:36 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 a22-20020a62bd16000000b00668652b020bsm310893pff.105.2023.08.17.17.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 17:08:35 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:56 -0700
Message-Id: <20230817235859.49846-19-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509; i=keescook@chromium.org; 
 h=from:subject;
 bh=AE+OvfT0s300zRyT6pnn5fqCwqKs6HIWCRot0z9HVXA=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRB/ew2pKHEDjNWiMjUEkVHoBeF+LXb+IA+s
 sw25qoUIoeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 JqUtD/91YehcWz89AmH98AF0WrOTo+7zKXTqrpyb8J4sUjzplNMCBnoCco1YnWhZK6JWGDLN1EE
 pV+KRXiq9MncbKUBvGywN0tgGReJzs+A5h2m2GRO9nKR2ekBhcqpEQ5He2meGS3a9rvGILgHXtv
 TRYaXqPj4AWrssGgI7BtTL6qU/foPm/Qc8lR7OrARzU1ZsNTpa6T90H9kO40R+g6FkQfGYeQwVx
 iUXUXgrAuOHBYj2R6+HBLGwt9rRQkDf8uhaV5XRcCY0c0fT7TrZaVc/NYJMrK2zFDA/42t1Adh3
 VXMCVg3fxnbq3zcIZApWW4N7yXaE0IGZjHRGvE7LFr67gAnEU3VIPIiIgb1PCKLNvAXi2getgwe
 eDPKhEakbXWktO609WuTG/lkuyyawB5TzDSpQqUb7bHH0auPSjlUXfNteZmtzmsH1YTzdioqyk4
 OuW8nu7Rnyi4cxff+p3euk4CHAEz8lSgQKaXIXc1PrWyQF6+8BEYniE2/RLVCQSAX9GlPiqE23j
 N6OoJ07N3r8RehkixcRLo6N32zj+7s0dEgD/p7PcyrwkN1PyFd8nUS96suh/GD3XeIYaZlBjV6v
 I0TNfQooRO6OKoBKJkKR96wShMcB+sIyWtQ+o8PW350Bjb1yxVtRpHxGGsYiqubsKmCGtKx8KH/
 +wD9cAC0PmcL+uw==
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
Subject: [Linux-stm32] [PATCH 19/21] dmaengine: uniphier-xdmac: Annotate
	struct uniphier_xdmac_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct uniphier_xdmac_desc.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/uniphier-xdmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/uniphier-xdmac.c b/drivers/dma/uniphier-xdmac.c
index 290836b7e1be..dd51522879a7 100644
--- a/drivers/dma/uniphier-xdmac.c
+++ b/drivers/dma/uniphier-xdmac.c
@@ -80,7 +80,7 @@ struct uniphier_xdmac_desc {
 	unsigned int nr_node;
 	unsigned int cur_node;
 	enum dma_transfer_direction dir;
-	struct uniphier_xdmac_desc_node nodes[];
+	struct uniphier_xdmac_desc_node nodes[] __counted_by(nr_node);
 };
 
 struct uniphier_xdmac_chan {
@@ -295,6 +295,7 @@ uniphier_xdmac_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dst,
 	xd = kzalloc(struct_size(xd, nodes, nr), GFP_NOWAIT);
 	if (!xd)
 		return NULL;
+	xd->nr_node = nr;
 
 	for (i = 0; i < nr; i++) {
 		burst_size = min_t(size_t, len, XDMAC_MAX_WORD_SIZE);
@@ -309,7 +310,6 @@ uniphier_xdmac_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dst,
 	}
 
 	xd->dir = DMA_MEM_TO_MEM;
-	xd->nr_node = nr;
 	xd->cur_node = 0;
 
 	return vchan_tx_prep(vc, &xd->vd, flags);
@@ -351,6 +351,7 @@ uniphier_xdmac_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	xd = kzalloc(struct_size(xd, nodes, sg_len), GFP_NOWAIT);
 	if (!xd)
 		return NULL;
+	xd->nr_node = sg_len;
 
 	for_each_sg(sgl, sg, sg_len, i) {
 		xd->nodes[i].src = (direction == DMA_DEV_TO_MEM)
@@ -385,7 +386,6 @@ uniphier_xdmac_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	}
 
 	xd->dir = direction;
-	xd->nr_node = sg_len;
 	xd->cur_node = 0;
 
 	return vchan_tx_prep(vc, &xd->vd, flags);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
