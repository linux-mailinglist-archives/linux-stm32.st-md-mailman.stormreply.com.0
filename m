Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7D0CC1BB8
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 10:21:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED639C87EDC;
	Tue, 16 Dec 2025 09:21:31 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40324C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 09:21:30 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-78c686aa4f9so16527557b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 01:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765876889; x=1766481689;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NGYedUjMSAQqTTCfPBzG7GGpp5/HnFYa13zWq/TfU5g=;
 b=Cpmcm9568zDGeGrtGce/KuWc2/7nJfoKYXv+vIZp+vzWsJx87GS+6+axv5uBB/IiLP
 NtrUUIyBIw9pc4/it4oMLjAykIvOwkOnn/5nlxP5sCRnAhcKoW4yIxtKN78ZyCSYP3EV
 qAxp1CohoBVOSM7Amkc+7gXBWG/HlRNVA0n72lZ64msJJBIkH5NG1Gu440BWxkW8m9te
 9rayBuPcUUrj0ghmD9LN6ij9+stYxcIqkFljykn1Cewr1kBKLBk1oWt676zzJSVkkGkG
 Tmf23HZfc1r/cJpRDivbMF9IN65dNI4Ze1JcWPPNhqiuTS4hvS/yDOVhLIJofWX0f6TK
 O+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765876889; x=1766481689;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NGYedUjMSAQqTTCfPBzG7GGpp5/HnFYa13zWq/TfU5g=;
 b=JDk2Jc5RzqJRDEjegIC/c92zl9wft0she/8uiwPxXr/2pWqTZb2kGKkkzCaHBDJScU
 hxpSTKbaPvakWH6ie/AvF+AM4/KWY0IycnuiEmVXbjHNVBIeqSvAM/SYoX/fSQ+6YNtK
 B5oOrzpbv9tm47x8ltnxOZt3GmQhlxJ3Ng5gNooN4mZJAeukbm82KV5FbJ8mM0nzgv2r
 WeEd4o1ULuLbBnnnXXU5vMCfK4mjwB34WMn0veMZAoOrCVUJuQEpieoVsdPbSR/NsBQV
 QJnJUNUNx8Mg6lB175wIxKHgNnUU0aNPJEPmCI7pL4+xwmDjo9H8NPNYHZCboKobUoKH
 7Myw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtsyQnhoeFYvqZR3JiGCyPoQWF42t6f4Mh5DJb9FkjONWjMP0XmPiUFBeIHI5u2MmH4Fplqc47Qd8rsw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzyQmg3qNiy14APuLyuP17rojRSChZGTfzhaP4aO10+MQsgMdGR
 7u6iMtE113CKiKeNWdmteyk9zZTsDET47t63QUbpz2unWwWNH8RRFtqiuU3DPNtzIZ6+5YVxL0k
 kzq/Q+a65gyR7or9wv8CoBGyELjEtBwTF2dFbZfjMaA==
X-Gm-Gg: AY/fxX4r4J4VLCAFlSCnr85iOkEZkxqOqSluQL4CxcgL5FZXdR5/mz/ucRuVPpTs9/F
 w1LGAsvk9HV6hsv2Qh494/3lvyVreSF7O0zlKn4ZTOTf35J6LQ2xjIX4TQ5XSAYoNJbegxJdvjX
 5PzVfU3m/LHQHpXBhFzWIaatNa/ZlAZiLTeaSEVxhiPtWyG8v+/CU3kcGENW8nHSS6hvMn5s9x5
 QNT4rwZKaIsYmlzB0xzQ8q3Y+aIRgFgwygo/l3aFJeNMqePterJHhTRjLWlefg1+pza8th85xl6
 7rm8LW2S0i9jdriwzYZlEhdLOrljYDAoEUcE7Ahx6z6ACG4O67IXM8qW9mqa3gE50wEcVtOZ38T
 MM+AfzDBqjEeFhZY8ptZ+ReytFNxQbCTvtFXZ8Ydqeu9rX9B5lvg1dU+1ScKVqbm+N8jyNIdSaI
 DCLvoDW24f6SKbcSEMssTAntKm6nj/wg+IwFwVU5P42jyOKXta4hrjjuRYQDMnvaQTeTa/WiZhs
 uXdebVl0T4RqopXexckTAO8zMsoQn8S1ticUuy9zm0qDa5QimSLEDFk0vIKd1gMI9ACKWyYLEna
 p7/SFWSwEfGFzL/OE9ESDslX6kjmub8U
X-Google-Smtp-Source: AGHT+IEAFokQb5D1JItH9s+uj3Sa3EAOeQhnCG2QizFVOaNkP6qUDXOVMm6HltsGpBU7JI8LFSpiz0VIaHoanmm6gBM=
X-Received: by 2002:a05:690c:688f:b0:78d:6c06:4a0f with SMTP id
 00721157ae682-78e6809a375mr112570247b3.0.1765876889065; Tue, 16 Dec 2025
 01:21:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <6a56ee61e485703d548e9e44d53b2920b4e43ca6.1765791463.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <6a56ee61e485703d548e9e44d53b2920b4e43ca6.1765791463.git.u.kleine-koenig@baylibre.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 16 Dec 2025 11:20:52 +0200
