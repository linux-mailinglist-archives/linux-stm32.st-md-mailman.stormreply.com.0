Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 956B4337BC9
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 19:10:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C874BC5718B;
	Thu, 11 Mar 2021 18:10:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 923FBC56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 18:10:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BI6KPK015201; Thu, 11 Mar 2021 19:10:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qHEy6o0gKkbchDz6JwjuptZPDfRUL1JtNLJSyPENx6Y=;
 b=C7bocA0sxPfM6qf68k4QiDiiEQvDgVHFbmvg5I5LDSzCCFCvqOmMN0Ee174/EY6WQ2Us
 643GQQiTxa9s3mQBB6lt7JVNPGKzpsuF3Co8gnyMDbrsVDr2ptLbv+ZAwJmi/x3B1BwZ
 cGzSBxdCV7UfdhM6bDU+HXc9NUdGtCclXkkwGVI+tUl0uuAAmOfyD39xzgdSBPlNM3mR
 ey963gfNsOVhiPldHpE/pjtRN9qfZhcb8nUY4YW6FimzuHptE4Q1Pe81DvrI66AZku/I
 1lFqoucqmnC0mQEdVSmkyrX78VGeP6qdXKeWWFiiVEmdd4gtmI/ABEtj9bAKwXHa3yVV +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y77s8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 19:10:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B21BC10002A;
 Thu, 11 Mar 2021 19:10:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92759266BDB;
 Thu, 11 Mar 2021 19:10:19 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar
 2021 19:10:17 +0100
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
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <a23933fa-0c94-1e22-6100-d5b1a50826dd@foss.st.com>
Date: Thu, 11 Mar 2021 19:10:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b87a2b24-678a-724d-e5df-1eabf5969ad2@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_08:2021-03-10,
 2021-03-11 signatures=0
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

