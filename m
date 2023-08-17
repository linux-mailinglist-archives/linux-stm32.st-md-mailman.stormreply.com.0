Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D30780208
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E25DC6C82C;
	Thu, 17 Aug 2023 23:59:14 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F067DC6C821
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:12 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-689e8115f8dso324453b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316751; x=1692921551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UPIu4p5LokRgX8D90uVV1XnYO5Ym/ms7iXgxGBeHR9Y=;
 b=M6wL6hWwGDRmISDltc37KS8ptBiEf3Qr48SdCfCb6p+ByGHD+wOnNkD0wIphUGF/ZN
 QSMjqs4TY0WneT0GQRWA8wiQRqDyIYf0YH5LQgPa35FwvVwnvz1IZEWWuvicKx2kp/EG
 vF4AVAPFwe9UZRviz3FVkuSBzJGWyenINNoI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316751; x=1692921551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UPIu4p5LokRgX8D90uVV1XnYO5Ym/ms7iXgxGBeHR9Y=;
 b=fAm5hZaC36xkKxP8Y1+Xjt6wJNbOYAryO39m4VzN66KtQ+4d0OTap2i4vdFkUyLrsa
 wxzc4qlO8LrwFxBOGsI+Ax/MItJwHU/YNx4sBDWN4j6mx0nfXnzINqKyFSgk8ci8C5SV
 w6g36dVyDOYeMG6qbIlSdts9Y9NifttJFEXdD+TZkQNFCL0nhqYst0U9sHM9mk72M2uE
 GzUMHsHXMRGmxc3wRLeC6PrYBKb456f6kb/DrL1wG6rmpPQty3ZEFSo8PLYsrT3vMEzt
 QLgiODE/tbfp05RUmjQYuc29gB6uYInyMIMKTL8CGPIeAXTfEMi4LVd160rciAuEK2Oj
 JBPw==
X-Gm-Message-State: AOJu0Yw7jH12y59BsMKFlSY0J3afUnMIHkVDK6/PoY18jw+sl+EJPG35
 K5X5n4uxLnw5pgTt5sYGMF5FYQ==
X-Google-Smtp-Source: AGHT+IEp9NsNs5bP5Txz/M6Zf1bH84aBR/zLrx+4UwkkfuWiGVH3ef0DKY/ohXremovjTUpPNjANyw==
X-Received: by 2002:a05:6a21:999a:b0:129:d944:2e65 with SMTP id
 ve26-20020a056a21999a00b00129d9442e65mr1690595pzb.13.1692316751709; 
 Thu, 17 Aug 2023 16:59:11 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 z16-20020aa785d0000000b00682a8e600f0sm317127pfn.35.2023.08.17.16.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:08 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:50 -0700
Message-Id: <20230817235859.49846-13-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846; i=keescook@chromium.org; 
 h=from:subject;
 bh=qxPmilAAIkLoOYICjRkX4cjKcAjqE7CQu+wWoaP3kts=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRBiikOng0Pfopo+sTAW7rtw4RZgr55AKvYH
 ziP0G2svk6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 JkzQEACx/KvF+wEb76F6NHodgtyBW5Bo96EDbaR+uzQ1M+6MkoJ+z5QX375uyUt/2CSiohYitZE
 3k9R5DImexGGnDErX1pyh0O54lVFZh4trqFmrjlIRP5MN1o00A+aPOY5fBOappLuZYEvZPIImN/
 bkNgwNZlVFH5giEHSpJo3q24BT/VtqNjlOT6gb4ZATrfFUS7m5trL8xe0bW/JduIhqBt0u2Ce61
 +P1AkdS0k/0ZmbnTf84lcr3/BMXf0orJ6GdhIIhxq6Ee2MTFmWQbQvsi8r/LlmKlwXfWtwsnuNW
 7XH33IQQiKv7pTeV31N6Vn+Gz9G8rv0DMiS4KbLN451Vn+KQrXTljf7wE/hPct5E+yWNpKk83L/
 YHOWq9nvagB+yvrBBa0rcA3Gc8nEckvDx6pTmtntal/BEcG+ZLwjf9s7Gj7I6V2qKtdfHXMhHv8
 PX7jTwRf+V+jIJs3dTWZDmLWvRY1ydelSG4tFuR9LL+XMPV6tRJ4czS5VhRYZ3YCYi44H1w7jPl
 REwibv6UXxwafopUJ2UvHkguL07fha0L/4qVQI/RYIhUf2IXo9AdRcsgnXBaHA2eyY+wj2YEqqD
 hplXqLsFgvg+xjjNJ4/LWnRcqYy/nyVPy0WQNubxImH9dS2lT0g+cZu5wOL9gLZyxvZGJ5p3frE
 3FY7s8aJWg4iKHg==
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
Subject: [Linux-stm32] [PATCH 13/21] dmaengine: stm32-mdma: Annotate struct
	stm32_mdma_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct stm32_mdma_desc.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/stm32-mdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 0de234022c6d..926d6ecf1274 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -224,7 +224,7 @@ struct stm32_mdma_desc {
 	u32 ccr;
 	bool cyclic;
 	u32 count;
-	struct stm32_mdma_desc_node node[];
+	struct stm32_mdma_desc_node node[] __counted_by(count);
 };
 
 struct stm32_mdma_dma_config {
@@ -321,6 +321,7 @@ static struct stm32_mdma_desc *stm32_mdma_alloc_desc(
 	desc = kzalloc(struct_size(desc, node, count), GFP_NOWAIT);
 	if (!desc)
 		return NULL;
+	desc->count = count;
 
 	for (i = 0; i < count; i++) {
 		desc->node[i].hwdesc =
@@ -330,8 +331,6 @@ static struct stm32_mdma_desc *stm32_mdma_alloc_desc(
 			goto err;
 	}
 
-	desc->count = count;
-
 	return desc;
 
 err:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
