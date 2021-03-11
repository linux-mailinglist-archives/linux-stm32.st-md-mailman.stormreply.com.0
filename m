Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF3233738D
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 14:16:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50226C5718B;
	Thu, 11 Mar 2021 13:16:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69D6FC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 13:16:01 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BDD19P007349; Thu, 11 Mar 2021 14:15:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jmyK0TCg9/vVLI7WBsPpx8qHLYjoz3oLSyKLJf1+X1Q=;
 b=Pfc4YkFRbGR23pZHVLGFNBPgorQKr0opxL5PuXrJbzGRrWrJGzD3JOIiP8YtZmNxvyBJ
 s6f9aV1Kb6/oBFn/p/BHhiBoc1u42GUGsrb3rwOtbloniP/zLvgP+fXnyrPSqEF7YWd1
 rBZjwlXfWo36W7L5Og9rsHP7g5rxz2878QDA1GV7qVTcLR+4+rkfPEOv0CwOjz8oBn83
 QoQVRq1OlOPeTDghvl/M4b7tBtVKtlS8X07KZJd+rqwfQxgfBkielJRblRUnfDLx2Ms6
 vGJsp1Yxl74FGfxYoMUsprjzkZ50IVy2b5egpJ6BVL+oiLdI36QG/QBTqyfg0lENy9vj kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3740376wys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 14:15:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D20C910002A;
 Thu, 11 Mar 2021 14:15:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB685245D46;
 Thu, 11 Mar 2021 14:15:46 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar
 2021 14:15:45 +0100
To: Marek Vasut <marex@denx.de>, Alexandre TORGUE <alexandre.torgue@st.com>,
 Alex G. <mr.nuke.me@gmail.com>, Gabriel FERNANDEZ - foss
 <gabriel.fernandez@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Etienne CARRIERE <etienne.carriere@st.com>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <2e04f814-b694-119d-fe8a-13e6df129536@gmail.com>
 <AS8PR10MB4712C27260707345FA99ED5AEE909@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
 <c57775fe-41ef-07f5-56a2-04b8f70797c1@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <ac98b89f-9664-b89c-c12c-24c1cbd29b00@foss.st.com>
Date: Thu, 11 Mar 2021 14:15:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c57775fe-41ef-07f5-56a2-04b8f70797c1@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_04:2021-03-10,
 2021-03-11 signatures=0
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

