Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE12FB9DFF3
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 10:12:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F355C36B2D;
	Thu, 25 Sep 2025 08:12:06 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E17BEC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 08:12:04 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-57edfeaa05aso676060e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758787924; x=1759392724;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pOUEu/+y60hAFjLRRexZAgc5r0XDC4GIpSh+/gdmcBM=;
 b=mblYbMEdZokN8Z5ULQgquoE5GBm6wEdZqxhVqI9U/HNO50Qf3oCfn3YOlnEN4fDbNM
 ZXII5tCurEn3LnV0EalkAcvlqgpaStAvejcXU5Ajkg3AgCKNLtp7RgQK+i8jR1/1WRMZ
 lbiJxWw8CK7QGeDRu6e1ntz/0s21lRNI7QY7cHwgSAS5YStLS+Cw9akbU10mpE9M9jSj
 wRCyzx8zYL/EL4Fxf1fvfAdS8747q59j515xmRqFjGoMf3Qs/ydao91xhMsASpBy/Ox0
 dskP9Vo3D5yUT78IXnrH9zQ9nsCEpxmzhOddUXNTigK8zdJHXZz0f7O6IFYKzfvimbDG
 yKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758787924; x=1759392724;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pOUEu/+y60hAFjLRRexZAgc5r0XDC4GIpSh+/gdmcBM=;
 b=pFL2+5OLmf7iG6R00ZxLVGKK+CYgGH/HP0a+DfXxHr1NHAKKqnfQcQWsGFpjbkP8u4
 W7914azbSyvNwSbvmHwkcd6ta8TEVnSCdII13hJViacZYTZ9HF51n2eZkjzUsY0zQp7x
 7K4wZNqit8FkKEwsNh8zq7JfJNPEIZPEcVsQfd3UmdiWJInt03MNbZsWQZAAnZtjVIhi
 3y+4W/jDLTVQn+taJM03/M9DVWaTxo4+rROTYKCnKMesHYuxhuSfZDq4Qj2jpFeprJUB
 bSWhWRoLR1P45uQrFkrnKu+g0QEVBMYlok85e2OuNFiE07alSecRb5EHyd55UsK3QXiG
 LUXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQgO7R3iL07Vvfdu7yZYiu1jFBmWmZ11pqwGdvHqFF7wHc1KUmUwE/pUG1YEvrq2oD9hC+YJSnqkOCKg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx872RUiOvCOLyHy2LVr5U8OALHxuO3pz8uCf23CrI+fgMVt3Fd
 rLD/KY0L5MELkIlvZ5b/zluJoh2XqYYCaDckp+R/pYTJ3lsbHrMA11ETz/1MpM/BVcSuhaOMQq5
 ulIq9WBVi5qEZZKkutmgjKZfAKZoKjNEvKq0uIwMSjA==
X-Gm-Gg: ASbGncuWOsYBlSwcIQ2fakHJ5QJMxkVslMWgVhLXQTS3X+BTUOsmIw8qqtLvedqsAsJ
 ZuZt+1Lvgrs5A33J/qzVD2Ik2msPkzafJ2+Fv4iVYXk+xl5wacFj17cYMBMZlxAqPk2V6oyXmwr
 NotSFeDqROhedwfdwDsZ504KtVyo4HnuRwMA4J4O8uX2FXBnMhs7TPwJ65Tl8TqcCFv2EamBIwT
 qsw0NQsgCK7iJaLRZXLJgk9dNqYx9xewriYYw==
X-Google-Smtp-Source: AGHT+IGJf55i3bv2L8+gmNkmzkA9WiH37A1+UEGPjEgNIhsONYzUjkvXwduJeRWAHBQx5JD4yW8UWOq3aNBoELENYBs=
X-Received: by 2002:a05:6512:114a:b0:57e:6aef:3ffc with SMTP id
 2adb3069b0e04-582d073fab8mr832508e87.4.1758787923677; Thu, 25 Sep 2025
 01:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
 <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
 <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
In-Reply-To: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Sep 2025 10:11:52 +0200
X-Gm-Features: AS18NWBR36rLL1CtueiFc1sMJzM_SH_VKHScbJyKloWTmjZnMKzJiRko6sa-obs
Message-ID: <CAMRc=MeR3iH7cH4aLuN5T+y5FCFyzpR3BBc4chE7CPAy8Ug2gQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

