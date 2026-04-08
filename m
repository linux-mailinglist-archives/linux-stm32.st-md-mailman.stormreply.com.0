Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOfxLA2Z1mmTGggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 20:06:05 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC1B3BFF14
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 20:06:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAAB4C1A97F;
	Wed,  8 Apr 2026 18:06:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88147C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 18:06:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4419040681;
 Wed,  8 Apr 2026 18:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE670C19421;
 Wed,  8 Apr 2026 18:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775671562;
 bh=D+1aJhA1fbMDBRhRQFskpkRYvACysKc5lAtrmzctoXo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mMksU3l9e2mfJEoUoqkPe9ANad0g/XLDqiCks0aajWsg4gxtiPVNnjHaAHhlwPYBJ
 Vnj4jJA9B0KwoSNUG4DzEoOFbFRf65NVm5Zodq0mJwdJg1ik++sCDhndcN8XZH8DCD
 +cePY84HgcHQA+LqQw41E457Z7BvCWSBhNNZMDIdt8dAR9MYNNT0RMf3FQhK3e8KaZ
 WUxswVlzqg3YGRTEEAckEBYLU7kBnrTeoks6s4vcEGURhhkG5YNx7ym/bOU8bYIaQH
 eCtN5xJ0u2tx4u0al+tUm0j+1br7vZuQxnT+WjhK/PHuM7dBki0YiGy/wrpn+YZpWP
 pQNEDatt1IAEQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Tomasz Merta <tommerta@gmail.com>
In-Reply-To: <20260408084056.20588-1-tommerta@gmail.com>
References: <20260408084056.20588-1-tommerta@gmail.com>
Message-Id: <177565110420.101848.2541520016618788420.b4-ty@b4>
Date: Wed, 08 Apr 2026 13:25:04 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=D+1aJhA1fbMDBRhRQFskpkRYvACysKc5lAtrmzctoXo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp1pkGAgVDFHAEDSi6lBJRIOX68cVzVmjV+y1BI
 7gKoAgxfjCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadaZBgAKCRAk1otyXVSH
 0FjNB/45tntugNDNxCdID/5Lz5G2h8qJZdC0ODK5KmNYDnpHdFrxciiDud5HgoOP7IvECFJfbUW
 +31PfjaS17mDZWFaimJkEDxXV6Fa0Bw6XwY8VTJXKidpKjr68sUjNGEBJ29Unzrt22ZkRA4zzDk
 QnJIQWJpWmRCVbse7RMkQg3hLac/7H3DS/VUDp7ALXkTPVewWoqmGEpGG+ZHLR6/nUZASIQNBxA
 AdlrVbKikbiKjQSYeCVBT+UCf1g/LJTHiHtHqATapHlu2xZ3Uqr75MVyb5lm706hDTvrnqnEyC5
 Tfye2VruGcHRlnvHeAHjaBtrWoDNhmAed3ImAMpChI2Tp+8k
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Cc: linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 mcoquelin.stm32@gmail.com, Tomasz Merta <tomasz.merta@arrow.com>,
 perex@perex.cz, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] Subject: ASoC stm32_sai: fix incorrect
 BCLK polarity for DSP_A/B, LEFT_J
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
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
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
	FORGED_RECIPIENTS(0.00)[m:alsa-devel@alsa-project.org,m:tommerta@gmail.com,m:linux-kernel@vger.kernel.org,m:tiwai@suse.com,m:lgirdwood@gmail.com,m:mcoquelin.stm32@gmail.com,m:tomasz.merta@arrow.com,m:perex@perex.cz,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[alsa-project.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,gmail.com,arrow.com,perex.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.564];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 2EC1B3BFF14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 08 Apr 2026 10:40:56 +0200, Tomasz Merta wrote:
> Subject: ASoC stm32_sai: fix incorrect BCLK polarity for DSP_A/B, LEFT_J

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] Subject: ASoC stm32_sai: fix incorrect BCLK polarity for DSP_A/B, LEFT_J
      https://git.kernel.org/broonie/sound/c/0669631dbccd

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
