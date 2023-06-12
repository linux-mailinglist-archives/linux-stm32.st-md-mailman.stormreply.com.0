Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F94172C46E
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 14:37:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD469C6B443;
	Mon, 12 Jun 2023 12:37:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77BA9C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 12:35:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35CB3tpg020749; Mon, 12 Jun 2023 14:34:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qS9LedkEY8LeXLrf0Iq5j3ICOXbk8okQNFZSlvqbRfA=;
 b=KIFKxz0u1uCkFtVICc5oXcGtZKPOmUbV60GFuY56ZE7FyITgrqN5arn+US+o4dO0mwPK
 ACXfMNKPmwF96UT4Yo4yKNjnRuG2eCeYqmrSpxOUhPxagadUcIlGSd2krOsBr6Ww9pUz
 LjDlhAMOPMhGegvtud6qIU5/OlsRH6RV7VZHNjs9t6kOK5/+vOAUQPW3oIMbBuK2XW9/
 dcd1SPv0v9rQqsvCTE6qYsDyUus+ANOmE+1OL/pYkqhQwRPkleMODucrA0WvkIR4holN
 zniO3LwnC2WmpX1dxshgrbwzvVAI4ppsOJx18TRcdOMDjaIMvdc5rMu3dKOzm+oa6in5 ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r5y5bsv4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 14:34:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37F1910002A;
 Mon, 12 Jun 2023 14:34:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26C412309FE;
 Mon, 12 Jun 2023 14:34:34 +0200 (CEST)
Received: from [10.252.14.202] (10.252.14.202) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 12 Jun
 2023 14:34:33 +0200
Message-ID: <5c3bbeb8-f0c1-46e4-009e-1cc3de64c06e@foss.st.com>
Date: Mon, 12 Jun 2023 14:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20230518011246.438097-1-marex@denx.de>
 <PAXPR10MB471850924065C987981634C1F14B9@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <133c8b4a-8680-f613-807a-2d7931d0a186@denx.de>
 <PAXPR10MB4718D37242FF00D47DF0CEF1F1499@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <81f4574d-38c2-21f2-b947-d13e5fc99c60@denx.de>
 <PAXPR10MB471825B145645894D626F070F152A@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <0d304968-74c8-47ce-f87a-127449f36f4b@denx.de>
 <PAXPR10MB4718E8CE58A881DAE3983A27F153A@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <b65288f6-1d3d-424f-5df5-98e86cc51dec@denx.de>
 <c944123c-bcd8-89cf-c2cd-8d5742931f68@foss.st.com>
 <26cfd848-a29d-2b38-3c15-fdcda532bcef@denx.de>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <26cfd848-a29d-2b38-3c15-fdcda532bcef@denx.de>
X-Originating-IP: [10.252.14.202]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_06,2023-06-09_01,2023-05-22_02
X-Mailman-Approved-At: Mon, 12 Jun 2023 12:37:31 +0000
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
 mailbox for emtrion emSBC-Argon
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