T24gVGh1LCBTZXAgMjUsIDIwMjUgYXQgMTA6MDPigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4KPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IEhpIEJhcnRvc3osCj4KPiBPbiBUaHUsIDI1
IFNlcHQgMjAyNSBhdCAwOTo1MiwgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4g
d3JvdGU6Cj4gPiBPbiBUaHUsIFNlcCAyNSwgMjAyNSBhdCA5OjQ44oCvQU0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiA+IE9uIFRodSwgMTEgU2Vw
dCAyMDI1IGF0IDEyOjAyLCBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPiB3cm90
ZToKPiA+ID4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tp
QGxpbmFyby5vcmc+Cj4gPiA+ID4KPiA+ID4gPiBUaGUgKHR5cGVvZihmb28pKSBjb25zdHJ1Y3Qg
aXMgdW51c3VhbCBpbiB0aGUga2VybmVsLCB1c2UgYSBtb3JlIHR5cGljYWwKPiA+ID4gPiBzeW50
YXggYnkgZXhwbGljaXRseSBzcGVsbGluZyBvdXQgdGhlIHR5cGUuCj4gPiA+Cj4gPiA+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCwgd2hpY2ggaXMgbm93IGNvbW1pdCBkYTNhODhlOTY1NmMxN2EzICgi
cGluY3RybDoKPiA+ID4gdXNlIG1vcmUgY29tbW9uIHN5bnRheCBmb3IgY29tcG91bmQgbGl0ZXJh
bHMiKSBpbiBwaW5jdHJsL2Zvci1uZXh0Cj4gPiA+Cj4gPiA+ID4gTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjUwOTA5LWdwaW8tbW1pby1ncGlvLWNvbnYtcGFydDQtdjEtMTMt
OWY3MjNkYzM1MjRhQGxpbmFyby5vcmcvCj4KPiBUaGlzIGlzIHRoZSBvcmlnaW4gbGluayB0byB0
aGUgcGF0Y2ggKGJ5IHlvdSkgdGhhdCBzdGFydGVkIHRoZSBkaXNjdXNzaW9uLgo+Cj4gPiA+Cj4g
PiA+IExvb2tzIGxpa2UgeW91IChzbGlnaHRseSkgbWlzc2VkIHlvdXIgdGFyZ2V0LiBUaGUgY29y
cmVjdCBsaW5rIGlzOgo+ID4gPgo+ID4gPiAgICAgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYU1BUDloQVdhcnMwVDgzckBzbWlsZS5maS5pbnRlbC5jb20KPgo+IFRoaXMgaXMgdGhlIGxp
bmsgdG8gdGhlIGNvbW1lbnQgKGJ5IEFuZHkpIHRoYXQgcXVlc3Rpb25lZCB0aGUgY29uc3RydWN0
Lgo+Cj4gPiA+Cj4gPiA+ID4gU3VnZ2VzdGVkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5z
aGV2Y2hlbmtvQGludGVsLmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPgo+ID4gVGhpcyBpcyBh
IGxpbmsgdG8gdGhlIGRpc2N1c3Npb24gd2l0aCBBbmR5IGFzIHBlciBMaW51cyBUb3J2YWxkcycK
PiA+IHJlY2VudCByZXF1ZXN0IHRvIHVzZSB0aGUgTGluazogdGFnIHRvIHBvaW50IHRvIGFjdHVh
bGx5IHVzZWZ1bAo+ID4gaW5mb3JtYXRpb24gcmF0aGVyIHRoYW4ganVzdCB0aGUgcGF0Y2gncyBv
cmlnaW4uIExpbnVzIFdhbGxlaWogZG9lc24ndAo+ID4gdXNlIGI0IHNvIHRoZSBvcmlnaW4gbGlu
ayB5b3UnZCBub3JtYWxseSBleHBlY3QgdG8gYmUgYWRkZWQKPiA+IGF1dG9tYXRpY2FsbHkgaXMg
bm90IHRoZXJlIGF0IGFsbC4gVGhhdCdzIHByb2JhYmx5IHdoYXQgY2F1c2VkIHRoZQo+ID4gY29u
ZnVzaW9uLgo+Cj4gSSBrbm93IDstKQo+Cj4gR2l2ZW4gdGhlICJTdWdnZXN0ZWQtYnk6IEFuZHki
LCBzaG91bGRuJ3QgdGhlIGxpbmsgcG9pbnQgdG8gdGhlIGVtYWlsCj4gd2l0aCB0aGUgYWN0dWFs
IHN1Z2dlc3Rpb24/Cj4KCkFoLCBJIGRpZG4ndCByZWFsaXplIHRoaXMgaXMgd2hhdCB5b3UgbWVh
bnQuIEkgd2FudGVkIHRvIHBvaW50IHRvIHRoZQplbnRpcmUgZGlzY3Vzc2lvbiBhbmQgYWxzbyB0
aGlzIGlzIGFscmVhZHkgaW4gTGludXMnIHRyZWUgc28gaXQncyB1cAp0byBoaW0gaWYgaGUgd2Fu
dHMgdG8gY2hhbmdlIGl0LgoKQmFydG9zegpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