SGkgTWFyZWsKCk9uIDMvMTEvMjEgMTI6NDMgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDMv
MTEvMjEgOTowOCBBTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4gSGkgQUxleAo+IAo+IEhl
bGxvIGV2ZXJ5b25lLAo+IAo+IFsuLi5dCj4gCj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAw
LzE0XSBJbnRyb2R1Y2UgU1RNMzJNUDEgUkNDIGluIHNlY3VyZWQgbW9kZQo+Pj4KPj4+IE9uIDEv
MjYvMjEgMzowMSBBTSwgZ2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20gd3JvdGU6Cj4+Pj4g
RnJvbTogR2FicmllbCBGZXJuYW5kZXogPGdhYnJpZWwuZmVybmFuZGV6QGZvc3Muc3QuY29tPgo+
Pj4+Cj4+Pj4gUGxhdGZvcm0gU1RNMzJNUDEgY2FuIGJlIHVzZWQgaW4gY29uZmlndXJhdGlvbiB3
aGVyZSBzb21lIGNsb2NrcyBhbmQKPj4+PiBJUCByZXNldHMgY2FuIHJlbGF0ZSBhcyBzZWN1cmUg
cmVzb3VyY2VzLgo+Pj4+IFRoZXNlIHJlc291cmNlcyBhcmUgbW92ZWQgZnJvbSBhIFJDQyBjbG9j
ay9yZXNldCBoYW5kbGUgdG8gYSBTQ01JCj4+Pj4gY2xvY2svcmVzZXRfZG9tYWluIGhhbmRsZS4K
Pj4+Pgo+Pj4+IFRoZSBSQ0MgY2xvY2sgZHJpdmVyIGlzIG5vdyBkZXBlbmRlbnQgb2YgdGhlIFND
TUkgZHJpdmVyLCB0aGVuIHdlIGhhdmUKPj4+PiB0byBtYW5hZ2Ugbm93IHRoZSBwcm9iZSBkZWZl
cmluZy4KPj4+Pgo+Pj4+IHYxIC0+IHYyOgo+Pj4+IMKgwqDCoCAtIGZpeCB5YW1sbGludCB3YXJu
aW5ncy4KPj4+Cj4+PiBIaSBHYWJyaWVsLAo+Pj4KPj4+IEkgZG9uJ3QgaGF2ZSBtdWNoIGNsb3V0
IHdpdGggdGhlIG1haW50YWluZXJzLCBidXQgSSBoYXZlIHRvIE5BSyB0aGlzIAo+Pj4gc2VyaWVz
Cj4+PiBhZnRlciBmaW5kaW5nIG1ham9yIGJyZWFrYWdlLgo+Pj4KPj4+IFRoZSBwcm9ibGVtIHdp
dGggc2VyaWVzIGlzIHRoYXQgaXQgYnJlYWtzIHByZXR0eSBtdWNoIGV2ZXJ5IGJvYXJkIGl0IAo+
Pj4gdG91Y2hlcy4KPj4+IEkgaGF2ZSBhIERLMiBoZXJlIHRoYXQgSSdtIHVzaW5nIGZvciBkZXZl
bG9wbWVudCwgd2hpY2ggbm8gbG9uZ2VyIAo+Pj4gYm9vdHMgd2l0aAo+Pj4gdGhpcyBzZXJpZXMg
YXBwbGllZC4KPj4+Cj4+PiBUaGUgY3J1eCBvZiB0aGUgbWF0dGVyIGlzIHRoYXQgdGhpcyBzZXJp
ZXMgYXNzdW1lcyBhbGwgYm9hcmRzIHdpbGwgCj4+PiBib290IHdpdGggYW4KPj4+IEZTQkwgdGhh
dCBpbXBsZW1lbnRzIGEgdmVyeSBzcGVjaWZpYyBTQ01JIGNsb2NrIHRyZWUuIFRoaXMgaXMgbWFq
b3IgQUJJCj4+PiBicmVha2FnZSBmb3IgYW55b25lIG5vdCB1c2luZyBURi1BIGFzIHRoZSBmaXJz
dCBzdGFnZSBib290bG9hZGVyLiBBbnlvbmUKPj4+IHVzaW5nIHUtYm9vdCBTUEwgaXMgc2NyZXdl
ZC4KPj4+Cj4+PiBUaGlzIHNlcmllcyBpbXBvc2VzIGEgU09DLXdpZGUgY2hhbmdlIHZpYSB0aGUg
ZHRzaSBmaWxlcy4gU28gZXZlbiAKPj4+IGJvYXJkcyB0aGF0Cj4+PiB5b3UgZG9uJ3QgaW50ZW5k
IHRvIGNvbnZlcnQgdG8gU0NNSSB3aWxsIGdldCBicm9rZW4gdGhpcyB3YXkuCj4+PiBBZGRpbmcg
YSAtbm8tc2NtaSBmaWxlIHRoYXQgaXNuJ3QgdXNlZCBhbnl3aGVyZSBkb2Vzbid0IGhlbHAgdGhp
bmdzLgo+Pgo+PiBZb3UgYXJlIHJpZ2h0LiBXZSBtYWlubHkgdGFrZSBjYXJlIGFib3V0IE5PIFNU
IChESC8uLi4pIGJvYXJkcywgYnV0ICAKPj4gbm90IHJlYWxseSBhYm91dCBjdXJyZW50IHVzYWdl
Cj4+IE9mIG91ciBzdG0zMiBib2FyZHMuIFNldmVyYWwgb3B0aW9ucyBleGlzdDoKPiAKPiBTaW5j
ZSBhIGxvdCBvZiBwZW9wbGUgYmVuZWZpdCBmcm9tIHRoZSBnb29kIHVwc3RyZWFtIHN1cHBvcnQg
Zm9yIHRoZSBNUDEgCj4gX2FuZF8ga2VlcCB1cGRhdGluZyB0aGVpciBtYWNoaW5lcyB0byBnZXQg
dGhlIGxhdGVzdCBmaXhlcywgaXQgaXMgdmVyeSAKPiBpbXBvcnRhbnQgdG8ga2VlcCB0aGUgY3Vy
cmVudCB1c2FnZSB3b3JraW5nLgo+IAo+PiAxLSBCcmVhayB0aGUgY3VycmVudCBBQkk6IGFzIHNv
b24gYXMgdGhvc2UgcGF0Y2hlcyBhcmUgbWVyZ2VkLCAKPj4gc3RtMzJtcDE1N2MtZGsyLmR0YiB3
aWxsIGltcG9zZSB0byB1c2UKPj4gQSB0Zi1hIGZvciBzY21pIGNsb2Nrcy4gRm9yIHBlb3BsZSB1
c2luZyB1LWJvb3Qgc3BsLCB0aGUgd2lsbCBoYXZlIHRvIAo+PiBjcmVhdGUgdGhlaXIgb3duICJu
by1zZWN1cmUiIGRldmljZXRyZWUuCj4gCj4gTkFLLCB0aGlzIGJyZWFrcyBleGlzdGluZyBib2Fy
ZHMgYW5kIGV4aXN0aW5nIHNldHVwcywgZS5nLiBESzIgdGhhdCBkb2VzIAo+IG5vdCB1c2UgQVRG
LiA+Cj4+IDItQXMgeW91IHN1Z2dlc3QsIGNyZWF0ZSBhIG5ldyAic2VjdXJlIiBkdGIgcGVyIGJv
YXJkcyAoTm90IG15IHdpc2ggCj4+IGZvciBtYWludGVuYW5jZSBwZXJzcGVjdGl2ZXMpLgo+IAo+
IEkgYWdyZWUgd2l0aCBBbGV4IChHKSB0aGF0IHRoZSAic2VjdXJlIiBvcHRpb24gc2hvdWxkIGJl
IG9wdC1pbi4KPiBUaGF0IHdheSBleGlzdGluZyBzZXR1cHMgcmVtYWluIHdvcmtpbmcgYW5kIG5v
IGV4dHJhIHJlcXVpcmVtZW50cyBhcmUgCj4gaW1wb3NlZCBvbiBNUDEgdXNlcnMuIEVzcC4gc2lu
Y2UgYXMgZmFyIGFzIEkgdW5kZXJzdGFuZCB0aGlzLCB0aGUgCj4gInNlY3VyZSIgcGFydCBpc24n
dCByZWFsbHkgYWJvdXQgc2VjdXJpdHksIGJ1dCByYXRoZXIgYWJvdXQgbW92aW5nIGNsb2NrIAo+
IGNvbmZpZ3VyYXRpb24gZnJvbSBMaW51eCB0byBzb21lIGZpcm13YXJlIGJsb2IuCj4gCj4+IDMt
IEtlZXAga2VybmVsIGRldmljZSB0cmVlIGFzIHRoZXkgYXJlIGFuZCBhcHBsaWVkIHRoaXMgc2Vj
dXJlIGxheWVyIAo+PiAoc2NtaSBjbG9ja3MgcGhhbmRsZSkgdGhhbmtzIHRvIGR0Ym8gaW4KPj4g
VS1ib290Lgo+IAo+IElzIHRoaXMgcmVhbGx5IGJldHRlciB0aGFuCj4gI2luY2x1ZGUgInN0bTMy
bXAxNXh4LWVuYWJsZS1zZWN1cmUtc3R1ZmYuZHRzaSIKPiBpbiBhIGJvYXJkIERUID8gQmVjYXVz
ZSB0aGF0IGlzIGhvdyBJIGltYWdpbmUgdGhlIG9wdC1pbiAic2VjdXJlIiBvcHRpb24gCj4gY291
bGQgd29yay4KClRoZSBkdGJvIHVzYWdlIGNvdWxkIGF2b2lkIHRvIGFkZCBhbm90aGVyIHN0IGJv
YXJkIChhY3R1YWxseSBhIHNlY3VyZSAKY29uZmlnKSBpbiBhcmNoL2FybS9ib290L2R0cy4KCkNo
ZWVycwoKQWxleAoKCj4gCj4+IFRoZSB0aGlyZCBjb3VsZCBiZSB0aGUgbGVzcyBjb3N0bHkuCj4g
Cj4gWy4uLl0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
