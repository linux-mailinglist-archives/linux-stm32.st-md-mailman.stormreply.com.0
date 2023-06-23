Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B6973BF24
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 22:00:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27505C65E42;
	Fri, 23 Jun 2023 20:00:32 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCB4AC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 20:00:30 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-78f1dd09289so388393241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687550429; x=1690142429;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m1M1xaiNrSMz3C3bpTzsCCZISH1fndbXxP2b6AYA7P8=;
 b=25Kx93HWxGNrW7i8PiktSOxdVI0xb3gbLHu/eSh/j7KcjQodThxWFZuBF6WKG7vUNS
 fYGM58rw15YqtrfK2oWLKC89wNDMbmfUK8+JUWu7fId3vSV6WvME2X6LNspLodF8+Gzk
 JeGZfAvppULZbqGu0aJaAxlUxXk+SBbxfbERd5XMyCmMiMWuNJUgw4blEMn28OAKgq5x
 g57zEZlB4IiEhm4455u2ZGEzB8LTZ/xNmtAKaKdOAlIvBBzUBx/DuWC9ZSunGwJEHezU
 6t9WGtZdYGDquTmuZk1GnP1yKTKRpGH0LGW7iszsplwh/aOwdfaW5wDh3OjguCw5FfAN
 +Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687550429; x=1690142429;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m1M1xaiNrSMz3C3bpTzsCCZISH1fndbXxP2b6AYA7P8=;
 b=MqAOyVMMTRsfd5bFkUAqCJVTanRzLeINM1RCI9TzN/CC+x/hdihcvfQ4yRIYLf9QAT
 uOh6yCnqUcjTNdmjL7yUqJ0xrBiDhq73yiMKIjPcOUKhMo68SK4LC/YhQdmYv566tR2W
 xyyI2dMGVbO2DJ97U396au9ro5AIH9bQce52aIlYNSQcN2UrQWVj0RIXiGUCE8bJh7lV
 parNA4yOyAt06zzvaGxpcT3NKHwDEgnSOVyRNHdizD3IKWEpjX7opljc8zFbCjW6R+Am
 oXQNsV06+xDlVKcY0TdYXgGuus/bbc255rEn441nO5q1alcMbtsfXQm3R+VhU3mF5B4E
 euCQ==
X-Gm-Message-State: AC+VfDw9Z8gOFciXj+38jVuGBS9czrjnvgEMLY/nvqAOz6sJCkXncGp2
 XfKPDiKgw9XSCvhu5NMgy8eq2QGIYmxBIGC1wA6p4Q==
X-Google-Smtp-Source: ACHHUZ4dgCpqMi4ZlVuTYZHeFbBd4fFXdHkx89qsxKlJ0GOPlCr0eVv4RzmW7IXVicUlGnXnteN3dR3IFwrJ2sBV24Y=
X-Received: by 2002:a05:6102:2453:b0:440:d2f5:e36d with SMTP id
 g19-20020a056102245300b00440d2f5e36dmr5548679vss.14.1687550429626; Fri, 23
 Jun 2023 13:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230623100845.114085-1-brgl@bgdev.pl>
 <20230623100845.114085-3-brgl@bgdev.pl>
 <ZJXw+92ee7CGtnCS@corigine.com>
In-Reply-To: <ZJXw+92ee7CGtnCS@corigine.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 23 Jun 2023 22:00:18 +0200
Message-ID: <CAMRc=MeXtK8kNbNo0u7onz3vmKS1eHWdok7vGFRMr41S2Aehvg@mail.gmail.com>
To: Simon Horman <simon.horman@corigine.com>
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 02/12] net: stmmac: replace
 the sph_disable field with a flag
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

T24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgOToyMuKAr1BNIFNpbW9uIEhvcm1hbiA8c2ltb24uaG9y
bWFuQGNvcmlnaW5lLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAyMywgMjAyMyBhdCAxMjow
ODozNVBNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9z
eiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IERy
b3AgdGhlIGJvb2xlYW4gZmllbGQgb2YgdGhlIHBsYXRfc3RtbWFjZW5ldF9kYXRhIHN0cnVjdHVy
ZSBpbiBmYXZvciBvZiBhCj4gPiBzaW1wbGUgYml0ZmllbGQgZmxhZy4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5v
cmc+Cj4KPiAuLi4KPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLWludGVsLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1pbnRlbC5jCj4gPiBpbmRleCBhYjlmODc2YjZkZjcuLjcwZTkxYmJlZjJhNiAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
LWludGVsLmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3
bWFjLWludGVsLmMKPiA+IEBAIC00NTksNyArNDU5LDcgQEAgc3RhdGljIGludCBpbnRlbF9tZ2Jl
X2NvbW1vbl9kYXRhKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+ID4gICAgICAgcGxhdC0+aGFzX2dt
YWM0ID0gMTsKPiA+ICAgICAgIHBsYXQtPmZvcmNlX3NmX2RtYV9tb2RlID0gMDsKPiA+ICAgICAg
IHBsYXQtPnRzb19lbiA9IDE7Cj4gPiAtICAgICBwbGF0LT5zcGhfZGlzYWJsZSA9IDE7Cj4gPiAr
ICAgICBkYXRhLT5mbGFncyB8PSBTVE1NQUNfRkxBR19TUEhfRElTQUJMRTsKPgo+IEhpIEJhcnRv
c3osCj4KPiBJIHRoaW5rIHNvbWV0aGluZyBtdXN0IGhhdmUgZ290IG1peGVkLXVwIGhlcmUuCj4g
QW4geDg2XzY0IGFsbG1vZGNvbmZpZyByZXBvcnRzIHRoYXQgZGF0YSBpcyB1bmRlY2xhcmVkIGhl
cmUuCj4KCkNyKnAsIEkgdGhvdWdodCBJIGJ1aWxkLXRlc3RlZCBldmVyeXRoaW5nLi4uCgpNeSBi
YWQsIEknbGwgcmVzZW5kIGEgdjMgYWZ0ZXIgdGhlIG1lcmdlIHdpbmRvdy4KCkJhcnQKCj4gLi4u
Cj4KPiAtLQo+IHB3LWJvdDogY2hhbmdlcy1yZXF1ZXN0ZWQKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
