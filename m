Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6A413CCF0
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2020 20:17:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41400C36B0F;
	Wed, 15 Jan 2020 19:17:52 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF40EC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 19:17:50 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w30so16732815qtd.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 11:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3oehQjENUEt6IwzurE8ivHHaN3UVdBa+Oowf63E60NU=;
 b=CzTRXY50zvP3lB1RvMkiImvNyLNaEPKNI321FbjF9Ug29rjj8gvhUoANJtQAoA6U6d
 9TZAm3G5knfU6VsjsuXeLO/YQH9MQtxKNFDFMtbUzsbcOmt9MGSem8GFkhzvK7WnadI9
 mJhbxLs2m904c8ERBdZ8BNndOhED5HUaVBa+fk/POBoTQNni0GidGoPrkbthcNlis2z7
 +QPzimTmpMig9c5pwKV3GRJnZzts+n4nK0pLjD7jCrW1YULeGfSbEKpvuKHp6lgr4683
 Gpdl3Zpge3xqKTUQ1KM2UAd47hTcCTZ9qZBGXI4yfFGmNPw+PwTK4nysSvuB/FGtGOt8
 VGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3oehQjENUEt6IwzurE8ivHHaN3UVdBa+Oowf63E60NU=;
 b=RdIGC4OIA88NK9TYhilMq8QJpAE6y8rc1qtYgmf2x1v/gM9BxxjlepwZdU8oTNzm65
 xxcfIWNwFIR8r//seSmGCfuq3vgoxcAEGApx6aR0Brwi8kBevzj//KMLBzjiURj41K+Z
 oybdJz1zdaUjt6Ja9xA7o6EMiy+0tEPsP+9tGf1bkrQlOFQXyX7nnEF9FLm28GG5z6Dj
 UTyf+dv3LtViCuwx1JE42l7jThJzoVllHxZE7pqu/B1sYED8IFfHYmx67a/fmnzptxP4
 veWnxpvmXERWr5Hxdz3JMQBGKNWbJ9RoMzUUUAgrSy5VuzWddLqLOyezFQS38Rd90xBj
 X0Kw==
X-Gm-Message-State: APjAAAWtDPTmMm3LWlVDTLyXfV6Md8gy6EHVTvNGmMCJWYQKUYtYf78r
 EGItHzX6rcblnjHwNNWra3UnqWj2ho1L3FAL1eof3g==
X-Google-Smtp-Source: APXvYqyJZqV8RaX3xgtSRb3g1wC2DLSVbZOTeDQGcnisJ8sUJbdpLx1+W5v8eR7hhzyOBQW9ezqQdL9+I+uWlUi5DaE=
X-Received: by 2002:ac8:33ab:: with SMTP id c40mr142755qtb.250.1579115869684; 
 Wed, 15 Jan 2020 11:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
 <20200109145333.12260-2-benjamin.gaignard@st.com>
 <20200115143521.GA15099@bogus>
 <CA+M3ks7FGZ9TMO0=yXrhZph1Cn1GQ+2-tM7SnDrRDXVoCjrTjA@mail.gmail.com>
 <CAL_JsqLki6D4soncDo0ZEh4xeC9+U_Kf2dnOVjrMTY1QrXTjfg@mail.gmail.com>
In-Reply-To: <CAL_JsqLki6D4soncDo0ZEh4xeC9+U_Kf2dnOVjrMTY1QrXTjfg@mail.gmail.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Wed, 15 Jan 2020 20:17:37 +0100
Message-ID: <CA+M3ks5AQVhacAW_gSXYwj6_O8xnvv0StDmhXn2MeQFS6JMZfg@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 pascal paillet <p.paillet@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: timer: Add STM32 Low
	Power Timer bindings
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

