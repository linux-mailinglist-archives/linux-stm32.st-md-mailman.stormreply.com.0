Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CAF13CCB6
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2020 20:00:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43CA0C36B0F;
	Wed, 15 Jan 2020 19:00:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 020B5C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 19:00:41 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 59DD32467C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579114840;
 bh=MlG4s8gIf9QIp7cmwxv8Ub3MJBcjIUIPloJI7is/YIM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bGAWEXGuvwR5V8/IBccmj+E3ISleKHwW/4Bu8O4vIMtC9e6TXQJS3Du4rHFBTCbYI
 oZsiYeuWgl6Vb/9gLW5a0rslAAncSApseT1j89zkRCVZ8aFXK2aq3eXEk4uoFoIDGU
 kYsuKnL7Kh2/RcLp9aajLIEWSQ0V91KwaX2oUBC8=
Received: by mail-qk1-f176.google.com with SMTP id x129so16669097qke.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 11:00:40 -0800 (PST)
X-Gm-Message-State: APjAAAUDel2whdTVdrVDirK2IsY46AofL+XtuNdZ2TIDYUG4mSqlkl8h
 tF0HCOM20eLA8sDkt8OPXbATZLYRLWFrhdWRBQ==
X-Google-Smtp-Source: APXvYqxnDh1IEhLyZP31/QgZF61ylKseQtKsfhE9nWDF1jxrTcOeHZYesnoZvVtxadzwM8P/TeMg5/NndDzuP3fXuos=
X-Received: by 2002:a37:a70b:: with SMTP id q11mr23911932qke.393.1579114839424; 
 Wed, 15 Jan 2020 11:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
 <20200109145333.12260-2-benjamin.gaignard@st.com>
 <20200115143521.GA15099@bogus>
 <CA+M3ks7FGZ9TMO0=yXrhZph1Cn1GQ+2-tM7SnDrRDXVoCjrTjA@mail.gmail.com>
In-Reply-To: <CA+M3ks7FGZ9TMO0=yXrhZph1Cn1GQ+2-tM7SnDrRDXVoCjrTjA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Jan 2020 13:00:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLki6D4soncDo0ZEh4xeC9+U_Kf2dnOVjrMTY1QrXTjfg@mail.gmail.com>
Message-ID: <CAL_JsqLki6D4soncDo0ZEh4xeC9+U_Kf2dnOVjrMTY1QrXTjfg@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
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

T24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgODo0NiBBTSBCZW5qYW1pbiBHYWlnbmFyZAo8YmVuamFt
aW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBMZSBtZXIuIDE1IGphbnYuIDIwMjAg
w6AgMTU6MzUsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IGEgw6ljcml0IDoKPiA+Cj4g
PiBPbiBUaHUsIEphbiAwOSwgMjAyMCBhdCAwMzo1MzozMVBNICswMTAwLCBCZW5qYW1pbiBHYWln
bmFyZCB3cm90ZToKPiA+ID4gRG9jdW1lbnQgU1RNMzIgTG93IFBvd2VyIGJpbmRpbmdzLgo+ID4g
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25h
cmRAc3QuY29tPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9iaW5kaW5ncy90aW1lci9zdCxzdG0zMi1s
cC10aW1lci55YW1sICAgICAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc3Qsc3RtMzItbHAtdGlt
ZXIueWFtbAo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3RpbWVyL3N0LHN0bTMyLWxwLXRpbWVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdGltZXIvc3Qsc3RtMzItbHAtdGltZXIueWFtbAo+ID4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmNhMDQwYjk2ZGM0Nwo+
ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy90aW1lci9zdCxzdG0zMi1scC10aW1lci55YW1sCj4gPgo+ID4gVXNlIHRoZSBjb21w
YXRpYmxlIGZvciB0aGUgZmlsZW5hbWUuCj4KPiBpdCB3aWxsIGJlIGluIHYyCj4KPiA+Cj4gPiA+
IEBAIC0wLDAgKzEsNDQgQEAKPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gPiArJVlBTUwgMS4yCj4gPiA+ICstLS0KPiA+
ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvdGltZXIvc3Qsc3RtMzItbHAt
dGltZXIueWFtbCMKPiA+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIwo+ID4gPiArCj4gPiA+ICt0aXRsZTogU1RNaWNyb2VsZWN0cm9uaWNz
IFNUTTMyIExvdyBQb3dlciAxNiBiaXRzIHRpbWVycyBiaW5kaW5ncwo+ID4gPiArCj4gPiA+ICtt
YWludGFpbmVyczoKPiA+ID4gKyAgLSBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25h
cmRAc3QuY29tPgo+ID4gPiArCj4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4gPiArICBjb21wYXRpYmxl
Ogo+ID4gPiArICAgIGNvbnN0OiBzdCxzdG0zMi1scHRpbWVyLWNsa2V2ZW50Cj4gPgo+ID4gJ2Ns
a2V2ZW50JyBpcyBhIGgvdyBuYW1lPyBTZWVtcyByZWR1bmRhbnQgYW5kIGFidXNpbmcgY29tcGF0
aWJsZSB0bwo+ID4gYmluZCB0byBhIHNwZWNpZmljIExpbnV4IGRyaXZlci4KPgo+IE5vIGJ1dCBz
dCxzdG0zMi1scHRpbWVyIGNvbXBhdGlibGUgaXMgYWxyZWFkeSB1c2VkIGZvciBhbm90aGVyIGRy
aXZlcgo+IFRoZSBoYXJkd2FyZSBibG9jayBjYW4gaW1wbGVtZW50IG11bHRpcGxlIGZlYXR1cmVz
IGJ1dCBub3QgYWxsIGF0IHRoZSBzYW1lIHRpbWUKPiBzbyBJIHRyeSB0byBkaXN0aW5ndWlzaCB0
aGVtIHdpdGggdGhlIGNvbXBhdGlibGUuCj4gSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgSSB3b3Vs
ZCBsaWtlIHRhZyBpdCBhcyBhIGNsb2NrIGV2ZW50IGRyaXZlci4KClRoYXQncyBhIExpbnV4IHNw
ZWNpZmljIHRoaW5nIHdoaWNoIHdlJ3ZlIHNhaWQgbm8gdG8gZm9yIDEwIHllYXJzLgoKSXMgIk5v
dCBhdCB0aGUgc2FtZSB0aW1lIiBhIGNoaXAgZGVzaWduIHRpbWUgY29uZmlndXJhdGlvbiBvciBy
dW4tdGltZQpjb25maWcuIElmIHRoZSBsYXR0ZXIsIHdoeSBkbyB5b3Ugd2FudCB0byB1c2UgYSBw
YXJ0aWN1bGFyIGluc3RhbmNlCm92ZXIgYW5vdGhlciBvbmUgZm9yIGNsb2NrIGV2ZW50PyBUaGVy
ZSBoYXMgdG8gYmUgc29tZSBoL3cgZGlmZmVyZW5jZS4KRGVzY3JpYmUgdGhlIGRpZmZlcmVuY2Ug
YW5kIHRoZW4gdXNlIHRoYXQgdG8gZ3JhYiB0aGUgZGV2aWNlIHRvIHVzZQpmb3IgYSBjbG9ja2V2
ZW50LiBJJ20gZmluZSBpZiB5b3Ugb21pdCB0aGUgcHdtIG5vZGUgYW5kIHRoZW4gdXNlIHRoYXQK
dG8gZGVjaWRlIHdoaWNoIGluc3RhbmNlIHRvIHVzZS4KClJvYgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
