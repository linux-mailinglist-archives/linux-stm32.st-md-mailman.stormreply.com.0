Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E9978026B
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 02:08:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 781F2C6B478;
	Fri, 18 Aug 2023 00:08:39 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 347FBC6B472
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 00:08:38 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-6b9a2416b1cso366143a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 17:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692317317; x=1692922117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BJAStmqEWJCV11M3alF7g0EvIWbhKJ8cHn0i1bzIQ+w=;
 b=G9dQNpeCDU6vSJDa21UY/Mw8p61U6Pa3T/VNTD0N6eKEN/xkSyFSPxwZJMlrumbxF2
 yxFdU1Mqtc9PVDPeUdJTTI/byEwzyL9clggs4DITweNemWAvyD4OqipRB0RiiEHV+Yrn
 46u3CyfTS3MTL8L9LrHEhkvbP1CddmUGW3Su4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692317317; x=1692922117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BJAStmqEWJCV11M3alF7g0EvIWbhKJ8cHn0i1bzIQ+w=;
 b=DM8OmvRj5t01uuo6lP0qR/wCeJrt5eUVtdqGiNdXQpIg/EtH7iuDBZcAlm7RI99S2b
 7yZjyIWp1vUaqXwFZBIbE4oYpTk6HJYap12bhfy2pks0MULlk9X3vUVgl2MVNUD8o6qp
 bt6xKUVAt0u33hn0DBptmyiRYZHTJR8uK0Ukp2WXecJmNgVHxv3+WISGV9cleLk1NhfI
 dVliM04QrggN+Nn7Wq3Kthyh0KT8jJenB9Tj5jrwQGFw+IbM93qxH0mQfjkkPIQIcp2M
 AG3JqK7wE5eU2vcmY1mRG7MTkzxODPfM6cEcN1u7r+w+yGHy2xYPZ2Ww1vIoMUPYDO5u
 zywQ==
X-Gm-Message-State: AOJu0YzQQHF0rzMFJDDCkgkTv3xAbSt0OqdWiTRGyniVenlUo2OOqaTE
 01pFo2v3rtadLn4gYOegw+QydQ==
X-Google-Smtp-Source: AGHT+IFkVSQqkmXL975Xr4Tk7VbbfLZbWMUu/vztJf9RRnyAzWDuQtXtUyT8v9C9jYYePa2KPNQ1rw==
X-Received: by 2002:a05:6870:9127:b0:1bc:d479:ed70 with SMTP id
 o39-20020a056870912700b001bcd479ed70mr1130390oae.25.1692317317112; 
 Thu, 17 Aug 2023 17:08:37 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 n10-20020a17090a670a00b0025c1cfdb93esm349211pjj.13.2023.08.17.17.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 17:08:35 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:55 -0700
Message-Id: <20230817235859.49846-18-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1732; i=keescook@chromium.org; 
 h=from:subject;
 bh=KkqTKiy8rqvFYl8aW58GCbimShLAkaRsCHzcvcCWSRw=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRBNQrQGSxUXSXTSL+LF23xeHTG1HiHDx+NZ
 DxNL9D2ClaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 JstED/45VAohOEERN7C2lIV4zZVuC4OumCYP+mNrRtNtNzgTirqKjGCFbY5TkcbFBX9k7DrLDgS
 O13YhKpbYpdvbWnGSeyb3uF+VGAi5gnoUyIqwH/qwyDHFXcWuO48mXo+cu/8YLZeJxa5E+W/SNR
 Dg83cQ0lXZmMqd8yYOc4SRNUpXBQGklpsswWwAaTe5TXdvq0b4jFPboIw88TEncJSXUKgmOajZC
 Bw259+NR+DyoqUms3n4xhOKHZYZcE/pVrnWV0dydmbg9C0arCn5GLThkZD05+PV5iKgN1AJmxTc
 hCzGYVh8UU74S3XB0OAIRRum0P/QVS65aFVd5ncstN3ivfSpgvS3F5wZh3bfEBY7rlt+meDWGNO
 kHm+TZ6D/Tru1vy3ISGD5DeUovqDen5gLBUN20wYUyEKCSWKzd5LzRAu1W3uoHXFz6HpdEaa3jn
 LIxAZTHuCeJ+sKoxAbf5nBMCfqUXZ/KB7jP7yzf/c2SB3hVND2jeQLo3WiaoMLsvBRHb2/D36dp
 h3JI9oFzJ0Oqo+tpdhBFiAGpUPqnLYk7MVqaIGrgT8DlN7QB/i/hzHQFmk85WOkneZu/WYLZL3w
 iLBlUGubkbGblD5s2sp0LMWS0T/r9yUD8u8ndim38nSwUlyLw9CObnOXtj+udrDiMzpNOcZW/OL
 v3VOa7tcLzm25MQ==
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
Subject: [Linux-stm32] [PATCH 18/21] dmaengine: ti: omap-dma: Annotate
	struct omap_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct omap_desc.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/ti/omap-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
index cf96cf915c0c..11ac3fc0a52a 100644
--- a/drivers/dma/ti/omap-dma.c
+++ b/drivers/dma/ti/omap-dma.c
@@ -124,7 +124,7 @@ struct omap_desc {
 	uint32_t csdp;		/* CSDP value */
 
 	unsigned sglen;
-	struct omap_sg sg[];
+	struct omap_sg sg[] __counted_by(sglen);
 };
 
 enum {
@@ -1005,6 +1005,7 @@ static struct dma_async_tx_descriptor *omap_dma_prep_slave_sg(
 	d = kzalloc(struct_size(d, sg, sglen), GFP_ATOMIC);
 	if (!d)
 		return NULL;
+	d->sglen = sglen;
 
 	d->dir = dir;
 	d->dev_addr = dev_addr;
@@ -1120,8 +1121,6 @@ static struct dma_async_tx_descriptor *omap_dma_prep_slave_sg(
 		}
 	}
 
-	d->sglen = sglen;
-
 	/* Release the dma_pool entries if one allocation failed */
 	if (ll_failed) {
 		for (i = 0; i < d->sglen; i++) {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
