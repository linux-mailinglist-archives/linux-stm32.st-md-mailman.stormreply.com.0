Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B873908D
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 22:12:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47740C65E4F;
	Wed, 21 Jun 2023 20:12:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D45FCC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 20:12:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C0236167F;
 Wed, 21 Jun 2023 20:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1674C433C8;
 Wed, 21 Jun 2023 20:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687378344;
 bh=8RXgYeONVucyquW4A3CflngjSvC4JEQrRvUxtAhm7HA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HluFPHhN5+SHUh/irMDQj0oGOleU+xATOkRWi+GmjbDeIE6sGPwiSLqeozIXyD8Ed
 00oacTdK55HACZf0v3FAPpjYkUbeciFTToOHTnazkPCp/VP3UMUR/IinxZ80uizWeV
 PUi4/n8PbTKupr3afYHg3EmdRqCMWhksgAzHc3epQKfOG0H6mfxHdSm91241Nco/1E
 Um5GOtfegPeC9Ls08dhKZ3MZkmd+i3RygrJWpKoO8Aw/ulsxgLPJDOmsQ4/wcNmYf+
 vxL5XI1ZkXGZBBOrszxV+u1IN5oQohQN5ZJ+3bRZlP4hjjSX03JwdxjXGTd/BfrLxR
 UuoRnT7oi89IQ==
Date: Wed, 21 Jun 2023 13:12:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230621131222.071b9fc3@kernel.org>
In-Reply-To: <20230621182558.544417-1-brgl@bgdev.pl>
References: <20230621182558.544417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: linux-tegra@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "David S
 . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 00/12] net: stmmac: replace
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

On Wed, 21 Jun 2023 20:25:46 +0200 Bartosz Golaszewski wrote:
> As suggested by Jose Abreu: let's drop all 12 boolean fields in
> plat_stmmacenet_data and replace them with a common bitfield.

Is that what Jose meant, or:

-	bool has_integrated_pcs;
+	u32 has_integrated_pcs:1;

?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
