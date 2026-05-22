Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJEgGuaVEGqBZwYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 19:44:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7905B874E
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 19:44:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CB55C36B2A;
	Fri, 22 May 2026 17:44:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC032C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 17:44:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8EF0B43874;
 Fri, 22 May 2026 17:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459851F000E9;
 Fri, 22 May 2026 17:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779471842;
 bh=K22gNRoh2z9yLN92hgi07gB7wLMlyv2U+j/zIg7Two8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date;
 b=V28kY8SvG4Ipwl37n1Zb+BfUlvKbi/q1KOCANLazO/AUMWs8LdVgsU3OBjuKJGv2b
 zKrZYp0Gn2nMNdOzH2LEHgmmHKVe0Ijy+lqwXpeENrI/13C9sk7ZNybhVDXs9qEP9J
 k0LXZuZ0Wxni335iDzREvLxxITTHHAqY4Pu4tOLtPXNUjjdF/wAYwx+Toic5gYzefA
 qhFYvxxXZAKetz0xjRsZqQdvOe8jY36EY+q+vxjr80T+EOi/z+CBq3xLMkfb7brp5M
 uYWOF4iidpCPPeqva2arWerxghmxsIZk62BJUxApUJrSYK3qqqxpnEp4n4OQXZGFJq
 Q8Zb0nGbTaoSg==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, 
 phucduc.bui@gmail.com
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
Message-Id: <177945340534.6494.9459779300774728810.b4-ty@b4>
Date: Fri, 22 May 2026 13:36:45 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xWFVqWztShCirmApW3gFp7kLzV92xCyCzkRDksqOHGE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEJXfKyDXbJQfdrp4L/s53dZlnV+F057bQiQt5
 UY/e23F22iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahCV3wAKCRAk1otyXVSH
 0Ow7B/4pPIJXmPZTefFXWsQL84lP4Kk48+aWzm16FutztIvaUHaW1SJXmqmauCZI5b1uMEiEFae
 ahkGNn5CfFZMHif8/yzHTIs6/3zEp30fPmDt7ze1Tebq46VEQgqGlmuoDsJZqSlB76vi0VGogGx
 a1K4GSvksfz6BM3oob91h7qSZrHxV+SB+xbfULBKRgGL9uCE7IvKlRw3G14ze9ro6YkCNMeWuu8
 qIb9Br51R1/zI1OOB1D1YPE2x/RDo/dQSyiyKJHGO3h0k9DX1jiJt3kzucwNrNDyB7k/39fZARD
 cBHgjFmjdq/vmNOk7MW66pJ1R3mukbEsVIo39LidLtFi5f37
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, tiwai@suse.com, mcoquelin.stm32@gmail.com,
 perex@perex.cz, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] ASoC: stm: Use guard() for mutex &
	spin locks
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
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
	FORGED_RECIPIENTS(0.00)[m:olivier.moysan@foss.st.com,m:arnaud.pouliquen@foss.st.com,m:phucduc.bui@gmail.com,m:lgirdwood@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:tiwai@suse.com,m:mcoquelin.stm32@gmail.com,m:perex@perex.cz,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:phucducbui@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.687];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,suse.com,perex.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: EC7905B874E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 15 May 2026 18:24:54 +0700, phucduc.bui@gmail.com wrote:
> ASoC: stm: Use guard() for mutex & spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in the STM drivers
> to use guard() helpers.
> The changes are code cleanup only and should have no functional impact.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/4] ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
      https://git.kernel.org/broonie/sound/c/dabf5b45b18c
[2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/b212cb00168c
[3/4] ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
      https://git.kernel.org/broonie/sound/c/5e54b4c280af
[4/4] ASoC: stm: stm32_spdifrx: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/3f0d573c3259

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
