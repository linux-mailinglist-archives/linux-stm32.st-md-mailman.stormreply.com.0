Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A80A7ED0B
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 21:29:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17BFBC78F97;
	Mon,  7 Apr 2025 19:29:40 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29EA6C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 19:29:38 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-523f670ca99so2128976e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Apr 2025 12:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744054177; x=1744658977;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1tDFZHNBbzPIiAFt0CAdcD1vY0rtB3dQPVfG0k6uEs=;
 b=VLLcLeHOjaAwlRhXT6RCOBNQcz//hsdrraIJCJ+DMrxL0qQXfCkmiiBaq1O/NjSLui
 4cH39QlZbZDaFkC7B7sDNI95DQCOIR3OvLgEr75aHXDXvyco8myulg7T/+dwhd4rr6w0
 CIPWB+UZiXF1NZ4ckOmoqxGOgNQfTkzP7mZMU5rt+r0MY3C24dcRhrz1jtrGVHOTfN2z
 DTg3YBAtfYgTjKMRbjQn4JsuNIVDzYbfWmZZHlyOW/4GNGoIaArxdkRrhpNGC8LIVzqu
 um6xmek32dx6JkzU9LDXzy6/95bVbZhOC2g5z5ndbsEgRwhChf1tr0X5katA2KUAIxku
 JVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744054177; x=1744658977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1tDFZHNBbzPIiAFt0CAdcD1vY0rtB3dQPVfG0k6uEs=;
 b=Xs+mIONcJ5GDgBh1W5AhjnGD8xzxRuqDQ10iR1yjH2ycif1KTWxcZN693RG8CVPRCA
 j4Y8N8g2GAeuyVg3V7hykGgIW04tY00Gg6NPlPFiGW5SdH5k3sA9OEqRj3TwZuS6b932
 fg+l57RVYeQdD9XWHaNxd2aNcmuYsIw3KumZFdqEZQ9ocRgUcXnuuUiWu0tb4syG3qTL
 NoXKOsWSIDG7V67CLyHcfl0I0SZJbJE4lgk4b6KdqRmwE4GobJ5W7DMYDXK7govPqbwZ
 cmn69iIeyLGfwrQZQOPRLS2aOiAvNcNDJkd98cob4RAZIR0MmARu4uIZ0hVLw4jS41hZ
 X+wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCX2QjBI8An5Jbe+MAIpaeZnRlrB9b0dfrO1/Uy41YLKyFaCHyTwvZZDnPA4nHw7rIfiPiKvKnLjOK8Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzVeDISTBXn/dfIJGnN/4EHkXs2jBUXWzVPNXUnO+UC1vyydyb8
 KLqfy468FuwQWlCyULPXsjax1J75qfiFtXYxX7exQlYmXLIa5SfLdTzlde45TykhjCvzY9v5HMu
 lJ34AYS+zCxTS3kZys8fKefDFlUg=
X-Gm-Gg: ASbGncuU9TNw78a7ZOmJ+DlfciIZftzogk4b2k/soQkHIKAxdCeotKKKJxUmDz/Nhaa
 PoXlfKP++4VbLugMe/6RVPSUk0HKhiavyDVYDUy/bi5lE+zTSzbmUr1C4KtLFVcJTlbaf/bpz8a
 NdkEQlpp9KqBivqMRqj+NGOzJ9iQQJIoJ7Mf58g4mNI508OEZPqeBZ+HHqlcM=
X-Google-Smtp-Source: AGHT+IEYwC0D9Na6mldavU/SEDxrDLzeYphWLZylO7ms/uvFzvJU3N0fRqytl/SEZKNAWIqjkYg9Mf67iY5tlvf+beE=
X-Received: by 2002:a05:6122:660a:b0:527:67c7:50f with SMTP id
 71dfb90a1353d-52767c70798mr9373242e0c.11.1744054176979; Mon, 07 Apr 2025
 12:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk>
 <E1u1rMq-0013OH-PI@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u1rMq-0013OH-PI@rmk-PC.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Apr 2025 20:29:11 +0100
