Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F033373AD
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 14:23:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E70AC5718B;
	Thu, 11 Mar 2021 13:23:18 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42761C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 13:23:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Dx8lR0Tzqz1rxM2;
 Thu, 11 Mar 2021 14:23:15 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Dx8lQ5SnGz1qr4q;
 Thu, 11 Mar 2021 14:23:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id vqhgIlzpzvH2; Thu, 11 Mar 2021 14:23:12 +0100 (CET)
X-Auth-Info: vaM/MyCctl1jnKfAoeQi+iHMyd++jHdcGuu7CUSTTKQ=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 11 Mar 2021 14:23:12 +0100 (CET)
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, "Alex G."
 <mr.nuke.me@gmail.com>,
 Gabriel FERNANDEZ - foss <gabriel.fernandez@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Etienne CARRIERE <etienne.carriere@st.com>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <2e04f814-b694-119d-fe8a-13e6df129536@gmail.com>
 <AS8PR10MB4712C27260707345FA99ED5AEE909@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
 <c57775fe-41ef-07f5-56a2-04b8f70797c1@denx.de>
 <ac98b89f-9664-b89c-c12c-24c1cbd29b00@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <838b70a1-c02c-0433-ac3d-fc48874b132d@denx.de>
Date: Thu, 11 Mar 2021 14:23:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ac98b89f-9664-b89c-c12c-24c1cbd29b00@foss.st.com>
Content-Language: en-US
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/14] Introduce STM32MP1 RCC in
	secured mode
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

