Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yALuLXD5CWrivgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 19:22:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 494FB5627BC
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 19:22:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEF9BC87EDD;
	Sun, 17 May 2026 17:22:55 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88FB0C87ED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 17:22:55 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-bb91b426e40so323352766b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 10:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779038575; cv=none;
 d=google.com; s=arc-20240605;
 b=FIaCuHqtQtNreWVv7O+0lOnrELz9ljWgGI8RHjpuR4PUuAXLlyeMijPEpziiHqPlqS
 CpxiXMlUwxaJME8rkdyp6ljOQ0NF+Lc2ruMjLd10vpVtf5GNz4T9ibEcI+FIvwW/d/8o
 rcksppdGUx8q5y6LGKfRyq3ZlJ4BnR1MsykjWgQFEe9+kNjo22t2v4NnfRAHhc5kbi+V
 2Pz1dh9ue3qnmVy/qzi0Y8eEPzRI2apGeNS0XgCIZWN+ykYySDcBFfzCVsHRgFaDGPUj
 2nacQH8f1HvKkVfvWmpV4CUwrul6u2gmg7Kf6bKeMc8qx9PcsjaZeCkQf4fS0dh42j/e
 wpIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:dkim-signature;
 bh=BLmdCKMgbw8MBhwcDBHMbfL3wvck7U926c1rh+9BXmI=;
 fh=iRjveeiTTl4KC3OqJOy9MeWUM2oazy8JD/33VAgr8H0=;
 b=Alt4bxWW8F592YL5AhWA/mMYCN1g/t9Tfy0/RLqjJPK7D6/UfrE2AHi/oKrxvR57u/
 POpN9xpHSSt7S8RUpJkzC4X1Jb0p2he+rQj2oMnCgg8csUPp7S3BiU2lve5YpjaD/uxC
 wc6TZyj/Hv5lQbqaoO686xa4FUvTCpW9a8h4LX+KcRAfObfCcjeM425FGiJ1N9u4xSbf
 M+ijw319bRvZ3oudRJ7cQRWtcjcBlr9AobC8mCT5tqwMXT+BT3cXseGo9YGq6SBQI3ZO
 4gPYfjV785u/lyfhcOhKSZ3/nT9YtKwsQOxKrX4xYG3kkKwjfD/CdHZki5/j1DQWQi/h
 FxKw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779038575; x=1779643375;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BLmdCKMgbw8MBhwcDBHMbfL3wvck7U926c1rh+9BXmI=;
 b=hEGos+UWK5ehJChdIYO/xCIZViDx9/Sly133SQwcI/JwOtXVUxZA5N+ARqoJDU1cv8
 B47w4LYakuSLdwF5g2AJSjv04RtqoY/fTHT2YLnwXkwOZ8dAY2ZDXF+svHXz9NbZsWI/
 xSKTkgrVngOUJ5/PQ3lzPl7OFUeMjmwH7kUhdTlYEbE5rABpDS1BNXKdYFbqV9SaLjhe
 BHAEzXdFmaah5AGOpsNtK5A4Qs6JYzuNMw0uPIk0u/SgnxT14jz5bzvUcEEdFd+6d3uU
 Ecc4QwR7Ce0Qd3k37l0HGERWnh5YWTIdHR8O1W1LAw9PPspPASxCwqEoF5UmLQLV28u7
 UVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779038575; x=1779643375;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BLmdCKMgbw8MBhwcDBHMbfL3wvck7U926c1rh+9BXmI=;
 b=LXY9Kfv9w0ztby/Hvo7VXp3VHs25DTKGNNHIcuzZN5veP6gtvmMwwND0Qi2+xuu8+0
 8nxJI5BCSHmneveF+EH44YX3+65Fb30p5Ol3f7RABkiIlLELF6VL5PuJG0MA3nHDZqi3
 Qpdn3hwlkvb0YizQyS8PiOIuCR1eKYKctnB0OHWlARcB3jm9bB9O9ZBNDHOCG+ubT1fb
 jDIDmIhhT4bKOGoKfyJT9rxPrIuCA3BJY7l7s3tgMwwaGaoGfE0FCf6Y5gDs+nskOip4
 /SnlGIF8jbL7c0TRqugpIZSYi6LYuY0RRVY/zieMt6rnZqSQN5HtOzkUZtCJCdtEjzHQ
 SkAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/FVl6ryvjfMSY3fyWBBcR6wGqWV9ZBJKv+jioOmE7YkWEx51j/6cCGAbuqgpir1PgCK1WST6k1WXhMHA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwF8EzCP0IOYS91CIND5mFl+VyJMtvJYzVkfqJTAgVCXzP8i/wt
 97q37JfSfULKeYZJML90jR74MfQ9/uYWrXGggSEffLEQ9OIi6E7EPcp8/UnNE6v9tT33grkbt8f
 xBDla1UWFpLp5USaBo1NbE2ZcyVaG2I4Nv33auRrn+Q==
X-Gm-Gg: Acq92OFtaYiLtoYbFU18h0L9FsF88jenNgN44bzGSdiAnzTOEc2Aytw8s3+NVJ9ufYM
 5dJDIBr5SJX/UChc+K3WbYJAO0SCO2U9g7FeWX9OySfUQWYnTl3qqcjVXTIxNoPt79r3EwSrWr1
 D1/vdAtr2DwXsRntPxMPahr5ul2n7MU+bL6fLiFmnMivieaOoRH2d7BsKUwyqsbTucDntdJODh2
 m7njBt1f8mUjizZLAcGq6VPslWb/kpE3nv2fCvY/Z3oue4SeE20t1tf3WsJksS1lSwVl9KjcBnu
 RvGd4gIvN7HGDbBGo1MrzsieRcrL4T0Rl74E
