Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E17C97B1B77
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 13:56:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90D0CC6A60C;
	Thu, 28 Sep 2023 11:56:22 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31C94C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 11:56:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 244E6B81BDD;
 Thu, 28 Sep 2023 11:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9EFC433CA;
 Thu, 28 Sep 2023 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695902179;
 bh=6Zl5GUxFA2nc/y6O7NdAMik2lRzNv6/dDwBAB74Y+WU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kU1QMlU2oOcCh9DJWgxxKCGPuu9i9708CIb4rLHyv1+Ax6Boy93WAwoDcnNkK8uQz
 +Bwq9RUhYgcCqMMjsK8CaSRC5n8KKLnrrcrSxhhsIYl+PJtr/zL32i9zpOrp4zh0sl
 AiXUVhkHAan10BqdRf9m3aH92jvzO43o0XkVHNoyluJ3uf46NTm/x5puntUOxsXf94
 JL5IU0Nzba4ouykEsdYXLZrjFO+x3aocGihrmWmQq6W8AYJGTpZsve1H/9PnNpLZ3x
 Qb4G3VAnRj5oIIhqqSLTkaKHm3NAFyv350AMCtqXaxabHCO1hSxdjq69ENpWq4DqgF
 JGGSZy1WzVOkA==
From: Vinod Koul <vkoul@kernel.org>
To: Kees Cook <keescook@chromium.org>
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
Message-Id: <169590216841.152265.1942803099201042070.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 17:26:08 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.3
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-hardening@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lars-Peter Clausen <lars@metafoo.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, asahi@lists.linux.dev,
 Jie Hai <haijie1@huawei.com>, Sven Peter <sven@svenpeter.dev>,
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
Subject: Re: [Linux-stm32] [PATCH 00/21] dmaengine: Annotate with
	__counted_by
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


On Thu, 17 Aug 2023 16:58:37 -0700, Kees Cook wrote:
> This annotates several structures with the coming __counted_by attribute
> for bounds checking of flexible arrays at run-time. For more details, see
> commit dd06e72e68bc ("Compiler Attributes: Add __counted_by macro").
> 
> Thanks!
> 
> -Kees
> 
> [...]

Applied, thanks!

[01/21] dmaengine: apple-admac: Annotate struct admac_data with __counted_by
        commit: 83c5d35bf9112577da097c1b4fbfedef93b951e6
[02/21] dmaengine: at_hdmac: Annotate struct at_desc with __counted_by
        commit: 81cd3cb3b3dd37df1fc45c5b6443a07bc2a7fee4
[03/21] dmaengine: axi-dmac: Annotate struct axi_dmac_desc with __counted_by
        commit: f1bc0d01cb349da43d55548b57c915ef8fe024c7
[04/21] dmaengine: fsl-edma: Annotate struct fsl_edma_desc with __counted_by
        (no commit info)
[05/21] dmaengine: hisilicon: Annotate struct hisi_dma_dev with __counted_by
        commit: 7d4b82185521538eab8b0532b9bd7b8c8ca3e63b
[06/21] dmaengine: moxart-dma: Annotate struct moxart_desc with __counted_by
        commit: fd1cb31a037bf8894a710392c2354281c5276d09
[07/21] dmaengine: qcom: bam_dma: Annotate struct bam_async_desc with __counted_by
        commit: b9fe0bd5903140cc3e1ae4e542ae7ff38c90d011
[08/21] dmaengine: sa11x0: Annotate struct sa11x0_dma_desc with __counted_by
        commit: 04b5433b8c0e1b014f081f4bf79767bbc207a7b0
[09/21] dmaengine: sf-pdma: Annotate struct sf_pdma with __counted_by
        commit: 1539a22e144106eefc0ef05e7b91f68ad20a71ad
[10/21] dmaengine: sprd: Annotate struct sprd_dma_dev with __counted_by
        commit: 8360c11aef5775745fc10438e24db95ab2329b1d
[11/21] dmaengine: st_fdma: Annotate struct st_fdma_desc with __counted_by
        commit: 8279f0b476f37c51de2ed8bd70d770b2893dd2fa
[12/21] dmaengine: stm32-dma: Annotate struct stm32_dma_desc with __counted_by
        commit: 195e46df2d996ff4bbf624891b1d3ae8ea9f315d
[13/21] dmaengine: stm32-mdma: Annotate struct stm32_mdma_desc with __counted_by
        commit: 035472170a2a21fc62d8258883a9f566943058b7
[14/21] dmaengine: stm32-mdma: Annotate struct stm32_mdma_device with __counted_by
        commit: 7ba0035dc02ce0c877004dc4052c6d5f873539db
[15/21] dmaengine: tegra: Annotate struct tegra_dma_desc with __counted_by
        commit: 32b5e2d7cd14c80de1fa1cdffcc6ec211b615d82
[16/21] dmaengine: tegra210-adma: Annotate struct tegra_adma with __counted_by
        commit: 15f2c636dde8c4370db87ceabce5cc8325460d77
[17/21] dmaengine: ti: edma: Annotate struct edma_desc with __counted_by
        commit: 5f240e0cdbcb0cc60d6a75ea7d492ce93b7fd52e
[18/21] dmaengine: ti: omap-dma: Annotate struct omap_desc with __counted_by
        commit: b85178611c1156deb3c09e7f8d8cdd662b8df99c
[19/21] dmaengine: uniphier-xdmac: Annotate struct uniphier_xdmac_desc with __counted_by
        commit: 5a67a8f93f02027e4ac8583715d2f4bd2de20e10
[20/21] dmaengine: uniphier-xdmac: Annotate struct uniphier_xdmac_device with __counted_by
        commit: 7935de861aed45f97a4262d9b215d9feb172516b
[21/21] dmaengine: usb-dmac: Annotate struct usb_dmac_desc with __counted_by
        commit: a04bbeaa37d8789de5592506fa776256e784b69c

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
