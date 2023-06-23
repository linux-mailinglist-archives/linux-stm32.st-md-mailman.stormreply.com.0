Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEA173ADC3
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 02:32:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E7F4C65E42;
	Fri, 23 Jun 2023 00:32:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45610C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 00:32:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E7F856193B;
 Fri, 23 Jun 2023 00:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC72C433D9;
 Fri, 23 Jun 2023 00:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687480341;
 bh=EjrF3HDt3RyfZDfXrX+WQ/ORgsApGiY+Cl6RD/uJWfg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LOHG41zn1XS4ny8ZCgGD1vPbFadZKjmexxkSYAsxKoiLS//ssEbPthdsd80wsR6ph
 Ka3CXEaJNh+DnWDjr1UVVbT3ItiBTCTMGsxsIPEsV7fk6MaLEkn3dnlme505VU37ai
 xse9AJsKKSf7sKCOjwRD2zHXD0xSIX+sWlR59mjQdILbFZ9MX9tjx5y9w3ZmMaYkCI
 l9tnjQg9+PVpWLFJ2brDQpRPFS65B9FhqVFPgSYuDMyD8GDsBhbSNYFPGr/CW2An5f
 thB1Z1h93S3HIbT5BCZ2rBNB4JAQCM8SaKJO/5TCY0l8ZmSlm8VIEPwEwbhoTDgjFp
 A7khtKt/0Bi1Q==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Valentin Caron <valentin.caron@foss.st.com>
In-Reply-To: <20230621115523.923176-1-valentin.caron@foss.st.com>
References: <20230621115523.923176-1-valentin.caron@foss.st.com>
Message-Id: <168748033693.332493.10302724879165095478.b4-ty@kernel.org>
Date: Fri, 23 Jun 2023 01:32:16 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-c6835
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH 0/2] spi: stm32: disable spi
 device mode for stm32f4-f7
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

On Wed, 21 Jun 2023 13:55:21 +0200, Valentin Caron wrote:
> This series follows this thread:
> https://lore.kernel.org/all/20230615075815.310261-1-valentin.caron@foss.st.com/
> 
> As STM32F4-F7 hardware can handle device mode and stm32 spi kernel
> driver can't, a restriction should be put in the kernel driver and
> not in the device-tree bindings. This series fixes that.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/2] spi: dt-bindings: stm32: do not disable spi-slave property for stm32f4-f7
      commit: 01fa9edd8bcf1c4fe330ea000c3da9ecf76c76a0

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
