Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /g7HIGTfN2rqUwcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2026 14:56:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 242056AAC65
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2026 14:56:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="Z/o4lN77";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E57FCC6C859;
	Sun, 21 Jun 2026 12:56:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5083C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jun 2026 12:56:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AB8F44040D;
 Sun, 21 Jun 2026 12:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DAC1F000E9;
 Sun, 21 Jun 2026 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782046561;
 bh=7BZ17cjFlry83TGansWhd9Db8FHG6/Qgrb4teQkt9TU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Z/o4lN77OqFzxFLKvGnHfUEt6l5Ua77jIJ7Dm0UNIKzV3uO3NLplC9wwxG4fQ9cJu
 MLfz+UT8a7Jp46YfwPvH6RzAOKGrHrS1Ru9GmfrjlajcExrbDfo2aL5HtiaU4NKp3J
 Le96uuPx5cvJiYrq51ws0Ps1qrAkJMGnx+jVhnHwRtbgjcljzXJvPBTXF/4316sTZn
 0uxPdhSu7qDye3mjfydXHI8BOwhMUAgK+lQiNmcR6ZD/syFreqhke0B+WF0flbOwRY
 Tuna9/G0oJ0Dcm6VhcoBBJ5iZ8CBDIFf4ZCg7HmPW+dqJypsFG//xcDCcC0iB9MKAw
 QZTwrcbluXD0Q==
Date: Sun, 21 Jun 2026 13:55:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Message-ID: <20260621135549.75e152a7@jic23-huawei>
In-Reply-To: <CALSJ-wC9Rsq6WJ_=X87R74jPrg2Y+=L8m0wRRp=1zvN5vSOw6A@mail.gmail.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
 <20260610-wip-stmark2-dac-v5-9-b76b83366d5c@baylibre.com>
 <20260611114800.009d9797@jic23-huawei>
 <CALSJ-wC9Rsq6WJ_=X87R74jPrg2Y+=L8m0wRRp=1zvN5vSOw6A@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Brian Masney <bmasney@redhat.com>,
 Steven King <sfking@fdwdc.com>, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 09/10] iio: dac: add mcf54415 DAC
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:adureghello@baylibre.com,m:andy@kernel.org,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mturquette@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:bmasney@redhat.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:sboyd@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,vger.kernel.org,baylibre.com,st-md-mailman.stormreply.com,analog.com,redhat.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,gmail.com,uclinux.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,baylibre.com:email,jic23-huawei:mid,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 242056AAC65

On Mon, 15 Jun 2026 20:20:21 +0900
Angelo Dureghello <adureghello@baylibre.com> wrote:

> Hi Jonathan,
> 
> On Thu, Jun 11, 2026 at 11:48:00AM +0100, Jonathan Cameron wrote:
> > On Wed, 10 Jun 2026 22:35:14 +0200
> > Angelo Dureghello <adureghello@baylibre.com> wrote:
> >  
> > > From: Angelo Dureghello <adureghello@baylibre.com>
> > >
> > > Add basic version of mcf54415 DAC driver. DAC is embedded in the SoC and
> > > DAC configuration registers are mapped in the internal IO address space.
> > >
> > > The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> > > analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> > > consists of a conversion unit, an output amplifier, and the associated
> > > digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> > > are respectively 0 and 0xfff, left untouched in this initial version.
> > >
> > > This initial version of the driver is minimalistic, "output raw" only, to
> > > be extended in the future. DMA and external sync are disabled, default mode
> > > is high speed, default format is right-justified 12-bit on 16-bit word.
> > >
> > > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>  
> > I'm lazy so didn't check earlier versions but assume the two bits
> > of feedback from Sashiko are false positives:
> > https://sashiko.dev/#/patchset/20260610-wip-stmark2-dac-v5-0-b76b83366d5c%40baylibre.com
> >
> > The one about clock underflow if resume fails, and then devm cleanup happens later
> > is a bit nasty.
> >
> > I did a bit of digging and maybe it is better to just leave the clock on?
> > The status dev.power.is_suspended is set to false whether or not resume succeeded
> > and I believe a following suspend will not take into account that resume failed.
> >
> > I'm not set up to poke the combinations but it might be worth trying that.
> > +CC common clk people who may immediately know what the right answer is.
> >  
> 
> was about testing this, there are no bus faults on read/write of registers
> with clock disabled, nor warnings in dmesg on double disable.

Great. That makes life easier.  I'm curious to why we don't get a double disable
though... Guess I'm missing something in the flows.
> 
> Anyway, i see now from arch Kconfig that is not possible to have CONFIG_PM
> for this specifig CPU (with MMU, PM is force-disabled), so would remove pm_ops.
> Ok ?

I suspect that's something that might get 'fixed' at somepoint, so I'd keep
the PM stuff in this driver as long as you can check it basically works.

Jonathan

> 
> Will fix all other things you pointyed out in v6.
> 
> > Otherwise just a few minor style comments inline.
> >
> > Thanks,
> >
> > Jonathan
> >  
> 
> thanks,
> regards,
> angelo
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
