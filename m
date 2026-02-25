Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J9qNHxIn2kuZwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 20:07:40 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6F919C88E
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 20:07:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6EF6C87EC4;
	Wed, 25 Feb 2026 19:07:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 183ABC87EC2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 19:07:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B63844438C;
 Wed, 25 Feb 2026 19:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9527C2BC87;
 Wed, 25 Feb 2026 19:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772046456;
 bh=hSiieK6gw9zhLfbluo0StCtR2+HseDZumG3VzdZ9QbM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZEtFRoAo4oBPAzYCOLiT0/TNL8/2/puRvEflRaFGh4v/KtesRLapwNI0L893w7erB
 osV4riLBUHl2O9Er+SvS/VXX5N/zfsBOSS5jurMNC7pKrPmC3ZeZbbJRBI6u24xin3
 JzFCkpxHaOhEptevS2DHJKcvElbDArVPxQHlBfACaTuQxcT/xHMpuY8eu4STKiI+Kh
 iYPoK93WEBNfFgGuJJy1XH2POwDxQPbjLDaKiEKY2AbefKwfdgKe1jhbiXTsJvvFbW
 i1WjvguwLO9V7VQooRyxN0E2tnID42yBMQiq8e1dIrwkDzTbGpjn0pedGFq5jrCpxw
 RLjr/QbjoJHLg==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>
In-Reply-To: <20260212-spi-stm32-fix-dma-rx-release-v1-1-53a37c31626b@foss.st.com>
References: <20260212-spi-stm32-fix-dma-rx-release-v1-1-53a37c31626b@foss.st.com>
Message-Id: <177204645457.169139.2112213155210381085.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:07:34 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix rx DMA request error
	handling
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:alain.volmat@foss.st.com,m:dan.carpenter@linaro.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-spi@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.924];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 6A6F919C88E
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 12:49:10 +0100, Alain Volmat wrote:
> Avoid trying to release the RX DMA channel when an error occurs
> during RX dma_request_chan() call. Instead, jump directly to
> release the TX channel, if applicable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: fix rx DMA request error handling
      commit: 837f6691d5f39ea6453e4489dded40fb17755c60

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
