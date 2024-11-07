Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFB49C0A33
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2024 16:35:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 400B6C6C855;
	Thu,  7 Nov 2024 15:35:50 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5892C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 15:35:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E6B2AA447FC;
 Thu,  7 Nov 2024 15:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73EDC4CECC;
 Thu,  7 Nov 2024 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730993741;
 bh=GyWaCebIJB2MBOnYngkj3Xcn9uP7TVQyYFsiEtrBw/s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=O0FdVTFC5osat40Kl8QsKEksm5KYhlIo5NrZMfDOCPV+33J80/w0sk1jN8WQLjdm2
 2JEHzlQrUeXXnPuBQDTkIGdu+U8oPmjVOb6CtFO22CGrF1ZC7iF6DOcbf1kU/EG3kz
 ezSLxJFz3mcmYwP4tN8TcR4Xdy6Ve+8aAWY6ydQv31RiO2sD+J7piuXZMWbm+sJ3Ao
 fKXx09KCWPvrKc9YUbuAT5EEqi8cmZmXK21YH9J5bFyaj/ITJ00HNsSKXOaY9EQqM9
 YA1chybHueuY1SurPPDGmfPFR1jdyo953Hf+8tDAFvR4S/ZV7pAIs+RjXF2xw2IcOX
 Wr7u5As/3eo5Q==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Luo Yifan <luoyifan@cmss.chinamobile.com>
In-Reply-To: <20241106014654.206860-1-luoyifan@cmss.chinamobile.com>
References: <20241106014654.206860-1-luoyifan@cmss.chinamobile.com>
Message-Id: <173099373941.145735.10149404268306602537.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 15:35:39 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-9b746
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm: Prevent potential division by
 zero in stm32_sai_mclk_round_rate()
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

On Wed, 06 Nov 2024 09:46:54 +0800, Luo Yifan wrote:
> This patch checks if div is less than or equal to zero (div <= 0). If
> div is zero or negative, the function returns -EINVAL, ensuring the
> division operation (*prate / div) is safe to perform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm: Prevent potential division by zero in stm32_sai_mclk_round_rate()
      commit: 63c1c87993e0e5bb11bced3d8224446a2bc62338
[1/1] ASoC: stm: Prevent potential division by zero in stm32_sai_get_clk_div()
      commit: 23569c8b314925bdb70dd1a7b63cfe6100868315

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
