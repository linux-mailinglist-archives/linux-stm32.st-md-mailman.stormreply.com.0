Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJP8IW38ymmlBwYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 00:42:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1895E3620C2
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 00:42:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E653C8F27C;
	Mon, 30 Mar 2026 22:42:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34FFBC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2026 22:42:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CFA1A403A7;
 Mon, 30 Mar 2026 22:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C97C4CEF7;
 Mon, 30 Mar 2026 22:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774910569;
 bh=WJUmNyHI33Ksdcve8J6YydVvh7qixIZn6EjlrvkUTHQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Zb9Dbfg9hUNrWQ1loGToOdl+1qsAhj6+m14i2NRC2dGewKMaB/dOQAUNfCNDitaU5
 Cm6JFuFhUp8SAl896uBm8pOzBx0kNxAE+L8HJtxJjqNU7lP2e/P3qrvwZuQfDhKKsl
 5WiW/O8KeP79L7C2tNjOYNv9HfcNALMLXxXefa8IEEF96uyCmocvry+vdD+8mX5JWE
 58NTy+nu/i5eZ50YlWI+BTM9k3aj1e9O/2qEE101zQau/u6dTxtI4jg7b7BfcxYBzh
 NYL0xXx68l+jp5Ur/OZT/XIDeOtolO6mb9K1/MS/MHGlWPwoRKcJqf7RtwegRpni3I
 qMbbT8btEx6Pw==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Felix Gu <ustc.gu@gmail.com>
In-Reply-To: <20260329-ospi-v1-1-cc8cf1c82c4a@gmail.com>
References: <20260329-ospi-v1-1-cc8cf1c82c4a@gmail.com>
Message-Id: <177487334325.97912.13454188633754990000.b4-ty@b4>
Date: Mon, 30 Mar 2026 13:22:23 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WJUmNyHI33Ksdcve8J6YydVvh7qixIZn6EjlrvkUTHQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpyvxnVDjtLZDM2CXSDaxJ2aMbGfIoYxQaaj+Ss
 wM4QuWJpYSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacr8ZwAKCRAk1otyXVSH
 0Fr0B/4wZMN1jN3fHRdwE1W1kQK3iCOwoQ4Wdk/P/GQWrK0U2e7fVUWAkUJvdd9hCc6Bk3fIk3T
 MSzzgV5Lbb8ObQvr2CmrR/7SKzDOfInspxZ0ik07JKpQi/jmvYsIPMkAtUK52GuBMkVKWlvHHF0
 2YZSLXTZn2HE2CFINvMJBoUmXZ+AzT34SHCrZvT1IJmzpYoJWBSuSFk2c3oHlTnGk+okrcjPnHc
 6+QEAo/fo9VoiKn5n9nRxMKGIp+2VuRnwP2H3BRb9bKgGuQwIPTXOeO0tvCYZv3aDAszEg8VLDo
 rqsehY1DJNNNhP40HYzH5m9+k7lJpEDpiBmaS2l+JX4R1rmp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-ospi: Fix resource leak in
 remove() callback
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
X-Spamd-Result: default: False [5.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrice.chotard@foss.st.com,m:ustc.gu@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-spi@vger.kernel.org,m:mcoquelinstm32@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.149];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 1895E3620C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 29 Mar 2026 19:14:05 +0800, Felix Gu wrote:
> spi: stm32-ospi: Fix resource leak in remove() callback

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[1/1] spi: stm32-ospi: Fix resource leak in remove() callback
      https://git.kernel.org/broonie/sound/c/73cd1f97946a

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
