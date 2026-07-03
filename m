Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xlYqMgBpR2qOXwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 03 Jul 2026 09:47:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D092D6FFB66
	for <lists+linux-stm32@lfdr.de>; Fri, 03 Jul 2026 09:47:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=XDQnTspI;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EDA4C8F285;
	Fri,  3 Jul 2026 07:47:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90E51C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2026 07:47:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 49E8E4334D;
 Fri,  3 Jul 2026 07:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F631F000E9;
 Fri,  3 Jul 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783064826;
 bh=VYkuNdTognQIs2j+ybtTEz5f3IFZB3kjG5rBVAxVSaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=XDQnTspIWcNXp/iZYRnAdTmyF2+BZNOIsb2B0d6w5ZGv6rTiLrS06GVstEJsx2H+z
 Gh1WrKQnTkmAaLbBhn90LC+oQvA8JigS9iZYvP33VMNde1iU7EaEtVXwNLol/UTtPt
 +ltMHM3ngQKV9+5hT5hsQNDTtkF8cYOpEB0mpiMlMTloJCM6PFXxMTQEzTtQakqrGP
 /ZUEWYaHzzeVIkGuOqt8rF5dB1QjLVIGmK7KTDvxkltjk3HlzWg2CDtwyY5hFA7g53
 Fu+TFtzYMUhDrf7FtRWTl6EGc0aqGTTRz80jpUo8QGM9zbI8bCkX00JDUwU7N4QMK7
 9ocyd5BaU9jUg==
Date: Fri, 3 Jul 2026 08:47:01 +0100
From: Lee Jones <lee@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Message-ID: <20260703074701.GE2108533@google.com>
References: <20260615063042.36397-1-pengpeng@iscas.ac.cn>
 <20260701214250.GD2108533@google.com>
 <20260703065016.97181-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703065016.97181-1-pengpeng@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stm32-timers: depopulate child
 devices on populate failure
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D092D6FFB66

On Fri, 03 Jul 2026, Pengpeng Hou wrote:

> Hi Lee,
> 
> Thanks for taking a look.
> 
> I checked devm_of_platform_populate(), but I don't think it covers this
> particular failure path on its own.
> 
> devm_of_platform_populate() only installs the devres cleanup after
> of_platform_populate() has returned success.  If of_platform_populate()
> returns an error after creating some earlier children, the helper just
> frees its devres record and those partial children are not depopulated.
> 
> For stm32-timers, I think we still need the explicit ordering used by
> remove: depopulate children before stm32_timers_dma_remove().  The child
> drivers get the parent drvdata, and the PWM child can call the parent
> stm32_timers_dma_burst_read() helper, so releasing the parent DMA
> channels while partially-created children remain would keep the same
> ordering problem the remove path avoids.
> 
> I agree the inline unwind is not the clearest form.  I can send a v2
> using a normal goto unwind label and a short comment explaining the
> partial-populate case, unless you prefer a different shape.

I'm not concerned about where in the file the call sits.  Calls like
this that fail usually do so cleanly.  I think this deserves a wider
piece of work that ensures that of_platform_populate() doesn't leave
dangling resources when it fails.

Also, why doesn't every call to of_platform_populate() have this?

-- 
Lee Jones
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
