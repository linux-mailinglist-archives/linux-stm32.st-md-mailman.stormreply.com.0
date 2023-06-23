Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 581E373B597
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:40:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09EFDC65E42;
	Fri, 23 Jun 2023 10:40:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7BF0C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:40:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35N7ENtP032070; Fri, 23 Jun 2023 12:39:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Wsm1r+YZb6njhXuYuKqAF8bSuYHp/iwjxFKK1C+IEZI=;
 b=jZUto3MxDGvYiZkC9wghuPPG4WdXwRDO/KlLoeANpEnuJ7X8IYQYFbJvJvQ2ksP+Xuq2
 FXIUgr0NfgKtuM5fV0QwHrYCuAkt9MiW36ku/7yHfC5t6mv75eZNUPVzEHlPCg+Zp/hc
 3Y+99G0hBq3bXBZIerHVE/IVdnyWMgdNcOaWTHs9n8VMDDEiSBBpD/HSVJAq9skySrbG
 AbdtHFcmPgZzSP8T6AuFN3u5M/VOXcL4Kk6FzYBZn/hfFFuyuQa+nULuPM0q4Yex/iya
 1WkljfLRb+hPPqDpG2HpXvVePiwJ9DsDg8JlagRN9/m1L3ChyVq9wGPBo+YP8WQ0Cqjr Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rd6ma9eup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 12:39:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 803AB10007B;
 Fri, 23 Jun 2023 12:39:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7805E21BF4E;
 Fri, 23 Jun 2023 12:39:47 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 23 Jun
 2023 12:39:47 +0200
Message-ID: <6551be49-7957-a208-9cd8-6a7a41000880@foss.st.com>
Date: Fri, 23 Jun 2023 12:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Christophe Parant <C.Parant@phytec.fr>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "s.trumtrar@pengutronix.de"
 <s.trumtrar@pengutronix.de>
References: <20230505060158.16516-1-s.trumtrar@pengutronix.de>
 <20230505060158.16516-11-s.trumtrar@pengutronix.de>
 <e5b4ef445160ac0ddbaa25f12118a253ad21542a.camel@phytec.fr>
 <9163ad315278dbedd6c31993a3dafad62a731b5e.camel@phytec.fr>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <9163ad315278dbedd6c31993a3dafad62a731b5e.camel@phytec.fr>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_04,2023-06-22_02,2023-05-22_02
Cc: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v9 10/10] ARM: dts: stm32: add
	STM32MP1-based Phytec board
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

