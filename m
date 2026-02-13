Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONupBhigj2kuSAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Feb 2026 23:05:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6098139B59
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Feb 2026 23:05:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C059C1A97C;
	Fri, 13 Feb 2026 22:05:11 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8A47C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Feb 2026 22:05:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1vr1HO-0005gD-9k; Fri, 13 Feb 2026 23:04:50 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vr1HL-000e8h-0S;
 Fri, 13 Feb 2026 23:04:48 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
 (envelope-from <mfe@pengutronix.de>) id 1vr1HM-000000008cL-1XIN;
 Fri, 13 Feb 2026 23:04:48 +0100
Date: Fri, 13 Feb 2026 23:04:48 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Sumit Garg <sumit.garg@kernel.org>
Message-ID: <252s4lfnujhrl3bkqm3xwatdkcdd3tfge3e6fla6f2llq4szjm@xltjvpqjgffn>
References: <20250325200740.3645331-1-m.felsch@pengutronix.de>
 <Z-Pc6C1YUqLyej3Z@casper.infradead.org>
 <20250326110718.qzbwpmaf6xlcb4xf@pengutronix.de>
 <CAHUa44FUK_73oKSaqGdiPqB3geZbTNDFsC1Mh=KN3YPWr9=7gQ@mail.gmail.com>
 <Z-TXMIXzaro0w60M@sumit-X1>
 <CAHUa44HEsMkzQHZZufdwutQyZRtig6e0qWomhwgDZAhy2qDyhg@mail.gmail.com>
 <20260212125830.jfwos3flga2l5uwk@pengutronix.de>
 <aY8N90jMp25bBZhi@sumit-xelite>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aY8N90jMp25bBZhi@sumit-xelite>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
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
X-Spamd-Result: default: False [2.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[m.felsch@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:spu@pengutronix.de,m:linux-efi@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:jan.kiszka@siemens.com,m:ilias.apalodimas@linaro.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:op-tee@lists.trustedfirmware.org,m:linux-arm-kernel@lists.infradead.org,m:kernel@pengutronix.de,m:masahisa.kojima@linaro.org,m:akpm@linux-foundation.org,m:jens.wiklander@linaro.org,m:vbabka@suse.cz,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,vger.kernel.org,gmail.com,siemens.com,linaro.org,infradead.org,st-md-mailman.stormreply.com,lists.trustedfirmware.org,lists.infradead.org,linux-foundation.org,suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: A6098139B59
X-Rspamd-Action: no action

Hi Sumit,

On 26-02-13, Sumit Garg wrote:
> Hi Marco,
> 
> On Thu, Feb 12, 2026 at 01:58:30PM +0100, Marco Felsch wrote:
> > Hi Sumit,
> > 
> > TBH: I was hoping that you will take care of this since you're marked as
> > maintainer for the tee-trusted-key and we noticed the warning with 6.14
> > and still no fix available :/
> 
> Mathew did suggested a fix long back on which everybody agreed but

You agreed. I said that the current TEE API also allows non-slabed based
backed memory and therefore I don't wanted to send this patch approach
and instead asked you to do so since you're the maintainer and fine with
the change.

> didn't got enough attention from you to test and report if that fixed

Why should it get attention from us? Maybe we do have different views of
being a maintainer.

> your issue. Since you insisted further, I have created a formal fix

Why is it our issue? It's everyones issue which uses the tee trusted-key
driver.

> patch based on that here [1]. Care to test that?

A colleague of mine is going to test it and will reply on the patch.

> [1] https://lore.kernel.org/all/20260213113317.1728769-1-sumit.garg@kernel.org/

...

> > I checked the code once again and figured that we could drop/replace
> > tee_shm_register_kernel_buf() with tee_shm_alloc_kernel_buf(). I don't
> > see why a kernel driver needs to tee_shm_register_kernel_buf() in the
> > first place, maybe this is legacy. The only users of
> > tee_shm_register_kernel_buf() are trusted_tee.c and tee_stmm_efi.c.
> 
> No it's not legacy but allows for efficient memory reuse within the
> kernel as to not create bounce buffers to share data with TEE.

To be hones, there are only two driver using the API. The tee_stmm_efi
driver can do the alloc during the probe(). The trusted_tee has to use a
bounce buffer, yes but how often do you assume that (un)sealing and rng
ops have to be done during runtime? This shouldn't be a overhead at all.

Therefore my suggestion would be still to drop the internal kernel API
and only use it for userspace pages, where it could really matter.

Regards,
  Marco
-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
