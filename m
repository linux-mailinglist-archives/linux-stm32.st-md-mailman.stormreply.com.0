Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BE3780202
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D53D3C6C82B;
	Thu, 17 Aug 2023 23:59:09 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 740CDC6C824
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:07 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-5654051b27fso328826a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316746; x=1692921546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b5fo4SAlFZblqGlj3AOCCnMbC1x74PqOTDSdnlOgmQc=;
 b=Bm5yXs/7C7SrMAj5NYLLnKAg8in4eJxveBbF4DO2ZjTd3wvxKBVyaWbMsbIdgjBk1G
 Hi55+qF7vYuSjUdxaCq3KNt8Tr5loAJ4JV9fNliA5JjgX4O8ToCJfH5hMhlyoJP+XXFu
 Vjs5RDTopNiXlWJl6j/wjh/5LopbcqoukMzus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316746; x=1692921546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b5fo4SAlFZblqGlj3AOCCnMbC1x74PqOTDSdnlOgmQc=;
 b=KT3l7YbVKtwa1c2eYrIJyS48MJg3JiUcMLKltOIkuyAolth+GmJbtwg7bDX3ZYy+kn
 834MTx5G7hxYhwwBt79SeqJK3eTRR7NNhoGMVXjjt3iYJVDhiSRL8av4KQMvI3kAzXfC
 w0GHLOQ2I0gbNfKcRiQLJTEFKms8h7d2Nft9c/mi6Va2oLC/laW6KJEhuTcmYk5nHXpE
 hDSuHviGc5Nx+GOsGcFlvCDzNRGZGeYCOEff0zJUQlyJdbzHN8GefBMOME5cK6tW1OOG
 7gVWJ1y+9IJK5E6EMfvs+bm2Drm6l2P2JsipqLGVtoDe4tT8JzW1KESZDZ7Ck5zQyY9+
 zocQ==
X-Gm-Message-State: AOJu0YzIyQP7AiB9BnWo6EGVpzjtw8xhnP/1f7reKAnZku0EQM4nb7Df
 CMLWqbpce7y+/NcSemisirPaVA==
X-Google-Smtp-Source: AGHT+IEdMYKnrjBUAvE0ru71ZoYllBiARB+b9n/0lQdAuapi28gfRsr/R7sjhWjkmiBp/Woqb8QO3A==
X-Received: by 2002:a05:6a21:78a5:b0:131:a21:9f96 with SMTP id
 bf37-20020a056a2178a500b001310a219f96mr1649983pzc.6.1692316746157; 
 Thu, 17 Aug 2023 16:59:06 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 u16-20020a62ed10000000b00682669dc19bsm296091pfh.201.2023.08.17.16.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:42 -0700
Message-Id: <20230817235859.49846-5-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221; i=keescook@chromium.org;
 h=from:subject; bh=wAhaXdpkO4UhROqbBEzwnUztv43Z9vPtGenl3m44PI8=;
 b=owEBbAKT/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRAdafn2BXNub2CVczBzS1nMrcCu/W1l7fmc
 oQMCeB3hAmJAjIEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QAAKCRCJcvTf3G3A
 JiDKD/jzQjtA/rejP0UfKxnwSb1Bs9ETBWk/rP2eCU65spDyZslCdJJKzJuu7MicgCSEPDfNPg6
 xaxgsDv0fnzJthUj1b7GYgIJW4Ev/EFiMgpDPhlkjPeabqKRWZZxyEgFvhJU73k5H4w9d+hkXBe
 +dTfjZFVsH0hEK2sD9pdYpWoDrGsGfvB969UPwgcSelEYZSrHRb0kyaQWL5oOnurAP5e3KthrFp
 ll8wy38odnrUKDahwF8NPUamJcVbFBudhg16PZL3IhE3NtZV9tjMQtrMiwy7G2uhHqhd1w6bQXk
 lXZWrzzAqgpnUayVPMrVptkfVuD0dViVQEwjPjma3woC/B8FZa7ymi5O/geVC/ugDZlVZcu/4XR
 WddDqRioBq6b2M2HnQDKsyArKe8jj6Lq/WFaQM+xHiUptWNl3rqG2dRzd+ksTdn+fmfPnzhhxr9
 cLZFoy8XzDMZ4yU0IBzoZBY0pSrIKPxJjMwsjtTkwmM+fflGR86LOt+ClFW7/FgWk9ZARIt88bj
 hZgS8SwCeRYEviYdtimOfiDhjAZXaDRYEMzpVonw/x42ays3FO9x405hS5QD/Lfd9z4TB9WJPg/
 JBOX/lvE+vJHEnJJFJbpLdY+bOR+uhcTApAmU/ggJr4cRtC8l64Hw5lDostncXilc6oEPpzpmNL
 OQDT2dm/jOCGN
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
Subject: [Linux-stm32] [PATCH 05/21] dmaengine: hisilicon: Annotate struct
	hisi_dma_dev with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct hisi_dma_dev.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Zhou Wang <wangzhou1@hisilicon.com>
Cc: Jie Hai <haijie1@huawei.com>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/hisi_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/hisi_dma.c b/drivers/dma/hisi_dma.c
index c1350a36fddd..4c47bff81064 100644
--- a/drivers/dma/hisi_dma.c
+++ b/drivers/dma/hisi_dma.c
@@ -163,7 +163,7 @@ struct hisi_dma_dev {
 	u32 chan_depth;
 	enum hisi_dma_reg_layout reg_layout;
 	void __iomem *queue_base; /* queue region start of register */
-	struct hisi_dma_chan chan[];
+	struct hisi_dma_chan chan[] __counted_by(chan_num);
 };
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
