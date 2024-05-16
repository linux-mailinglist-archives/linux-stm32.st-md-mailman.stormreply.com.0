Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D10308C74DC
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 12:55:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F262C6DD66;
	Thu, 16 May 2024 10:55:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30B0AC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 10:55:25 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 62348882A2;
 Thu, 16 May 2024 12:55:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715856924;
 bh=5GO3dsCEhV/yq/JtclRgIUNkt8t13jadvqCsqEkQTgo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dhGZfzCLZhH3cWcNek5v0vG0MzZ3LLEDx4qKsUGBl++JYd79Czp1VdlloPXMKdaI+
 1YfiLBkfnd/BHPuMWJKN3u+OLKZVXgRZHcX/m1zngwRrkUBheRmenOj9AmmEx9bhLa
 7upWN/JH5VaBjw/XXckY5ZA7vXbcm1JUOXYU3cqJupPxeTVZPaO8E+id46ys28+Ssu
 F69W3W0IUyl3f6Or1JtzcY7Z5KaEUfEsXw1K1MTo9FR0qgKw3ve7RpYkP4G4tdH5L3
 Jt3ffRYYUE8EOingMMQ/QsRqIYn3VN865JjeLRRAXPDLdaXrZ3kJ+PgmHeNJ5aVAZl
 nmtlZQjd+SwmQ==
