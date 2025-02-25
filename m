Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D73A4392E
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 10:19:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 638A8C78F6A;
	Tue, 25 Feb 2025 09:19:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0C36C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:19:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 503015C68E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35BFC4CEE2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740475189;
 bh=WV/BQQjSklg+inxqIej//MnYL20DO4u7FlUKUcFIGv8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lA/bVmVMetzwiXqOeUGtVR6F7uarRXY90zqUe77HzmH4qj17klWRTgsVjoMCzpxwE
 FZBeUAoTGULiEycBEtA7qscYuNc8ZZGSxGn0AVhbb/6lSDHTUN28lzRPUtBhgzs4aE
 h5TTj9iZBkrJfSdQa6AUlcIckpRF39PLJkx5ou8ZO2uP8xO1pR2eN0guGWgX6FmJYA
 Tu2g9lC9dR6hVaLwOggCLm36NZrFaye2bmRV1STrjrOIJtwuAzRZyvqgm34tmVV0m9
 n+2UJ1hz/a1FDAO2nLCFqjpCTOlqxwxwNwrQKsMjsL5BzVIzOH3kUxMQIYY+wiWwBc
 vLa/f5TGa0onw==
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ab771575040so1101951266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 01:19:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQqiJah6x6yN6RWbjj7/fsuqQkx4DdzzYQCmHPpzNEKRJWUJYp9XQxNFJCDSszbNSdI2aFMGpB5cwaZA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxG1O7s++jS1wns42WAZQo9shMN/bkWK8qDwZ4nlXqaOW+FSDMQ
 dD9RT80Yv2UXeLXdsTZmxks554MhcnoF9gkp2MzhOGV9REB/6tfmN/XGyw6kYFZWnJoaaYfXi4d
 BbKFWp1z70s+AkPXbF0gmmhUXgU0=
X-Google-Smtp-Source: AGHT+IHH5/lZpNbRGSgruDA194J8Wu4I6GsbEXWL0O7Bhszg4FzraJyCq1ptOSxW6ZjsuQkpHhmLCFX1Z/wZ9UNOce0=
X-Received: by 2002:a17:907:7a88:b0:ab6:fe30:f49e with SMTP id
 a640c23a62f3a-abc0b0e5fcdmr1785569066b.28.1740475188509; Tue, 25 Feb 2025
 01:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-5-phasta@kernel.org>
 <425215fb-8fb5-4412-87e7-1d29c4ac0b7f@linux.dev>
In-Reply-To: <425215fb-8fb5-4412-87e7-1d29c4ac0b7f@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Feb 2025 17:19:36 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6yVX_tgdiDP+vVB3K-dbRm-ejF0ngmN8UgFD8eRVaTJg@mail.gmail.com>
X-Gm-Features: AQ5f1Josz9kykUlq72YeUoErSStI-rKm3nm-tjAtPbfVHHpD6td2eL_df52t8Dk
Message-ID: <CAAhV-H6yVX_tgdiDP+vVB3K-dbRm-ejF0ngmN8UgFD8eRVaTJg@mail.gmail.com>
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Philipp Stanner <phasta@kernel.org>, Feiyang Chen <chenfeiyang@loongson.cn>,
 linux-kernel@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>,
 netdev@vger.kernel.org, Yinggang Gu <guyinggang@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Qing Zhang <zhangqing@loongson.cn>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/4] stmmac: Remove pcim_*
 functions for driver detach
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