TGUgbWVyLiAxNSBqYW52LiAyMDIwIMOgIDIwOjAwLCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiBhIMOpY3JpdCA6Cj4KPiBPbiBXZWQsIEphbiAxNSwgMjAyMCBhdCA4OjQ2IEFNIEJlbmph
bWluIEdhaWduYXJkCj4gPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4K
PiA+IExlIG1lci4gMTUgamFudi4gMjAyMCDDoCAxNTozNSwgUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4gYSDDqWNyaXQgOgo+ID4gPgo+ID4gPiBPbiBUaHUsIEphbiAwOSwgMjAyMCBhdCAw
Mzo1MzozMVBNICswMTAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToKPiA+ID4gPiBEb2N1bWVu
dCBTVE0zMiBMb3cgUG93ZXIgYmluZGluZ3MuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPgo+ID4gPiA+IC0t
LQo+ID4gPiA+ICAuLi4vYmluZGluZ3MvdGltZXIvc3Qsc3RtMzItbHAtdGltZXIueWFtbCAgICAg
ICAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDQ0IGluc2VydGlvbnMoKykKPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zdCxzdG0zMi1scC10aW1lci55YW1sCj4gPiA+
ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3RpbWVyL3N0LHN0bTMyLWxwLXRpbWVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdGltZXIvc3Qsc3RtMzItbHAtdGltZXIueWFtbAo+ID4gPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jYTA0MGI5NmRjNDcKPiA+ID4g
PiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3RpbWVyL3N0LHN0bTMyLWxwLXRpbWVyLnlhbWwKPiA+ID4KPiA+ID4gVXNlIHRoZSBj
b21wYXRpYmxlIGZvciB0aGUgZmlsZW5hbWUuCj4gPgo+ID4gaXQgd2lsbCBiZSBpbiB2Mgo+ID4K
PiA+ID4KPiA+ID4gPiBAQCAtMCwwICsxLDQ0IEBACj4gPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gPiA+ICslWUFNTCAx
LjIKPiA+ID4gPiArLS0tCj4gPiA+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvdGltZXIvc3Qsc3RtMzItbHAtdGltZXIueWFtbCMKPiA+ID4gPiArJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiA+ID4gKwo+ID4gPiA+
ICt0aXRsZTogU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyIExvdyBQb3dlciAxNiBiaXRzIHRpbWVy
cyBiaW5kaW5ncwo+ID4gPiA+ICsKPiA+ID4gPiArbWFpbnRhaW5lcnM6Cj4gPiA+ID4gKyAgLSBC
ZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPgo+ID4gPiA+ICsKPiA+
ID4gPiArcHJvcGVydGllczoKPiA+ID4gPiArICBjb21wYXRpYmxlOgo+ID4gPiA+ICsgICAgY29u
c3Q6IHN0LHN0bTMyLWxwdGltZXItY2xrZXZlbnQKPiA+ID4KPiA+ID4gJ2Nsa2V2ZW50JyBpcyBh
IGgvdyBuYW1lPyBTZWVtcyByZWR1bmRhbnQgYW5kIGFidXNpbmcgY29tcGF0aWJsZSB0bwo+ID4g
PiBiaW5kIHRvIGEgc3BlY2lmaWMgTGludXggZHJpdmVyLgo+ID4KPiA+IE5vIGJ1dCBzdCxzdG0z
Mi1scHRpbWVyIGNvbXBhdGlibGUgaXMgYWxyZWFkeSB1c2VkIGZvciBhbm90aGVyIGRyaXZlcgo+
ID4gVGhlIGhhcmR3YXJlIGJsb2NrIGNhbiBpbXBsZW1lbnQgbXVsdGlwbGUgZmVhdHVyZXMgYnV0
IG5vdCBhbGwgYXQgdGhlIHNhbWUgdGltZQo+ID4gc28gSSB0cnkgdG8gZGlzdGluZ3Vpc2ggdGhl
bSB3aXRoIHRoZSBjb21wYXRpYmxlLgo+ID4gSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgSSB3b3Vs
ZCBsaWtlIHRhZyBpdCBhcyBhIGNsb2NrIGV2ZW50IGRyaXZlci4KPgo+IFRoYXQncyBhIExpbnV4
IHNwZWNpZmljIHRoaW5nIHdoaWNoIHdlJ3ZlIHNhaWQgbm8gdG8gZm9yIDEwIHllYXJzLgo+Cj4g
SXMgIk5vdCBhdCB0aGUgc2FtZSB0aW1lIiBhIGNoaXAgZGVzaWduIHRpbWUgY29uZmlndXJhdGlv
biBvciBydW4tdGltZQo+IGNvbmZpZy4gSWYgdGhlIGxhdHRlciwgd2h5IGRvIHlvdSB3YW50IHRv
IHVzZSBhIHBhcnRpY3VsYXIgaW5zdGFuY2UKPiBvdmVyIGFub3RoZXIgb25lIGZvciBjbG9jayBl
dmVudD8gVGhlcmUgaGFzIHRvIGJlIHNvbWUgaC93IGRpZmZlcmVuY2UuCj4gRGVzY3JpYmUgdGhl
IGRpZmZlcmVuY2UgYW5kIHRoZW4gdXNlIHRoYXQgdG8gZ3JhYiB0aGUgZGV2aWNlIHRvIHVzZQo+
IGZvciBhIGNsb2NrZXZlbnQuIEknbSBmaW5lIGlmIHlvdSBvbWl0IHRoZSBwd20gbm9kZSBhbmQg
dGhlbiB1c2UgdGhhdAo+IHRvIGRlY2lkZSB3aGljaCBpbnN0YW5jZSB0byB1c2UuCj4KClRoZXJl
IGlzIG5vIGhhcmR3YXJlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgZGV2aWNlcyBidXQgd2UgY2Fu
J3QgZG8KcHdtIGFuZCBjbG9ja2V2ZW50CmF0IHRoZSBzYW1lIHRpbWUuIFdlIHVzZSB0aGUgc2Ft
ZSBoYXJkd2FyZSBmb3IgdHdvIGV4Y2x1c2l2ZXMKZmVhdHVyZXMuIEluIGFkZGl0aW9uCndlIHdh
bnQgdG8gYmUgYWJsZSB0byB1c2UgY2xvY2tldmVudCBvbiBvbmUgZGV2aWNlIGFuZCBwd20gb24g
b25lIGFub3RoZXIuCkNvdWxkICJzdCxzdG0zMi1sb3ctcG93ZXItdGltZXIiIGNvbXBhdGlibGUg
YmUgYSBzb2x1dGlvbiA/CgpCZW5qYW1pbgoKPiBSb2IKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
