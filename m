Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B75881BC081
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2020 16:04:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 670C8C36B0C;
	Tue, 28 Apr 2020 14:04:08 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D8CFC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 14:04:06 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49BNft0nX6z1rpRj;
 Tue, 28 Apr 2020 16:04:06 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49BNft07m2z1r5Qt;
 Tue, 28 Apr 2020 16:04:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 0AciagwW6Vye; Tue, 28 Apr 2020 16:04:04 +0200 (CEST)
X-Auth-Info: eUXq+cFr+9HoJg9P8mkXk5huwvzTc26+NTHKnUQgZy8=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 28 Apr 2020 16:04:04 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200422104613.96944-1-marex@denx.de>
 <222f356a-2f4a-47d7-9e4f-e80b6a3f32b0@st.com>
 <daf1bcdc-29a6-db60-cd60-3521aca2ce9b@denx.de>
 <49762c79-a374-92a2-975e-afe7a4e7eb3c@denx.de>
 <a7e83ab6-a62a-d501-2e09-be7954418e01@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <c2a65f11-98a5-4497-8359-c9346fbc9c85@denx.de>
Date: Tue, 28 Apr 2020 16:04:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a7e83ab6-a62a-d501-2e09-be7954418e01@st.com>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V5 00/20] ARM: dts: stm32: Repair AV96
	board
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

