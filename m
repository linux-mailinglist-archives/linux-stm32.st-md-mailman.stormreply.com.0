Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D68780207
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64642C6C828;
	Thu, 17 Aug 2023 23:59:14 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89659C6C822
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:12 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-689f4fb1c29so275176b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316751; x=1692921551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/y2Eh4/WKRjvBkeOEfQI129skaNYk4SyGprhYtjFhak=;
 b=SzUW2GrAVSjYkhX+pusIUEOM+KNuQmK1FASSRRo4qO8aZqzl/n/O9lDGtPK2t65ly2
 aR/6/Z55DpooK0hj1hBnzvmaxOGaMFCvnXYiGBjR9+03xK0pMUQjNqa3GJWDJNBe3qiF
 jT3v6MwHJmiAXg1SI/wTDZTvSnHlP95OYuJHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316751; x=1692921551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/y2Eh4/WKRjvBkeOEfQI129skaNYk4SyGprhYtjFhak=;
 b=GcTUECYSNBPy3Ddii7jX7/Xt0GUOhQqqry77Lwhx7Th4qtAvQBD2ZRidaxpFxgT0RP
 sNYrbf6aigiLEe6puECj5//wIE80UhsowABwDhempIrydRUnY3A0s2HLrd+mhTRLQCpc
 EjyNmy6hP8CSfExAGTNYY0bJuUKR+GQva6ROB7F6rubOHbSrO0V8GCkuPm6qX5j7+ekH
 nTYOe6+6ZCJwCIJK2zCgQXqljxdLPl5+eiS9tapDoye643CuUiBRdECsLlFYeH6oTuVu
 dQVe26de+WUkcdRY2Kl0yeoEy76ORpcDWjY/ucgttWj1J3VS3Lf41gSKtkknTncyYy28
 ujRA==
X-Gm-Message-State: AOJu0YwndwZ55ctJFl4IDYeyy2EwiNp1pMuBoPy68ljT/If7SIF3gboR
 kfXhzs0UpaNoh+6apXHQHbK41Q==
X-Google-Smtp-Source: AGHT+IHFr30RcRjlqiQJEr6xWEDOZp1+abHFVC9+OhQwpQoJHgk9ThDktq6OxUXsC0D8f6pR31KY3Q==
X-Received: by 2002:a05:6a00:2d10:b0:687:ffac:c62e with SMTP id
 fa16-20020a056a002d1000b00687ffacc62emr5083101pfb.3.1692316751240; 
 Thu, 17 Aug 2023 16:59:11 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 q26-20020a62ae1a000000b0064378c52398sm313422pff.25.2023.08.17.16.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:08 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:48 -0700
Message-Id: <20230817235859.49846-11-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=keescook@chromium.org; 
 h=from:subject;
 bh=/eh3gjVXUNLSKs9JrCYa1PazNmJDO3vyJIq0hWQiyZ8=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRAuXQI4DpuGM5iOlcO51tj0uf03Jt7vDRoW
 1Ii4cUpYx6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QAAKCRCJcvTf3G3A
 Ju+5D/0YrvVo8rjhZaCcPFDgAshvwzk+u6v2Fw/4/dfJ+OS6ryJ+sJav8pUCdDNGIv2zNyAWlil
 adBNzQRmJl6gNY6faZUcd9pPz7Gcis004eQUoFbl8BnE3oJTlAxq+mvH7rqyIItvnZz+pJcjY0X
 tRJ+2EQIAhNV2+IAdF39L4hFVZgH9n07Un8gQljl3C6GL4SZ6ydxuNARV0yuzj7ksYtQmbUZWiM
 sjzN3ijHcW4y90VnWlisCuyiH85rwJD5v81mw4D4T0bIk/KVW/XzQElanZGyhFShZ7NB0xecSaW
 4yskOrN45ih97E4wcfYbmX583qeuDF3+HIspWg4vx1Esg/JpzBGhZDGKmgjJgdKbiQeqPxJWziN
 rIPjrRxb64nMV1bvGZRAdGM9OEb7BpcPqDTHrYmHTuWlt8smEvhSGFIE1oonrgwP+V9dNpFIRUU
 dy5znG3aae+m869/A13/KcStCYb4q5v49KTf2ABP9XaGOsiow4VEg3WjkTcdDlCo0YX2VF5IgpY
 73r7xslhvy5W4iRgnCw24jT+VAqyVI1tlBfB/8qckc7VndWWdkYtBmoiY4dhiAGxPg/PYcpwrrT
 NffAKTMZbkpcLpaBKi/B2Ah9kKVH82HTlRPVZ+JlStUZiw4juxxp/4t9OqnZmR3hLyQCVVpYhna
 yy/imOVfvaQKlqQ==
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
Subject: [Linux-stm32] [PATCH 11/21] dmaengine: st_fdma: Annotate struct
	st_fdma_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct st_fdma_desc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/st_fdma.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/st_fdma.h b/drivers/dma/st_fdma.h
index fa15b97a3bab..f296412e96b6 100644
--- a/drivers/dma/st_fdma.h
+++ b/drivers/dma/st_fdma.h
@@ -97,7 +97,7 @@ struct st_fdma_desc {
 	struct st_fdma_chan *fchan;
 	bool iscyclic;
 	unsigned int n_nodes;
-	struct st_fdma_sw_node node[];
+	struct st_fdma_sw_node node[] __counted_by(n_nodes);
 };
 
 enum st_fdma_type {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
