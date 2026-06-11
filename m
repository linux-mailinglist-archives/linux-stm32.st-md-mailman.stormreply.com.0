Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kNEWEPEPK2o72AMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 21:43:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6436674D3E
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 21:43:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=McioKjYM;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64402C9AE38;
	Thu, 11 Jun 2026 19:43:44 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F373C9AE31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 19:43:43 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-46019b190b6so136142f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781207023; x=1781811823;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r1KQdWvhqEfny/utP9buNkNl2/nWXIxFcbLtKnInfxQ=;
 b=McioKjYMuqClpBpcLLONvqqx5YsDI71ykAyp4fT+4Kp5+PUFrbI87dU54qdBjfVF9y
 jPJzXFgPfJakH2YO06Eq5oToo+J2PyNRL4doE3TgQJl0P9HK8XQLlZ32Q2RiVyT3XBnY
 rKD4N+NZVOHPmnLsuN6hHghBXQoTeW5E29kuUN5cyvffsB7EC18yvveoCXoaCzohzznp
 BN0KOcE69frFV+1Or+Ho9hDZumpw+PWIv9OsxXHmvRlEZoWXNcNX/E52EpVftzo/T64y
 vY4fvMe4q8qVLJh7+w4zfVaQYbgnNAwonpYcfuIFMG2oD47MkSl6lHKaqP+mPrIPzWyJ
 UusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781207023; x=1781811823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r1KQdWvhqEfny/utP9buNkNl2/nWXIxFcbLtKnInfxQ=;
 b=GYS7oxmHwQ9UQPnOpwRSJlGaQSn8xZViDY0h/17g2a62BkK9o2FDzBcFbAevCqXPki
 3Ta0advYAAmermyZI8pS60rD78kCEOoh7JlcpYR4y7ZIUj7kGvfIBE0BTtm1v6kHYmHC
 eGg0YXEowUDUVjaStvhTzMK6JipuEMa+6dSzseGcG/oniXUUX10vwUsNpZ/NM89yytyz
 lc6SvK8naG2/o3bHr6Ot8VHRVPAyvTDgZ479z9/5DkUCj0t94icGISz+8OMfjOE1UG+t
 jIlKUwvseg8ueliIt9nnPGlRWZGeUunmrYd0TzAQR7KxmOjJAR6PWHSZGgAPPLiEedbm
 3aQQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+dzka1ndTK7LlVYiQE9JaPeBavF8c6aKWqvaRHaiF6NufWMWI2OROiH/qq5exYt743nq+bydxtpwT7ww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YydYBHbP3yAHo+GV6tt6ii7w5Uff4Hi6MvyGH9traJWbsds64EU
 jHTUcA3J1HxM3HIw7g1Z75gwy7DDKkdeorZS9bcSamahCAUKscU7jY0+
X-Gm-Gg: Acq92OFskPjvX2hn5FGY93G75xjuHL4B8Ke63E2YDgnnu/34TEiS/gGewRpRPZNY5Id
 x4RkRsOLI5ScSOXmHdfVV71lu3YTB9Rd0r7VZ0rANvt/Js9UMD0ttztraEyZ+HyUxqqUJzTGCAf
 vuBefGpOeBDddAzXnI7Sh3HdyrqXTnA70VfS76PrSZNWhHnjv32LCbc9McHSKd+E3EmiQnoJQ6I
 EgAivggZ/Ookgtk9MfvajEaI1/kFDuBaBX/adXUXvUU+azdjjGVJBULYCS91oPgJJcEj8/HK+ot
 i5X0Hn/KnWr2tq8uthSsxVhSWp9ynaG+xf+wDRfAaUnTYccoynwJoycHUAJn1N750zAAPUxKjxf
 cwA+h28AAFcJGq5EfaaQ3PDllkEymrVUq1VxjWTrQh4yIt2xeXgdwgQijOz2jCb1js1f3E5OaJh
 YiJ5s7jy39iuGfUfCzJWozW3fZRF5FgZ3g2dcmSs7fM7IvgTxRnOhDA/9g2bnP
X-Received: by 2002:a05:6000:2911:b0:45e:eec6:5023 with SMTP id
 ffacd0b85a97d-460677ed2f4mr6812673f8f.37.1781207023291; 
 Thu, 11 Jun 2026 12:43:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606c0f5164sm1211937f8f.21.2026.06.11.12.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 12:43:43 -0700 (PDT)
Date: Thu, 11 Jun 2026 20:43:41 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20260611204341.147f1afb@pumpkin>
In-Reply-To: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,pumpkin:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6436674D3E

On Thu, 11 Jun 2026 20:12:32 +0200
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> The LXA boards are the only STM32 boards that set stdout-path = &uart*
> instead of explicitly specifying a baud rate.
> 
> This would mean the default of 9600 is used, but it goes unnoticed when
> booting normally as barebox fixes up a console= line that includes a
> baud rate.
> 
> When EFI booting GRUB however, GRUB will not pass along the console=
> line and thus the board ends up with a 9600 baud Linux console,
> confusing users.

Is it possible to determine the current baud rate (by reading the hardware
register) and default to that value.
Then if grub has initialised the uart the kernel will use the same
baud rate.

	David

> 
> This series fixes this. As the device trees were added at different
> times, they are fixed each in a separate commit with its own Fixes: tag.
> 
> ---
> Ahmad Fatoum (3):
>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
> 
>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> ---
> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
> 
> Best regards,
> --  
> Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
