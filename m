Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EC37A0312
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 13:52:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A710EC6B46F;
	Thu, 14 Sep 2023 11:52:05 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0044AC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 11:52:03 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-d8162698f0dso894702276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 04:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694692323; x=1695297123;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XOUEoWCoocBtSGgV6FK5TFmlWuuWLandTZ80F2DQ2rk=;
 b=U70xoye1NUV6YdMsA3SAPdSKJbqOoV6Cifpxb8ZsX5pvnW45w7QR2hFNkIBJubrazr
 MfuajkHva4Xrpszcs4/fjCg/vmLOmcCP6Q2/ws4YzmQwUwwFJo8FhmFZqmrN+UvKjxs5
 GZ/JM3eL94znqV9iV6KyVAO4LdISSs4XRv7pyrzTYXBmIup6W+tVNfaTXBbJTyvh1V00
 rShiyJpJ0L/whM5mvZnWnqzrE69QxcJoZ4hmI743IuOiwhZH7QGnOHYoER2W0R3BHerA
 kdrO93Wq8PesRA369h9asWC39jPg47HEb3DgJsepCoJlPqPB9hsFjF7cYOIzl8Y1BCLP
 LvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694692323; x=1695297123;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XOUEoWCoocBtSGgV6FK5TFmlWuuWLandTZ80F2DQ2rk=;
 b=Nrk3D6n5LM1xUMcRxx1UoqWoXyzIZlKbrNvvLFlkzKntUoGZDVXgJHPYqmvPCxpnI9
 27mR8f3UVAJHAoOswMzVAvnQEHR7UqTP0W9ExcaLDvjMlqe+iBCseYYwY+X+7y9WoxrI
 5dQeCgysBM2/AzNSdMTZgPOuDG4UCH9zQBfGpuh+diS7HXr+lQeHxqUOqSwyifQk0BOC
 5Kzo8w9GxApethLiBBxlChWvoxUOuvBytDjZ49/toFc4SBpf/75keC16jo+LuOdzFGaa
 Bar4jVVUxmjlJeh5eqzV8gGlA7ormk+Qua2znOlbukbxgaHT9bYN07ByHS0nZWiFAEFt
 AWpQ==
X-Gm-Message-State: AOJu0YxkZ1tmsrwG3liiapXiBxxKLHMwiOF+mBneVaFos887O9HEpQnq
 4spFbSdXrQ0oZb1jG+sh7P5lr4zhWF+3cag+Ev4opQ==
X-Google-Smtp-Source: AGHT+IHD8VvcoE47pb1lIcfSKbtIiW7ws0imUaLM67I3lgZ6IbvqTW/m+pTULfW+iNfibDtFe9PuifpTuzvff1x23T0=
X-Received: by 2002:a25:109:0:b0:d00:cc5b:8a9f with SMTP id
 9-20020a250109000000b00d00cc5b8a9fmr4681660ybb.16.1694692322860; Thu, 14 Sep
 2023 04:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230901120836.1057900-1-yann.gautier@foss.st.com>
 <CACRpkdacRe5cPoSFJyEdo6nZrtmUHTNqMxf55CntvsdpFqhhrQ@mail.gmail.com>
 <CAPDyKFqJzoBiG4c2NbXA_6YDNsAh4W0TO-SP9+C2Qw40TKVH7g@mail.gmail.com>
 <ab2f88c3-2f80-a0ae-3a74-d90dd2a6ccf3@foss.st.com>
