Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FsETIoF2BWoFXgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 09:15:13 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 274C953EC63
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 09:15:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38281C8F290;
	Thu, 14 May 2026 07:15:12 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77BDCC8F289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 07:15:11 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-44a14580111so5564836f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 00:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778742911; x=1779347711;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cb1yUNLCTgn66O03RLwbPulTwZS1mMXYrlXUWjjfA8I=;
 b=tyexMeqY5uqjCCMNfUZcvwKfpratCEWTAPowCacsDO/suQJ8Fa02V4mJcjwRiILIy9
 SBN3J2qa5SPD47ry67s2Stzhf0W8brtD1j85U7bOjkTrXoUJe74DCn6sruCLusS/2AXV
 JIpkXxbzX7Y7skjFXshlzmZ2bJAfkKaNOu/ZlF9MT7TYbyc7EvwKPSijT0GyeqRztcV4
 MZ8mFFpXCAAXfO12ovY2dUQwvPMVeA9nRtfacXCxgGoRlD5vqnTe2xsbzm2K8x1NIY9e
 oP6G5Ngf0OiQO5Y9mU6RL4ev3QShSrFdtY2g7m/ffxOOX62kirjcOhnaHOY8RvSOJKMp
 bu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778742911; x=1779347711;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cb1yUNLCTgn66O03RLwbPulTwZS1mMXYrlXUWjjfA8I=;
 b=HFYzisQmoTlL0QLeiOqXxPeAb/hpV3SZh8vGzLpLfrhypSq92urdjt0hdIiqguNOZu
 pWqhuK2N0aSEWsc1J1EtnVlI5ooljWXKpQmmrag8vda0rFDxqPG8smp9J49Qj26KKnMO
 hZKpXS+6q0ALFPsBCXkx6iVdBiMt4o5VfQORHhRwfZYz3g5kzN80YvUKb1BTqlanJgYx
 BuFh0uhu612VbnSboii8+Wjp232zyFdheimLXmD1KBlwwfcABALitD+oTH7rlKdYcYq8
 mQQMGm/348ruGuPVfbQ8ef0cnhjumRc/6oYO53lDG1nG4o6hTrjrhvf107qA1HVAED0P
 9dqQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UPC64Xz88UkbPlcjAN+Gh6Mqzsy+eRosl4+dhh4vIsSkJEjKBV/fRHfi23nw0HA/IMOJudV7S5Dw30A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLOEklKGVLTn+IwdJ49jMsqcJxRPnJ73smR4dvZmpSpitrDOvm
 Ezcc7VUUnHEKAuJsMkkszVYTAZGJr3Jv5Vn+b/3gIj3ZCNoFAmoTLFYUepxsXRJdB9U=
X-Gm-Gg: Acq92OEV6RK4+3jARKnN+y1oIodif/So5bdNnmj1TkvhUEzEycLy1GD/rrQbsXswJqT
 nOVPQ/i7U+ghwIAnmJxr4nRxD0GrU6nBbgH9efpWbiBCVpL5xn5kYCABbPHlEdfKVvC1X6hWCzt
 UXDWP1c5pKJhdseb+O1gTJALgCdKRjX6Gn+lvGVXAF3Xsoi7nVtNCqh8bshoDpvOHqS5EybWI20
 zkfkjcZHNvSSj/HRgTr011wa8PQc9RnaAlFcZHgkMDjlHusRtDfpsQTVjUI0kByaMq4OlfZURM2
 U7M/k/Fc8uobrZCT1YyPIXZoK+7m4c5VFg95aakUn/UdG+Xs0p97FlOCtVWb8Bd+/BzP9V/CRuG
 e2pOvEYWMTrvH2Z0CaAbZTC2f3k1dmedTB8AIUAYs0oAElNl6u6tbkl/+5nNTNo7XqjCrI4EXYY
 +/V+f8dd0LlYo6qLLsvpFLVZcDeA==
X-Received: by 2002:a5d:588f:0:b0:44a:9b52:8891 with SMTP id
 ffacd0b85a97d-45c7814a552mr9697538f8f.11.1778742910811; 
 Thu, 14 May 2026 00:15:10 -0700 (PDT)
Received: from archlinux ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm4327136f8f.36.2026.05.14.00.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 00:15:10 -0700 (PDT)
Date: Thu, 14 May 2026 09:15:09 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Message-ID: <y4zg2d5zghoz3miqevutiin5swfnx5y2zew2zlv4jklxsyly5g@sxeyvth2tkrk>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
 Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-8-fcdae50cf51a@baylibre.com>
 <agTcEECgJvBydhe2@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <agTcEECgJvBydhe2@ashevche-desk.local>
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 08/11] m68k: stmark2: add mcf5441x DAC
	platform devices
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
X-Rspamd-Queue-Id: 274C953EC63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.334];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,lists.infradead.org,gmail.com,uclinux.org,baylibre.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

Hi Andy,

On 13.05.2026 23:16, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 11:14:32AM +0200, Angelo Dureghello wrote:
> 
> > Add mcf5441x DAC platform devices.
> 
> ...
> 
> > +static struct resource dac0_resource[] = {
> > +	DEFINE_RES_MEM(MCFDAC_BASE0, 0x100),
> > +};
> > +
> > +static struct platform_device dac0_device = {
> > +	.name = "mcf54415_dac",
> > +	.id = 0,
> > +	.num_resources = ARRAY_SIZE(dac0_resource),
> > +	.resource = dac0_resource,
> > +};
> 
> It can be
> 
> static struct resource dac0_resource = DEFINE_RES_MEM(MCFDAC_BASE0, 0x100);
> 
> static struct platform_device dac0_device = {
> 	.name = "mcf54415_dac",
> 	.id = 0,
> 	.num_resources = 1,
> 	.resource = &dac0_resource,
> };
> 
> ...
> 
> Same for the rest. But I haven't seen the followups and don't know if those
> structures are going to be expanded. The commit message doesn't say anything
> about that. So I assume my suggestion valid.
> 

no. They are not going to be expanded, anyway, is there a real gain
using an hardcoded 1 there ?

Would not reissue a v3 for this honestly.

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Regards,
angelo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
