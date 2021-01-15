Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0363D2F7F68
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jan 2021 16:22:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84AA3C424C0;
	Fri, 15 Jan 2021 15:22:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B95CFC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 15:22:25 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10FFI6lC021147; Fri, 15 Jan 2021 16:22:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=y6Xs9wQISSGQPihP3xr3Zv42e4T45Xvi3vnxSWS3kN8=;
 b=jjv/h2dR1nUhoe5fkbnxw3Rg+zi8n0dNGPSgzkmMGq+8dzHfHs03w+D/srG+vUZNm4t7
 M97QHFxU2fX3qtP+eSEylzE8oHH/gbv6AxLJ6alI40OYUB1rjrEG7sY01f7v7iNHMC1s
 yfvDmfFNPfQ9hBKJR/JslGHyDwL/Ijja0QqsUcUNB4lVGxNKK/mM5yECkrUvghtcrbf7
 yz+Qba+kOrA8g+Npk+L1n1qZC0bBtX8SqcELW1wYgchTkWJqt1DIRNFAW4LmBXsz82lJ
 CI18hkEjUPPkK4CSleMSpUrPaz/Yzz8F4/lQ3VBPeLimC1fxfHV2yzijDNEn55TM04lk cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5gxmb4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 16:22:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 16E8410002A;
 Fri, 15 Jan 2021 16:22:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 04F5B2519C3;
 Fri, 15 Jan 2021 16:22:17 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Jan
 2021 16:22:16 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210106204347.475920-1-marex@denx.de>
 <20210106204347.475920-3-marex@denx.de>
 <e7ccdf7c-c7fa-4d03-2400-d4d89815d5d0@foss.st.com>
 <73f6d2cc-8dd7-b005-7faa-db9956f46aa5@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <332e7c43-8489-d8b2-e8e1-1fb0d6fde1ee@foss.st.com>
Date: Fri, 15 Jan 2021 16:22:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <73f6d2cc-8dd7-b005-7faa-db9956f46aa5@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_08:2021-01-15,
 2021-01-15 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH 3/4] [RFC] ARM: dts: stm32: Add mux for
	ETHRX clock
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

