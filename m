Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB47801FB
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 447A8C6B476;
	Thu, 17 Aug 2023 23:59:04 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 287A8C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:02 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1bf0b24d925so2811465ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316740; x=1692921540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnDKyGKtXCldI9QXtpCv/6I5lmu0QC4pcInlXQTO858=;
 b=DAWnaYSCcJsZ2VJyNMzhkr9UoSPe49NdfERuR/9MtkDayZn4oxbL0bdBJw+2iMhj4p
 Lfnut52cWciE2RYd6WqwqMkE73qCE3FMBqJtuUplIPAdNFGT2sciOaegXwD5JeA9wmBC
 wH+Nd56QJZy0nXGsWO1k9ZmYPEY10CEJMGfAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316740; x=1692921540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KnDKyGKtXCldI9QXtpCv/6I5lmu0QC4pcInlXQTO858=;
 b=H+334Y2qSgU0YeKuV5hjbDRgIkLm8wxukt/nip8J5/JlfQ2aqe2F01GgBUERZ+BglW
 ACAQXt2y/f9Inw2pg2E/KprcSmqVbs2XxVR4TcJWvbIU+g/1jf+SV8QZ4160HClaM1NX
 tdwVkAKqXB3JjEMqgB8V83BLqBlWWTuYSVQinUX2Ighy0nQi2kp+mtT6gw1hmLj2velH
 KDq/j3qBXrba4/3YQbYztG9HR6KeXf+NR74I8WM3xezmRqAOjtX28AYZ4AaNHNJSSzw3
 R4KFIH+qICAgz/ALaiugF8gFeVRcNY+rSDAydGK3sbbbcB7U846JajElRqeFfarAWZg5
 1Jhw==
X-Gm-Message-State: AOJu0Yxvakr637GgQGOMQMySTA5lD4JkB4m1SNUVqkMvtDRKK37rSCAw
 9HDB1JdFELB196/VZftxSm7uIg==
X-Google-Smtp-Source: AGHT+IEKQeHBko22jcPNb2f0023mzEzUj0EzLavg9CKweO8UgR8weVOyzF9lXaJff3D81Nl8HJWsDg==
X-Received: by 2002:a17:902:d386:b0:1b6:bced:1dc2 with SMTP id
 e6-20020a170902d38600b001b6bced1dc2mr897825pld.0.1692316740592; 
 Thu, 17 Aug 2023 16:59:00 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 e16-20020a17090301d000b001ab2b4105ddsm343739plh.60.2023.08.17.16.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:58:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:38 -0700
Message-Id: <20230817235859.49846-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268; i=keescook@chromium.org; 
 h=from:subject;
 bh=+yUzAqwh85bIB2bobXU6XticjxS12rqU/iamdolC6VQ=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rQ/2TY8D9mRgdw2CyM3qyEw53h74QZCcomFf
 /5CQW+uVY+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60PwAKCRCJcvTf3G3A
 JuA5EACo65ZRVDO2T369DZ8mHVU3mjAd/qj4wNjNG75A+15aqgtGCNtC6y1ULsuPGJRjpu+YGZP
 SfVM5TtRf0xD87KOcvyvFhAhPiCX72b/bgH9K0QC/ZaG1pKs6GWhko/TzVqRHfrpQsCvGik2Yzy
 /Ap7x9pHLr4VpCDYMvdQ14aFHpyOdx8aYtHDA1mIwxQ4TDTYiVQswfNl0mxvkRtEdJ0aF0c6FGj
 c9Wi2wkrXJHPrMQNxrQim9W2JlTKVKqRl6IyIWbLVtIEMGlyxG8ugMc6VyaVucZndxlIJN4xQ2U
 4sKFedJC4XevUTeDtgLJljcdkZQYpR5uvtS3BwAjRtNvH8giuUMrCs4zKPb2YCLieX8/hx/nZsw
 LwLJVqdCPZkQpFt/V09vvrOi9GyNaOqsByUl/+H3p8MLDp7nfIh16KZMxacwYBLfAtNXeXxTA5o
 nHyQushjVS9VAp60zhFlRDfTvOWDHIwRoopc1a8UxDwov6pxVzEyIwLE4cIGB7XObcyon7BHN1p
 g7p84kopAehxM0BeoZMMZ9Y1NLeaTbLIf/zC46QyF5KBHtNgFBrK7VksizS80pxLQD4vfPM+FwY
 lETjtxkrjbwEOfezCh0YL2gfzl8DLG5uX9D15KXxo5RYGhkzXhDubRLrlu2qf5J+KDBnU3umWrb
 OEEXY2wqf3bd9Rg==
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
 Orson Zhai <orsonzhai@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
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
 Thierry Reding <thierry.reding@gmail.com>, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org
Subject: [Linux-stm32] [PATCH 01/21] dmaengine: apple-admac: Annotate struct
	admac_data with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct admac_data.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/apple-admac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 3af795635c5c..ff46260b6ebc 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -128,7 +128,7 @@ struct admac_data {
 	int irq;
 	int irq_index;
 	int nchannels;
-	struct admac_chan channels[];
+	struct admac_chan channels[] __counted_by(nchannels);
 };
 
 struct admac_tx {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
