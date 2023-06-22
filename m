Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4197373A0D1
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 14:25:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C04BDC65E4F;
	Thu, 22 Jun 2023 12:25:53 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86DB9C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 12:25:52 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-440ad406bc8so1387784137.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687436751; x=1690028751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LfXyQrUfadjr8GnkWzNVYudXWoJvyTwyORcnxDrw72I=;
 b=N/OcqIg+9X1ZFyS2Xesam6kAIxWkO3Aox0KRyQupWTJt3saeePsFJmkmxqlYNtFyEz
 s93LdrFJ6Ll0U9MLdZ4/vxv+fypKnHyw67tnMDYwkhQlqB4Nv4OTWwo8l/veUJJfIWUl
 +KXTYo/S7ggyIbuSAMXfnEyIW6bhFtEWxoX+Jeg9CPj52BdOaAvv6ltkWLveKCjhI93a
 vXK7j4K6qwSa5CeAveq38n+bzTgv/FrqOhwdhhHY2PQsj483PzbG6P5LKf+XAfrHxjQd
 t4TSkVmnYUz0QlOmL+2mMesB5EyicVZsEbppQ3yCI91ufysl8E1r5Qa31fFJQvp3WXLk
 5Ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687436751; x=1690028751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LfXyQrUfadjr8GnkWzNVYudXWoJvyTwyORcnxDrw72I=;
 b=CbfDLz9IUaugfB1l5QACwx7xbNCsdJH4bDZqsnspg3fFRrbLfx0uoiVbSJ1xA/wN7m
 YGx2wWFN6mrlGdMejbrWpndqWbnY+1ORvjXBTgKwC7/Wmyjib+tnShC1YkOg1kgN2Edt
 FxRyAdOemqo1dISi2HGJadyltss54ZE5OKSrHreGK0s39muZSOMLfsDSwntZaNvYkoVS
 BMfcqjn0Is46bCmbU4F4dK+VHZ0SLuM9lKlJNzzrI8XgI0tU2aMQoJ/DHz/RBH4X/6BU
 asz13M+vWdq/dXTI7SC0o83U+v1T9YJtLLTcSzeHrCUMx8s9j3TwGzqZA4yMpoTQNNv/
 QeAw==
X-Gm-Message-State: AC+VfDy+NVhxIPQwsLFP+Vp2PcQt3yhLMgqOwmyoJms5/xRgrdbT+qFN
 qtsLT4g/5lzsX0HO1WvSZQ+c/hLlA/RoPJdohgna8g==
X-Google-Smtp-Source: ACHHUZ6SnNysVqnQMX32/VGp1JafxeiEraOqNdQgR8u2Q27PiGxy3hRuTzgEhX3Wz9Z/6G3DxHhWxRsPEa15hB0FdTA=
X-Received: by 2002:a67:fdc2:0:b0:440:ac0e:66e1 with SMTP id
 l2-20020a67fdc2000000b00440ac0e66e1mr5309391vsq.13.1687436751354; Thu, 22 Jun
 2023 05:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230621153650.440350-1-brgl@bgdev.pl>
 <20230621153650.440350-8-brgl@bgdev.pl>
 <ZJQ7PX01NAXmr7RV@corigine.com>
