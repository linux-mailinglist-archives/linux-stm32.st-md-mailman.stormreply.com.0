Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 772EE6E6C35
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 20:36:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 123C7C6A5FA;
	Tue, 18 Apr 2023 18:36:31 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 266FFC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 18:36:30 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2470e93ea71so1644605a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 11:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681842988; x=1684434988;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ApsPN1GAt+bKSjbs42LxkANlc6ClVgqELeBRCapEZOY=;
 b=fcvQ6uiiAwbiDHp9ofdozAuOiqo8sbjEaS1wJfZPJdR7ku/k91ggC43xkhzyyW+7nI
 yL05D8fKTVowBu7cH7oGSbwvorwMmpZfZp+be71T12rL9TRGAsRKhgX9BtbLc+iyZwgq
 Qb48G1rKzQZjLEUD5f92333ozX9LrkHTarpi26AV6WxfUdF8E317PyK+GRvYlhJDse5Z
 MEZRohJ9XuAxL4kVb0Aft7cnNRU1ffRIyB+Hpuwglq4gprdj5r075/QYekStmw9Zcc7e
 uJaoVEg0RaJ6z9kkri0qCgyEJPxz6DZVa/1Zx09Yl/HmHiUZVgIL62G/nueZQ1DngeXx
 2F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681842988; x=1684434988;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ApsPN1GAt+bKSjbs42LxkANlc6ClVgqELeBRCapEZOY=;
 b=h8Bbu2YHvAmvgyA+oB7DWXavzbW9KGQKutXGDnMcKHSRiJFdoDavZI+0dnFBAOgW9C
 KBEwJSD6OZaZpqS6SwxZkJClvlBSTb337oq8aC9Kl0xIRz6O/Oydr8/ZO3ci6SptBVrg
 RE+mh30NxQAfNSngulS84UBHiPq3R3oOuNOPSZAZrpVoBHlVjVL+KK0uCzOOya2GAiw9
 XIgq+JYgTE8w4eD56sYvfqJ8ap1QJrsdaDowO1PydBVm2gB3ySAQ3z8qs2k7xgZ3HH8p
 1HAGgmXZUwnN/OwWyI17acUHzaafScYZ5coK2El+hDGZSSIAgt/00GYeM/CfG3p3rhUM
 ypxA==
X-Gm-Message-State: AAQBX9fchJPO6sz/7mVI6SO0g/sbBIa0ZhCIIAWFGB4g9Uh4NTpaveXl
 YCuMSCAOzQChnUwUJXEEKJs6WnW/QZOf0Nipr/FUnQ==
X-Google-Smtp-Source: AKy350ZShnO2tG7T/57z/jUzMW01PDWOatg+RwsX6uSLq6+zwhs8lAyWd6JaHE6qNghBF+/vCyIJp0/ga1bkMCOPgjE=
X-Received: by 2002:a17:90a:d70b:b0:246:ba3f:4f3e with SMTP id
 y11-20020a17090ad70b00b00246ba3f4f3emr605102pju.6.1681842988421; Tue, 18 Apr
 2023 11:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230418-dwmac-meson8b-clk-cb-cast-v1-1-e892b670cbbb@kernel.org>
In-Reply-To: <20230418-dwmac-meson8b-clk-cb-cast-v1-1-e892b670cbbb@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Apr 2023 11:36:17 -0700
Message-ID: <CAKwvOd=DeCNoQYuTJVfbd0tSddJpGVaKBTEfC-+XUN4OJ4hRRw@mail.gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 linux-amlogic@lists.infradead.org, Sami Tolvanen <samitolvanen@google.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, llvm@lists.linux.dev,
 Tom Rix <trix@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 Nathan Chancellor <nathan@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Nathan Huckleberry <nhuck@google.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-meson8b:
 Avoid cast to incompatible function type
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

T24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgNDowN+KAr0FNIFNpbW9uIEhvcm1hbiA8aG9ybXNAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBSYXRoZXIgdGhhbiBjYXN0aW5nIGNsa19kaXNhYmxlX3VucHJl
cGFyZSB0byBhbiBpbmNvbXBhdGlibGUgZnVuY3Rpb24KPiB0eXBlIHByb3ZpZGUgYSB0cml2aWFs
IHdyYXBwZXIgd2l0aCB0aGUgY29ycmVjdCBzaWduYXR1cmUgZm9yIHRoZQo+IHVzZS1jYXNlLgo+
Cj4gUmVwb3J0ZWQgYnkgY2xhbmctMTYgd2l0aCBXPTE6Cj4KPiAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVzb244Yi5jOjI3Njo2OiBlcnJvcjogY2FzdCBmcm9t
ICd2b2lkICgqKShzdHJ1Y3QgY2xrICopJyB0byAndm9pZCAoKikodm9pZCAqKScgY29udmVydHMg
dG8gaW5jb21wYXRpYmxlIGZ1bmN0aW9uIHR5cGUgWy1XZXJyb3IsLVdjYXN0LWZ1bmN0aW9uLXR5
cGUtc3RyaWN0XQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9p
ZCgqKSh2b2lkICopKWNsa19kaXNhYmxlX3VucHJlcGFyZSwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPiBDb21waWxlIHRlc3RlZCBvbmx5
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU2ltb24gSG9ybWFuIDxob3Jtc0BrZXJuZWwub3JnPgoKVGhh
bmtzIGZvciB0aGUgcGF0Y2ghClJldmlld2VkLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVs
bmllcnNAZ29vZ2xlLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLW1lc29uOGIuYyB8IDggKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZXNvbjhiLmMgYi9kcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZXNvbjhiLmMKPiBpbmRleCBlOGI1MDdmODhm
YmMuLmY2NzU0ZTM2NDNmMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1tZXNvbjhiLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1tZXNvbjhiLmMKPiBAQCAtMjYzLDYgKzI2MywxMSBAQCBzdGF0
aWMgaW50IG1lc29uX2F4Z19zZXRfcGh5X21vZGUoc3RydWN0IG1lc29uOGJfZHdtYWMgKmR3bWFj
KQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCBtZXNvbjhiX2Nsa19k
aXNhYmxlX3VucHJlcGFyZSh2b2lkICpkYXRhKQo+ICt7Cj4gKyAgICAgICBjbGtfZGlzYWJsZV91
bnByZXBhcmUoZGF0YSk7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgbWVzb244Yl9kZXZtX2Nsa19w
cmVwYXJlX2VuYWJsZShzdHJ1Y3QgbWVzb244Yl9kd21hYyAqZHdtYWMsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjbGsgKmNsaykKPiAgewo+IEBA
IC0yNzMsOCArMjc4LDcgQEAgc3RhdGljIGludCBtZXNvbjhiX2Rldm1fY2xrX3ByZXBhcmVfZW5h
YmxlKHN0cnVjdCBtZXNvbjhiX2R3bWFjICpkd21hYywKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPgo+ICAgICAgICAgcmV0dXJuIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkd21hYy0+
ZGV2LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCgqKSh2
b2lkICopKWNsa19kaXNhYmxlX3VucHJlcGFyZSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY2xrKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbWVzb244Yl9jbGtfZGlzYWJsZV91bnByZXBhcmUsIGNsayk7Cj4gIH0KPgo+ICBzdGF0
aWMgaW50IG1lc29uOGJfaW5pdF9yZ21paV9kZWxheXMoc3RydWN0IG1lc29uOGJfZHdtYWMgKmR3
bWFjKQo+CgoKLS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
