Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5pjtDAi5kmmCwwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 07:28:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A92E51411D9
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 07:28:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECD54C8F26F;
	Mon, 16 Feb 2026 06:28:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B60E2C87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 06:28:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F801600B0;
 Mon, 16 Feb 2026 06:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B66C116C6;
 Mon, 16 Feb 2026 06:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771223299;
 bh=IB6S87GqJDUeZVCDWsj9FO7zAiiLNHQjIae0NCwbIyg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vvw7taDtzIRHRPpyGWyElmvnZLUhQHz605cFYNwB67Xs3cPclrRcoUfPhUV/p1+75
 2AWNLD7UZLuLiQIUSuQxvIIBN07fbTMo+bamb3iFjWzFTTxVEqJvv0BS72OK+GbcQa
 MaGe1qIKa8LJ5Xlg3GXUwsHQHvvHz3gLFQ88OoTuAKfooJgVFServunzAKdNHlYzWM
 gjNSCngjfv6y6QYeB0jRGpsxVo5okoCk1MOqnLIEfZGaJBN6wS60aXFqkMnkI2TKqT
 /mhX+mzim3N96bnOeNAhpE8lKu7P8W+vWg6Nox4X7UttTiba7Dx09uyiWlZ7yjkhB5
 Euz23RmJRex/g==
Date: Mon, 16 Feb 2026 11:58:10 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Message-ID: <aZK4-grGSdOFXHTK@sumit-xelite>
References: <20250325200740.3645331-1-m.felsch@pengutronix.de>
 <Z-Pc6C1YUqLyej3Z@casper.infradead.org>
 <20250326110718.qzbwpmaf6xlcb4xf@pengutronix.de>
 <CAHUa44FUK_73oKSaqGdiPqB3geZbTNDFsC1Mh=KN3YPWr9=7gQ@mail.gmail.com>
 <Z-TXMIXzaro0w60M@sumit-X1>
 <CAHUa44HEsMkzQHZZufdwutQyZRtig6e0qWomhwgDZAhy2qDyhg@mail.gmail.com>
 <20260212125830.jfwos3flga2l5uwk@pengutronix.de>
 <aY8N90jMp25bBZhi@sumit-xelite>
 <252s4lfnujhrl3bkqm3xwatdkcdd3tfge3e6fla6f2llq4szjm@xltjvpqjgffn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <252s4lfnujhrl3bkqm3xwatdkcdd3tfge3e6fla6f2llq4szjm@xltjvpqjgffn>
Cc: spu@pengutronix.de, linux-efi@vger.kernel.org, mcoquelin.stm32@gmail.com,
 jan.kiszka@siemens.com, ilias.apalodimas@linaro.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 masahisa.kojima@linaro.org, akpm@linux-foundation.org,
 Jens Wiklander <jens.wiklander@linaro.org>, vbabka@suse.cz
Subject: Re: [Linux-stm32] [PATCH v2] tee: shm: fix slab page refcounting
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[sumit.garg@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:spu@pengutronix.de,m:linux-efi@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:jan.kiszka@siemens.com,m:ilias.apalodimas@linaro.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:op-tee@lists.trustedfirmware.org,m:linux-arm-kernel@lists.infradead.org,m:kernel@pengutronix.de,m:masahisa.kojima@linaro.org,m:akpm@linux-foundation.org,m:jens.wiklander@linaro.org,m:vbabka@suse.cz,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,vger.kernel.org,gmail.com,siemens.com,linaro.org,infradead.org,st-md-mailman.stormreply.com,lists.trustedfirmware.org,lists.infradead.org,linux-foundation.org,suse.cz];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:url,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: A92E51411D9
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 11:04:48PM +0100, Marco Felsch wrote:
> Hi Sumit,
> 
> On 26-02-13, Sumit Garg wrote:
> > Hi Marco,
> > 
> > On Thu, Feb 12, 2026 at 01:58:30PM +0100, Marco Felsch wrote:
> > > Hi Sumit,
> > > 
> > > TBH: I was hoping that you will take care of this since you're marked as
> > > maintainer for the tee-trusted-key and we noticed the warning with 6.14
> > > and still no fix available :/
> > 
> > Mathew did suggested a fix long back on which everybody agreed but
> 
> You agreed. I said that the current TEE API also allows non-slabed based
> backed memory and therefore I don't wanted to send this patch approach
> and instead asked you to do so since you're the maintainer and fine with
> the change.
> 
> > didn't got enough attention from you to test and report if that fixed
> 
> Why should it get attention from us? Maybe we do have different views of
> being a maintainer.

It's really the basic expectation I have put here which every reporter
of a bug needs to say if a suggested fix works for them or not.

> 
> > your issue. Since you insisted further, I have created a formal fix
> 
> Why is it our issue? It's everyones issue which uses the tee trusted-key
> driver.
> 
> > patch based on that here [1]. Care to test that?
> 
> A colleague of mine is going to test it and will reply on the patch.
> 
> > [1] https://lore.kernel.org/all/20260213113317.1728769-1-sumit.garg@kernel.org/
> 
> ...
> 
> > > I checked the code once again and figured that we could drop/replace
> > > tee_shm_register_kernel_buf() with tee_shm_alloc_kernel_buf(). I don't
> > > see why a kernel driver needs to tee_shm_register_kernel_buf() in the
> > > first place, maybe this is legacy. The only users of
> > > tee_shm_register_kernel_buf() are trusted_tee.c and tee_stmm_efi.c.
> > 
> > No it's not legacy but allows for efficient memory reuse within the
> > kernel as to not create bounce buffers to share data with TEE.
> 
> To be hones, there are only two driver using the API. The tee_stmm_efi
> driver can do the alloc during the probe(). The trusted_tee has to use a
> bounce buffer, yes but how often do you assume that (un)sealing and rng
> ops have to be done during runtime? This shouldn't be a overhead at all.
> 
> Therefore my suggestion would be still to drop the internal kernel API
> and only use it for userspace pages, where it could really matter.

I don't disagree with what you are saying here but we really need to
promote efficient memory reuse for TEE clients. There will surely be
more use-cases coming in future which can benefit from the flexibility
to register buffer. One another kernel client being remoteproc subsystem
which is already under review for this API.

-Sumit

> 
> Regards,
>   Marco
> -- 
> #gernperDu 
> #CallMeByMyFirstName
> 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