In-Reply-To: <ZJQ7PX01NAXmr7RV@corigine.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Jun 2023 14:25:40 +0200
Message-ID: <CAMRc=McXAdvnxyULwhK_0+oLdo6s32q9bU06Upec-a3-zhrqyw@mail.gmail.com>
To: Simon Horman <simon.horman@corigine.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Junxiao Chang <junxiao.chang@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 07/11] net: stmmac: platform:
	provide stmmac_pltfr_remove_no_dt()
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

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgMjoxNeKAr1BNIFNpbW9uIEhvcm1hbiA8c2ltb24uaG9y
bWFuQGNvcmlnaW5lLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAyMSwgMjAyMyBhdCAwNToz
Njo0NlBNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9z
eiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IEFk
ZCBhIHZhcmlhbnQgb2Ygc3RtbWFjX3BsdGZyX3JlbW92ZSgpIHRoYXQgb25seSBmcmVlcyByZXNv
dXJjZXMKPiA+IGFsbG9jYXRlZCBieSBzdG1tYWNfcGx0ZnJfcHJvYmUoKSBhbmQgLSB1bmxpa2Ug
c3RtbWFjX3BsdGZyX3JlbW92ZSgpIC0KPiA+IGRvZXMgbm90IGNhbGwgc3RtbWFjX3JlbW92ZV9j
b25maWdfZHQoKS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
YXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+ICAuLi4vZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvc3RtbWFjX3BsYXRmb3JtLmMgfCAyMCArKysrKysrKysrKysrKysrKy0t
Cj4gPiAgLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wbGF0Zm9ybS5oIHwgIDEg
Kwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiA+Cj4KPiBIaSBCYXJ0b3N6LAo+Cj4gc29tZSBtaW5vciBmZWVkYmFjayBmcm9tIG15IHNpZGUg
YXMgaXQgbG9va3MgbGlrZSB0aGVyZSB3aWxsIGJlIGEgdjIgYW55d2F5Lgo+Cj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BsYXRmb3Jt
LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcGxhdGZvcm0u
Ywo+ID4gaW5kZXggZGY0MTdjZGFiOGMxLi41OGQ1YzVjYzIyNjkgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcGxhdGZvcm0uYwo+ID4g
KysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BsYXRmb3Jt
LmMKPiA+IEBAIC03NjIsNiArNzYyLDIzIEBAIGludCBzdG1tYWNfcGx0ZnJfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwoc3Rt
bWFjX3BsdGZyX3Byb2JlKTsKPiA+Cj4gPiArLyoqCj4gPiArICogc3RtbWFjX3BsdGZyX3JlbW92
ZV9ub19kdAo+ID4gKyAqIEBwZGV2OiBwb2ludGVyIHRvIHRoZSBwbGF0Zm9ybSBkZXZpY2UKPiA+
ICsgKiBEZXNjcmlwdGlvbjogVGhpcyB1bmRvZXMgdGhlIGVmZmVjdHMgb2Ygc3RtbWFjX3BsdGZy
X3Byb2JlKCkgYnkgcmVtb3ZpbmcgdGhlCj4gPiArICogZHJpdmVyIGFuZCBjYWxsaW5nIHRoZSBw
bGF0Zm9ybSdzIGV4aXQoKSBjYWxsYmFjay4KPiA+ICsgKi8KPiA+ICt2b2lkIHN0bW1hY19wbHRm
cl9yZW1vdmVfbm9fZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICt7Cj4gPiAr
ICAgICBzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYp
Owo+ID4gKyAgICAgc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7
Cj4gPiArICAgICBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXQgPSBwcml2LT5wbGF0
Owo+Cj4gbml0OiBwbGVhc2UgdXNlIHJldmVyc2UgeG1hcyB0cmVlIC0gbG9uZ2VzdCBsaW5lIHRv
IHNob3J0ZXN0IC0gZm9yCj4gICAgICBuZXcgTmV0d29ya2luZyBjb2RlLgo+Cj4gICAgICBlLmcu
Ogo+Cj4gICAgICAgICBzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiA9IHBsYXRmb3JtX2dldF9kcnZk
YXRhKHBkZXYpOwo+ICAgICAgICAgc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0ZGV2X3By
aXYobmRldik7Cj4gICAgICAgICBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXQgPSBw
bGF0Owo+Cj4gICAgICAgICBwbGF0ID0gcHJpdi0+cGxhdDsKPgoKSSBub3JtYWxseSBzdGljayB0
byB0aGlzIGNvbnZlbnRpb24gYnV0IGhlcmUsIHlvdSBuZWVkIDUgbGluZXMgZm9yIHRoZQpzYW1l
IGVmZmVjdCBhbmQgeW91IG1ha2UgaXQgbW9yZSBjb25mdXNpbmcgYnkgaW5pdGlhbGl6aW5nIHNv
bWUgb2YgdGhlCnZhcmlhYmxlcyBhdCB0aGVpciBkZWNsYXJhdGlvbiBhbmQgc29tZSBub3QuIElu
IG90aGVyIHBsYWNlcyBpbiB0aGlzCmRyaXZlciB0aGUgc2FtZSBhcHByb2FjaCBpcyB1c2VkIGku
ZS4gbm90IGFkaGVyaW5nIHRvIHJldmVyc2UgeG1hcwp0cmVlIHdoZW4gYWxsIHZhcmlhYmxlcyBh
cmUgaW5pdGlhbGl6ZWQgd2hlbiBkZWNsYXJlZC4KCkJhcnQKCj4gPiArCj4gPiArICAgICBzdG1t
YWNfZHZyX3JlbW92ZSgmcGRldi0+ZGV2KTsKPiA+ICsgICAgIHN0bW1hY19wbHRmcl9leGl0KHBk
ZXYsIHBsYXQpOwo+ID4gK30KPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChzdG1tYWNfcGx0ZnJfcmVt
b3ZlX25vX2R0KTsKPiA+ICsKPiA+ICAvKioKPiA+ICAgKiBzdG1tYWNfcGx0ZnJfcmVtb3ZlCj4g
PiAgICogQHBkZXY6IHBsYXRmb3JtIGRldmljZSBwb2ludGVyCj4KPiAuLi4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