T24gNC8yOC8yMCAzOjU0IFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IEhpIE1hcmVrCj4g
Cj4gT24gNC8yOC8yMCAzOjMyIFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gNC8yMy8yMCA0
OjA0IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IE9uIDQvMjMvMjAgMzozNiBQTSwgQWxleGFu
ZHJlIFRvcmd1ZSB3cm90ZToKPj4+PiBLaSBNYXJlawo+Pj4KPj4+IEhpLAo+Pgo+PiBIZWxsbyBh
Z2FpbiwKPj4KPj4+PiBPbiA0LzIyLzIwIDEyOjQ1IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+
Pj4gVGhlIEFWOTYgYm9hcmQgZGV2aWNlIHRyZWUgaXMgY29tcGxldGVseSBicm9rZW4gYW5kIGRv
ZXMgbm90IG1hdGNoIHRoZQo+Pj4+PiBoYXJkd2FyZS4gVGhpcyBzZXJpZXMgZml4ZXMgaXQgdXAu
Cj4+Pj4+Cj4+Pj4+IE1hcmVrIFZhc3V0ICgyMCk6Cj4+Pj4+IMKgwqDCoCBBUk06IGR0czogc3Rt
MzI6IFJlcGFpciBQTUlDIGNvbmZpZ3VyYXRpb24gb24gQVY5Ngo+Pj4+PiDCoMKgwqAgQVJNOiBk
dHM6IHN0bTMyOiBSZXBhaXIgUE1JQyBpbnRlcnJ1cHQgb24gQVY5Ngo+Pj4+PiDCoMKgwqAgQVJN
OiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3IgZXRoZXJuZXQgUkdNSUkKPj4+
Pj4gwqDCoMKgIEFSTTogZHRzOiBzdG0zMjogUmVwYWlyIGV0aGVybmV0IG9wZXJhdGlvbiBvbiBB
Vjk2Cj4+Pj4+IMKgwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBtaXNzaW5nIGV0aGVybmV0IFBI
WSByZXNldCBvbiBBVjk2Cj4+Pj4+IMKgwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBtaXNzaW5n
IGV0aGVybmV0IFBIWSBza2V3cyBvbiBBVjk2Cj4+Pj4+IMKgwqDCoCBBUk06IGR0czogc3RtMzI6
IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBTRE1NQyBwaW5zCj4+Pj4+IMKgwqDCoCBBUk06IGR0
czogc3RtMzI6IFJlcGFpciBTRE1NQzEgb3BlcmF0aW9uIG9uIEFWOTYKPj4+Pj4gwqDCoMKgIEFS
TTogZHRzOiBzdG0zMjogQWRkIGVNTUMgYXR0YWNoZWQgdG8gU0RNTUMyIG9uIEFWOTYKPj4+Pj4g
wqDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIFFTUEkgTk9SIG9uIEFWOTYKPj4+Pj4gwqDCoMKg
IEFSTTogZHRzOiBzdG0zMjogQWRkIGNvbmZpZ3VyYXRpb24gRUVQUk9NIG9uIEFWOTYKPj4+Pj4g
wqDCoMKgIEFSTTogZHRzOiBzdG0zMjogRW5hYmxlIFdpRmkgb24gQVY5Ngo+Pj4+PiDCoMKgwqAg
QVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3IgVVNBUlQyIHBpbnMKPj4+
Pj4gwqDCoMKgIEFSTTogZHRzOiBzdG0zMjogRW5hYmxlIEJsdWV0b290aCBvbiBBVjk2Cj4+Pj4+
IMKgwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBMVERDIHBp
bnMKPj4+Pj4gwqDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGJpbmRpbmdzIGZvciBIRE1JIHZp
ZGVvIG9uIEFWOTYKPj4+Pj4gwqDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGFsdGVybmF0ZSBw
aW5tdXggZm9yIFNBSTIgcGlucwo+Pj4+PiDCoMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYmlu
ZGluZ3MgZm9yIGF1ZGlvIG9uIEFWOTYKPj4+Pj4gwqDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRk
IGJpbmRpbmdzIGZvciBVU0Igb24gQVY5Ngo+Pj4+PiDCoMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBS
ZW5hbWUgTEVEcyB0byBtYXRjaCBzaWxrc2NyZWVuIG9uIEFWOTYKPj4+Pj4KPj4+Pj4gwqDCoCBh
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5kdHNpwqDCoMKgIHwgMjgwICsrKysr
KysrKysrKysrKysrCj4+Pj4+IMKgwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2EtYXZl
bmdlcjk2LmR0cyB8IDMyNAo+Pj4+PiArKysrKysrKysrKysrKysrKystLQo+Pj4+PiDCoMKgIDIg
ZmlsZXMgY2hhbmdlZCwgNTcyIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQo+Pj4+Pgo+
Pj4+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBzdC5jb20+Cj4+Pj4+
IENjOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8u
b3JnPgo+Pj4+PiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29t
Pgo+Pj4+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPgo+Pj4+
PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+Cj4+Pj4+IENj
OiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+Pj4+IFRvOiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+Pj4KPj4+Pgo+Pj4+IFNlcmllcyBs
b29rcyBnb29kIHRvIG1lLiBJJ2xsIG1lcmdlIGl0IGZvciBteSBuZXh0IFByLgo+Pj4+IEp1c3Qg
b25lIHF1ZXN0aW9uLCBBcmUgd2Ugc3RpbGwgYWJsZSB0byBib290IG9sZGVyIGJvYXJkIHJldmlz
aW9uCj4+Pj4gKHByb3RvdHlwZSBvbmVzKT8KPj4+Cj4+PiBJIGRvbid0IGhhdmUgb25lLCBidXQg
aWYgd2Ugd2FudCB0byBzdXBwb3J0IHRoZSBwcm90b3R5cGVzLCB3ZSB3aWxsIG5lZWQKPj4+IGEg
c2VwYXJhdGUgRFQgZm9yIHRoYXQgKG9yIGEgZmV3IERUU2kgdG8gaGFuZGxlIHRoZSBIVyBkaWZm
ZXJlbmNlcykuCj4+Cj4+IEkgZ290IHRoZSA1ODgtMTAwIHByb3RvdHlwZSB0b28gbm93LCBhbmQg
SSBoYXZlIG1vcmUgcGF0Y2hlcyB3aGljaCBJCj4+IHdvdWxkIGxpa2UgdG8gc3RhcnQgdXBzdHJl
YW1pbmcgb24gdG9wIG9mIHRoaXMgc2VyaWVzIChsaWtlIHNwbGl0IHRoZQo+PiBTb00gRFQgZnJv
bSB0aGUgYm9hcmQgRFQpLCBjYW4gdGhlc2UgYmUgYXBwbGllZCBzbyBJIGNhbiBzdGFydCBzZW5k
aW5nCj4+IHRoZSByZXN0Pwo+Pgo+IAo+IEknbGwgdHJ5IHRvIGRvIGl0IHRvZGF5IG9yIHRvbW9y
cm93LgoKQ29vbCwgdGhhbmtzICEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
