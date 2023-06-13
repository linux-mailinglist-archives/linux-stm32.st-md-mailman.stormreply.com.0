Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 488D172DD32
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 11:02:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1DDEC6A617;
	Tue, 13 Jun 2023 09:02:30 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A1BAC6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 09:02:29 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-461b408594fso3644834e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686646948; x=1689238948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwBARohfXJIkEwsEMMo8aAWiqSvLtM3z2mjs8+NCfXY=;
 b=jT1sJaKn2m880uxpJ5L5ArF3lDcj7fgCTwwBWF6RsaYqX7FePADgzH9Dm/QqjhTK+P
 DkQPUPzU0LxNoxMzS7NHCF9LCuhzZVIoDE2wJgz/RxHAjB3FwuKMnKsaB222ZRFhLIUu
 Ciykd3mFBTL1P7WKtcBDpCQWvECEdUtdaRqHsmBNHOaGKKf7ckFx8fnKMuWlHPX1DAFg
 l3FrMgVgKr1RRtnR5aQwYXQut1mIFSubWfpgQHY41fB/fjLHyTaHIBqSPhElGMgX2CHS
 MbpMz3ivQQDAA3XTNm+c5m5Vn8oEylxUVqdnXb74u+FwpQL9ps8VOpJtL3Q4VSJOGT4a
 U12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686646948; x=1689238948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwBARohfXJIkEwsEMMo8aAWiqSvLtM3z2mjs8+NCfXY=;
 b=fO4J4wMegEU/RsCSIPHVK7xMjDTJic+9eecJjrPN0aWjU4P+ov6fmesqlUeMMEHWnp
 KV4fL+NiBTcAwf1Prr/KIW/cdCfVnicKMeFrfk8JW/17aBU72KNwopIrkVd34SwoQ/6e
 xNrWTQkKbr+ktm0rC5mFArM2sBbmFsbygJKNBDtn2sdu6wSHD6m44XLmvwnfxfhtzLeM
 yDeorPttNGj2P1bwKGI6tTAqVCQ0nIggQSES42kBtFglJT//V4WkblfxtKI9DiviUtjG
 xPFW9JP7XDzNgFGMGgt5DJ0LPd6tI4bReWB+NlclPx21TGkw0/Bx9qMxbo/VKx3wj5Ea
 Iayw==
X-Gm-Message-State: AC+VfDxLj4q8geJXgDqUyTiVRxw8vR8CpsxxB7z3C8BdOK4uU7rjWOdh
 Uczg4rJAJCrt+11eoVDE7BoE6sJUFuhmXBpf/a6q3w==
X-Google-Smtp-Source: ACHHUZ6FvJtsXqFfHNPsLThg02wzd2x38KBvekdtX3wtsD/RmYrGV5BDkoIlbcyJuuaGSsJlgYZLslwU2yK0B/59L/I=
X-Received: by 2002:a05:6122:d94:b0:458:8ee3:cad9 with SMTP id
 bc20-20020a0561220d9400b004588ee3cad9mr5032322vkb.8.1686646948353; Tue, 13
 Jun 2023 02:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-16-brgl@bgdev.pl>
 <20230612210632.agp4ybeseujblao2@halaney-x13s>
In-Reply-To: <20230612210632.agp4ybeseujblao2@halaney-x13s>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 13 Jun 2023 11:02:17 +0200
Message-ID: <CAMRc=Mc0hJXSazCX-5DQL7LEZ7WkhmZURxK9Kiyf_bR2d+_S3g@mail.gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 15/26] net: stmmac: dwmac-qcom-ethqos: add
 support for the optional phy-supply
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