X-Gm-Features: AQt7F2rtv6sYjRJcPW49bnernszF66e86Q28fTD0Bfhuswf7pxXDfIzUWVoUNmU
Message-ID: <CAC_iWjLG7o96E=9W-cjJ=_622RFg-b9t6hQnMrSmgHS+ThaXyw@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 linux-stm32@st-md-mailman.stormreply.com, Ard Biesheuvel <ardb@kernel.org>,
 op-tee@lists.trustedfirmware.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 08/17] efi: stmm: Make use of
	module_tee_client_driver()
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

T24gTW9uLCAxNSBEZWMgMjAyNSBhdCAxNjoxNywgVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xlaW5l
LWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gUmVkdWNlIGJvaWxlcnBsYXRlIGJ5IHVz
aW5nIHRoZSBuZXdseSBpbnRyb2R1Y2VkIG1vZHVsZV90ZWVfY2xpZW50X2RyaXZlcigpLgo+IFRo
YXQgdGFrZXMgY2FyZSBvZiBhc3NpZ25pbmcgdGhlIGRyaXZlcidzIGJ1cywgc28gdGhlIGV4cGxp
Y2l0IGFzc2lnbmluZwo+IGluIHRoaXMgZHJpdmVyIGNhbiBiZSBkcm9wcGVkLgo+Cj4gUmV2aWV3
ZWQtYnk6IFN1bWl0IEdhcmcgPHN1bWl0LmdhcmdAb3NzLnF1YWxjb21tLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4K
PiAtLS0KCkFja2VkLWJ5OiBJbGlhcyBBcGFsb2RpbWFzIDxpbGlhcy5hcGFsb2RpbWFzQGxpbmFy
by5vcmc+Cgo+ICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9zdG1tL3RlZV9zdG1tX2VmaS5jIHwgMTQg
Ky0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMyBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL2VmaS9zdG1tL3RlZV9z
dG1tX2VmaS5jIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvc3RtbS90ZWVfc3RtbV9lZmkuYwo+IGlu
ZGV4IDY1YzBmZTFiYTI3NS4uNTkwMzgxMTg1OGI2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZmly
bXdhcmUvZWZpL3N0bW0vdGVlX3N0bW1fZWZpLmMKPiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL2Vm
aS9zdG1tL3RlZV9zdG1tX2VmaS5jCj4gQEAgLTU4NCwyNCArNTg0LDEyIEBAIHN0YXRpYyBzdHJ1
Y3QgdGVlX2NsaWVudF9kcml2ZXIgdGVlX3N0bW1fZWZpX2RyaXZlciA9IHsKPiAgICAgICAgIC5p
ZF90YWJsZSAgICAgICA9IHRlZV9zdG1tX2VmaV9pZF90YWJsZSwKPiAgICAgICAgIC5kcml2ZXIg
ICAgICAgICA9IHsKPiAgICAgICAgICAgICAgICAgLm5hbWUgICAgICAgICAgID0gInRlZS1zdG1t
LWVmaSIsCj4gLSAgICAgICAgICAgICAgIC5idXMgICAgICAgICAgICA9ICZ0ZWVfYnVzX3R5cGUs
Cj4gICAgICAgICAgICAgICAgIC5wcm9iZSAgICAgICAgICA9IHRlZV9zdG1tX2VmaV9wcm9iZSwK
PiAgICAgICAgICAgICAgICAgLnJlbW92ZSAgICAgICAgID0gdGVlX3N0bW1fZWZpX3JlbW92ZSwK
PiAgICAgICAgIH0sCj4gIH07Cj4KPiAtc3RhdGljIGludCBfX2luaXQgdGVlX3N0bW1fZWZpX21v
ZF9pbml0KHZvaWQpCj4gLXsKPiAtICAgICAgIHJldHVybiBkcml2ZXJfcmVnaXN0ZXIoJnRlZV9z
dG1tX2VmaV9kcml2ZXIuZHJpdmVyKTsKPiAtfQo+IC0KPiAtc3RhdGljIHZvaWQgX19leGl0IHRl
ZV9zdG1tX2VmaV9tb2RfZXhpdCh2b2lkKQo+IC17Cj4gLSAgICAgICBkcml2ZXJfdW5yZWdpc3Rl
cigmdGVlX3N0bW1fZWZpX2RyaXZlci5kcml2ZXIpOwo+IC19Cj4gLQo+IC1tb2R1bGVfaW5pdCh0
ZWVfc3RtbV9lZmlfbW9kX2luaXQpOwo+IC1tb2R1bGVfZXhpdCh0ZWVfc3RtbV9lZmlfbW9kX2V4
aXQpOwo+ICttb2R1bGVfdGVlX2NsaWVudF9kcml2ZXIodGVlX3N0bW1fZWZpX2RyaXZlcik7Cj4K
PiAgTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwo+ICBNT0RVTEVfQVVUSE9SKCJJbGlhcyBBcGFsb2Rp
bWFzIDxpbGlhcy5hcGFsb2RpbWFzQGxpbmFyby5vcmc+Iik7Cj4gLS0KPiAyLjQ3LjMKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
