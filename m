Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D801780204
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B63FC6C831;
	Thu, 17 Aug 2023 23:59:10 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70BF9C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:09 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-686be3cbea0so1070487b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316748; x=1692921548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0kK2+3d+yiGwIKod7tAy7TFaHWZ7E5+177fueAct/8=;
 b=hsCjUwllgjqgnFtDBr302edLntwmqFMb2tjxSM0F2KLywUR1T2qWiokFqCgsixWScn
 vr+ifD5w6Aj4JONDrH0M5DZoCakUeGfmHHiWsWaup/P9GeC1F9prcku9j8zWYsPcEqe0
 0BL4rkzR3ZXfDE82c9HgH/7iPg1ZBtp/rPUaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316748; x=1692921548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V0kK2+3d+yiGwIKod7tAy7TFaHWZ7E5+177fueAct/8=;
 b=RIf02eK3tmesF3w6AgG3Q8agBuWQ8Ubn6lIXpiuIg0WgeRizz4T2urZUdu0SC/shSa
 fu+UeZSrLMiM4HP6EKAmQ3ZJmz1QqBNBcguv+RxBAD1Q0TI8Ega1/r+PuQ7uiNaW0VZj
 1hOz4pdLCbBKf6DDS3njeA8GIBcz39gh6S+j7hmA3UgxtkMy/uFrSIPzxK0RqEgurNDR
 xUgJw8y1+nNHrzxz7Qo0OPxRs3sw9h9n4tGylHhZRbvvBrPS6InR5Ij1G5xL9gNBIm4Y
 h9J+j1QH7OI6ZyeFg/jSX8gx+6Q3n5Uyv/QgfKi9FG6gcHAc2Fr0cIt6YC8SYQrdAZfP
 ot1A==
X-Gm-Message-State: AOJu0YyU6itWf13BH9HiyY+E4CV3VUD1NPObdgpoOSWM8yL4Eej6S1YW
 J9h7Sprrmqo5VFkDbgHhVF6H8Q==
X-Google-Smtp-Source: AGHT+IH/IPZEu2hD4vXoHg+QeGyl/JNpbC5Ce8fholtE5OspKAUfjQ5VF5f7w3cDph9sQgTbEz2k+w==
X-Received: by 2002:a05:6a00:138c:b0:688:79c6:1c13 with SMTP id
 t12-20020a056a00138c00b0068879c61c13mr1187966pfg.9.1692316747963; 
 Thu, 17 Aug 2023 16:59:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 b1-20020aa78701000000b0068895d26b79sm330575pfo.10.2023.08.17.16.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:44 -0700
Message-Id: <20230817235859.49846-7-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=keescook@chromium.org; 
 h=from:subject;
 bh=EQ7cpalnAKUyzLqTacn9WNqARa63ulJkEyu4D2Ryyyc=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRAitRrc5HSuDDp9nSRHlzoamdndhZaOduWN
 UM/7/lcEfqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QAAKCRCJcvTf3G3A
 JqFGEACsptEBgA3lauCtB5TOKqtQKh3P+mbX/mtGO8a9W0CiYk5jSkW8FeW+uEEu9jqPlOe2zp6
 VSn60+wScZZEY+K3j1v/qMyWWXD45XjY50dVtFHtTJRPTWyVPBQ26JpXBlcUIxJWVXE+qEqu8xs
 nM9fAd0Q4raL9j6gTyl4Q/H57pFGmekGp6X011FxYjG06ztC8X1kYIpW+n5spozri+LKhexD5l+
 7n6syLTt5CG3eI4MTbgFf8b9KsEIvIWoY1Xf5nTs2KenjD0o0oNK4KkAX788uTSFtpS3uXYjuXU
 cUTm2k9PIAJsA1uPnVdTPyJwq3oFeBvteGhQS+eNCYOjz7Q8uncrDTyrjgfhAx5cgVXDD9iXEPW
 14ufmJkFuOH7MBsTRhtKaPqnoDu8zW+Cxh7oaKTqN3nGiXHq9Dx0kckpHyQNC+Tr/NsEfp+KGA7
 iZgUEQZJRnMlRXZUj7gHdrvhU2nXB4JCmDY2wDoJBkNJzMCKFpGtaCDFxsaS9VOyd8o6SdV+ek4
 gQxjEcG6VcYNhBec8cPzkPHJRX52CUyMWCs9+V/DOtst7ojlX1ZxoNbO+fFYC9vpV3qMFhsDshK
 xwSv51OKzq3KOFZdMPD0yf7xcDItQXPgtLzfS2NeB6hSlD07ZusYdvsF/hh2k9j9TYtPAgKyHl+
 /onf0nURDF25ejQ==
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
Subject: [Linux-stm32] [PATCH 07/21] dmaengine: qcom: bam_dma: Annotate
	struct bam_async_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct bam_async_desc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/qcom/bam_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 4c3eb972039d..65b89bb7a56b 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -74,7 +74,7 @@ struct bam_async_desc {
 	struct list_head desc_node;
 	enum dma_transfer_direction dir;
 	size_t length;
-	struct bam_desc_hw desc[];
+	struct bam_desc_hw desc[] __counted_by(num_desc);
 };
 
 enum bam_reg {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
