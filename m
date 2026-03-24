Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDhLC5HpwmnnnAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 20:44:17 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9735231BAE2
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 20:44:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43651C87ED3;
	Tue, 24 Mar 2026 19:44:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D4E8C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 19:44:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F0A2D60103;
 Tue, 24 Mar 2026 19:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26723C2BCB1;
 Tue, 24 Mar 2026 19:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774381453;
 bh=plo2BsN6TPry+7IqvpvQqRQxEQf/o9qNSVJWv21qtAA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=arziCHdE1NM/Gy9crGNG7EEgv2FMpcFZIO4abbT+YWJj+HU1tqEHcrSTx+WSmC1UC
 VJJrPh72PUwadrlL6ZagpMVKh6avIAXhgSuLazTlf0zw6eT5XXca547HsEvCwO5yLs
 GxJBu9BnDp2lOll/Dtb8tcwb+EVb8lowGO4L76ldkInJTGRpE4CZ/SLo12UBQTrpWh
 oRIVWBWT6udtulx2JvyAiSqfQDdLsT8sF38BjT186AX5r95aoNH52vZcgzAggQ5wNY
 SyBjuPebkNnlsJYgjRSmCtqDSxDoSfIpqDpORNrtrc61A/txyIzcQCCgj5TDpspwUc
 IqmHP6TQdWjag==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>
In-Reply-To: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
References: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
Message-Id: <177435712084.80116.5302380668283249517.b4-ty@b4>
Date: Tue, 24 Mar 2026 12:58:40 +0000
MIME-Version: 1.0
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=broonie@kernel.org;
 h=from:subject:message-id; bh=plo2BsN6TPry+7IqvpvQqRQxEQf/o9qNSVJWv21qtAA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwumKdqUnr28hTL5soqDMs+G6Rv0vwemjk3MdZ
 6pYqlb7Wu6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacLpigAKCRAk1otyXVSH
 0IvqB/9D5tShr/o1I2myc+UJ63dP7OyphYGaE1zN3aptMeKDcvAVsBE/xXuVYn4kb7jZyn7i/YK
 6z4wA3la+lr/ye1loftr0T85d0CGjZJFjz3vRGcLmNk4N5LMeyOm0F74kGn++skaK46qOJustqK
 utK4ZQU+Jk/qhH463CQA58v188a8ZYJueoJ9/7Ui5orpLejlZR8jGNxIJt0lCVTrw7YHT0pN9On
 eu9+3kIHPT9nL4gJtvWjOmuAw049QYDVYz/BH5LpWZZ0BaMjm3sTAQxFFqmwPPQnnR0UfF0qw3B
 64aRhp0qVp5vWYYfA6jmr9IX19juUTvnWpM29cRLdQybJR08
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzk+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: dt-bindings: stm32: Fix incorrect
 compatible string in stm32h7-sai match
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[foss.st.com,gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:olivier.moysan@foss.st.com,m:arnaud.pouliquen@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jihed.chaibi.dev@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:jihedchaibidev@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	NEURAL_SPAM(0.00)[0.972];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9735231BAE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 21 Mar 2026 02:20:11 +0100, Jihed Chaibi wrote:
> ASoC: dt-bindings: stm32: Fix incorrect compatible string in stm32h7-sai match

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: dt-bindings: stm32: Fix incorrect compatible string in stm32h7-sai match
      https://git.kernel.org/broonie/sound/c/91049ec2e183

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
