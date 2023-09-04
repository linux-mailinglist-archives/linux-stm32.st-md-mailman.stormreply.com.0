Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D24F3791704
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 14:22:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 971FDC6B455;
	Mon,  4 Sep 2023 12:22:13 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FD1CC6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 12:22:12 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-d7bb34576b9so1223558276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Sep 2023 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693830132; x=1694434932;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EtWz4Zjn1UW6f/Bp4thXGCFf7baahobrbXRCy95Pavs=;
 b=WL/FshThDHyT3orJxqQLVYsi+pUulqfdG5zwPf47zb5KCbhoGgQJ9u1xrIDVeHWuWi
 WjJMbinhggGSI13RHekgaz94RbH+JBAnOpkCrHUm1HvOpOmDkMczQUtMGaKydiQlOeIc
 N0g6qHbFenKnpB9nnCWzoG2g6+a2paQWbJa/GXlNn67uTlV6yNCfi2n/OQWf/YZXY5Cb
 5fvR2LyhX3TI95rTUvFx99xr0QTjT66+MBZ7GbhetTJPdl2xcVOJ1eGnI6pFbo6aeolg
 EDq04wJ12+jKzigdS+7qPBBxlSmSRhwVZuFF+fX6NpGvAjanHnrGXxANGonY6OuPbYsA
 M4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693830132; x=1694434932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EtWz4Zjn1UW6f/Bp4thXGCFf7baahobrbXRCy95Pavs=;
 b=TBjFA6PhoVa8G8wcWi0ZJb1vyTMOFaypfMTIRuKFmM87ARVKaRSJdAIKcurcNWZAPD
 wRGk6+ezI9BiYsoFZYvxIHMNpzvl8H3uN3tVAIYUQoLao4XTZD1J4yCaBQf/GmYYAhsb
 ZidvOBcCUUP07VGUCA+VIw/ST2Cwvs3klhXJ76wyCZIyMo/cJBVyDtQauZ9zKUbnT3W+
 LN8O7AIwS+Eb7EWcDBCXY69zpxSR9qMaSZK+Pcbp9mwB5jiHDncAFY/5rvQNEMgBV0si
 m9XHrIGBKiF1bOTENlZbBKvwP4/eefq0lcqWZiGKObhl1zt81QmuuzPVuN8SbcEHFISW
 mWnw==
X-Gm-Message-State: AOJu0YyU8MiFuOvce4hAvOPyf2ZSEFOmVHcYOeC+1ZevOJXj7cQK9klo
 zUr54oVvMhDg7MXThKXumhTb+zrp3AxMCFflaR6oCQ==
X-Google-Smtp-Source: AGHT+IHPwKOL/2Z9FQ4y0NEX4i5C+ax07Yhv4XOcJCyrKvr2TbeaxnBIPI7R8RJYi9WrH6gCRPBTH43bpu9g6ij4cKI=
X-Received: by 2002:a25:c509:0:b0:d74:6163:db8c with SMTP id
 v9-20020a25c509000000b00d746163db8cmr11092688ybe.41.1693830131892; Mon, 04
 Sep 2023 05:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230901120836.1057900-1-yann.gautier@foss.st.com>
 <CACRpkdacRe5cPoSFJyEdo6nZrtmUHTNqMxf55CntvsdpFqhhrQ@mail.gmail.com>
In-Reply-To: <CACRpkdacRe5cPoSFJyEdo6nZrtmUHTNqMxf55CntvsdpFqhhrQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 4 Sep 2023 14:21:35 +0200
Message-ID: <CAPDyKFqJzoBiG4c2NbXA_6YDNsAh4W0TO-SP9+C2Qw40TKVH7g@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com
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

