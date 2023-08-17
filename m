Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEEF7801FE
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 01:59:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77729C6B47E;
	Thu, 17 Aug 2023 23:59:05 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33214C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 23:59:04 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1bdbbede5d4so3026535ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 16:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692316743; x=1692921543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgDb9t+7/ejCIiWITvPkmc45oRJcq4Tq1gnklL5DwBg=;
 b=gp5ssm6W/crP68h3PR6YM9N4hoSOFMia50leGRcJIpv3QxHc6K310MAhVMKiQN1vDe
 6XDvd9L8P+GICLL/SzUn2hZV/7zDwXYCIUEdy/5QgtrcPF4oVEj2zncjy5Ta/55q102+
 Y8N2W6Lec4dl6oqMoxwLRmjsr5L5N4lSXR44I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692316743; x=1692921543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgDb9t+7/ejCIiWITvPkmc45oRJcq4Tq1gnklL5DwBg=;
 b=TAe9sCZYKRReGRDONkg7UZDQtqjbjZQL1vjQdX4JD/vfHpMDBweS+SGTtqeNnFvOF0
 6kC8dEMA5W4bk3pJioloaUNvD9QQS//PLs4rWwxxdmZbQn7FkTUQT08yrKMzZURDIorT
 kGDthoISoreH8Ey8iT8znaKmkgpUFR4ZCTxvV0SRiY1LsTId2JuE+W+aCRKKryVaWGm+
 hDBed+CXqf6okP4p420tkH2y+LRdtqoEJTsxIjWix3VTIs1g3cxTu/yx+Pd6cnTxfCNp
 /u9lqnHxgHtCqmUyv/l6xWTLmUXOkR4Hx9D4MH1XdDozfhEaMlgDGC5icqkLSfSUzoWe
 x3RQ==
X-Gm-Message-State: AOJu0Yxbo0JqJWs9iTJ+BZvoHL2/Xp2XSH4WXjG8djbupaDJRG1NZRRG
 C3V+26Lb5FOwoNXGOqCxdnwgbg==
X-Google-Smtp-Source: AGHT+IGnJcGGJIwJmhxr7GHTyyaiBOKpy+5C/lr0+vOgplwlQIG+JS98pD0vaUYU/SWQGiIph5zitQ==
X-Received: by 2002:a17:902:d4d1:b0:1b8:b285:ec96 with SMTP id
 o17-20020a170902d4d100b001b8b285ec96mr993739plg.23.1692316742870; 
 Thu, 17 Aug 2023 16:59:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 u11-20020a17090282cb00b001bdccf6b8c9sm328924plz.127.2023.08.17.16.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:59:00 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 17 Aug 2023 16:58:41 -0700
Message-Id: <20230817235859.49846-4-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=keescook@chromium.org; 
 h=from:subject;
 bh=CxJ6MlIzuwlOlN/Wrdkn0iEmj9pF0KihHoSm4sK1AQE=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRAH0qG/vBOg6d32PmSGBdb9FgPWdM34DlOY
 S6MQjJa8MGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QAAKCRCJcvTf3G3A
 JgDZD/9pmP2TVIj071pr/xyHiGbK3XGACh35BOwyOSmVR32o10zeAaScACc5sA6JTyKBQTeKMqM
 OiU4/RZCPyvSJ0+kn5zx2xTD8Dzs0e6sPsgp0KoFhIJ0ciF59IeIY+ePM4obTxE+zseomTocI/B
 W3+Ccb+Ddpe40TBBUBbJb2OSdNTtsddC0S1DRENhjNP9y2GvGsfSvtNzGdzB9rmHIU3Kwr618mM
 NA0wObwXuPTIEeX1xnhdfs/LfndxHJmjmqJAl4iTNb7D3oeBdjGSsu9NId4YHZ4ppQhiOZdJfyS
 76y+ro95077WLAcguuIC2xyGXXYx01zuI4SkbekZwd8auA4mkoihxp7rwOdkyJptdvFkM4+w125
 x90bm3CuSEoIANeW3jAR2no9RBaql2zJYd+OY4tF+F+fTMqKLOZjJHLFzYPkQ1+R6/faM/uzzDY
 k6mmbIxde8euFh4pyyZkmcTDcAqDpdnGFMI7Gs1VZR9vmxoZdekc1ylAZ9Q1ztm2dh2jQJZ0N6f
 2XhWo5IWTNM6QO1XDsK7nVgV7vMJEsg+j5we0S5O1zmc+/K+iRP039YBM7uJ/DQJr9RSYPqQZHx
 BOmrjRKeWSh2e+AFUzg3zrlrhsjmsHxK9Pf6E7T50+IjMLog/S6Sx1o7acTHEdQsFZdvK5LJfFF
 jzaIXT9gT9yvVig==
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
Subject: [Linux-stm32] [PATCH 04/21] dmaengine: fsl-edma: Annotate struct
	fsl_edma_desc with __counted_by
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

As found with Coccinelle[1], add __counted_by for struct fsl_edma_desc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/fsl-edma-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 004ec4a6bc86..fdbc79787643 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -135,7 +135,7 @@ struct fsl_edma_desc {
 	bool				iscyclic;
 	enum dma_transfer_direction	dirn;
 	unsigned int			n_tcds;
-	struct fsl_edma_sw_tcd		tcd[];
+	struct fsl_edma_sw_tcd		tcd[] __counted_by(n_tcds);
 };
 
 enum edma_version {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
