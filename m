Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78B1BE418
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 18:40:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6959AC36B0D;
	Wed, 29 Apr 2020 16:40:48 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1769C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 16:40:46 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49C4596Bjfz1rs2Q;
 Wed, 29 Apr 2020 18:40:45 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49C4595GR0z1qqkP;
 Wed, 29 Apr 2020 18:40:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 5BMjDKLmcYFg; Wed, 29 Apr 2020 18:40:44 +0200 (CEST)
X-Auth-Info: 2OILK8JRk7oanegYFOtEzRhOZ8gy2ta3xQ80DatFi0U=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 29 Apr 2020 18:40:44 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200422104613.96944-1-marex@denx.de>
 <e47b72fc-9591-021d-7abc-14a7166a4845@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <9a5d29a4-14ae-1e4f-68fe-21e4f619625d@denx.de>
Date: Wed, 29 Apr 2020 18:40:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e47b72fc-9591-021d-7abc-14a7166a4845@st.com>
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

T24gNC8yOS8yMCA5OjU2IEFNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IEhpIE1hcmVrCj4g
Cj4gT24gNC8yMi8yMCAxMjo0NSBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IFRoZSBBVjk2IGJv
YXJkIGRldmljZSB0cmVlIGlzIGNvbXBsZXRlbHkgYnJva2VuIGFuZCBkb2VzIG5vdCBtYXRjaCB0
aGUKPj4gaGFyZHdhcmUuIFRoaXMgc2VyaWVzIGZpeGVzIGl0IHVwLgo+Pgo+PiBNYXJlayBWYXN1
dCAoMjApOgo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogUmVwYWlyIFBNSUMgY29uZmlndXJhdGlv
biBvbiBBVjk2Cj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBSZXBhaXIgUE1JQyBpbnRlcnJ1cHQg
b24gQVY5Ngo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGFsdGVybmF0ZSBwaW5tdXggZm9y
IGV0aGVybmV0IFJHTUlJCj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBSZXBhaXIgZXRoZXJuZXQg
b3BlcmF0aW9uIG9uIEFWOTYKPj4gwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBtaXNzaW5nIGV0
aGVybmV0IFBIWSByZXNldCBvbiBBVjk2Cj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgbWlz
c2luZyBldGhlcm5ldCBQSFkgc2tld3Mgb24gQVY5Ngo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjog
QWRkIGFsdGVybmF0ZSBwaW5tdXggZm9yIFNETU1DIHBpbnMKPj4gwqDCoCBBUk06IGR0czogc3Rt
MzI6IFJlcGFpciBTRE1NQzEgb3BlcmF0aW9uIG9uIEFWOTYKPj4gwqDCoCBBUk06IGR0czogc3Rt
MzI6IEFkZCBlTU1DIGF0dGFjaGVkIHRvIFNETU1DMiBvbiBBVjk2Cj4+IMKgwqAgQVJNOiBkdHM6
IHN0bTMyOiBBZGQgUVNQSSBOT1Igb24gQVY5Ngo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRk
IGNvbmZpZ3VyYXRpb24gRUVQUk9NIG9uIEFWOTYKPj4gwqDCoCBBUk06IGR0czogc3RtMzI6IEVu
YWJsZSBXaUZpIG9uIEFWOTYKPj4gwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUg
cGlubXV4IGZvciBVU0FSVDIgcGlucwo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogRW5hYmxlIEJs
dWV0b290aCBvbiBBVjk2Cj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBp
bm11eCBmb3IgTFREQyBwaW5zCj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYmluZGluZ3Mg
Zm9yIEhETUkgdmlkZW8gb24gQVY5Ngo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGFsdGVy
bmF0ZSBwaW5tdXggZm9yIFNBSTIgcGlucwo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGJp
bmRpbmdzIGZvciBhdWRpbyBvbiBBVjk2Cj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYmlu
ZGluZ3MgZm9yIFVTQiBvbiBBVjk2Cj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBSZW5hbWUgTEVE
cyB0byBtYXRjaCBzaWxrc2NyZWVuIG9uIEFWOTYKPj4KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMv
c3RtMzJtcDE1LXBpbmN0cmwuZHRzacKgwqDCoCB8IDI4MCArKysrKysrKysrKysrKysrKwo+PiDC
oCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1hdmVuZ2VyOTYuZHRzIHwgMzI0ICsrKysr
KysrKysrKysrKysrKy0tCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNTcyIGluc2VydGlvbnMoKyks
IDMyIGRlbGV0aW9ucygtKQo+Pgo+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRv
cmd1ZUBzdC5jb20+Cj4+IENjOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2Fk
aGFzaXZhbUBsaW5hcm8ub3JnPgo+PiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3Rt
MzJAZ21haWwuY29tPgo+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3Qu
Y29tPgo+PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+Cj4+
IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IFRvOiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4KPiAKPiBTZXJpZXMgYXBwbGllZCBv
biBzdG0zMi1uZXh0LgoKVGhhbmtzLiBJIHNlbnQgb3V0IHRoZSByZXN0LCB3aGljaCBzaG91bGQg
YmUgdmVyeSBtdWNoIGFsbCB0aGVyZSBpcyBmb3IKbm93IDopCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
