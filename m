Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C272F5E5
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 09:18:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 333DEC6A61A;
	Wed, 14 Jun 2023 07:18:20 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06C26C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 07:18:18 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-76d846a4b85so750100241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 00:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686727098; x=1689319098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xWqp8+3MZcT/Qp4VzgeJFqfoJNX477ShUvbIsRioGOw=;
 b=MiCweefJaq2Rs0ySFI2YdvxxsjV+Tz+OX0tIhBr/LjFZitS74y2nNqvs6OlVYfv2jN
 8TF3c2dxnGSXewEgziDxxbGNEAnZHZn17Mpg64TaHDAiU1cGkGg4iqGJxKPkx4PfEDz7
 KgL1Ar+uP+3WBeEroqFl9aFVrIg3ymtIz/BO8L5owGvjmGkDYaxmc/a4rm+TAAJ2rnMN
 QI8mHooJ381PRQHeI+j+kss74OjpD5qy4bTJOiYXPctm9TY6m94Sf9fKLUVN5zq4rxGW
 lLNG1Osegk5tDnCL6bDzlbg/Gw9QfrZ4AJGg2r5xjkl/OWBmXvF9U9VG53qDFVbRGx+Q
 SOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686727098; x=1689319098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWqp8+3MZcT/Qp4VzgeJFqfoJNX477ShUvbIsRioGOw=;
 b=UxHgEkAhyzcurg5/9sgfwHqKPLaCkGbExOYLQ1x/ehL/s1HLmmsPcsPK//81RcKCMi
 /vbi2v2v2e1PamhA//4Eg8LSlQDqLvTkYTghwE7zHHaKTzKSxEt3rk4QqDCIIuwmJHf9
 bPFjkkn/A8BuEjIbWGGt8/RD2LIhqzobniAA0VV6+qg2u+9+r64GSDhFQXELOKg2k9Qw
 UaRpPmSrsg49W0n18lUPQpbVII33N2+13iU9ZuNDnMLFLJRyiJ9IZSV0UdcdXFLizteO
 KhhE3UIrDbjWdS5I6/PGHijH6Lv1YjNi1AH1mGqdN5yPtxZXpbB4InF9TymlK0rH3jiB
 e/Vg==
X-Gm-Message-State: AC+VfDy2Z1PI9vp1mL3ZoWUzxBKnmI2MPOBjIrl9Ux6T10T7GDabHSFx
 9y/iUx+gy0IPFahkn/ihJreaUlNgnjMvD9aB8ZipVw==
X-Google-Smtp-Source: ACHHUZ5/lIGOUl/l3ycPBA6fbzQyMwAzSP8rc7XBTn1VRb2W3EotcDSLMNZEqinAXiE/Za/C+5sDlrb/IA4v9qkeWCA=
X-Received: by 2002:a67:b401:0:b0:434:7856:bf9f with SMTP id
 x1-20020a67b401000000b004347856bf9fmr6830203vsl.12.1686727097789; Wed, 14 Jun
 2023 00:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-4-brgl@bgdev.pl>
 <7fe7078e-404d-28e5-0dd1-53b7f9cd7626@linaro.org>
In-Reply-To: <7fe7078e-404d-28e5-0dd1-53b7f9cd7626@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Jun 2023 09:18:06 +0200
Message-ID: <CAMRc=MdwqF9_LM2BeVOtx+DaKv8Cv8Bp-cP=sE-RBO=UoosSLg@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
 Vinod Koul <vkoul@kernel.org>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 03/26] phy: qcom: add the SGMII SerDes PHY
	driver
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

