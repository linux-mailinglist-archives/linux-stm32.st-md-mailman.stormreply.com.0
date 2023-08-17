Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D333878026D
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 02:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99140C6B47A;
	Fri, 18 Aug 2023 00:08:41 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7259C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 00:08:39 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-68872ca740bso269689b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 17:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692317318; x=1692922118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NC/8wS4E+U+x06AU4gX4E6qCdkVp40klqA0jeKErXPo=;
 b=g704C2h6GYIxjInJTKA/FnY6+rfPDG5j1XzFWY5B/q4Ve69EQ5ifrmXqKSZ4yJlVuC
 L1vrGlTrSLu4FzGxH0VjiIND5KbGMWcP+/CLN9EaNQHLa9z8y+mjmq0xZ5FvA5J+d8bH
 AvOOEN5NAMFEHzMWe9HkuB026ROd2q2yDrwMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692317318; x=1692922118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NC/8wS4E+U+x06AU4gX4E6qCdkVp40klqA0jeKErXPo=;
 b=O17ei6eK0k7nl0IWYgncxPeNFK3DMzzblV0b3kUjb1PFvLwccuswYg50IN5cPCkljD
 kVKxWodqIg8oQ6j0hPEeta3D2oJZwyQndUj5WGJpiGGnVferryqB1eqczLsUDljlTivu
 7MctIWSwJpPgDkB8G2ww782l1js2EzwdDZ5J/DqspR9lgkG27elrW/ZnqSq7Q3F6rDfE
 RrbO95azVOnQ/aQlcEpsxWiZL9a2lJpZl+VxFW/XsUTJo+q6Z8Byvwa4frVUTmE53CC+
 DVk7vqcy/av9URlyhs5fDMIxA7WhmCOrgCqUFxbVhGToluIsHZMIpoCKn3RXVz+t2k8m
 sMew==
X-Gm-Message-State: AOJu0YyYdShe7dAyHzwb5HTwys2FN1RBXfMeq2eDTNW8eI7rsdSdASNn
 FS32ye5M+IuNaH6s8Aqca0QINg==
X-Google-Smtp-Source: AGHT+IF8+0sOvpzh2S++9Gld77ion3LJ0vBuHR01Sdz45qfUXSxfnCpMtZxXVIqRA118ewYlXUkYRw==
X-Received: by 2002:a05:6a00:1ac9:b0:688:6d56:521e with SMTP id
 f9-20020a056a001ac900b006886d56521emr1317235pfv.33.1692317318596; 
 Thu, 17 Aug 2023 17:08:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 g24-20020a62e318000000b0068890a249a7sm320566pfh.21.2023.08.17.17.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 17:08:35 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:58 -0700
Message-Id: <20230817235859.49846-21-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=keescook@chromium.org; 
 h=from:subject;
 bh=4hPk4/3zaGHWUOFawsMJcft57ZMEf+1nR8QKiVCA4No=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRBx2JZWreayfOXQj+zy3mCR8g7RE9H3jYXD
 QMZ4dudGRKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 Jp9HD/9n5ghwAXv8nh4Qxc3XxAqZYeaVe7x9jiT60JfcdraN+/WY5bCHGWqSG+fEhFggmfo5FzD
 6GTpkvqX4ivg0We7ceDtG9SqkhPKEwBoWXm5kM3ufbbJwiEqbpLxXE6rGBWN3mdgA5blDa8bbWc
 KLb++Nzd5KDDkGXg/axNw6uWdNsFTdjs2mEYp5W1xlwxEi0epibZy0UbOMb6nxKlJkjNhczwCqq
 IWq1Bw/Ae3nCP438KrwWZnn/JF2WlRIPvE8xs/0SKRCj98Z+48u05ACIA9QHLOxZndnbvgxOl8M
 foh7xCqYg5eM/WEPWppoyzbLHGJSV9/qaPNMwP2jrQwvmcnXBAHldywCU4ph8Qwg6sZVGPDToXo
 XCxB37cp4A3dlZMKY7xLwUfHC3SuDR+QdUzRIoDvEXkp1TyCKi++OiBC0uTaKct2ByLXJPSVQR+
 uy3fKNevuOa90s32XtmeSp7MXKeob7Q9/OCUebWEjkp99oIw0wOYS+1w2IzcA6sN2HpB5BF7cZZ
 4UAMrAMw7McvG4xOSA/GpJYEWADYtQ5vLhrRp6Y8iZ0oJ7Edber817/7F6PO9r2jFJfXsuJhDG3
 ouohBYPImYbsHXqZvi2GsrhhdFI0GpWJ+WKPDAuoIZdvIq1pl5K5No6qWy49KQhB8FH+nfUe9ye
 H7z7nLEZJUAVhhQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-hardening@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jie Hai <haijie1@huawei.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, Yu Kuai <yukuai3@huawei.com>,
 asahi@lists.linux.dev, Kees Cook <keescook@chromium.org>,
 Sven Peter <sven@svenpeter.dev>, linux-arm-msm@vger.kernel.org,
 Green Wan <green.wan@sifive.com>, Nathan Chancellor <nathan@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-tegra@vger.kernel.org, Jordy Zomer <jordy@pwning.systems>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Zhou Wang <wangzhou1@hisilicon.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org
Subject: [Linux-stm32] [PATCH 21/21] dmaengine: usb-dmac: Annotate struct
	usb_dmac_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct usb_dmac_desc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yu Kuai <yukuai3@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jordy Zomer <jordy@pwning.systems>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/sh/usb-dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index b14cf350b669..4cfcd23e3268 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -57,7 +57,7 @@ struct usb_dmac_desc {
 	u32 residue;
 	struct list_head node;
 	dma_cookie_t done_cookie;
-	struct usb_dmac_sg sg[];
+	struct usb_dmac_sg sg[] __counted_by(sg_allocated_len);
 };
 
 #define to_usb_dmac_desc(vd)	container_of(vd, struct usb_dmac_desc, vd)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
