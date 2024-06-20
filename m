Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B2B910EFD
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 19:38:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17E51C7128D;
	Thu, 20 Jun 2024 17:38:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2B56C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 17:38:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8FB3362238;
 Thu, 20 Jun 2024 17:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16421C32786;
 Thu, 20 Jun 2024 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718905123;
 bh=eu4204Po9QE0cYQjUDURrwCjSksfyHPOc0038gSWWEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lDAK5onKrqnhU5bYs5axr1F0ZcK/BSq0+01f/D2Yvr21A0lXiv+VFAHRgHFt/qumm
 KfxMCVqD1+T2Zx5DCCrefKTtncP9krvMzuY1zmPG8s68s89wpWPf1atPZxaunBkdCj
 83fSnFHmJUGy5ddv/1hbrhHKDtj5vNYPNhR1ybXn9geYDP96R+huEH5tlitVltQpx0
 s4zrvbC2Pv3P/MIj0w4FfSjQrKA6yZZx+XD4Hhf5eaYesvuL/sgnENd2O0cwYaOZeR
 FrEB8k1ug51kAo8Y8R3KD/EqjVKvTpisZGmwJpvW6/p3wjQmUQRQir1Z2HJPO7v0W3
 kFXmQLFHdRBAg==
Date: Thu, 20 Jun 2024 18:38:38 +0100
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <20240620173838.GB1318296@google.com>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
 <126bd153a03f39e42645573eecf44ffab5354fc7.1718791090.git.u.kleine-koenig@baylibre.com>
 <20240620084451.GC3029315@google.com>
 <imyuhtcsjrbyodsndzbaqfwa4jxny25eylfdh4u4xtsiotsk5g@45l556pcrzys>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <imyuhtcsjrbyodsndzbaqfwa4jxny25eylfdh4u4xtsiotsk5g@45l556pcrzys>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 William Breathitt Gray <wbg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/5] counter: stm32-timer-cnt: Use
 TIM_DIER_CCxIE(x) instead of TIM_DIER_CCxIE(x)
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

T24gVGh1LCAyMCBKdW4gMjAyNCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IEhlbGxvIExl
ZSwKPiAKPiBPbiBUaHUsIEp1biAyMCwgMjAyNCBhdCAwOTo0NDo1MUFNICswMTAwLCBMZWUgSm9u
ZXMgd3JvdGU6Cj4gPiBPbiBXZWQsIDE5IEp1biAyMDI0LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToKPiA+IAo+ID4gPiBUaGVzZSB0d28gZGVmaW5lcyBoYXZlIHRoZSBzYW1lIHB1cnBvc2UgYW5k
IHRoaXMgY2hhbmdlIGRvZXNuJ3QKPiA+ID4gaW50cm9kdWNlIGFueSBkaWZmZXJlbmNlcyBpbiBk
cml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250Lm8uCj4gPiA+IAo+ID4gPiBUaGUgb25seSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlIHR3byBpcyB0aGF0Cj4gPiA+IAo+ID4gPiAJVElNX0RJRVJf
Q0NfSUUoMSkgPT0gVElNX0RJRVJfQ0MySUUKPiA+ID4gCj4gPiA+IHdoaWxlCj4gPiA+IAo+ID4g
PiAJVElNX0RJRVJfQ0N4SUUoMSkgPT0gVElNX0RJRVJfQ0MxSUUKPiA+ID4gCj4gPiA+IC4gVGhh
dCBtYWtlcyBpdCBuZWNlc3NhcnkgdG8gaGF2ZSBhbiBleHBsaWNpdCAiKyAxIiBpbiB0aGUgdXNl
ciBjb2RlLAo+ID4gPiBidXQgSU1ITyB0aGlzIGlzIGEgZ29vZCB0aGluZyBhcyB0aGlzIGlzIHRo
ZSBjb2RlIGxvY2F0YXRpb24gdGhhdAo+ID4gPiAia25vd3MiIHRoYXQgZm9yIHNvZnR3YXJlIGNo
YW5uZWwgMSB5b3UgaGF2ZSB0byB1c2UgVElNX0RJRVJfQ0MySUUKPiA+ID4gKGJlY2F1c2Ugc29m
dHdhcmUgZ3V5cyBzdGFydCBjb3VudGluZyBhdCAwLCB3aGlsZSB0aGUgcmVsZXZhbnQgaGFyZHdh
cmUKPiA+ID4gZGVzaWduZXIgc3RhcnRlZCBhdCAxKS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgo+ID4g
PiAtLS0KPiA+ID4gIGRyaXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQuYyB8IDQgKystLQo+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+
IAo+ID4gRGlkIHlvdSBkcm9wIFdpbGxpYW0ncyBBY2sgb24gcHVycG9zZT8KPiAKPiBZZXMsIGJl
Y2F1c2UgYSkgSSB3YXMgdW5zdXJlIHdoYXQgaGUgZGlkbid0IGxpa2UgYWJvdXQgdGhlIHN1Ympl
Y3QsIGFuZAo+IChtb3JlIGltcG9ydGFudGx5KSBiKSBJIHNwbGl0IHRoZSBwYXRjaCBpbiBxdWVz
dGlvbi4gSSBzaG91bGQgaGF2ZQo+IHdyaXR0ZW4gdGhhdCBpbiB0aGUgY292ZXIgbGV0dGVyLCBz
b3JyeS4KPiAKPiAoTm90ZSBJIG9ubHkgYW5ub3VuY2VkIHRvIGhhdmUgZml4ZWQgdGhlIHN1Ympl
Y3QgcHJlZml4IG9mIHRoZSBwd20KPiBwYXRjaC4gSSBhc3N1bWUgeW91IHdvbid0IGluY2x1ZGUg
dGhhdCBpbiB5b3VyIHB1bGwgcmVxdWVzdCwgYnV0IGlmIHlvdQo+IGRvLCBwbGVhc2UgZG8gcy8t
LzogLyBvbiBpdC4gVGhhdCdzIGFub3RoZXIgdGhpbmcgSSBmYWlsZWQgd2l0aCBmb3IgdGhpcwo+
IHNlcmllcy4pCgpXaGljaCBwYXRjaGVzIG5lZWQgdG8gYmUgaW4gdGhlIHB1bGwtcmVxdWVzdCBh
bmQgd2hpY2ggY2FuIGJlIGhvb3ZlcmVkCnVwIGJ5IHRoZWlyIGFzc29jaWF0ZWQgc3Vic3lzdGVt
cz8KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
