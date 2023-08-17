Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F3D78026C
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 02:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88C20C6B479;
	Fri, 18 Aug 2023 00:08:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9737EC6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 00:08:39 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1bdc8081147so10706125ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 17:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692317318; x=1692922118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuyJceB72D5Lca1vu7MTV9NQLwwD7ixf1vMFNhBLP24=;
 b=NllG7Zm2docwbcVuC5ST/P0ww7TH//CpiSUDVU53JaO1gWQ9NEgA8pgYr9WIXC5Mwf
 svjywlbmGcJbCtGAx8MRDOkflRFXL7LrQVEneAB0xv0JSNV0TvcnUHpNF/OaWvLr0a1z
 HMlc1kKpaNKd1DCXZGn1a/kH15DYwDc9HTyuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692317318; x=1692922118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WuyJceB72D5Lca1vu7MTV9NQLwwD7ixf1vMFNhBLP24=;
 b=Nuk/R1HqWTjH3hbayDabiibIrApmYyssWcNE5XadiWOrpeIyCSoLN/KDvwdtkPn55F
 WIZ7kjTWUQNADSet2hJZrEcMwv7EY7BiOQMR4LxyND7M3CrMS5XCWTzL1kp97GZzzlpb
 3nXRQ6PZOYUc6UppsZKW6g/a11lDivXS99v8qt51YeKhFAHGQCPuS6EK441h6c2CDKrZ
 2f+omRjY/h5vZWGxDJl+IeJRSs+ROe6+Q/+/FMlIIzfCmk2Sj1KL5bfRAazRsPeqRQ6c
 ltlurvYDV4gHmGUIa17bOz57U7XkWlMR0JaQvpFRAcqUV0yyWnjSfYikojuRYGh5kN6T
 eP1A==
X-Gm-Message-State: AOJu0YxAEdhHrqNnC7nFPKFuLwStnVvZDBUkTDiHkD1hYd2NgQwcTuUk
 sgKaRaRtP79lpW7Zh9r+xHgxzQ==
X-Google-Smtp-Source: AGHT+IFrKbs5SvBObgUstemZiNhKYI6u3Ud7yM88uribSkyKXcJawqqpIR7AWnTVzz57LyyTIZj/pw==
X-Received: by 2002:a17:902:ec90:b0:1b8:6245:1235 with SMTP id
 x16-20020a170902ec9000b001b862451235mr5275690plg.13.1692317318091; 
 Thu, 17 Aug 2023 17:08:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 y16-20020a170902b49000b001a5260a6e6csm338817plr.206.2023.08.17.17.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 17:08:35 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:54 -0700
Message-Id: <20230817235859.49846-17-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089; i=keescook@chromium.org; 
 h=from:subject;
 bh=2Nk1bqy6qcs+Z8s3SKRWE/rRh22inu1euNPXBXoqeWg=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRB4f1Ho4STxM3jK1PkfWbL2FFMg8yDuRmKL
 toFxjB+pOuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 JtE+D/90ilHYwzp4mxGplGcw/99eQt0gOheBCrW8QL9ZFeinoj7YdgAt0123/fC5w91CL6gfiNO
 OT8LNUYgTMDSV+8ovuppBJN8f8YbEhY8hOs40LjJTNDd0qiD875/I4FUoRRplA9Uk39Si5sJix2
 HDn7yOOtYuS2V9vf4dS5YvKOayC5WFvupZnOYnDT30VcnqaDIOYioi5qjTyni6f7ON/mvBvfMVi
 Jxr0xI9QYwe40pwKS3YRrvnO0AQGBexDZlavdQ/vJQB8SVEz6RsdmvlH2H9soIKBA8lKwQfP6Jt
 nP++2RlReQ2B1WxrFsFXQHCAYv5LTBr5gSFCpCejATw0gJgkE9CSPH+t+LOZ5fVFiaAHmxWt1sA
 7KZUQzHl2D2Vz3JSLID341af/ApuW+H0WLV2pLWnJay3vDBy0fSiG1SjxFEVV4pyRaw6DNjsHF2
 Mv9c3B3FYbxZCLar5mlAHuihh7Wzj0ZjPV7NNLdxvlEsOTzEskM6GTH6TjWhiHY+cYEuXkg4vyL
 LtxRjAGs3xc2DL+Yq4iRs5oqvcw3Z9e/tUm1bsn1cUoK1kjSIbt9v+j44UPzNhXE72iFbsnscBi
 Q5mPy+nTPeQqgxp8gNC1rUmMAgWdSpgiklVGizlJAQPPG79c1X0gs1HfZ76kWB3uM5aVIt3WiVL
 vp4tcTRrfiG5Wfg==
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
Subject: [Linux-stm32] [PATCH 17/21] dmaengine: ti: edma: Annotate struct
	edma_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct edma_desc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/ti/edma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index aa8e2e8ac260..9c2b2c4c3882 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -202,7 +202,7 @@ struct edma_desc {
 	u32				residue;
 	u32				residue_stat;
 
-	struct edma_pset		pset[];
+	struct edma_pset		pset[] __counted_by(pset_nr);
 };
 
 struct edma_cc;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
