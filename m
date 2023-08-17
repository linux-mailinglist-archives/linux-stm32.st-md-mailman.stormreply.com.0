Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A64897801FD
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6658AC6B47B;
	Thu, 17 Aug 2023 23:59:05 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 894F8C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:03 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-26b0b4a7ccbso281558a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316742; x=1692921542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IIJznhYZqet29caE60ZbA2pqDUDYoC2Ni193sUkBvY=;
 b=lfMuDWZkxFbnsbKKPqOUzD1QUbR6DkcVXQOk5J3buEXsWhNksf1iNd/44SHWaESHDl
 j+hryvuSMYcAsCnshdpn8g7l690Dju9CViGdao/7iFYQDsHrXDRk3T+86i+QcOSUH9RM
 5AHRTVcWEztYIcVzyPlCMdNzqMi555hFHkeoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316742; x=1692921542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IIJznhYZqet29caE60ZbA2pqDUDYoC2Ni193sUkBvY=;
 b=MgIvV2YIootulsxpYaoKUHhfM77cqxpZ/VJw5dAl/URjRbxIdiup96YSBNpG4qeU3b
 fHRxhZ+L6FZsW6/kKG4o8VPnQ+HnjeyDF5kdWnSZLf4sDAUhIwN+PTuGs6i0FDiVVFnz
 F62n4tDJ39NNuCe6r8xE0Me5NU4pFdMguyY/lxWfpGAsQbjRQa9/yWqUIGeBochpxsqA
 7EMxd2lrtgRxs4aluTNoSXvl6i8ZG3bFMKbfux3QYZrC013Z8icaUJ55gmM6p0PX02WG
 g7eSh+JOui4WbuOgw8Tj7l6UNrTiNXBYjrfGI9xk2vwuk/P0lNPzetHeECSlNQOmpWEa
 Tksw==
X-Gm-Message-State: AOJu0YwDdAUqaCADha2Dil4gUaWMz1G4AIel+2IHkyDKYSnc3ISTHr7/
 lMKGze8Oy+Sctjuw2HIqH9MT1w==
X-Google-Smtp-Source: AGHT+IE65dJQjfZK41wRT3vTQIMQrQ1msHGo0xfJJM2cHVIfGc5VRcslgbukfOm/ii0qD36iiH5rJg==
X-Received: by 2002:a17:90a:ff05:b0:26d:ae3:f6a7 with SMTP id
 ce5-20020a17090aff0500b0026d0ae3f6a7mr935986pjb.21.1692316742244; 
 Thu, 17 Aug 2023 16:59:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 bt11-20020a17090af00b00b002680ef05c40sm334830pjb.55.2023.08.17.16.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:58:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:40 -0700
Message-Id: <20230817235859.49846-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=keescook@chromium.org; 
 h=from:subject;
 bh=5nTriTvU6hERX/iI4Nl8dL1Ec/4B+oHOGqi2OU9g6Qg=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rQ/kvuY7+Gn5tKJWg/r4cXZIgImGLVHbUCZB
 DFLPZ2NhGWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60PwAKCRCJcvTf3G3A
 JhvpD/wNYxu2CIOowdUv5/Gwd94bn/HKEspBIm29MnOZtnaUtavl0IWVwMhW1P/8HQl9woaPfLG
 6Aq1zIhFa0dMdc/NApNTy4232MZ5m0W2yU1vsE4DoahHlSo99Wb5IXEpmYQoW3Ogcru8iTI6RWE
 X+O5eTwn/TrdoEplK1g6rsrSovVWaEWuKQPOdUcN0zVf0YFUcRqB5ErOnPXhT+eeEQosMKckapy
 xAlbAopfCGNa55AO8pK6DeF9558RwA8t+1v8gtPAtBrx0xl98gWhKtK4YNcorE0C/IQnmvzBmtM
 E5wFOLjYn9E36ScSEdLRXdOLC0TOh1hT2mgx4IlClvnnj6ejHDSwQKih3mT+CnD0ir9WDUWyX9C
 bGjxWt4DBLFpP42ZKN1lFVD3p1UsDwQf1sVM/JJZZWUREKtwdy/Jm8jzHw9j/hLep56o7cJQuzK
 COT8j10NMt/uMFOu3Th8H23KqtaUnz7XDdZv2DXz4gkrLBWqttX9OJsyxN0brY84f6Lmu+2P50E
 la+wH9n2H1f6jFY8wmjqrrLqTCvhPaXHM7/yl9TlA3zM2OgrLbARzLsJcM3sEBnJTMszTBziErj
 Bn7kZG3N8z1rIg4yzutknyAVMFixUdrTgZ968m671TSetEtKj/KknSzomKzfesrG9oL7QZZRtXi
 zZtgQ/94fa+v75Q==
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
Subject: [Linux-stm32] [PATCH 03/21] dmaengine: axi-dmac: Annotate struct
	axi_dmac_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct axi_dmac_desc.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/dma-axi-dmac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index fc7cdad37161..b9f85cb20d3e 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -117,7 +117,7 @@ struct axi_dmac_desc {
 	unsigned int num_submitted;
 	unsigned int num_completed;
 	unsigned int num_sgs;
-	struct axi_dmac_sg sg[];
+	struct axi_dmac_sg sg[] __counted_by(num_sgs);
 };
 
 struct axi_dmac_chan {
@@ -484,12 +484,11 @@ static struct axi_dmac_desc *axi_dmac_alloc_desc(unsigned int num_sgs)
 	desc = kzalloc(struct_size(desc, sg, num_sgs), GFP_NOWAIT);
 	if (!desc)
 		return NULL;
+	desc->num_sgs = num_sgs;
 
 	for (i = 0; i < num_sgs; i++)
 		desc->sg[i].id = AXI_DMAC_SG_UNUSED;
 
-	desc->num_sgs = num_sgs;
-
 	return desc;
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
