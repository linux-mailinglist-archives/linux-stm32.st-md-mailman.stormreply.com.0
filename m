Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D86EA52E6
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2019 11:35:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B16FC35E02;
	Mon,  2 Sep 2019 09:35:36 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 617B7C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2019 09:35:34 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id s18so932462qkj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Sep 2019 02:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vAwnLuMjjeItOOqHHXHJmcc2xpDcbEuHDPmJlUbyfys=;
 b=PlrwvAU2KCgLvuLJeYmq+oXRO6WFqP5OyD8x2GqpXCKWsQyaCQv+JWXDCy8y5BWeL5
 yZzac6WC7sgZDmlZSV40kMzZtSar7DmfkwcY+qjoNz7vl+MVUr94nFmNDMGHou7vDoKr
 1B1ExfRcC4j2fSK0hHmzHPehXdJFDwqnzCaQhW/eOsqs4lGEkbHklA9K71U7T7O4JMti
 pbLv48onqk/2cqgkxei++KAtZJvLIWmMwfSgVsLTSoWwHjt8/8NELscJ9gkK0q1XeH9Y
 +xXI99gACrkxEuyAEdP6FgWTd0DNtbq57D/lBrP/cMOsKt7I0hyS5ASpzkb9T4Zy86QP
 4k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vAwnLuMjjeItOOqHHXHJmcc2xpDcbEuHDPmJlUbyfys=;
 b=SeKuoMbUkuRkqqoqC/Oz4c0rh4MoPWNHSK1n86gDguwkaxV+NTQ7lcMKM7SC/dgqzA
 ELriHKY3Z+weJ0R7gUbWa+WAj2fB7Ejx/2CMT6LJg4FpJw2325n4jiw7FTEUSlxIo9QV
 OksOKMLTCKW9Svc19qaIP/dFeGBW/FWp8ymGK/uRl/3RehO1JaRx4OmP4lUUSbGY1tcx
 svR/nO90vAqVkCELGvkTEVQbKf4E8E3xwdYX9g1hYT+UisUBEx1d0hFcKhi5gG6A+BMV
 iLUDBgT24x7cdRvihrD73Qjhn85e95emoD8OGXFPYadJcAPSHMo7bk07ocCSLjVMoaog
 tUWA==
X-Gm-Message-State: APjAAAVv88g5eAIxVIOtZb/2biwmt9i7ZbrQIRyzYIsCqGf3ai4NZKNL
 dHRVPNjQfBe6lwR/T55JeDnv3XU/l4wEaeuiWWbMVw==
X-Google-Smtp-Source: APXvYqwcv2iKNWBzmW6xpbxs7QP7I0kVxvLsIMZ9MSGwXwqDaAyBeeDhkf6dp3c6TQppZmZjMOeNnmx68BmhybQL44Y=
X-Received: by 2002:a37:813:: with SMTP id 19mr24965528qki.427.1567416933410; 
 Mon, 02 Sep 2019 02:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <1564754931-13861-1-git-send-email-yannick.fertre@st.com>
 <50695b37-df51-08d6-a11e-99f9349aa481@st.com>
In-Reply-To: <50695b37-df51-08d6-a11e-99f9349aa481@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 2 Sep 2019 11:35:22 +0200
Message-ID: <CA+M3ks5GaN2-jEHO5-QGGkhYG2U-ExQR4=kNuk0jBxH2BkRGYQ@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: move ltdc pinctrl on
	stm32mp157a dk1 board
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

KyBkcmktZGV2ZWwgbWFpbGluZyBsaXN0CgpMZSBsdW4uIDIgc2VwdC4gMjAxOSDDoCAxMDo0NSwg
UGhpbGlwcGUgQ09STlUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4gYSDDqWNyaXQgOgo+Cj4gSGkg
WWFubmljaywKPgo+IE9uIDgvMi8xOSA0OjA4IFBNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6Cj4g
PiBUaGUgbHRkYyBwaW5jdHJsIG11c3QgYmUgaW4gdGhlIGRpc3BsYXkgY29udHJvbGxlciBub2Rl
IGFuZAo+ID4gbm90IGluIHRoZSBwZXJpcGhlcmFsIG5vZGUgKGhkbWkgYnJpZGdlKS4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4K
PiA+IC0tLQo+ID4gICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kazEuZHRzIHwgNiAr
KystLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2EtZGsx
LmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWRrMS5kdHMKPiA+IGluZGV4IGYz
ZjBlMzcuLjEyODVjZmMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1w
MTU3YS1kazEuZHRzCj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kazEu
ZHRzCj4gPiBAQCAtOTksOSArOTksNiBAQAo+ID4gICAgICAgICAgICAgICByZXNldC1ncGlvcyA9
IDwmZ3Bpb2EgMTAgR1BJT19BQ1RJVkVfTE9XPjsKPiA+ICAgICAgICAgICAgICAgaW50ZXJydXB0
cyA9IDwxIElSUV9UWVBFX0VER0VfRkFMTElORz47Cj4gPiAgICAgICAgICAgICAgIGludGVycnVw
dC1wYXJlbnQgPSA8JmdwaW9nPjsKPiA+IC0gICAgICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IiwgInNsZWVwIjsKPiA+IC0gICAgICAgICAgICAgcGluY3RybC0wID0gPCZsdGRjX3Bp
bnNfYT47Cj4gPiAtICAgICAgICAgICAgIHBpbmN0cmwtMSA9IDwmbHRkY19waW5zX3NsZWVwX2E+
Owo+ID4gICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gPgo+ID4gICAgICAgICAgICAg
ICBwb3J0cyB7Cj4gPiBAQCAtMjc2LDYgKzI3Myw5IEBACj4gPiAgIH07Cj4gPgo+ID4gICAmbHRk
YyB7Cj4gPiArICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic2xlZXAiOwo+ID4gKyAg
ICAgcGluY3RybC0wID0gPCZsdGRjX3BpbnNfYT47Cj4gPiArICAgICBwaW5jdHJsLTEgPSA8Jmx0
ZGNfcGluc19zbGVlcF9hPjsKPgo+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlw
cGUuY29ybnVAc3QuY29tPgo+Cj4gVGhhbmtzCj4gUGhpbGlwcGUgOikKPgo+ID4gICAgICAgc3Rh
dHVzID0gIm9rYXkiOwo+ID4KPiA+ICAgICAgIHBvcnQgewo+ID4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGlu
ZyBsaXN0Cj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
