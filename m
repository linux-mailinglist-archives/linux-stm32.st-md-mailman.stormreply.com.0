Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677128FE2C
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Oct 2020 08:19:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FE51C3FADE;
	Fri, 16 Oct 2020 06:19:44 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84345C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Oct 2020 06:19:42 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kTJ5Z-0006Um-H1; Fri, 16 Oct 2020 08:19:41 +0200
To: Alexandre Torgue <alexandre.torgue@st.com>, Marek Vasut <marex@denx.de>,
 Yann GAUTIER <yann.gautier@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20201009210820.243659-1-marex@denx.de>
 <f842dd08-77d0-fd5b-63fd-26762a54be5e@st.com>
 <a28a3842-0fcf-458e-ef26-aeffed035b32@pengutronix.de>
 <a1f1138e-444d-5e3b-4e1a-614a3fc1981e@denx.de>
 <33b2ff3f-3809-46db-a989-c7517d6e8369@pengutronix.de>
 <11b92f1e-fda0-e98a-8db7-f53004f2404d@denx.de>
 <e95247bd-7b1d-b44c-4a9e-c9951f37e6cf@pengutronix.de>
 <0f815500-9ff3-da51-42b2-7a262d57f510@st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <3c77bddb-362e-37e4-eef0-85239df98906@pengutronix.de>
Date: Fri, 16 Oct 2020 08:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <0f815500-9ff3-da51-42b2-7a262d57f510@st.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: hardware@linux-automation.com, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Consistently enable
 internal pull-ups for SD bus
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

