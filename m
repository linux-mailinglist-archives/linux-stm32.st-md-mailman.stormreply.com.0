Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A477B33873C
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 09:23:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 518D6C5718B;
	Fri, 12 Mar 2021 08:23:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29642C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 08:22:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12C87ENI011910; Fri, 12 Mar 2021 09:22:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XlW6Z5yw5AsJwcv82qoU4SpNk3vVy8otngt/m5n7iak=;
 b=i2EY+EVGhiEqnx2xyLT1G2qvuwCE7hMQBcN5CqKh3LwqksG4v7mo1htt9BppVjPydmjL
 YvR3t0EUJTV4+58hqJP242ubsTC3HT1Bi65u51xtf1NCcv3wyHwlOEazclQIN+ivC0wJ
 57sE8dpfSLbupfcn4zbKlcxQ1vBimKPBKbPIHhPvPHT4+TM6HQjDrN1V0BBFS8ae5Xp0
 HqJcPLGc4wDevDYd4m1TdJ5I6TNHNiWkIwGigATHIQaxz+HnLxZL2XVwUiHqehYOcXrq
 SlzvYSTazDPy0hs8IipXKO5oI9DU59wGbWr8MJERbU5TewtBODVa8wN/k7ZI6MljKzgx oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrf4f81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 09:22:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E6D1910002A;
 Fri, 12 Mar 2021 09:22:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAE32225154;
 Fri, 12 Mar 2021 09:22:41 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 09:22:40 +0100
To: Marek Vasut <marex@denx.de>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Alexandre TORGUE <alexandre.torgue@st.com>, Alex G. <mr.nuke.me@gmail.com>,
 Gabriel FERNANDEZ - foss <gabriel.fernandez@foss.st.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Etienne CARRIERE <etienne.carriere@st.com>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <2e04f814-b694-119d-fe8a-13e6df129536@gmail.com>
 <AS8PR10MB4712C27260707345FA99ED5AEE909@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
 <c57775fe-41ef-07f5-56a2-04b8f70797c1@denx.de>
 <463dafed-ec60-cd9a-33d2-ba118a6af629@foss.st.com>
 <c1c9c89b-8794-9b91-b626-d743cd8ff31e@pengutronix.de>
 <b87a2b24-678a-724d-e5df-1eabf5969ad2@denx.de>
 <a23933fa-0c94-1e22-6100-d5b1a50826dd@foss.st.com>
 <58d107c4-eb3d-e49a-8377-007b6f21baf4@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <7f97031a-6cee-81fd-187c-5010307f21d7@foss.st.com>
Date: Fri, 12 Mar 2021 09:22:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <58d107c4-eb3d-e49a-8377-007b6f21baf4@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_02:2021-03-10,
 2021-03-12 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

