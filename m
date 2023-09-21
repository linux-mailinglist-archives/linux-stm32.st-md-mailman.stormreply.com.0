Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B157AAB95
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 10:06:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FE15C6C83F;
	Fri, 22 Sep 2023 08:06:10 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2E19C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 18:48:17 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-99357737980so160251666b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 11:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695322095; x=1695926895;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=brAzGA2XEfmHNJOmgEz0xYZn4CECqGMWBMjfuyGkpN0=;
 b=N01MR0B4x7MWB/tE+KRwG72zSGBzTb/BydCx/K3HUjwa28duPMzl/s+WKb+YyZ7ZhO
 qrRmOb6Jwh+PmgST0FiujGcZCLLvOj35pjLLL6gRHBy5yKLDVnO/ZLjCftKFi1nUsqnP
 2Mch2TrGSlbSELSB/zH7UgFOrHmdRC8hTfIms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695322095; x=1695926895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=brAzGA2XEfmHNJOmgEz0xYZn4CECqGMWBMjfuyGkpN0=;
 b=s5AX7PaubanqFLiHtfaTSNoJOx9qd09vJ8WiV/EMYgp8xtZQjSdHBNhD3iYVG93Q41
 uQfPOWeuQlJGTTtYP59ZWDy+QXyHBT3ER0wLnMnelXaTsUkVmxyxEDpxksYYcKd/+z37
 pNRifciRKp6kHD4z06GEXYTgjXCB+duoubpxn5BgsEjftlZA1JFXU3D0/yRGkLKkQADy
 WKoAZNyxA5hORkxV2PqulwP32EP77QvijNn+fPSncV9azuDUYh9g7XDFtaCpMTsjpV90
 gpAFX8MTJ+D8EElvHmFKA4KgZX0JG9Oi5tSQaMPm4NTMQ3W3hXWOGQ9US+w/FTVKawXy
 yNsA==
X-Gm-Message-State: AOJu0YyMu0lnrh1UDT8wZeMk/SF9NF4JhSO89lQXNF23asU5BQ6dgbyo
 oK00Qn6oZ3lkp6a1C3YXUz07ByAz0jP3FF2yx+J154Qw
X-Google-Smtp-Source: AGHT+IFqFvaiDIG5oG1H/dAqVvNFMK9W/d4Vn1t6QQ0syauWzvquslD09SvaHoffwGfED44LNHCPFg==
X-Received: by 2002:a17:906:197:b0:9ae:62ec:e897 with SMTP id
 23-20020a170906019700b009ae62ece897mr2615839ejb.4.1695322095633; 
 Thu, 21 Sep 2023 11:48:15 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b0099d0c0bb92bsm1439421eje.80.2023.09.21.11.48.14
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:48:14 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4053a7b36b0so17265e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 11:48:14 -0700 (PDT)
X-Received: by 2002:a05:600c:4c19:b0:3fe:d691:7d63 with SMTP id
 d25-20020a05600c4c1900b003fed6917d63mr120103wmp.6.1695322093885; Thu, 21 Sep
 2023 11:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234015.566018-1-dianders@chromium.org>
 <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
In-Reply-To: <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Sep 2023 11:48:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vvqd76m-i2vbpVoiTir18S4ceFTd17nGdH1yU+9jhfDw@mail.gmail.com>
Message-ID: <CAD=FV=Vvqd76m-i2vbpVoiTir18S4ceFTd17nGdH1yU+9jhfDw@mail.gmail.com>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailman-Approved-At: Fri, 22 Sep 2023 08:06:08 +0000
Cc: mcoquelin.stm32@gmail.com, jfalempe@redhat.com, yannick.fertre@foss.st.com,
 linux-aspeed@lists.ozlabs.org, emma@anholt.net, andrew@aj.id.au,
 jyri.sarha@iki.fi, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 hdegoede@redhat.com, joel@jms.id.au, daniel@ffwll.ch,
 tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de, airlied@redhat.com,
 airlied@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFT PATCH 5/6] drm: Call
 drm_atomic_helper_shutdown() at shutdown/remove time for misc drivers
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

