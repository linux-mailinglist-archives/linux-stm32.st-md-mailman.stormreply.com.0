Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 784A5780205
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38823C6C824;
	Thu, 17 Aug 2023 23:59:13 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3967C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:09 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1bc3d94d40fso3047735ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316748; x=1692921548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qbk9gosnKIp08S/xYiEcOv0NGE11Fcq8+yFR6hKeZl4=;
 b=We5THsrSooRnKlLqw9tsvHDOMpwbaNmF0BBfWlEdqKx2whcvHUB3/3Nxnbv8kankrP
 ngzJvZ78BmFun5D8FTqUK7yECWGDuNSs8nnYSt+szp/HVdj0Hz8U3/CANZnqoK34MCCe
 MA70pdExv7wbfRu11mRB3fe0J8dGqfcEDgzTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316748; x=1692921548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qbk9gosnKIp08S/xYiEcOv0NGE11Fcq8+yFR6hKeZl4=;
 b=Bu5Gj4xNQuO+7bzTPyU0vt598y+BcmQJZ4jlxD+oUwfsvbDHwq8cbwdTrXMXhAMjnN
 ps0JVsEAJ+Phi/UrWAJtW96GP5yc+BE6eZpeQk4IR6ya6+HD+fEiHNL4ZomYVQLN4KcB
 2AEkl8S14Y1Ep39Yyx6JqwyUx5KVMYjVfbl0gbnVBXjwDfui1lm9VBkrdW7ubQhjGPKr
 Qq215g96urxkhhSk8qmx2HeWTNRCTWWVtfBUkFzzldf4DCwBQTDoQXcZYgX+tsDkemK2
 MvEzUeWlXGasPrP4cQGRQnxky08T3E8yzgaz3IvTJNVFkH60Gr9C5u/37fycLBlggYP+
 umSQ==
X-Gm-Message-State: AOJu0YyV1IzlBM4yoXNCbg3mHHM9kL9cw9kwqwJV1fdUJxeBPVRzG6Jf
 QQSvCKZ7VxVzna32TV1oPiGYBA==
X-Google-Smtp-Source: AGHT+IFYtfKiEi65BafAB2jOWU0NC4RgSIrq5NI/UmYeQhLAwxzE2a0uXe3xVhrjkkkWcuKL9BkieQ==
X-Received: by 2002:a17:903:32c7:b0:1bc:2d43:c747 with SMTP id
 i7-20020a17090332c700b001bc2d43c747mr1132580plr.38.1692316748627; 
 Thu, 17 Aug 2023 16:59:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 o4-20020a1709026b0400b001b06c106844sm329849plk.151.2023.08.17.16.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:47 -0700
Message-Id: <20230817235859.49846-10-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254; i=keescook@chromium.org; 
 h=from:subject;
 bh=CkATBvf5Eu9BpZa9tpHWppJbisXYFVKIBdsrzK5V8yw=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRANeKobCkjcxAIpRUeN++tkJMAFPhdDrI+y
 Set5Q0bJ4iJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QAAKCRCJcvTf3G3A
 JtchD/9IeFdJIfhD70qMFzTh17aMHZHHEP8s1InFpgPNODtO4bqhp0Limusj01mwZljKb0D++Wt
 tj3VZ+n4u2wcw5NhCdPA2L0vPBIWHn2fhR9TPF3/hUP4jnvqxSptXhDXWcUXo4BXNUwM0F3h4ZJ
 LkvOOxbe7pis6HoDHp6i+dyNNYT1XuqVP2CX/9ppLiZwTTIyT1cZfQz62Q17kTp/j8kI6l3NF2W
 bR5x/idI3KcznCWZn3tY9MjzGvkyj170ybOxwM32psy/JHlpUricZwSTv2hiilfk47q2BqgvohY
 g1kL4/JGAjM/0WvjYhX8tA+tLGk4mfmYLDQwVjG1E7lXJnOx1uZ9ulk989VGZnHFsJUf5F/AMYB
 JvDnm1/uX5IOYdvs+MpL4BDtDX5t493UcQSyISCNbtlnrdR3A5BO9I0M5W/azRl+/IrHnNHkXAw
 krk34gifRsHYNue2eis71TJmxibjclezk6B7jWoxvw3gfHoUEukq7EBVfCkvrAmLjXC1bbpaEJb
 1M0vTO5nOwBXw2SMBRTdFjNk41oeZ+K+3y33mlh+Vxmh0G2AhUOJeeMTVuj3oRbS8F9Rfr+ksMP
 ECv/fLPFeXhWd9tmWsMsyEYmuNaDcmt6SUMT6Y9/iQiRBzhMtRAjzAzyFj8jwTp9gpx+xwU3TDW
 Zu1vaS8NrxfvhnA==
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
Subject: [Linux-stm32] [PATCH 10/21] dmaengine: sprd: Annotate struct
	sprd_dma_dev with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct sprd_dma_dev.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/sprd-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 168aa0bd73a0..07871dcc4593 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -212,7 +212,7 @@ struct sprd_dma_dev {
 	struct clk		*ashb_clk;
 	int			irq;
 	u32			total_chns;
-	struct sprd_dma_chn	channels[];
+	struct sprd_dma_chn	channels[] __counted_by(total_chns);
 };
 
 static void sprd_dma_free_desc(struct virt_dma_desc *vd);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
