Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMmfK8S+Cmrb7AQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 09:24:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D76C567746
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 09:24:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D30DC56612;
	Mon, 18 May 2026 07:24:52 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75995C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 07:24:49 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-575267e3398so1703860e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 00:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779089089; x=1779693889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zAX9hMXPiheaabgyT1lZXM8onJqkgfJ6l93xnHwfAq4=;
 b=Bk1rk9z5omAYsigEl4F/N0/R8bHnHdsxCwkkRPPIButTPEnQ4niX4daHGiLLnV+Aku
 3LBdhA310wXw3HNwX92qbRWbjnMYS7i9bz8XNJJ7LkIVqAaH60WgVKZR2zsbyOsoljSg
 YBeD/tpN7mpeSTWqVs0qDzx8OIr/yqHE+2zAkc497FQoKW4JCM5VTapI1ZQ2/HM0BzJU
 mIHaPWYHIRcpeVDG/Q29D0oWCacXdzIr5c0qWX7iPw3uDfcMLVQ2cSMYc9gci9LiQWVt
 ZJEywgb/Xnm7h+MHCAmQHFAIzRID26+3QInQu3gv/QTdfdw70lt7I7J5n6KXyeRq1kg7
 fRbA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Bsamu2DOWSHEpATdYPYXZQxQvfmvkScAO5m1el0voHsPgElA1ixFgJ7CeNQGyn6kS1euA4Va1y3oYcg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxkOIOtAlArNKXMvxikGthRVh2TYJv6bM1DE9FB5c+uk5JykFoq
 5dYjGy5mjFNc7Q8ypLV8/vluUjN0RSWbHWO143kKE5HZv1mWGfepl9LKqM7L/399
X-Gm-Gg: Acq92OGYRFuQ6rDLxlzWUAGPiHddcVCuef/L82R/zCP27bL++5XnJ3Zxb6ZBC31T6SG
 BCgDePCxJoihbzb49KfSYJsAQ7T09zrtM7rZyOLWIlwXEPG2g3akAztJp37WQcirAOcK7CxN4sq
 E2n3u+jVIAzF2rQB+L6/UkA+LfYUUW+57RQyKfV4zjgtroZUUi9Fdnf0sTrS+YkQFeb3i6B1h3/
 LVmHnNE4qLaDno/z2Y0awQu3gUurTFYivBdY/XatqbzcVWK/BQAwXz4ZY3GPvESl+0pCVjZ9ynM
 p0L58jvC55L7xxyCLwLjI86vUUi9+a36KUzCQ1naVlQiP+U9PtN0v1JsLuu40WLmpb376RxDG+m
 IX6TEvtGq4fiEcQ94ANY3Dr8XOLE7KLUQlC5EJdGyFRncbymNEgS5IeWoJAoc1CipR2QipphGdf
 foSL2Rvkkb5kundDXpBUWu6r2Z/kkDYpTr+hE7JMRGsH8B9fnQsaj4FXjCVInh
X-Received: by 2002:a05:6122:d86:b0:575:3b1b:ef01 with SMTP id
 71dfb90a1353d-5760c0a6a7bmr7734545e0c.9.1779089088635; 
 Mon, 18 May 2026 00:24:48 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-95fc2f8727bsm4362499241.10.2026.05.18.00.24.47
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 00:24:47 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-6312d29596cso1514715137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 00:24:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9ajh0FmsBQAvO+XuPik8n3yCcLsCcjadEn5sNW9VWADepZCiz8cOTKdlrk2wGb9WhuSq4XEMQc0OxHTg==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:f83:b0:639:4bb7:c916 with SMTP id
 ada2fe7eead31-63a3cc0c2d3mr7561944137.3.1779089086695; Mon, 18 May 2026
 00:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 09:24:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGSBbQtKaoFej1Qm-SUgDenLMDF0psD9o07wyHKu8A+w@mail.gmail.com>
