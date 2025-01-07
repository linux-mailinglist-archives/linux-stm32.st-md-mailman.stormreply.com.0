Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C4A0340A
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 01:31:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D69BC78013;
	Tue,  7 Jan 2025 00:31:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99BB7C78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 00:31:06 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso103638155e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jan 2025 16:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736209866; x=1736814666;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=13VUHaFiuc4bXuLa2863YA1rYhMMosunQcKMEn7ZyfQ=;
 b=VFyAufO75EbwNLuU1hu/oT6aAbVhjUOJh0OhPSvEb7rVr3iU1nie9NKvcYX9L8zRlW
 wq7ZIp6ui1+hQJSaLgWGSiK8sX/Q2WncKbtRrjlN9N7szhggX7a1wR3VVfiALf3+1tco
 lj4jopH3HzNDnxLmLtpxIHP4fTvY7HalVkJbNT69H2CBZOKEzEM+5eNOVGBc7N/TjBa3
 Auo6Y9a0l+Y0ZVqaCNo0hp4zj7GcfPXC4MddazK0Y9+8njHSYFAsiLtgCbsWOn48FEFA
 c8Zmxjx9rR1gGFCq1Ac1o7X07YpgZJ8p7V3wdIlid3I8eTqlSMl+U2lr7Hi28qrr5+UB
 OuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736209866; x=1736814666;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=13VUHaFiuc4bXuLa2863YA1rYhMMosunQcKMEn7ZyfQ=;
 b=bxEcr2sfswLk+sjXGaJU/eKVQ64FHrkgqHoTIEuULQC5XIYjXhTYwUpClTEtZkqAl+
 5iMKXvwfMceheBm+fmt3bWo+QHZy/EB2TG0IiBJtasiLeexxToAUMqwjIOXSybikJrlK
 XSnHqreLP/1iWkWq/mJ8b+i0BT1KMxZOH8MFlgGg30ljNLQeF7XfZCINtGyEKqf/5nG2
 AnYjWKM9/0KQqmvqM/FSJtduZQfysILGRwR9U7pco8rBbzfgDZ1jveefGWcLNavJaVcP
 bDkk2Bg4PttvoFHHaXg4Cc4vLdCGadvKZ0+y7SnPaeND+tbj7m6GMsUK5qhXtbKqIENV
 CZjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwu8m40hT0UCeNyoMDYRN4y096BSdaYdSzwmMILbFNjHgQaK4nq6uhzMPjbLvwLH+L2lnXoRX6e49mRw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw0Gfh4gVPG/jUjs9wRffjzs27L/zgpc7BemtlS2O985OQ9WMIF
 5ZQ08ZNCaqVqY0LgZ3f4JB7mk9Hb6rinEFWtONa/J0E+Q/bvf2U2
X-Gm-Gg: ASbGnctjxalWNTT4M1IC6cYlBYmzusjjoTZjFu0cYh9Wi+N2fth2ecNoOwLkFnlfR9O
 ThFtTLInz6IZ+9Bpsy9EvwebXgsUPjyK7k5hgMkk/pJem1SnuMqx77jXADbNswRVni9xb0IyDc7
 oaYppCl7gikfZDTE+TsEm/s+8wVeWQIFjrTlxsbU0Jz4qxDa5J2nnmuic+Qx9es5j7LhyUZ4rKt
 VVB/pDCYOolI92lUYvN7UYD6GzzGS0XVqIDeRdbXPHYwwgh8guMFn1JGNfgX3mMGguPiBvQVfki
 95f52MU3A9iNT0fSZEmyOK5BbA==
X-Google-Smtp-Source: AGHT+IEjONcU9x6JlzHrNOCRfapdijI2K0K3jjBIXQvsC6vlMArfJXHA/sc0RSHKNgKkvauw85ENXQ==
X-Received: by 2002:a5d:6da1:0:b0:386:4a0c:fe17 with SMTP id
 ffacd0b85a97d-38a2220039fmr49166964f8f.27.1736209865801; 
 Mon, 06 Jan 2025 16:31:05 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8471dcsm49320901f8f.48.2025.01.06.16.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 16:31:05 -0800 (PST)