SGksCgpPbiBGcmksIFNlcCAxLCAyMDIzIGF0IDQ6NDHigK9QTSBEb3VnbGFzIEFuZGVyc29uIDxk
aWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gQmFzZWQgb24gZ3JlcHBpbmcgdGhyb3Vn
aCB0aGUgc291cmNlIGNvZGUgdGhlc2UgZHJpdmVycyBhcHBlYXIgdG8gYmUKPiBtaXNzaW5nIGEg
Y2FsbCB0byBkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bigpIGF0IHN5c3RlbSBzaHV0ZG93biB0
aW1lCj4gYW5kIGF0IGRyaXZlciByZW1vdmUgKG9yIHVuYmluZCkgdGltZS4gQW1vbmcgb3RoZXIg
dGhpbmdzLCB0aGlzIG1lYW5zCj4gdGhhdCBpZiBhIHBhbmVsIGlzIGluIHVzZSB0aGF0IGl0IHdv
bid0IGJlIGNsZWFubHkgcG93ZXJlZCBvZmYgYXQKPiBzeXN0ZW0gc2h1dGRvd24gdGltZS4KPgo+
IFRoZSBmYWN0IHRoYXQgd2Ugc2hvdWxkIGNhbGwgZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24o
KSBpbiB0aGUgY2FzZQo+IG9mIE9TIHNodXRkb3duL3Jlc3RhcnQgYW5kIGF0IGRyaXZlciByZW1v
dmUgKG9yIHVuYmluZCkgdGltZSBjb21lcwo+IHN0cmFpZ2h0IG91dCBvZiB0aGUga2VybmVsIGRv
YyAiZHJpdmVyIGluc3RhbmNlIG92ZXJ2aWV3IiBpbgo+IGRybV9kcnYuYy4KPgo+IEEgZmV3IG5v
dGVzIGFib3V0IHRoZXNlIGZpeGVzOgo+IC0gSSBjb25maXJtZWQgdGhhdCB0aGVzZSBkcml2ZXJz
IHdlcmUgYWxsIERSSVZFUl9NT0RFU0VUIHR5cGUgZHJpdmVycywKPiAgIHdoaWNoIEkgYmVsaWV2
ZSBtYWtlcyB0aGlzIHJlbGV2YW50Lgo+IC0gSSBjb25maXJtZWQgdGhhdCB0aGVzZSBkcml2ZXJz
IHdlcmUgYWxsIERSSVZFUl9BVE9NSUMuCj4gLSBXaGVuIGFkZGluZyBkcm1fYXRvbWljX2hlbHBl
cl9zaHV0ZG93bigpIHRvIHRoZSByZW1vdmUvdW5iaW5kIHBhdGgsCj4gICBJIGFkZGVkIGl0IGFm
dGVyIGRybV9rbXNfaGVscGVyX3BvbGxfZmluaSgpIHdoZW4gdGhlIGRyaXZlciBoYWQKPiAgIGl0
LiBUaGlzIHNlZW1lZCB0byBiZSB3aGF0IG90aGVyIGRyaXZlcnMgZGlkLiBJZgo+ICAgZHJtX2tt
c19oZWxwZXJfcG9sbF9maW5pKCkgd2Fzbid0IHRoZXJlIEkgYWRkZWQgaXQgc3RyYWlnaHQgYWZ0
ZXIKPiAgIGRybV9kZXZfdW5yZWdpc3RlcigpLgo+IC0gVGhpcyBwYXRjaCBkZWFscyB3aXRoIGRy
aXZlcnMgdXNpbmcgdGhlIGNvbXBvbmVudCBtb2RlbCBpbiBzaW1pbGFyCj4gICB3YXlzIGFzIHRo
ZSBwYXRjaCAoImRybTogQ2FsbCBkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bigpIGF0Cj4gICBz
aHV0ZG93biB0aW1lIGZvciBtaXNjIGRyaXZlcnMiKQo+IC0gVGhlc2UgZml4ZXMgcmVseSBvbiB0
aGUgcGF0Y2ggKCJkcm0vYXRvbWljLWhlbHBlcjoKPiAgIGRybV9hdG9taWNfaGVscGVyX3NodXRk
b3duKE5VTEwpIHNob3VsZCBiZSBhIG5vb3AiKSB0byBzaW1wbGlmeQo+ICAgc2h1dGRvd24uCj4K
PiBTdWdnZXN0ZWQtYnk6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4gLS0t
Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4X2Rydi5jIHwgIDcgKysrKysr
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jICAgfCAgOCArKysrKysr
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZHJ2LmMgICAgICAgfCAgNyArKysrKysr
Cj4gIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMgICAgICAgICAgICAgICB8ICA3ICsrKysrKysK
PiAgZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfZHJ2LmMgICAgIHwgMTEgKysrKysrKysr
Ky0KPiAgZHJpdmVycy9ncHUvZHJtL3R2ZTIwMC90dmUyMDBfZHJ2LmMgICAgIHwgIDcgKysrKysr
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMgICAgfCAxMCArKysrKysr
KysrCj4gIDcgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
TGFuZGVkIG9uIGRybS1taXNjLW5leHQ6CgozYzRiYWJhZTNjNGEgZHJtOiBDYWxsIGRybV9hdG9t
aWNfaGVscGVyX3NodXRkb3duKCkgYXQgc2h1dGRvd24vcmVtb3ZlCnRpbWUgZm9yIG1pc2MgZHJp
dmVycwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
