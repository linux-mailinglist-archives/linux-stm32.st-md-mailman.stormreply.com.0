Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMmSIbtXHGprNAkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:46:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2941F616F65
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:46:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0693DC8F29C;
	Sun, 31 May 2026 15:37:32 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F84BC8F265
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 15:37:30 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-beb8a08a6c8so129163366b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 08:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780241850; cv=none;
 d=google.com; s=arc-20240605;
 b=iadc3HccUGS8/sKuSBgroV0cfWs/KZF7bwwPkj9FAEAaCC7VyOtpNx0AF/wSU+46/q
 u0vbFq2RkqTEP+yncLoIOMnxUEdRMTZc5IoJoZRXMvscGOH5mj6q88aCbUEgnOVEUFIU
 vGvG76Fy/rDrzoczqSA0hJVZ2uRbH9Y3tc3RO+OrPg+1hJGlsbDNHBdCKn1obavNs7nA
 r5FMz2I3EY8lLsv5AhyMuLZyW0SyaLfKjEXvCa3XAFhhXBMKUNbVHdDLYmtg+Gtbgrzd
 4efE0G87gT+D30vEZWczLia6zmzwd1B8vRl5U/ewRvy9ARq32z+28z9T5E0lNtuBV9Iq
 4ACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:dkim-signature;
 bh=GsUy+RJZPWgLmpycwtIiUI71TrJ5IX3ekRu7ES5q5M0=;
 fh=8YEGMV64xtgjbiSbbVuleCMeOg7zyXd0C3oLvXWqoSw=;
 b=FSsqb94XURi14K3cmaQBUj7NGlQ5z26joCP+FCEw9l7/q9SaXToPJAFRgV9ibrfKrf
 68lIALcx2ABqb3nk85JND2v9VMHMAX1Uh4MOsOOvIUh2nD0LmbM1IDCUrTZ+PhFNT0rL
 WKUFGbnVAB1GS9PL56EM52Ov5FEfi8dtkZA0uvkc70MD0rVCZ4eZxlBzgJ6ukGpIreu2
 XyE0AYzpcp2Lcjck5ArTMf467pdjOC0joqIzZW2V20m5Ha3Mhu+Gpi/Eiz0D0dCajc8P
 Sdq02Tgd8sV0wTzTOjWzDMgk18pTc9/Rdifsl9Uvh18fcbjaXF5cICOVlYEf+YXZn4++
 YbZA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1780241850; x=1780846650;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GsUy+RJZPWgLmpycwtIiUI71TrJ5IX3ekRu7ES5q5M0=;
 b=K7mOv844C3wQwfyNWmv8MRQawv9qdTPT2vC+kNiVWFb3awEqG1D7anGYgNhV20IQGZ
 9KZiyla2DZCvmpGQ5fnjJ07nkyinE/Nw8Xqh7aSBfghXi6Rk6iMYwl6NZwR2LVXaJEYR
 HSXCruAwhi5GqMyOJjXXK6zWG8jLQHwN24yJM65wyQRckIABiw/0UinwcqwxDpeBF+yU
 rZe14unGQpGQZ34r/yEWLsBUk+bGBPiLaKa+M65wx1TtOmbRnOfzTTnWSTQryrQtBoOX
 2oItlOFq2VlN2TnDrZCGN4nGmQlxEk4lCv0TxmUvNXXuUdwrZgG5qjgjXYBA6N2/iZ8X
 bGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241850; x=1780846650;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GsUy+RJZPWgLmpycwtIiUI71TrJ5IX3ekRu7ES5q5M0=;
 b=s3JDjToa3bLmBzYgrXr4UjizwDTK9Bdxet4uWNheestEveVJ3MOBVE3rwz4c11X+k1
 L8vYckPpn8WBsB9BropVz1/954E7LcF+hTY1N2c4kUbYEuqITY6HrUdqwbLpff5VoQc9
 FG1vGDp5OP6mqyRbaevAP5UjUFPeeTiEQUvnbDhfrHL4nYtur/6SAbBat8WV3cEPiu7L
 mHCxPxZ9PkTqpsvKob5yGzv56meo09+15UbpC3n5NH/8rldPB1vG9jdgoQXHGRnpIjY1
 pnUpdPjEFuusOV2DfRpnjxD+qLfGyZw/tW5mdOGtYYCfuv02fy1oN+mQu08ODF6H8ioq
 JoGw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+hGbPO2EDbDx3dfDZnpPacHdk8MwQIxNlskm96YgTvga6DQ20RX9DyTeCc/ctRW4mg+t2fZ0YffV1qyA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzQbXMa9pNruRZcSovz4riFVg82c8nToyJQcX1wJLQ59+QJBMKo
 7cgzISsd6vdbIZpXk4jA6v2Qz3gnphLbddR0kWP2xZE00BVqVDCCGLndbbRr2nWoZdHN3dj/d41
 Opxrczriy2WOzxP1VqvYJpdi/cpeQnWpvZqUfnw37rw==