T24gRnJpLCAxIFNlcHQgMjAyMyBhdCAxNjoxMCwgTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEhpIFlhbm4vQ2hyaXN0b3BoZSwKPgo+IHRoYW5rcyBm
b3IgeW91ciBwYXRjaCEKPgo+IE9uIEZyaSwgU2VwIDEsIDIwMjMgYXQgMjowOOKAr1BNIFlhbm4g
R2F1dGllciA8eWFubi5nYXV0aWVyQGZvc3Muc3QuY29tPiB3cm90ZToKPgo+ID4gRnJvbTogQ2hy
aXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4gPgo+ID4g
QWRkIHRoZSBzdXBwb3J0IG9mIFNESU8gaW4tYmFuZCBpbnRlcnJ1cHQgbW9kZSBmb3IgU1RNMzIg
dmFyaWFudC4KPiA+IEl0IGFsbG93cyB0aGUgU0QgSS9PIGNhcmQgdG8gaW50ZXJydXB0IHRoZSBo
b3N0IG9uIFNETU1DX0QxIGRhdGEgbGluZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFlhbm4gR2F1dGllciA8eWFubi5nYXV0aWVyQGZvc3Muc3QuY29tPgo+ICguLi4pCj4g
PiArKysgYi9kcml2ZXJzL21tYy9ob3N0L21tY2kuaAo+ID4gQEAgLTMzMiw2ICszMzIsNyBAQCBl
bnVtIG1tY2lfYnVzeV9zdGF0ZSB7Cj4gPiAgICogQG9wZW5kcmFpbjogYml0bWFzayBpZGVudGlm
eWluZyB0aGUgT1BFTkRSQUlOIGJpdCBpbnNpZGUgTU1DSVBPV0VSIHJlZ2lzdGVyCj4gPiAgICog
QGRtYV9sbGk6IHRydWUgaWYgdmFyaWFudCBoYXMgZG1hIGxpbmsgbGlzdCBmZWF0dXJlLgo+ID4g
ICAqIEBzdG0zMl9pZG1hYnNpemVfbWFzazogc3RtMzIgc2RtbWMgaWRtYSBidWZmZXIgc2l6ZS4K
PiA+ICsgKiBAdXNlX3NkaW9faXJxOiBhbGxvdyBTRCBJL08gY2FyZCB0byBpbnRlcnJ1cHQgdGhl
IGhvc3QKPgo+IFRoZSBkb2N1bWVudGF0aW9uIHRhZyBzaG91bGQgYmUgb25lIGxpbmUgdXAgKGNv
bXBhcmUgdG8gdGhlIG1lbWJlcnMuLi4pCj4KPiA+IEBAIC0zNzYsNiArMzc3LDcgQEAgc3RydWN0
IHZhcmlhbnRfZGF0YSB7Cj4gPiAgICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgIHN0YXJ0
X2VycjsKPiA+ICAgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgb3BlbmRyYWluOwo+ID4g
ICAgICAgICB1OCAgICAgICAgICAgICAgICAgICAgICBkbWFfbGxpOjE7Cj4gPiArICAgICAgIHU4
ICAgICAgICAgICAgICAgICAgICAgIHVzZV9zZGlvX2lycToxOwo+Cj4gMS4gYm9vbCB1c2Vfc2Rp
b19pcnE7Cj4KPiAyLiBzdXBwb3J0c19zZGlvX2lycSBpcyBtb3JlIHRvIHRoZSBwb2ludCBkb24n
dCB5b3UgdGhpbms/Cj4gICAgIEVzcGVjaWFsbHkgc2luY2UgaXQgYWN0aXZhdGVzIHRoZXNlIHR3
byBjYWxsYmFja3M6Cj4KPiA+ICsgICAgICAgdm9pZCAoKmVuYWJsZV9zZGlvX2lycSkoc3RydWN0
IG1tY2lfaG9zdCAqaG9zdCwgaW50IGVuYWJsZSk7Cj4gPiArICAgICAgIHZvaWQgKCpzZGlvX2ly
cSkoc3RydWN0IG1tY2lfaG9zdCAqaG9zdCwgdTMyIHN0YXR1cyk7Cj4KPiBGdXJ0aGVyOiBhbGwg
dGhlIFV4NTAwIHZhcmlhbnRzIHN1cHBvcnQgdGhpcyAoYml0IDIyKSBhcyB3ZWxsLCBzbyBlbmFi
bGUgdGhvc2UKPiB0b28gaW4gdGhlaXIgdmVuZG9yIGRhdGEuIEFsbCBJIGhhdmUgaXMgb3V0LW9m
LWJhbmQgc2lnbmFsaW5nIHdpdGggYW4gR1BJTyBJUlEKPiBvbiBteSBCcm9hZGNvbSBjaGlwcyBi
dXQgSSB0aGluayBpdCB3b3JrcyAobWF5YmUgVWxmIGhhcyB0ZXN0ZWQgaXQgaW4gdGhlCj4gZmFy
IHBhc3QpLgoKRm9yIHRoZSB1eDUwMCB2YXJpYW50IHRoZXJlIGlzIGEgSFcgcHJvYmxlbS4gQWZ0
ZXIgcnVubmluZyBzb21lIHN0cmVzcwp0ZXN0cywgd2UgbWF5IGVuZCB1cCBiZWluZyBzdHVjayB3
YWl0aW5nIGZvciBhbiBTRElPIElSUSB0byBiZQpkZWxpdmVyZWQuIEV2ZW4gaWYgdGhlIFNESU8g
aXJxcyBzaG91bGQgYmUgY29uc2lkZXJlZCBsZXZlbCB0cmlnZ2VyZWQsCml0IGxvb2tlZCBsaWtl
IGl0IHdhcyBpbXBsZW1lbnRlZCBpbiB0aGUgSFcgYXMgYW4gZWRnZSB0cmlnZ2VyZWQgSVJRLgoK
VGhlIGRvd25zdHJlYW0gd29ya2Fyb3VuZCBjb25zaXN0ZWQgb2YgcmUtcm91dGluZyB0aGUgREFU
MSB0byBhIEdQSU8KYXQgcnVudGltZSBzdXNwZW5kICh3ZSB3YW50ZWQgdGhhdCBmb3Igb3B0aW1h
bCBwb3dlciBzYXZlIHN1cHBvcnQKYW55d2F5KSAtIGFuZCBtYW51YWxseSBjaGVja2luZyBpZiB0
aGUgREFUMSBsaW5lIHdhcyBhc3NlcnRlZCwgYmVmb3JlCmVuYWJsaW5nIHRoZSBHUElPIGxpbmUg
Zm9yIGFuIGlycS4gVGhpcyB3b3JrZWQgcGVyZmVjdGx5IGZpbmUgYXMgYQp3b3JrYXJvdW5kLCB3
aXRoIHRoZSBsaW1pdGF0aW9uIHRoYXQgb25lIG1heSBvYnNlcnZlIGEgbGl0dGxlIGJpdCBvZgpo
aWNrLXVwIGluIHRoZSB0cmFmZmljIG9jY2FzaW9uYWxseS4KClRoYXQgc2FpZCwgdGhlIG91dC1v
Zi1iYW5kIElSUXMgaXMgd2hhdCB3b3JrcyBiZXN0IGZvciB0aGUgdXg1MDAgdmFyaWFudHMuCgpL
aW5kIHJlZ2FyZHMKVWZmZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
