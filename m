Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B390972DB93
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 09:53:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A416C6A617;
	Tue, 13 Jun 2023 07:53:07 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6E59C6A60F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 07:53:05 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-46e0a9aaa01so135893e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 00:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686642784; x=1689234784;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ksmnYzaAZG4SFOtuZwLT0Gj07ow0mCiA7tlTY9FP1/Y=;
 b=d/XOUvzXq7CkULBNjOF5cPQ9T8PQ4GUN2VTUb4tV5GYUOU/bcCMFJER5wRcTiOAxaO
 VEqeTPG5/GSimPhYdVoDC/uqRBqssvbhFmMqZ2UPpATKuDu0zcPmCBugjzLiimaHg+0O
 9wZ1rW7T5SAVt/6r/SykeSUB1kSjjeu1v/QF9yZNVYeWYL/CqPipZS2RqbveG9GDYWQl
 3yZcujcboW/sNqe2RjBd/XPxGCpKyPsA5S0Wt8H20ztGP/P8e2a+LHAM1iWQz7y5UEUU
 byzRaCp7blF315uAiXD/wO22ggP+a/pLSa4fq9EoyeAoPW6lXUTFE4Oe4EeVpTJurQyN
 Z0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686642784; x=1689234784;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ksmnYzaAZG4SFOtuZwLT0Gj07ow0mCiA7tlTY9FP1/Y=;
 b=fNFSScCTXYLqIl6d0Mz76E8oO13W8qq6RGuOPnbw7knblYUyd37PmL/yHoOHQhQCiQ
 nbT8BY73ra/l4x/A5f/yPqXJu5GN8dyabjRSCX0uA2ffENtrxpcoA3E1rz0T5Kh5FhpI
 vGdE/3UTLBsVLBlfP//LePeqgz4B2Sm5FIYupFuvcAGaMizZuXs7hDpmuPydindwbaFm
 5v3Kw5Mf/DPWZUbTN9EFgW0Lel6bIno4DeDQwUdTquxgSVDOmwTJruXZtXE1Kz+pChOh
 wG2xCXAtpCwH352OCwrqhZzq9u1qNk873Ra07jgX5+4l3GoeaQxDQR8QyeVkKhEjsIzF
 bHZg==
X-Gm-Message-State: AC+VfDwKWBq5kVEZupf3ELQ5omXATo25UaOcnj+3iGFGBPbFUakXjr7p
 BXt3baB9DtZq02r5Kj0MWMHUOva5KjL+6S66B3sv1A==
X-Google-Smtp-Source: ACHHUZ7i+EBDY2WITwEIRgKogtaSChdc3S4PwWz2Qp9PZP5xCpoeIGDCpD2gClqT3kwLonr4MotjvY3YKsBM2PtVtCk=
X-Received: by 2002:a1f:bd58:0:b0:46d:fd21:76fb with SMTP id
 n85-20020a1fbd58000000b0046dfd2176fbmr580943vkf.10.1686642784529; Tue, 13 Jun
 2023 00:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-13-brgl@bgdev.pl>
 <20230612203255.72t52ucry7zzq3em@halaney-x13s>
In-Reply-To: <20230612203255.72t52ucry7zzq3em@halaney-x13s>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 13 Jun 2023 09:52:53 +0200
Message-ID: <CAMRc=MfmzWDZuXpb4ySxi0Xu6EWVuEZ4ReaEYbo4KCMme-+G4A@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 12/26] net: stmmac: dwmac-qcom-ethqos: add
 support for the optional serdes phy
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

