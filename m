Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 018ACCCFF25
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Dec 2025 14:02:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2D66C87EDF;
	Fri, 19 Dec 2025 13:02:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33813C87EDE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 13:02:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 23C7E60008;
 Fri, 19 Dec 2025 13:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4FAC4CEF1;
 Fri, 19 Dec 2025 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766149318;
 bh=IcOQ2q6331x/sFy9lNcJP8nlM9e3AYGl939jb8gmCmE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sGE3TLtDns0o46iHdyt2yvjTYf+qmBLsez2FBT/V+f8PcdkRmfkKQuoytOLGJwQsx
 JrU/G2tXYBvJeDh6wdUdhhv6mggP/NFZ/SiOoLImEh/cE0652FHY+bIiBzN65UnbXb
 nWswUlTNCLY2fahu2y9WyWPfibt0zgL7D+OQ/hzsfcnsihTSGmcf6otErRikPD03w6
 V85TY33eKYxD5t2N5dS8jBy4GwVBJhP3EGdrSXT7qajTwaiD/NLQi5uuZ33TEk5odc
 vh/ZM3vqGCiCUNui6megm0KqlkbTHV8F0AqkGWPOP9CPUOVSX200Kh94nDwtGhHZPH
 RFOguO2yd9DhA==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
In-Reply-To: <20251218-stm32-spi-enhancements-v2-0-3b69901ca9fe@foss.st.com>
References: <20251218-stm32-spi-enhancements-v2-0-3b69901ca9fe@foss.st.com>
Message-Id: <176614931636.368879.12913941748381812149.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 13:01:56 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
Cc: devicetree@vger.kernel.org, Deepak Kumar <deepak.kumar01@st.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v2 0/4] spi: stm32: stability &
 performance enhancements
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

On Thu, 18 Dec 2025 11:48:26 +0100, Alain Volmat wrote:
> The series fixes a stability issue when dealing with <8bpw
> transfers, as well as enforce an error if the DMA information
> provided within the DT are incorrect.
> 
> Performance enhancement is also provided by allowing a polling
> mode which is triggered when the transfer is so short that
> polling mode transfer would lead to faster transfer than
> if it was done in a interrupt driven manner.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] spi: stm32: properly fail on dma_request_chan error
      commit: c266d19b7d4e5ed993ed9fca25ab9d11789c41ee
[2/4] spi: stm32: fix Overrun issue at < 8bpw
      commit: 1ac3be217c01d5df55ec5052f81e4f1708f46552
[3/4] spi: stm32: perform small transfer in polling mode
      commit: b39ef93a2e5b5f4289a3486d8a94a09a1e6a4c67

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
