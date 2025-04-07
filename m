Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB973A7ED5E
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 21:34:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64274C78F97;
	Mon,  7 Apr 2025 19:34:20 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BC19C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 19:34:17 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-523edc385caso1931126e0c.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Apr 2025 12:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744054457; x=1744659257;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9kUupfLeM2bb97UEnJtJkHdlxhJbbR6dWtAC4xPAdw=;
 b=hrh7sMjL/oGkDe/39V9qw1quMAopSxBjoNwFc4ieaRkZRMVk2aVHSb+d65z0CYVAj0
 L9fTx0PgW24PvbqNNBbCQUpWTdp8LWCCqQWvrvBt7RtJbb0sH9gy61wyBae7L1uQ/kCf
 y4MqNY9DLfEefZaQvisZhp6UpJHJ/g0KKgEtMmkDdSztgmeMHQZJrq05JYiElvWFYuZ8
 1ZJeoktSHVCIQawu2JWa2KXZS6o/hJsUpPJlNhaVVX0TbigYMxilvdDij7TTFyGA9k4T
 VMh5EaDsgN2lkH8eN03/UbNXA9UxJkQmGSUIMkS+w2Q2gfcPG0bqmKcE+abqHRATDnbQ
 S4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744054457; x=1744659257;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9kUupfLeM2bb97UEnJtJkHdlxhJbbR6dWtAC4xPAdw=;
 b=ANGq+PxbOFH0r6OaULMbDSevCPGwQSQAwxr8o/8ih4xE9EiMzwL93VRRoxnRXSIPgA
 yNUitDvnUmfFcqQECEtnGL59jSH5J9XmlAGkd0k7gvQoJk89AZjPuJxscg7bGfoYEc1V
 4mEurrJSTYHx6ck4WzW4KeB996nLe1Gd4UeToDdPz5+jWSvY9fnMHuq5ofIKbhxoug+0
 70uBXC07E4XX1mwWH1QvELoLFeH0XmB6MIzudgKdBYrCgFPScyRAIK716pQvTBHDo8OG
 Y9yopUtb4eWTXeZbUtr9QWemnOI6Xq4EDt3yrqQ49T/cU6HV3qWL1YcBbqSdfyi44jGu
 IHUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2X6ZMlIDcFTw0nEY6mYyp4+J/7q3pWv6J6m1Z3neTM1jWxdQPE0BJ6ibse9IHA2rqQaXSJNiKw05hpg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyhv9L5Xqjnu0QpxZJIpgMFCOoCMzq74dk9Yw/m2rq/nqGHuyjq
 1WhCeoZRvasR46JsNvLW+ljFSUUIdpoNJy36MtG5zRpomfAlsuB13VeuKESnZFlObeiWoYqrWnL
 OamhkbeJrD+1cpBgE8FSYydW8mrY=
X-Gm-Gg: ASbGnctCjCMjZ1sJjoWL8TuFl7lVFuDWlM+zre+SjPUgKT9qzeyhq49InmgHgZhpJJw
 UW+dE04gfECs6sLIkqHV/TRaGMbdqZyJzt51nDOHpM559Apfja2t8lle8VceGwa7kEznDbyPSMZ
 Ybk5ooOkY2ie+W9LVAFf2DDmcK//O0RagCLl0IE3l9oNwX350FF4kBQZXczNk=
X-Google-Smtp-Source: AGHT+IEUwdqKil1pOvRnLZ3FdzjENanpIPQHgPq8R+xUeQrCDsCevqcy7D/AW0+zBxjvwQs2SZQhqHplRtvsFcJ07KA=
X-Received: by 2002:a05:6122:2502:b0:526:483:95fd with SMTP id
 71dfb90a1353d-527645b6798mr10677466e0c.10.1744054456970; Mon, 07 Apr 2025
 12:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk>
 <E1u1rMv-0013ON-TJ@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u1rMv-0013ON-TJ@rmk-PC.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Apr 2025 20:33:50 +0100
X-Gm-Features: ATxdqUHy--tranG0MT0BFF5juBVy575ZL4jQsNWdM38rbJ8aGrL8W5d1ehNrSPQ
Message-ID: <CA+V-a8t=V-EB4r_vBBSJfmAx1_tBRsvV-m3wM841fAw75-ueZA@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <treding@nvidia.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwc-qos: use
	stmmac_pltfr_find_clk()
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

