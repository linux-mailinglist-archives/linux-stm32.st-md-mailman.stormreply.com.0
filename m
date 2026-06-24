Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J+53JQfhO2qzeggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2026 15:52:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 221BE6BEDD2
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2026 15:52:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b="S69mW/qd";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none;
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C15EEC57B41;
	Wed, 24 Jun 2026 13:52:06 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D758C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 13:52:05 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c0868ca8738so164758766b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 06:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782309125; cv=none;
 d=google.com; s=arc-20240605;
 b=UkoVUqHyzUGAneLaGTk6FJk5PWz0ERZhNGol3zdsjKiFwklNJf4DJCIXN8b9qwCNcG
 RKxYtFvpPlBmeBEBcHtucp3nGzITKEdms64KKv9dsnrSdTEaGwqH2hNykIdty00gkPO7
 INIpHaEZj0cWfen/WdSPxeJIKa/cD4OsbUj7KjVhj6HPmQXT0aNkf2NyVprLIwZOgB1F
 5ydn5rs3VxZ93uIPar1KF/CBJVITQf2hLp5vhGcNenKSTDSywqfkMACe2KNAyNGezBi4
 dEboSr0WnsX8g0HDAp2/zCDCwM771gPDEW7Kz4cyqhrDW95OTKeVTDBF9Cb1G1YKwkq6
 XZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:dkim-signature;
 bh=JVKkeSAj9cEIT5s5aHGZfnYhC/Asr1gCUKNdYQVD9Y4=;
 fh=qQOAZA5HDI9Odg/8K6nyQftq7TtIeM40NUD7/r8x0iY=;
 b=Zkt9UR2FyZO3NMXVrHV9tXxvatNNGNXTtqSzVdY1v2ySDkq3y2CLViWXm700PawsnQ
 24eIMa2hQY/UyqJRHn45EY/psE6JaGB79h54YmVDecFp/wL7cvRUqrOf+8kFJknkJH0o
 jDi3sItUnRSkKd3stMzCe7S6XG6fjaiTycTsqG6vroeeSGjaEGNrQ/5zw8Kpz2lbYzsW
 +AaDHYv5l/wtea+xSdeGuoWWtK6AIydQrusg2tIRk0Q9mYcw74F8lIKMxFio5MKrRpIA
 PyzL9mJjOwvU6NuwWWQVKvg7nZOTSlBTk+X6PXnQjpTUjFc05AL518sUzVcAo9fG/+ja
 yznQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1782309125; x=1782913925;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JVKkeSAj9cEIT5s5aHGZfnYhC/Asr1gCUKNdYQVD9Y4=;
 b=S69mW/qdbgnUgmgyWiwdsaR8aLiELt0GAvhTwHrhlhTOMy38SA8YZHYrdSskTqD5zx
 PWkLc4sqcd8b0WJ7WXn8g7sGywBKvhhLO3aG5R9VZh4txDYCC/Oi3fA8R2pSFikMctFA
 Lj53RVm2IERSielsM7G54cDXRHSYrQrjayfEWhDisB8eKEbWYnXfwqSs+gzTU/WyJSMx
 5UtZtjf74ZPOmsXrbbu6nyMKRdyZJxPc+ziBqXA1ovUIYKJv9rpgHNhz3EgUeknHUdaz
 D614bsvR8D9kiIxPCx4UgCOV087IjOJ1bZef9QrZzpsCN4WPhkqo7+DU2CgRh4umLPiy
 VIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782309125; x=1782913925;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JVKkeSAj9cEIT5s5aHGZfnYhC/Asr1gCUKNdYQVD9Y4=;
 b=ZBgn750eslo18lQblQMp0vOyVEzi7ZkrWK9UaEyR930LWblx6D70uPgtJqSgk4WNlP
 IicnSsENib0zHDumxvQ20BS8JYAcR0b1gTw6uus1J1TueBlytNSTTjZ5HB32iwMt7L3n
 m0LfO1OxoNRNkhePkfY5ZCeCAIvmN24lBmYbMGwjMnkKcqaWCsa7+YR2sLfHO8H38c21
 YrJOLQzjqV+dKNVP0OZXvRBHEgRn7M3RL/8pP/jhD7hWvz8tV1fNE6XbrhNGRYRfwhLa
 op91pvHUvY7clfAywb0aml9wrqfSBv7a/tPJjknQxG6cE5BoKgQW13JzDqy+ZkM25fiW
 h3sQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Iuzikbk5MXttzF9eLu1FQLjrhd8AtXpL4lYLGOq0iVJdSp959ILerJfVec/TSFDizngVJ02aqo/+1CQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzmOVqR8DQXFd7BA59REi2rYBpqZSrikltlIKK5c76CwVRvQ7YI
 NRXnKw8ApxOvd6BCqWjTXCHu68qBAlQBeVS7Crwc25FChfy6O3KTWvYbGbKkeRfIh88KVxlV/kz
 us1ZaQNtCo296bxJCsURL2jxoZya02BiJet/XPhXVXA==
