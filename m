Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6F991D95D
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2024 09:49:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46141C6C820;
	Mon,  1 Jul 2024 07:49:12 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1060CC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2024 07:49:05 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so30650501fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jul 2024 00:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719820144; x=1720424944;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNKIJU8OGmFNb74tPuLhxgiIWEwrxic6628/n7QE6U4=;
 b=x5m6sWbh3XEy/Lt3DU+PFi8EWNW7KXrDVYZH9uMZiJ0LEThRewy4UEsgwtwxPI3E4f
 r0p3/HoHo43/CK5jjFATy5Q4e7Zn60PRZTB7uR3z6YADS+QzFT8DgbS57ipfOCn9evTB
 czj4AS3CJZJ/fZXC0eS5aDCeeCVwvKfRFztAwnAH8bP6HQ5t/EE5qxswvV0QjAwa5Cya
 u6jntQUhUeFsJnEsKJnpS6Bt34HfbSpIdcUsaRDhEhZlMZDEwXTNyveAbSADOeWOhSk/
 3BWsMVymSGWs5MZ1A+r1UdXoR2+mIsG+H/m+fAOlLst+z1VV21xUHiuAhXLJHsgwwGx1
 olVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719820144; x=1720424944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GNKIJU8OGmFNb74tPuLhxgiIWEwrxic6628/n7QE6U4=;
 b=VsxlUWlgAy/6ojoBd28o06b33hApO2qrRZAuvQNgD9JhFbQqargJjUTy5YwbUMEH9K
 lULazy3RTKYVif6w2dKC+/uFMraefyuXj1kaN9PwD7bBqI0ElP1mYmrmr7kMBnF5FocP
 F4AVVtYGvOPAbZnJuMo0wMrRKWFnFA26BPi+vmg02EVQpH0kQFwwpw0fSI6IvrfD8xXe
 L9GndkzSA1ciaJdAUQEW8aVq9PCLeidrAPAyElb/tSm4J14ihVLSLZymr9wIghzzM4+p
 KKIKruH++csZK/YParULH1Lo9RDZP2oplRzaHzFq/7w6wiaC23ntGzsph4b3M4qTL60B
 pD1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSq/xTq/j2JEQ+PVQ2Cy2+/hKSk+RPwtBvDNzdt/W6v+5YFF+uR6k14l4+Qm11YtEaWQfeGOY6rP9VyZb+avmnlLdtFWBMRqoVNN1JAvDMSNpY4plIZa7q
X-Gm-Message-State: AOJu0YzNDN2LgIHmYHWkMS5zANaCoTUeSlVYuLO3ucfmWBisi69ALlKK
 2oPw8QRTSFU/fyZ/o/499YuCG2jMalRjalz09Hk4c8M2YhSXxQS7v+h/Asoi5l7prZ4XS/8O0C4
 ZSM11z9/XJVjzoyUBaj9qYi7s2uAHuByBjiCA4A==
X-Google-Smtp-Source: AGHT+IFK1vPadWMCRRGMINnXSF7M/bNV+Fi2LkdhgFy33X86BsH0xVeVtU0MOvER0+70M2Fn7FrxIaFHaLQVd/PZlHU=
X-Received: by 2002:a05:651c:88a:b0:2ee:6cda:637b with SMTP id
 38308e7fff4ca-2ee6cda6515mr8715861fa.35.1719820144133; Mon, 01 Jul 2024
 00:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240701014720.2547856-1-quic_yijiyang@quicinc.com>
In-Reply-To: <20240701014720.2547856-1-quic_yijiyang@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Jul 2024 09:48:53 +0200
Message-ID: <CAMRc=MdU6wPR722q=Ev0NCz=icHvbb4JAuiF+PjDFNLDoWTbKw@mail.gmail.com>
To: YijieYang <quic_yijiyang@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org, quic_jiegan@quicinc.com,
 edumazet@google.com, bartosz.golaszewski@linaro.org, netdev@vger.kernel.org,
 quic_aiquny@quicinc.com, quic_tengfan@quicinc.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, vkoul@kernel.org,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-qcom-ethqos: fix error
	array size
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

T24gTW9uLCBKdWwgMSwgMjAyNCBhdCAzOjQ44oCvQU0gWWlqaWVZYW5nIDxxdWljX3lpaml5YW5n
QHF1aWNpbmMuY29tPiB3cm90ZToKPgo+IEZyb206IFlpamllIFlhbmcgPHF1aWNfeWlqaXlhbmdA
cXVpY2luYy5jb20+Cj4KPiBDb3JyZWN0IG1lbWJlciBAbnVtX3BvciB3aXRoIHNpemUgb2Ygcmln
aHQgYXJyYXkgQGVtYWNfdjRfMF8wX3BvciBmb3IKPiBzdHJ1Y3QgZXRocW9zX2VtYWNfZHJpdmVy
X2RhdGEgQGVtYWNfdjRfMF8wX2RhdGEuCj4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
IEZpeGVzOiA4YzRkOTJlODJkNTAgKCJuZXQ6IHN0bW1hYzogZHdtYWMtcWNvbS1ldGhxb3M6IGFk
ZCBzdXBwb3J0IGZvciBlbWFjNCBvbiBzYTg3NzVwIHBsYXRmb3JtcyIpCj4gU2lnbmVkLW9mZi1i
eTogWWlqaWUgWWFuZyA8cXVpY195aWppeWFuZ0BxdWljaW5jLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1l
dGhxb3MuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20t
ZXRocW9zLmMKPiBpbmRleCA4MGViNzJiYzYzMTEuLmU4YTE3MDFjZGI3YyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5j
Cj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1l
dGhxb3MuYwo+IEBAIC0yNzIsNyArMjcyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBldGhxb3Nf
ZW1hY19wb3IgZW1hY192NF8wXzBfcG9yW10gPSB7Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBl
dGhxb3NfZW1hY19kcml2ZXJfZGF0YSBlbWFjX3Y0XzBfMF9kYXRhID0gewo+ICAgICAgICAgLnBv
ciA9IGVtYWNfdjRfMF8wX3BvciwKPiAtICAgICAgIC5udW1fcG9yID0gQVJSQVlfU0laRShlbWFj
X3YzXzBfMF9wb3IpLAo+ICsgICAgICAgLm51bV9wb3IgPSBBUlJBWV9TSVpFKGVtYWNfdjRfMF8w
X3BvciksCj4gICAgICAgICAucmdtaWlfY29uZmlnX2xvb3BiYWNrX2VuID0gZmFsc2UsCj4gICAg
ICAgICAuaGFzX2VtYWNfZ2VfMyA9IHRydWUsCj4gICAgICAgICAubGlua19jbGtfbmFtZSA9ICJw
aHlhdXgiLAo+Cj4gYmFzZS1jb21taXQ6IDBmYzRiZmFiMmNkNDVmOWFjYjg2YzRmMDRiNTE5MWUx
MTRlOTAxZWQKPiAtLQo+IDIuMzQuMQo+Cj4KCk9vcHMsIHRoYXQncyBvbiBtZS4gVGhhbmtzIGZv
ciBjYXRjaGluZyBpdC4KClJldmlld2VkLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
