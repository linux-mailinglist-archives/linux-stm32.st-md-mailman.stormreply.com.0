Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B09AF4E5
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 23:59:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FAF4C78F62;
	Thu, 24 Oct 2024 21:59:00 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 398A9C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 21:58:53 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fb587d0436so15365041fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 14:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729807132; x=1730411932;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFVxrWwlGXu7xwVCAmBNg01QSRfDgCIGYPTLM5Loo7A=;
 b=ZcEkkqzLXJR2IVJDihFciLfgWVa3565CsgAj87DsmRuKkjHEQpqyc+uVzwVXvRsB5r
 5fFwy637y0i6KB301P90m/vqjqXvids3uM+0JXoJaKj8cdqpAMbqgCX34PIf7ksgF8WM
 hQuuKLt8OAKAuqmtFgehsOmrLkF/su74+WRJCLK2E3FErixKBPAKCCnwjRqefomJns2F
 znmpL9sFsv3S9PvJXd3gpHpiuce60fkArkIHDZYYy75jIfTooQ1NHzWdYVGzYtXqQizN
 udo5LIg0snRIG+UkGa5fV9dNhyZFV0jN6BdZhTB50xTx36uYPIjrZD56XD2UzVU/+MAN
 wyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729807132; x=1730411932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XFVxrWwlGXu7xwVCAmBNg01QSRfDgCIGYPTLM5Loo7A=;
 b=OevP5d5gUpsjSkzgghPC+lrP6A+BSQFyE5C8T21TK5KjjKgx209IVIONoquJ9BBI7m
 iTAjlr7SfrCN99vmVoc/tc0FDssZFIkQxTGInXIeTIZPEnvG3wXJAzZ8neMwRRVM4JMV
 6rWOm4JbN2OAxKki8Qc/6FmPUeiLq2Zf3MYmnZGBTVoAkNP1w1XhJQoheW2WOaKJ2tYg
 eUxO7C2osYDTcXYS5jxNkm7GiNlPYGBcQOdY5VvMqub9XK/STZQKRVcxe5QEAe9ZIACM
 dOIDXIxbloNpqjRiudXKKMOjjI3jAQGUDM/9wFKimdNCQxurAnUEf/uufLqX2qG2V+UY
 VCwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIpe0k9BEUnlUiyVtZa8z6cBqIYV8krYeBFkL0H67/RPJWrku40X9kp6hEV09UBR0WGqjh2/1/6OS3vw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQH1CmKuXmG6ceIF3QaE+w3BnyN+gkLAfpWcvRBreQVrkh06qs
 nu/qOAZw3ras20XoN4bkDNW2aAaz3PxPmKNm4Drv919vp18zfH3g5L01EAtCjrKBdEum81PG9m1
 EK79gcllJvFccDtrcd9HIVn+zgmGZyJEKQfAuxw==
X-Google-Smtp-Source: AGHT+IHvsIXQR72a7B+0VLm11VGicY9C2xyjpGaCCytBMfZbl/D5DRFsNMPKYNptUhXB3YcX5jP4S4kynK/SQjQw+0o=
X-Received: by 2002:a2e:9010:0:b0:2fb:3e01:b2bd with SMTP id
 38308e7fff4ca-2fc9d35a589mr34560231fa.21.1729807132380; Thu, 24 Oct 2024
 14:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com>
 <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
 <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com>
In-Reply-To: <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Oct 2024 23:58:40 +0200
Message-ID: <CACRpkdY2=qdY_0GA1gB03yHODPEvxum+4YBjzsXRVnhLaf++6Q@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] ARM: ioremap: Sync PGDs for
	VMALLOC shadow
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