T24gTW9uLCBBcHIgNywgMjAyNSBhdCA3OjM54oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSdXNz
ZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+IC0tLQo+ICAu
Li4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZHdjLXFvcy1ldGguYyAgICB8IDE0ICsr
LS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQo+ClJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1s
YWQucmpAYnAucmVuZXNhcy5jb20+CgpDaGVlcnMsClByYWJoYWthcgoKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZHdjLXFvcy1ldGguYyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWR3Yy1xb3MtZXRoLmMK
PiBpbmRleCBjZDQzMWY4NGYzNGYuLmY1YzY4ZTNiNDM1NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1kd2MtcW9zLWV0aC5jCj4gKysrIGIv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZHdjLXFvcy1ldGguYwo+
IEBAIC0zNCwxNiArMzQsNiBAQCBzdHJ1Y3QgdGVncmFfZXFvcyB7Cj4gICAgICAgICBzdHJ1Y3Qg
Z3Bpb19kZXNjICpyZXNldDsKPiAgfTsKPgo+IC1zdGF0aWMgc3RydWN0IGNsayAqZHdjX2V0aF9m
aW5kX2NsayhzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0LAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpCj4gLXsKPiAtICAg
ICAgIGZvciAoaW50IGkgPSAwOyBpIDwgcGxhdF9kYXQtPm51bV9jbGtzOyBpKyspCj4gLSAgICAg
ICAgICAgICAgIGlmIChzdHJjbXAocGxhdF9kYXQtPmNsa3NbaV0uaWQsIG5hbWUpID09IDApCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHBsYXRfZGF0LT5jbGtzW2ldLmNsazsKPiAt
Cj4gLSAgICAgICByZXR1cm4gTlVMTDsKPiAtfQo+IC0KPiAgc3RhdGljIGludCBkd2NfZXRoX2R3
bWFjX2NvbmZpZ19kdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBsYXRfc3RtbWFjZW5ldF9kYXRhICpwbGF0
X2RhdCkKPiAgewo+IEBAIC0xMzIsNyArMTIyLDcgQEAgc3RhdGljIGludCBkd2NfcW9zX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBzdG1tYWNfcmVzb3VyY2VzICpzdG1tYWNfcmVzKQo+ICB7Cj4gLSAg
ICAgICBwbGF0X2RhdC0+cGNsayA9IGR3Y19ldGhfZmluZF9jbGsocGxhdF9kYXQsICJwaHlfcmVm
X2NsayIpOwo+ICsgICAgICAgcGxhdF9kYXQtPnBjbGsgPSBzdG1tYWNfcGx0ZnJfZmluZF9jbGso
cGxhdF9kYXQsICJwaHlfcmVmX2NsayIpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+IEBA
IC0yNDIsNyArMjMyLDcgQEAgc3RhdGljIGludCB0ZWdyYV9lcW9zX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYsCj4gICAgICAgICBpZiAoIWlzX29mX25vZGUoZGV2LT5md25vZGUp
KQo+ICAgICAgICAgICAgICAgICBnb3RvIGJ5cGFzc19jbGtfcmVzZXRfZ3BpbzsKPgo+IC0gICAg
ICAgcGxhdF9kYXQtPmNsa190eF9pID0gZHdjX2V0aF9maW5kX2NsayhwbGF0X2RhdCwgInR4Iik7
Cj4gKyAgICAgICBwbGF0X2RhdC0+Y2xrX3R4X2kgPSBzdG1tYWNfcGx0ZnJfZmluZF9jbGsocGxh
dF9kYXQsICJ0eCIpOwo+Cj4gICAgICAgICBlcW9zLT5yZXNldCA9IGRldm1fZ3Bpb2RfZ2V0KCZw
ZGV2LT5kZXYsICJwaHktcmVzZXQiLCBHUElPRF9PVVRfSElHSCk7Cj4gICAgICAgICBpZiAoSVNf
RVJSKGVxb3MtPnJlc2V0KSkgewo+IC0tCj4gMi4zMC4yCj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
