Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EF4AD26CD
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jun 2025 21:33:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CD11C3F93B;
	Mon,  9 Jun 2025 19:33:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55A06C3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 19:33:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D97F629E5;
 Mon,  9 Jun 2025 19:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C951EC4CEF2;
 Mon,  9 Jun 2025 19:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749497632;
 bh=TP4hyTs8h8YAb40w69Vr1lWI5iqkgDHn/WQE3QL865I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=On4WlChjQCtAwoelwqwcdRxT8v1VCfv9hDzz+aUVbE0NAnnPCdMwnRJZrHJAAsA87
 9eICV9OPwQfMAKTi4FOITRspcsHnxzgdF/G4ysHnizfG59bTOcRM2to7g9eSP72FpM
 0HoZwUL1uSkO4UUO2Nj+yqyp5Lz/irfY/Fyed2DioexiTtcS2R2q/4Lyet4ACuM2hv
 C6Hx3fENqlFhOFbTX13N9nn/n3wbfWavsssxaitxiIZ40NRQY6UQG+dTlKUy7piqil
 72Mv/sNZS2ylZ2657IXoYVXYrFs+1gduKYkaC7EBnuW1bQK4AnMx62fIg2uBma+8E5
 PXUpxiUAgpwfg==
From: Mark Brown <broonie@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20250609-b4-upstream_ospi_reset_update-v6-1-5b602b567e8a@foss.st.com>
References: <20250609-b4-upstream_ospi_reset_update-v6-1-5b602b567e8a@foss.st.com>
Message-Id: <174949763058.256775.10348789503749491026.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 20:33:50 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
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

On Mon, 09 Jun 2025 17:05:04 +0200, Patrice Chotard wrote:
> As ospi reset is consumed by both OMM and OSPI drivers, use the reset
> acquire/release mechanism which ensure exclusive reset usage.
> 
> This avoid to call reset_control_get/put() in OMM driver each time
> we need to reset OSPI children and guarantee the reset line stays
> deasserted.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Make usage of reset_control_acquire/release() API
      commit: cf2c3eceb757e3f28e6f1034f9bc178e1535f5cc

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