X-Gm-Features: ATxdqUGJo6rGm-PzdxRM50F_X21bV_9ZjESEtot6xCodMTgbyqFrRYjRDv3xMQ8
Message-ID: <CA+V-a8v02JWb9fKPhRB8vLoA8Kt9h3wnGic8uWZZEc+9eptGpQ@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <treding@nvidia.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: provide
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
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBQcm92aWRlIGEgZ2VuZXJpYyB3
YXkgdG8gZmluZCBhIGNsb2NrIGluIHRoZSBidWxrIGRhdGEuCj4KPiBTaWduZWQtb2ZmLWJ5OiBS
dXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+IC0tLQo+
ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcGxhdGZvcm0uYyB8
IDExICsrKysrKysrKysrCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0
bW1hY19wbGF0Zm9ybS5oIHwgIDMgKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKQo+ClJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQu
cmpAYnAucmVuZXNhcy5jb20+ClRlc3RlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1h
aGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoKQ2hlZXJzLApQcmFiaGFrYXIKCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wbGF0Zm9y
bS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BsYXRmb3Jt
LmMKPiBpbmRleCBjNzNlZmY2YTU2YjguLjQzYzg2OWY2NGMzOSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcGxhdGZvcm0uYwo+ICsrKyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wbGF0Zm9ybS5jCj4g
QEAgLTcwOSw2ICs3MDksMTcgQEAgZGV2bV9zdG1tYWNfcHJvYmVfY29uZmlnX2R0KHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYsIHU4ICptYWMpCj4gICNlbmRpZiAvKiBDT05GSUdfT0YgKi8K
PiAgRVhQT1JUX1NZTUJPTF9HUEwoZGV2bV9zdG1tYWNfcHJvYmVfY29uZmlnX2R0KTsKPgo+ICtz
dHJ1Y3QgY2xrICpzdG1tYWNfcGx0ZnJfZmluZF9jbGsoc3RydWN0IHBsYXRfc3RtbWFjZW5ldF9k
YXRhICpwbGF0X2RhdCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
Y2hhciAqbmFtZSkKPiArewo+ICsgICAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBwbGF0X2RhdC0+
bnVtX2Nsa3M7IGkrKykKPiArICAgICAgICAgICAgICAgaWYgKHN0cmNtcChwbGF0X2RhdC0+Y2xr
c1tpXS5pZCwgbmFtZSkgPT0gMCkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcGxh
dF9kYXQtPmNsa3NbaV0uY2xrOwo+ICsKPiArICAgICAgIHJldHVybiBOVUxMOwo+ICt9Cj4gK0VY
UE9SVF9TWU1CT0xfR1BMKHN0bW1hY19wbHRmcl9maW5kX2Nsayk7Cj4gKwo+ICBpbnQgc3RtbWFj
X2dldF9wbGF0Zm9ybV9yZXNvdXJjZXMoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHN0bW1hY19yZXNvdXJjZXMg
KnN0bW1hY19yZXMpCj4gIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvc3RtbWFjX3BsYXRmb3JtLmggYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9zdG1tYWNfcGxhdGZvcm0uaAo+IGluZGV4IDcyZGMxYTMyZTQ2ZC4uNmU2NTYx
ZTI5ZDZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L3N0bW1hY19wbGF0Zm9ybS5oCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX3BsYXRmb3JtLmgKPiBAQCAtMTQsNiArMTQsOSBAQAo+ICBzdHJ1Y3QgcGxh
dF9zdG1tYWNlbmV0X2RhdGEgKgo+ICBkZXZtX3N0bW1hY19wcm9iZV9jb25maWdfZHQoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldiwgdTggKm1hYyk7Cj4KPiArc3RydWN0IGNsayAqc3RtbWFj
X3BsdGZyX2ZpbmRfY2xrKHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpOwo+ICsK
PiAgaW50IHN0bW1hY19nZXRfcGxhdGZvcm1fcmVzb3VyY2VzKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzdG1t
YWNfcmVzb3VyY2VzICpzdG1tYWNfcmVzKTsKPgo+IC0tCj4gMi4zMC4yCj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
