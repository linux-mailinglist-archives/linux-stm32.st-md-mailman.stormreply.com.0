Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD062BB6412
	for <lists+linux-stm32@lfdr.de>; Fri, 03 Oct 2025 10:44:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31D6FC36B14;
	Fri,  3 Oct 2025 08:44:15 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11114C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Oct 2025 16:19:54 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3352018e050so1243821a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Oct 2025 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759421993; x=1760026793;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LZZ5d24XDIxkk+JwavCHmACQ+MmvpDMF7i8UGLWVc1U=;
 b=b+n68sOnTvsK34t4yFwEw5dPJAqG72kWQlaUV0hCQRxxmDsF9egV6HC6d8UxCwvZoQ
 dylM7disuCDWZpYoRMXPk22I71yq6wuus+HrX+fCNG/22FsVFnb81oSswGMZXVX16Hsr
 swhwwmRMnc9+ILkhY3G4TSmCTtXp6O2ZEkM1hCoHrdAJlixgAOr4b4L2KQ4j6ehC8M/W
 qs8unyFgt4MMI0pHg18BoG2JaotZ9SLAI33+fMxgi0BvMZhjCuYLxF2nJ7m7ws3H8R5G
 LhJO1u19jT1NQKZeblG1JXzfjbO5QM+6RffdV/r3b1AIkaPkeYIlzZZM4ro5pUw3esh5
 Z8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759421993; x=1760026793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LZZ5d24XDIxkk+JwavCHmACQ+MmvpDMF7i8UGLWVc1U=;
 b=YkO8IpeS5AH6h0DpUurCZCAQGJ0PQhe04xt/VJtUitdFQ73TPNvKWkCrFTAD9G/f2u
 /jVWdkQMbzTMKHtClBZL8rIhncf4UoR0ciCOt0TVzAqXXZd8FDYzCFsO4LoKJGJokpUS
 pa+bH6M0RJS16WCnVK3St8lL9Dsq/LA8VheJuh3tCxOnBihC826z35Vb4qyPCOoKtC9e
 J7KofcqbCCGPbEDD851WVBbew+elNasHrhV3UUhbA841QYaUCMyPKBYR6e7gdaVbr1V9
 BSfZSDi5DNyMMIk7HsRFGsilch2MW8k/KHgf6gS6QP2/SBj8THw46/alek7KitjOo+cx
 rCMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdaAZeZwFGW/B4BGjH32XopAbLcZmMWq1/b6ReKlldVjRmyuG5OLAdpnBX7YsyOwoTNMWQWKbkvANX/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz+2rMBSJ/5Acosqhw8x//4X5Om8HvZGB44Rpg3DsxlUhabO955
 Se5a4WRDQNeDFfDgCAri0+vp5wvqiWZp/qq1dOEndQeQwd6IKnyS60JGvFCs9lx06DeZF1gYb+b
 Lc3b5BDSQZfjQKSz603J6OVnsxVYxzvc=
X-Gm-Gg: ASbGncunK37o9v5iY72HI+Kry2ZHk/nAXWqY8+SPyZ1vPDhk8llmIBSpEEIccqMgqGy
 0Iw31BmutCgCojXPAB4g5V5u0m6jJn2lc05jqJs/My9afGjU9CQudV3sE0uDop7d6OHL93pUEkX
 AfcWKILTCct4uotwOUWrS50lltMZfduyeKNv+Fl3n/ScUG/Qg0J9flppM/4q2XJsWXB3vtwuCC9
 Q1zIZjweZkjN9A7+ZRees/S3bnGfRY=
X-Google-Smtp-Source: AGHT+IGDpezXRZoKRUAmvsGEGRKGV3Cca8QMZMZ4Xe0LAt5a7sDWIZ6cqn+OuFMFCBuqxZGgIpVxUstpBqxpNK7ovio=
X-Received: by 2002:a17:90b:3145:b0:32b:ca6f:1245 with SMTP id
 98e67ed59e1d1-339a6e6329fmr8873915a91.5.1759421993437; Thu, 02 Oct 2025
 09:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <20250822-enomam_logs-v1-9-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-9-db87f2974552@gmail.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:24:49 -0400
