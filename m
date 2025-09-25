Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F151DB9DF9E
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 10:08:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BEADC36B2D;
	Thu, 25 Sep 2025 08:08:53 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADD6AC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 08:08:51 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-77f1f29a551so946211b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 01:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758787730; x=1759392530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rUcMlfE8b4AOAO2p/aFN45tB3uALYO0TSoBHD4chZzo=;
 b=wxv+yusLHJ+fSoYrlRzhrToPXre5gVK+MccK8J1EAhhEccUgpIv4oy+fAvObQMFECO
 EmaSQzLuG72bPRbO6gNGk24LHX/zJvKvvdh6+sBMWdjOo58xJixkORg/6bUDoWDKmkHf
 5wHZfyfoFD+RVk+tFmeFBdvI17lngLiiF/+/EZ1GIq/diwd7Y3Bc774I3UeBWrVHVarC
 /YpgdDXUvTKNtmymepBpHSdKHTeV32F+rAqVjNvsMYNXj5spLwWa8Emdh5gI+GcEjiIM
 K4dIj8K5Qvf0FN4beAbxpwVez0Bwvmc/pTLCqrl/yWEL/4GNrMf7m9/XZNiTFKI3+Ys+
 3/PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX85zDi22Ku5zJ3mRZxWNb8ZwCH1pwI1rIl0CVZv+c8c5SC67RAE/epMKUpt2f66AHUbkTqCG7CBKO+qA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyHgXmKQm3SRkmth2L6Dej3vABo88fmnqNN41ZBooBYdiBeg1iQ
 tZVSSPr8E2BH1AWk8prT4hOh2qKGGosCLidXxuHp3JbFdBQ/0VyOIZK6vXDcar5G
X-Gm-Gg: ASbGncud9C+dHrbINRUmWboyiVnXGKsuLxGhk8hSPPcNMOGmVZxATyYYK+pvhNQuWo1
 5sdFaq0w4dv+jFNvZ2itYQVyvx0VeOjKi7Pk5DMaQTvSk+13cXk5VnOydf5i3wcRRIm8amxYkPA
 w3eHPGfXoUZ9bQLdMvDPRoYexIA1RrXEbFwj0mu3qNwi+m75DmePcOTxh+9PiCCa14F/ShGpwXU
 kCvvSrkMkd+3e4LPw8UOvF7iNs6G56DglNMTXyahiZEvjKCTuOKWFs49MPi2MUXHxp7Wt9UYUSb
 WSuMxADkZqbQcwHOefjMoY/RL36fe5SJP5kXiJIGT7kRfJT6uY7+ADUcHeenhaR06ZOnaJTXZTJ
 98eripTMvXc4/GePETNXrtXAvpZWk7Qw0Lcfn1MFIOx/hhGf81Yk7+WW/3v2f9pzB
X-Google-Smtp-Source: AGHT+IE8aWNCvinKef95sGd6948cc2leBb/N8His67atjOikaPoRYZOmKsQ6H2siD5IyHUglXcFbtg==
X-Received: by 2002:a05:6a21:3381:b0:2c9:1323:f800 with SMTP id
 adf61e73a8af0-2e7c1bcb2e2mr2380149637.9.1758787729766; 
 Thu, 25 Sep 2025 01:08:49 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com.
 [209.85.210.178]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78102c074f4sm1178195b3a.79.2025.09.25.01.08.49
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 01:08:49 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-77d94c6562fso855454b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 01:08:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW4ObBdnw6ZxQWFiL4Bz7E372zT0KT/VVeVCC0/Xj3vQLKDkxc32HX2JUIy9mQDu96gHRxVA+nCYVT/1g==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6122:90f:b0:542:2912:664f with SMTP id
 71dfb90a1353d-54bea2f2d56mr980779e0c.10.1758787332548; Thu, 25 Sep 2025
 01:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
 <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
In-Reply-To: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 10:02:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
X-Gm-Features: AS18NWCyYwXSHgwWU9cjWnhwFzyaiaKh315kbRG5kwTsoewxQN_WDT2npG3qPmE
Message-ID: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, imx@lists.linux.dev,
 Tomer Maimon <tmaimon77@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 James Cowgill <james.cowgill@blaize.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, openbmc@lists.ozlabs.org,
 Lee Jones <lee@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-gpio@vger.kernel.org, Hoan Tran <hoan@os.amperecomputing.com>,
 Benjamin Fair <benjaminfair@google.com>, Yang Shen <shenyang39@huawei.com>,
 Scott Branden <sbranden@broadcom.com>, Neil Jones <neil.jones@blaize.com>,
 linux-unisoc@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matt Redfearn <matt.redfearn@blaize.com>, Imre Kaloz <kaloz@openwrt.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/3] pinctrl: use more common syntax for
	compound literals
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

