Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z+tYMPusK2r4BgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 08:53:47 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FC1677084
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 08:53:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=WZ5bcO1A;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF518C9AE35;
	Fri, 12 Jun 2026 06:53:46 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2320C424DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2026 06:53:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so6283755e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 23:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781247225; x=1781852025;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MssOwhTL72ghClGQmpNeh5OP7aj5IoqaYdtcZRWycjQ=;
 b=WZ5bcO1AiF6JlpL9/owwO9GNiqvlja1G4/E/KTO4EFfB3n1LLWlJMMeF1S2od7ib8U
 SJSHgrj6mYeArB6UcgNiM8cY2zN5RncdcDZcoFhZDDaJGYqMZpyuZbeSurK2rnK0mPdr
 XYlBbfiuy6iuqfOr+WNlWF00y4CbvIX1B5CdfuOrFuU85AkP0hlta+ASGfndF6b2VjYP
 w1hNw3CsFiXAxra3Syi9w0B6gARqliJ+UZDA/Dcj3/6DBSnlPsvYr5G0V/EIcyhWASvC
 xdqsKC3qMOEyF5PbrI9OsTI5gxp/p1GmvnaP+dQwhOfUF46nYnJzGCZzr1p0wtj4PVID
 PcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781247225; x=1781852025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MssOwhTL72ghClGQmpNeh5OP7aj5IoqaYdtcZRWycjQ=;
 b=abu14YUdNfm/kz6hj5Sq8MA0GArsDvbV2W7wJoPuiW5sY2+2u+RLjLj4KXh6tM9O5e
 fZ+Ib9kK1QHUyJDvW0PQpr2fUMjTUUY7R1/HKiPgY3i0u1XLp9x46SdzjuUSvUq/MgnP
 8VRtQZsxfWlACPvJyRwJl2N40mC0g8WO7zdJcWZGj5tIPqcqExXQVKERE5R1Z97d/peF
 bmknK7nCklIBdyIJaW9EZRJDTZAgiwZgTdEOG/d5HWTNfFxwNQ9hnGpYqg2FVyOaMjgV
 Q02SqP8VWoMszcxkk9e81AbXXG/yLkmJ6w4/KtLSRFUtrn3ihxwywxYb4LPHBcOoU4/i
 9SWg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8LjioDVD7e7i/hc9SXsaO3E4kwzmZS0sRusE9f/jI4oYX7+1aWITbGxDCjEJ1h7DZzC4SWrNTFor0w6Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyrSf3KRlIq7J0Fm+i6hFHwVUA4NK585J2GpRoNciHBmjk4EV22
 V/9tESUMcNeNdIvqf4MU2tiIUzab04h/RFNg93b8KYpLOyqkZy1Tj8jY
X-Gm-Gg: Acq92OFzNlGOx+ZtUDznD+bl34wR9FuECybxOacDBt2I6x5SsX9J5VPLOvw5a2aiUIf
 GBbsDe873c6nkuczn17JzjdSKgnVo9eo9XIeydUnKZFHylI+vdcA61r3RX3UC63VOvyzy7J2dQH
 eIXCa3VkQC7wBfNHhiUCIasBNyrPI70rU4oEW523nkLMAZGrlaaLL6ccp8U2BoVqDdEeKVK6/HH
 rqkp3riOq/g3eZMEpT3jtzWuzj6EndbYbGN7UigRwzdFTvmglHJEP7tvm6+rCHkOE4p3XHDoqfk
 Icnz/fx7lUB9NXYXybIsJs94GD4im7f05C2Kcb0ijr6Q76TlUNqMCV8obB52UvPhG5r5Dbhbpsl
 ArK4PTsTawDQWvjHCSMYFB54GLH17Y6FgGXSAIDzoM015pFwny6Y5jUwlOkIHNJlXGfMZbXpWR4
 sE23VB+9KYmfAIDUU2BVtMjUrWmOjqmRydDeIHCCy5Zu6ZdfjEq2uD70riUZ3wb7RwdU/Akt8=
X-Received: by 2002:a05:600c:8485:b0:490:a1be:6b01 with SMTP id
 5b1f17b1804b1-490ec4991d8mr16991665e9.4.1781247224745; 
 Thu, 11 Jun 2026 23:53:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2d09a85sm119274065e9.14.2026.06.11.23.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 23:53:43 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:53:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20260612075342.6615d66c@pumpkin>
In-Reply-To: <b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
 <20260611204341.147f1afb@pumpkin>
 <b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[pumpkin:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53FC1677084

On Thu, 11 Jun 2026 22:33:18 +0200
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> Hi David,
> 
> On 6/11/26 21:43, David Laight wrote:
> > On Thu, 11 Jun 2026 20:12:32 +0200
> > Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >   
> >> The LXA boards are the only STM32 boards that set stdout-path = &uart*
> >> instead of explicitly specifying a baud rate.
> >>
> >> This would mean the default of 9600 is used, but it goes unnoticed when
> >> booting normally as barebox fixes up a console= line that includes a
> >> baud rate.
> >>
> >> When EFI booting GRUB however, GRUB will not pass along the console=
> >> line and thus the board ends up with a 9600 baud Linux console,
> >> confusing users.  
> > 
> > Is it possible to determine the current baud rate (by reading the hardware
> > register) and default to that value.
> > Then if grub has initialised the uart the kernel will use the same
> > baud rate.  
> 
> I think so, yes. In addition to the register divider configuration, one
> would need the input clock rate as well, but that's not a problem.
> 
> Do you know if any drivers already do this?

I've seen it done somewhere, certainly x86, but possibly NetBSD.
That would have been preserving the baud rate set by the bios.
You don't want the baud rate changing half way through the boot sequence.

	David

> 
> Nevertheless, I would like the LXA device trees changed, even if only
> to align them with all other existing STM32 device trees.
> 
> Cheers,
> Ahmad
> 
> 
> > 
> > 	David
> >   
> >>
> >> This series fixes this. As the device trees were added at different
> >> times, they are fixed each in a separate commit with its own Fixes: tag.
> >>
> >> ---
> >> Ahmad Fatoum (3):
> >>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
> >>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
> >>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
> >>
> >>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
> >>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
> >>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
> >>  3 files changed, 3 insertions(+), 3 deletions(-)
> >> ---
> >> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> >> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
> >>
> >> Best regards,
> >> --  
> >> Ahmad Fatoum <a.fatoum@pengutronix.de>
> >>
> >>  
> > 
> >   
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