X-Received: by 2002:a17:907:94c8:b0:bab:d8e9:53a7 with SMTP id
 a640c23a62f3a-bd5178fa6eemr564439666b.29.1779038574485; Sun, 17 May 2026
 10:22:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 10:22:53 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 10:22:53 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Angelo Dureghello <adureghello@baylibre.com>, Steven King <sfking@fdwdc.com>, 
 Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <CALSJ-wAqFni+OwSUcQS+KESfe7SbWMxc0aCURHtTZ93Rx6GZhw@mail.gmail.com>
 <CAMuHMdUMvoODD4huxqPb+Hj6Rdid1cSgvzuJdqvg_hRzviyFuA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUMvoODD4huxqPb+Hj6Rdid1cSgvzuJdqvg_hRzviyFuA@mail.gmail.com>
Date: Sun, 17 May 2026 10:22:53 -0700
X-Gm-Features: AVHnY4LXmzt2FYulHGvc5U-cYyRCzVXS4ho7o5lb3LZyGzYNxvZblCBbDnNF3UY
Message-ID: <CALSJ-wAX_dBYYzLPOPxKZXQQPFQXhW0Oad6FezdZE2bXWfaBcA@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andy Shevchenko <andy@kernel.org>,
 Angelo Dureghello <adureghello@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
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
X-Rspamd-Queue-Id: 494FB5627BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:andy@kernel.org,m:adureghello@baylibre.com,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,lists.infradead.org,gmail.com,uclinux.org,linux-m68k.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.914];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Hi,

On Sun, May 17, 2026 at 01:45:44PM +0200, Geert Uytterhoeven wrote:
> Hi Angelo,
>
> There's something wrong with "Mail-Followup-To:", which lists everyone,
> except for you...
>
> On Sun, 17 May 2026 at 11:11, Angelo Dureghello
> <adureghello@baylibre.com> wrote:
> > jfyi, for some reason i was not in to/cc, but i could grab the message
> > in lore.
>
> Might be related...
>

yes, imported the raw msg from lore but was not allowed to send from
lieer, so i removed In-Reply-To:, anyway, thread seems back ok now.

> > On Thu, May 14, 2026 at 10:54:32PM +1000, Greg Ungerer wrote:
> > > On 14/5/26 17:05, Angelo Dureghello wrote:
> > > > On 14.05.2026 11:27, Greg Ungerer wrote:
> > > > > On 13/5/26 19:14, Angelo Dureghello wrote:
> > > > > > From: Angelo Dureghello <adureghello@baylibre.com>
> > > > > >
> > > > > > Later in this patchset, the mcf54415 DAC driver is added.
> > > > > > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > > > > > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > > > > > DACs (mcf54415/6/7/8).
> > > > > >
> > > > > > So updating DAC clock names to bind with proper driver name.
> > > > >
> > > > > I am not sure I like naming the clocks here with a prefix for the
> > > > > specific SoC part number this is in. It might be unlikely now, but
> > > > > what if another ColdFire family SoC member uses this same hardware block?
> > > > > That is very common amongst other hardware blocks within the ColdFire
> > > > > family. Can we come up with a name more specific to just this type
> > > > > of DAC hardware block?
> > > > >
> > > >
> > > > from a brief study, this 12bit DAC, and DAC module in general, is only on
> > > > this mcf45441x family. There are some ColdFire with ADC only, as those
> > > > mcf5249/53/82.
> > > > The mcf51mm/ag/je are the opnly to have a 5bit dacs, but these are mcus.
> > > > So, if i don't miss any existing model, the name may be correct,
> > > > unless we want rename it to a more generic mcf_dac.
> > >
> > > Yes, I would suggest just leaving it as is, "mcfdac".
> > > That is not currently used by any other ColdFire variants supported by
> > > the kernel.
> > >
> >
> > Ok, will fix this in a v3, just asking confirmation on the name to
> > Jonathan and all, since it involves iio too.
> >
> > Chaches are:
> > mcfdac
> > mcf-dac  or mcf_dac (we have drivers as vf610_dac and cio-dac)
>
> The clock names in arch/m68k/coldfire/m5441x.c are the names as
> specified by the producer side, not by the consumer side.

yes sorry, i confused DEFINE_CLK with CLKDEV_INIT where the driver name
must be set.

So sure, thanks, fixing clock names back as mcfdac in v3.

>
> > > > > > --- a/arch/m68k/coldfire/m5441x.c
> > > > > > +++ b/arch/m68k/coldfire/m5441x.c
> > > > > > @@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
> > > > > >    DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
> > > > > >    DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
> > > > > >    DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
> > > > > > -DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
> > > > > > -DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
> > > > > > +DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
> > > > > > +DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
> > > > > >    DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
> > > > > >    DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
> > > > > >    DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
> > > > > > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> > > > > >         CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> > > > > >         CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> > > > > >         CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > > > > > -       CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > > > > > -       CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > > > > > +       CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > > > > > +       CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
> > > > > >         CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> > > > > >         CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> > > > > >         CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
>
> Gr{oetje,eeting}s,
>
>                         Geert
>

Regards,
angelo

> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
