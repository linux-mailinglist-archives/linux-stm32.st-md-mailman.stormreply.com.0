Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A1A47D82
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 13:22:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C2AFC7A822;
	Thu, 27 Feb 2025 12:22:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DEB9C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 12:22:43 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R9fYMn007889;
 Thu, 27 Feb 2025 13:22:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 kjFTq1l5h2rlORWEgpooT7HwJNfav0oSiejMbAdGK3o=; b=SRRlZt6Sw7e5ZK98
 lQkdMkpIfoU175HX9Egzrs1mTprxOEp3JujprooTEmmbpPtUwxZjiPGSYH13peF1
 GmJ2a3Lc0iSuoXnltuO36Vjz7IXtmSyjtmkC5J7gL5mNXnAwoODKNmbjULxnE5+W
 2PaELkUFr+Ay+wj/xVVTOuo9GSNSzGUPi2eoENuWEK80lPtRaxZ0kSlFI0xWaNd6
 O06lTozYVrE4YU8ov+C/bqWS4+Ek76Nupm3LKaHj7lej6anryptwMNTtkweKnJfH
 k4/zK8egwimZ2C0T1v4v3McLNppbIbnj10uS7MhblwklttMqT8ztp9vBU4TMhTr3
 DNW8mQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psrjhgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2025 13:22:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CD73940044;
 Thu, 27 Feb 2025 13:21:54 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8CD2841E17D;
 Thu, 27 Feb 2025 13:21:39 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 13:21:39 +0100
Message-ID: <a280b07d-f0f8-403f-b3fd-3bc2525a44cc@foss.st.com>
Date: Thu, 27 Feb 2025 13:21:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Parant <C.Parant@phytec.fr>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20250110150216.309760-1-c.parant@phytec.fr>
 <5467805a-c8a7-4c09-9ff5-1cf77541c3fb@foss.st.com>
 <d4f9b1513c695f75f74774d601c6b9f6a2858bc4.camel@phytec.fr>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <d4f9b1513c695f75f74774d601c6b9f6a2858bc4.camel@phytec.fr>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_05,2025-02-27_01,2024-11-22_01
Cc: "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 00/11] Rework and fix STM32MP15x PHYTEC dts
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