SGkgQ2xlbWVudCwKCkkgc2F3IEkgbWlzc2VkIHRvIGxvb2sgY2xvc2VyIGF0IHRoZSBuZXcgYnVn
IGZvdW5kIGluIGV4dDQKb24gdGhlIFNUTTMyOgoKT24gTW9uLCBPY3QgMjEsIDIwMjQgYXQgMjox
MuKAr1BNIENsZW1lbnQgTEUgR09GRklDCjxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPiB3
cm90ZToKCj4gUGVyaGFwcyBub3QgcmVsYXRlZCB3aXRoIHRoaXMgdG9waWMgYnV0IGFzIGluIHRo
ZSBiYWNrdHJhY2UgSSBhbSBnZXR0aW5nCj4gc29tZSBrZXl3b3JkIGZyb20gb3VyIHN0YXJ0IGV4
Y2hhbmdlLCBJIGR1bXAgdGhlIGNyYXNoIGJlbG93Lgo+IElmIHRoaXMgYmFja3RyYWNlIGlzIHNv
bWVob3cgcmVsYXRlZCB3aXRoIG91ciBpc3N1ZSwgcGxlYXNlIGhhdmUgYSBsb29rLgooLi4uKQo+
IFsgMTQzOS4zNTE5NDVdIFBDIGlzIGF0IF9fcmVhZF9vbmNlX3dvcmRfbm9jaGVjaysweDAvMHg4
Cj4gWyAxNDM5LjM1Njk2NV0gTFIgaXMgYXQgdW53aW5kX2V4ZWNfaW5zbisweDM2NC8weDY1OAoo
Li4uKQo+IFsgMTQ0MC4zMzMxODNdICBfX3JlYWRfb25jZV93b3JkX25vY2hlY2sgZnJvbSB1bndp
bmRfZXhlY19pbnNuKzB4MzY0LzB4NjU4Cj4gWyAxNDQwLjMzOTcyNl0gIHVud2luZF9leGVjX2lu
c24gZnJvbSB1bndpbmRfZnJhbWUrMHgyNzAvMHg2MTgKPiBbIDE0NDAuMzQ1MzUyXSAgdW53aW5k
X2ZyYW1lIGZyb20gYXJjaF9zdGFja193YWxrKzB4NmMvMHhlMAo+IFsgMTQ0MC4zNTA2NzRdICBh
cmNoX3N0YWNrX3dhbGsgZnJvbSBzdGFja190cmFjZV9zYXZlKzB4OTAvMHhjMAo+IFsgMTQ0MC4z
NTYzMDhdICBzdGFja190cmFjZV9zYXZlIGZyb20ga2FzYW5fc2F2ZV9zdGFjaysweDMwLzB4NGMK
PiBbIDE0NDAuMzYyMDQyXSAga2FzYW5fc2F2ZV9zdGFjayBmcm9tIF9fa2FzYW5fcmVjb3JkX2F1
eF9zdGFjaysweDg0LzB4OGMKPiBbIDE0NDAuMzY4NDczXSAgX19rYXNhbl9yZWNvcmRfYXV4X3N0
YWNrIGZyb20gdGFza193b3JrX2FkZCsweDkwLzB4MjEwCj4gWyAxNDQwLjM3NDcwNl0gIHRhc2tf
d29ya19hZGQgZnJvbSBzY2hlZHVsZXJfdGljaysweDE4Yy8weDI1MAo+IFsgMTQ0MC4zODAyNDVd
ICBzY2hlZHVsZXJfdGljayBmcm9tIHVwZGF0ZV9wcm9jZXNzX3RpbWVzKzB4MTI0LzB4MTQ4Cj4g
WyAxNDQwLjM4NjI4N10gIHVwZGF0ZV9wcm9jZXNzX3RpbWVzIGZyb20gdGlja19zY2hlZF9oYW5k
bGUrMHg2NC8weDg4Cj4gWyAxNDQwLjM5MjUyMV0gIHRpY2tfc2NoZWRfaGFuZGxlIGZyb20gdGlj
a19zY2hlZF90aW1lcisweDYwLzB4Y2MKPiBbIDE0NDAuMzk4MzQxXSAgdGlja19zY2hlZF90aW1l
ciBmcm9tIF9faHJ0aW1lcl9ydW5fcXVldWVzKzB4MmM0LzB4NTljCj4gWyAxNDQwLjQwNDU3Ml0g
IF9faHJ0aW1lcl9ydW5fcXVldWVzIGZyb20gaHJ0aW1lcl9pbnRlcnJ1cHQrMHgxYmMvMHgzYTAK
PiBbIDE0NDAuNDExMDA5XSAgaHJ0aW1lcl9pbnRlcnJ1cHQgZnJvbSBhcmNoX3RpbWVyX2hhbmRs
ZXJfdmlydCsweDM0LzB4M2MKPiBbIDE0NDAuNDE3NDQ3XSAgYXJjaF90aW1lcl9oYW5kbGVyX3Zp
cnQgZnJvbQo+IGhhbmRsZV9wZXJjcHVfZGV2aWRfaXJxKzB4ZjQvMHgzNjgKPiBbIDE0NDAuNDI0
NDgwXSAgaGFuZGxlX3BlcmNwdV9kZXZpZF9pcnEgZnJvbQo+IGdlbmVyaWNfaGFuZGxlX2RvbWFp
bl9pcnErMHgzOC8weDQ4Cj4gWyAxNDQwLjQzMTYxOF0gIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9p
cnEgZnJvbSBnaWNfaGFuZGxlX2lycSsweDkwLzB4YTgKPiBbIDE0NDAuNDM3OTUzXSAgZ2ljX2hh
bmRsZV9pcnEgZnJvbSBnZW5lcmljX2hhbmRsZV9hcmNoX2lycSsweDMwLzB4NDAKPiBbIDE0NDAu
NDQ0MDk0XSAgZ2VuZXJpY19oYW5kbGVfYXJjaF9pcnEgZnJvbSBfX2lycV9zdmMrMHg4OC8weGM4
Cj4gWyAxNDQwLjQ0OTkyMF0gRXhjZXB0aW9uIHN0YWNrKDB4ZGU4MDNhMzAgdG8gMHhkZTgwM2E3
OCkKPiBbIDE0NDAuNDU0OTE0XSAzYTIwOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkZTgwM2IwMAo+IDAwMDAwMDAwIDAwMDAwMDAxIDAwMDAwMGMwCj4gWyAxNDQwLjQ2MzE0
MV0gM2E0MDogZTUzMzNmNDAgZGU4MDNiYTAgZGU4MDNiZDAgMDAwMDAwMDEgZTUzMzNmNDAKPiBk
ZTgwM2IwMCBjMTI0MWQ5MCBiYWQwMDc1Ywo+IFsgMTQ0MC40NzEyNjJdIDNhNjA6IGMyMDU4NGI4
IGRlODAzYTdjIGMwMTE0MTE0IGMwMTEzODUwIDIwMGYwMDEzIGZmZmZmZmZmCj4gWyAxNDQwLjQ3
Nzk1OV0gIF9faXJxX3N2YyBmcm9tIHVud2luZF9leGVjX2luc24rMHg0LzB4NjU4Cj4gWyAxNDQw
LjQ4MzA3OF0gIHVud2luZF9leGVjX2luc24gZnJvbSBjYWxsX3dpdGhfc3RhY2srMHgxOC8weDIw
CgpUaGlzIGlzIGhhcmQgdG8gYW5hbHl6ZSB3aXRob3V0IGJlaW5nIGFibGUgdG8gcmVwcm9kdWNl
IGl0LCBidXQgaXQgdGFsa3MKYWJvdXQgdGhlIHN0YWNrIGFuZCBLYXNhbiBhbmQgdW53aW5kaW5n
LCBzbyBjb3VsZCBpdCAoYWxzbykgYmUgcmVsYXRlZCB0byB0aGUKVk1BUDplZCBzdGFjaz8KCkRp
ZCB5b3UgdHJ5IHRvIHJldmVydCAob3IgY2hlY2sgb3V0IHRoZSBjb21taXQgYmVmb3JlIGFuZCBh
ZnRlcikKYjY1MDY5ODFmODgwIEFSTTogdW53aW5kOiBzdXBwb3J0IHVud2luZGluZyBhY3Jvc3Mg
bXVsdGlwbGUgc3RhY2tzCnRvIHNlZSBpZiB0aGlzIGlzIGFnYWluIGZpeGluZyB0aGUgaXNzdWU/
CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
