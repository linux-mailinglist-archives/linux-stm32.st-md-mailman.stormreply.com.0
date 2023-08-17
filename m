Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA22178026E
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 02:08:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE503C6B47B;
	Fri, 18 Aug 2023 00:08:43 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B8A8C6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 00:08:41 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-565f24a5c20so253539a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 17:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692317320; x=1692922120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qT5yfa4Cz4QzC/iMXODWK/jT5XcC4ni8TfIgPVQR0nQ=;
 b=itkn5j7gTMv3uvk6CK5XGtZxLhTAsu/BRNKLIHV5Nnpsn0DQcWV/bu/9ci4nn5kqu6
 x/vVLpnevUmcAXCDiwYw6eVp3accunlMdofKtMwNRcr5uMKlvpjrUYi85scz/+E8dzk/
 cjD/8aiEiGvBn0IkoDGWMOkYZKB31rr4FdBjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692317320; x=1692922120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qT5yfa4Cz4QzC/iMXODWK/jT5XcC4ni8TfIgPVQR0nQ=;
 b=T4wGigDZaq0R8J/d8gFxzrcNvoKMGTy3rzvKCdFy2R/K1wVKQI/6IN2v+hEedm5RQB
 lwBK22joE+q05SmmvBsVbVSPyMpsoqAvNu3dJCM7N3EQz65IipFFukgGuzPQm6wXBRiW
 4dMNSVmtmDxIt5rM/RTdmp36+tdHue6a/Ef7CDhbDNST+wj8vW1k8XFbNaUwHG0B8XMs
 n9U3JakewJ4hEyqIHwCqAK9uljJIC6CM8bD0y+Czn4FcjUkv5dgcj7sQE5S4233fcCjd
 NLj0iTaUv3yQuz4kWULDBOz2xhRTdkDd5+ZQaMe72Ezk731FbPVJ+EhexWpwSGC6CiAo
 TgOg==
X-Gm-Message-State: AOJu0Yz8nEK1+VQssAY6tLfYoey2vOt0WSKtAk8ffBNPqEdsPnP+vS2u
 BpuL0yVxuUz2bo6JRO0/3m/8QYMuez1u+MSNPAw=
X-Google-Smtp-Source: AGHT+IFAdwycmNkiJIGGqs23SxKqdoqgeSyw3+9sSzFc7X4kCoBM12cHThav0cZ1Ffgr5OQWXAzJ6A==
X-Received: by 2002:a17:90b:3908:b0:268:2f6:61c4 with SMTP id
 ob8-20020a17090b390800b0026802f661c4mr1106012pjb.12.1692317319812; 
 Thu, 17 Aug 2023 17:08:39 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 27-20020a17090a031b00b00264040322desm384590pje.40.2023.08.17.17.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 17:08:35 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:57 -0700
Message-Id: <20230817235859.49846-20-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=keescook@chromium.org; 
 h=from:subject;
 bh=TzxuhTylPZttiSXw3eB5K0of3I8ZRlEWmKuAA7ewWgw=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRBNlqs1jMDul+rCbPRl5IanBSTAmRt18Urs
 VUPCwAZkBGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 Jj/vEACgKhQ04Z609itYquBNxujyMweJdRbIgh30/21Mgn5/8pqXvn9PamYB94xNq7EuxfsrHgg
 BfrY9XZwI0BbPWqpzOwd13V3w8MNSmWPPxjxbDK18H4lSSrMfdbwG+ZXbR/Mrkm6r+ewkhk5tCX
 LNckCGMOXw5pYdEPiOHxHBPyHRK2OUPaA/D/CswQOYpMtc70xMaDBKK1YwJ1k/5oqKX9JjSO+Qv
 MosoBTfYUdVWAU7lx/OXktaVoj9YReHDBe/lF229xnT/4LXdE7LkpDMD9KUdmVidGycZqslxls2
 j/iTQ2M5MHh3i1MrAzmA8eybFyv8op9MxshEIoFiKLKm8o1t05P9JJb1d7i2YiultKBawX7C50o
 nQ4nKKCNu8+1+RyPbbC3Fj0wfAPgqVavdxGu7EjHK7j+bwOkZbLUutLBYiUS/3fgIUxbKWZU2f7
 /+UF7uJ0homH/xhtQPyRPdVZHyZ3zyCoPNUd39frSPlhNU1UCCJ7NbvUJV47NJz4NUNvSo5xXAs
 QdHUHemFMaxU5rO46ZWO63FDVyUhW5Z5driVbx2ZYQHrlQ1ViGcV4RJ1wM/Us57AMxkrago/s31
 AJzT5I+dXVGnlXFFAtBmqz94NHV4iwpXxj/JWJzCfWer+sF0qKRKEsFFUMtMP9+Z8x+wpbuRERT
 kZ57NubjvqXhnMQ==
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
Subject: [Linux-stm32] [PATCH 20/21] dmaengine: uniphier-xdmac: Annotate
	struct uniphier_xdmac_device with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct uniphier_xdmac_device.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/uniphier-xdmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/uniphier-xdmac.c b/drivers/dma/uniphier-xdmac.c
index dd51522879a7..3a8ee2b173b5 100644
--- a/drivers/dma/uniphier-xdmac.c
+++ b/drivers/dma/uniphier-xdmac.c
@@ -97,7 +97,7 @@ struct uniphier_xdmac_device {
 	struct dma_device ddev;
 	void __iomem *reg_base;
 	int nr_chans;
-	struct uniphier_xdmac_chan channels[];
+	struct uniphier_xdmac_chan channels[] __counted_by(nr_chans);
 };
 
 static struct uniphier_xdmac_chan *
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