SGkgQmFydG9zeiwKCk9uIFRodSwgMjUgU2VwdCAyMDI1IGF0IDA5OjUyLCBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxicmdsQGJnZGV2LnBsPiB3cm90ZToKPiBPbiBUaHUsIFNlcCAyNSwgMjAyNSBhdCA5
OjQ44oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6
Cj4gPiBPbiBUaHUsIDExIFNlcHQgMjAyNSBhdCAxMjowMiwgQmFydG9zeiBHb2xhc3pld3NraSA8
YnJnbEBiZ2Rldi5wbD4gd3JvdGU6Cj4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJh
cnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPiA+ID4KPiA+ID4gVGhlICh0eXBlb2YoZm9v
KSkgY29uc3RydWN0IGlzIHVudXN1YWwgaW4gdGhlIGtlcm5lbCwgdXNlIGEgbW9yZSB0eXBpY2Fs
Cj4gPiA+IHN5bnRheCBieSBleHBsaWNpdGx5IHNwZWxsaW5nIG91dCB0aGUgdHlwZS4KPiA+Cj4g
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgZGEzYTg4ZTk2NTZj
MTdhMyAoInBpbmN0cmw6Cj4gPiB1c2UgbW9yZSBjb21tb24gc3ludGF4IGZvciBjb21wb3VuZCBs
aXRlcmFscyIpIGluIHBpbmN0cmwvZm9yLW5leHQKPiA+Cj4gPiA+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI1MDkwOS1ncGlvLW1taW8tZ3Bpby1jb252LXBhcnQ0LXYxLTEz
LTlmNzIzZGMzNTI0YUBsaW5hcm8ub3JnLwoKVGhpcyBpcyB0aGUgb3JpZ2luIGxpbmsgdG8gdGhl
IHBhdGNoIChieSB5b3UpIHRoYXQgc3RhcnRlZCB0aGUgZGlzY3Vzc2lvbi4KCj4gPgo+ID4gTG9v
a3MgbGlrZSB5b3UgKHNsaWdodGx5KSBtaXNzZWQgeW91ciB0YXJnZXQuIFRoZSBjb3JyZWN0IGxp
bmsgaXM6Cj4gPgo+ID4gICAgIExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FNQVA5aEFX
YXJzMFQ4M3JAc21pbGUuZmkuaW50ZWwuY29tCgpUaGlzIGlzIHRoZSBsaW5rIHRvIHRoZSBjb21t
ZW50IChieSBBbmR5KSB0aGF0IHF1ZXN0aW9uZWQgdGhlIGNvbnN0cnVjdC4KCj4gPgo+ID4gPiBT
dWdnZXN0ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AaW50ZWwuY29t
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFz
emV3c2tpQGxpbmFyby5vcmc+Cj4KPiBUaGlzIGlzIGEgbGluayB0byB0aGUgZGlzY3Vzc2lvbiB3
aXRoIEFuZHkgYXMgcGVyIExpbnVzIFRvcnZhbGRzJwo+IHJlY2VudCByZXF1ZXN0IHRvIHVzZSB0
aGUgTGluazogdGFnIHRvIHBvaW50IHRvIGFjdHVhbGx5IHVzZWZ1bAo+IGluZm9ybWF0aW9uIHJh
dGhlciB0aGFuIGp1c3QgdGhlIHBhdGNoJ3Mgb3JpZ2luLiBMaW51cyBXYWxsZWlqIGRvZXNuJ3QK
PiB1c2UgYjQgc28gdGhlIG9yaWdpbiBsaW5rIHlvdSdkIG5vcm1hbGx5IGV4cGVjdCB0byBiZSBh
ZGRlZAo+IGF1dG9tYXRpY2FsbHkgaXMgbm90IHRoZXJlIGF0IGFsbC4gVGhhdCdzIHByb2JhYmx5
IHdoYXQgY2F1c2VkIHRoZQo+IGNvbmZ1c2lvbi4KCkkga25vdyA7LSkKCkdpdmVuIHRoZSAiU3Vn
Z2VzdGVkLWJ5OiBBbmR5Iiwgc2hvdWxkbid0IHRoZSBsaW5rIHBvaW50IHRvIHRoZSBlbWFpbAp3
aXRoIHRoZSBhY3R1YWwgc3VnZ2VzdGlvbj8KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
