Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B68806EE599
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Apr 2023 18:21:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F930C69063;
	Tue, 25 Apr 2023 16:21:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66AA1C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Apr 2023 16:21:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E2F24B3;
 Tue, 25 Apr 2023 09:22:19 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD31A3F587;
 Tue, 25 Apr 2023 09:21:31 -0700 (PDT)
Message-ID: <45bc13a8-1442-2dd3-b9ea-1ed2f5962bac@arm.com>
Date: Tue, 25 Apr 2023 17:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Daniel Palmer <daniel@0x0f.com>, Ansuel Smith <ansuelsmth@gmail.com>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Santiago Esteban <Santiago.Esteban@microchip.com>,
 Cristian Birsan <Cristian.Birsan@microchip.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <4ff4f171-c5f8-87af-aad1-5e7686292288@microchip.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <4ff4f171-c5f8-87af-aad1-5e7686292288@microchip.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, DTML <devicetree@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

T24gMjkvMDMvMjAyMiA5OjUwIGFtLCBOaWNvbGFzIEZlcnJlIHdyb3RlOgo+IEFuc3VlbCwgQWxs
LAo+IAo+IE9uIDI4LzAzLzIwMjIgYXQgMTA6NTUsIERhbmllbCBQYWxtZXIgd3JvdGU6Cj4+IEhp
IEFuc3VlbAo+Pgo+PiBPbiBNb24sIDI4IE1hciAyMDIyIGF0IDA5OjA5LCBBbnN1ZWwgU21pdGgg
PGFuc3VlbHNtdGhAZ21haWwuY29tPiB3cm90ZToKPj4+Cj4+PiBIaSwKPj4+IGFzIHRoZSB0aXRs
ZSBzYXksIHRoZSBpbnRlbnRpb24gb2YgdGhpcyAiInNlcmllcyIiIGlzIHRvIGZpbmFsbHkgCj4+
PiBjYXRlZ29yaXplCj4+PiB0aGUgQVJNIGR0cyBkaXJlY3RvcnkgaW4gc3ViZGlyZWN0b3J5IGZv
ciBlYWNoIG9lbS4KPj4KPj4gV2hpbGUgSSBhZ3JlZSB3aXRoIHRoaXMgY2hhbmdlIGFuZCB0aGlu
ayBpdCdzIGZvciB0aGUgZ29vZCAoYnJvd3NpbmcKPj4gdGhlIEFSTSBkdHMgZGlyZWN0b3J5IGF0
IHRoZSBtb21lbnQgaXMgZnJ1c3RyYXRpbmcuLikgSSB0aGluawo+PiBidWlsZHJvb3QgYW5kIG90
aGVycyBuZWVkIHRvIGJlIHRvbGQgYWJvdXQgdGhpcyBhcyBpdCdsbCBwb3RlbnRpYWxseQo+PiBi
cmVhayB0aGVpciBrZXJuZWwgYnVpbGQgc2NyaXB0aW5nIGZvciBBUk0gYW5kIHByb2JhYmx5IG1l
c3NlcyB1cCB0aGUKPj4gY29uZmlncyB0aGV5IGhhdmUgZm9yIGV4aXN0aW5nIGJvYXJkcy4KPiAK
PiBUaGlzIGFzcGVjdCBtdXN0bid0IGJlIHVuZGVyZXN0aW1hdGVkIGFuZCBJIGFudGljaXBhdGUg
bG90cyBvZiBpc3N1ZXMgCj4gZHVyaW5nIGEgbG9uZyB0aW1lIG9uIHRoaXMgcGFydGljdWxhciB0
b3BpYyBvZiAiYnVpbGQgc3lzdGVtcyIuCj4gCj4gQW5vdGhlciBhc3BlY3QgaXMgQ0kgYW5kIHB1
YmxpYyBvciBwcml2YXRlIHRlc3RpbmcgZmFybXMgd2UgYWxsIGhhdmUgCj4gcnVubmluZy4KClll
dCBhbm90aGVyIGlzIGlmIHRoaXMgYWZmZWN0cyB3aGF0IGBtYWtlIGR0YnNfaW5zdGFsbGAgZG9l
cyAoSSBkb24ndCAKa25vdyBmb3Igc3VyZSwgYnV0IEknZCBiZSBpbmNsaW5lZCB0byBzdXNwZWN0
IGl0IG1pZ2h0KS4gU29tZSBkaXN0cm9zIAp1c2UgdGhhdCB0byBkZWxpdmVyIHRoZSBEVEJzIGFz
IHBhcnQgb2YgdGhlaXIga2VybmVsIHBhY2thZ2UsIHNvIGlmIApwYXRocyBzdWRkZW5seSBjaGFu
Z2UgaXQgY291bGQgYnJlYWsgZW5kIHVzZXJzJyBib290bG9hZGVyIHNldHVwcyB0b28uCgpUaGFu
a3MsClJvYmluLgoKPiBUaGVzZSBhc3BlY3RzIGFsd2F5cyByZWZyYWluZWQgbWUgdG8gY2hhbmdl
IGFueXRoaW5nIGluIHRoZSBuYW1pbmcgCj4gc2NoZW1lIG9mIG91ciBEVCBmaWxlcywgYnV0IGlm
IHdlIGdvIGluIHRoaXMgZGlyZWN0aW9uLCB3ZSBtdXN0IHJlYWxseSAKPiBiZSBwcmVwYXJlZCBh
bmQgSSdtIHN0aWxsIG5vdCBjb252aW5jZSBpdCdzIHdvcnRoIGl0Li4uCj4gCj4gCj4gSWYgdGhp
cyBoYXMgdG8gaGFwcGVuLCBJIHdvdWxkIGFsc28gbGlrZSB0byBxdWV1ZSBzb21lIGZpbGUgbmFt
ZSBjaGFuZ2VzIAo+IHRvIGRvIGFsbCBtb2RpZmljYXRpb25zIGluIG9uZSBnbyBpbiBvcmRlciB0
byBsb3dlciB0aGUgYW5ub3lhbmNlIGxldmVsIAo+IG9mIHRob3NlIHdobyB3b3VsZCBuZWVkIHRv
IGFkYXB0IHRvIHRob3NlIGNoYW5nZXMuCj4gCj4gQlRXLCBpcyB0aGVyZSBhIGNvbW1vbiBzY2hl
bWUgZm9yIGR0cy9kdHNpIGZpbGUgbmFtaW5nPyBJcyBpdCBtb3JlIAo+IGVuZm9yY2VkIGluIG9u
ZSB3YXkgb3IgYW5vdGhlciBmb3IgYXJtNjQgaW4gYSBzZW5zZSB0aGF0IEkgY2FuIHRha2Ugc29t
ZSAKPiBub3JtIGFzIGFuIGV4YW1wbGU/Cj4gCj4gWy4uXQo+IAo+IEJlc3QgcmVnYXJkcywKPiAg
wqAgTmljb2xhcwo+IAo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
