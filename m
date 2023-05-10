Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5AA6FE2C4
	for <lists+linux-stm32@lfdr.de>; Wed, 10 May 2023 18:51:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8D74C69053;
	Wed, 10 May 2023 16:51:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E2C9C6904E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 May 2023 16:51:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AErisr015048; Wed, 10 May 2023 18:51:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1TPowHl9YS+9EwhC0HyGBvVFoLMVcbPAYARBloMLBAY=;
 b=SC2ubzgCSgC/4M1ZeLFYO3G0owJFVcxjajOAxj0Id+jvdLIv7sgC0V2z42ZREMTwvcs4
 1/13oP6o/eGqsj13KvjS+M9HaLEB8yL6q7qF4bCq14G9ASXBNFIvA4TDEdtXZZExH9XK
 /y8MW51ZA4llMauvEj/+ZvwhFwYCzQMreBj3ZQjzvnkOvtdFNFbftDFvrdA8/BnidB+b
 nNzgUgIKDDYo0u+7uoz1nxxI1lX5rx91Ofx6IEmGqouI22UW6+pNXok21iQ3HTFr4ml/
 jfcTjtabuPsa7onSDmu59B6tcJq7PLYGR5EiR1jnQ5A5e8lzOuxWY9KeESq9gDlGLCze lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qg90pjff2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 18:51:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23A4A10002A;
 Wed, 10 May 2023 18:51:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 174D522D183;
 Wed, 10 May 2023 18:51:13 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 10 May
 2023 18:51:12 +0200
Message-ID: <0e2453b9-cb7d-fdd9-2eb5-145972b23061@foss.st.com>
Date: Wed, 10 May 2023 18:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, <gabriel.fernandez@foss.st.com>
References: <20230407201526.1.I417093ddcea282be479f10a37147d1935a9050b7@changeid>
 <20230412151404.GA2372294-robh@kernel.org>
 <7884b0d8-199c-4415-4113-ddce4b640508@foss.st.com>
In-Reply-To: <7884b0d8-199c-4415-4113-ddce4b640508@foss.st.com>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rcc: stm32: Fix STM32MP13
	include file
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