X-Gm-Features: AVHnY4KCtTIyMp1YT9qrsNOPXjoXEF7LJA_Isl-7-vM7CDKMV110o1b879bzndY
Message-ID: <CAMuHMdWGSBbQtKaoFej1Qm-SUgDenLMDF0psD9o07wyHKu8A+w@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Nick Dyer <nick@shmanahar.org>,
 Kees Cook <kees@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 David Heidelberg <david@ixit.cz>, Marco Crivellari <marco.crivellari@suse.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Johannes Kirchmair <johannes.kirchmair@skidata.com>,
 Anshul Dalal <anshulusr@gmail.com>, bui duc phuc <phucduc.bui@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Josua Mayer <josua@solid-run.com>,
 Xichao Zhao <zhao.xichao@vivo.com>, linux-input@vger.kernel.org,
 Jeff LaBundy <jeff@labundy.com>, platform-driver-x86@vger.kernel.org,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Minseong Kim <ii4gsp@gmail.com>, Job Noorman <job@noorman.info>,
 Oleh Kuzhylnyi <kuzhylol@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org,
 Petr Hodina <petr.hodina@protonmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hans de Goede <hansg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v1] Input: Use named initializers for
	arrays of i2c_device_data
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 5D76C567746
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bootlin.com,gmail.com,shmanahar.org,kernel.org,tuxon.dev,ixit.cz,suse.com,wolfvision.net,linux.dev,pengutronix.de,linux.intel.com,glider.be,skidata.com,solid-run.com,vivo.com,vger.kernel.org,labundy.com,mailbox.org,analog.com,noorman.info,lists.infradead.org,diasemi.com,redhat.com,protonmail.com,oss.qualcomm.com,st-md-mailman.stormreply.com,microchip.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:alexandre.belloni@bootlin.com,m:clamor95@gmail.com,m:nick@shmanahar.org,m:kees@kernel.org,m:claudiu.beznea@tuxon.dev,m:david@ixit.cz,m:marco.crivellari@suse.com,m:javier.carrasco@wolfvision.net,m:thorsten.blum@linux.dev,m:m.tretter@pengutronix.de,m:andriy.shevchenko@linux.intel.com,m:geert+renesas@glider.be,m:johannes.kirchmair@skidata.com,m:anshulusr@gmail.com,m:phucduc.bui@gmail.com,m:mingo@kernel.org,m:josua@solid-run.com,m:zhao.xichao@vivo.com,m:linux-input@vger.kernel.org,m:jeff@labundy.com,m:platform-driver-x86@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:sakari.ailus@linux.intel.com,m:michael.hennerich@analog.com,m:ii4gsp@gmail.com,m:job@noorman.info,m:kuzhylol@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:support.opensource@diasemi.com,m:mpenttil@redhat.com,m:y.oudjana@protonmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-stm32@st-md-mailman.stormreply
 .com,m:nicolas.ferre@microchip.com,m:jekhor@gmail.com,m:linux-kernel@vger.kernel.org,m:petr.hodina@protonmail.com,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:hansg@kernel.org,m:geert@glider.be,m:phucducbui@gmail.com,m:marek.vasut@mailbox.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.953];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,baylibre.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

SGkgVXdlLAoKT24gRnJpLCAxNSBNYXkgMjAyNiBhdCAxODo0OCwgVXdlIEtsZWluZS1Lw7ZuaWcg
KFRoZSBDYXBhYmxlIEh1YikKPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+
IE15IGFkZGl0aW9uYWwgbW90aXZhdGlvbiBmb3IgdGhpcyBlZmZvcnQgaXMgQ0hFUklbMV0uIFRo
aXMgaXMgYSBoYXJkd2FyZQoKTmljZSEKCj4gZXh0ZW5zaW9uIHRoYXQgdXNlcyAxMjggYml0IHBv
aW50ZXJzIGJ1dCB1bnNpZ25lZCBsb25nIGlzIHN0aWxsIDY0IGJpdC4KPiBTbyB3aXRoIENIRVJJ
IHlvdSBjYW5ub3Qgc3RvcmUgcG9pbnRlcnMgaW4gdW5zaWduZWQgbG9uZyB2YXJpYWJsZXMuCgpH
b29kIGx1Y2sgZml4aW5nIGFsbCBpbXBsaWNpdCBhc3N1bXB0aW9ucyBhYm91dCB0aGlzIGluIHRo
ZSBrZXJuZWwhCkFsc28sIGdvb2QgbHVjayBjb252aW5jaW5nIHBlb3BsZSB0byB1c2UgdWludHB0
cl90IGluc3RlYWQgOy0pCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FIay09d2oyT0h5
LTVlK3NyRzFmeStaVTAwVG1aMU5GcDZrRkxiVkxNWEhlN0ExZC1nQG1haWwuZ21haWwuY29tCgpH
cntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgoKLS0KR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtl
IHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
