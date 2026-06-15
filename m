Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 89RKLjq/L2raFgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 11:00:42 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 443C7684D28
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 11:00:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=VY7Wsf7K;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6CAEC030CD;
	Mon, 15 Jun 2026 09:00:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C313C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 09:00:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so29496845e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 02:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781514039; x=1782118839;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2ZOqhU/l6/beyy/jENnR1Hvx3qZYXFW88yO0lTvHG8=;
 b=VY7Wsf7KxVgohF/txISlUhjUxBM+ctNoDGOrVjULhqDu2eVa3Rw9aHFdsBBKHESItw
 5u7pmHl1HiWiIoDVpOVuCGi7HZWA6Dcd0/19mmzsrgYyjQHYoP7nx9tO3KSQTWzl0X7S
 a+LnB+L/VJVIbOhwgX15otHpoFuaFlhe5kjICZumWdDgFRXs3cHYCXS8XqH/EFLZ3CkX
 Mt66UrtdCHvXceYjEuipTO65Ma9vyEGA5OTVPzILI9u9OMZi43RZvU8ZlJNQCKAXEHbg
 7lY4ztIzOdc/8jgIfywkHtXb4cnwbXP8P47yWSeLqxRdGSS3ey9Z2rrR8CwgqGjr0LLJ
 bzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781514039; x=1782118839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z2ZOqhU/l6/beyy/jENnR1Hvx3qZYXFW88yO0lTvHG8=;
 b=cuCYdBGlTAXh5F7TVyOEUWT6pQyBM6jWWgEg3C2qr0DgHm4DaYFH3uAWHRsEHdBeCo
 nrypUN4rF/1JDSIFGt3TXDSyOkLNXPhhI7WAV4tyrb3DeGldp3YKyTSpxm7V4mBbCfXm
 5y+xUgmgrhz0nsRzFk2G/S3UpOTZDxI/ljjR2wn6NjuNOPk6gsgQrHC/03L89Hp1dIHb
 b4JgjAc/kIlXFg79/ieq3ZEv4Gl3v3CYRxxiwFXpFEs/R2sJckGNHvk9QpIm1phTyjRL
 OJeHGDoMCDCdNrmIm792xo6epJOCRnzEEb+rlMwTjIOtvFedn9VaRarJ0k9AMoNW62NU
 dFwA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/NlhlXe8bP2FY6Nw5aL3/p1XosyiHD6/Wuz6OnmzpEAbyh91DUbMakgSVSOyjc5TMpSzT3FeZTuBJrdg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz4vlCvKKdD2lWJdFtbEvAEoycxx9zn9L90mITMwRpWOmkrFfxd
 H3UY7M/BpDKOk5gw5wN5IpeioJ8VO/5JeMbsM2hp9EJbQvA/M92Gr8Zx
X-Gm-Gg: Acq92OHU9utcMRt0l1FZKUcWOs7Kt0mXy8/jwf2HpZk7erQIllvnXwk38FOEMVsuIxB
 wwZ1if+mD2gGa06j6I30Qd+jRGtZYWnjcExiUPLV43PzoGyZ3oLvd6qTt+mXZ+PAi4F+62myntf
 onIuinFpbnuvbxBQAumcd7NywWJGkMvVTMvSw1sx8R2gD9RvmGbN6DcuHfvlIvOCN7O9H3aTLUx
 DqRgekgSNV7ooMv69YQg0TfuJ69MhZyjkq3JpkLhISF2dll6z3XgWdqynn3XjvZT30MfI5BILU4
 zc40N7+HAZ6UI9xOfgKCHhqB0B1IynjVx0l/2fYgbY6LNPMUYsktHbFVLl5Qr8M7L+m2MmpJMFT
 eoL8Y3Dk5QqBikwswciWxcG8TKoXZ27XytX1RcN/An39O7iiQlClcYw4/PItonRVig1zv2Ovodl
 mUxz1iynh3Upq/o52VTn9TgInHOU6gP+RwtVoPmnl4/ejYxiYtChPlrWSVAic1