T24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgMTA6MzPigK9QTSBBbmRyZXcgSGFsYW5leSA8YWhhbGFu
ZXlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxMiwgMjAyMyBhdCAxMToyMzo0
MUFNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBH
b2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IE9uIHNh
ODc3NXAgcGxhdGZvcm1zLCB0aGVyZSdzIGEgU0dNSUkgU2VyRGVzIFBIWSBiZXR3ZWVuIHRoZSBN
QUMgYW5kCj4gPiBleHRlcm5hbCBQSFkgdGhhdCB3ZSBuZWVkIHRvIGVuYWJsZSBhbmQgY29uZmln
dXJlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ou
Z29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gIC4uLi9zdG1pY3JvL3N0bW1hYy9k
d21hYy1xY29tLWV0aHFvcy5jICAgICAgICB8IDM3ICsrKysrKysrKysrKysrKysrKysKPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+ID4g
aW5kZXggOGVkMDVmMjlmZThiLi4zNDM4YjYyMjkzNTEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jCj4gPiArKysg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5j
Cj4gPiBAQCAtNiw2ICs2LDcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+Cj4g
PiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4gICNpbmNsdWRlIDxsaW51
eC9waHkuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgo+ID4gICNpbmNsdWRlIDxs
aW51eC9wcm9wZXJ0eS5oPgo+ID4KPiA+ICAjaW5jbHVkZSAic3RtbWFjLmgiCj4gPiBAQCAtOTMs
NiArOTQsNyBAQCBzdHJ1Y3QgcWNvbV9ldGhxb3Mgewo+ID4KPiA+ICAgICAgIHVuc2lnbmVkIGlu
dCByZ21paV9jbGtfcmF0ZTsKPiA+ICAgICAgIHN0cnVjdCBjbGsgKnJnbWlpX2NsazsKPiA+ICsg
ICAgIHN0cnVjdCBwaHkgKnNlcmRlc19waHk7Cj4gPiAgICAgICB1bnNpZ25lZCBpbnQgc3BlZWQ7
Cj4gPgo+ID4gICAgICAgY29uc3Qgc3RydWN0IGV0aHFvc19lbWFjX3BvciAqcG9yOwo+ID4gQEAg
LTU2Niw2ICs1NjgsMzAgQEAgc3RhdGljIHZvaWQgZXRocW9zX2ZpeF9tYWNfc3BlZWQodm9pZCAq
cHJpdiwgdW5zaWduZWQgaW50IHNwZWVkKQo+ID4gICAgICAgZXRocW9zX2NvbmZpZ3VyZShldGhx
b3MpOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIGludCBxY29tX2V0aHFvc19zZXJkZXNfcG93ZXJ1
cChzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiwgdm9pZCAqcHJpdikKPiA+ICt7Cj4gPiArICAgICBz
dHJ1Y3QgcWNvbV9ldGhxb3MgKmV0aHFvcyA9IHByaXY7Cj4gPiArICAgICBpbnQgcmV0Owo+ID4g
Kwo+ID4gKyAgICAgcmV0ID0gcGh5X3NldF9zcGVlZChldGhxb3MtPnNlcmRlc19waHksIGV0aHFv
cy0+c3BlZWQpOwo+ID4gKyAgICAgaWYgKHJldCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJl
dDsKPiA+ICsKPiA+ICsgICAgIHJldCA9IHBoeV9pbml0KGV0aHFvcy0+c2VyZGVzX3BoeSk7Cj4g
PiArICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4g
KyAgICAgcmV0dXJuIHBoeV9wb3dlcl9vbihldGhxb3MtPnNlcmRlc19waHkpOwo+Cj4gVGhlIGRv
Y3Mgc2F5IChwaHkucnN0KToKPgo+ICAgICBUaGUgZ2VuZXJhbCBvcmRlciBvZiBjYWxscyBzaG91
bGQgYmU6Ogo+Cj4gICAgICAgICBbZGV2bV9dW29mX11waHlfZ2V0KCkKPiAgICAgICAgIHBoeV9p
bml0KCkKPiAgICAgICAgIHBoeV9wb3dlcl9vbigpCj4gICAgICAgICBbcGh5X3NldF9tb2RlW19l
eHRdKCldCj4gICAgICAgICAuLi4KPiAgICAgICAgIHBoeV9wb3dlcl9vZmYoKQo+ICAgICAgICAg
cGh5X2V4aXQoKQo+ICAgICAgICAgW1tvZl9dcGh5X3B1dCgpXQo+Cj4gICAgIFNvbWUgUEhZIGRy
aXZlcnMgbWF5IG5vdCBpbXBsZW1lbnQgOmM6ZnVuYzpgcGh5X2luaXRgIG9yIDpjOmZ1bmM6YHBo
eV9wb3dlcl9vbmAsCj4gICAgIGJ1dCBjb250cm9sbGVycyBzaG91bGQgYWx3YXlzIGNhbGwgdGhl
c2UgZnVuY3Rpb25zIHRvIGJlIGNvbXBhdGlibGUgd2l0aCBvdGhlcgo+ICAgICBQSFlzLiBTb21l
IFBIWXMgbWF5IHJlcXVpcmUgOmM6ZnVuYzpgcGh5X3NldF9tb2RlIDxwaHlfc2V0X21vZGVfZXh0
PmAsIHdoaWxlCj4gICAgIG90aGVycyBtYXkgdXNlIGEgZGVmYXVsdCBtb2RlICh0eXBpY2FsbHkg
Y29uZmlndXJlZCB2aWEgZGV2aWNldHJlZSBvciBvdGhlcgo+ICAgICBmaXJtd2FyZSkuIEZvciBj
b21wYXRpYmlsaXR5LCB5b3Ugc2hvdWxkIGFsd2F5cyBjYWxsIHRoaXMgZnVuY3Rpb24gaWYgeW91
IGtub3cKPiAgICAgd2hhdCBtb2RlIHlvdSB3aWxsIGJlIHVzaW5nLiBHZW5lcmFsbHksIHRoaXMg
ZnVuY3Rpb24gc2hvdWxkIGJlIGNhbGxlZCBhZnRlcgo+ICAgICA6YzpmdW5jOmBwaHlfcG93ZXJf
b25gLCBhbHRob3VnaCBzb21lIFBIWSBkcml2ZXJzIG1heSBhbGxvdyBpdCBhdCBhbnkgdGltZS4K
Pgo+IE5vdCByZWFsbHkgZGljdGF0aW5nIHlvdSBuZWVkIHRvIGRvIHRoYXQgb3JkZXIsIGJ1dCBp
ZiBwb3NzaWJsZSBJIHRoaW5rCj4gY2FsbGluZyBwaHlfc2V0X3NwZWVkIGFmdGVyIGluaXQgKyBw
b3dlcl9vbiBpcyBtb3JlIGdlbmVyaWMuIE5vdCBzdXJlIGlmCj4gdGhhdCBwbGF5cyBuaWNlIHdp
dGggdGhlIHBoeSBkcml2ZXIgaW4gdGhpcyBzZXJpZXMgb3Igbm90Lgo+Cj4gT3RoZXJ3aXNlLCBJ
IHRoaW5rIHRoaXMgbG9va3MgZ29vZC4KPgoKSSBoYWQgdG8gcmV3b3JrIHRoZSBQSFkgZHJpdmVy
IGNvZGUgYSBiaXQgZm9yIHRoaXMgb3JkZXIgdG8gd29yayBidXQKaXQnbGwgYmUgZ29vZCBub3cg
aW4gdjIuCgpUaGFua3MhCkJhcnQKCj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIHFjb21f
ZXRocW9zX3NlcmRlc19wb3dlcmRvd24oc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYsIHZvaWQgKnBy
aXYpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IHFjb21fZXRocW9zICpldGhxb3MgPSBwcml2Owo+
ID4gKwo+ID4gKyAgICAgcGh5X3Bvd2VyX29mZihldGhxb3MtPnNlcmRlc19waHkpOwo+ID4gKyAg
ICAgcGh5X2V4aXQoZXRocW9zLT5zZXJkZXNfcGh5KTsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGlj
IGludCBldGhxb3NfY2xrc19jb25maWcodm9pZCAqcHJpdiwgYm9vbCBlbmFibGVkKQo+ID4gIHsK
PiA+ICAgICAgIHN0cnVjdCBxY29tX2V0aHFvcyAqZXRocW9zID0gcHJpdjsKPiA+IEBAIC02NTEs
NiArNjc3LDEyIEBAIHN0YXRpYyBpbnQgcWNvbV9ldGhxb3NfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiA+ICAgICAgIGlmIChyZXQpCj4gPiAgICAgICAgICAgICAgIGdvdG8g
b3V0X2NvbmZpZ19kdDsKPiA+Cj4gPiArICAgICBldGhxb3MtPnNlcmRlc19waHkgPSBkZXZtX3Bo
eV9vcHRpb25hbF9nZXQoZGV2LCAic2VyZGVzIik7Cj4gPiArICAgICBpZiAoSVNfRVJSKGV0aHFv
cy0+c2VyZGVzX3BoeSkpIHsKPiA+ICsgICAgICAgICAgICAgcmV0ID0gUFRSX0VSUihldGhxb3Mt
PnNlcmRlc19waHkpOwo+ID4gKyAgICAgICAgICAgICBnb3RvIG91dF9jb25maWdfZHQ7Cj4gPiAr
ICAgICB9Cj4gPiArCj4gPiAgICAgICBldGhxb3MtPnNwZWVkID0gU1BFRURfMTAwMDsKPiA+ICAg
ICAgIGV0aHFvc191cGRhdGVfcmdtaWlfY2xrKGV0aHFvcywgU1BFRURfMTAwMCk7Cj4gPiAgICAg
ICBldGhxb3Nfc2V0X2Z1bmNfY2xrX2VuKGV0aHFvcyk7Cj4gPiBAQCAtNjY2LDYgKzY5OCwxMSBA
QCBzdGF0aWMgaW50IHFjb21fZXRocW9zX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gPiAgICAgICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJxY29tLHFjczQw
NC1ldGhxb3MiKSkKPiA+ICAgICAgICAgICAgICAgcGxhdF9kYXQtPnJ4X2Nsa19ydW5zX2luX2xw
aSA9IDE7Cj4gPgo+ID4gKyAgICAgaWYgKGV0aHFvcy0+c2VyZGVzX3BoeSkgewo+ID4gKyAgICAg
ICAgICAgICBwbGF0X2RhdC0+c2VyZGVzX3Bvd2VydXAgPSBxY29tX2V0aHFvc19zZXJkZXNfcG93
ZXJ1cDsKPiA+ICsgICAgICAgICAgICAgcGxhdF9kYXQtPnNlcmRlc19wb3dlcmRvd24gID0gcWNv
bV9ldGhxb3Nfc2VyZGVzX3Bvd2VyZG93bjsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICAgICAgIHJl
dCA9IHN0bW1hY19kdnJfcHJvYmUoZGV2LCBwbGF0X2RhdCwgJnN0bW1hY19yZXMpOwo+ID4gICAg
ICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgZ290byBvdXRfY29uZmlnX2R0Owo+ID4gLS0K
PiA+IDIuMzkuMgo+ID4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