SGkgR3V5cwoKT24gMy8xMS8yMSA1OjExIFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiAzLzEx
LzIxIDM6NDEgUE0sIEFobWFkIEZhdG91bSB3cm90ZToKPj4gSGVsbG8sCj4gCj4gSGksCj4gCj4+
IE9uIDExLjAzLjIxIDE1OjAyLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+Pj4gT24gMy8xMS8y
MSAxMjo0MyBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+Pj4gT24gMy8xMS8yMSA5OjA4IEFNLCBB
bGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+Pj4+PiAxLSBCcmVhayB0aGUgY3VycmVudCBBQkk6IGFz
IHNvb24gYXMgdGhvc2UgcGF0Y2hlcyBhcmUgbWVyZ2VkLCAKPj4+Pj4gc3RtMzJtcDE1N2MtZGsy
LmR0YiB3aWxsIGltcG9zZSB0byB1c2UKPj4+Pj4gQSB0Zi1hIGZvciBzY21pIGNsb2Nrcy4gRm9y
IHBlb3BsZSB1c2luZyB1LWJvb3Qgc3BsLCB0aGUgd2lsbCBoYXZlIAo+Pj4+PiB0byBjcmVhdGUg
dGhlaXIgb3duICJuby1zZWN1cmUiIGRldmljZXRyZWUuCj4+Pj4KPj4+PiBOQUssIHRoaXMgYnJl
YWtzIGV4aXN0aW5nIGJvYXJkcyBhbmQgZXhpc3Rpbmcgc2V0dXBzLCBlLmcuIERLMiB0aGF0IAo+
Pj4+IGRvZXMgbm90IHVzZSBBVEYuCj4+Pj4KPj4+Pj4gMi1BcyB5b3Ugc3VnZ2VzdCwgY3JlYXRl
IGEgbmV3ICJzZWN1cmUiIGR0YiBwZXIgYm9hcmRzIChOb3QgbXkgd2lzaCAKPj4+Pj4gZm9yIG1h
aW50ZW5hbmNlIHBlcnNwZWN0aXZlcykuCj4+Pj4KPj4+PiBJIGFncmVlIHdpdGggQWxleCAoRykg
dGhhdCB0aGUgInNlY3VyZSIgb3B0aW9uIHNob3VsZCBiZSBvcHQtaW4uCj4+Pj4gVGhhdCB3YXkg
ZXhpc3Rpbmcgc2V0dXBzIHJlbWFpbiB3b3JraW5nIGFuZCBubyBleHRyYSByZXF1aXJlbWVudHMg
Cj4+Pj4gYXJlIGltcG9zZWQgb24gTVAxIHVzZXJzLiBFc3AuIHNpbmNlIGFzIGZhciBhcyBJIHVu
ZGVyc3RhbmQgdGhpcywgCj4+Pj4gdGhlICJzZWN1cmUiIHBhcnQgaXNuJ3QgcmVhbGx5IGFib3V0
IHNlY3VyaXR5LCBidXQgcmF0aGVyIGFib3V0IAo+Pj4+IG1vdmluZyBjbG9jayBjb25maWd1cmF0
aW9uIGZyb20gTGludXggdG8gc29tZSBmaXJtd2FyZSBibG9iLgo+Pj4+Cj4+Pj4+IDMtIEtlZXAg
a2VybmVsIGRldmljZSB0cmVlIGFzIHRoZXkgYXJlIGFuZCBhcHBsaWVkIHRoaXMgc2VjdXJlIAo+
Pj4+PiBsYXllciAoc2NtaSBjbG9ja3MgcGhhbmRsZSkgdGhhbmtzIHRvIGR0Ym8gaW4KPj4+Pj4g
VS1ib290Lgo+Pj4+Cj4+Pj4gSXMgdGhpcyByZWFsbHkgYmV0dGVyIHRoYW4KPj4+PiAjaW5jbHVk
ZSAic3RtMzJtcDE1eHgtZW5hYmxlLXNlY3VyZS1zdHVmZi5kdHNpIgo+Pj4+IGluIGEgYm9hcmQg
RFQgPyBCZWNhdXNlIHRoYXQgaXMgaG93IEkgaW1hZ2luZSB0aGUgb3B0LWluICJzZWN1cmUiIAo+
Pj4+IG9wdGlvbiBjb3VsZCB3b3JrLgo+Pj4+Cj4+Pgo+Pj4gRGlzY3Vzc2luZyB3aXRoIFBhdHJp
Y2sgYWJvdXQgdS1ib290LCB3ZSBjb3VsZCB1c2UgZHRibyBhcHBsaWNhdGlvbiAKPj4+IHRoYW5r
cyB0byBleHRsaW51eC5jb25mLiBCVVQgaXQgaXQgd2lsbCBub3QgcHJldmVudCBvdGhlciBjYXNl
IChpLmUuIAo+Pj4gVEYtQSB3aGljaCBqdW1wIGRpcmVjdGx5IGluIGtlcm5lbEApLiBTbyB0aGUg
ImxlYXN0IHdvcnN0IiBzb2x1dGlvbiAKPj4+IGlzIHRvIGNyZWF0ZSBhIG5ldyAic3RtMzJtcDEy
NTdjLXNjbWktZGsyIGJvYXJkIHdoaWNoIHdpbGwgb3ZlcmxvYWQgCj4+PiBjbG9jayBlbnRyaWVz
IHdpdGggYSBzY21pIHBoYW5kbGUgKGFzIHByb3Bvc2VkIGJ5IEFsZXgpLgo+Pgo+PiBJIHJhaXNl
ZCB0aGlzIGlzc3VlIGJlZm9yZSB3aXRoIHlvdXIgY29sbGVhZ3Vlcy4gSSBzdGlsbCBiZWxpZXZl
IHRoZSAKPj4gY29ycmVjdCB3YXkKPj4gd291bGQgYmUgZm9yIHRoZSBURi1BIHRvIHBhc3MgZG93
biBlaXRoZXIgYSBkZXZpY2UgdHJlZSBvciBhbiBvdmVybGF5IAo+PiB3aXRoIHRoZQo+PiBhY3R1
YWwgc2V0dGluZ3MgaW4gdXNlLCBlLmcuOgo+Pgo+PiDCoMKgIC0gQ2xvY2tzL1Jlc2V0cyBkb25l
IHZpYSBTQ01JCj4+IMKgwqAgLSBSZXNlcnZlZCBtZW1vcnkgcmVnaW9ucwo+Pgo+PiBJZiBURi1B
IGRpcmVjdGx5IGJvb3RzIExpbnV4LCBpdCBjYW4gYXBwbHkgdGhlIG92ZXJsYXkgaXRzZWxmLCAK
Pj4gb3RoZXJ3aXNlIGl0J3MKPj4gcGFzc2VkIGRvd24gdG8gU1NCTCB0aGF0IGFwcGxpZXMgaXQg
YmVmb3JlIGJvb3RpbmcgTGludXguCj4gCj4gVGhhdCBzb3VuZHMgZ29vZCBhbmQgaXQgaXMgc29t
ZXRoaW5nIGUuZy4gUi1DYXIgYWxyZWFkeSBkb2VzLCBpdCBtZXJnZXMgCj4gRFQgZnJhZ21lbnQg
ZnJvbSBwcmlvciBzdGFnZXMgYXQgVS1Cb290IGxldmVsIGFuZCB0aGVuIHBhc3NlcyB0aGUgcmVz
dWx0IAo+IHRvIExpbnV4Lgo+IAo+IFNvIG9uIFNUIGhhcmR3YXJlLCB0aGUgc2FtZSBjb3VsZCB2
ZXJ5IHdlbGwgaGFwcGVuIGFuZCBpdCB3b3VsZCB3b3JrIGZvciAKPiBib3RoIG5vbi1BVEYgLyBB
VEYgLyBBVEYrVEVFIG9wdGlvbnMuCgpFdmVuIHRoaXMgc29sdXRpb24gc291bmRzIGdvb2QgYnV0
IHdlIGFyZSBjdXJyZW50bHkgbm90IGFibGUgdG8gZG8gaXQgaW4gCm91ciBURi1BL3UtYm9vdCBz
byBub3QgZmVhc2libGUgZm9yIHRoZSBtb21lbnQuIFNvIHdlIGhhdmUgdG8gZmluZCBhIApzb2x1
dGlvbiBmb3Igbm93LiBDcmVhdGUgYSBuZXcgZHRiIGNhbiBiZSB0aGlzIHNvbHV0aW9uLiBPdXIg
aW50ZXJuYWwgCnN0cmF0ZWd5IGlzIHRvIHVzZSBzY21pIG9uIG91ciBvZmZpY2lhbCBTVCBib2Fy
ZC4gSXQgd2lsbCBiZSBhIHJlYWxseSAKZHJhd2JhY2sgdG8gaW5jbHVkZSBhICJuby1zY21pLmR0
c2kiIGluIERIIGJvYXJkcyAoZm9yIGV4YW1wbGUpIGFuZCB0byAKY3JlYXRlIGEgc3RtMzJtcDE1
N2Mtbm9zY21pLWRrMi5kdHMgPwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