Message-ID: <2eb2b80e-8650-46cf-9d8f-6dd6a884558a@denx.de>
Date: Thu, 16 May 2024 12:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 linux-crypto@vger.kernel.org
References: <20240513220349.183568-1-marex@denx.de>
 <b2d0dfcb-37d6-4375-a4ad-ca96a5339840@foss.st.com>
 <cc6f98eb-f6b2-4a34-a8ed-c0f759fa4c79@denx.de>
 <51951dd4-8e8c-4e67-89f6-6a710022e34f@foss.st.com>
 <3257e8f8-5bb0-4c75-a3a3-e5685b65de2a@denx.de>
 <5b39b5b6-7008-4362-a578-3faab87cd23b@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <5b39b5b6-7008-4362-a578-3faab87cd23b@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] [RFC] clk: stm32mp1: Keep RNG1 clock
	always running
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gNS8xNi8yNCA5OjQyIEFNLCBHYXRpZW4gQ0hFVkFMTElFUiB3cm90ZToKCkhpLAoKPj4+Pj4g
V2hhdCBpZiB5b3UgYWRkIGEgdHJhY2UgaW4gYSByYW5kb20gZ2VuZXJhdGlvbiBmdW5jdGlvbiBp
biByYW5kb20uYz8KPj4+Pgo+Pj4+IERvIHlvdSBoYXZlIGEgZnVuY3Rpb24gbmFtZSBvciBsaW5l
IG51bWJlciBmb3IgbWUgPwo+Pj4KPj4+IEkgcHV0IGEgdHJhY2UgaW4gX2dldF9yYW5kb21fYnl0
ZXMoKSBpbiBkcml2ZXJzL2NoYXIvcmFuZG9tLmMuIEknbSBub3QKPj4+IDEwMCUgc3VyZSBidXQg
dGhpcyBzaG91bGQgYmUgdGhlIGVudHJ5IHBvaW50IHdoZW4gZ2V0dGluZyBhIHJhbmRvbSAKPj4+
IG51bWJlci4KPj4KPj4gWW91J3JlIHJpZ2h0LCB0aGVyZSBpcyBhIHJlYWQgYXR0ZW1wdCByaWdo
dCBiZWZvcmUgdGhlIGhhbmcsIGFuZCAKPj4gX19jbGtfaXNfZW5hYmxlZCgpIHJldHVybnMgMCBp
biBzdG0zMl9yZWFkX3JuZygpIC4gSW4gZmFjdCwgaXQgaXMgdGhlIAo+PiBwbV9ydW50aW1lX2dl
dF9zeW5jKCkgd2hpY2ggaXMgcmV0dXJuaW5nIC1FQUNDRVMgaW5zdGVhZCBvZiB6ZXJvLCBhbmQg
Cj4+IHRoaXMgaXMgY3VycmVudGx5IG5vdCBjaGVja2VkIHNvIHRoZSBmYWlsdXJlIGlzIG5vdCBk
ZXRlY3RlZCBiZWZvcmUgCj4+IHJlZ2lzdGVyIGFjY2VzcyB0YWtlcyBwbGFjZSwgdG8gcmVnaXN0
ZXIgZmlsZSB3aXRoIGNsb2NrIGRpc2FibGVkLCAKPj4gd2hpY2ggdHJpZ2dlcnMgYSBoYXJkIGhh
bmcuCj4+Cj4+IEknbGwgYmUgc2VuZGluZyBhIHBhdGNoIHNob3J0bHksIHRoYW5rcyBmb3IgdGhp
cyBoaW50ICEKPj4KPiAKPiBHcmVhdCBuZXdzLCBpbmRlZWQgdGhlIHJldHVybiBjb2RlIGlzbid0
IGNoZWNrZWQuIExldCdzIHVzZQo+IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKS4KClllcyBw
bGVhc2UuCgpJIHdpbGwgd29uZGVyIHdoeSB3ZSBnZXQgRUFDQ0VTIHRob3VnaCwgdGhhdCBiYXNp
Y2FsbHkgbWVhbnMgd2UgYXJlIApzdXNwZW5kaW5nIGFscmVhZHkuIElzIGl0IHNhZmUgdG8gcmV0
dXJuIC1lcnJubyBmcm9tIHJuZyByZWFkIGZ1bmN0aW9uIAppbiB0aGF0IGNhc2UgPwoKPj4+Pj4g
QWZ0ZXIgdGhpcywgSSdsbCB0cnkgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZS4KPj4+Pgo+Pj4+IElm
IHlvdSBoYXZlIGEgbWludXRlIHRvIHRlc3QgaXQgb24gc29tZSBTVCBNUDE1IGJvYXJkLCB0aGF0
IHdvdWxkIGJlIAo+Pj4+IHJlYWwgbmljZS4gVGhhbmtzICEKPj4+Cj4+PiBJIHRyaWVkIHRvIHJl
cHJvZHVjZSB0aGUgaXNzdWUgeW91J3JlIGZhY2luZyBvbiBhIFNUTTMyTVAxNTdDLURLMiBubwo+
Pj4gU0NNSSBvbiB0aGUgNi45LXJjNyBrZXJuZWwgdGFnLiBJIHVzZXMgT1AtVEVFIGFuZCBURi1B
IGluIHRoZSBib290Y2hhaW4KPj4+IGJ1dCB0aGlzIHNob3VsZCBub3QgaGF2ZSBhbiBpbXBhY3Qg
aGVyZS4KPj4+Cj4+PiBIb3cgZGlkIHlvdSBtYW5hZ2UgdG8gdGVzdCB1c2luZyAiZWNobyBjb3Jl
ID4gL3N5cy9wb3dlci9wbV90ZXN0Ij8KPj4+IEluIGtlcm5lbC9wb3dlci9zdXNwZW5kLmMsIGVu
dGVyX3N0YXRlKCkuIElmIHRoZSBwbV90ZXN0X2xldmVsIGlzIGNvcmUsCj4+PiB0aGVuIGFuIGVy
cm9yIGlzIGZpcmVkIHdpdGggdGhlIGZvbGxvd2luZyB0cmFjZToKPj4+ICJVbnN1cHBvcnRlZCB0
ZXN0IG1vZGUgZm9yIHN1c3BlbmQgdG8gaWRsZSwgcGxlYXNlIGNob29zZSAKPj4+IG5vbmUvZnJl
ZXplci9kZXZpY2VzL3BsYXRmb3JtLiIKPj4KPj4gQ291bGQgdGhpcyBiZSBmaXJtd2FyZSByZWxh
dGVkID8KPj4KPj4+IEkndmUgdHJpZWQgdXNpbmcgImVjaG8gZGV2aWNlcyA+IC9zeXMvcG93ZXIv
cG1fdGVzdCIgc28gdGhhdCBJIGNhbiBhdCAKPj4+IGxlYXN0IHRlc3QgdGhhdCB0aGUgZHJpdmVy
IGlzIHB1dCB0byBzbGVlcCB0aGVuIHdha2VzIHVwLiBJIGRvIG5vdAo+Pj4gcmVwcm9kdWNlIHlv
dXIgaXNzdWUuCj4+Cj4+IENhbiB5b3UgdHJ5ICdwcm9jZXNzb3JzJyA/Cj4+Cj4gCj4gR2l2ZW4g
dGhpczoKPiAjaWZkZWYgQ09ORklHX1BNX0RFQlVHCj4gIMKgwqDCoMKgwqDCoMKgIGlmIChwbV90
ZXN0X2xldmVsICE9IFRFU1RfTk9ORSAmJiBwbV90ZXN0X2xldmVsIDw9IFRFU1RfQ1BVUykgewo+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX3dhcm4oIlVuc3VwcG9ydGVkIHRlc3QgbW9kZSBm
b3Igc3VzcGVuZCB0byBpZGxlCgpZb3UncmUgc3VwcG9zZWQgdG8gYmUgc3VzcGVuZGluZyB0byAn
bWVtJyAsIG5vdCAnaWRsZScgLiBDb3VsZCB0aGF0IGJlIGl0ID8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
