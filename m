Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A94A7F10B
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 01:35:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82F8BC7A823;
	Mon,  7 Apr 2025 23:35:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0FC7C78F9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 23:35:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B08AD43584;
 Mon,  7 Apr 2025 23:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDA7C4CEE8;
 Mon,  7 Apr 2025 23:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744068950;
 bh=kIGTdKOcIKeSee4uGP8IJJetxDtK8tWm0G2YfHRLlyI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UBfCMlIIUDxDJQkGrdwj9v5UZI80REtdGLVp5mcMVxWK99nz2pjK0NoVl2nwA3aeF
 b21xwjy/KNWiJELcQZ9VSzH3sNO2NJOV+Rz6WucvZWG/6z5K0yDgW+3uYRm9sA+CQf
 F0oGf3+PZ4iZ0FyT60RskOXBWNRiSJ+hECgxCOgtRFnPoeDtLH5/Pfpeimrap+pCH5
 HJxvO5qKb1Kgnm6uA+k+4TE1F38G5/MtiQtSepfoEcUKOOkE3VhN8kk6XoRvrlK+Vz
 PyITa5YoqynyF1e4ZjzH0KnX2jkBxsk+v0LQhSqE9r5h7BQOOAS2oGr8TnTZijKt/X
 EDEA2OZ9ewu4g==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, shao.mingyin@zte.com.cn
In-Reply-To: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
References: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
Message-Id: <174406894704.1337819.6120750262182718363.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:47 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org, zhang.enpei@zte.com.cn,
 linux-sound@vger.kernel.org, tiwai@suse.com, yang.yang29@zte.com.cn,
 xu.xin16@zte.com.cn, mcoquelin.stm32@gmail.com, ye.xingchen@zte.com.cn,
 perex@perex.cz, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] sound: soc: stm: stm32_sai: Use
	dev_err_probe()
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

On Thu, 03 Apr 2025 15:41:42 +0800, shao.mingyin@zte.com.cn wrote:
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: soc: stm: stm32_sai: Use dev_err_probe()
      commit: d01131e3ce14f9837884aef1f3e463a3a492291f

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
