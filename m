Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A661BBF9A
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2020 15:32:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 061E0C36B0C;
	Tue, 28 Apr 2020 13:32:41 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBABEC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 13:32:39 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49BMyb0TKBz1rtjS;
 Tue, 28 Apr 2020 15:32:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49BMyZ6gg6z1r5Qr;
 Tue, 28 Apr 2020 15:32:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 1frWq9u4x19S; Tue, 28 Apr 2020 15:32:37 +0200 (CEST)
X-Auth-Info: UwKrY0jhwEv3BwC6Vlh9e3Z5uQcfSHq/P5I0xuctbos=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 28 Apr 2020 15:32:37 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200422104613.96944-1-marex@denx.de>
 <222f356a-2f4a-47d7-9e4f-e80b6a3f32b0@st.com>
 <daf1bcdc-29a6-db60-cd60-3521aca2ce9b@denx.de>
Message-ID: <49762c79-a374-92a2-975e-afe7a4e7eb3c@denx.de>
Date: Tue, 28 Apr 2020 15:32:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <daf1bcdc-29a6-db60-cd60-3521aca2ce9b@denx.de>
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

T24gNC8yMy8yMCA0OjA0IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA0LzIzLzIwIDM6MzYg
UE0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4+IEtpIE1hcmVrCj4gCj4gSGksCgpIZWxsbyBh
Z2FpbiwKCj4+IE9uIDQvMjIvMjAgMTI6NDUgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gVGhl
IEFWOTYgYm9hcmQgZGV2aWNlIHRyZWUgaXMgY29tcGxldGVseSBicm9rZW4gYW5kIGRvZXMgbm90
IG1hdGNoIHRoZQo+Pj4gaGFyZHdhcmUuIFRoaXMgc2VyaWVzIGZpeGVzIGl0IHVwLgo+Pj4KPj4+
IE1hcmVrIFZhc3V0ICgyMCk6Cj4+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogUmVwYWlyIFBNSUMg
Y29uZmlndXJhdGlvbiBvbiBBVjk2Cj4+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogUmVwYWlyIFBN
SUMgaW50ZXJydXB0IG9uIEFWOTYKPj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJu
YXRlIHBpbm11eCBmb3IgZXRoZXJuZXQgUkdNSUkKPj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBS
ZXBhaXIgZXRoZXJuZXQgb3BlcmF0aW9uIG9uIEFWOTYKPj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMy
OiBBZGQgbWlzc2luZyBldGhlcm5ldCBQSFkgcmVzZXQgb24gQVY5Ngo+Pj4gwqDCoCBBUk06IGR0
czogc3RtMzI6IEFkZCBtaXNzaW5nIGV0aGVybmV0IFBIWSBza2V3cyBvbiBBVjk2Cj4+PiDCoMKg
IEFSTTogZHRzOiBzdG0zMjogQWRkIGFsdGVybmF0ZSBwaW5tdXggZm9yIFNETU1DIHBpbnMKPj4+
IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBSZXBhaXIgU0RNTUMxIG9wZXJhdGlvbiBvbiBBVjk2Cj4+
PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGVNTUMgYXR0YWNoZWQgdG8gU0RNTUMyIG9uIEFW
OTYKPj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgUVNQSSBOT1Igb24gQVY5Ngo+Pj4gwqDC
oCBBUk06IGR0czogc3RtMzI6IEFkZCBjb25maWd1cmF0aW9uIEVFUFJPTSBvbiBBVjk2Cj4+PiDC
oMKgIEFSTTogZHRzOiBzdG0zMjogRW5hYmxlIFdpRmkgb24gQVY5Ngo+Pj4gwqDCoCBBUk06IGR0
czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBVU0FSVDIgcGlucwo+Pj4gwqDCoCBB
Uk06IGR0czogc3RtMzI6IEVuYWJsZSBCbHVldG9vdGggb24gQVY5Ngo+Pj4gwqDCoCBBUk06IGR0
czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBMVERDIHBpbnMKPj4+IMKgwqAgQVJN
OiBkdHM6IHN0bTMyOiBBZGQgYmluZGluZ3MgZm9yIEhETUkgdmlkZW8gb24gQVY5Ngo+Pj4gwqDC
oCBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBTQUkyIHBpbnMKPj4+
IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYmluZGluZ3MgZm9yIGF1ZGlvIG9uIEFWOTYKPj4+
IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYmluZGluZ3MgZm9yIFVTQiBvbiBBVjk2Cj4+PiDC
oMKgIEFSTTogZHRzOiBzdG0zMjogUmVuYW1lIExFRHMgdG8gbWF0Y2ggc2lsa3NjcmVlbiBvbiBB
Vjk2Cj4+Pgo+Pj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1LXBpbmN0cmwuZHRzacKg
wqDCoCB8IDI4MCArKysrKysrKysrKysrKysrKwo+Pj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDE1N2EtYXZlbmdlcjk2LmR0cyB8IDMyNCArKysrKysrKysrKysrKysrKystLQo+Pj4gwqAg
MiBmaWxlcyBjaGFuZ2VkLCA1NzIgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCj4+Pgo+
Pj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPgo+Pj4gQ2M6
IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+
Cj4+PiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+Pj4g
Q2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4KPj4+IENjOiBQYXRy
aWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4KPj4+IENjOiBsaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+PiBUbzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCj4+Pgo+Pgo+PiBTZXJpZXMgbG9va3MgZ29vZCB0byBtZS4gSSds
bCBtZXJnZSBpdCBmb3IgbXkgbmV4dCBQci4KPj4gSnVzdCBvbmUgcXVlc3Rpb24sIEFyZSB3ZSBz
dGlsbCBhYmxlIHRvIGJvb3Qgb2xkZXIgYm9hcmQgcmV2aXNpb24KPj4gKHByb3RvdHlwZSBvbmVz
KT8KPiAKPiBJIGRvbid0IGhhdmUgb25lLCBidXQgaWYgd2Ugd2FudCB0byBzdXBwb3J0IHRoZSBw
cm90b3R5cGVzLCB3ZSB3aWxsIG5lZWQKPiBhIHNlcGFyYXRlIERUIGZvciB0aGF0IChvciBhIGZl
dyBEVFNpIHRvIGhhbmRsZSB0aGUgSFcgZGlmZmVyZW5jZXMpLgoKSSBnb3QgdGhlIDU4OC0xMDAg
cHJvdG90eXBlIHRvbyBub3csIGFuZCBJIGhhdmUgbW9yZSBwYXRjaGVzIHdoaWNoIEkKd291bGQg
bGlrZSB0byBzdGFydCB1cHN0cmVhbWluZyBvbiB0b3Agb2YgdGhpcyBzZXJpZXMgKGxpa2Ugc3Bs
aXQgdGhlClNvTSBEVCBmcm9tIHRoZSBib2FyZCBEVCksIGNhbiB0aGVzZSBiZSBhcHBsaWVkIHNv
IEkgY2FuIHN0YXJ0IHNlbmRpbmcKdGhlIHJlc3Q/Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
