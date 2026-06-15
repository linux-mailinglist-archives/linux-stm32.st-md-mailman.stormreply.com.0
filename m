Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cROVM/vfL2pCIQUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 13:20:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F363685AE1
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 13:20:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=NoFvce5H;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none;
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 164D0C030CD;
	Mon, 15 Jun 2026 11:20:27 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 311B9C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 11:20:24 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-beb1bee8c16so351693466b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 04:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781522424; cv=none;
 d=google.com; s=arc-20240605;
 b=WNrJDnG0fhYnjqFLVyqa9eB+nBCmIuQdhxDoJDIJDUhsn2j6Oq8thmHTUJNjoqia/n
 QoHeWPMsrGZO94DdaLm8QbMmCZ2H4qWujbTNn+R2U5+jQJZgmOgV2H63SIJXQErnJdHv
 HT7yvjczj5uevVqhPOgkPzSnrSPxeihfyYka27shrJrZTdt7Ei6sqGZJd5db/quhHRP3
 28aXk6Gb2HwHeSi5eKqkhl6a0ethR8jZXEvzcH069nhLHc2hvvxQpoaPi+3fwyz0zQO5
 xsJTEwBF6Kg11nwgQl9TMLH2DPOZVLncP90x+6zWkFaDBwQ6R9qWFJL5rkIZUkhymn9j
 2FEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:dkim-signature;
 bh=6mqHKqlBvXA+4paxQcgIh7H4kij3XKYmw9YFuF/cKw8=;
 fh=jqPt27uSDiZx10wGI1ewhfJs/P5Iw3rH84aCQW+tur0=;
 b=fT93G4j4f3YMb0XuDobVYLs36XwGXrOCeo9QJqPIySHneb4uMIovTRgl3a1020lKzm
 ia4vps9C1yCQZgWzlp2VofSIjX75ixMgGWIdG8J/txxWlW9cj1SL1cNakhxkRkiv/L9G
 pOEjWk+o1FWj8ybKkHlhBDiE828ArE16PtvrhumAUgEt0GGdqzzGBa40vQJZj4YinAou
 5ZMSETRbgyP3pkyklNgeRp9m4GysQQYWLJjAOqpwTw3C1b4YF2IGZiUTdt22vBD9AhHp
 Z190fanKlQH4FbbCmg8aujVGaLVvFThoUoHmuP6Nk2oy6sEmbeu2TiO0XjpoApePuRPM
 Ck7Q==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1781522424; x=1782127224;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6mqHKqlBvXA+4paxQcgIh7H4kij3XKYmw9YFuF/cKw8=;
 b=NoFvce5HoqHJ4F/ipfungZJrl/p+8Uk7PE8tOH1RptyBtxpPjp2DqjNctScLcJBpzd
 ufwowciv9SDPFhHASKDreZKdPiUJiwIejcFR/yFihe4Cy79Rv1nrdmpWQlr2yEbuDCd4
 c1HsptgbkNhGJaABx63fXi9y1cvGM7FoFgY+UggU7e2r0oUeGz8XZKzgUhy75gbLHtyC
 paAC58LjS5yCkTSBUvkPR7ksOHIkYKgQHu60sWBy6ZZRFGfpty/Dgu67/sZ3P+4Gdjxw
 WtggoL1NbxuDlLl9GxJ60fePhWa8ZjhWk75FuCew1L2gcymo/QRMlhQ68lFUsrWnsrbX
 5XpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781522424; x=1782127224;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6mqHKqlBvXA+4paxQcgIh7H4kij3XKYmw9YFuF/cKw8=;
 b=IypX620n7zfgkZNwoWB0YdCsoKoBeXzaspHnP2wmltIDkZTCllWDdqXv8fLR3bjkdq
 ly19XwKK14kCI+71uBULIv7uo0o6ul4paK1UToH3toaBJ9E3hHvtdXbyNZBGw4QFrhjl
 Y57+xPj33Jhe38oRcHU/D3X77psIkrgluMt1a4kblotrpXAsJTGY6mDjvqOMLMuHAukl
 OjGENcDVijyxj0bIEAz7kptts6ztj2vJ+4HexBIZOjkgnd1gwRCJJwiQJG7LP6Qg/lUA
 pFUcd04f+o9guuNXLFb5FeTgTjuh6lsF/q4M3/iSt3rkoTfP3iEZ2h9y/5FVA2jSweeJ
 NswA==
