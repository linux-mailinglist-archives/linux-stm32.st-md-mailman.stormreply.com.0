Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47521175F73
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Mar 2020 17:22:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00563C36B0B;
	Mon,  2 Mar 2020 16:22:37 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D59FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 16:22:33 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48WQQw4np3z1rq9j;
 Mon,  2 Mar 2020 17:22:32 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48WQQw43zXz1qqlF;
 Mon,  2 Mar 2020 17:22:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id FUkd_oEz5BAG; Mon,  2 Mar 2020 17:22:31 +0100 (CET)
X-Auth-Info: /mgSVaOtHHN+ArB4hRwgEFDX1yr8DchUgbmZ1sPbr4M=
Received: from [127.0.0.1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  2 Mar 2020 17:22:31 +0100 (CET)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200119191143.50033-1-marex@denx.de>
 <20200119191143.50033-6-marex@denx.de>
 <1b288811-8ffb-a150-71ef-4c006e6d5740@st.com>
 <1ec643e9-217d-c83d-793f-c05d6c4502bd@denx.de>
 <46e68418-21c0-b82c-d226-4f5ada0ef351@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <07b15b36-6e68-47db-b2b3-e1e29a3b0399@denx.de>
Date: Mon, 2 Mar 2020 17:22:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <46e68418-21c0-b82c-d226-4f5ada0ef351@st.com>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 6/6] ARM: dts: stm32: Add DH
 Electronics DHCOM STM32MP1 SoM and PDK2 board
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

T24gMy8yLzIwIDI6NDcgUE0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4gSGkgTWFyZWsKPiAK
PiBPbiAyLzIzLzIwIDM6MzcgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiAyLzEwLzIwIDU6
MzUgUE0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4+PiBIaSBNYXJlawo+Pgo+PiBIaSwKPj4K
Pj4+IE9uIDEvMTkvMjAgODoxMSBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+Pj4gQWRkIHN1cHBv
cnQgZm9yIERIIEVsZWN0cm9uaWNzIERIQ09NIFNvTSBhbmQgUERLMiByZXYuIDQwMCBjYXJyaWVy
Cj4+Pj4gYm9hcmQuIFRoaXMgaXMgYW4gU29NIHdpdGggU1RNMzJNUDE1N0MgYW5kIGFuIGV2YWx1
YXRpb24ga2l0LiBUaGUKPj4+PiBiYXNlYm9hcmQgcHJvdmlkZXMgRXRoZXJuZXQsIFVBUlQsIFVT
QiwgQ0FOIGFuZCBvcHRpb25hbCBkaXNwbGF5Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTWFy
ZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+Pj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhh
bmRyZS50b3JndWVAc3QuY29tPgo+Pj4+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5z
dG0zMkBnbWFpbC5jb20+Cj4+Pj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QHN0LmNvbT4KPj4+PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5j
b20+Cj4+Pj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4+
PiBUbzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4gLS0tCj4+Pj4g
VjI6IC0gQWRkIHN0bTMybXAxIGludG8gdGhlIHN1YmplY3QgYW5kIGNvbW1pdCBtZXNzYWdlCj4+
Pj4gwqDCoMKgwqDCoCAtIFNvcnQgRFQgYWxwaGFudW1lcmljYWxseQo+Pj4+IMKgwqDCoMKgwqAg
LSBNb3ZlIGFsbCBwaW5jb250cm9sIGVudHJpZXMgaW50byBzdG0zMm1wMTUtcGluY3RybC5kdHNp
Cj4+Pj4gLS0tCj4+Pgo+Pj4gVGhhbmtzIHRvIGFkZCBhIG5ldyBTVE0zMiBib2FyZC4KPj4+Cj4+
PiBTZXJpZXMgYXBwbGllZCBvbiBzdG0zMi1uZXh0Lgo+Pgo+PiBIb3cgY29tZSB0aGVzZSBhcmUg
bm90IGluIG5leHQvbWFzdGVyIHlldCwgaXMgdGhlIGJyYW5jaCBub3QgYmVpbmcKPj4gbWVyZ2Vk
IGludG8gbmV4dCByZWd1bGFybHkgPwo+Pgo+IAo+IE5vIHRoaXMgYnJhbmNoIGlzIG5vdCBtZXJn
ZWQgcmVndWxhcmx5IGluIG5leHQvbWFzdGVyLiBZb3UnbGwgZ2V0IGl0IGluCj4gNS43LXJjMS4K
CkNhbiB3ZSBpbXByb3ZlIG9uIHRoYXQgPyAoYW5kIHRodXMgaW1wcm92ZSBvbiB0ZXN0aW5nKSA/
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
