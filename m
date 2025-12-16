Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D75CC463C
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 17:46:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17302C7A834;
	Tue, 16 Dec 2025 16:46:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6920FC01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 16:46:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5BF446017B;
 Tue, 16 Dec 2025 16:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A850C4CEF1;
 Tue, 16 Dec 2025 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765903597;
 bh=UNSRNeBiaj3Rry5J7rpo+9jk7tXOJzVaBHlmdHHL6GQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aMz7uwpDOS8jcT7ByQo/F0gSxOsvd3ADD8dn4twiU3VojJjZqFs6Cliu1+bbKhuFN
 DWT/B4oPIjpJqLuuyVLw+IPFazTOgHJqF627ME1nKW3tk6LU0mcBh2qNgDCmBGWxn6
 2HzNigE1thZRsDbMRwI7IIXOtcHa+ZwMZkhTXESFX5x7BpIP3xeqzObs7kDdSvurWh
 dU69Kkj0RwfHiV9KVz61JOQjtW58Bg1gLQOTdmHqgX5eJfNUcln8+IDemVDOcn9/h1
 4MV0UExndT1dZ9UoLsNGm9VEjELK9LXeaXVt3PgoUzzFYctdxxq6fQRwU4mtIUf4p7
 8TAVib8cccv6Q==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Erwan Leray <erwan.leray@foss.st.com>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>
In-Reply-To: <20251215-stm32-spi-mp2x-dt-updates-v1-0-464a5fd20f13@foss.st.com>
References: <20251215-stm32-spi-mp2x-dt-updates-v1-0-464a5fd20f13@foss.st.com>
Message-Id: <176590359301.183097.12758319202580831902.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 16:46:33 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] (subset) [PATCH 0/3] spi: st: add power-domains
	on stm32mp2x
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

On Mon, 15 Dec 2025 13:26:19 +0100, Alain Volmat wrote:
> This series add the possibility to indicate a power-domains for an spi
> instance and set the related property for all spi instances on
> stm32mp2x.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: spi: st,stm32-spi: add 'power-domains' property
      commit: f4acea9eef704607d1a950909ce3a52a770d6be2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