T24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgMTE6MDbigK9QTSBBbmRyZXcgSGFsYW5leSA8YWhhbGFu
ZXlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxMiwgMjAyMyBhdCAxMToyMzo0
NEFNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBH
b2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IE9uIHNh
ODc3NXAtcmlkZSB3ZSBuZWVkIHRvIGVuYWJsZSB0aGUgcG93ZXIgc3VwcGx5IGZvciB0aGUgZXh0
ZXJuYWwgUEhZLgo+Cj4gSXMgdGhpcyBmb3IgdGhlIGV4dGVybmFsIHBoeT8gSXQgZG9lc24ndCBz
ZWVtIGxpa2UgaXQgZnJvbSB0aGUgYm9hcmQKPiBzY2hlbWF0aWMgSSBoYXZlLi4uIHRoZSByZWd1
bGF0b3IgbmV2ZXIgbWFrZXMgaXQgb3V0IG9mIHRoZSBibGFjayBib3ggdGhhdAo+IGlzIHRoZSBT
SVAvU09NIGlmIEknbSByZWFkaW5nIHJpZ2h0Lgo+Cj4gTXkgKHBvb3IpIHVuZGVyc3RhbmRpbmcg
d2FzIHRoaXMgd2FzIGZvciB0aGUgc2VyZGVzIHBoeSB0aGF0J3MgZG9pbmcgdGhlCj4gY29udmVy
c2lvbiB0byBTR01JSSBiZWZvcmUgaGl0dGluZyB0aGUgYm9hcmQuLi4gZ29vZCBjaGFuY2UgSSdt
IHdyb25nCj4gdGhvdWdoLgo+CgpObywgeW91J3JlIHJpZ2h0LiBJbiB3aGljaCBjYXNlIEkgdGhp
bmsgdGhlIHJlZ3VsYXRvciBjYWxscyBzaG91bGQgYmUKbW92ZWQgaW50byB0aGUgc2VyZGVzIGRy
aXZlciBpbnN0ZWFkIGFzIHBoeS1zdXBwbHkgaXMgZGVmaW5lZCBhcyB0aGUKc3VwcGx5IG9mIHRo
ZSBleHRlcm5hbCBQSFkgaW4gc3RtbWFjIGJpbmRpbmdzLgoKQmFydAoKPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5v
cmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21h
Yy1xY29tLWV0aHFvcy5jIHwgNSArKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKPiA+IGluZGV4IDJmNmI5YjQxOTYwMS4uMjFmMzI5
ZDJmN2ViIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+ID4gQEAgLTgsNiArOCw3IEBACj4gPiAg
I2luY2x1ZGUgPGxpbnV4L3BoeS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+Cj4g
PiAgI2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3JlZ3Vs
YXRvci9jb25zdW1lci5oPgo+ID4KPiA+ICAjaW5jbHVkZSAic3RtbWFjLmgiCj4gPiAgI2luY2x1
ZGUgInN0bW1hY19wbGF0Zm9ybS5oIgo+ID4gQEAgLTY5Miw2ICs2OTMsMTAgQEAgc3RhdGljIGlu
dCBxY29tX2V0aHFvc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gICAg
ICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgZ290byBvdXRfY29uZmlnX2R0Owo+ID4KPiA+
ICsgICAgIHJldCA9IGRldm1fcmVndWxhdG9yX2dldF9lbmFibGVfb3B0aW9uYWwoZGV2LCAicGh5
Iik7Cj4gPiArICAgICBpZiAocmV0IDwgMCAmJiByZXQgIT0gLUVOT0RFVikKPiA+ICsgICAgICAg
ICAgICAgZ290byBvdXRfY29uZmlnX2R0Owo+ID4gKwo+ID4gICAgICAgZXRocW9zLT5zZXJkZXNf
cGh5ID0gZGV2bV9waHlfb3B0aW9uYWxfZ2V0KGRldiwgInNlcmRlcyIpOwo+ID4gICAgICAgaWYg
KElTX0VSUihldGhxb3MtPnNlcmRlc19waHkpKSB7Cj4gPiAgICAgICAgICAgICAgIHJldCA9IFBU
Ul9FUlIoZXRocW9zLT5zZXJkZXNfcGh5KTsKPiA+IC0tCj4gPiAyLjM5LjIKPiA+Cj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