Message-ID: <810af0b9-aa21-4f11-9708-92c870615cc8@gmail.com>
Date: Tue, 7 Jan 2025 01:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mark Brown <broonie@kernel.org>
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
 <eec9caa0-0029-4774-842e-af1d1290ad97@sirena.org.uk>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <eec9caa0-0029-4774-842e-af1d1290ad97@sirena.org.uk>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Niklas Cassel <cassel@kernel.org>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Richard Weinberger <richard@nod.at>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Damien Le Moal <dlemoal@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 0/6] Switch from CONFIG_PM_SLEEP guards to
	pm_sleep_ptr()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpMZSAwNi8wMS8yMDI1IMOgIDE0OjA4LCBNYXJrIEJyb3duIGEgw6ljcml0wqA6Cj4gT24gU3Vu
LCBEZWMgMjksIDIwMjQgYXQgMTI6MzI6MzlBTSArMDEwMCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3
cm90ZToKPj4gUHJldmVudCB0aGUgdXNlIG9mIG1hY3JvcywgYW5kIHJlbHkgaW5zdGVhZCBvbiBr
ZXJuZWwgY29uZmlndXJhdGlvbiBmb3IKPj4gcG93ZXIgbWFuYWdlbWVudC4KPj4KPj4gVGhpcyBz
ZXJpZXMgbWFrZXMgdGhlIHNhbWUgY2hhbmdlIG92ZXIgc2l4IGRpZmZlcmVudCBkcml2ZXJzOgo+
PiB1c2Itc3QtZHdjMywgc2RoY2ktc3QsIHN0LXNwaS1mc20sIGFoY2lfc3QsIHN0aS1kd21hYywg
c3BpLXN0Lgo+IAo+IElzIHRoZXJlIGFueSBhY3R1YWwgaW50ZXJhY3Rpb24gYmV0d2VlbiB0aGVz
ZSBjaGFuZ2VzPyAgSW4gZ2VuZXJhbCB5b3UKPiBzaG91bGRuJ3QgY29tYmluZSBwYXRjaGVzIGZv
ciBtdWx0aXBsZSBzdWJzeXN0ZW1zIGludG8gYSBzaW5nbGUgc2VyaWVzCj4gdW5sZXNzIHRoZXJl
J3Mgc29tZSBkZXBlbmRlbmN5IG9yIG90aGVyIGludGVyYWN0aW9uIHNpbmNlIGl0IGp1c3QKPiBj
b21wbGljYXRlcyBtYW5hZ2VtZW50IG9mIHRoZSBwYXRjaGVzLgoKSGksCgpObywgdGhlcmUgaXNu
J3QgYXBhcnQgZnJvbSB0aGUgZmFjdCB0aGF0IHRob3NlIGFyZSBzdG0zMiBkcml2ZXJzLiBBcyAK
TWlxdWVsIGFsc28gc3RhdGVkIGEgZmV3IGRheXMgYWdvLCBpcyB3YXMgd3JvbmcgZm9yIG1lIHRv
IHNlbnQgYWxsIG9mIAp0aGlzIGluIGEgd2hvbGUgc2VyaWUuIEkgd2lsbCBqdXN0IHJlc2VuZCB0
aGVtIHNlcGFyYXRlbHkgYXMgYSB2MiwgCnRha2luZyBpbnRvIGFjY291bnQgTWlxdWVsJ3MgcmV2
aWV3WzFdIGFuZCB0aGUga2VybmVsIHJvYm90LgoKUmVnYXJkcywKUmFwaGHDq2wKCgpbMV0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC84NzdjN2hhNzduLmZzZkBib290bGluLmNvbS8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
