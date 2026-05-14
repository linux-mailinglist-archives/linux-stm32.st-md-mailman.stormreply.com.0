Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIuyFyx0BWpuXQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 09:05:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E64E353EAF2
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 09:05:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86BECC8F290;
	Thu, 14 May 2026 07:05:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82948C8F289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 07:05:14 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so922045e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 00:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778742314; x=1779347114;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HJwj6Gg8AyMk563HlPprgVFnntCvbQJUPOML6jrMsks=;
 b=svO1oQw0CiXg8qV++qfY2FL4+lXgoroAiaK9onFngSf+rQXqZdT0LDZ7gJKBo5oj9F
 hpzFZqPVT+0x4a4zr7Fh/L6GmPDXL/dwLdZcCUavIGlMPCdt9iq8G7a/rZ3QAkJy1VBj
 fKSXUzEWK9OHzkWHH2m2UFrHmS0We2uOCyKGnS+VDyd0hXnhF/0YFLy8K7gea1X4Mhsb
 2QyGwa3KZKYhS+MU6C1JbsQbg7+NQ3t7TUyrfaLZU4y5olLIDWgRsJuBCJHUyof4PvS6
 MKa8xycyoHOJJ7MuaF1I0/KwxQpHwnDBKggSnA32RV1caL4+o9T1v2ort8tvKD5jknb3
 TRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778742314; x=1779347114;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HJwj6Gg8AyMk563HlPprgVFnntCvbQJUPOML6jrMsks=;
 b=L8LdKT67hO32v+rctYA449uAM5UcPSi956oSt5QSdIIt44F3WFqmWnfXx/lxPCXtKR
 aT6zFG879xCDPxep+iXIosfY7CcpJbVUYoFCAylifx5rmp8Z/BIRg8Wf4Pb5WrlWTgHQ
 ZWiP6cUCnVLhKHx8q2ge5Pc3hFFAx21H1sbB5OEiCDf6Jz2502MB/UX98aoS5yBc5814
 WTUE0QwAfVXOpAvBuXKJ1JURJJp1EuGn94owdks3Ejam2kd6gTDtUjnOco4WW4SJ14iH
 VkTDzFq5VvWqQkPWtUeM4xRyoOrwUO87qhEg7toCutUzGtLE0HUY5S3C4HGkiR7ZjIu8
 sKDw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8JAZ8ms+CvZjdF4LfugoOuvEwaafKXtWq83oeUxA5N6inb5pbj3n++5/07sTH5cjbbfg6lKF0rAyzU8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyXQuzBSDITXztw4vJkRxGyXgBKRIES0W3wFhLF82whEi7ZfVPL
 pHxK3W4vyZrgdhhjBKkomt9jMJmZsVQEdA+yS8fBzbxThoUGGtlMg2AfoOTdTgEiHkg=
X-Gm-Gg: Acq92OEIOpndkGNdekRVpob4z/eStfSCONdh9VHpbw87h6odyRLrv4FiVNnkdmHN/eE
 QlzY8QCV+zfHayQ/XFGDadpQGo/DvpP8E/acmMzLbs2HyyPSHUhBpx2Vnol/bDehKYRSOuG0Xvj
 rjnxcuItL1HQs5dB0F5bKBKxeswpkTBYi8kMD0yWziAOKTYI7lS485H4gDwRbRpjSgzXCOhFdDM
 6ZJmD9Y4a4nmxcUXo6oH6IwjRB7IVfbdGd0iH1vBoO4aAMmjH23s2lRIwRzKsOcuxedyy5+7Dzh
 7NtCypQBS6fCCF/mc+HCRNbBoZH50OyWCD0ScI9q3HGj6GNQ0oHfZyJLmXHAbFQ5CAnfVsfJDCI
 NAbM0k+0veXTCX9U+SK8s29PtaGiecXybNPuU6NsWUPXIrtpMaUTE9Qg3Wjnf1FVtBrC0pmBJu3
 PEnhQ7W392Ero0K260BdQLTPutCw==
X-Received: by 2002:a05:600c:41c7:b0:488:a502:8955 with SMTP id
 5b1f17b1804b1-48fd6325dc2mr20118035e9.4.1778742313527; 
 Thu, 14 May 2026 00:05:13 -0700 (PDT)
Received: from archlinux ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767d0bsm4041073f8f.3.2026.05.14.00.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 00:05:13 -0700 (PDT)
Date: Thu, 14 May 2026 09:05:12 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <ugda72734f6vn67jp6cz6hpkif55a5m4yey3yo2dswicqbyrdx@zk4lhc7k4dxu>
Mail-Followup-To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
 Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-3-fcdae50cf51a@baylibre.com>
 <734e2323-78dc-43c7-b5fc-0a35cc72e035@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <734e2323-78dc-43c7-b5fc-0a35cc72e035@linux-m68k.org>
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 03/11] m68k: mcf5441x: setup DAC clock
 name as per driver name
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
X-Rspamd-Queue-Id: E64E353EAF2
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
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:andy@kernel.org,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.356];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,vger.kernel.org,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,lists.infradead.org,gmail.com,uclinux.org,baylibre.com,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email]
X-Rspamd-Action: no action

Hi Greg,

On 14.05.2026 11:27, Greg Ungerer wrote:
> Hi Angelo,
> 
> On 13/5/26 19:14, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > Later in this patchset, the mcf54415 DAC driver is added.
> > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > DACs (mcf54415/6/7/8).
> > 
> > So updating DAC clock names to bind with proper driver name.
> 
> I am not sure I like naming the clocks here with a prefix for the
> specific SoC part number this is in. It might be unlikely now, but
> what if another ColdFire family SoC member uses this same hardware block?
> That is very common amongst other hardware blocks within the ColdFire
> family. Can we come up with a name more specific to just this type
> of DAC hardware block?
> 

from a brief study, this 12bit DAC, and DAC module in general, is only on
this mcf45441x family. There are some ColdFire with ADC only, as those
mcf5249/53/82. 
The mcf51mm/ag/je are the opnly to have a 5bit dacs, but these are mcus.
So, if i don't miss any existing model, the name may be correct,
unless we want rename it to a more generic mcf_dac.

> Regards
> Greg
> 
> 

Regards,
angelo
> 
> 
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> >   arch/m68k/coldfire/m5441x.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> > index 5b5e09ecf487..b724d7fc1a08 100644
> > --- a/arch/m68k/coldfire/m5441x.c
> > +++ b/arch/m68k/coldfire/m5441x.c
> > @@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
> >   DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
> >   DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
> >   DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
> > -DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
> > -DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
> > +DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
> > +DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
> >   DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
> >   DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
> >   DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
> > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> >   	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> >   	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> >   	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > -	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > -	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > +	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > +	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
> >   	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> >   	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> >   	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
> > 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
