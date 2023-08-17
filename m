Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F4143780201
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3F37C6C828;
	Thu, 17 Aug 2023 23:59:09 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD8B0C6C824
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:06 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-68872ca740bso264495b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316745; x=1692921545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dBjA6KErHDu0Uq7ocuNM+LgPWR0uNQWWk8bvJOF1pHA=;
 b=ipztNTVV3yAPojkuInZpeWP55VSHmCKMjx7Qw3GONj5VQVfyNCIgFM+g/LHs8z+Hpj
 mvoPqpGTxMMOouc1tIoedViD6LGP0PvFCe5rYSoNm3ANbBT1TrL/LATtS/QqzzC46abi
 T4wZKcYxOxH5lsvuitKrmsY0fxRQPS5Jzk5pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316745; x=1692921545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dBjA6KErHDu0Uq7ocuNM+LgPWR0uNQWWk8bvJOF1pHA=;
 b=dFb1+MoUCGvDQjhU0BKZ0x23m40bv02kElurruCMT5Bf4q/mRzl8hCrl2aEf3XZZVt
 ZWH/atxffMyuNF02X6zy7RUr93R97456iffTlEpP0dVGsFg8KGi25B6AJwHaflcgqAdJ
 au88oyeekqOnv8TyTvdXINrCqgo4ZJGbtPIUMTc4cLa9K8N7aWvNbACVkeBwHBRh406Y
 CBIc+Rl2Pm17BevVJs6dzNlCS7Da2gO7lGr0Imex0dkd31513QfKZzeKXSLNAbHorvlV
 7Gvvot2LB2ASFPzHmKrSMsIK/6PkSys7pno/XkM73Nlp91Dsd2xyrHx8iKJa360nWrZq
 /xxQ==
X-Gm-Message-State: AOJu0Yy5ii3rFa8xKeKrlCHVZ2zIexsARM3HPgf0Z7n2XkBDnDZU+3Pz
 5kCjBtHn4rUChHqfI78Hd86TGA==
X-Google-Smtp-Source: AGHT+IER/QCxL/LyPPuwtZ5fJJ0VY7Pw/rhGOAVFZGQWf10lLKJNQ6c96NXosk6/Ent/I/AwzA7fWQ==
X-Received: by 2002:a05:6a00:cce:b0:686:5a11:a434 with SMTP id
 b14-20020a056a000cce00b006865a11a434mr1288402pfv.3.1692316745516; 
 Thu, 17 Aug 2023 16:59:05 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 j19-20020a62b613000000b00686dd062207sm303138pff.150.2023.08.17.16.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:46 -0700
Message-Id: <20230817235859.49846-9-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179; i=keescook@chromium.org; 
 h=from:subject;
 bh=dwauH20Q6xP+4LjfvKyJpROFf0PoQOEsyr9XswCqTTo=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRAkodXaKGN3V1cUAy87CQjDpadxCYl1kOBd
 DBX6VSqtKqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QAAKCRCJcvTf3G3A
 JhaWD/0XQBG0IAu8uYIo6t2lBljNvRssqu8rPbwygr+clzyF6mT4ykHSqyehzafLdrnxfXUPnQy
 7BXo7qTX/oOe1mMmwnZYjE73otVC/9AG7HD+0i1rpKjSIX1y0le1b27SkDT1VdkFNlTusQCkHFg
 N3qVIdjMWBWwJkTzFR9rfsDQ6XzoTOw905VArPKp6G9jxz7DuCezAKXTuv4BpHoiKAZDDh2vuLz
 enaGQRuFi2KS4XamCm/yHnJAuch2CCUiMdV67KWMK21AjDP+MBiMpySm50hyDgoa+xj7Luu0FFE
 qsPtCNeN4wS0lLVMcqh7o8Trt0KEmujaOHtO7RTEoaMPkF5tDXDbc6VRyZTmQ6mtSfZ7nwzqhCi
 1PW3zrheQxQAES85LM8xFRwN9g+ziQ36L5iJzjYXN0KBMovPVI0h7NiFtKGVCh7ky3Jljdi9Ukv
 Alk4rWFr8Za6dePWPce8DRR6N5QhqfRajF8DekFiE3w38UdfEjjTY1xybDZ2AogeV7rkyLtxPyc
 3a6W2kiYw8Z7qmcKgsC5yF//aE5NhmtceubIVx0OhZwyljwhIJfjee+SSLqXrFmkeyn42jMoxKx
 Pa7DzAc6Kq8z1tUF8leTymViabKoo6SP81mWA3tXaPNpW0RNU6FkA5BfjD1MQgRH4Y3D0t14ieo
 fgf64ePLeCeyjxg==
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
Subject: [Linux-stm32] [PATCH 09/21] dmaengine: sf-pdma: Annotate struct
	sf_pdma with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct sf_pdma.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Green Wan <green.wan@sifive.com>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/sf-pdma/sf-pdma.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
index 5c398a83b491..d05772b5d8d3 100644
--- a/drivers/dma/sf-pdma/sf-pdma.h
+++ b/drivers/dma/sf-pdma/sf-pdma.h
@@ -113,7 +113,7 @@ struct sf_pdma {
 	void __iomem            *membase;
 	void __iomem            *mappedbase;
 	u32			n_chans;
-	struct sf_pdma_chan	chans[];
+	struct sf_pdma_chan	chans[] __counted_by(n_chans);
 };
 
 #endif /* _SF_PDMA_H */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