CgpPbiA2LzEyLzIzIDExOjEzLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzEyLzIzIDEwOjI2
LCBBcm5hdWQgUE9VTElRVUVOIHdyb3RlOgo+Pgo+Pgo+PiBPbiA2LzEwLzIzIDE1OjQ2LCBNYXJl
ayBWYXN1dCB3cm90ZToKPj4+IE9uIDYvNy8yMyAxMTo1MywgQXJuYXVkIFBPVUxJUVVFTiB3cm90
ZToKPj4+Cj4+PiBIaSwKPj4+Cj4+PiBbLi4uXQo+Pj4KPj4+Pj4+Pj4+PiBSYXRoZXIgdGhhbiBh
ZGRpbmcgdW51c2VkIG9wdGlvbmFsIG1haWxib3gsIEkgd2lsbCBtb3JlIGluIGZhdm9yCj4+Pj4+
Pj4+Pj4gb2YgaGF2aW5nIGEgbWJveF9yZXF1ZXN0X2NoYW5uZWxfYnluYW1lX29wdGlvbmFsIGhl
bHBlciBvcgo+Pj4+Pj4+Pj4+IHNvbWV0aGluZyBzaW1pbGFyCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4g
U2VlIGFib3ZlLCBJIHRoaW5rIGl0IGlzIGJldHRlciB0byBoYXZlIHRoZSBtYWlsYm94IGRlc2Ny
aWJlZCBpbiBEVAo+Pj4+Pj4+Pj4gYWx3YXlzIGFuZCBub3QgdXNlIGl0ICh0aGUgdXNlciBjYW4g
YWx3YXlzIHJlbW92ZSBpdCksIHRoYW4gdG8gbm90Cj4+Pj4+Pj4+PiBoYXZlIGl0IGRlc2NyaWJl
ZCBvbiBzb21lIGJvYXJkcyBhbmQgaGF2ZSBpdCBkZXNjcmliZWQgb24gb3RoZXIKPj4+Pj4+Pj4+
IGJvYXJkcwo+Pj4+Pj4+IChpbmNvbnNpc3RlbmN5KS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQWRkaW5n
IGl0IGluIHRoZSBEVCAoIGFuZCBlc3BlY2lhbGx5IGluIHRoZSBTb2MgRFRTSSkgY2FuIGFsc28g
YmUKPj4+Pj4+Pj4gaW50ZXJwcmV0ZWQgYXMgIml0IGlzIGRlZmluZWQgc28geW91IG11c3QgdXNl
IGl0Ii4gSSB3b3VsZCBleHBlY3QKPj4+Pj4+Pj4gdGhhdCB0aGUgQmluZGluZ3MgYWxyZWFkeSBw
cm92aWRlIHRoZSBpbmZvcm1hdGlvbiB0byBoZWxwIHVzZXIgdG8gYWRkIGl0Cj4+Pj4+IG9uIG5l
ZWQuCj4+Pj4+Pj4KPj4+Pj4+PiBXaHkgc2hvdWxkIGV2ZXJ5IHNpbmdsZSBib2FyZCBhZGQgaXQg
c2VwYXJhdGVseSBhbmQgZHVwbGljYXRlIHRoZQo+Pj4+Pj4+IHNhbWUgc3R1ZmYsIGlmIHRoZXkg
Y2FuIGFsbCBzdGFydCB3aXRoIGl0LCBhbmQgaWYgYW55b25lIG5lZWRzIHRvCj4+Pj4+Pj4gdHdl
YWsgdGhlIG1haWxib3ggYWxsb2NhdGlvbiwgdGhlbiB0aGV5IGNhbiBkbyB0aGF0IGluIHRoZSBi
b2FyZCBEVCA/Cj4+Pj4+Pj4gSSByZWFsbHkgZG9uJ3QgbGlrZSB0aGUgZHVwbGljYXRpb24gc3Vn
Z2VzdGlvbiBoZXJlLgo+Pj4+Pj4KPj4+Pj4+IEkgd2FzIHNwZWFraW5nIGFib3V0ICJkZXRhY2gg
bWFpbGJveC4gSGVyZSBpcyB3aGF0IEkgd291bGQgbGlrZSB0bwo+Pj4+Pj4gcHJvcG9zZSB0byB5
b3UKPj4+Pj4+Cj4+Pj4+PiAxKcKgIG1vdmUgYWxsIHRoZSBtYWlsYm94IGRlY2xhcmF0aW9uIGlu
IHRoZSBEVFNJIGV4Y2VwdCAiZGV0YWNoIgo+Pj4+Pj4gMikgZG9uJ3QgZGVjbGFyZSAiZGV0YWNo
IiBpbiBib2FyZHMgRFRTICggZXhjZXB0IFNUIGJvYXJkIGZvciBsZWdhY3kKPj4+Pj4+IGNvbXBs
aWFuY2UpCj4+Pj4+PiAzKSBhcyBhIG5leHQgc3RlcCB3ZSB3aWxsIGhhdmUgdG8gZml4IHRoZSB1
bmV4cGVjdGVkIHdhcm5pbmcgb24gdGhlCj4+Pj4+PiDCoMKgwqDCoMKgICJkZXRhY2giIG1haWxi
b3guCj4+Pj4+Cj4+Pj4+IFdoeSBub3QgbWFrZSB0aGUgbWFpbGJveCBhdmFpbGFibGUgYnkgZGVm
YXVsdCBvbiBhbGwgYm9hcmRzID8KPj4+Pgo+Pj4+IEl0IGhhcyBiZWVuIGludHJvZHVjZWQgbWFp
bmx5IHRvIHRlc3QgdGhlIGRldGFjaCBmZWF0dXJlLAo+Pj4+IG9uIGEgc2Vjb25kIHBsYXRmb3Jt
IHRvIGhlbHAgcmVtb3RlcHJvYyBtYWludGFpbmVycyBmb3IgdGhlIHJldmlldwo+Pj4+IHByb2Nl
c3MuIEJ1dCB0aGUgZmVhdHVyZSBpcyBub3QgZnVsbHkgaW1wbGVtZW50ZWQgb24gc3RtMzJtcDEK
Pj4+PiAoIGF1dG8gcmVib290IG9mIHRoeWUgTTQgb24gY3Jhc2gsIGFwcHJvcHJpYXRlIHJlc291
cmNlIHRhYmxlIGNsZWFuLXVwLC4uLikKPj4+Cj4+PiBUaGlzIGlzIGEgZHJpdmVyIGJ1ZywgdW5y
ZWxhdGVkIHRvIERUIGRlc2NyaXB0aW9uLCBwbGVhc2UganVzdCBmaXggaXQuCj4+Cj4+IE5vLCBp
dCBpcyBhIHN5c3RlbSB1c2VjYXNlIHRoYXQgZGVwZW5kcyBvbiBIYXJkd2FyZSwgTTQgZmlybXdh
cmUsIEE3Cj4+IGFwcGxpY2F0aW9ucywgLi4uCj4+IFRoZSBkZXRhY2gvcmUtYXR0YWNoIGlzIGEg
cXVpdGUgY29tcGxleCBmZWF0dXJlIHRoYXQgbmVlZHMgdG8gdW5kZXJzdGFuZAo+PiB0aGUgd2hv
bGUgcGljdHVyZS4gQXMgYWxyZWFkeSBtZW50aW9uZWQgYWJvdmUgaXQgYXMgYmVlbiBpbnRyb2R1
Y2VkIGZvcgo+PiB0ZXN0IG9uIHVwc3RyZWFtLgo+Pgo+Pj4KPj4+PiBJIHdvdWxkIHByZWZlciB0
byByZW1vdmUgaXQgaW4gU1QgYm9hcmQgRFQgdGhhbiBhZGQgaXQgaW4gdGhlIERUU0kuCj4+Pj4g
VGhhdCBzYWlkIGFzIG1lbnRpb25lZCBmb3IgbGVnYWN5IHN1cHBvcnQsIGJldHRlciB0byBrZWVw
IGZvciBTVCBib2FyZC4KPj4+Cj4+PiBXaHkgbm90IHJlbW92ZSBpdCBmcm9tIFNUIGJvYXJkcyBp
ZiB0aGlzIHdhcyBsZWdhY3kgdGVzdCBmZWF0dXJlIGFuZCBpcyBubwo+Pj4gbG9uZ2VyIG5lZWRl
ZCA/Cj4+Cj4+IElmIHlvdSBjYW4gZ3VhcmFudHkgdGhhdCB0aGlzIHdpbGwgbm90IGludHJvZHVj
ZSByZWdyZXNzaW9uIG9uIGxlZ2FjeSwgeWVzIHdlCj4+IGNhbi4KPiAKPiBUaGVuIGNsZWFybHkg
dGhlIG9ubHkgd2F5IHRvIGF2b2lkIHRoaXMgZnJhZ21lbnRhdGlvbiBpcyB0byBhZGQgaXQgb24g
YWxsIGJvYXJkcy4KCllvdSBjYW4gbm90IGF2b2lkIGZyYWdtZW50YXRpb24gaGVyZSwgdGhlIERU
IGFuZCB0aGUgQ29ydGV4LU00IGZpcm13YXJlIGFyZQpkZXBlbmRlbnQsIHRoZSBNNCBmaXJtd2Fy
ZSBpcyBib2FyZCBkZXBlbmRlbnQuCkZvciBpbnN0YW5jZSwgaWYgd2UgaW50cm9kdWNlIHNvbWUg
bmV3IG1haWxib3ggY2hhbm5lbHMgdG8gc3VwcG9ydCBzb21lIHZpcnRpbwpzZXJ2aWNlcyBzaG91
bGQgd2UgYWxzbyBhZGQgaXQgb24gYWxsIGJvYXJkcyB0aGF0IGVtYmVkZCBzdG0zMm1wMTUgY2hp
cC4uPwoKRm9yIG1lIG5vLCBhcyB0aGUgTTQgRmlybXdhcmUgaXMgYm9hcmQgZGVwZW5kZW50LgoK
PiAKPj4+Pj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIGlmIHRoZSBzb2Z0d2FyZSBpcyBub3QgdXNp
bmcgdGhlIGRldGFjaCBtYWlsYm94LCB0aGVyZQo+Pj4+PiBpcyBubwo+Pj4+PiBkb3duc2lkZSwg
aXQgd291bGQganVzdCBiZSB1bnVzZWQuIFVzZXIgY2FuIGFsd2F5cyByZW1vdmUgaXQgaW4gdGhl
aXIgRFQgaWYKPj4+Pj4gcmVhbGx5IG5lZWRlZC4KPj4+Pgo+Pj4+IFRoZSBpbnZlcnNlIGl0IHRy
dWUsIFVzZXIgY2FuIGFkZCBpdCBpbiB0aGVpciBEVCBpZiByZWFsbHkgbmVlZC4KPj4+Cj4+PiBJ
cyB0aGVyZSBhIGRvd25zaWRlIGlmIHRoaXMgaXMgZW5hYmxlZCBieSBkZWZhdWx0LCB5ZXMgb3Ig
bm8gPwo+Pgo+PiBZZXMsIGJ5IGRvaW5nIHRoaXMgeW91IGltcG9zZSB0aGF0IHRoaXMgY2hhbm5l
bCBpcyByZXNlcnZlZCBmb3IgdGhlIGRldGFjaC4KPj4gbWFraW5nIGl0IG5vIG1vcmUgb3B0aW9u
YWwuCj4gCj4gTm90IHJlYWxseSwgdGhlIHVzZXIgY2FuIHN0aWxsIGRlZmluZSB3aGF0ZXZlciBj
aGFubmVscyB0aGV5IG5lZWQgZm9yIHRoZWlyCj4gY3VzdG9tIHNldHVwIGluIHRoZWlyIERULiBU
aGUgU29DIERUU0kgc2hvdWxkIGJlIGp1c3QgYSBkZWZhdWx0Lgo+IAo+Pj4+PiBJIGJlbGlldmUg
b25jZSBjYW4gYnVpbGQgZGVtb3MgdXNpbmcgdGhlIGRldGFjaCBtYWlsYm94IGZvciBib2FyZHMg
d2l0aAo+Pj4+PiBzdG0zMm1wMTV4eCBub3QgbWFudWZhY3R1cmVkIGJ5IFNULCBjb3JyZWN0ID9b
XQo+Pj4+Cj4+Pj4gRXZlcnl0aGluZyBjb3VsZCBiZSBwb3NzaWJsZS4uLgo+Pj4+IE9uY2UgY2Fu
IHdhbnQgdG8gcmVwbGFjZSB0aGUgc2h1dGRvd24gbWFpbGJveCBieSB0aGUgZGV0YWNoLgo+Pj4+
IE9uY2UgY2FuIGFsc28gYnVpbGQgZGVtbyB1c2luZyB0aGUgZGV0YWNoIG1haWxib3ggY2hhbm5l
bCBmb3IgYW5vdGhlciBwdXJwb3NlLgo+Pj4+Cj4+Pj4gSSBxdWl0ZSBjb25mdXNlIHdoeSB5b3Ug
aW5zaXN0IHRvIGRlY2xhcmUgdGhpcyBkZXRhY2ggbWFpbGJveCBpbiB0aGUgRFRTST8KPj4+PiBJ
cyB0aGVyZSBhIHN0cm9uZyBjb25zdHJhaW50IG9uIHlvdXIgc2lkZT8KPj4+Cj4+PiBJIGp1c3Qg
ZG9uJ3Qgc2VlIGFueSBleHBsYW5hdGlvbiB3aHkgU1QgYm9hcmQocykgc2hvdWxkIGJlIHNvbWVo
b3cgc3BlY2lhbCBhbmQKPj4+IGhhdmUgdGhlIGRldGFjaCBtYWlsYm94IGRlc2NyaWJlZCBpbiBE
VCBieSBkZWZhdWx0LCB3aGlsZSBvdGhlciBib2FyZHMgd291bGQKPj4+IHJlcXVpcmUgc2VwYXJh
dGUgRFQgcGF0Y2ggdG8gdXNlIHRoZSBkZXRhY2ggbWFpbGJveCBmaXJzdC4gVGhhdCBqdXN0IHJl
ZHVjZXMKPj4+IHVzYWJpbGl0eSBvZiBub24tU1QtbWFudWZhY3R1cmVkIGJvYXJkcyBhbmQgaW5j
cmVhc2VzIGZyYWdtZW50YXRpb24uIEkgZG8gbm90Cj4+PiBsaWtlIHRoYXQuCj4+Cj4+IFRoZSAi
c29tZWhvdyBzcGVjaWFsIiBzaG91bGQgb25seSBiZSBhbiBpbnRlcm5hbCBNNCBmaXJtd2FyZcKg
IGFsbG93aW5nIHRvIHRlc3QKPj4gdGhlIGZlYXR1cmUgdG8gaGVscCByZW1vdGVwcm9jIG1haW50
YWluZXJzIHRvIHZlcmlmeSBpdCBvbiBkZW1hbmQuCj4+IEJ1dCBJIGNhbiBub3Qga25vdyBpZiBz
b21lb25lIGluIHRoZSBjb21tdW5pdHkgaGF2ZSBhbm90aGVyIGZpcm13YXJlIHVzaW5nCj4+IGRl
dGFjaCBvbiB0aGUgU1QgYm9hcmRzLgo+PiBBbnl3YXkgd2hhdCB5b3UgcHJvcG9zZSBoZXJlIGlz
IHRoYXQgd2UgaW1wb3NlIGl0IGZvciBhbGwgYm9hcmRzLiBTb21lIGJvYXJkcwo+PiB3b3VsZCBy
ZXF1aXJlIHNlcGFyYXRlIERUIHBhdGNoIHRvIG5vdCB1c2UgaXQuIFdlIGp1c3QgaW52ZXJzZSB0
aGUgdGhpbmdzLi4uCj4+IFRoZSBkaWZmZXJlbmNlIGlzIHRoYXQgSSB3b3VsZCBub3QgaW1wb3Nl
IHNvbWV0aGluZyBvcHRpb25hbC4KPiAKPiBJIGJlbGlldmUgaXQgaXMgYmV0dGVyIHRvIGhhdmUg
c2luZ2xlIGNhcGFibGUgY29uc2lzdGVudCBkZWZhdWx0IGFuZCBsZXQgdXNlcnMKPiByZW1vdmUg
dGhlIGNhcGFiaWxpdGllcyBmb3Igc3BlY2lmaWMgYXBwbGljYXRpb24gaWYgbmVlZGVkLCB0aGFu
IHRvIGhhdmUKPiBmcmFnbWVudGVkIGluY29uc2lzdGVudCBib2FyZC1zcGVjaWZpYyBjb25maWd1
cmF0aW9ucyB3aGVyZSB1c2VycyBoYXZlIHRvIGZpcnN0Cj4gZGV0ZXJtaW5lIHdoZXRoZXIgdGhl
eSBuZWVkIHRvIHBhdGNoIHRoZW0gdG8gYWRkIG1pc3NpbmcgY2FwYWJpbGl0aWVzLCBhbmQgdGhl
bgo+IHBvc3NpYmx5IHBhdGNoIHRoZW0sIHRoYXQncyBqdXN0IGEgbWVzcy4KCgpCZSBhd2FyZSB0
aGF0IHRvIG1hbmFnZSBhIGNvcHJvY2Vzc29yIGZpcm13YXJlIHRoaXMgbm90IHN1ZmZpY2llbnQg
c28gaW4gYW55CmNhc2UgdXNlciB3aWxsIGhhdmUgdG8gcGF0Y2ggdGhlIERUIHRvIGFzc2lnbiBw
ZXJpcGhlcmFscyB0byB0aGUgQ29ydGV4LU00LAp1cGRhdGUgaGUgbWVtb3J5IHJlZ2lvbnMsLi4u
Ckl0IGlzIGEgc3lzdGVtIHVzZWNhc2UsIG5vdCBvbmx5IHRoZSBlbmFibGUgb2YgYSBwZXJpcGhl
cmFsLlRoYXQncyB3aHkgd2UgaGF2ZQpzcGVjaWZpYyBEVCBpbiBkb3duc3RyZWFtIGZvciBNNCBl
eGFtcGxlcywgdG8gYmUgYWJsZSB0byBzdXBwb3J0IG1vcmUgZXhhbXBsZXMKYW5kIGRlbW9zLgoK
PiAKPiBJdCBhbHNvIHB1dHMgbm9uLVNULW1hbnVmYWN0dXJlZCBib2FyZHMgaW50byB3b3JzZSBw
b3NpdGlvbi4KCldoYXQgd291bGQgeW91IG1lYW4gYnkgd29yc3QgcG9zaXRpb24/IEFzIHRoZXJl
IGlzIG5vIGV4YW1wbGUgcHJvdmlkZWQgdGhhdAp3b3VsZCB0YWtlIGFkdmFudGFnZSBvZiB0aGUg
ImRldGFjaCIsIEkgZG9uJ3QgdW5kZXJzdGFuZCB5b3VyIHBvaW50LgoKVGhlIG9ubHkgYXJndW1l
bnQgSSBjYW4gc2VlIGZvciBnZW5lcmljIGlzIHRoYXQgdGhlICBwcm9wb3NlZCBzZXR0aW5ncyBh
bGxvdwp0byBydW4gYSBaZXBoeXIgSVBDIHNhbXBsZSwgdGhhdCBjb3VsZCBiZSBjcm9zcy1wbGF0
Zm9ybS4KU28gSSB3b3VsZCBzYXkgd2Ugc2hvdWxkIGZpcnN0IGV4dGVuZCB0aGUgTTQgemVwaHly
IHNhbXBsZSB0byBpbXBsZW1lbnQgdGhlCmRldGFjaCBhbmQgdGhlbiB0aGF0IG1pZ2h0IG1ha2Ug
c2Vuc2UuCgpIYXZpbmcgc2FpZCB0aGF0LCBJJ2QgcmF0aGVyIG5vdCBzcGVuZCBhbnkgbW9yZSB0
aW1lIG9uIHRoaXMgc3ViamVjdC4KSSd2ZSBnaXZlbiBzb21lIGFyZ3VtZW50cywgeW91J3ZlIGdp
dmVuIG90aGVycy4KSSBub3cgcHJvcG9zZSB0byBsZXQgQWxleCwgYXMgbWFpbnRhaW5lciBvZiBz
dG0zMiBEVCwgZGVjaWRlLi4uCgpSZWdhcmRzLApBcm5hdWQKCj4gCj4+IEluIHRlcm0gb2YgZnJh
Z21lbnRhdGlvbiBJIGNhbiBvbmx5IHNlZSBhIHNwZWNpZmljaXR5IGZvciB0aGUgU1QgYm9hcmRz
LkFzCj4+IGFscmVhZHkgc2FpZCBpZiB5b3UgY2FuIGVuc3VyZSB0aGF0IHRoaXMgd2lsbCBub3Qg
Z2VuZXJhdGUgaW1wYWN0IG9uIGxlZ2FjeSwKPj4gaXQgY2FuIGJlIHJlbW92ZWQgZnJvbSB0aGUg
U1QgRFQuCj4+Cj4+IEBBbGV4OiBhbnkgb3BpbmlvbiBvbiB0aGF0Pwo+IAo+IFsuLi5dCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
