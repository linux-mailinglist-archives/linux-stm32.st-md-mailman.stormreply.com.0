Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0F672877
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 20:32:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DDD0C6904C;
	Wed, 18 Jan 2023 19:32:51 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FB95C69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 19:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674070369; x=1705606369;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rd8D9WM+DMkQQdSGbyw+RjACp0njYXtWMwISiTkUNq4=;
 b=oB8yP/r8F4trNio8VBOLLI/6JvqpqEIG5pGtjnesJE5i6JwTB4BMuF6a
 QpFbX4WcBPD0dKrieBcPIIbQdyxuVX0z4HGWkRJ6I2tUbD+e+7e1r8nrI
 8g70xydEFRGG4F9u2x+TprCYN2O9ZthXHSgSziG9mqoTxP7/d9WFnjAlc
 4/FDwj3G4kzyyIqP1Y5mRWFsef1yGVm+Qp78FxwqhUTsMhSA3W6ZTCii0
 ou7LayAY8xe7utg2+Bjr+cnM+ueQcR6XEq8vEpyiZTlBZ6jrRjoEYwdnc
 Qys5IkC3iuGe8bktKtIwRtHKD/yiwjkKjHWcsH04qiA8T7Bjsf3iJ2IuL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411319213"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="411319213"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 11:32:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="802328577"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="802328577"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2023 11:32:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pIEAh-00BLES-15; Wed, 18 Jan 2023 21:32:31 +0200
Date: Wed, 18 Jan 2023 21:32:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <Y8hJT7gaw3+s62rv@smile.fi.intel.com>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Peng Fan <peng.fan@nxp.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Debbelt <palmer@sifive.com>,
 Paul Cercueil <paul@crapouillou.net>, Biju Das <biju.das.jz@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-riscv@lists.infradead.org,
 Stefan Roese <sr@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Samuel Holland <samuel@sholland.org>,
 Viresh Kumar <vireshk@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-tegra@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, =?utf-8?B?77+9ZXI=?= <povik+lin@cutebit.org>,
 Olivier Dautricourt <olivierdautricourt@gmail.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, devicetree@vger.kernel.org, - <chuanhua.lei@intel.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Sven Peter <sven@svenpeter.dev>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, Green Wan <green.wan@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Long Cheng <long.cheng@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Rajesh Gumasta <rgumasta@nvidia.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: dma: drop unneeded quotes
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

On Wed, Jan 18, 2023 at 07:01:43PM +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
>  Documentation/devicetree/bindings/dma/dma-controller.yaml       | 2 +-
>  Documentation/devicetree/bindings/dma/dma-router.yaml           | 2 +-

>  Documentation/devicetree/bindings/dma/intel,ldma.yaml           | 2 +-

>  Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml   | 2 +-

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
