Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE07B1A44
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 13:11:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D59BC6A60C;
	Thu, 28 Sep 2023 11:11:38 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25A78C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 11:11:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 9D144B81BB2;
 Thu, 28 Sep 2023 11:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293FDC433C7;
 Thu, 28 Sep 2023 11:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695899496;
 bh=Z72NaU1k+yn8VH2KLYdJDMnZnUKhBkDyH6n6KvVEpYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ou0HLEYeDRVJuqY0rrG0SmdACv18zyLqyFfvqTO08uOxosewXkrdnUsKZDt4by03d
 HoyzUC8RESyHsElFy2zn11j09IfZUt6WzHuA2oqO21Ha42SO+KKjXgm6IjLM41ZaXH
 ZwhiFHQ85UyL+kbBBWakHtQDlKvxSMcDdKQpxgpwCi9X21uHcAKc3G/bOFNdpEQoHk
 WsdW7mwVvcDmZgiZTnsgMjtrxUa+KpRrLwckKsmw0eTY9s/J352bE6VAvbfbcH27CW
 a0Gd96itZ8C/fo/0yF0lAtKeo0IL63XfzQLgdegH0q4vvzaFAgyWcriGEs8NCPla5Q
 foBo5T0e+9G9w==
Date: Thu, 28 Sep 2023 16:41:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <ZRVfYzrdAOrXJUcI@matsya>
References: <20230817235428.never.111-kees@kernel.org>
 <202309151307.F3341BD5A@keescook> <202309221015.AB63726@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202309221015.AB63726@keescook>
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

On 22-09-23, 10:16, Kees Cook wrote:
> On Fri, Sep 15, 2023 at 01:08:30PM -0700, Kees Cook wrote:
> > Just a ping on the series... how do these look to you, Vinod?
> > 
> > If you want I can carry them in my tree. Please let me know.
> 
> I'm now carrying this in my for-next/hardening tree. Let me know if
> you'd prefer I drop it.

Sorry was busy in travel etc, it should be in dmaengine/next tomorrow.
You can drop it

Thanks
-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
