Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF078020A
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAF97C6C82E;
	Thu, 17 Aug 2023 23:59:15 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7BB4C6C821
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:14 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6889656eb58so313554b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316753; x=1692921553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXeYLQ2GewHlFPJZC58ZRexUVly60i4L9KNCW0nx6Zk=;
 b=E4MvOk7kozY7pHeqkqrSE6Fx+b5wPjyeaDrCH6cnZYBce235iu8L1ggSupORngM/8A
 l9Kk472IVYyHtUHSiQfr/qQxVCPz6cZa2dg6Po2U7LJdTM0a9vhPIc9OjPFnWaVjufYH
 eZ+T3G7d6GgLHEUVUwZwmsqNG0lsBG9OxXjaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316753; x=1692921553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gXeYLQ2GewHlFPJZC58ZRexUVly60i4L9KNCW0nx6Zk=;
 b=FwvrNo9wrs94g3+RwcnVDJ+ehIvSNqTm5Z4HDtEFKhlEKl2C+h67yCsnHDWjwozUWx
 1mj1yAichg17GDvpbiiEgukBUkcys63j+FYmCM198Mqc97QO4EtbKiVOA0r147PHaGQL
 EBu6/BtCTbbjOgaMbbECH59nA9Lw2DgUbYDgozeboQnSRJVg3gmSbnULME1+iRJBHRIo
 PHfLfDtt6WFBiwsfqBiAj48/I1YFAzcsmk9m4IJEfgQVXFsD/zPw8JMGEK286EgQMEAM
 /6diaF7BBHzPjkYC8l46r0gaJOE4hfocdYmlry29UlC2eMFN46xYnfhzpDu2DG2bxorJ
 IBcg==
X-Gm-Message-State: AOJu0YxmqivmCISFg2588pF5YoyRqpOx64Hv9Kryiv97C3VWLYznSbTV
 GFtaILuFRacDgbJClKJkC0ig7g==
X-Google-Smtp-Source: AGHT+IH7ceqgTswqXpviM1ijV38NbJuVRRwA3pV9NT6hwNEYJSniFiTqu2wXcbZdz+XyqunOp8AoPg==
X-Received: by 2002:a05:6a00:22d4:b0:687:60bf:aed9 with SMTP id
 f20-20020a056a0022d400b0068760bfaed9mr1146482pfj.24.1692316753316; 
 Thu, 17 Aug 2023 16:59:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 p18-20020aa78612000000b00682b299b6besm313473pfn.70.2023.08.17.16.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:09 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:53 -0700
Message-Id: <20230817235859.49846-16-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=keescook@chromium.org; 
 h=from:subject;
 bh=7gJaGyTVYHakfTQ8Pwi03jgdcg+IqGAMLg/jFJNW6ns=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRBFwQjEveal+Z/8kFZsr8NHcKbhAWN9xXW2
 2bm6PiyF6eJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 JhWBEAChmToUXNsq2WvY5LWUYGOYXucQ4BBFAeyV8EU/Ph5YetkT1Ejxps0eeDDEL+L9UUpivSe
 +C9l1acyX7jUmoO7g3LI7ofXC9DYH/FlJ+tFAV7eWeP7LLjdgrBYyHMmSddzaCznsZ9os4v1ub7
 Rdl+oRzDK//T++/1p19ABdLdwYob+S6o0ePH/GR338wixR2TmmypIBYnp6yrrw4YlLjUE/NlJ2b
 Yu7U19kEiykr6dGefEteYvSZk1Hp62ql7B+hmLY3EeychRlJcdqcOrMofQLZ1VIESaMlC5XU0X1
 hEYiKuEB22Uj0FPrF8P8q3U2w5qzFfQ4MPVi2rL6KIOiZUN8KJyoJGJlT4eyDcWMSmy5M7Ya1NE
 tXCXuIFbd3kJu/chRYDvGHx1SOCiLUMveo8wvJDL3FzaSOmFqMMx5CyDWMHhMVPGsod/y5u0csZ
 ehv9PysR1Vi53+riCsyVXtqI/GGdCI8SHEeRUiHyxGQ6h3aZsOGerZtfL93rwVJLxHApgWWC4Mb
 8TiDejq/mug5sOGQ+2vL1ae8SqkF+00KLgem2JFhPfET/9dbSOlo81vYhJnS94VtB5wYwz4cMNA
 Hd4PZfscGp4gmCe3nDVghWnCrDMnx+SIX37w7Hj63aAOU3ZzYj4Gh7cfWGp40ESzjtcx4c4tRKH
 Fw8k579f9tNlntw==
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
Subject: [Linux-stm32] [PATCH 16/21] dmaengine: tegra210-adma: Annotate
	struct tegra_adma with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct tegra_adma.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/tegra210-adma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index e557bada1510..cea33912a4c9 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -162,7 +162,7 @@ struct tegra_adma {
 	const struct tegra_adma_chip_data *cdata;
 
 	/* Last member of the structure */
-	struct tegra_adma_chan		channels[];
+	struct tegra_adma_chan		channels[] __counted_by(nr_channels);
 };
 
 static inline void tdma_write(struct tegra_adma *tdma, u32 reg, u32 val)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