T24gMy8xMS8yMSAyOjE1IFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IEhpIE1hcmVrCgpI
ZWxsbyBBbGV4YW5kcmUsCgo+IE9uIDMvMTEvMjEgMTI6NDMgUE0sIE1hcmVrIFZhc3V0IHdyb3Rl
Ogo+PiBPbiAzLzExLzIxIDk6MDggQU0sIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4+PiBIaSBB
TGV4Cj4+Cj4+IEhlbGxvIGV2ZXJ5b25lLAo+Pgo+PiBbLi4uXQo+Pgo+Pj4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMDAvMTRdIEludHJvZHVjZSBTVE0zMk1QMSBSQ0MgaW4gc2VjdXJlZCBtb2Rl
Cj4+Pj4KPj4+PiBPbiAxLzI2LzIxIDM6MDEgQU0sIGdhYnJpZWwuZmVybmFuZGV6QGZvc3Muc3Qu
Y29tIHdyb3RlOgo+Pj4+PiBGcm9tOiBHYWJyaWVsIEZlcm5hbmRleiA8Z2FicmllbC5mZXJuYW5k
ZXpAZm9zcy5zdC5jb20+Cj4+Pj4+Cj4+Pj4+IFBsYXRmb3JtIFNUTTMyTVAxIGNhbiBiZSB1c2Vk
IGluIGNvbmZpZ3VyYXRpb24gd2hlcmUgc29tZSBjbG9ja3MgYW5kCj4+Pj4+IElQIHJlc2V0cyBj
YW4gcmVsYXRlIGFzIHNlY3VyZSByZXNvdXJjZXMuCj4+Pj4+IFRoZXNlIHJlc291cmNlcyBhcmUg
bW92ZWQgZnJvbSBhIFJDQyBjbG9jay9yZXNldCBoYW5kbGUgdG8gYSBTQ01JCj4+Pj4+IGNsb2Nr
L3Jlc2V0X2RvbWFpbiBoYW5kbGUuCj4+Pj4+Cj4+Pj4+IFRoZSBSQ0MgY2xvY2sgZHJpdmVyIGlz
IG5vdyBkZXBlbmRlbnQgb2YgdGhlIFNDTUkgZHJpdmVyLCB0aGVuIHdlIGhhdmUKPj4+Pj4gdG8g
bWFuYWdlIG5vdyB0aGUgcHJvYmUgZGVmZXJpbmcuCj4+Pj4+Cj4+Pj4+IHYxIC0+IHYyOgo+Pj4+
PiDCoMKgwqAgLSBmaXggeWFtbGxpbnQgd2FybmluZ3MuCj4+Pj4KPj4+PiBIaSBHYWJyaWVsLAo+
Pj4+Cj4+Pj4gSSBkb24ndCBoYXZlIG11Y2ggY2xvdXQgd2l0aCB0aGUgbWFpbnRhaW5lcnMsIGJ1
dCBJIGhhdmUgdG8gTkFLIHRoaXMgCj4+Pj4gc2VyaWVzCj4+Pj4gYWZ0ZXIgZmluZGluZyBtYWpv
ciBicmVha2FnZS4KPj4+Pgo+Pj4+IFRoZSBwcm9ibGVtIHdpdGggc2VyaWVzIGlzIHRoYXQgaXQg
YnJlYWtzIHByZXR0eSBtdWNoIGV2ZXJ5IGJvYXJkIGl0IAo+Pj4+IHRvdWNoZXMuCj4+Pj4gSSBo
YXZlIGEgREsyIGhlcmUgdGhhdCBJJ20gdXNpbmcgZm9yIGRldmVsb3BtZW50LCB3aGljaCBubyBs
b25nZXIgCj4+Pj4gYm9vdHMgd2l0aAo+Pj4+IHRoaXMgc2VyaWVzIGFwcGxpZWQuCj4+Pj4KPj4+
PiBUaGUgY3J1eCBvZiB0aGUgbWF0dGVyIGlzIHRoYXQgdGhpcyBzZXJpZXMgYXNzdW1lcyBhbGwg
Ym9hcmRzIHdpbGwgCj4+Pj4gYm9vdCB3aXRoIGFuCj4+Pj4gRlNCTCB0aGF0IGltcGxlbWVudHMg
YSB2ZXJ5IHNwZWNpZmljIFNDTUkgY2xvY2sgdHJlZS4gVGhpcyBpcyBtYWpvciBBQkkKPj4+PiBi
cmVha2FnZSBmb3IgYW55b25lIG5vdCB1c2luZyBURi1BIGFzIHRoZSBmaXJzdCBzdGFnZSBib290
bG9hZGVyLiAKPj4+PiBBbnlvbmUKPj4+PiB1c2luZyB1LWJvb3QgU1BMIGlzIHNjcmV3ZWQuCj4+
Pj4KPj4+PiBUaGlzIHNlcmllcyBpbXBvc2VzIGEgU09DLXdpZGUgY2hhbmdlIHZpYSB0aGUgZHRz
aSBmaWxlcy4gU28gZXZlbiAKPj4+PiBib2FyZHMgdGhhdAo+Pj4+IHlvdSBkb24ndCBpbnRlbmQg
dG8gY29udmVydCB0byBTQ01JIHdpbGwgZ2V0IGJyb2tlbiB0aGlzIHdheS4KPj4+PiBBZGRpbmcg
YSAtbm8tc2NtaSBmaWxlIHRoYXQgaXNuJ3QgdXNlZCBhbnl3aGVyZSBkb2Vzbid0IGhlbHAgdGhp
bmdzLgo+Pj4KPj4+IFlvdSBhcmUgcmlnaHQuIFdlIG1haW5seSB0YWtlIGNhcmUgYWJvdXQgTk8g
U1QgKERILy4uLikgYm9hcmRzLCBidXQgCj4+PiBub3QgcmVhbGx5IGFib3V0IGN1cnJlbnQgdXNh
Z2UKPj4+IE9mIG91ciBzdG0zMiBib2FyZHMuIFNldmVyYWwgb3B0aW9ucyBleGlzdDoKPj4KPj4g
U2luY2UgYSBsb3Qgb2YgcGVvcGxlIGJlbmVmaXQgZnJvbSB0aGUgZ29vZCB1cHN0cmVhbSBzdXBw
b3J0IGZvciB0aGUgCj4+IE1QMSBfYW5kXyBrZWVwIHVwZGF0aW5nIHRoZWlyIG1hY2hpbmVzIHRv
IGdldCB0aGUgbGF0ZXN0IGZpeGVzLCBpdCBpcyAKPj4gdmVyeSBpbXBvcnRhbnQgdG8ga2VlcCB0
aGUgY3VycmVudCB1c2FnZSB3b3JraW5nLgo+Pgo+Pj4gMS0gQnJlYWsgdGhlIGN1cnJlbnQgQUJJ
OiBhcyBzb29uIGFzIHRob3NlIHBhdGNoZXMgYXJlIG1lcmdlZCwgCj4+PiBzdG0zMm1wMTU3Yy1k
azIuZHRiIHdpbGwgaW1wb3NlIHRvIHVzZQo+Pj4gQSB0Zi1hIGZvciBzY21pIGNsb2Nrcy4gRm9y
IHBlb3BsZSB1c2luZyB1LWJvb3Qgc3BsLCB0aGUgd2lsbCBoYXZlIHRvIAo+Pj4gY3JlYXRlIHRo
ZWlyIG93biAibm8tc2VjdXJlIiBkZXZpY2V0cmVlLgo+Pgo+PiBOQUssIHRoaXMgYnJlYWtzIGV4
aXN0aW5nIGJvYXJkcyBhbmQgZXhpc3Rpbmcgc2V0dXBzLCBlLmcuIERLMiB0aGF0IAo+PiBkb2Vz
IG5vdCB1c2UgQVRGLiA+Cj4+PiAyLUFzIHlvdSBzdWdnZXN0LCBjcmVhdGUgYSBuZXcgInNlY3Vy
ZSIgZHRiIHBlciBib2FyZHMgKE5vdCBteSB3aXNoIAo+Pj4gZm9yIG1haW50ZW5hbmNlIHBlcnNw
ZWN0aXZlcykuCj4+Cj4+IEkgYWdyZWUgd2l0aCBBbGV4IChHKSB0aGF0IHRoZSAic2VjdXJlIiBv
cHRpb24gc2hvdWxkIGJlIG9wdC1pbi4KPj4gVGhhdCB3YXkgZXhpc3Rpbmcgc2V0dXBzIHJlbWFp
biB3b3JraW5nIGFuZCBubyBleHRyYSByZXF1aXJlbWVudHMgYXJlIAo+PiBpbXBvc2VkIG9uIE1Q
MSB1c2Vycy4gRXNwLiBzaW5jZSBhcyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoaXMsIHRoZSAKPj4g
InNlY3VyZSIgcGFydCBpc24ndCByZWFsbHkgYWJvdXQgc2VjdXJpdHksIGJ1dCByYXRoZXIgYWJv
dXQgbW92aW5nIAo+PiBjbG9jayBjb25maWd1cmF0aW9uIGZyb20gTGludXggdG8gc29tZSBmaXJt
d2FyZSBibG9iLgo+Pgo+Pj4gMy0gS2VlcCBrZXJuZWwgZGV2aWNlIHRyZWUgYXMgdGhleSBhcmUg
YW5kIGFwcGxpZWQgdGhpcyBzZWN1cmUgbGF5ZXIgCj4+PiAoc2NtaSBjbG9ja3MgcGhhbmRsZSkg
dGhhbmtzIHRvIGR0Ym8gaW4KPj4+IFUtYm9vdC4KPj4KPj4gSXMgdGhpcyByZWFsbHkgYmV0dGVy
IHRoYW4KPj4gI2luY2x1ZGUgInN0bTMybXAxNXh4LWVuYWJsZS1zZWN1cmUtc3R1ZmYuZHRzaSIK
Pj4gaW4gYSBib2FyZCBEVCA/IEJlY2F1c2UgdGhhdCBpcyBob3cgSSBpbWFnaW5lIHRoZSBvcHQt
aW4gInNlY3VyZSIgCj4+IG9wdGlvbiBjb3VsZCB3b3JrLgo+IAo+IFRoZSBkdGJvIHVzYWdlIGNv
dWxkIGF2b2lkIHRvIGFkZCBhbm90aGVyIHN0IGJvYXJkIChhY3R1YWxseSBhIHNlY3VyZSAKPiBj
b25maWcpIGluIGFyY2gvYXJtL2Jvb3QvZHRzLgoKSXQgaXNuJ3QgZXZlbiBhIGJvYXJkLCBpdCBp
cyBhIGNvbmZpZ3VyYXRpb24uIENvdWxkIHlvdSBkZXRlY3QgdGhpcyAKc2VjdXJlL25vbi1zZWN1
cmUgc3RhdGUgYXQgcnVudGltZSwgaGF2ZSBib3RoIGNsb2NrIG9wdGlvbnMgaW4gdGhlIERULCAK
YW5kIGhhbmRsZSBpdCBhY2NvcmRpbmdseSA/IFRoYXQgbWlnaHQgYmUgZXZlbiBiZXR0ZXIgb3B0
aW9uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
