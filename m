Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE9HLT6ICWqVeAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 11:19:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C15F56037B
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 11:19:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6551FC8F281;
	Sun, 17 May 2026 09:11:37 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F060C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 09:11:35 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-bcc9fdc959cso271277866b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 02:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779009095; cv=none;
 d=google.com; s=arc-20240605;
 b=kzsswHt/S5vDjk2fJEL8Tmbf8ugtTbSxqCwvf+dUUdPqfRHfzsMUzlIzwOpsMqhpYd
 9biNCONRQc1YDdEBZk0OwY4Vszfjsg1+LUqQ9M+Zkm/NeX3snP1RycsKk6Da/9it9fJH
 vMf25eUV065XVcTKz6voI2Hdy1AcfIzhfX27ZwXVNZYs4fUrpsSwF3BSOUZlleDquB11
 iqewNXRCKDPOfS5Y5EbW8KzHgcfaXL3L8wGoBOo3HjbLkSeik9+m5914emlrlOqZmgZi
 4t9Tu9usOG8voARigFloZzRhvVANKmAkNb1X1jmH3WoyKDZ7zM0M/319Es4z1y7GQ6Wf
 kcdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:mime-version:mail-followup-to:from
 :dkim-signature;
 bh=l422bOv2RS6ft7h5IAvQA7ommw1CO4QZZ8y5UOnu3r4=;
 fh=MG1l49MKoBrfCOzOnIZpDLgDOtnHfd7gAU0MvzBoZvA=;
 b=jaDjaBkUmMFYQ9yx4uUJvKQITtTPxbD3tXp3dPUPWJNmoLMBVSJZ/hIjuKRu1HfAF2
 obMKG8RypCjSgir+DnBHr6qz35iGxNA27O/X5DjCElDsfT8Sq5wHnGHbtzVxwkLXkDCC
 T7n8NVwtxXdQMC8Fxq0hleMBKcxlxC1R9q60qiq1+qwa5obvh6VcBLAGoy0uvgqARXfo
 NOMSjkziqLNdXh3kciGTji40pVyXjkfp/jUaybQggQBNy1Nj25U+NnqD1Az0SUC/+q41
 YnRApYuuxgVCMnkXcjEfzzYqdElOs/nvVH6ZJU90fH57dJH3d9vkuIhQk+WTTy9htMyY
 3OaQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779009095; x=1779613895;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:mime-version:mail-followup-to:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l422bOv2RS6ft7h5IAvQA7ommw1CO4QZZ8y5UOnu3r4=;
 b=bQOnhEwci0ewdJoYj9Yw1VApMzjVpyRyYQEJoIohvYCtJvl1dbylnfxhQk0MO4FdPu
 M5NMe8WM+rrgNdBMQwj23JuFPtqxV10CU2y00spFkjFnQBpyuuM3r8ky2tsQzTnm3pUs
 i6oeK0Tiol1Q3lcZJ7hiiu6wIlIM5mjy3WgN4ZSqIdC84Dg40vrDwA+sWlcPXIYo6KlU
 Erm8YpJNNvRBEwJYDso7feg58X701+cPMQxEBryxopypqNIdQbue+iE9pVY1XiztiRJI
 BhLQ7sk1FDSm+jAS+G2bRfjFTflTauk8g/QroKEY/thdQNrNUnkTaQOjpDHnEyfcdK0r
 EuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779009095; x=1779613895;
 h=cc:to:subject:message-id:date:mime-version:mail-followup-to:from
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l422bOv2RS6ft7h5IAvQA7ommw1CO4QZZ8y5UOnu3r4=;
 b=GY3y86M6gJnR1Fjya+lp9Ffgocl6oWLK5NZyBs+1H853UZA1I+h2UBKG17rkd3VOZI
 P+bMSdY0BycmrPc9dzIXSL8X9crU3qX9C5WEhw3mnLNpxKsei52/US4dfcWfZrpEBAlQ
 ZPzYQfdIR1X5FAKcYux/qtHkEabnFcggFVaKy8/3sVVrHM2uTXuuT6G/w1GTmFvvIRXh
 GKVat3ZZj9usKAn/NJeXGnbRonJcffFAh/aBMa9ov36gNE6KyvbT6Eq71piC+BPEAsBZ
 zNSGnHvPBT55SumhXUMzjJxXQaIjicUrrQPfOqfhB9sUpcsW/lXZv7N+mT2OkNru3oh6
 9AOQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+XDnh6aSExR4OUeOBiyHsOK6EvU5Xh1OUY9oqDF3QgihH4WxJ+ksGdTPBKXU5aqsVxJEvk78iv7N2eLg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyyTX4u/tE9PurV8I79DL5jOcp/EwwrurvxeyzdVrAiY4eRO58J
 JBb8Nfqom/Pz4BVZitJUY5+HwXjGKehIa4sPZK+zicmRQwfJ0/sRM18f6Fq6at7XP0K1YSs12Hj
 fB+ycQ6ohC3wRfs64M/5I2zs9Bm4rgc/xMeQfhATkdg==
