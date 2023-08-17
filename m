Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE259780209
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 986F1C6C827;
	Thu, 17 Aug 2023 23:59:15 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 195A6C6C821
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:14 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1bc8045e09dso3004625ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316753; x=1692921553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mk1SCmr54SByakeWUh6yowv1wkxM4Sng/sHbcFaXDNY=;
 b=Li42VoXYxopvcAosNllETb31bGBNqG1eav+/PT2XDAsWeF5EQR1O1xIIavffuSqGx6
 NWMBk8BWHGBLra/nts8yKC0wrGWaj+ndVUkZOUp9IJz+HuHHCeUiM9weglzL3JUMtFNM
 e7LgNLfxXWTcCqxa7v3GQXhsxXl9sO2ZXMCpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316753; x=1692921553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mk1SCmr54SByakeWUh6yowv1wkxM4Sng/sHbcFaXDNY=;
 b=VG0pJVEhgaRk5l0XGCkmPk+fKOwQv/M4196KkD40JR29hCFmcm8FY0nYs3OprN9lGe
 DHuzjPBSiY5o2FCa13IePeitF+0Q+anGL3CBQhlLOgQwC8EtvjC6HaYqRuSTepf25DKH
 CMDK7DYK2wunHzbshiAjz8td5FhAfUtcVshnoYEOUU2V7F2TijdcV5g7URldPRO+FUtZ
 3Bj+WXXaKyL+lDOz07zPfoTZ3D7sGl7PitSfsJFdza7avz5Dnd09qGwCIGvXLFj84m6c
 I4KrQC2h5rglF0eS/wHbaCaFF3nyQoycJ+loWZ55Z67i3OBUu73Zpe5O1bJCkJKuG2v9
 8UOQ==
X-Gm-Message-State: AOJu0Yx1lT5IjltQWP/CB/MwKIj9/VRLVFLzJd7gkJANq0gv0QMi07WA
 FMCBPEKc3h7wqS6vF/X7EOcORA==
X-Google-Smtp-Source: AGHT+IHuGCe3rbXfUgNLJKkSPXe8KKaQtbAMaaVfphgPjZsWlcb4US0F/FZRapuXz2PkIwNaTWVG8A==
X-Received: by 2002:a17:902:8503:b0:1bb:1523:b311 with SMTP id
 bj3-20020a170902850300b001bb1523b311mr808869plb.41.1692316752793; 
 Thu, 17 Aug 2023 16:59:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 d12-20020a170902cecc00b001b7f40a8959sm343232plg.76.2023.08.17.16.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:08 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:51 -0700
Message-Id: <20230817235859.49846-14-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2025; i=keescook@chromium.org; 
 h=from:subject;
 bh=pKTclpaZruv+pWk34ERm2W6zAMi5KXhuaV3hDpciGTg=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRB0Kp6SezIcvelRc5vIjA6L87F3Jxd807ZE
 TawptODXHaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 JkowD/0bdDsHfBNlgVJ6IMXnkrBtd8nyV9tr34/9GAsGIx6iKvbcxPRfiAZB5usq35bGE6r9shD
 jsCa/mEq3Ml6mYiEWgLVgUaeVpGJk26dgwgXaWB0tgAj950FICdaGqIKKZfqwZGQXKuULpY4fof
 zFKMLeD63ek6gqBDfGWGy+4SWdU4R0Dn4JrysDFrucIju/vvHhFNhLbUR4oNUC9QXZaFrrG4xW9
 Sn6OJTAFSqdYijRTfeMWXlACRcDVj/co8MnpctKLLcy6UlFT3x4GRQ2pS3jeOTS7T0BCvUnDNc1
 L5ImfV0Z4r+BCfs6ZArg/5dtLt49JhzrT9YDVLnjZOSj21QxOMe6RY07KOnX2TQfalz/Y0MHVP7
 9H5IXWPUdz45Df8wVJzaiYN860p90QvySYHNUARWv0yJ+kxOMjZccNG2dlSvXtJqHshg6NmusH+
 Leote/t+f+LKtsRIXglKvDe9uZVG5tWlf8eJdxeOnS6x0LcYGSBUdNLH5nJdKcHBMADld97pyBU
 P1NLDFAuLqbJ+caaX0mVhjDLuic01Wl3YdnvLkF/D/tfsgNKsnb8NQuvzAsGtpmyq8jKWq7DyQ+
 6LXmQjlUQfooWKoKlL2KIyjRUmQxUq9xg9MmVYdTiK19xN3TKrTx8prWlmvSZ8bZVKZYIHGqhns
 kEJejcVzr2sYgJQ==
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
Subject: [Linux-stm32] [PATCH 14/21] dmaengine: stm32-mdma: Annotate struct
	stm32_mdma_device with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct stm32_mdma_device.
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
 drivers/dma/stm32-mdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 926d6ecf1274..0c7d2295856e 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -256,7 +256,7 @@ struct stm32_mdma_device {
 	u32 nr_ahb_addr_masks;
 	u32 chan_reserved;
 	struct stm32_mdma_chan chan[STM32_MDMA_MAX_CHANNELS];
-	u32 ahb_addr_masks[];
+	u32 ahb_addr_masks[] __counted_by(nr_ahb_addr_masks);
 };
 
 static struct stm32_mdma_device *stm32_mdma_get_dev(
@@ -1611,13 +1611,13 @@ static int stm32_mdma_probe(struct platform_device *pdev)
 			      GFP_KERNEL);
 	if (!dmadev)
 		return -ENOMEM;
+	dmadev->nr_ahb_addr_masks = count;
 
 	dmadev->nr_channels = nr_channels;
 	dmadev->nr_requests = nr_requests;
 	device_property_read_u32_array(&pdev->dev, "st,ahb-addr-masks",
 				       dmadev->ahb_addr_masks,
 				       count);
-	dmadev->nr_ahb_addr_masks = count;
 
 	dmadev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dmadev->base))
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