SGVsbG8gQWxleCwKCk9uIDEwLzE1LzIwIDU6NTEgUE0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6
Cj4gT24gMTAvMTUvMjAgMzo0NyBQTSwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+PiBmaXhlZCB1cCwg
bm90IGZpeGVkLiBJIGRvbid0IGtub3cgaWYgU1QgaXMgZmluZSB3aXRoIHRoZSBjaGFuZ2VzLCBm
b3IKPj4gdGhlIE1DLTEsIHBsZWFzZSBkbzoKPj4KPj4gLS0tLS0tLS0tLS0tLS0gODwgLS0tLS0t
LS0tLS0tLQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtbHhh
LW1jMS5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1seGEtbWMxLmR0cwo+PiBp
bmRleCA1NzAwZTZiNzAwZDMuLjcxMzQ0NjYyNTZiMyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJtcDE1N2MtbHhhLW1jMS5kdHMKPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1N2MtbHhhLW1jMS5kdHMKPj4gQEAgLTIwOCw2ICsyMDgsMTQgQEAgcGluczIg
ewo+PiDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+IMKgIH07Cj4+Cj4+ICsmc2RtbWMyX2Q0N19waW5z
X2Igewo+PiArwqDCoMKgwqDCoMKgIC8qIGJvYXJkIGFscmVhZHkgaGFzIGV4dGVybmFsIDQ3SyBw
dWxsLXVwcyAqLwo+PiArCj4+ICvCoMKgwqDCoMKgwqAgcGlucyB7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC9kZWxldGUtcHJvcGVydHkvIGJpYXMtcHVsbC11cDsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmlhcy1kaXNhYmxlOwo+PiArwqDCoMKgwqDCoMKgIH07
Cj4+ICt9Owo+PiArCj4gCj4gVGhpcyBwcm9wb3NpdGlvbiByZW1pbmQgbWUgYW4gb2xkIGRpc2N1
c3Npb24gd2UgZ290IHdpdGggTWFyZWsgYWJvdXQgIndoZXJlIHBpbiBkZWZpbml0aW9ucyBoYXMg
dG8gYmUgZG9uZSA/Ii4gTXkgYXBwcm9hY2ggaXMgdG8gbm90IGRlZmluZSBwaW5zIGdyb3VwcyBp
bnNpZGUgYm9hcmQgZHRzIGZpbGUgbWFpbmx5IGJlY2F1c2UgcGlubXV4IGlzIGEgU29DIGNvbmZp
Z3VyYXRpb24gYW5kIGEgYm9hcmQgb25seSB1c2Ugb25lIG9mIHRob3NlIGNvbmZpZ3VyYXRpb25z
IGJsYWJsYWJsYSA6KS4gQnV0IGNvdW50ZXItYXJndW1lbnQgaXMgdGhhdCBwdWxsLXVwL3B1bGwt
ZG93biwgT3Blbi1kcmFpbiBwdXNoLXB1bGwgc2V0dGluZ3MgYXJlICJkcml2ZW4iIGJ5IHRoZSBi
b2FyZCBjb25maWd1cmF0aW9uIGFuZCBJIGFncmVlLgoKV2UgY2FuIHNwbGl0IHBpbm11eCBhd2F5
IGZyb20gcGluY29uZiBhbmQgc3RpbGwgaGF2ZSBhIGhlYWRlciB0byBiZSBpbmNsdWRlZCBldmVy
eXdoZXJlCmZvciBwaW4gbXV4aW5nIGxpa2UgdGhlIGkuTVggaXMgZG9pbmcsIGUuZy4KCi8qIHN0
bTMybXAxNS1waW5tdXguaCAqLwojZGVmaW5lIFNUTTMyTVAxNV9QQzhfX1NETU1DMV9EMAk8U1RN
MzJfUElOTVVYKCdDJywgIDgsIEFGMTIpPgojZGVmaW5lIFNUTTMyTVAxNV9QQzlfX1NETU1DMV9E
MQk8U1RNMzJfUElOTVVYKCdDJywgIDksIEFGMTIpPgojZGVmaW5lIFNUTTMyTVAxNV9QQzEwX19T
RE1NQzFfRDIJPFNUTTMyX1BJTk1VWCgnQycsIDEwLCBBRjEyKT4KI2RlZmluZSBTVE0zMk1QMTVf
UEMxMV9fU0RNTUMxX0QzCTxTVE0zMl9QSU5NVVgoJ0MnLCAxMSwgQUYxMik+CgpUaGUgcy9zdG0z
Mm1wMTUtcGluY3RybC5kdHNpL3N0bTMybXAxNS1waW5jb25mLmR0c2kvIGNhbiBiZSBtYWRlIHRv
IHVzZSBpdCBhbmQgZGVmaW5lCnRoZSBwaW4gY29uZmlndXJhdGlvbnMgdGhhdCBhcmUgaW4gdXNl
IG9uIHRoZSBTVCBib2FyZHMgYW5kIHRoYXQgbW9zdCBvZiB0aGUgYm9hcmRzIHdpbGwKcHJvYmFi
bHkgY29weSBvZmYuCgpCb2FyZHMgRFRTIGNhbiB0aGVuIHBpY2sgYW5kIGNob29zZSB3aGljaCBw
aW5jdHJsIGdyb3VwcyB0byB0YWtlIGZyb20gdGhlIFNUIG9uZS4KSWYgdGhleSBoYXZlIGN1c3Rv
bSBuZWVkcyB0aGV5IGp1c3QgZGVmaW5lIHRoZWlyIG93biBncm91cHMgaW5saW5lCihJIGtub3cg
SSByZXBlYXQgbXlzZWxmLCBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVs
LzMxMGFhM2EzLTA5Y2UtNDJlZi1kMWVhLWI2NTMxNjNkMWQ3MkBwZW5ndXRyb25peC5kZS8pCgpD
aGVlcnMKQWhtYWQKCj4gCj4gV2UgYXJlIGV4YWN0bHkgaW4gdGhpcyBjYXNlIGhlcmUgYnV0IGJl
Zm9yZSB0byByZXdvcmsgYWxsIFNUTTMyIERUIHRvIHNwbGl0IHBpbiBjb25maWcgSSBwcm9wb3Nl
IHRvIGtlZXAgd2hhdCB3ZSBoYXZlIHRvZGF5LCBhbmQgdG8gZW5hYmxlIGJpYXMtcHVsbC11cCwg
KG9yIG90aGVyIHNldHRpbmdzKSBpbiBib2FyZHMgdGhhdCBuZWVkIGl0Lgo+IAo+IE1hcmVrLCB3
aGF0J3MgeW91ciBmZWVsaW5nID8KPiAKPiBjaGVlcnMKPiBhbGV4Cj4gCj4gCj4gCj4+IMKgICZz
ZG1tYzIgewo+PiDCoMKgwqDCoMKgwqDCoMKgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJv
cGVuZHJhaW4iLCAic2xlZXAiOwo+PiDCoMKgwqDCoMKgwqDCoMKgIHBpbmN0cmwtMCA9IDwmc2Rt
bWMyX2I0X3BpbnNfYSAmc2RtbWMyX2Q0N19waW5zX2I+Owo+Pgo+Pgo+IAoKLS0gClBlbmd1dHJv
bml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ClN0ZXVlcndhbGRlciBTdHIuIDIxICAgICAgICAgICAgICAgICAgICAgICB8IGh0
dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8CjMxMTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkgICAg
ICAgICAgICAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMCAgICB8CkFtdHNnZXJpY2h0
IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZheDogICArNDktNTEyMS0yMDY5MTct
NTU1NSB8Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