X-Gm-Gg: Acq92OEcgmCnVvjXZxiOtceRhCeVQX+fF6Uzbx09oCcK0n7O7j04+hLwbuZZ8dJCvaF
 OwskjsKWN04jCL9DuP8LKGe7xSiCMJaDkl/HUY0W8FTmdefZoSiAwfhVxpbyCb86gE9umZiWRq6
 j+HHrANMSeH677yJhJo5Ea3JO4Q0xkOg2753qX7o5Cltb6oMueq6182t0/ZdDjIoRPn2i9+FbR/
 54aQjSV5LGYOHyzEUJSpY1/qQGYR5b53sRtPEnnX2x0dcsyd2kK+HEeuRSITdmfpVpebPrDhY5h
 omGzZN4/ZQ94hrRkFwDOuS7cNd1GHHYT1cIOM10gywMi0cs=
X-Received: by 2002:a17:907:1c0f:b0:bec:228e:26ea with SMTP id
 a640c23a62f3a-bec228e2c86mr154675966b.13.1780241850051; Sun, 31 May 2026
 08:37:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 31 May 2026 08:37:29 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 31 May 2026 08:37:29 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Greg Ungerer <gerg@linux-m68k.org>, 
 Angelo Dureghello <adureghello@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
 <20260522-wip-stmark2-dac-v3-3-16be0ad35a67@baylibre.com>
 <ecf346d5-a65f-4507-b277-40e75ae89442@linux-m68k.org>
MIME-Version: 1.0
In-Reply-To: <ecf346d5-a65f-4507-b277-40e75ae89442@linux-m68k.org>
Date: Sun, 31 May 2026 08:37:29 -0700
X-Gm-Features: AVHnY4KfVAiFLMBLt8OCHtOET5j_xWQ5bRSDD33gmCDJzuWhX0mLUD1pV9Eh9I4
Message-ID: <CALSJ-wAiLgFWStDtymqrysx=4ZFGgY+SjYC+wjiMifVKgW7QoQ@mail.gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Andy Shevchenko <andy@kernel.org>,
 Angelo Dureghello <adureghello@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 03/11] m68k: mcf5441x: initialize DAC
 clocks by iio DAC driver name
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
X-Spamd-Result: default: False [4.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:andy@kernel.org,m:adureghello@baylibre.com,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:dlechner@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,arndb.de,vger.kernel.org,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.976];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,baylibre.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2941F616F65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Greg,

On Sun, May 31, 2026 at 11:15:43PM +1000, Greg Ungerer wrote:
> Hi Angelo,
>
> On 23/5/26 07:20, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> >
> > Later in this patchset, the mcf54415 DAC driver is added.
> > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > DACs (mcf54415/6/7/8).
> >
> > So updating DAC CLKDEDV_INIT with proper driver name.
> >
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> > Changes in v2:
> > - none
> > Changes in v3
> > - roll back clock names as they was originally
> > ---
> >   arch/m68k/coldfire/m5441x.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> > index 5b5e09ecf487..b02ca2eb55a4 100644
> > --- a/arch/m68k/coldfire/m5441x.c
> > +++ b/arch/m68k/coldfire/m5441x.c
> > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> >   	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> >   	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> >   	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > -	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > -	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > +	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > +	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
>
> I thought after the last discussion on this that we would not change these
> clock names?
>

sorry, seems i seen this comment just after sending v4.

As a change i rolled back original names in DEFINE_CLK as they was, "mcfdac".
While i cannot change these names above, from tests i did they must match with
the driver name or driver does not find the clock from his code.

Or am i missing something ?

> Regards
> Greg
>

Regards,
angelo

>
>
> >   	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> >   	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> >   	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
> >
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