X-Forwarded-Encrypted: i=1;
 AFNElJ//f8QPib84VdmOlsrU99Y908/q7nkWqynnpCCBEZFO1mxBKKtyescsTkQrLEbwu2ofnRC/xW+EeH8FxA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyt2rvNoezK713ZiKb13v4ylc/mQMjEHSUqw4Rr07+RevquvSgE
 ZBINLS+ZjtQQNhqAioKgQUk5RFJsQoS8uIF5Bmm6WUXhkMjySpV2C+GfN2d6dl48e400ZNnCb+x
 HCbWOlBfYkejnLuxXVdS+v1AOnDsO5adjF3vqre6LEg==
X-Gm-Gg: Acq92OFRAutoqhg7OFmAmFA68Ek2dWfjoa3oyuOPrsQ8ZU151iY1U5DIrWFL/Yrqi66
 5WxNSmvN9w1tsizLcRDypLuQwKNpX9/83qj8XBrlA/hxRSdq7Egjcia6t/19WPqxHSK/zC2iSBj
 prLthB+eSrPon+UGvgiedXQjLHmZEgihZ+AYv8biMRP1f5WKKqLZb9P7BdCal8Uap++yETPsJVZ
 g1MEQQv3D22dZpi2TLgEYEA4nIexLY4cwLQUVMbh6xPvEYMRZo8c2TMuZzLDAcvPxk7EKgHghxe
 aaCHox3HNghlYKOis2dWAu2nZn6Dp/CHz9sX
X-Received: by 2002:a17:907:7342:b0:bf2:6d61:3268 with SMTP id
 a640c23a62f3a-bfe2a713a05mr372243766b.23.1781522424173; Mon, 15 Jun 2026
 04:20:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 20:20:21 +0900
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 20:20:21 +0900
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Jonathan Cameron <jic23@kernel.org>, 
 Angelo Dureghello <adureghello@baylibre.com>,
 Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 David Lechner <dlechner@baylibre.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney@redhat.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
 <20260610-wip-stmark2-dac-v5-9-b76b83366d5c@baylibre.com>
 <20260611114800.009d9797@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20260611114800.009d9797@jic23-huawei>
Date: Mon, 15 Jun 2026 20:20:21 +0900
X-Gm-Features: AVVi8CcVAgC1MKZdgPIabfG_bEsJqD-RTAVk9pERfc6y7h_8h9norD6F9V9jiEU
Message-ID: <CALSJ-wC9Rsq6WJ_=X87R74jPrg2Y+=L8m0wRRp=1zvN5vSOw6A@mail.gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
 Angelo Dureghello <adureghello@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Brian Masney <bmasney@redhat.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
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
X-Spamd-Result: default: False [4.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:andy@kernel.org,m:adureghello@baylibre.com,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mturquette@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:bmasney@redhat.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:sboyd@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,redhat.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,gmail.com,uclinux.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sashiko.dev:url,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F363685AE1

Hi Jonathan,

On Thu, Jun 11, 2026 at 11:48:00AM +0100, Jonathan Cameron wrote:
> On Wed, 10 Jun 2026 22:35:14 +0200
> Angelo Dureghello <adureghello@baylibre.com> wrote:
>
> > From: Angelo Dureghello <adureghello@baylibre.com>
> >
> > Add basic version of mcf54415 DAC driver. DAC is embedded in the SoC and
> > DAC configuration registers are mapped in the internal IO address space.
> >
> > The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> > analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> > consists of a conversion unit, an output amplifier, and the associated
> > digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> > are respectively 0 and 0xfff, left untouched in this initial version.
> >
> > This initial version of the driver is minimalistic, "output raw" only, to
> > be extended in the future. DMA and external sync are disabled, default mode
> > is high speed, default format is right-justified 12-bit on 16-bit word.
> >
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> I'm lazy so didn't check earlier versions but assume the two bits
> of feedback from Sashiko are false positives:
> https://sashiko.dev/#/patchset/20260610-wip-stmark2-dac-v5-0-b76b83366d5c%40baylibre.com
>
> The one about clock underflow if resume fails, and then devm cleanup happens later
> is a bit nasty.
>
> I did a bit of digging and maybe it is better to just leave the clock on?
> The status dev.power.is_suspended is set to false whether or not resume succeeded
> and I believe a following suspend will not take into account that resume failed.
>
> I'm not set up to poke the combinations but it might be worth trying that.
> +CC common clk people who may immediately know what the right answer is.
>

was about testing this, there are no bus faults on read/write of registers
with clock disabled, nor warnings in dmesg on double disable.

Anyway, i see now from arch Kconfig that is not possible to have CONFIG_PM
for this specifig CPU (with MMU, PM is force-disabled), so would remove pm_ops.
Ok ?

Will fix all other things you pointyed out in v6.

> Otherwise just a few minor style comments inline.
>
> Thanks,
>
> Jonathan
>

thanks,
regards,
angelo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