X-Received: by 2002:a05:600d:6452:10b0:48f:e230:d5ab with SMTP id
 5b1f17b1804b1-490ec5057bdmr127752275e9.31.1781514039035; 
 Mon, 15 Jun 2026 02:00:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2ce361sm31634760f8f.31.2026.06.15.02.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 02:00:38 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:00:36 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20260615100036.1e09c22d@pumpkin>
In-Reply-To: <f0b7d0a0-9b75-4d63-bc1a-f0891c86b2b9@pengutronix.de>
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
 <20260611204341.147f1afb@pumpkin>
 <b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
 <20260612075342.6615d66c@pumpkin>
 <f0b7d0a0-9b75-4d63-bc1a-f0891c86b2b9@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Cc: kernel@pengutronix.de, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Leonard =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] ARM: dts: stm32: lxa: change
 stdout-path baud rate from 9600 to 115200
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
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:a.fatoum@pengutronix.de,m:kernel@pengutronix.de,m:robh@kernel.org,m:conor+dt@kernel.org,m:alexandre.torgue@st.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mkl@pengutronix.de,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:l.goehrs@pengutronix.de,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,st.com,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pumpkin:mid,stormreply.com:url,stormreply.com:email,pengutronix.de:email,bootlin.com:url,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 443C7684D28

On Mon, 15 Jun 2026 09:53:49 +0200
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> Hello David,
> 
> On 6/12/26 8:53 AM, David Laight wrote:
> > On Thu, 11 Jun 2026 22:33:18 +0200
> > Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >   
> >> Hi David,
> >>
> >> On 6/11/26 21:43, David Laight wrote:  
> >>> On Thu, 11 Jun 2026 20:12:32 +0200
> >>> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >>>     
> >>>> The LXA boards are the only STM32 boards that set stdout-path = &uart*
> >>>> instead of explicitly specifying a baud rate.
> >>>>
> >>>> This would mean the default of 9600 is used, but it goes unnoticed when
> >>>> booting normally as barebox fixes up a console= line that includes a
> >>>> baud rate.
> >>>>
> >>>> When EFI booting GRUB however, GRUB will not pass along the console=
> >>>> line and thus the board ends up with a 9600 baud Linux console,
> >>>> confusing users.    
> >>>
> >>> Is it possible to determine the current baud rate (by reading the hardware
> >>> register) and default to that value.
> >>> Then if grub has initialised the uart the kernel will use the same
> >>> baud rate.    
> >>
> >> I think so, yes. In addition to the register divider configuration, one
> >> would need the input clock rate as well, but that's not a problem.
> >>
> >> Do you know if any drivers already do this?  
> > 
> > I've seen it done somewhere, certainly x86, but possibly NetBSD.
> > That would have been preserving the baud rate set by the bios.
> > You don't want the baud rate changing half way through the boot sequence.  
> 
> I agree in general, but in this case here, the BIOS defaults to 115200:

That would certainly make 115200 a better default than 9600.

	David

> 
> https://github.com/linux-automation/meta-lxatac/blob/wrynose/meta-lxatac-bsp/recipes-bsp/barebox/files/lxatac/defconfig#L171
> https://elixir.bootlin.com/barebox/v2026.06.0/source/common/console.c#L349
> 
> Cheers,
> Ahmad
> 
> > 
> > 	David
> >   
> >>
> >> Nevertheless, I would like the LXA device trees changed, even if only
> >> to align them with all other existing STM32 device trees.
> >>
> >> Cheers,
> >> Ahmad
> >>
> >>  
> >>>
> >>> 	David
> >>>     
> >>>>
> >>>> This series fixes this. As the device trees were added at different
> >>>> times, they are fixed each in a separate commit with its own Fixes: tag.
> >>>>
> >>>> ---
> >>>> Ahmad Fatoum (3):
> >>>>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
> >>>>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
> >>>>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
> >>>>
> >>>>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
> >>>>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
> >>>>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
> >>>>  3 files changed, 3 insertions(+), 3 deletions(-)
> >>>> ---
> >>>> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> >>>> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
> >>>>
> >>>> Best regards,
> >>>> --  
> >>>> Ahmad Fatoum <a.fatoum@pengutronix.de>
> >>>>
> >>>>    
> >>>
> >>>     
> >>
> >>  
> > 
> >   
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
