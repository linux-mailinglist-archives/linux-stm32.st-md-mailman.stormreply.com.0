Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0B78020B
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC8EAC6C824;
	Thu, 17 Aug 2023 23:59:16 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7225C6C82F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:15 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-5654051b27fso328911a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316754; x=1692921554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CM3L26PWMAExR3lQXTcXbU6tlb1FTfdlreosiNsvPEE=;
 b=HTrrZZ+wk74qL34Op1mlB1taurJkAnd7YsB6DcuhqPFWoY5BxKedYKyw/BVOzmxMFL
 g30Pe4HkwYC69jPPfY81Upl2joAkDOLn7binq7aylyfOpUoPLa28nnHt6eNCAsaiaXSS
 hUbFj7PjofegYErrFt2HTzB8fTUTdKU6OagXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316754; x=1692921554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CM3L26PWMAExR3lQXTcXbU6tlb1FTfdlreosiNsvPEE=;
 b=DtDDimtFua6cPiHtI/ZUx52aBQ7HUNyybR7+s00Z0/zIl2vqHMTeq4FBhKT8ZVJVii
 7MAW3ZmvkDuOLGxwTNNqFJ+T1pdYFJYD76SSuflQJHAkP5ITsd8lrA4BZZu7pDhI/IFY
 oEpAQx7XgJrv9HCxZNi0udQd66v+6gZkQCAnJyKkmD9WbETXWoEX6WmU2wAGFD9Kkij8
 PD+x7oqlwTo+Mpg4PymBFPTSnUqSd+i0T5cBT1BIrzpHgmPMC8JqE3InAQuKl+i/0Wj3
 5DiWuI/xsYVNM3TyY9s3HRT0M5vTLKViYbm+AhS3fNrOlnYoAt788SluRurbvxdrSvaY
 L2tQ==
X-Gm-Message-State: AOJu0YzFfmCl4L1Y4CQTH58SVC6YYoPYXgoRaNJgY1ZPryXj6yxZY1iO
 V6qfSFjlmVTPUCbgqT1bvTSSfQ==
X-Google-Smtp-Source: AGHT+IGtcgNnZbWaCWdSXzGTxx8lAj3NvRd0lG+maqih7++bsMmfpiz36E56uky5QKHaPXs/1RnBBg==
X-Received: by 2002:a05:6a20:3250:b0:122:c6c4:36b1 with SMTP id
 hm16-20020a056a20325000b00122c6c436b1mr1292709pzc.4.1692316754444; 
 Thu, 17 Aug 2023 16:59:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 a22-20020a62e216000000b006875df4773fsm307299pfi.163.2023.08.17.16.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:52 -0700
Message-Id: <20230817235859.49846-15-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306; i=keescook@chromium.org; 
 h=from:subject;
 bh=IvCoDTUmPGIj+7qEwbz1ZUwbMaX1EfMB2pX6XS9uHHE=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRBfmj3qZYeUoE3VYSBxcgFtgqsG+6voaDsG
 dN7+tvlUR2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 Jg8fEACt1MzmrcCipsy/0n1aAT9hBbqUq5idN/BI2c3yHNHVpnIRI5GN1j7hOdImkZfcRTcOTFJ
 VUxhWitSM/ypDtTnX8pInDcpcIu9N4U+Uv2olN0raAq3sK4EZcADL/p0aPckt7B1JZjlIPD9F1Z
 OG+WAsV238be/ceJ4BkyWHI9QjMdcsxyLXZvv8kYFGxNbR+Q2BH33KwV39nvO/xtBtaxxMFkmMJ
 3n8JUfQRVVjQmXT3b8UWREZN2S9RD7HaXr3QOVGM4KYaWc5vOPA410mtWrNpBmBUWLkcFraCJql
 BLUul3gf5WgSXSKOSBrzDFIkO9KIYxiRJ4HNItT5cRlbzW/IzY+cWiUwd0d0Z1HuLq2ualRyuM4
 sJgnDenKCrbgN6BrNEzBLFutAuzp0x9KxrorooWOaCnulXSBpCQDM/L2DCoK6EsmSBAF7qEDp27
 MOaEZlijjaJ4OMM0jgxuVCco5wpR9YTOPyPeESqX7QZUoCyGDBPVqPMg5SyBDL+5rStUEsW4riP
 jGHKZiuI0eaNMNa5VdHILPKgR/qXNZM6uNcfF9qgsUicTfY1ov8F+2CVIYB8e1Ka/Di+zeUra6o
 gyFd6zhW5eFnGFR90vPU3Gq/JAQmPESBS4YarQhrVCMJGZkllIB/I5nzaP9nIPCfsM9hTkcg81S
 asDsoiP0g9COZRQ==
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
Subject: [Linux-stm32] [PATCH 15/21] dmaengine: tegra: Annotate struct
	tegra_dma_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct tegra_dma_desc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/tegra186-gpc-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index 33b101001100..5e3d5f5d1e20 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -221,7 +221,7 @@ struct tegra_dma_desc {
 	unsigned int sg_count;
 	struct virt_dma_desc vd;
 	struct tegra_dma_channel *tdc;
-	struct tegra_dma_sg_req sg_req[];
+	struct tegra_dma_sg_req sg_req[] __counted_by(sg_count);
 };
 
 /*
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
