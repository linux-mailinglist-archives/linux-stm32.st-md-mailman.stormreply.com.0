Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBB5721B8
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jul 2019 23:39:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48A79CFAC65;
	Tue, 23 Jul 2019 21:39:41 +0000 (UTC)
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A847CC35E0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2019 21:39:39 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d377e960000>; Tue, 23 Jul 2019 14:39:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 23 Jul 2019 14:39:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 23 Jul 2019 14:39:37 -0700
Received: from [10.26.11.185] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jul
 2019 21:39:32 +0000
To: Robin Murphy <robin.murphy@arm.com>, Jose Abreu <Jose.Abreu@synopsys.com>, 
 Lars Persson <lists@bofh.nu>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
 <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190722101830.GA24948@apalos>
 <CADnJP=thexf2sWcVVOLWw14rpteEj0RrfDdY8ER90MpbNN4-oA@mail.gmail.com>
 <BN8PR12MB326661846D53AAEE315A7434D3C40@BN8PR12MB3266.namprd12.prod.outlook.com>
 <11557fe0-0cba-cb49-0fb6-ad24792d4a53@nvidia.com>
 <BN8PR12MB3266664ECA192E02C06061EED3C40@BN8PR12MB3266.namprd12.prod.outlook.com>
 <BYAPR12MB3269A725AFDDA21E92946558D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <ab14f31f-2045-b1be-d31f-2a81b8527dac@nvidia.com>
 <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
 <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
 <3255edfa-4465-204b-4751-8d40c8fb1382@arm.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ae11deb4-abec-f0f9-312d-b11d72bc74cd@nvidia.com>
Date: Tue, 23 Jul 2019 22:39:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3255edfa-4465-204b-4751-8d40c8fb1382@arm.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1563917975; bh=3lTWQ4Ol+M8dbc5nZy7wEdkUC8P1FuGjPhA49g8j8zk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jvibVR/sKGrwa2X/qvAjnZwSbm2bNfciQjLdTf4vyefptsIWI8zsUowixYZ6tB9Nw
 Zlr9Yf1gr0DQJXt+6R6C0hyozvsu2WvdsxMKBhuXhnbwSb0R3ax3RQpxhKCKQ5vhzl
 VuhHWs8kZ5kB3D9acg6XfuQfHc/HPqve+4e6kkrdXG2dieduHRwBah8yWM1QwmG0XN
 k17/J7Fa3caqZkgKym+i/gpuFwuw3F9bG7+7prK7J7P10qK3bv2yWLHppIQPmJCOxs
 csTZdSV19F6ZS7wjvM86WuqApUCoHIJIhufWWHBg/gd9OMXU0zwVvSKBmC/J/f4jTi
 w8VKyH/YrF9Zw==
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
 support for Page Pool
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

