Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3C3374D8
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 15:02:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4CC4C5718B;
	Thu, 11 Mar 2021 14:02:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1CFAC56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 14:02:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BDr49X012823; Thu, 11 Mar 2021 15:02:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VheNzLrFxYB1EQeG7z/TCX/Dds7xR+5hetwpuM+k8Vk=;
 b=b//XPyxZatz4royLbgHhDPlO3eXmpQa8IGf/z7IJXrXrDNLwIvLYiUYbcE46nIhIi+YN
 miW6yXJHJXT6XWd6bAW/0kF9WyAbD3SGMGxsBJCcBrJvpUizxeyRfuH2RAw/SAZN92Xb
 Fo+I9VJ8nS9+t8eJ6fgsPvtCOySfiQRSjnnXf6TiMDlJsamDUE0dRC/36KkDsLXIcrDN
 wXnXCdz5njBhfh/60iQVE87cgIAKD2/giVXz9kRHRiHG09XHbrMXUJZPxZf5PWLRE2+7
 JN/QoBQGW77BTv2jK5apRVwkGDSsvsuUu2OugHijUmw+ThwdriefcSCSL9SUJalRNE7w /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yreyxf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 15:02:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AD56610002A;
 Thu, 11 Mar 2021 15:02:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A778248EDA;
 Thu, 11 Mar 2021 15:02:35 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar
 2021 15:02:34 +0100
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
Message-ID: <463dafed-ec60-cd9a-33d2-ba118a6af629@foss.st.com>
Date: Thu, 11 Mar 2021 15:02:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c57775fe-41ef-07f5-56a2-04b8f70797c1@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_05:2021-03-10,
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

