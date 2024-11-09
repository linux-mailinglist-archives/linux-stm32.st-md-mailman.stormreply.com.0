Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EE29C29AB
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Nov 2024 04:14:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4F9CC6DD9A;
	Sat,  9 Nov 2024 03:14:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 028F1C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Nov 2024 03:14:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 67D5E5C5456;
 Sat,  9 Nov 2024 03:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1D5C4CED2;
 Sat,  9 Nov 2024 03:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731122041;
 bh=+fO1Ep+DCuJGkt1paLe1xt9jDCApzKVVE3M9ZNlZNOU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oMAAu6Bw/sJeCPto/7oDxFXHp9Az63CqCb/czvofrz0f9l6/UBKFJYlABrDYC0cLM
 Ibn7/Y49pOk7Ly03Qd3dGUIPuiCMC7Fl9JfDz8/mz/lV6LGL8e0ThZpIygFEDh+0+6
 eB8zjX4WbztkB78yKPMf78QLPv5rJddJGLd1gBht0VmiPUh9vZlQyaGkmmp/+P7SGt
 JR+hKwZUpPY1LLW08y0Is/tQsDAhnPKtw8yQEMCXVb7au4VzuDjCPc06hAtHoEdcRG
 XJiCpV+6jlzvEVEmxMO6t8DSsXOA5wqQ/DS+S4sJtVAv/w7Mn8wpQHl85IeCF5mpDR
 zDoMQlOw9fyow==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20241107155143.1340523-1-olivier.moysan@foss.st.com>
References: <20241107155143.1340523-1-olivier.moysan@foss.st.com>
Message-Id: <173112203864.168194.12196332639413190423.b4-ty@kernel.org>
Date: Sat, 09 Nov 2024 03:13:58 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-9b746
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/2] ASoC: stm32: sai: add stm32mp25
	support
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

On Thu, 07 Nov 2024 16:51:40 +0100, Olivier Moysan wrote:
> Update STM32 SAI driver and binding to support STM32MP25 SoCs.
> 
> Olivier Moysan (2):
>   ASoC: dt-bindings: add stm32mp25 support for sai
>   ASoC: stm32: sai: add stm32mp25 support
> 
>  .../bindings/sound/st,stm32-sai.yaml          |  26 +++-
>  sound/soc/stm/stm32_sai.c                     |  58 +++++--
>  sound/soc/stm/stm32_sai.h                     |   6 +
>  sound/soc/stm/stm32_sai_sub.c                 | 144 +++++++++++++++++-
>  4 files changed, 216 insertions(+), 18 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: add stm32mp25 support for sai
      commit: 8509bb1f11a1fed710271631c2e06fd66452f510
[2/2] ASoC: stm32: sai: add stm32mp25 support
      commit: b3ea5bec7519027a8e0d6c5c3a313e2ab11e6b2c

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
