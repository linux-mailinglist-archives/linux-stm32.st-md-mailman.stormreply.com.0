Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJZjIvOrCWookgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 13:52:19 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D95560D6D
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 13:52:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA7B9C8F281;
	Sun, 17 May 2026 11:52:14 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3951C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 11:52:13 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-9116861f004so378982885a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 04:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779018733; x=1779623533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4DebYSPXyMA12y92kZcA8rAKkRRULfngBHwuM5CKJDc=;
 b=jtd+q+vrDKtuxeWjyMUofi+p1N3hp3LBogfXuBT7iPsBWYbQL4jPkRcoT40o454mVv
 Nksq7CNYc2u094JhTTnv4Tii9sg+bsXkeco5x+Sj/gCPTzdM3ndMO+pHjrmTuNLZpQ3K
 AV3kOqdLMKJJiIaofVEkBqR86Gk/v2DoZ4jAR3hz2PCf370xVAYJmZLx9bNugVeppTGR
 yBYzZ6/oMRnAeySg6GS8s430qL0axWHcHdoo3u8VcDJv4W1dbTY9AZStZZQunr08Ly1c
 YUbhDpMwhZD3oLLTfbImQEcsKDsp91mqR7XZcuhQ7QvrYOr7TAPAylzJ7JPGy7/+CCrz
 vYKA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/cH4myM3UK0EwWnWSrLQh93ckJ054ClUZNmFvCQLb+OzbjpFaaE+Z/dK/bB9TAPO0kTjGPGDv8J47yXg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx7aC2/SwGX47CqkZWmqwS2q7MX93+fVRdrbO1VegNiduBkyhLs
 tZB9mNz6SxuA0ErM6opHjwfPZMDhLWXn1bk6vefwEntzRb8f3T0l15folGJHMd5c
X-Gm-Gg: Acq92OG3oxSi0ew+jCgAQ4+cQBcmCoogFn5hFWM2JQwGdGB/Ar2fGYFK7lJOU5e0cmO
 6ng+u7Uo1ijD5TenyMVeuJEzf2aqOM1ovJiT1+Vn0NT34/+PbRC/lH0nTU9cKtbhwMuPRY+CpfH
 Md1F6zPASkVNgy4hyZ+V+6tt7t9jcrRDxfrMWoh0qGHdpHkNWdcm7HR6Cf0z6gfUA1RCf+NasKo
 8bVc40m4/ZR1oS7A2rW7nLk4tO77K1d0p9tHIr2FlpKFMFkrO4g7AaSJIty2n/wyWg7gZHIm3pX
 HCurrQoPqHJHdce9zkTAqDWUCIxNl50RTt5Ujn70zc2WJs9C3fGeQv8vT6cL8rtXhLLJrHgkorH
 NT3SF1SPke8+3Z1madXc+kgJF4g90//JtD8iI0spoeH/fHQ56UNRxunU4J45eE7Yyr8EStpnemo
 k9ni6rIy2KnZbWh1+9wmtmuQOo6IYTYycYiIJ4daEMExJ2d82sOzXW/1hQCyrBONGD
X-Received: by 2002:a05:620a:d8a:b0:913:e5bb:3db6 with SMTP id
 af79cd13be357-913e5bb548amr225432885a.31.1779018732523; 
 Sun, 17 May 2026 04:52:12 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com.
 [209.85.222.182]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-910ba36d137sm1145214185a.1.2026.05.17.04.52.12
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2026 04:52:12 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-90ea08cc5ceso288556985a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 04:52:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/zuc+ikG2/lQA1EdtVmur0q8wA8/pNBQ97Vqcdh1urPYPLT+TixemCYj6jCCKCuY6dDXkHmEzL3fFALA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:1499:b0:632:1e2f:3a6f with SMTP id
 ada2fe7eead31-63a3f588eb4mr5593907137.24.1779018356258; Sun, 17 May 2026
 04:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <CALSJ-wAqFni+OwSUcQS+KESfe7SbWMxc0aCURHtTZ93Rx6GZhw@mail.gmail.com>
