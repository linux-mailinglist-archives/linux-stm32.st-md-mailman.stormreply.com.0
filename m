Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9634974FDA4
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 05:21:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4618BC6B457;
	Wed, 12 Jul 2023 03:21:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98A19C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 03:21:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 649DA616A3;
 Wed, 12 Jul 2023 03:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01898C433C7;
 Wed, 12 Jul 2023 03:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689132075;
 bh=/NuFIWfEtVjk5MvroN0JIwWzQv+7JB4TBDHgC9DyCxM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nsHuyOFlOfGP8W5cNrlZS+JZtz4WNfbJ3xNhO/Diz6kJf1YahQVGjiWGISpV7KKkO
 SirSzT6+Iey/kn0zRhDR5DEKmJRQRDUDYaIOJXh+ahNGgXUyRs/qMWi9Glh+7rhHx3
 XTcq9L/IpBB/hq6c+CgQ4A+aTeOrE3SGjsDTzhzPuJDCEBVcOEdkrR0xBM0ns9TtBs
 tQKqpy6SrlL5py4Ykit+ZGJ/2RIwTeaZHeIPEyg3vqiug1bzHGvpQ8LvFiTbXieuwv
 xAnG92vdQu8FVifLfMdDuJjN3sBdbWU0WzPk+1Wi0aVV4FFcLtH7kVGdpvpv+0dXFJ
 lQF0uJuPrGRSA==
Date: Tue, 11 Jul 2023 20:21:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Message-ID: <20230711202114.5e4f1dcd@kernel.org>
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: linux-tegra@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "David S
 . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 00/12] net: stmmac: replace
 boolean fields in plat_stmmacenet_data with flags
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

On Mon, 10 Jul 2023 10:59:49 +0200 Bartosz Golaszewski wrote:
> As suggested by Jose Abreu: let's drop all 12 boolean fields in
> plat_stmmacenet_data and replace them with a common bitfield.

Peppe, please take a look.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
