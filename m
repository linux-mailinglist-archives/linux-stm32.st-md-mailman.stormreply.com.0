Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C695A16EDAC
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2020 19:15:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 754BDC36B0B;
	Tue, 25 Feb 2020 18:15:41 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B107C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2020 18:15:40 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48RnDC0GFRz1rnJD;
 Tue, 25 Feb 2020 19:15:39 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48RnDB6d0Cz1qx0G;
 Tue, 25 Feb 2020 19:15:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 6zuKGk_WylJD; Tue, 25 Feb 2020 19:15:36 +0100 (CET)
X-Auth-Info: 0IT4touvBjLmexdqSPYTkmvc17BwmPthOHw0G0rfafg=
Received: from [127.0.0.1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 25 Feb 2020 19:15:36 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20200119191143.50033-1-marex@denx.de>
 <20200119191143.50033-6-marex@denx.de>
 <1b288811-8ffb-a150-71ef-4c006e6d5740@st.com>
 <1ec643e9-217d-c83d-793f-c05d6c4502bd@denx.de>
 <5efd7978050e48d783d10c989b5e78f5@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <2f38781f-cf13-fa25-5585-c22d088d0a03@denx.de>
Date: Tue, 25 Feb 2020 18:56:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <5efd7978050e48d783d10c989b5e78f5@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
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

T24gMi8yNC8yMCA5OjM1IEFNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpIE1hcmVrLAoK
SGksCgo+PiBGcm9tOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4gU2VudDogZGltYW5j
aGUgMjMgZsOpdnJpZXIgMjAyMCAxNTozOAo+Pgo+PiBPbiAyLzEwLzIwIDU6MzUgUE0sIEFsZXhh
bmRyZSBUb3JndWUgd3JvdGU6Cj4+PiBIaSBNYXJlawo+Pgo+PiBIaSwKPj4KPj4+IE9uIDEvMTkv
MjAgODoxMSBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+Pj4gQWRkIHN1cHBvcnQgZm9yIERIIEVs
ZWN0cm9uaWNzIERIQ09NIFNvTSBhbmQgUERLMiByZXYuIDQwMCBjYXJyaWVyCj4+Pj4gYm9hcmQu
IFRoaXMgaXMgYW4gU29NIHdpdGggU1RNMzJNUDE1N0MgYW5kIGFuIGV2YWx1YXRpb24ga2l0LiBU
aGUKPj4+PiBiYXNlYm9hcmQgcHJvdmlkZXMgRXRoZXJuZXQsIFVBUlQsIFVTQiwgQ0FOIGFuZCBv
cHRpb25hbCBkaXNwbGF5Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+Cj4+Pj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVA
c3QuY29tPgo+Pj4+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5j
b20+Cj4+Pj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4KPj4+
PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+Cj4+Pj4gQ2M6
IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4+PiBUbzogbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4gLS0tCj4+Pj4gVjI6IC0gQWRkIHN0
bTMybXAxIGludG8gdGhlIHN1YmplY3QgYW5kIGNvbW1pdCBtZXNzYWdlCj4+Pj4gwqDCoMKgwqAg
LSBTb3J0IERUIGFscGhhbnVtZXJpY2FsbHkKPj4+PiDCoMKgwqDCoCAtIE1vdmUgYWxsIHBpbmNv
bnRyb2wgZW50cmllcyBpbnRvIHN0bTMybXAxNS1waW5jdHJsLmR0c2kKPj4+PiAtLS0KPj4+Cj4+
PiBUaGFua3MgdG8gYWRkIGEgbmV3IFNUTTMyIGJvYXJkLgo+Pj4KPj4+IFNlcmllcyBhcHBsaWVk
IG9uIHN0bTMyLW5leHQuCj4+Cj4+IEhvdyBjb21lIHRoZXNlIGFyZSBub3QgaW4gbmV4dC9tYXN0
ZXIgeWV0LCBpcyB0aGUgYnJhbmNoIG5vdCBiZWluZyBtZXJnZWQgaW50bwo+PiBuZXh0IHJlZ3Vs
YXJseSA/Cj4gCj4gVGhpcyBhY2NlcHRlZCBwYXRjaCBpcyBhbHJlYWR5IGluIHN0bTMyLW1hc3Rl
ciwgaW5jbHVkZWQgaW4gbGFzdGVkIHB1bGwgcmVxdWVzdCB1LWJvb3Qtc3RtMzItMjAyMDAyMTQK
PiAKPiBTSEExID0gMTk5NTM3MzA5YmE1M2QyOTRjMzEyODMwNjRkNjNkYWZjOTk1ZmJlZAo+IAo+
IE1lcmdlZCBpbiB1LWJvb3QvbWFzdGVyIGp1c3RlIGFmdGVyIHYyMDIwLjA0LXJjMgoKVGhpcyBp
cyBhIExpbnV4IGtlcm5lbCBwYXRjaHNldCB0aG91Z2ggPwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