T24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgMTE6NDXigK9BTSBLb25yYWQgRHliY2lvIDxrb25yYWQu
ZHliY2lvQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4KPgo+IE9uIDEyLjA2LjIwMjMgMTE6MjMsIEJh
cnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
YXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPgo+ID4gSW1wbGVtZW50IHN1cHBvcnQg
Zm9yIHRoZSBTR01JSS9TZXJEZXMgUEhZIHByZXNlbnQgb24gdmFyaW91cyBRdWFsY29tbQo+ID4g
cGxhdGZvcm1zLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJh
cnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgcmVnbWFwX2NvbmZpZyBxY29tX2R3bWFjX3NnbWlpX3BoeV9yZWdtYXBfY2ZnID0gewo+
ID4gKyAgICAgLnJlZ19iaXRzICAgICAgICAgICAgICAgPSAzMiwKPiA+ICsgICAgIC52YWxfYml0
cyAgICAgICAgICAgICAgID0gMzIsCj4gPiArICAgICAucmVnX3N0cmlkZSAgICAgICAgICAgICA9
IDQsCj4gPiArICAgICAudXNlX3JlbGF4ZWRfbW1pbyAgICAgICA9IHRydWUsCj4gPiArICAgICAu
ZGlzYWJsZV9sb2NraW5nICAgICAgICA9IHRydWUsCj4gVGhlIGxhc3QgdHdvIGFyZSByYXRoZXIg
YnJhdmUsIG5vPwo+CgpXZSBkb24ndCBuZWVkIGxvY2tpbmcgYmVjYXVzZSBhbGwgY2FsbGJhY2tz
IGFyZSBhbHJlYWR5IHByb3RlY3RlZCBieQp0aGUgcGh5IHN1YnN5c3RlbSB3aXRoIGEgbXV0ZXgg
YW5kIEkgZG9uJ3QgcmVhbGx5IHNlZSBhbnl0aGluZyB0aGF0CndvdWxkIG1ha2UgaXQgZGFuZ2Vy
b3VzIHRvIHVzZSByZWxheGVkIHNlbWFudGljcyBpbiB0aGlzIGRyaXZlci4gSXQncwpqdXN0IGJh
c2ljIGNvbmZpZ3VyYXRpb24uCgpCYXJ0Cgo+IEtvbnJhZAo+ID4gK307Cj4gPiArCj4gPiArc3Rh
dGljIGludCBxY29tX2R3bWFjX3NnbWlpX3BoeV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBxY29tX2R3bWFjX3NnbWlpX3BoeV9kYXRh
ICpkYXRhOwo+ID4gKyAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+ICsg
ICAgIHN0cnVjdCBwaHlfcHJvdmlkZXIgKnByb3ZpZGVyOwo+ID4gKyAgICAgc3RydWN0IGNsayAq
cmVmY2xrOwo+ID4gKyAgICAgdm9pZCBfX2lvbWVtICpiYXNlOwo+ID4gKyAgICAgc3RydWN0IHBo
eSAqcGh5Owo+ID4gKwo+ID4gKyAgICAgZGF0YSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigq
ZGF0YSksIEdGUF9LRVJORUwpOwo+ID4gKyAgICAgaWYgKCFkYXRhKQo+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+ICsgICAgIGJhc2UgPSBkZXZtX3BsYXRmb3JtX2lv
cmVtYXBfcmVzb3VyY2UocGRldiwgMCk7Cj4gPiArICAgICBpZiAoSVNfRVJSKGJhc2UpKQo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihiYXNlKTsKPiA+ICsKPiA+ICsgICAgIGRhdGEt
PnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfbW1pbyhkZXYsIGJhc2UsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnFjb21fZHdtYWNfc2dtaWlfcGh5X3Jl
Z21hcF9jZmcpOwo+ID4gKyAgICAgaWYgKElTX0VSUihkYXRhLT5yZWdtYXApKQo+ID4gKyAgICAg
ICAgICAgICByZXR1cm4gUFRSX0VSUihkYXRhLT5yZWdtYXApOwo+ID4gKwo+ID4gKyAgICAgcGh5
ID0gZGV2bV9waHlfY3JlYXRlKGRldiwgTlVMTCwgJnFjb21fZHdtYWNfc2dtaWlfcGh5X29wcyk7
Cj4gPiArICAgICBpZiAoSVNfRVJSKHBoeSkpCj4gPiArICAgICAgICAgICAgIHJldHVybiBQVFJf
RVJSKHBoeSk7Cj4gPiArCj4gPiArICAgICByZWZjbGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZChk
ZXYsICJzZ21pX3JlZiIpOwo+ID4gKyAgICAgaWYgKElTX0VSUihyZWZjbGspKQo+ID4gKyAgICAg
ICAgICAgICByZXR1cm4gUFRSX0VSUihyZWZjbGspOwo+ID4gKwo+ID4gKyAgICAgcHJvdmlkZXIg
PSBkZXZtX29mX3BoeV9wcm92aWRlcl9yZWdpc3RlcihkZXYsIG9mX3BoeV9zaW1wbGVfeGxhdGUp
Owo+ID4gKyAgICAgaWYgKElTX0VSUihwcm92aWRlcikpCj4gPiArICAgICAgICAgICAgIHJldHVy
biBQVFJfRVJSKHByb3ZpZGVyKTsKPiA+ICsKPiA+ICsgICAgIHBoeV9zZXRfZHJ2ZGF0YShwaHks
IGRhdGEpOwo+ID4gKyAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZGF0YSk7Cj4gPiAr
Cj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgcWNvbV9kd21hY19zZ21paV9waHlfb2ZfbWF0Y2hbXSA9IHsKPiA+ICsg
ICAgIHsgLmNvbXBhdGlibGUgPSAicWNvbSxzYTg3NzVwLWR3bWFjLXNnbWlpLXBoeSIgfSwKPiA+
ICsgICAgIHsgfSwKPiA+ICt9Owo+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHFjb21fZHdt
YWNfc2dtaWlfcGh5X29mX21hdGNoKTsKPiA+ICsKPiA+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciBxY29tX2R3bWFjX3NnbWlpX3BoeV9kcml2ZXIgPSB7Cj4gPiArICAgICAucHJvYmUg
ID0gcWNvbV9kd21hY19zZ21paV9waHlfcHJvYmUsCj4gPiArICAgICAuZHJpdmVyID0gewo+ID4g
KyAgICAgICAgICAgICAubmFtZSAgID0gInFjb20tZHdtYWMtc2dtaWktcGh5IiwKPiA+ICsgICAg
ICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gcWNvbV9kd21hY19zZ21paV9waHlfb2ZfbWF0Y2gs
Cj4gPiArICAgICB9Cj4gPiArfTsKPiA+ICsKPiA+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHFj
b21fZHdtYWNfc2dtaWlfcGh5X2RyaXZlcik7Cj4gPiArCj4gPiArTU9EVUxFX0RFU0NSSVBUSU9O
KCJRdWFsY29tbSBEV01BQyBTR01JSSBQSFkgZHJpdmVyIik7Cj4gPiArTU9EVUxFX0xJQ0VOU0Uo
IkdQTCIpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