CgpPbiAxLzE1LzIxIDE6MTUgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDEvMTQvMjEgNjow
OCBQTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4gSGkgTWFyZWsKPiAKPiBIaSwKPiAKPj4g
T24gMS82LzIxIDk6NDMgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gVGhlIGltcGxlbWVudGF0
aW9uIG9mIEVUSF9SWF9DTEsvRVRIX1JFRl9DTEsgaGFuZGxpbmcgY3VycmVudGx5IGRvZXMgbm90
Cj4+PiBwZXJtaXQgc2VsZWN0aW5nIHRoZSBjbG9jayBpbnB1dCBmcm9tIFNvQyBwYWQuIFRvIG1h
a2UgdGhpbmdzIHdvcnNlLCB0aGUKPj4+IGltcGxlbWVudGF0aW9uIG9mIHRoaXMgaXMgcGFydGx5
IHByZXNlbnQgYW5kIGlzIHNwbGl0IGJldHdlZW4gdGhlIGNsb2NrCj4+PiBkcml2ZXIgYW5kIGR3
bWFjNCBkcml2ZXIuIE1vcmVvdmVyLCB0aGUgRVRIUlggY2xvY2sgcGFyZW50IGlzIGluY29ycmVj
dC4KPj4KPj4gU29ycnkgYnV0IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGljaCBjb25maWd1cmF0aW9u
IGlzIG1pc3NpbmcuIEkgdGhpbmsgCj4+IHdlIGNhbiBoYW5kbGUgYWxsIHBvc3NpYmxlIGNhc2Vz
IGZvciBSTUlJLiBBdCB0aGUgZ2x1ZSBsYXllciAKPj4gKGR3bWFjLXN0bTMyLmMpIGNsb2NrcyBn
YXRlcyBhbmQgc3lzY2ZnIGFyZSBzZXQgcmVnYXJkaW5nIGRldmljZSB0cmVlIAo+PiBiaW5kaW5n
IChzZWUgdGhlIHRhYiBpbiBkd21hYy1zdG0zMi5jKS4gWW91IGNvdWxkIGhhdmUgYSBsb29rIGhl
cmUgZm9yIAo+PiBtb3JlIGRldGFpbHM6IAo+PiBodHRwczovL3dpa2kuc3QuY29tL3N0bTMybXB1
L3dpa2kvRXRoZXJuZXRfZGV2aWNlX3RyZWVfY29uZmlndXJhdGlvbgo+Pgo+PiBSZWdhcmRpbmcg
dGhlIGNsb2NrIHBhcmVudCwgeWVzIGl0IGlzIG5vdCBhdCB0aGUgd2VsbCBmcmVxdWVuY3kgaWYg
eW91IAo+PiB3YW50IHRvIHNlbGVjdCB0aGlzIHBhdGguIE91ciBjdXJyZW50ICJjbG9jayB0cmVl
IiBpcyBkb25lIHRvIGZpdCB3aXRoIAo+PiBvdXIgU1QgcmVmZXJlbmNlIGJvYXJkcyAod2UgaGF2
ZSBtb3JlIHBlcmlwaGVyYWxzIHRoYW4gUExMIG91dHB1dHMgc28gCj4+IHdlIGhhdmUgdG8gbWFr
ZSBjaG9pY2VzKS4gU28geWVzIGZvciBjdXN0b21lci9wYXJ0bmVycyBib2FyZHMgdGhpcyAKPj4g
Y2xvY2sgdHJlZSBoYXMgdG8gYmUgbW9kaWZpZWQgdG8gYmV0dGVyIGZpdCB3aXRoIHRoZSBuZWVk
IChlaXRoZXIgCj4+IHVzaW5nIGFzc2lnbmVkLWNsb2NrLXBhcmVudCBvciBieSBtb2RpZnlpbmcg
Ym9vdGxvYWRlciBjbG9jayB0cmVlIAo+PiAodGYtYSBvciB1LWJvb3QpKS4KPiAKPiBJIGRvbid0
IHRoaW5rIHlvdSBoYW5kbGUgYWxsIHRoZSBjb25maWd1cmF0aW9uIG9wdGlvbnMsIGJ1dCBJIG1p
Z2h0IGFsc28gCj4gYmUgY29uZnVzZWQuCj4gCj4gU2VlIEZpZ3VyZSA4My4gUGVyaXBoZXJhbCBj
bG9jayBkaXN0cmlidXRpb24gZm9yIEV0aGVybmV0IGluIHRoZSBNUDEgCj4gZGF0YXNoZWV0IGZv
ciB0aGUgYmVsb3cuCj4gCj4gVGhlIGN1cnJlbnQgc2V0dXAgSSBoYXZlIG5lZWRzIDUwIE1IeiBv
biBTb0MgcGFkIFBBMSB0byBkcml2ZSB0aGUgUEhZIAo+IGNsb2NrLCBhbmQgdXNlcyBldGhfY2xr
X2ZiIHRvIHN1cHBseSBFVEhfUlhfQ0xLLiBIb3dldmVyLCB0aGUgNTAgTUh6IGlzIAo+IHNvdXJj
ZWQgZGlyZWN0bHkgZnJvbSBQTEw0UCwgd2hpY2ggdGhlbiBoYXMgdG8gcnVuIGF0IDUwIE1IeiBh
bmQgdGhhdCBpbiAKPiB0dXJuIHJlZHVjZXMgY2xvY2sgZnJlcXVlbmN5IGZvciBvdGhlciBibG9j
a3MgY29ubmVjdGVkIHRvIFBMTDRQIChlLmcuIAo+IFNETU1DLCB3aGVyZSB0aGUgaW1wYWN0IGlz
IG5vdGljYWJsZSkuCgpPayB0aGF0J3MgdGhlIGNvbW1vbiBwYXRoIHRvIGNsb2NrIGEgUEhZIGEg
NTBNSHogd2l0aG91dCB1c2luZyB0aGUgCnJlZl9jbGsgY29taW5nIGZyb20gdGhlIFBIWS4gQW5k
IHllcyBJIGNhbiB1bmRlcnN0YW5kIHRoYXQgdGhlIGRyYXdiYWNrIAppcyBodWdlKS4KCj4gCj4g
U28sIHdoYXQgSSB3YW50IHRvIG1vZGVsIGhlcmUgaXMgdGhpczoKPiAKPiBQTEw0UCA9IDEwMCBN
SHoKPiBNQ08yIGlzIHN1cHBsaWVkIGJ5IFBMTDRQIGFuZCBzZXQgdG8gLzIgLCBzbyBNQ08yID0g
NTAgTUh6Cj4gU29DIHBhZCBQRzIgaXMgc2V0IGFzIE1DTzIgb3V0cHV0LCB0aHVzIGEgc291cmNl
IG9mIDUwIE1IeiBzaWduYWwKPiBTb0MgcGFkIFBBMSBpcyBzZXQgYXMgRVRIX1JYX0NMSyBhbmQg
Y29ubmVjdGVkIHRvIFBHMgoKT2sgSSBzZWUgKHRvIGJlIGhvbmVzdCBJSVdSIHdlIGRpZG4ndCB0
ZXN0IGkgOiQpIGJ1dCBpdCBzaG91bGQgd29yay4KCj4gVGhpcyB3b3JrcyBmaW5lIGluIHByYWN0
aWNlLCBleGNlcHQgaXQgY2Fubm90IGJlIG1vZGVsZWQgdXNpbmcgY3VycmVudCAKPiBEVCBiaW5k
aW5ncywgZXZlbiB0aG91Z2ggaXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIG1vZGVsIGl0LgoKRm9y
IGR3bWFjIHBvaW50IG9mIHZpZXcgaXQncyBxdWl0ZSB0aGUgc2FtZSB0aGluZyB0byBoYXZlIHlv
dXIgUEhZIApjbG9ja2luZyBieSBNQ08gb3IgYnkgYSBjcnlzdGFsLiBZb3UganVzdCBuZWVkIHRv
IGNvbmZpZ3VyZSBSWF9SRUYgcGFkIAphbmQgRVRIX0NMS19TRUwgdG8gZ2V0IHRoZSA1MCBNSHog
Uk1JSSByZWZlcmVuY2UgY2xvY2suCgo+IAo+Pj4gRmlyc3QsIHRoZSBFVEhSWCBjbG9jayBpbiBj
bGstc3RtMzJtcDEuYyBvbmx5IHJlcHJlc2VudHMgdGhlIEVUSFJYRU4gCj4+PiBnYXRlLAo+Pj4g
aG93ZXZlciBpdCBzaG91bGQgcmVwcmVzZW50IGFsc28gRVRIX1JFRl9DTEtfU0VMIG11eC4gVGhl
IHByb2JsZW0gaXMgCj4+PiB0aGF0Cj4+PiB0aGUgRVRIX1JFRl9DTEtfU0VMIG11eCBpcyBjdXJy
ZW50bHkgY29uZmlndXJlZCBpbiB0aGUgRFdNQUM0IGRyaXZlciBhbmQKPj4+IHRoZSBFVEhfUkVG
X0NMS19TRUwgYml0IGlzIHBhcnQgb2YgU1lTQ0ZHIGJsb2NrLCBub3QgdGhlIERXTUFDNCBvciB0
aGUKPj4+IGNsb2NrIGJsb2NrLgo+Pgo+PiBkd21hYzQtc3RtMzIgZG9lc24ndCBjb250YWluIGNv
ZGUgZm9yIGR3bWFjNCBidXQgaXQgY29udGFpbnMgdGhlIGdsdWUgCj4+IGFyb3VuZCB0aGUgZHdt
YWM0OiBzeXNjZmcsIGNsb2NrcyAuLi4KPiAKPiBUaGUgcHJvYmxlbSBpcyB0aGF0IGR3bWFjNC1z
dG0zMiBpc24ndCB0aGUgcmlnaHQgcGxhY2UgdG8gY29uZmlndXJlIHRoZSAKPiBFVEhSWCBjbG9j
ayBtdXgsIHRoYXQgc2hvdWxkIGJlIGluIHRoZSBjbG9jayBkcml2ZXIuIFNvIHRoZSBzdG0zMiBj
bG9jayAKPiBkcml2ZXIgc2hvdWxkIGhhdmUgU1lTQ0ZHIGhhbmRsZSBhbmQgY29uZmlndXJlIEVU
SF9SRUZfQ0xLX1NFTCBtdXguIFRoZSAKPiAic3QsZXRoLXJlZi1jbGstc2VsIiBEVCBwcm9wIHdv
dWxkIHRoZW4gbm90IGJlIG5lZWRlZCBhdCBhbGwsIGFzIHRoZSAKPiByZWZlcmVuY2UgY2xvY2sg
c2VsZWN0IHdvdWxkIGJlIGNvbmZpZ3VyZWQgdXNpbmcgYXNzaWduZWQtY2xvY2tzIGluIERULgoK
SWRlYSB3YXMgdG8ga2VlcCBhdCB0aGUgc2FtZSBwbGFjZSB0aGUgRXRoZXJuZXQgZ2x1ZSBjb25m
aWd1cmF0aW9uLiBXZSAKY2FuJ3QgbW92ZSBhbGwgdGhpcyBnbHVlIGludG8gY2xvY2sgZHJpdmVy
IGFzIHBoeSBpbnRlcmZhY2UgaXMgbmVlZGVkIHRvIAp3ZWxsIGNvbmZpZ3VyZSBzb21lIHN5c2Nv
bmYgcmVnaXN0ZXJzLiBDdXJyZW50IGR3YW1jLXN0bTMyIGdsdWUgaXMgCndvcmtpbmcgYW5kIGRv
Y3VtZW50ZWQuIEknbSBub3QgY29udmluY2VkIHRvIGRldmVsb3AgYSBuZXcgb25lIGJ5IApzcGxp
dHRpbmcgY2xvY2sgc3lzY29uZiBpbiBjbG9jayBkcml2ZXIgYW5kIHBoeSBpbnRlcmZhY2UgbWFu
YWdlbWVudCBhdCAKZXRoZXJuZXQgbGV2ZWwuIEkgdGhpbmsgd2Ugd2lsbCBnZXQgdGhlIHNhbWUg
ZnVuY3Rpb25hbCByZXN1bHQgKGJ1dCB5ZXMgCm1heWJlIG1vcmUgdW5kZXJzdGFuZGFibGUgYXQg
ZHQtYmluZGluZ3MgbGV2ZWwpLiBXZSBjb3VsZCBtYXliZSB1cGRhdGUgCmJpbmRpbmcgbmFtZSB0
byBiZSBtb3JlIGNsZWFyLgoKPiAKPiBUaGUgZGVmYXVsdCBhc3NpZ25lZC1jbG9ja3Mgc2hvdWxk
IGJlIGV0aF9jbGtfZmIgLCBidXQgdGhlIHVzZXIgY2FuIAo+IG92ZXJyaWRlIGl0IGluIHRoZSBE
VCBhbmQgcHJvdmlkZSBhbm90aGVyIGNsb2NrIHNvdXJjZSAoZS5nLiBpbiBteSBjYXNlLCAKPiB0
aGF0IHdvdWxkIGJlIFBMTDRQLT5NQ08yLT5FVEhSWCkuCj4gCj4+PiBTZWNvbmQsIHRoZSBFVEhS
WCBwYXJlbnQgY2xvY2sgaXMgZWl0aGVyIGV0aF9jbGtfZmIgKEVUSENLX0spIG9yIAo+Pj4gZXh0
ZXJuYWwKPj4+IEVUSF9SWF9DTEsvRVRIX1JFRl9DTEtfU0VMLCBpdCBpcyBuZXZlciBDS19BWEku
Cj4+Cj4+IFdoeSBDS19BWEkgPwo+IAo+IFNlZSBkcml2ZXJzL2Nsay9jbGstc3RtMzJtcDEuYzoK
PiAgwqAgMTg5NcKgwqDCoMKgwqDCoMKgwqDCoCBQQ0xLKEVUSFJYLCAiZXRocngiLCAiY2tfYXhp
IiwgMCwgR19FVEhSWCksCj4KCk9rIEkgc2VlLCBhbmQgaXQgaXMgdGhlIHNhbWUgY2FzZSBmb3Ig
VFggYWxzby4gRGlzY3Vzc2luZyB3aXRoIG91ciBjbG9jayAKZXhwZXJ0IGl0IHdhcyBkb25lIGZv
ciBzaW1wbGlmaWNhdGlvbi4KCnJlZ2FyZHMKQWxleAoKCj4gWy4uLl0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
