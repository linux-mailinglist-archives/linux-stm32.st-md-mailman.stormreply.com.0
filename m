Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4068780200
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3DBBC6C825;
	Thu, 17 Aug 2023 23:59:09 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F932C6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:06 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-563f8e8a53dso296392a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316745; x=1692921545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdyN/fj86XQDqOrrbJ+rbs9RYAU+LL5JiAfmLxUgxMI=;
 b=oBAxpd/FRve5XlrsrxBsKrpB9KrQpqxMLqtzRew+3AXlkD3fhn6Z/EWeioXVIsD6kj
 3UN9nAIQlgnxjePwywSbPfWa9tfyA8y/aDDAQVK3PTHWjac9q1kudJxi0AAh+o2xrvjm
 PvMz6QfhB+OTlJil0oC0LSXa2xCQpDnGbbsRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316745; x=1692921545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdyN/fj86XQDqOrrbJ+rbs9RYAU+LL5JiAfmLxUgxMI=;
 b=GqrsqMfd0toXP6Ij0WU6gGSoBN8mRGox/wcUdFkLcVGm+AFEtxMsNieifLK+RiWCpD
 QXdEGd+LXGE9HD9MrVbxQef3uHRJvo26tEkWcEO4DdQ3Mxrfa7dNYfLcNLxNPOnkM/Wb
 ZPtj8CIcHyxhdxNtDb9WbXizpjLz5jG5ZJz5utWgCb823lunC/ggmFTdaGLFHO5EFNDP
 3cdoJvVBlG9DmK/vZjWEdWv+QggjK7HOJqaJp5yAwLGl48d+b80N4oPH+wMhLR9rplpY
 ZXviXFj9TH4n4xhQ4vzNN57YoykZySGTmj7XzFxL5kaKu2NLhUXbjcrmicHv73UfvZo3
 CYYQ==
X-Gm-Message-State: AOJu0YxEdpmE333SH8QU18YkpWLqnB2lBw5jrGhkmWO1/E8KG/N9LxNb
 doAX8BalSJt/uDUG4Jrm9TJyDQ==
X-Google-Smtp-Source: AGHT+IFLA/CIxbmsvmuWSrpKDShZC6V6vXLs3lxX1Dmv57MIgyNPYM0mdX/sp44i54mRWraeoWHmIg==
X-Received: by 2002:a17:90b:3ecb:b0:268:1f64:cefc with SMTP id
 rm11-20020a17090b3ecb00b002681f64cefcmr735024pjb.49.1692316744997; 
 Thu, 17 Aug 2023 16:59:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 30-20020a17090a001e00b00263b9e75aecsm374450pja.41.2023.08.17.16.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:43 -0700
Message-Id: <20230817235859.49846-6-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707; i=keescook@chromium.org; 
 h=from:subject;
 bh=w8ccArCK59lLgZlEqE1v4MzImMqgGYgm/+wOZMSMxlo=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRAGAtj6QDi3SIiqD7IGrGC/+0Gb9g0S4VM8
 u1mMmM3RH+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QAAKCRCJcvTf3G3A
 JqYDD/9/+1NFbYoLFAkSnMt+6wz7PrKIBUx8STNwFYd5uLkUDOxm+oYRPkP4DFdI1hDEam8anpu
 y9+IVtxhhyEqt/4mNDt8+9FNBIhzcvuNJuJpJ0nFALFYv8nhl13P/zs7SQ1xyHCLGToHg3qIUQY
 unQgnT0GPGBhgoqd0PlT9GoIPLWgvAopUg58S0v0OIzsgJWZO1gDpLLVfTiaEkysoR4QaIyY0Tf
 4HuqwDb3Wg0PUlSxnMi8WoIvZ23/AsEOEHerD8XkZKM+2AH2MTl54S6lJTH1xnz7xXNUa1jB3c9
 PvD1AuoczbYJ4PTTeVOqvkENjm2GG3ToHGqlGDsRGOFX8cqhCjbvPFR+6rgPWn7akaROfbszdzT
 AlNECT/TCNDtS+oXRgchrXfLns90wz9SiNpXVuxnWVVWNNMcc5GctK+cRF9c7+kOJTphcbDS5QI
 bpisH48oEtOPOZQO5iS/ucJ4tuFlKmA9+1EY4QYSUcr9N0Og/+Sz6AV5qbQyY8Cd4z/KF3g1jK8
 RF4QrfyW7zK+r0nIhITM2Ldoh2wTEn6/g6WbgST49AoGB/zXJJgLnveuswjG5rP4s8k7Aeo5XC9
 VNR067SFeZAGtJCkpUEAXZ1KYjafWfD7xO5/9mQhxYrn2vBkjwlhsNRz6alIogRUVGo2AbOldIj
 PpoxZOFiyCFqmxQ==
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
Subject: [Linux-stm32] [PATCH 06/21] dmaengine: moxart-dma: Annotate struct
	moxart_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct moxart_desc.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/moxart-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/moxart-dma.c b/drivers/dma/moxart-dma.c
index 7565ad98ba66..c1dd5716a46d 100644
--- a/drivers/dma/moxart-dma.c
+++ b/drivers/dma/moxart-dma.c
@@ -124,7 +124,7 @@ struct moxart_desc {
 	unsigned int			dma_cycles;
 	struct virt_dma_desc		vd;
 	uint8_t				es;
-	struct moxart_sg		sg[];
+	struct moxart_sg		sg[] __counted_by(sglen);
 };
 
 struct moxart_chan {
@@ -309,6 +309,7 @@ static struct dma_async_tx_descriptor *moxart_prep_slave_sg(
 	d = kzalloc(struct_size(d, sg, sg_len), GFP_ATOMIC);
 	if (!d)
 		return NULL;
+	d->sglen = sg_len;
 
 	d->dma_dir = dir;
 	d->dev_addr = dev_addr;
@@ -319,8 +320,6 @@ static struct dma_async_tx_descriptor *moxart_prep_slave_sg(
 		d->sg[i].len = sg_dma_len(sgent);
 	}
 
-	d->sglen = sg_len;
-
 	ch->error = 0;
 
 	return vchan_tx_prep(&ch->vc, &d->vd, tx_flags);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