X-Gm-Features: AS18NWAkW_WGgw7RLjcHXntiCLOoMqdr7Jd-sVtGc97imtAcuufyjRqKmj5BmR0
Message-ID: <CALC8CXdUzp=sKeOaPnwJ3GWg8=qrXrZKNsKg6XeXxvutty-U-w@mail.gmail.com>
To: Dixit Parmar <dixitparmar19@gmail.com>
X-Mailman-Approved-At: Fri, 03 Oct 2025 08:44:14 +0000
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Haibo Chen <haibo.chen@nxp.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 David Lechner <dlechner@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-samsung-soc@vger.kernel.org,
 Cai Huoqing <cai.huoqing@linux.dev>, Andreas Klinger <ak@it-klinger.de>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 09/10] iio: proximity: Drop unnecessary
	-ENOMEM messages
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

eWVhaCwgZGlja3MgaXQuCgpPbiBUaHUsIEF1ZyAyMSwgMjAyNSBhdCAxMTo1M+KAr1BNIERpeGl0
IFBhcm1hciA8ZGl4aXRwYXJtYXIxOUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlIGRyaXZlcnMg
ZG8gbm90IHJlcXVpcmUgdGhlaXIgb3duIGVycm9yIG1lc3NhZ2VzIGZvciBlcnJvcgo+IC1FTk9N
RU0sIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmVzLiBTbyByZW1vdmUgdGhlIGRldl9lcnIKPiBt
ZXNzYWdlcyBmcm9tIHRoZSBwcm9iZSgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGl4aXQgUGFybWFy
IDxkaXhpdHBhcm1hcjE5QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9paW8vcHJveGltaXR5
L3BpbmcuYyAgfCA0ICstLS0KPiAgZHJpdmVycy9paW8vcHJveGltaXR5L3NyZjA0LmMgfCA0ICst
LS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vcHJveGltaXR5L3BpbmcuYyBiL2RyaXZlcnMvaWlv
L3Byb3hpbWl0eS9waW5nLmMKPiBpbmRleCBjNWI0ZTEzNzhiN2QuLmUzNDg3MDk0ZDdiZSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2lpby9wcm94aW1pdHkvcGluZy5jCj4gKysrIGIvZHJpdmVycy9p
aW8vcHJveGltaXR5L3BpbmcuYwo+IEBAIC0yODAsMTAgKzI4MCw4IEBAIHN0YXRpYyBpbnQgcGlu
Z19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgc3RydWN0IGlp
b19kZXYgKmluZGlvX2RldjsKPgo+ICAgICAgICAgaW5kaW9fZGV2ID0gZGV2bV9paW9fZGV2aWNl
X2FsbG9jKGRldiwgc2l6ZW9mKHN0cnVjdCBwaW5nX2RhdGEpKTsKPiAtICAgICAgIGlmICghaW5k
aW9fZGV2KSB7Cj4gLSAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGFsbG9j
YXRlIElJTyBkZXZpY2VcbiIpOwo+ICsgICAgICAgaWYgKCFpbmRpb19kZXYpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PTUVNOwo+IC0gICAgICAgfQo+Cj4gICAgICAgICBkYXRhID0gaWlv
X3ByaXYoaW5kaW9fZGV2KTsKPiAgICAgICAgIGRhdGEtPmRldiA9IGRldjsKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9paW8vcHJveGltaXR5L3NyZjA0LmMgYi9kcml2ZXJzL2lpby9wcm94aW1pdHkv
c3JmMDQuYwo+IGluZGV4IGIwNTliYWMxMDc4Yi4uZjlkMzJmOWFiYTFmIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zcmYwNC5jCj4gKysrIGIvZHJpdmVycy9paW8vcHJveGlt
aXR5L3NyZjA0LmMKPiBAQCAtMjUzLDEwICsyNTMsOCBAQCBzdGF0aWMgaW50IHNyZjA0X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICBpbnQgcmV0Owo+Cj4gICAg
ICAgICBpbmRpb19kZXYgPSBkZXZtX2lpb19kZXZpY2VfYWxsb2MoZGV2LCBzaXplb2Yoc3RydWN0
IHNyZjA0X2RhdGEpKTsKPiAtICAgICAgIGlmICghaW5kaW9fZGV2KSB7Cj4gLSAgICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGFsbG9jYXRlIElJTyBkZXZpY2VcbiIpOwo+ICsg
ICAgICAgaWYgKCFpbmRpb19kZXYpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+
IC0gICAgICAgfQo+Cj4gICAgICAgICBkYXRhID0gaWlvX3ByaXYoaW5kaW9fZGV2KTsKPiAgICAg
ICAgIGRhdGEtPmRldiA9IGRldjsKPgo+IC0tCj4gMi40My4wCj4KPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