SGkgQ2hyaXN0b3BoZQoKT24gNi8yMy8yMyAxMDo1OSwgQ2hyaXN0b3BoZSBQYXJhbnQgd3JvdGU6
Cj4gSGVsbG8gbWFpbnRhaW5lcnMsCj4gCj4gSSB3b3VsZCBsaWtlIHRvIGtub3cgaWYgeW91IGhh
dmUgc2VlbiBteSByZXF1ZXN0IGJlbG93ID8KPiAKPiBUaGFuayB5b3UuCj4gCj4gQmVzdCByZWdh
cmRzLAo+IENocmlzdG9waGUKPiAKPiBMZSBtYXJkaSAyMyBtYWkgMjAyMyDDoCAxNjo1OCArMDIw
MCwgQ2hyaXN0b3BoZSBQYXJhbnQgYSDDqWNyaXTCoDoKPj4gSGkgU3RlZmZlbiwKPj4KPj4gVGhh
bmsgeW91IGZvciB1cHN0cmVhbWluZyBvdXIgcGh5Qk9BUkQtU2FyZ2FzIGRldmljZSB0cmVlLiBX
ZSB3ZXJlCj4+IGFsc28KPj4gcGxhbmluZyB0byB3b3JrIG9uIHRoYXQgdG9vLgo+PiBJZiB0aGlz
IHBhdGNoIGlzIG5vdCBhcHBsaWVkIHVwc3RyZWFtIHlldCwgd291bGQgaXQgYmUgcG9zc2libGUg
dG8KPj4gcmVuYW1lIHRoZSAuZHRzIGZpbGUgPwo+Pgo+PiBJbiB0aGUgYmVnaW5uaW5nLCB3ZSBu
YW1lZCB0aGUgZHRzIGZpbGVzIGFmdGVyIG91ciBZb2N0byBtYWNoaW5lcywKPj4gd2hpY2ggaXMg
cHJvYmFibHkgdGhlIHZlcnNpb24geW91IGdvdC4gQnV0IG5vdyB3ZSByZW5hbWVkIHRoZW0gYWZ0
ZXIKPj4gb3VyIGJhc2Vib2FyZCBuYW1lcywgbGlrZSB3aXRoIG91ciBvdGhlciBwbGF0Zm9ybXMu
Cj4+IFNvIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gaGF2ZSB0aGUgc3RtMzIgYmFzZWJvYXJkIG5h
bWVkIHRoZSBzYW1lCj4+IHdheSwKPj4gY2hhbmdpbmcgInN0bTMybXAxNTdjLXBoeWNvcmUtc3Rt
MzJtcDEtMy5kdHMiIHRvICJzdG0zMm1wMTU3Yy0KPj4gcGh5Ym9hcmQtCj4+IHNhcmdhcy1yZGst
ZW1tYy5kdHMiLgo+PgoKSXQgaGFzIGJlZW4gc2VudCB3aXRoIHRoZSBvbGQgbmFtZS4gSWYgaXQg
aXMgcmVhbGx5IG5lZWRlZCB5b3UgbmVlZCB0byAKc2VuZCBhIHBhdGNoICh5YW1sICsgRFQgdXBk
YXRlKSB3aXRoIGEgZml4ZXMgdGFnLiBJJ2xsIHNlbmQgaXQgdG8gCmFybS1zb2MgZHVyaW5nIHY2
LjUgcmMgY3ljbGUuCgpBbGV4Cgo+PiAibW9kZWwiIGFuZCAiY29tcGF0aWJsZSIgY2FuIGFsc28g
YmUgbW9kaWZpZWQgdGhpcyB3YXkgd2l0aCB0aGlzCj4+IG5hbWluZwo+PiBjb252ZW50aW9uIDoK
Pj4KPj4gLyB7Cj4+ICDCoMKgwqAgbW9kZWwgPSAiUEhZVEVDIHBoeUJPQVJELVNhcmdhcyBTVE0z
Mk1QMTU3QyB3aXRoIGVNTUMiOwo+PiAgwqDCoMKgIGNvbXBhdGlibGUgPSAicGh5dGVjLHN0bTMy
bXAxNTdjLXBoeWJvYXJkLXNhcmdhcy1yZGstZW1tYyIsCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgInBoeXRlYyxzdG0zMm1wMTU3Yy1waHljb3JlLXNvbSIsICJzdCxzdG0zMm1wMTU3IjsK
Pj4gfTsKPj4KPj4gVGhhbmtzLgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IENocmlzdG9waGUgUGFy
YW50Cj4+Cj4+IExlIHZlbmRyZWRpIDA1IG1haSAyMDIzIMOgIDA4OjAxICswMjAwLCBTdGVmZmVu
IFRydW10cmFyIGEgw6ljcml0wqA6Cj4+PiBBZGQgdGhlIFBoeXRlYyBTVE0zMk1QMS0zIERldiBi
b2FyZC4gVGhlIGRldmJvYXJkIHVzZXMgYSBQaHl0ZWMKPj4+IHN0bTMybTE1N2Mtc29tLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IFN0ZWZmZW4gVHJ1bXRyYXIgPHMudHJ1bXRyYXJAcGVuZ3V0cm9u
aXguZGU+Cj4+PiAtLS0KPj4+Cj4+PiBOb3RlczoKPj4+ICDCoMKgwqAgQ2hhbmdlcyBzaW5jZSB2
NzoKPj4+ICDCoMKgwqDCoMKgwqAgLSByZW1vdmUgc2VjdXJlLXN0YXR1cyBmb3Igc2RtbWMKPj4+
Cj4+PiAgwqBhcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAzICstCj4+PiAgwqAuLi4vZHRzL3N0bTMybXAxNTdjLXBoeWNv
cmUtc3RtMzJtcDEtMy5kdHPCoMKgwqAgfCA2MAo+Pj4gKysrKysrKysrKysrKysrKysrKwo+Pj4g
IMKgMiBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+PiAg
wqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtcGh5Y29y
ZS1zdG0zMm1wMS0KPj4+IDMuZHRzCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL01ha2VmaWxlCj4+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlCj4+PiBpbmRleCBl
ZmU0MTUyZTU4NDYuLmRmYTlhNzQ3N2M4MiAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL01ha2VmaWxlCj4+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZQo+Pj4gQEAg
LTEyNTIsNyArMTI1Miw4IEBAIGR0Yi0kKENPTkZJR19BUkNIX1NUTTMyKSArPSBcCj4+PiAgwqDC
oMKgwqDCoMKgwqDCoHN0bTMybXAxNTdjLWV2MS5kdGIgXAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqBz
dG0zMm1wMTU3Yy1ldjEtc2NtaS5kdGIgXAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqBzdG0zMm1wMTU3
Yy1seGEtbWMxLmR0YiBcCj4+PiAtwqDCoMKgwqDCoMKgwqBzdG0zMm1wMTU3Yy1vZHlzc2V5LmR0
Ygo+Pj4gK8KgwqDCoMKgwqDCoMKgc3RtMzJtcDE1N2Mtb2R5c3NleS5kdGIgXAo+Pj4gK8KgwqDC
oMKgwqDCoMKgc3RtMzJtcDE1N2MtcGh5Y29yZS1zdG0zMm1wMS0zLmR0Ygo+Pj4gIMKgZHRiLSQo
Q09ORklHX01BQ0hfU1VONEkpICs9IFwKPj4+ICDCoMKgwqDCoMKgwqDCoMKgc3VuNGktYTEwLWEx
MDAwLmR0YiBcCj4+PiAgwqDCoMKgwqDCoMKgwqDCoHN1bjRpLWExMC1iYTEwLXR2Ym94LmR0YiBc
Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtcGh5Y29yZS1z
dG0zMm1wMS0zLmR0cwo+Pj4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1waHljb3Jl
LXN0bTMybXAxLTMuZHRzCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAw
MDAwMDAwLi4yOGQ3MjAzMjY0Y2UKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNTdjLXBoeWNvcmUtc3RtMzJtcDEtMy5kdHMKPj4+IEBAIC0wLDAg
KzEsNjAgQEAKPj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjArIE9SIEJT
RC0zLUNsYXVzZSkKPj4+ICsvKgo+Pj4gKyAqIENvcHlyaWdodCAoQykgUGh5dGVjIEdtYkggMjAx
OS0yMDIwIC0gQWxsIFJpZ2h0cyBSZXNlcnZlZAo+Pj4gKyAqIEF1dGhvcjogRG9tIFZPVkFSRCA8
ZG9tLnZvdmFyZEBsaW5ydC5jb20+Lgo+Pj4gKyAqLwo+Pj4gKwo+Pj4gKy9kdHMtdjEvOwo+Pj4g
Kwo+Pj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3N0bTMyLXBpbmZ1bmMuaD4KPj4+
ICsjaW5jbHVkZSAic3RtMzJtcDE1Ny5kdHNpIgo+Pj4gKyNpbmNsdWRlICJzdG0zMm1wMTV4Yy5k
dHNpIgo+Pj4gKyNpbmNsdWRlICJzdG0zMm1wMTV4eGFjLXBpbmN0cmwuZHRzaSIKPj4+ICsjaW5j
bHVkZSAic3RtMzJtcDE1N2MtcGh5Y29yZS1zdG0zMm1wMTUtc29tLmR0c2kiCj4+PiArCj4+PiAr
LyB7Cj4+PiArwqDCoMKgwqDCoMKgwqBtb2RlbCA9ICJQSFlURUMgcGh5Q09SRS1TVE0zMk1QMS0z
IERldiBCb2FyZCI7Cj4+PiArwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gInBoeXRlYyxwaHlj
b3JlLXN0bTMybXAxLTMiLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICJwaHl0ZWMscGh5Y29yZS1zdG0zMm1wMTU3Yy1zb20iLAo+Pj4gInN0LHN0bTMybXAxNTci
Owo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgYWxpYXNlcyB7Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgbW1jMCA9ICZzZG1tYzE7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgbW1jMSA9ICZzZG1tYzI7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgbW1jMiA9ICZzZG1tYzM7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2Vy
aWFsMCA9ICZ1YXJ0NDsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZXJpYWwx
ID0gJnVzYXJ0MzsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZXJpYWwyID0g
JnVzYXJ0MTsKPj4+ICvCoMKgwqDCoMKgwqDCoH07Cj4+PiArfTsKPj4+ICsKPj4+ICsmY3J5cDEg
ewo+Pj4gK8KgwqDCoMKgwqDCoMKgc3RhdHVzID0gIm9rYXkiOwo+Pj4gK307Cj4+PiArCj4+PiAr
JmR0cyB7Cj4+PiArwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAib2theSI7Cj4+PiArfTsKPj4+ICsK
Pj4+ICsmZm1jIHsKPj4+ICvCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+PiAr
fTsKPj4+ICsKPj4+ICsmZ3B1IHsKPj4+ICvCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJva2F5IjsK
Pj4+ICt9Owo+Pj4gKwo+Pj4gKyZpMmM0X2VlcHJvbSB7Cj4+PiArwqDCoMKgwqDCoMKgwqBzdGF0
dXMgPSAib2theSI7Cj4+PiArfTsKPj4+ICsKPj4+ICsmaTJjNF9ydGMgewo+Pj4gK8KgwqDCoMKg
wqDCoMKgc3RhdHVzID0gIm9rYXkiOwo+Pj4gK307Cj4+PiArCj4+PiArJnFzcGkgewo+Pj4gK8Kg
wqDCoMKgwqDCoMKgc3RhdHVzID0gIm9rYXkiOwo+Pj4gK307Cj4+PiArCj4+PiArJnNkbW1jMiB7
Cj4+PiArwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAib2theSI7Cj4+PiArfTsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