SGkgTWFyZWsKCk9uIDMvMTEvMjEgOTowOSBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMy8x
MS8yMSA3OjEwIFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+PiBIaSBHdXlzCj4+Cj4+IE9u
IDMvMTEvMjEgNToxMSBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+PiBPbiAzLzExLzIxIDM6NDEg
UE0sIEFobWFkIEZhdG91bSB3cm90ZToKPj4+PiBIZWxsbywKPj4+Cj4+PiBIaSwKPj4+Cj4+Pj4g
T24gMTEuMDMuMjEgMTU6MDIsIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4+Pj4+IE9uIDMvMTEv
MjEgMTI6NDMgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4+Pj4gT24gMy8xMS8yMSA5OjA4IEFN
LCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+Pj4+Pj4+IDEtIEJyZWFrIHRoZSBjdXJyZW50IEFC
STogYXMgc29vbiBhcyB0aG9zZSBwYXRjaGVzIGFyZSBtZXJnZWQsIAo+Pj4+Pj4+IHN0bTMybXAx
NTdjLWRrMi5kdGIgd2lsbCBpbXBvc2UgdG8gdXNlCj4+Pj4+Pj4gQSB0Zi1hIGZvciBzY21pIGNs
b2Nrcy4gRm9yIHBlb3BsZSB1c2luZyB1LWJvb3Qgc3BsLCB0aGUgd2lsbCAKPj4+Pj4+PiBoYXZl
IHRvIGNyZWF0ZSB0aGVpciBvd24gIm5vLXNlY3VyZSIgZGV2aWNldHJlZS4KPj4+Pj4+Cj4+Pj4+
PiBOQUssIHRoaXMgYnJlYWtzIGV4aXN0aW5nIGJvYXJkcyBhbmQgZXhpc3Rpbmcgc2V0dXBzLCBl
LmcuIERLMiAKPj4+Pj4+IHRoYXQgZG9lcyBub3QgdXNlIEFURi4KPj4+Pj4+Cj4+Pj4+Pj4gMi1B
cyB5b3Ugc3VnZ2VzdCwgY3JlYXRlIGEgbmV3ICJzZWN1cmUiIGR0YiBwZXIgYm9hcmRzIChOb3Qg
bXkgCj4+Pj4+Pj4gd2lzaCBmb3IgbWFpbnRlbmFuY2UgcGVyc3BlY3RpdmVzKS4KPj4+Pj4+Cj4+
Pj4+PiBJIGFncmVlIHdpdGggQWxleCAoRykgdGhhdCB0aGUgInNlY3VyZSIgb3B0aW9uIHNob3Vs
ZCBiZSBvcHQtaW4uCj4+Pj4+PiBUaGF0IHdheSBleGlzdGluZyBzZXR1cHMgcmVtYWluIHdvcmtp
bmcgYW5kIG5vIGV4dHJhIHJlcXVpcmVtZW50cyAKPj4+Pj4+IGFyZSBpbXBvc2VkIG9uIE1QMSB1
c2Vycy4gRXNwLiBzaW5jZSBhcyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoaXMsIAo+Pj4+Pj4gdGhl
ICJzZWN1cmUiIHBhcnQgaXNuJ3QgcmVhbGx5IGFib3V0IHNlY3VyaXR5LCBidXQgcmF0aGVyIGFi
b3V0IAo+Pj4+Pj4gbW92aW5nIGNsb2NrIGNvbmZpZ3VyYXRpb24gZnJvbSBMaW51eCB0byBzb21l
IGZpcm13YXJlIGJsb2IuCj4+Pj4+Pgo+Pj4+Pj4+IDMtIEtlZXAga2VybmVsIGRldmljZSB0cmVl
IGFzIHRoZXkgYXJlIGFuZCBhcHBsaWVkIHRoaXMgc2VjdXJlIAo+Pj4+Pj4+IGxheWVyIChzY21p
IGNsb2NrcyBwaGFuZGxlKSB0aGFua3MgdG8gZHRibyBpbgo+Pj4+Pj4+IFUtYm9vdC4KPj4+Pj4+
Cj4+Pj4+PiBJcyB0aGlzIHJlYWxseSBiZXR0ZXIgdGhhbgo+Pj4+Pj4gI2luY2x1ZGUgInN0bTMy
bXAxNXh4LWVuYWJsZS1zZWN1cmUtc3R1ZmYuZHRzaSIKPj4+Pj4+IGluIGEgYm9hcmQgRFQgPyBC
ZWNhdXNlIHRoYXQgaXMgaG93IEkgaW1hZ2luZSB0aGUgb3B0LWluICJzZWN1cmUiIAo+Pj4+Pj4g
b3B0aW9uIGNvdWxkIHdvcmsuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBEaXNjdXNzaW5nIHdpdGggUGF0
cmljayBhYm91dCB1LWJvb3QsIHdlIGNvdWxkIHVzZSBkdGJvIGFwcGxpY2F0aW9uIAo+Pj4+PiB0
aGFua3MgdG8gZXh0bGludXguY29uZi4gQlVUIGl0IGl0IHdpbGwgbm90IHByZXZlbnQgb3RoZXIg
Y2FzZSAKPj4+Pj4gKGkuZS4gVEYtQSB3aGljaCBqdW1wIGRpcmVjdGx5IGluIGtlcm5lbEApLiBT
byB0aGUgImxlYXN0IHdvcnN0IiAKPj4+Pj4gc29sdXRpb24gaXMgdG8gY3JlYXRlIGEgbmV3ICJz
dG0zMm1wMTI1N2Mtc2NtaS1kazIgYm9hcmQgd2hpY2ggd2lsbCAKPj4+Pj4gb3ZlcmxvYWQgY2xv
Y2sgZW50cmllcyB3aXRoIGEgc2NtaSBwaGFuZGxlIChhcyBwcm9wb3NlZCBieSBBbGV4KS4KPj4+
Pgo+Pj4+IEkgcmFpc2VkIHRoaXMgaXNzdWUgYmVmb3JlIHdpdGggeW91ciBjb2xsZWFndWVzLiBJ
IHN0aWxsIGJlbGlldmUgdGhlIAo+Pj4+IGNvcnJlY3Qgd2F5Cj4+Pj4gd291bGQgYmUgZm9yIHRo
ZSBURi1BIHRvIHBhc3MgZG93biBlaXRoZXIgYSBkZXZpY2UgdHJlZSBvciBhbiAKPj4+PiBvdmVy
bGF5IHdpdGggdGhlCj4+Pj4gYWN0dWFsIHNldHRpbmdzIGluIHVzZSwgZS5nLjoKPj4+Pgo+Pj4+
IMKgwqAgLSBDbG9ja3MvUmVzZXRzIGRvbmUgdmlhIFNDTUkKPj4+PiDCoMKgIC0gUmVzZXJ2ZWQg
bWVtb3J5IHJlZ2lvbnMKPj4+Pgo+Pj4+IElmIFRGLUEgZGlyZWN0bHkgYm9vdHMgTGludXgsIGl0
IGNhbiBhcHBseSB0aGUgb3ZlcmxheSBpdHNlbGYsIAo+Pj4+IG90aGVyd2lzZSBpdCdzCj4+Pj4g
cGFzc2VkIGRvd24gdG8gU1NCTCB0aGF0IGFwcGxpZXMgaXQgYmVmb3JlIGJvb3RpbmcgTGludXgu
Cj4+Pgo+Pj4gVGhhdCBzb3VuZHMgZ29vZCBhbmQgaXQgaXMgc29tZXRoaW5nIGUuZy4gUi1DYXIg
YWxyZWFkeSBkb2VzLCBpdCAKPj4+IG1lcmdlcyBEVCBmcmFnbWVudCBmcm9tIHByaW9yIHN0YWdl
cyBhdCBVLUJvb3QgbGV2ZWwgYW5kIHRoZW4gcGFzc2VzIAo+Pj4gdGhlIHJlc3VsdCB0byBMaW51
eC4KPj4+Cj4+PiBTbyBvbiBTVCBoYXJkd2FyZSwgdGhlIHNhbWUgY291bGQgdmVyeSB3ZWxsIGhh
cHBlbiBhbmQgaXQgd291bGQgd29yayAKPj4+IGZvciBib3RoIG5vbi1BVEYgLyBBVEYgLyBBVEYr
VEVFIG9wdGlvbnMuCj4+Cj4+IEV2ZW4gdGhpcyBzb2x1dGlvbiBzb3VuZHMgZ29vZCBidXQgd2Ug
YXJlIGN1cnJlbnRseSBub3QgYWJsZSB0byBkbyBpdCAKPj4gaW4gb3VyIFRGLUEvdS1ib290IHNv
IG5vdCBmZWFzaWJsZSBmb3IgdGhlIG1vbWVudC4KPiAKPiBXaHkgbm90ID8gVS1Cb290IGlzIHBl
cmZlY3RseSBjYXBhYmxlIG9mIG1lcmdpbmcgcHJpb3Igc3RhZ2UgRFQgYW5kIERUIAo+IGxvYWRl
ZCBmcm9tIGVsc2V3aGVyZS4gU2VlIFItQ2FyMyBmb3IgZXhhbXBsZS4KCk9rLCBXZSB3aWxsIGNo
ZWNrIHdoYXQgaXQgaXMgcG9zc2libGUgdG8gZG8gYnkgdGhpcyB3YXkgYmVmb3JlIHRha2luZyBh
IApkZWNpc2lvbi4KClRoYW5rcwpBbGV4Cgo+IAo+PiBTbyB3ZSBoYXZlIHRvIGZpbmQgYSBzb2x1
dGlvbiBmb3Igbm93LiBDcmVhdGUgYSBuZXcgZHRiIGNhbiBiZSB0aGlzIAo+PiBzb2x1dGlvbi4g
T3VyIGludGVybmFsIHN0cmF0ZWd5IGlzIHRvIHVzZSBzY21pIG9uIG91ciBvZmZpY2lhbCBTVCAK
Pj4gYm9hcmQuIEl0IHdpbGwgYmUgYSByZWFsbHkgZHJhd2JhY2sgdG8gaW5jbHVkZSBhICJuby1z
Y21pLmR0c2kiIGluIERIIAo+PiBib2FyZHMgKGZvciBleGFtcGxlKSBhbmQgdG8gY3JlYXRlIGEg
c3RtMzJtcDE1N2Mtbm9zY21pLWRrMi5kdHMgPwo+IAo+IEkgd291bGQgaGlnaGx5IHByZWZlciB0
aGUgU0NNSSB0byBiZSBvcHQtaW4sIG5vdCBvcHQtb3V0Lgo+IAo+IEJ1dCBzdGlsbCwgaXNuJ3Qg
aXQgcG9zc2libGUgdG8gYXV0by1kZXRlY3QgdGhlIGJvYXJkIGNvbmZpZ3VyYXRpb24gaW4gCj4g
TGludXggYW5kIHBpY2sgdGhlIGNsb2NrIGVudW1lcmF0aW9uIGJhc2VkIG9uIHRoYXQgYXV0b21h
dGljYWxseSA/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