T24gVHVlLCBGZWIgMjUsIDIwMjUgYXQgNToxMeKAr1BNIFlhbnRlbmcgU2kgPHNpLnlhbnRlbmdA
bGludXguZGV2PiB3cm90ZToKPgo+Cj4g5ZyoIDIvMjQvMjUgOTo1MyBQTSwgUGhpbGlwcCBTdGFu
bmVyIOWGmemBkzoKPiA+IEZ1bmN0aW9ucyBwcmVmaXhlZCB3aXRoICJwY2ltXyIgYXJlIG1hbmFn
ZWQgZGV2cmVzIGZ1bmN0aW9ucyB3aGljaAo+ID4gcGVyZm9ybSBhdXRvbWF0aWMgY2xlYW51cCBv
bmNlIHRoZSBkcml2ZXIgdW5sb2Fkcy4gSXQgaXMsIHRodXMsIG5vdAo+ID4gbmVjZXNzYXJ5IHRv
IGNhbGwgYW55IGNsZWFudXAgZnVuY3Rpb25zIGluIHJlbW92ZSgpIGNhbGxiYWNrcy4KPiA+Cj4g
PiBSZW1vdmUgdGhlIHBjaW1fIGNsZWFudXAgZnVuY3Rpb24gY2FsbHMgaW4gdGhlIHJlbW92ZSgp
IGNhbGxiYWNrcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFN0YW5uZXIgPHBoYXN0
YUBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLWxvb25nc29uLmMgfCAgNyAtLS0tLS0tCj4gPiAgIGRyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wY2kuYyAgICAgfCAxMCAtLS0tLS0tLS0tCj4g
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTcgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4gPiBp
bmRleCBlM2NhY2QwODViM2YuLmYzZWE2MDE2YmU2OCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMKPiA+IEBA
IC02MTQsMTMgKzYxNCw2IEBAIHN0YXRpYyB2b2lkIGxvb25nc29uX2R3bWFjX3JlbW92ZShzdHJ1
Y3QgcGNpX2RldiAqcGRldikKPiA+ICAgICAgIGlmIChsZC0+bG9vbmdzb25faWQgPT0gRFdNQUNf
Q09SRV9MU19NVUxUSUNIQU4pCj4gPiAgICAgICAgICAgICAgIGxvb25nc29uX2R3bWFjX21zaV9j
bGVhcihwZGV2KTsKPiA+Cj4gPiAtICAgICBmb3IgKGkgPSAwOyBpIDwgUENJX1NURF9OVU1fQkFS
UzsgaSsrKSB7Cj4gPiAtICAgICAgICAgICAgIGlmIChwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIGkp
ID09IDApCj4gPiAtICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiAtICAgICAgICAg
ICAgIHBjaW1faW91bm1hcF9yZWdpb25zKHBkZXYsIEJJVChpKSk7Cj4gPiAtICAgICAgICAgICAg
IGJyZWFrOwo+ID4gLSAgICAgfQo+ID4gLQo+ID4gICAgICAgcGNpX2Rpc2FibGVfZGV2aWNlKHBk
ZXYpOwo+ID4gICB9Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL3N0bW1hY19wY2kuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL3N0bW1hY19wY2kuYwo+ID4gaW5kZXggMzUyYjAxNjc4YzIyLi45MWZmNmMxNWY5Nzcg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1t
YWNfcGNpLmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0
bW1hY19wY2kuYwo+ID4gQEAgLTIyNywyMCArMjI3LDEwIEBAIHN0YXRpYyBpbnQgc3RtbWFjX3Bj
aV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiA+ICAgICoKPiA+ICAgICogQHBkZXY6IHBs
YXRmb3JtIGRldmljZSBwb2ludGVyCj4KPiA+ICAgICogRGVzY3JpcHRpb246IHRoaXMgZnVuY3Rp
b24gY2FsbHMgdGhlIG1haW4gdG8gZnJlZSB0aGUgbmV0IHJlc291cmNlcwo+Cj4gVGhlcmUgaXMg
YSBtaXNzaW5nIGZ1bGwgc3RvcC4gWW91IGNvbW1lbnRlZCBvbiB0aGUgbmV4dCBlbWFpbCwKPgo+
IGFuZCBpdCBzZWVtcyB0aGF0IHlvdSBhcmUgYWxyZWFkeSBwcmVwYXJpbmcgZm9yIHY0LiAgV2l0
aCB0aGlzCj4KPgo+IFJldmlld2VkLWJ5OiBZYW50ZW5nIFNpIDxzaS55YW50ZW5nQGxpbnV4LmRl
dj4KUmV2aWV3ZWQtYnk6IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGxvb25nc29uLmNuPgoKPgo+
IFRoYW5rcywKPiBZYW50ZW5nCj4KPiA+IC0gKiBhbmQgcmVsZWFzZXMgdGhlIFBDSSByZXNvdXJj
ZXMuCj4gPiAgICAqLwo+ID4gICBzdGF0aWMgdm9pZCBzdG1tYWNfcGNpX3JlbW92ZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldikKPiA+ICAgewo+ID4gLSAgICAgaW50IGk7Cj4gPiAtCj4gPiAgICAgICBz
dG1tYWNfZHZyX3JlbW92ZSgmcGRldi0+ZGV2KTsKPiA+IC0KPiA+IC0gICAgIGZvciAoaSA9IDA7
IGkgPCBQQ0lfU1REX05VTV9CQVJTOyBpKyspIHsKPiA+IC0gICAgICAgICAgICAgaWYgKHBjaV9y
ZXNvdXJjZV9sZW4ocGRldiwgaSkgPT0gMCkKPiA+IC0gICAgICAgICAgICAgICAgICAgICBjb250
aW51ZTsKPiA+IC0gICAgICAgICAgICAgcGNpbV9pb3VubWFwX3JlZ2lvbnMocGRldiwgQklUKGkp
KTsKPiA+IC0gICAgICAgICAgICAgYnJlYWs7Cj4gPiAtICAgICB9Cj4gPiAgIH0KPiA+Cj4gPiAg
IHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3RtbWFjX3BjaV9zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
