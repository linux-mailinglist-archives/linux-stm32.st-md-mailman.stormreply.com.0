Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7DB1BF2EF
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 10:34:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43E0DC36B0D;
	Thu, 30 Apr 2020 08:34:56 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86390C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 08:34:53 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49CTG52n6mz1rxLc;
 Thu, 30 Apr 2020 10:34:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49CTG5282Qz1qr4R;
 Thu, 30 Apr 2020 10:34:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id rO_cmmhBYBgv; Thu, 30 Apr 2020 10:34:52 +0200 (CEST)
X-Auth-Info: vfMMi5qkboyo/hM/S+7iw6zVKCTsG9PKMqbDqAskUi8=
Received: from [127.0.0.1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 30 Apr 2020 10:34:52 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200422104613.96944-1-marex@denx.de>
 <e47b72fc-9591-021d-7abc-14a7166a4845@st.com>
 <9a5d29a4-14ae-1e4f-68fe-21e4f619625d@denx.de>
 <d1e9c84c-48a1-0eef-9da4-94c184ac179c@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <2f02a4a1-a42a-a9c2-9cea-f6111f877fc3@denx.de>
Date: Thu, 30 Apr 2020 10:22:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d1e9c84c-48a1-0eef-9da4-94c184ac179c@st.com>
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

T24gNC8zMC8yMCA5OjM5IEFNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IAo+IAo+IE9uIDQv
MjkvMjAgNjo0MCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDQvMjkvMjAgOTo1NiBBTSwg
QWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4+IEhpIE1hcmVrCj4+Pgo+Pj4gT24gNC8yMi8yMCAx
Mjo0NSBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+Pj4gVGhlIEFWOTYgYm9hcmQgZGV2aWNlIHRy
ZWUgaXMgY29tcGxldGVseSBicm9rZW4gYW5kIGRvZXMgbm90IG1hdGNoIHRoZQo+Pj4+IGhhcmR3
YXJlLiBUaGlzIHNlcmllcyBmaXhlcyBpdCB1cC4KPj4+Pgo+Pj4+IE1hcmVrIFZhc3V0ICgyMCk6
Cj4+Pj4gwqDCoMKgIEFSTTogZHRzOiBzdG0zMjogUmVwYWlyIFBNSUMgY29uZmlndXJhdGlvbiBv
biBBVjk2Cj4+Pj4gwqDCoMKgIEFSTTogZHRzOiBzdG0zMjogUmVwYWlyIFBNSUMgaW50ZXJydXB0
IG9uIEFWOTYKPj4+PiDCoMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11
eCBmb3IgZXRoZXJuZXQgUkdNSUkKPj4+PiDCoMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBSZXBhaXIg
ZXRoZXJuZXQgb3BlcmF0aW9uIG9uIEFWOTYKPj4+PiDCoMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBB
ZGQgbWlzc2luZyBldGhlcm5ldCBQSFkgcmVzZXQgb24gQVY5Ngo+Pj4+IMKgwqDCoCBBUk06IGR0
czogc3RtMzI6IEFkZCBtaXNzaW5nIGV0aGVybmV0IFBIWSBza2V3cyBvbiBBVjk2Cj4+Pj4gwqDC
oMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGFsdGVybmF0ZSBwaW5tdXggZm9yIFNETU1DIHBpbnMK
Pj4+PiDCoMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBSZXBhaXIgU0RNTUMxIG9wZXJhdGlvbiBvbiBB
Vjk2Cj4+Pj4gwqDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGVNTUMgYXR0YWNoZWQgdG8gU0RN
TUMyIG9uIEFWOTYKPj4+PiDCoMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgUVNQSSBOT1Igb24g
QVY5Ngo+Pj4+IMKgwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBjb25maWd1cmF0aW9uIEVFUFJP
TSBvbiBBVjk2Cj4+Pj4gwqDCoMKgIEFSTTogZHRzOiBzdG0zMjogRW5hYmxlIFdpRmkgb24gQVY5
Ngo+Pj4+IMKgwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBV
U0FSVDIgcGlucwo+Pj4+IMKgwqDCoCBBUk06IGR0czogc3RtMzI6IEVuYWJsZSBCbHVldG9vdGgg
b24gQVY5Ngo+Pj4+IMKgwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4
IGZvciBMVERDIHBpbnMKPj4+PiDCoMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYmluZGluZ3Mg
Zm9yIEhETUkgdmlkZW8gb24gQVY5Ngo+Pj4+IMKgwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBh
bHRlcm5hdGUgcGlubXV4IGZvciBTQUkyIHBpbnMKPj4+PiDCoMKgwqAgQVJNOiBkdHM6IHN0bTMy
OiBBZGQgYmluZGluZ3MgZm9yIGF1ZGlvIG9uIEFWOTYKPj4+PiDCoMKgwqAgQVJNOiBkdHM6IHN0
bTMyOiBBZGQgYmluZGluZ3MgZm9yIFVTQiBvbiBBVjk2Cj4+Pj4gwqDCoMKgIEFSTTogZHRzOiBz
dG0zMjogUmVuYW1lIExFRHMgdG8gbWF0Y2ggc2lsa3NjcmVlbiBvbiBBVjk2Cj4+Pj4KPj4+PiDC
oMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNS1waW5jdHJsLmR0c2nCoMKgwqAgfCAyODAg
KysrKysrKysrKysrKysrKysKPj4+PiDCoMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdh
LWF2ZW5nZXI5Ni5kdHMgfCAzMjQKPj4+PiArKysrKysrKysrKysrKysrKystLQo+Pj4+IMKgwqAg
MiBmaWxlcyBjaGFuZ2VkLCA1NzIgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCj4+Pj4K
Pj4+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBzdC5jb20+Cj4+Pj4g
Q2M6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5v
cmc+Cj4+Pj4gQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4K
Pj4+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPgo+Pj4+IENj
OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4KPj4+PiBDYzogbGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+Pj4+IFRvOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+Pgo+Pj4KPj4+IFNlcmllcyBhcHBsaWVkIG9u
IHN0bTMyLW5leHQuCj4+Cj4+IFRoYW5rcy4gSSBzZW50IG91dCB0aGUgcmVzdCwgd2hpY2ggc2hv
dWxkIGJlIHZlcnkgbXVjaCBhbGwgdGhlcmUgaXMgZm9yCj4+IG5vdyA6KSA+Cj4gCj4gSSBob3Bl
IDopLiBJIGhhZCBhIGxvb2sgb24gaXQgYW5kIGl0IHNvdW5kcyBnb29kLiBJJ2xsIG1lcmdlIGl0
IG5leHQgd2Vlay4KCk5pY2UsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