In-Reply-To: <ab2f88c3-2f80-a0ae-3a74-d90dd2a6ccf3@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Sep 2023 13:51:51 +0200
Message-ID: <CACRpkdY1cU4D_qbC3g6wV5hcKVCL6uMJu9mH=byw+2RgQTPicQ@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: stm32: add SDIO in-band
	interrupt mode
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTE6MDjigK9BTSBZYW5uIEdhdXRpZXIgPHlhbm4uZ2F1
dGllckBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4gT24gOS80LzIzIDE0OjIxLCBVbGYgSGFuc3NvbiB3
cm90ZToKPiA+IE9uIEZyaSwgMSBTZXB0IDIwMjMgYXQgMTY6MTAsIExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBIaSBZYW5uL0NocmlzdG9w
aGUsCj4gPj4KPiA+PiB0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gPj4KPiA+PiBPbiBGcmksIFNl
cCAxLCAyMDIzIGF0IDI6MDjigK9QTSBZYW5uIEdhdXRpZXIgPHlhbm4uZ2F1dGllckBmb3NzLnN0
LmNvbT4gd3JvdGU6Cj4gPj4KPiA+Pj4gRnJvbTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3Rv
cGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4gPj4+Cj4gPj4+IEFkZCB0aGUgc3VwcG9ydCBvZiBT
RElPIGluLWJhbmQgaW50ZXJydXB0IG1vZGUgZm9yIFNUTTMyIHZhcmlhbnQuCj4gPj4+IEl0IGFs
bG93cyB0aGUgU0QgSS9PIGNhcmQgdG8gaW50ZXJydXB0IHRoZSBob3N0IG9uIFNETU1DX0QxIGRh
dGEgbGluZS4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxj
aHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IFlhbm4g
R2F1dGllciA8eWFubi5nYXV0aWVyQGZvc3Muc3QuY29tPgo+ID4+ICguLi4pCj4gPj4+ICsrKyBi
L2RyaXZlcnMvbW1jL2hvc3QvbW1jaS5oCj4gPj4+IEBAIC0zMzIsNiArMzMyLDcgQEAgZW51bSBt
bWNpX2J1c3lfc3RhdGUgewo+ID4+PiAgICAqIEBvcGVuZHJhaW46IGJpdG1hc2sgaWRlbnRpZnlp
bmcgdGhlIE9QRU5EUkFJTiBiaXQgaW5zaWRlIE1NQ0lQT1dFUiByZWdpc3Rlcgo+ID4+PiAgICAq
IEBkbWFfbGxpOiB0cnVlIGlmIHZhcmlhbnQgaGFzIGRtYSBsaW5rIGxpc3QgZmVhdHVyZS4KPiA+
Pj4gICAgKiBAc3RtMzJfaWRtYWJzaXplX21hc2s6IHN0bTMyIHNkbW1jIGlkbWEgYnVmZmVyIHNp
emUuCj4gPj4+ICsgKiBAdXNlX3NkaW9faXJxOiBhbGxvdyBTRCBJL08gY2FyZCB0byBpbnRlcnJ1
cHQgdGhlIGhvc3QKPiA+Pgo+ID4+IFRoZSBkb2N1bWVudGF0aW9uIHRhZyBzaG91bGQgYmUgb25l
IGxpbmUgdXAgKGNvbXBhcmUgdG8gdGhlIG1lbWJlcnMuLi4pCj4gPj4KPiA+Pj4gQEAgLTM3Niw2
ICszNzcsNyBAQCBzdHJ1Y3QgdmFyaWFudF9kYXRhIHsKPiA+Pj4gICAgICAgICAgdTMyICAgICAg
ICAgICAgICAgICAgICAgc3RhcnRfZXJyOwo+ID4+PiAgICAgICAgICB1MzIgICAgICAgICAgICAg
ICAgICAgICBvcGVuZHJhaW47Cj4gPj4+ICAgICAgICAgIHU4ICAgICAgICAgICAgICAgICAgICAg
IGRtYV9sbGk6MTsKPiA+Pj4gKyAgICAgICB1OCAgICAgICAgICAgICAgICAgICAgICB1c2Vfc2Rp
b19pcnE6MTsKPiA+Pgo+ID4+IDEuIGJvb2wgdXNlX3NkaW9faXJxOwo+ID4+Cj4gSGksCj4KPiBT
aG91bGQgaXQgcmVhbGx5IGJlIGNoYW5nZWQgdG8gYSBib29sPwo+IE90aGVyIGJvb2xlYW4gbGlr
ZXMgaW4gdGhlIHN0cnVjdHVyZSBhcmUgdTg6MS4KClllcywgdHdvIHdyb25ncyBkb2VzIG5vdCBt
YWtlIG9uZSByaWdodC4KClVzaW5nIHU4OjEgaXMgYSB3YXkgb2YgdHJ5aW5nIHRvIG91dHNtYXJ0
IHRoZSBjb21waWxlcgp3aGljaCBpcyBnZW5lcmFsbHkgYSBiYWQgaWRlYS4KCj4gPiBUaGF0IHNh
aWQsIHRoZSBvdXQtb2YtYmFuZCBJUlFzIGlzIHdoYXQgd29ya3MgYmVzdCBmb3IgdGhlIHV4NTAw
IHZhcmlhbnRzLgo+Cj4gV2hhdCBJIHVuZGVyc3RhbmQgaGVyZSBpcyB0aGF0IGluLWJhbmQgaW50
ZXJydXB0cyBhcmUgbm90IHByb3Blcmx5Cj4gd29ya2luZyBvbiB1eDUwMCwgYW5kIHRoZW4gdGhl
IGZlYXR1cmUgc2hvdWxkbid0IGJlIGVuYWJsZWQgZm9yIHRoaXMKPiBwbGF0Zm9ybS4KPiBBbSBJ
IGNvcnJlY3Q/CgpJIHRoaW5rIHdlIGNhbiBmbGFnIHRoZSBmZWF0dXJlIGFzIGF2YWlsYWJsZSBh
bmQgaW1wbGVtZW50IHRoZSBoYW5kbGluZwpidXQgYWRkIGEgY29tbWVudCB0aGF0IHRoaXMgaXMg
dW5zdGFibGUgYW5kIHRoYXQgVXg1MDAgdXNlcnMgc2hvdWxkCnByZWZlciB0byB1c2Ugb3V0LW9m
LWJhbmQgSVJRcy4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