SGkKCk9uIDMvMTEvMjEgMTI6NDMgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDMvMTEvMjEg
OTowOCBBTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4gSGkgQUxleAo+IAo+IEhlbGxvIGV2
ZXJ5b25lLAo+IAo+IFsuLi5dCj4gCj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAwLzE0XSBJ
bnRyb2R1Y2UgU1RNMzJNUDEgUkNDIGluIHNlY3VyZWQgbW9kZQo+Pj4KPj4+IE9uIDEvMjYvMjEg
MzowMSBBTSwgZ2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20gd3JvdGU6Cj4+Pj4gRnJvbTog
R2FicmllbCBGZXJuYW5kZXogPGdhYnJpZWwuZmVybmFuZGV6QGZvc3Muc3QuY29tPgo+Pj4+Cj4+
Pj4gUGxhdGZvcm0gU1RNMzJNUDEgY2FuIGJlIHVzZWQgaW4gY29uZmlndXJhdGlvbiB3aGVyZSBz
b21lIGNsb2NrcyBhbmQKPj4+PiBJUCByZXNldHMgY2FuIHJlbGF0ZSBhcyBzZWN1cmUgcmVzb3Vy
Y2VzLgo+Pj4+IFRoZXNlIHJlc291cmNlcyBhcmUgbW92ZWQgZnJvbSBhIFJDQyBjbG9jay9yZXNl
dCBoYW5kbGUgdG8gYSBTQ01JCj4+Pj4gY2xvY2svcmVzZXRfZG9tYWluIGhhbmRsZS4KPj4+Pgo+
Pj4+IFRoZSBSQ0MgY2xvY2sgZHJpdmVyIGlzIG5vdyBkZXBlbmRlbnQgb2YgdGhlIFNDTUkgZHJp
dmVyLCB0aGVuIHdlIGhhdmUKPj4+PiB0byBtYW5hZ2Ugbm93IHRoZSBwcm9iZSBkZWZlcmluZy4K
Pj4+Pgo+Pj4+IHYxIC0+IHYyOgo+Pj4+IMKgwqDCoCAtIGZpeCB5YW1sbGludCB3YXJuaW5ncy4K
Pj4+Cj4+PiBIaSBHYWJyaWVsLAo+Pj4KPj4+IEkgZG9uJ3QgaGF2ZSBtdWNoIGNsb3V0IHdpdGgg
dGhlIG1haW50YWluZXJzLCBidXQgSSBoYXZlIHRvIE5BSyB0aGlzIAo+Pj4gc2VyaWVzCj4+PiBh
ZnRlciBmaW5kaW5nIG1ham9yIGJyZWFrYWdlLgo+Pj4KPj4+IFRoZSBwcm9ibGVtIHdpdGggc2Vy
aWVzIGlzIHRoYXQgaXQgYnJlYWtzIHByZXR0eSBtdWNoIGV2ZXJ5IGJvYXJkIGl0IAo+Pj4gdG91
Y2hlcy4KPj4+IEkgaGF2ZSBhIERLMiBoZXJlIHRoYXQgSSdtIHVzaW5nIGZvciBkZXZlbG9wbWVu
dCwgd2hpY2ggbm8gbG9uZ2VyIAo+Pj4gYm9vdHMgd2l0aAo+Pj4gdGhpcyBzZXJpZXMgYXBwbGll
ZC4KPj4+Cj4+PiBUaGUgY3J1eCBvZiB0aGUgbWF0dGVyIGlzIHRoYXQgdGhpcyBzZXJpZXMgYXNz
dW1lcyBhbGwgYm9hcmRzIHdpbGwgCj4+PiBib290IHdpdGggYW4KPj4+IEZTQkwgdGhhdCBpbXBs
ZW1lbnRzIGEgdmVyeSBzcGVjaWZpYyBTQ01JIGNsb2NrIHRyZWUuIFRoaXMgaXMgbWFqb3IgQUJJ
Cj4+PiBicmVha2FnZSBmb3IgYW55b25lIG5vdCB1c2luZyBURi1BIGFzIHRoZSBmaXJzdCBzdGFn
ZSBib290bG9hZGVyLiBBbnlvbmUKPj4+IHVzaW5nIHUtYm9vdCBTUEwgaXMgc2NyZXdlZC4KPj4+
Cj4+PiBUaGlzIHNlcmllcyBpbXBvc2VzIGEgU09DLXdpZGUgY2hhbmdlIHZpYSB0aGUgZHRzaSBm
aWxlcy4gU28gZXZlbiAKPj4+IGJvYXJkcyB0aGF0Cj4+PiB5b3UgZG9uJ3QgaW50ZW5kIHRvIGNv
bnZlcnQgdG8gU0NNSSB3aWxsIGdldCBicm9rZW4gdGhpcyB3YXkuCj4+PiBBZGRpbmcgYSAtbm8t
c2NtaSBmaWxlIHRoYXQgaXNuJ3QgdXNlZCBhbnl3aGVyZSBkb2Vzbid0IGhlbHAgdGhpbmdzLgo+
Pgo+PiBZb3UgYXJlIHJpZ2h0LiBXZSBtYWlubHkgdGFrZSBjYXJlIGFib3V0IE5PIFNUIChESC8u
Li4pIGJvYXJkcywgYnV0ICAKPj4gbm90IHJlYWxseSBhYm91dCBjdXJyZW50IHVzYWdlCj4+IE9m
IG91ciBzdG0zMiBib2FyZHMuIFNldmVyYWwgb3B0aW9ucyBleGlzdDoKPiAKPiBTaW5jZSBhIGxv
dCBvZiBwZW9wbGUgYmVuZWZpdCBmcm9tIHRoZSBnb29kIHVwc3RyZWFtIHN1cHBvcnQgZm9yIHRo
ZSBNUDEgCj4gX2FuZF8ga2VlcCB1cGRhdGluZyB0aGVpciBtYWNoaW5lcyB0byBnZXQgdGhlIGxh
dGVzdCBmaXhlcywgaXQgaXMgdmVyeSAKPiBpbXBvcnRhbnQgdG8ga2VlcCB0aGUgY3VycmVudCB1
c2FnZSB3b3JraW5nLgo+IAo+PiAxLSBCcmVhayB0aGUgY3VycmVudCBBQkk6IGFzIHNvb24gYXMg
dGhvc2UgcGF0Y2hlcyBhcmUgbWVyZ2VkLCAKPj4gc3RtMzJtcDE1N2MtZGsyLmR0YiB3aWxsIGlt
cG9zZSB0byB1c2UKPj4gQSB0Zi1hIGZvciBzY21pIGNsb2Nrcy4gRm9yIHBlb3BsZSB1c2luZyB1
LWJvb3Qgc3BsLCB0aGUgd2lsbCBoYXZlIHRvIAo+PiBjcmVhdGUgdGhlaXIgb3duICJuby1zZWN1
cmUiIGRldmljZXRyZWUuCj4gCj4gTkFLLCB0aGlzIGJyZWFrcyBleGlzdGluZyBib2FyZHMgYW5k
IGV4aXN0aW5nIHNldHVwcywgZS5nLiBESzIgdGhhdCBkb2VzIAo+IG5vdCB1c2UgQVRGLgo+IAo+
PiAyLUFzIHlvdSBzdWdnZXN0LCBjcmVhdGUgYSBuZXcgInNlY3VyZSIgZHRiIHBlciBib2FyZHMg
KE5vdCBteSB3aXNoIAo+PiBmb3IgbWFpbnRlbmFuY2UgcGVyc3BlY3RpdmVzKS4KPiAKPiBJIGFn
cmVlIHdpdGggQWxleCAoRykgdGhhdCB0aGUgInNlY3VyZSIgb3B0aW9uIHNob3VsZCBiZSBvcHQt
aW4uCj4gVGhhdCB3YXkgZXhpc3Rpbmcgc2V0dXBzIHJlbWFpbiB3b3JraW5nIGFuZCBubyBleHRy
YSByZXF1aXJlbWVudHMgYXJlIAo+IGltcG9zZWQgb24gTVAxIHVzZXJzLiBFc3AuIHNpbmNlIGFz
IGZhciBhcyBJIHVuZGVyc3RhbmQgdGhpcywgdGhlIAo+ICJzZWN1cmUiIHBhcnQgaXNuJ3QgcmVh
bGx5IGFib3V0IHNlY3VyaXR5LCBidXQgcmF0aGVyIGFib3V0IG1vdmluZyBjbG9jayAKPiBjb25m
aWd1cmF0aW9uIGZyb20gTGludXggdG8gc29tZSBmaXJtd2FyZSBibG9iLgo+IAo+PiAzLSBLZWVw
IGtlcm5lbCBkZXZpY2UgdHJlZSBhcyB0aGV5IGFyZSBhbmQgYXBwbGllZCB0aGlzIHNlY3VyZSBs
YXllciAKPj4gKHNjbWkgY2xvY2tzIHBoYW5kbGUpIHRoYW5rcyB0byBkdGJvIGluCj4+IFUtYm9v
dC4KPiAKPiBJcyB0aGlzIHJlYWxseSBiZXR0ZXIgdGhhbgo+ICNpbmNsdWRlICJzdG0zMm1wMTV4
eC1lbmFibGUtc2VjdXJlLXN0dWZmLmR0c2kiCj4gaW4gYSBib2FyZCBEVCA/IEJlY2F1c2UgdGhh
dCBpcyBob3cgSSBpbWFnaW5lIHRoZSBvcHQtaW4gInNlY3VyZSIgb3B0aW9uIAo+IGNvdWxkIHdv
cmsuCj4gCgpEaXNjdXNzaW5nIHdpdGggUGF0cmljayBhYm91dCB1LWJvb3QsIHdlIGNvdWxkIHVz
ZSBkdGJvIGFwcGxpY2F0aW9uIAp0aGFua3MgdG8gZXh0bGludXguY29uZi4gQlVUIGl0IGl0IHdp
bGwgbm90IHByZXZlbnQgb3RoZXIgY2FzZSAoaS5lLiAKVEYtQSB3aGljaCBqdW1wIGRpcmVjdGx5
IGluIGtlcm5lbEApLiBTbyB0aGUgImxlYXN0IHdvcnN0IiBzb2x1dGlvbiBpcyAKdG8gY3JlYXRl
IGEgbmV3ICJzdG0zMm1wMTI1N2Mtc2NtaS1kazIgYm9hcmQgd2hpY2ggd2lsbCBvdmVybG9hZCBj
bG9jayAKZW50cmllcyB3aXRoIGEgc2NtaSBwaGFuZGxlIChhcyBwcm9wb3NlZCBieSBBbGV4KS4K
CkdhYnJpZWwsIGNhbiB5b3Ugd2FpdCBhIGJpdCBiZWZvcmUgc2VuZGluZyBzb21ldGhpbmcgYWJv
dXQgU0NNSSBpbiBkdHNpLCAKSSB3b3VsZCBsaWtlIHRvIGFsaWduIHRoaXMgc3RyYXRlZ3kgaW50
ZXJuYWxseS4KCk1hcmVrLCBBbGV4OiB0aGFua3MgZm9yIHlvdXIgaW5wdXRzLgoKUmVnYXJkcwpB
bGV4Cgo+PiBUaGUgdGhpcmQgY291bGQgYmUgdGhlIGxlc3MgY29zdGx5Lgo+IAo+IFsuLi5dCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