X-Gm-Gg: AfdE7clAr58Ls2QyKtn+BzurmRz04Q+IkoIVFwLwIqUHk7bYdsC7tYpfkJMP9cF54YM
 L2gDCC3NYFpMrIJtt7EY/SFfSARvWLIesuCNk1OIs3XNXTWwO73e+VRJyyvq8546dlCncg4e813
 YRphNVxQAsNJHIoCqGK71UUhhtQvXyQEgHgo27HyxxH1Pm03tVCvbjRWE9kvutxiNIwyK8i9zBd
 i7APgtkIsDIIiThSxwDWPrj07F45JyaasUJp3CsKAlCTieJyvYpy8R4Yay1oBawFe86pzHp2d4E
 w7Q8DE2ci5KJcyVA7N2b9L5QQg==
X-Received: by 2002:a17:907:60c9:b0:bfe:ed06:5a14 with SMTP id
 a640c23a62f3a-c119f6123b6mr182955966b.50.1782309124805; Wed, 24 Jun 2026
 06:52:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:52:03 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:52:03 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Angelo Dureghello <adureghello@baylibre.com>,
 Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
References: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
 <ajr4LvdPZKHrqDVp@ashevche-desk.local>
MIME-Version: 1.0
In-Reply-To: <ajr4LvdPZKHrqDVp@ashevche-desk.local>
Date: Wed, 24 Jun 2026 06:52:03 -0700
X-Gm-Features: AVVi8Ce0Oz4uWAyICirL9pSge-M3xWIHMYk0X2M6seIbhH3jA-_W8vl1mqu01X8
Message-ID: <CALSJ-wAFwYC38X0VUYYBX_AYsWChpFxDQtQ52KHhbFV2Bm=prg@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v6 0/2] add mcf54415 DAC driver
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nuno.sa@analog.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:dlechner@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,analog.com,lists.linux-m68k.org,linux-m68k.org,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 221BE6BEDD2

Hi Andy,
On Wed, Jun 24, 2026 at 12:18:38AM +0300, Andy Shevchenko wrote:
> On Thu, Jun 18, 2026 at 11:04:14PM +0200, Angelo Dureghello wrote:
> > This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
> > builtin DACs.
> >
> > Currently the driver enables the raw write only. Feature as dma, sync, or
> > format are not supoprted for this version.
> >
> > Additional options suppoerted by the DAC module will be added to the driver
> > later on, as needed.
> >
> > The same patchset prepares the m68k/coldfire architecture to support
> > the driver.
> >
> > Below some basic tests done on stmark2 mcf54415-based board, voltage check
> > on DAC0 and DAC1:
> >
> > ~ # cd /sys/bus/iio/devices/iio:device0/
> > /sys/bus/iio/devices/iio:device0 # ls
> > name               out_voltage_scale  uevent
> > out_voltage_raw    subsystem
> > /sys/bus/iio/devices/iio:device0 # cat name
> > mcf54415
> > /sys/bus/iio/devices/iio:device0 # echo 4095 > out_voltage_raw
> > /sys/bus/iio/devices/iio:device0 # echo 2048 > out_voltage_raw
> > /sys/bus/iio/devices/iio:device0 # echo 4096 > out_voltage_raw
> > sh: write error: Invalid argument
> > /sys/bus/iio/devices/iio:device0 # cat out_voltage_raw
> > 2048
> > /sys/bus/iio/devices/iio:device0 #
> >
> > Same behavior for /sys/bus/iio/devices/iio:device1.
> >
> > Generated a sine wave by shell script, sine shape is good.
>
> Heard a presentation (Embedded Recipes IIRC) where one tried sine and real
> sound (it was about sound DAC) was really awful. So, Can you try a bit more
> sophisticated signal?
>

sure can try some sound with this 12-bit, but don't think is possible now
with only raw output. My idea is with further patches, once ColdFire DMA
is fixed, to extend the driver and be able to sample higher frequencies.

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
