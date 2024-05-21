Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83A8CB0A3
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 16:45:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1CFAC6B47A;
	Tue, 21 May 2024 14:45:17 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86F90CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2024 14:45:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 72A4DCE0FF1;
 Tue, 21 May 2024 14:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE386C32786;
 Tue, 21 May 2024 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716302705;
 bh=tNZZ7UbqGFi99eQF7zZneciQh6sIOV77HiXIpo+ovP4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gnk7g0abzwCR7AADNUdIueOb9ERBfsgKWSi8Feu47T7UxVxXWRVAaqQ2oVZ2R+Kj6
 caude00KUsLhOgZzjkgssfQRrdL7G71XxZpV5NApfb4+cY5zItiJxeHosXcOf5oV5c
 /kvVoxJXRJ3jdnH6EMrsIVfEfdsqeM0Z0K/BfaFLweLPbb9/2xFZ3UCtSDTL7Jn+7q
 ksYmdgiPG6+DRdp73WUOGuYXYXyxzJhR8su7p37JxnOGAYS+O6CWf7w+mW/qka3eQf
 ILHRaRYBg6QQSWdp7S9N9Lxks8nMFWbliGBVbLdlhUxDEzFe25Fvygd16ZopMSBkJA
 O5ZkWAxEG0vxg==
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20240520222705.1742367-1-robh@kernel.org>
References: <20240520222705.1742367-1-robh@kernel.org>
Message-Id: <171630270256.58467.9560399752329823941.b4-ty@kernel.org>
Date: Tue, 21 May 2024 15:45:02 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14-dev-621fa
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: dt-bindings: stm32: Ensure
 compatible pattern matches whole string
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

On Mon, 20 May 2024 17:27:05 -0500, Rob Herring (Arm) wrote:
> The compatible pattern "st,stm32-sai-sub-[ab]" is missing starting and
> ending anchors, so any prefix and/or suffix would still be valid.
> 
> This also fixes a warning on the example:
> 
> Documentation/devicetree/bindings/sound/st,stm32-sai.example.dtb: /example-0/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: stm32: Ensure compatible pattern matches whole string
      commit: 737ce4fb96206f999ddea7530145fc0e8abd5d31

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