In-Reply-To: <CALSJ-wAqFni+OwSUcQS+KESfe7SbWMxc0aCURHtTZ93Rx6GZhw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 17 May 2026 13:45:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMvoODD4huxqPb+Hj6Rdid1cSgvzuJdqvg_hRzviyFuA@mail.gmail.com>
X-Gm-Features: AVHnY4LH2SV9naipvvuNwFBNfxwbLJEv_dNs2guuBciejeAs6rBKW5zfskaYVQw
Message-ID: <CAMuHMdUMvoODD4huxqPb+Hj6Rdid1cSgvzuJdqvg_hRzviyFuA@mail.gmail.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Cameron <jic23@kernel.org>
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
X-Rspamd-Queue-Id: 53D95560D6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,lists.infradead.org,gmail.com,uclinux.org,baylibre.com,linux-m68k.org];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:adureghello@baylibre.com,m:andy@kernel.org,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.856];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,baylibre.com:email,mail.gmail.com:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

Hi Angelo,

There's something wrong with "Mail-Followup-To:", which lists everyone,
except for you...

On Sun, 17 May 2026 at 11:11, Angelo Dureghello
<adureghello@baylibre.com> wrote:
> jfyi, for some reason i was not in to/cc, but i could grab the message
> in lore.

Might be related...

> On Thu, May 14, 2026 at 10:54:32PM +1000, Greg Ungerer wrote:
> > On 14/5/26 17:05, Angelo Dureghello wrote:
> > > On 14.05.2026 11:27, Greg Ungerer wrote:
> > > > On 13/5/26 19:14, Angelo Dureghello wrote:
> > > > > From: Angelo Dureghello <adureghello@baylibre.com>
> > > > >
> > > > > Later in this patchset, the mcf54415 DAC driver is added.
> > > > > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > > > > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > > > > DACs (mcf54415/6/7/8).
> > > > >
> > > > > So updating DAC clock names to bind with proper driver name.
> > > >
> > > > I am not sure I like naming the clocks here with a prefix for the
> > > > specific SoC part number this is in. It might be unlikely now, but
> > > > what if another ColdFire family SoC member uses this same hardware block?
> > > > That is very common amongst other hardware blocks within the ColdFire
> > > > family. Can we come up with a name more specific to just this type
> > > > of DAC hardware block?
> > > >
> > >
> > > from a brief study, this 12bit DAC, and DAC module in general, is only on
> > > this mcf45441x family. There are some ColdFire with ADC only, as those
> > > mcf5249/53/82.
> > > The mcf51mm/ag/je are the opnly to have a 5bit dacs, but these are mcus.
> > > So, if i don't miss any existing model, the name may be correct,
> > > unless we want rename it to a more generic mcf_dac.
> >
> > Yes, I would suggest just leaving it as is, "mcfdac".
> > That is not currently used by any other ColdFire variants supported by
> > the kernel.
> >
>
> Ok, will fix this in a v3, just asking confirmation on the name to
> Jonathan and all, since it involves iio too.
>
> Chaches are:
> mcfdac
> mcf-dac  or mcf_dac (we have drivers as vf610_dac and cio-dac)

The clock names in arch/m68k/coldfire/m5441x.c are the names as
specified by the producer side, not by the consumer side.

> > > > > --- a/arch/m68k/coldfire/m5441x.c
> > > > > +++ b/arch/m68k/coldfire/m5441x.c
> > > > > @@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
> > > > >    DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
> > > > >    DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
> > > > >    DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
> > > > > -DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
> > > > > -DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
> > > > > +DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
> > > > > +DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
> > > > >    DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
> > > > >    DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
> > > > >    DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
> > > > > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> > > > >         CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> > > > >         CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> > > > >         CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > > > > -       CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > > > > -       CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > > > > +       CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > > > > +       CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
> > > > >         CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> > > > >         CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> > > > >         CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
