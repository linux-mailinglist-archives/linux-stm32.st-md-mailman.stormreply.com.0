Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 630E45EC36A
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 14:59:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 107DAC63326;
	Tue, 27 Sep 2022 12:59:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCC49C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 12:59:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B21BB61964;
 Tue, 27 Sep 2022 12:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26C6C433D6;
 Tue, 27 Sep 2022 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664283594;
 bh=WhKfpdHarWpwK0DfgClRr+Pyx0XKbe4sxd8WDUF78wc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YkC10HCYIO6+PWu6UnzjKTF9WY+SrZKXkndab8qU8tMrrS2e7WfgJy8XA0j9SDETC
 vx/qsDwpvuKHlNZSJBjk1VigqE24qHvApNwpEFlzyFfntVgVFFRmnVVSSXZx9GyXZd
 YtfF645di+Wr6eif71wbFLJWFhhBKxTZ/GcibWzH1B62JKr39uY72sVJh7qQBzA/4y
 WWnm4l/QNOJwwsCmCSDQh64LbCwEbdoCwBGob5LCcJGaxOWyHDPUgitlq5yaONzso+
 31AkDq5oqSee9GGOygXTY0grT4SPdzhgdszmWlDDoaeirqOCnq+HJoDIcAhMZ3wN2i
 2ae2YZZ11zn/Q==
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220927002004.685108-1-marex@denx.de>
References: <20220927002004.685108-1-marex@denx.de>
Message-Id: <166428359170.365276.17161501749228510942.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 13:59:51 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: sound: st,
	stm32-sai: Document audio OF graph port
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

On Tue, 27 Sep 2022 02:20:04 +0200, Marek Vasut wrote:
> It is expected that the SAI subnodes would contain audio OF graph port
> with endpoint to link it with the other side of audio link. Document
> the port: property.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: sound: st,stm32-sai: Document audio OF graph port
      commit: b3eec3e6670d4da653e742bae16e5a6ff3f03825

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