X-Gm-Gg: Acq92OE8AJpkPcQV1/K1Yvr94+vAs1t++DPitJceNygwoWWECfHlauB/LgzWxQyssr0
 7kOmAx7SM0rKNSz1+nE8xPH6F/AZppmfymu/VpehZUEnIYtYKTzSUhcXXq+2mnxM7iB7qFEgtV/
 pZ2p8wiJATj3qQB5SWRThfT3Np5tCb/Hvzv9WW2K1Zk6ZVWY0VrKp7dQ9WfG0vtdNezKjklE3W/
 JGdTkQ1g3NPPIqhvQy649uRll83LFvZNNHFH56xLtGilDPiVlcCPJ1Q4fxS71Tu+jrIN3fMLx6z
 lU3ZyZhckSgmCP2VmhrmEyG1UM0ht5X7TUk+
X-Received: by 2002:a17:906:ee83:b0:bd4:d6d6:b4bc with SMTP id
 a640c23a62f3a-bd517909091mr528852666b.27.1779009094955; Sun, 17 May 2026
 02:11:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 02:11:33 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 02:11:33 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
MIME-Version: 1.0
Date: Sun, 17 May 2026 02:11:33 -0700
X-Gm-Features: AVHnY4LQJhW2f1YyqOOc8oHDFb0_rhPBBBuqz4UdC8WHi2UPdjOoJsNG-CwUBBU
Message-ID: <CALSJ-wAqFni+OwSUcQS+KESfe7SbWMxc0aCURHtTZ93Rx6GZhw@mail.gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
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
X-Rspamd-Queue-Id: 5C15F56037B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FAKE_REPLY(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:andy@kernel.org,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,body];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,vger.kernel.org,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,lists.infradead.org,gmail.com,uclinux.org,baylibre.com,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.822];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,baylibre.com:email]
X-Rspamd-Action: no action

Hi Greg,

jfyi, for some reason i was not in to/cc, but i could grab the message
in lore.

On Thu, May 14, 2026 at 10:54:32PM +1000, Greg Ungerer wrote:
> Hi Angelo,
>
> On 14/5/26 17:05, Angelo Dureghello wrote:
> > Hi Greg,
> >
> > On 14.05.2026 11:27, Greg Ungerer wrote:
> > > Hi Angelo,
> > >
> > > On 13/5/26 19:14, Angelo Dureghello wrote:
> > > > From: Angelo Dureghello <adureghello@baylibre.com>
> > > >
> > > > Later in this patchset, the mcf54415 DAC driver is added.
> > > > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > > > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > > > DACs (mcf54415/6/7/8).
> > > >
> > > > So updating DAC clock names to bind with proper driver name.
> > >
> > > I am not sure I like naming the clocks here with a prefix for the
> > > specific SoC part number this is in. It might be unlikely now, but
> > > what if another ColdFire family SoC member uses this same hardware block?
> > > That is very common amongst other hardware blocks within the ColdFire
> > > family. Can we come up with a name more specific to just this type
> > > of DAC hardware block?
> > >
> >
> > from a brief study, this 12bit DAC, and DAC module in general, is only on
> > this mcf45441x family. There are some ColdFire with ADC only, as those
> > mcf5249/53/82.
> > The mcf51mm/ag/je are the opnly to have a 5bit dacs, but these are mcus.
> > So, if i don't miss any existing model, the name may be correct,
> > unless we want rename it to a more generic mcf_dac.
>
> Yes, I would suggest just leaving it as is, "mcfdac".
> That is not currently used by any other ColdFire variants supported by
> the kernel.
>

Ok, will fix this in a v3, just asking confirmation on the name to
Jonathan and all, since it involves iio too.

Chaches are:
mcfdac
mcf-dac  or mcf_dac (we have drivers as vf610_dac and cio-dac)

Regards,
angelo

> Regards
> Greg
>
>



>
> > > Regards
> > > Greg
> > >
> > >
> >
> > Regards,
> > angelo
> > >
> > >
> > > > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > > > ---
> > > >    arch/m68k/coldfire/m5441x.c | 8 ++++----
> > > >    1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> > > > index 5b5e09ecf487..b724d7fc1a08 100644
> > > > --- a/arch/m68k/coldfire/m5441x.c
> > > > +++ b/arch/m68k/coldfire/m5441x.c
> > > > @@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
> > > >    DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
> > > >    DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
> > > >    DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
> > > > -DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
> > > > -DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
> > > > +DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
> > > > +DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
> > > >    DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
> > > >    DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
> > > >    DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
> > > > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> > > >    	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> > > >    	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> > > >    	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > > > -	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > > > -	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > > > +	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > > > +	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
> > > >    	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> > > >    	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> > > >    	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
> > > >
> > >
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