SGkgQ2hyaXN0b3BoZQoKT24gMi8yNy8yNSAxMjozNSwgQ2hyaXN0b3BoZSBQYXJhbnQgd3JvdGU6
Cj4gSGkgQWxleGFuZHJlLAo+IAo+IExlIGpldWRpIDI3IGbDqXZyaWVyIDIwMjUgw6AgMDk6NTIg
KzAxMDAsIEFsZXhhbmRyZSBUT1JHVUUgYSDDqWNyaXTCoDoKPj4gSGkgQ2hyaXN0b3BoZQo+Pgo+
PiBPbiAxLzEwLzI1IDE2OjAyLCBDaHJpc3RvcGhlIFBhcmFudCB3cm90ZToKPj4+IFRoaXMgcGF0
Y2ggc2VyaWVzIHJlbmFtZSBhbmQgcmVvcmdhbml6ZSB0aGUgU1RNMzJNUDE1eCBQSFlURUMKPj4+
IGJhc2Vib2FyZCAocGh5Qk9BUkQtU2FyZ2FzKSBhbmQgU29NIChwaHlDT1JFLVNUTTMyTVAxNXgp
IGRldmljZQo+Pj4gdHJlZQo+Pj4gZmlsZXMuCj4+PiBJbmRlZWQsIHRoZSBjdXJyZW50IGRldmlj
ZSB0cmVlIG5hbWluZyBhbmQgb3JnYW5pemF0aW9uIGlzIG5vdAo+Pj4gcmVhbGx5Cj4+PiBjb25z
aXN0ZW50IGFzIGl0IGRvZXMgbm90IGFsaWduIHdpdGggb3RoZXJzIFNUTTMyTVAgYm9hcmRzICh1
c2UKPj4+IGNvbW1vbgo+Pj4gZHRzaSBmaWxlIGFzIG11Y2ggYXMgcG9zc2libGUsIHVzZSBvbmUg
ZHRzaSBmb3IgU29NIGFuZCBvbmUgZHRzaQo+Pj4gZm9yCj4+PiBiYXNlYm9hcmQpLgo+Pj4KPj4+
IFRoZSBzZXJpZXMgYWxzbyBmaXhlcyBzb21lIGltcG9ydGFudCBwaW5jdHJsIGlzc3VlcyBhbmQg
bWlub3Igb25lCj4+PiAoY29kaW5nCj4+PiBzdHlsZSkuIEFkZGl0aW9uYWwgcGluY3RybCBpcyBh
bHNvIGFkZGVkIGZvciB0aGUgb3B0aW9ubmFsCj4+PiBpbnRlcmZhY2VzCj4+PiB0aGF0IGFyZSBu
b3QgZW5hYmxlZCBieSBkZWZhdWx0IChGTUMsIExUREMsIERDTUksIFBXTSkuCj4+Pgo+Pj4gQ2hy
aXN0b3BoZSBQYXJhbnQgKDExKToKPj4+ICDCoMKgIEFSTTogZHRzOiBzdG0zMm1wMTU6IHBoeWNv
cmU6IFJlbmFtZSBkZXZpY2UgdHJlZSBmaWxlcwo+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMybXAx
NTogcGh5Ym9hcmQtc2FyZ2FzOiBJbnRyb2R1Y2UgU29NIGRldmljZSB0cmVlCj4+PiAgwqDCoCBk
dC1iaW5kaW5nczogYXJtOiBzdG0zMjogUmVuYW1lIFNUTTMyTVAxNXggUGh5dGVjIGJvYXJkIGFu
ZCBTb00KPj4+ICDCoMKgIEFSTTogZHRzOiBzdG0zMm1wMTU6IEFkZCBuZXcgcGlubXV4IGdyb3Vw
cyBmb3IgcGh5Y29yZSBhbmQKPj4+IHBoeWJvYXJkCj4+PiAgwqDCoCBBUk06IGR0czogc3RtMzJt
cDE1OiBwaHlib2FyZC1zYXJnYXM6IEZpeCB1YXJ0NCBhbmQgc2FpMiBwaW5jdHJsCj4+PiAgwqDC
oCBBUk06IGR0czogc3RtMzJtcDE1OiBwaHljb3JlOiBxc3BpOiBGaXggbWVtb3J5IG1hcCBhbmQg
cGluY3RybAo+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMybXAxNTogcGh5Y29yZTogQWRkIGR1bW15
IG1lbW9yeS1ub2RlCj4+PiAgwqDCoCBBUk06IGR0czogc3RtMzJtcDE1OiBwaHlib2FyZC1zYXJn
YXM6IE1vdmUgYWxpYXNlcyBmcm9tIGR0cyB0bwo+Pj4gZHRzaQo+Pj4gIMKgwqAgQVJNOiBkdHM6
IHN0bTMybXAxNTogcGh5Y29yZTogRGlzYWJsZSBvcHRpb25hbCBTb00gcGVyaXBoZXJhbHMKPj4+
ICDCoMKgIEFSTTogZHRzOiBzdG0zMm1wMTU6IHBoeWNvcmUgYW5kIHBoeWJvYXJkOiBGaXggY29k
aW5nIHN0eWxlCj4+PiBpc3N1ZXMKPj4+ICDCoMKgIEFSTTogZHRzOiBzdG0zMm1wMTU6IHBoeWNv
cmUgYW5kIHBoeWJvYXJkOiBBZGQgb3B0aW9uYWwKPj4+IGludGVyZmFjZXMKPj4+Cj4+PiAgwqAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWzCoCB8wqDCoCA3ICst
Cj4+PiAgwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3QvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4+PiAgwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3Rt
MzJtcDE1LXBpbmN0cmwuZHRzacKgwqAgfCAxNjQgKysrKysrKysrCj4+PiAgwqAgLi4uL3N0L3N0
bTMybXAxNTdjLXBoeWJvYXJkLXNhcmdhcy1yZGsuZHRzwqDCoMKgIHzCoCA0MiArKysKPj4+ICDC
oCAuLi4vZHRzL3N0L3N0bTMybXAxNTdjLXBoeWNvcmUtc3RtMzJtcDEtMy5kdHMgfMKgIDYwIC0t
LQo+Pj4gIMKgIC4uLi9kdHMvc3Qvc3RtMzJtcDE1eHgtcGh5Ym9hcmQtc2FyZ2FzLmR0c2nCoMKg
IHwgMjg2Cj4+PiArKysrKysrKysrKysrKysKPj4+ICDCoCAuLi4tc29tLmR0c2kgPT4gc3RtMzJt
cDE1eHgtcGh5Y29yZS1zb20uZHRzaX0gfCAzNDQgKysrKy0tLS0tLS0tLQo+Pj4gLS0tLS0KPj4+
ICDCoCA3IGZpbGVzIGNoYW5nZWQsIDU2NCBpbnNlcnRpb25zKCspLCAzNDEgZGVsZXRpb25zKC0p
Cj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAx
NTdjLXBoeWJvYXJkLQo+Pj4gc2FyZ2FzLXJkay5kdHMKPj4+ICDCoCBkZWxldGUgbW9kZSAxMDA2
NDQgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2MtcGh5Y29yZS0KPj4+IHN0bTMybXAx
LTMuZHRzCj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0
bTMybXAxNXh4LXBoeWJvYXJkLQo+Pj4gc2FyZ2FzLmR0c2kKPj4+ICDCoCByZW5hbWUgYXJjaC9h
cm0vYm9vdC9kdHMvc3Qve3N0bTMybXAxNTdjLXBoeWNvcmUtc3RtMzJtcDE1LQo+Pj4gc29tLmR0
c2kgPT4gc3RtMzJtcDE1eHgtcGh5Y29yZS1zb20uZHRzaX0gKDUzJSkKPj4+Cj4+Cj4+IFVzaW5n
IGI0IHRvIGdldCB5b3VyIHNlcmllcywgSSBqdXN0IHNlZSB0aGF0IHRoZXJlIG5vIG1haWxpbmcg
bGlzdAo+PiBhbmQKPj4gRHQgbWFpbnRhaW5lciBpbiBDQyBvZiB5b3VyIHNlcmllcy4gRGlkIHlv
dSB1c2UgImdldF9tYWludGFpbmVyLnBsIgo+PiBzY3JpcHQgPwo+Pgo+IE5vLCBJIG9ubHkgcmVs
aWVkIG9uIHJlYWRpbmcgdGhlIE1BSU5UQUlORVIgZmlsZS4gQnV0IHRoYW5rcywgSSBub3cKPiBr
bm93IHRoYXQgSSBoYXZlIHRvIHVzZSB0aGUgImdldF9tYWludGFpbmVyLnBsIiBzY3JpcHQuCj4g
Cj4+IENhbiB5b3UgcGxlYXNlIHJlc2VuZCBhZGRpbmcgY29ycmVjdCBDQyBhbmQgVE8gbGlzdCA/
Cj4gWWVzIHN1cmUuIFNob3VsZCBJIGNvbnRpbnVlIHRhZ2luZyB0aGUgc2VyaWVzIGFzIHYyID8K
PiBJIHdpbGwgbWFkZSBhIG5ldyB0aW55IGNvZGluZyBzdHlsZSBmaXggZGV0ZWN0ZWQgYnkgY2hl
Y2twYXRoLnBsICh0b29sCj4gdGhhdCBJIGhhdm4ndCBydW4gYmVmb3JlKS4gU28gaXQgd291bGQg
YmUgYSB2MyBpbiB0aGlzIGNhc2UuCgpFaXRoZXIgeW91IGNvbnRpbnVlIHdpdGggVjMgYWRkaW5n
IG5ldyBwZW9wbGUgaW4gQ0MvVE8gYnV0IGl0IGNvdWxkIGJlIGEgCmJpdCBzdHJhbmdlIGZvciB0
aGVtIGFzIHRoZXkgZGlkbid0IGdldCB0aGUgVjEgYW5kIFYyLgpPciB5b3UgcmVzdGFydCB5b3Vy
IHNlcmllcyBmcm9tIHNjcmF0Y2ggYXMgb25seSBsaW51eC1zdG0zMiBzdWJzY3JpYmVycyAKYW5k
IFBoeXRlYyBndXlzIHdlcmUgYXdhcmUgb2YgdGhpcyBzZXJpZXMuIEluIHRoaXMgY2FzZSB5b3Ug
Y291bGQgbWFyayAKdGhlIGN1cnJlbnQgc2VyaWVzIGFzICJhYmFuZG9uZWQiCgoKPj4KPj4gTm90
ZTogQVJNOiBkdHM6IHN0bTMybXAxNTogLS0+IEFSTTogZHRzOiBzdG0zMgo+IE9rIEkgd2lsbCBj
b3JyZWN0IHRoYXQuIEFzIFBIWVRFQyBwcm92aWRlcyBwaHljb3JlIGZvciBib3RoIE1QMTV4IGFu
ZAo+IE1QMTN4IHN0bTMyIFNvQywgSSB3YW50ZWQgdG8gdXNlIHRoaXMgc3ludGF4IHRvIG1ha2Ug
ZGlzdGluY3Rpb24uIEkgd2FzCj4gbm90IHN1cmUgdGhpcyB3YXMgYWxsb3dlZC4KPiAKPiBSZWdh
cmRzLAo+IENocmlzdG9waGUKPj4KPj4gdGhhbmtzCj4+IEFsZXgKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