Ck9uIDUvMTAvMjMgMTY6MjIsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4KPiBPbiA0
LzEyLzIzIDE3OjE0LCBSb2IgSGVycmluZyB3cm90ZToKPj4gT24gRnJpLCBBcHIgMDcsIDIwMjMg
YXQgMDg6MTU6MzNQTSArMDIwMCwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPj4+IE1pbm9yIGNv
c21ldGljIGNoYW5nZSwgYWxpZ25lZCB3aXRoIGZpbGVzIGluIFUtQm9vdDoKPj4+IC0gY2hhbmdl
IG9ic29sZXRlIFNQRFggaWQgOiBHUEwtMi4wKwo+Pj4gLSB1c2UgY29ycmVjdCBhZGRyZXNzIGdh
YnJpZWwuZmVybmFuZGV6QGZvc3Muc3QuY29tCj4+PiAtIHJlbW92ZSBleHRyYSBzcGFjZQo+PiBN
YWtlIHRoZSBzdWJqZWN0IHJlZmxlY3QgdGhlIHB1cnBvc2U6ICdTeW5jIHdpdGggdS1ib290IGNv
cHknCj4KPgo+IE9rCj4KPgo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8
cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4+IC0tLQo+Pj4KPj4+IMKgIGluY2x1ZGUv
ZHQtYmluZGluZ3MvY2xvY2svc3RtMzJtcDEzLWNsa3MuaMKgwqAgfCA2ICsrKy0tLQo+Pj4gwqAg
aW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9zdG0zMm1wMTMtcmVzZXRzLmggfCA0ICsrLS0KPj4+
IMKgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3N0bTMybXAxMy1jbGtz
LmggCj4+PiBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc3RtMzJtcDEzLWNsa3MuaAo+Pj4g
aW5kZXggMDJiZWZkMjVlZGNlLi5kYTRjYjc1Njc0MzAgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRl
L2R0LWJpbmRpbmdzL2Nsb2NrL3N0bTMybXAxMy1jbGtzLmgKPj4+ICsrKyBiL2luY2x1ZGUvZHQt
YmluZGluZ3MvY2xvY2svc3RtMzJtcDEzLWNsa3MuaAo+Pj4gQEAgLTEsNyArMSw3IEBACj4+PiAt
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArIG9yIEJTRC0zLUNsYXVzZSAqLwo+
Pj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyIG9yIEJTRC0z
LUNsYXVzZSAqLwo+Pj4gwqAgLyoKPj4+IMKgwqAgKiBDb3B5cmlnaHQgKEMpIFNUTWljcm9lbGVj
dHJvbmljcyAyMDIwIC0gQWxsIFJpZ2h0cyBSZXNlcnZlZAo+Pj4gLSAqIEF1dGhvcjogR2Ficmll
bCBGZXJuYW5kZXogPGdhYnJpZWwuZmVybmFuZGV6QHN0LmNvbT4gZm9yIAo+Pj4gU1RNaWNyb2Vs
ZWN0cm9uaWNzLgo+Pj4gKyAqIEF1dGhvcjogR2FicmllbCBGZXJuYW5kZXogPGdhYnJpZWwuZmVy
bmFuZGV6QGZvc3Muc3QuY29tPiBmb3IgCj4+PiBTVE1pY3JvZWxlY3Ryb25pY3MuCj4+PiDCoMKg
ICovCj4+PiDCoCDCoCAjaWZuZGVmIF9EVF9CSU5ESU5HU19TVE0zMk1QMTNfQ0xLU19IXwo+Pj4g
QEAgLTY0LDcgKzY0LDcgQEAKPj4+IMKgICNkZWZpbmUgQ0tfTUNPMcKgwqDCoMKgwqDCoMKgIDM4
Cj4+PiDCoCAjZGVmaW5lIENLX01DTzLCoMKgwqDCoMKgwqDCoCAzOQo+Pj4gwqAgLS8qwqAgSVAg
Y2xvY2tzICovCj4+PiArLyogSVAgY2xvY2tzICovCj4+PiDCoCAjZGVmaW5lIFNZU0NGR8KgwqDC
oMKgwqDCoMKgIDQwCj4+PiDCoCAjZGVmaW5lIFZSRUbCoMKgwqDCoMKgwqDCoCA0MQo+Pj4gwqAg
I2RlZmluZSBEVFPCoMKgwqDCoMKgwqDCoCA0Mgo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQt
YmluZGluZ3MvcmVzZXQvc3RtMzJtcDEzLXJlc2V0cy5oIAo+Pj4gYi9pbmNsdWRlL2R0LWJpbmRp
bmdzL3Jlc2V0L3N0bTMybXAxMy1yZXNldHMuaAo+Pj4gaW5kZXggOTM0ODY0ZTkwZGE2Li4xYjgz
YTAxZGU4ZjAgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L3N0bTMy
bXAxMy1yZXNldHMuaAo+Pj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9zdG0zMm1w
MTMtcmVzZXRzLmgKPj4+IEBAIC0xLDcgKzEsNyBAQAo+Pj4gLS8qIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wIG9yIEJTRC0zLUNsYXVzZSAqLwo+Pj4gKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyIG9yIEJTRC0zLUNsYXVzZSAqLwo+PiBSZWFsbHks
IHRoZSBMaW51eCBjb3B5IGNhbWUgZmlyc3QsIHNvIHlvdSBzaG91bGQgdXNlIGl0cyBsaWNlbnNl
LiBZb3VyCj4+IGNvbXBhbnkncyBsYXd5ZXJzIGFyZSBnb29kIHdpdGggR1BMdjMgYW5kIHRoZW4g
djQ/Cj4KPgo+IFdlIGhhdmUgYSBsb25nIGRlYmF0ZSBvbiB0aGUgbGljZW5zZXMsIGFuZCBwYXJ0
aWN1bGFyIGZvciBkZXZpY2UgdHJlZSwKPgo+IGFuZCBhcyBjb25jbHVzaW9uIHdlIGFyZSB1c2lu
ZyBmb3IgU1RNMzJNUCBTb0NzOgo+Cj4gLSBGb3IgY29kZSAoaW4gTGludXgga2VybmVsIGRyaXZl
cikgPT4gR1BMLTIuMC1vbmx5Cj4KPiAtIEZvciBkZXZpY2UgdHJlZSBhbmQgYmluZGluZyAuaCBm
aWxlczsgdGhlIGR1YWwgbGljZW5zZXMgPT4gCj4gR1BMLTIuMC1vci1sYXRlciBPUiBCU0QtMy1D
bGF1c2UKPgo+Cj4gSXQgaXMgYmVjYXVzZSB0aGUgbW9kaWZpY2F0aW9ucyBpbiBkZXZpY2UgdHJl
ZSBmaWxlcyBhbmQgYmluZGluZyBmaWxlIAo+IHMgY2FuIGJlIGFwcGxpZWQgb24KPgo+IG90aGVy
IFNXIHdpdGggdXNpbmcgYW55IGxpY2Vuc2VzOgo+Cj4gwqDCoCAtIEdQTDIgKExpbnV4IC91LUJv
b3QpCj4KPiDCoMKgIC0gQlNEIChURi1BL09QLVRFRSkKPgo+IMKgwqAgLSBHUEwzL0dQTDQgbGlj
ZW5zZSAoYW55IG90aGVyIFNXIGNvbXBvbmVudCkKPgo+Cj4gSnVzdCBpbmRpY2F0ZSBHUEwtMi4w
LW9yLWxhdGVyIGluIHRoZSBkZXZpY2UgdHJlZSBvciBiaW5kaW5nIGZpbGVzIAo+IHdvbid0IGNv
bnRhbWluYXRlCj4KPiBhbGwgdGhlIHByb2plY3RzIHdpdGggR1BMMy9HUEw0IGxpY2Vuc2UgaWYg
aXQgb25seSB1c2UgdGhpcyBEVCwgb3IgCj4gYmluZGluZyBmaWxlcy4KPgo+Cj4gTkI6IGl0IGlz
IGFscmVhZHkgdGhlIGNhc2UgZm9yIG90aGVyIGZpbGVzIHVzZWQgYnkgU1RNMzJNUCBTb0MsIGZv
ciAKPiBleGFtcGxlIDoKPgo+IC4vaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3N0bTMyLXBp
bmZ1bmMuaDoKPiDCoMKgwqAgLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBP
UiBCU0QtMy1DbGF1c2UpICovCj4KPgo+IGFuZCB3ZSBoYXZlIG5vIHJlYXNvbiB0byB1c2UgYSBk
aWZmZXJlbnQgbGljZW5zZSBmb3IgdGhlIDIgZmlsZXMgZm9yIAo+IFNUTTMyTVAxMyBSQ0MgYmlu
ZGluZzoKPgo+IMKgIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvc3RtMzJtcDEzLXJlc2V0cy5o
Cj4gwqAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdG0zMm1wMTMtY2xrcy5oCj4KPiBUaGlz
IHBhdGNoIGNvcnJlY3RzIGEgbWlzdGFrZSBpbiB0aGUgaW5pdGlhbCBjb21taXQgZm9yIFJDQyBi
aW5kaW5nIAo+IHVwLXN0cmVhbWVkCj4KPiBieSBHYWJyaWVsIGluIHBhcmFsbGVsIGluIFUtQm9v
dCBhbmQgTGludXggcmVwb3NpdG9yaWVzOyB0aGlzIAo+IGluY29uc2lzdGVuY3kgaW4gdGhlIGxp
Y2Vuc2UKPgo+IHdhcyBjb3JyZWN0ZWQgb25seSB3aGVuIHRoZSBzYW1lIHBhdGNoIHdhcyBwdXNo
ZWQgaW4gVS1Cb290Lgo+Cj4KPiBQUzogdXNpbmcgdGhlIEdQTDItb25seSBpcyBub3QgYSBpc3N1
ZSBmb3IgVS1Cb290IGJ1dCBwZXJoYXBzIGZvciAKPiBvdGhlciB1c2VyIG9mIGRldmljZSB0cmVl
IGluIG90aGVyIGNvbXBvbmVudHMsCj4gwqDCoMKgwqDCoCBTbyBpZiBpdCBpcyBhIGJsb2NraW5n
IGlzc3VlIGZvciBMaW51eCBJIGNhbiBjaGFuZ2UgaXQgdG8gCj4gIkdQTC0yLjAtb25seSIgaW4g
TGludXggYW5kIFUtQm9vdAo+Cj4KPiBQYXRyaWNrIAoKCkhpLAoKCmFmdGVyIHRlc3QgYW5kIHRv
IGF2b2lkIHRoZSBjaGVjay1wYXRjaCBpc3N1ZSBvbiBuZXh0IGJyYW5jaCBpbnRyb2R1Y2VkIApi
eSBjb21taXQgYTA0YmI0YzI0YTQ4CgooImNoZWNrcGF0Y2g6IGludHJvZHVjZSBwcm9wZXIgYmlu
ZGluZ3MgbGljZW5zZSBjaGVjayIpLAoKSSB3aWxsIHVzZSB0aGUgc2FtZSBsaWNlbnNlIGZvciB0
aGUgMiBmaWxlcyAiR1BMLTIuMC1vbmx5IiBhcyByZWNvbW1lbmRlZCBpbgoKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsL0NBTF9Kc3ErLVlKc0JPK0x1UEo9WlE9ZWItbW9ucnd6dUNwcHZSZUgr
YWY3aFlaek5hUUBtYWlsLmdtYWlsLmNvbQoKPT4gIkFsc28sIEdQTC0yLjAtb3ItbGF0ZXIgaXMg
bmVpdGhlciBkZXNpcmVkIG5vciBlbmNvdXJhZ2VkLiIKCkFuZCBJIHdpbGwgYWxpZ24gdGhlIFUt
Qm9vdCBmaWxlcyBsYXRlci4uLi4KCgpQYXRyaWNrCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
