Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7531586114A
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 13:16:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22187C6B47A;
	Fri, 23 Feb 2024 12:16:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD8A8C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 12:16:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F0886176E;
 Fri, 23 Feb 2024 12:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02934C433C7;
 Fri, 23 Feb 2024 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708690563;
 bh=JCFDC8egWyXQb7HABdNFJAfvo0AUNIyjCWnepDQI21c=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=iwAAV5G0xRLinAtkNwS/UDub21NcNA/YD1kSoIhSJS+aJCIHz/rumU3D1Lenn5wnk
 HkGxD26tSsFekC+CXQG5DAxyM5Nzw7ypVnkoX0qMWTFo45T7vyZh1ulJdmcw6I6vSI
 UJ6q6aPRVM14waxuS1UmjG5fRjGbU95J8syQO6PWLp28QwLU5RigoqYeGbzTnehotR
 OZnD6ewlC3ECto1MNL2V+wyAZ3smxhQ8ivngTmijPejLtLKy0AU+B7T3E2jt7ju1IV
 UjCjpAXG60xgL49D4fBUMAYJ90iueYRNijtk1m0BQrN7+M/KilrjgPT1EIM/oblm0X
 /pGqEA5bFmyQw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
Message-Id: <170869055762.530534.10335046810476136989.b4-ty@kernel.org>
Date: Fri, 23 Feb 2024 17:45:57 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.3
Subject: Re: [Linux-stm32] [PATCH] phy: constify of_phandle_args in xlate
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


On Sat, 17 Feb 2024 10:39:37 +0100, Krzysztof Kozlowski wrote:
> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
> 
> 

Applied, thanks!

[1/1] phy: constify of_phandle_args in xlate
      commit: 00ca8a15dafa990d391abc37f2b8256ddf909b35

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
