Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 803D31B5D39
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Apr 2020 16:04:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3425CC36B0B;
	Thu, 23 Apr 2020 14:04:54 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F5BFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 14:04:53 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 497Jw43Jttz1rtM5;
 Thu, 23 Apr 2020 16:04:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 497Jw42Q31z1qqkC;
 Thu, 23 Apr 2020 16:04:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 2TyT5R-O8REY; Thu, 23 Apr 2020 16:04:50 +0200 (CEST)
X-Auth-Info: WGOOiAehNjnbCXuln/LclndS0sJT0Fb5etIUNP7tpeA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 23 Apr 2020 16:04:50 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200422104613.96944-1-marex@denx.de>
 <222f356a-2f4a-47d7-9e4f-e80b6a3f32b0@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <daf1bcdc-29a6-db60-cd60-3521aca2ce9b@denx.de>
Date: Thu, 23 Apr 2020 16:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <222f356a-2f4a-47d7-9e4f-e80b6a3f32b0@st.com>
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

T24gNC8yMy8yMCAzOjM2IFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IEtpIE1hcmVrCgpI
aSwKCj4gT24gNC8yMi8yMCAxMjo0NSBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IFRoZSBBVjk2
IGJvYXJkIGRldmljZSB0cmVlIGlzIGNvbXBsZXRlbHkgYnJva2VuIGFuZCBkb2VzIG5vdCBtYXRj
aCB0aGUKPj4gaGFyZHdhcmUuIFRoaXMgc2VyaWVzIGZpeGVzIGl0IHVwLgo+Pgo+PiBNYXJlayBW
YXN1dCAoMjApOgo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogUmVwYWlyIFBNSUMgY29uZmlndXJh
dGlvbiBvbiBBVjk2Cj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBSZXBhaXIgUE1JQyBpbnRlcnJ1
cHQgb24gQVY5Ngo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGFsdGVybmF0ZSBwaW5tdXgg
Zm9yIGV0aGVybmV0IFJHTUlJCj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBSZXBhaXIgZXRoZXJu
ZXQgb3BlcmF0aW9uIG9uIEFWOTYKPj4gwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBtaXNzaW5n
IGV0aGVybmV0IFBIWSByZXNldCBvbiBBVjk2Cj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQg
bWlzc2luZyBldGhlcm5ldCBQSFkgc2tld3Mgb24gQVY5Ngo+PiDCoMKgIEFSTTogZHRzOiBzdG0z
MjogQWRkIGFsdGVybmF0ZSBwaW5tdXggZm9yIFNETU1DIHBpbnMKPj4gwqDCoCBBUk06IGR0czog
c3RtMzI6IFJlcGFpciBTRE1NQzEgb3BlcmF0aW9uIG9uIEFWOTYKPj4gwqDCoCBBUk06IGR0czog
c3RtMzI6IEFkZCBlTU1DIGF0dGFjaGVkIHRvIFNETU1DMiBvbiBBVjk2Cj4+IMKgwqAgQVJNOiBk
dHM6IHN0bTMyOiBBZGQgUVNQSSBOT1Igb24gQVY5Ngo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjog
QWRkIGNvbmZpZ3VyYXRpb24gRUVQUk9NIG9uIEFWOTYKPj4gwqDCoCBBUk06IGR0czogc3RtMzI6
IEVuYWJsZSBXaUZpIG9uIEFWOTYKPj4gwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5h
dGUgcGlubXV4IGZvciBVU0FSVDIgcGlucwo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogRW5hYmxl
IEJsdWV0b290aCBvbiBBVjk2Cj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRl
IHBpbm11eCBmb3IgTFREQyBwaW5zCj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYmluZGlu
Z3MgZm9yIEhETUkgdmlkZW8gb24gQVY5Ngo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGFs
dGVybmF0ZSBwaW5tdXggZm9yIFNBSTIgcGlucwo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRk
IGJpbmRpbmdzIGZvciBhdWRpbyBvbiBBVjk2Cj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQg
YmluZGluZ3MgZm9yIFVTQiBvbiBBVjk2Cj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBSZW5hbWUg
TEVEcyB0byBtYXRjaCBzaWxrc2NyZWVuIG9uIEFWOTYKPj4KPj4gwqAgYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1LXBpbmN0cmwuZHRzacKgwqDCoCB8IDI4MCArKysrKysrKysrKysrKysrKwo+
PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1hdmVuZ2VyOTYuZHRzIHwgMzI0ICsr
KysrKysrKysrKysrKysrKy0tCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNTcyIGluc2VydGlvbnMo
KyksIDMyIGRlbGV0aW9ucygtKQo+Pgo+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJl
LnRvcmd1ZUBzdC5jb20+Cj4+IENjOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4u
c2FkaGFzaXZhbUBsaW5hcm8ub3JnPgo+PiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4u
c3RtMzJAZ21haWwuY29tPgo+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRA
c3QuY29tPgo+PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+
Cj4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IFRvOiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4KPiAKPiBTZXJpZXMgbG9va3Mg
Z29vZCB0byBtZS4gSSdsbCBtZXJnZSBpdCBmb3IgbXkgbmV4dCBQci4KPiBKdXN0IG9uZSBxdWVz
dGlvbiwgQXJlIHdlIHN0aWxsIGFibGUgdG8gYm9vdCBvbGRlciBib2FyZCByZXZpc2lvbgo+IChw
cm90b3R5cGUgb25lcyk/CgpJIGRvbid0IGhhdmUgb25lLCBidXQgaWYgd2Ugd2FudCB0byBzdXBw
b3J0IHRoZSBwcm90b3R5cGVzLCB3ZSB3aWxsIG5lZWQKYSBzZXBhcmF0ZSBEVCBmb3IgdGhhdCAo
b3IgYSBmZXcgRFRTaSB0byBoYW5kbGUgdGhlIEhXIGRpZmZlcmVuY2VzKS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
