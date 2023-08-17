Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0297801FC
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57891C6B479;
	Thu, 17 Aug 2023 23:59:04 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DF94C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:02 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1bbff6b2679so2932925ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316741; x=1692921541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A+4HJW/auB8x+AovPy4uQhBNpjkEktdOQK2m0h4AvuQ=;
 b=eiykHx+JWRc6V1EMoURv4Pruh3yvt/5U9kHVNC/yDiAxrBjjEDDp38/MD5KT5FJ4OI
 T0KZ42eQSSQOV87BRUoerWO94YBZUpTXO1SYtIJxvNnV29FDmNohyLmIdRl8qGrfR0SD
 nVUb3XzyHuEyqPA7KTctf2yPKMGT3EN1r6XWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316741; x=1692921541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A+4HJW/auB8x+AovPy4uQhBNpjkEktdOQK2m0h4AvuQ=;
 b=KLAg6BzrrCNyryA78Kxrn8Jm8RvzEZlRpRWJDejseYdcwFSx78rJh5a2XDJ+GrkE1I
 M6zV3Y/vj7LqoTkNBlzMF64oPurDGmn4I13i8yNUUAhuJTrObh79uHKstdjZmwghWzTU
 VKgG4K8jC4hL/6E35UF0W0XXq5T47bM7g8nWDSHFBs8WS3KnRCTfiwMVFCusThUqoi+1
 TzLzXLcIimrDv+huetM6/0DxYHr7bihL5hojXUUYKdfF3mo8IlsdOLcpN2Hdapx1Rczk
 M7m6OQblHylZ8Atcb7K6CXi7iD8SU8VZIyjgolfkzhrSCPv1aX+WzN4F43vq37gBDvHV
 k+CA==
X-Gm-Message-State: AOJu0YxiLGQAP5ZWDU5hD8zZMDkD2E+Mwp+A7zqNg2k4pnuNCjYcyaTL
 d2yUUw7D4yfPkT2ehlJRmGXJEw==
X-Google-Smtp-Source: AGHT+IFGebGbp3k+CsL24twD0UTAlVu1JVsiqk9PaprDkh+IXCI1B/Cjd7zbL5GtfH68tzrzNT6Sfg==
X-Received: by 2002:a17:903:22c3:b0:1b9:c207:1802 with SMTP id
 y3-20020a17090322c300b001b9c2071802mr1209204plg.0.1692316741166; 
 Thu, 17 Aug 2023 16:59:01 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 b11-20020a170902bd4b00b001b80d411e5bsm321679plx.253.2023.08.17.16.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:58:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:39 -0700
Message-Id: <20230817235859.49846-2-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276; i=keescook@chromium.org; 
 h=from:subject;
 bh=SO00/SVjajGCjMuuFq3x36eZ74YbXa362Z0gVVwiDDw=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rQ/kwZ89vekQ7nYJW/uV4J4wjHF2gtaDeshJ
 sKago9defuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60PwAKCRCJcvTf3G3A
 JupcD/9gAzNiJxWx0uRQfD8T+IaYgnkOkhA4OeFx0IvrNeaLb+tCwUyZvaX4ej/wqzimsKMVdqN
 CZ7pm1PRURyuu8lT0h7rMGwnNlSY/Fen1jGDiML3J8cWz8KNQRJ51BExzo+6AT5p0bMm+MVN/II
 HE0/LhRNnfMXBsO5G3lvR9n6ztqEMfvBemm6L6Ez3Z7GFjJOsIlsDsSkhh8X6iQ/6HIajeJHyqj
 YvBYLRhif3iT0VlhntKObmx24rvGafjzDG2R2gjbTqeo88HSSizrbRwRfHivP3nbfmfohE2L6zn
 05qPcvXimafgX5XNsUoCKx6oZ676UVrb2Sz0On9nXxipvtx+CNc4qmXay7LEg99oYchShYD5rby
 XbfSNVh1byswNNiD4YUbANAh4lqhvoGZE7sv59b7Dh1q+qz9O4CfSpKswtIL/MQI+97t+xjrFlo
 XqNhdhiedIKgCFWsEcs2qAUbEhNB3fWfmt/fbuiz2e9pKuxIDuRxWhdcw/mry12LuNrHYERNQx2
 4B7UtAX+oTPF7O+ZImJkKGxpAg9QBwY8EmtDZ3B0Cz8BOmD4nAPSjbLQOfrFeNqnrPqO+EavE+n
 CR+pldV/gAtaU9XLFVNZcbJ3gPMcPG2oyaFK7y+26z4RP63O6+Si8YIQTl7TvMnoAYkDuWawIBl
 n8BIWx5jtvwp0JQ==
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
Subject: [Linux-stm32] [PATCH 02/21] dmaengine: at_hdmac: Annotate struct
	at_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct at_desc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/at_hdmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index b2876f67471f..b66c7f416881 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -239,7 +239,7 @@ struct at_desc {
 	bool				memset_buffer;
 	dma_addr_t			memset_paddr;
 	int				*memset_vaddr;
-	struct atdma_sg			sg[];
+	struct atdma_sg			sg[] __counted_by(sglen);
 };
 
 /*--  Channels  --------------------------------------------------------*/
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