Ck9uIDIzLzA3LzIwMTkgMTQ6MTksIFJvYmluIE11cnBoeSB3cm90ZToKCi4uLgoKPj4+IERvIHlv
dSBrbm93IGlmIHRoZSBTTU1VIGludGVycnVwdHMgYXJlIHdvcmtpbmcgY29ycmVjdGx5PyBJZiBu
b3QsIGl0J3MKPj4+IHBvc3NpYmxlIHRoYXQgYW4gaW5jb3JyZWN0IGFkZHJlc3Mgb3IgbWFwcGlu
ZyBkaXJlY3Rpb24gY291bGQgbGVhZCB0bwo+Pj4gdGhlIERNQSB0cmFuc2FjdGlvbiBqdXN0IGJl
aW5nIHNpbGVudGx5IHRlcm1pbmF0ZWQgd2l0aG91dCBhbnkgZmF1bHQKPj4+IGluZGljYXRpb24s
IHdoaWNoIGdlbmVyYWxseSBwcmVzZW50cyBhcyBpbmV4cGxpY2FibGUgd2VpcmRuZXNzIChJJ3Zl
Cj4+PiBjZXJ0YWlubHkgc2VlbiB0aGF0IG9uIGFub3RoZXIgcGxhdGZvcm0gd2l0aCB0aGUgbWl4
IG9mIGFuIHVuc3VwcG9ydGVkCj4+PiBpbnRlcnJ1cHQgY29udHJvbGxlciBhbmQgYW4gJ2ltcGVy
ZmVjdCcgZXRoZXJuZXQgZHJpdmVyKS4KPj4KPj4gSWYgSSBzaW1wbHkgcmVtb3ZlIHRoZSBpb21t
dSBub2RlIGZvciB0aGUgZXRoZXJuZXQgY29udHJvbGxlciwgdGhlbiBJCj4+IHNlZSBsb3RzIG9m
IC4uLgo+Pgo+PiBbwqDCoMKgIDYuMjk2MTIxXSBhcm0tc21tdSAxMjAwMDAwMC5pb21tdTogVW5l
eHBlY3RlZCBnbG9iYWwgZmF1bHQsIHRoaXMKPj4gY291bGQgYmUgc2VyaW91cwo+PiBbwqDCoMKg
IDYuMjk2MTI1XSBhcm0tc21tdSAxMjAwMDAwMC5pb21tdTrCoMKgwqDCoMKgwqDCoMKgIEdGU1Ig
MHgwMDAwMDAwMiwKPj4gR0ZTWU5SMCAweDAwMDAwMDAwLCBHRlNZTlIxIDB4MDAwMDAwMTQsIEdG
U1lOUjIgMHgwMDAwMDAwMAo+Pgo+PiBTbyBJIGFzc3VtZSB0aGF0IHRoaXMgaXMgdHJpZ2dlcmlu
ZyB0aGUgU01NVSBpbnRlcnJ1cHQgY29ycmVjdGx5Lgo+IAo+IEFjY29yZGluZyB0byB0ZWdyYTE4
Ni5kdHNpIGl0IGFwcGVhcnMgeW91J3JlIHVzaW5nIHRoZSBNTVUtNTAwIGNvbWJpbmVkCj4gaW50
ZXJydXB0LCBzbyBpZiBnbG9iYWwgZmF1bHRzIGFyZSBiZWluZyBkZWxpdmVyZWQgdGhlbiBjb250
ZXh0IGZhdWx0cwo+ICpzaG91bGQqIGFsc28sIGJ1dCBJJ2QgYmUgaW5jbGluZWQgdG8gdHJ5IGEg
cXVpY2sgaGFjayBvZiB0aGUgcmVsZXZhbnQKPiBzdG1tYWNfZGVzY19vcHM6OnNldF9hZGRyIGNh
bGxiYWNrIHRvIHdyaXRlIHNvbWUgYm9ndXMgdW5tYXBwZWQgYWRkcmVzcwo+IGp1c3QgdG8gbWFr
ZSBzdXJlIGFybV9zbW11X2NvbnRleHRfZmF1bHQoKSB0aGVuIHNjcmVhbXMgYXMgZXhwZWN0ZWQs
IGFuZAo+IHdlJ3JlIG5vdCBtaXNzaW5nIGFueXRoaW5nIGVsc2UuCgpJIGhhY2tlZCB0aGUgZHJp
dmVyIGFuZCBmb3JjZWQgdGhlIGFkZHJlc3MgdG8gemVybyBmb3IgYSB0ZXN0IGFuZAppbiBkb2lu
ZyBzbyBJIHNlZSAuLi4KClsgICAxMC40NDAwNzJdIGFybS1zbW11IDEyMDAwMDAwLmlvbW11OiBV
bmhhbmRsZWQgY29udGV4dCBmYXVsdDogZnNyPTB4NDAyLCBpb3ZhPTB4MDAwMDAwMDAsIGZzeW5y
PTB4MWMwMDExLCBjYmZyc3lucmE9MHgxNCwgY2I9MAoKU28gbG9va3MgbGlrZSB0aGUgaW50ZXJy
dXB0cyBhcmUgd29ya2luZyBBRkFJQ1QuCgpDaGVlcnMKSm9uCgotLSAKbnZwdWJsaWMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
