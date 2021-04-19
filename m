Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80573363CE5
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Apr 2021 09:46:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2192DC57196;
	Mon, 19 Apr 2021 07:46:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC945C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 07:46:47 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13J7h18C024163; Mon, 19 Apr 2021 09:46:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2XcjnkEAyiJg5CAr01NS0o8zmjlzeCSZ86XHOaG3ovw=;
 b=GpI0yH4lYjAUy0k1hlirnxQb6FWkMhG7J2zRCvVKWJ3qu/+WVShRXvyRiM37CLgqVXWv
 Y0cPSst9SwY7Qkn56lqXJ4LRR9DCApkSgYNA0S4McDmWVJKdVJtH/vWNKXeO1yIroIvh
 vt7ePSLE676f3fH9TC6vaqtnhne/MDV7fxPVmBOO8zftR6aw0mHhTNOU1qfFZiUdU0Tx
 YPajW3+BkWijYi0ELcCUWC05Ar0ZelrfIz6KpoEOLYAYqM+OeEu0r5S3wcBuSWTxYASk
 t6LZF03KX5mOhtPP67182n1XORKkk+ktxq/J5HMy4cGvVTokhAa20Bo17Ah1K8UJYtrD SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 380rdgatep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 09:46:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40FCF10002A;
 Mon, 19 Apr 2021 09:46:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E5EA2200DD;
 Mon, 19 Apr 2021 09:46:29 +0200 (CEST)
Received: from lmecxl0572.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr
 2021 09:46:28 +0200
To: Marek Vasut <marex@denx.de>, Alexandre TORGUE
 <alexandre.torgue@foss.st.com>, <linux-arm-kernel@lists.infradead.org>
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-2-marex@denx.de>
 <2b10f5d9-54cb-ce83-b7aa-f4ec8e67c001@foss.st.com>
 <92dd5798-8f5a-66e4-06bc-e3beb16690f5@denx.de>
 <d168aed8-aebd-1bee-aa72-3a3601718cad@foss.st.com>
 <e27dbccd-518f-7718-8cf7-cc9c8adb8a56@denx.de>
 <6416577a-ea06-a014-543a-9ef86aae603d@foss.st.com>
 <2281af74-33a0-df45-968b-baa1ddd9d6e0@denx.de>
From: "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Message-ID: <8481872c-9ee0-c759-3ab0-5209165ad9b2@foss.st.com>
Date: Mon, 19 Apr 2021 09:46:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2281af74-33a0-df45-968b-baa1ddd9d6e0@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_02:2021-04-16,
 2021-04-19 signatures=0
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/7] clk: stm32mp1: Split ETHCK_K into
 separate MUX and GATE clock
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

SGkgTWFyZWssCgpPbiA0LzE2LzIxIDU6MzEgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDQv
MTYvMjEgNToyMyBQTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiAKPiBIZWxsbyBBbGV4YW5k
cmUsCj4gCj4+IE9uIDQvMTYvMjEgMzo0NyBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+PiBPbiA0
LzE2LzIxIDg6NDQgQU0sIGdhYnJpZWwuZmVybmFuZGV6QGZvc3Muc3QuY29tIHdyb3RlOgo+Pj4+
IEhpIE1hcmVrCj4+Pgo+Pj4gSGVsbG8gR2FicmllbCwKPj4+Cj4+Pj4gT24gNC8xNC8yMSA0OjA0
IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+Pj4gT24gNC8xNC8yMSAzOjAzIFBNLCBnYWJyaWVs
LmZlcm5hbmRlekBmb3NzLnN0LmNvbSB3cm90ZToKPj4+Pj4+IEhpIE1hcmVrLAo+Pj4+Pgo+Pj4+
PiBIZWxsbyBHYWJyaWVsLAo+Pj4+Pgo+Pj4+Pj4gVGhhbmtzIGZvciB0aGUgcGF0Y2hzZXQKPj4+
Pj4+Cj4+Pj4+PiBPbiA0LzgvMjEgODo1NyBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+Pj4+Pj4g
VGhlIEVUSENLX0sgYXJlIG1vZGVsZWQgYXMgY29tcG9zaXRlIGNsb2NrIG9mIE1VWCBhbmQgR0FU
RSwgCj4+Pj4+Pj4gaG93ZXZlciBwZXIKPj4+Pj4+PiBTVE0zMk1QMSBSZWZlcmVuY2UgTWFudWFs
IFJNMDQzNiBSZXYgMywgUGFnZSA1NzQsIEZpZ3VyZSA4My4gCj4+Pj4+Pj4gUGVyaXBoZXJhbAo+
Pj4+Pj4+IGNsb2NrIGRpc3RyaWJ1dGlvbiBmb3IgRXRoZXJuZXQsIEVUSFBUUERJViBkaXZpZGVy
IGlzIGF0dGFjaGVkIAo+Pj4+Pj4+IHBhc3QgdGhlCj4+Pj4+Pj4gRVRIQ0tfSyBtdXgsIGFuZCBF
VEhfQ0xLL2V0aF9jbGtfZmIgY2xvY2sgYXJlIG91dHB1dCBwYXN0IEVUSENLRU4gCj4+Pj4+Pj4g
Z2F0ZS4KPj4+Pj4+PiBUaGVyZWZvcmUsIGluIGNhc2UgRVRIX0NMSy9ldGhfY2xrX2ZiIGFyZSBu
b3QgaW4gdXNlIEFORCBQVFAgCj4+Pj4+Pj4gY2xvY2sgYXJlCj4+Pj4+Pj4gaW4gdXNlLCBFVEhD
S0VOIGdhdGUgY2FuIGJlIHR1cm5lZCBvZmYuIEN1cnJlbnQgZHJpdmVyIGRvZXMgbm90IAo+Pj4+
Pj4+IHBlcm1pdAo+Pj4+Pj4+IHRoYXQsIGZpeCBpdC4KPj4+Pj4+Cj4+Pj4+PiBJIGRvbiJ0IHVu
ZGVyc3RhbmQsIGl0J3MgYWxyZWFkeSB0aGUgY2FzZS4KPj4+Pj4+Cj4+Pj4+PiBFVEhDS19LIGl0
J3MgYSBjb21wb3NpdGUgd2l0aCBhIE1VWCBhbmQgYSBHQVRFLgo+Pj4+Pgo+Pj4+PiBCdXQgRVRI
Q0tfSyBpcyBfbm90XyBhIGNvbXBvc2l0ZSBjbG9jaywgbG9vayBhdCB0aGUgRmlndXJlIDgzIGlu
IAo+Pj4+PiB0aGUgZGF0YXNoZWV0IGFnYWluIGFuZCBzY2hlbWF0aWMgYmVsb3cuCj4+Pj4+Cj4+
Pj4+PiBFVEhQVFBfSyAoRVRIUFRQRElWKSBpdCdzIGEgY29tcG9zaXRlIHdpdGggdGhlIHNhbWUg
TVVYIGFuZCBhIERJViAKPj4+Pj4+IChubyBnYXRlKQo+Pj4+Pgo+Pj4+PiBCdXQgRVRIUFRQX0sg
c2hvdWxkbid0IGNvbnRyb2wgYW55IG11eCwgaXQgaXMgb25seSBhIGRpdmlkZXIuCj4+Pj4+Cj4+
Pj4+PiBJZiB5b3UgdXNlIG9ubHkgRVRIUFRQRElWLMKgIEVUSENLRU4gZ2F0ZSBjYW4gYmUgdHVy
bmVkIG9mZi4KPj4+Pj4KPj4+Pj4gTG9vaywgdGhpcyBpcyB3aGF0IHlvdSBoYXZlIHRvZGF5Ogo+
Pj4+Pgo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC4tLS0tLS0tLS0tLS0gRVRIQ0tfSyAt
LS0tLS0tLS0tLS4KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8X19fX19fX8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgX19fX19fX8KgwqAgfAo+Pj4+PiBwbGw0X3BfY2stLXxNX0VU
SENLXMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8R19FVEhDS1zCoCB8Cj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCBNVVjCoMKgwqAgfC0tLS0tLSstLS0tLXwgR0FURcKgwqAgfC0tLS0t
LS0tLS0tLS1beF0gRVRIX0NMSwo+Pj4+PiBwbGwzX3FfY2stLXxfX19fX19fL8KgwqDCoMKgwqDC
oCB8wqDCoMKgwqAgfF9fX19fX18vwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
dGhfY2xrX2ZiCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICctLShFVEhDS1NFTFJbNzo0XSBkaXZpZGVyKS0tW3hdIAo+Pj4+PiBj
bGtfcHRwX3JlZgo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAnLS0tLS0tLS0tLS0tIEVU
SFBUUF9LIC0tLS0tLS0tLS0tLS0tLS0tLS0tJwo+Pj4+Pgo+Pj4+PiBBbmQgdGhpcyBpcyB3aGF0
IHlvdSBzaG91bGQgaGF2ZSwgdG8gYXZvaWQgaGF2aW5nIHR3byBjb21wb3NpdGUgCj4+Pj4+IGNs
b2NrIHdoaWNoIGNvbnRyb2wgdGhlIHNhbWUgbXV4IHVzaW5nIHRoZSBzYW1lIHJlZ2lzdGVyIGJp
dCwgaS5lLiAKPj4+Pj4gd2hhdCB0aGlzIHBhdGNoIGltcGxlbWVudHM6Cj4+Pj4+Cj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLi0gY2tfa2VyX2V0aCAtLsKgIC4tLS0gRVRIQ0tfSyAtLS4K
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8X19fX19fX8KgwqDCoMKgwqDCoCB8wqAgfMKg
wqDCoCBfX19fX19fwqDCoCB8Cj4+Pj4+IHBsbDRfcF9jay0tfE1fRVRIQ0tcwqDCoMKgwqDCoCB8
wqAgfMKgwqAgfEdfRVRIQ0tcwqAgfAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgTVVY
wqDCoMKgIHwtLS0tLS0rLS0tLS18IEdBVEXCoMKgIHwtLS0tLS0tLS0tLS0tW3hdIEVUSF9DTEsK
Pj4+Pj4gcGxsM19xX2NrLS18X19fX19fXy/CoMKgwqDCoMKgwqAgfMKgwqDCoMKgIHxfX19fX19f
L8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXRoX2Nsa19mYgo+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfAo+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Jy0tKEVUSENLU0VMUls3OjRdIGRpdmlkZXIpLS1beF0gCj4+Pj4+IGNsa19wdHBfcmVmCj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfAo+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAnLS0tLSBFVEhQVFBfSyAtLS0tLS0tLS0tLScKPj4+Pj4KPj4+Pgo+Pj4+IFRoZXNlIDIgc29s
dXRpb25zIGFyZSB2YWxpZC4gSSBtYWRlIHRoZSBjaG9pY2UgdG8gaW1wbGVtZW50IHRoZSAKPj4+
PiBmaXJzdCBvbmUgdG8gYmUgYWJsZSB0byBjaGFuZ2UgcGFyZW50IHdpdGggdGhlIGtlcm5lbCBj
bG9jayBvZiB0aGUgCj4+Pj4gSVAgKG5vIG5lZWQgdG8gYWRkIGFuIGludGVybWVkaWF0ZSBiaW5k
aW5nKS4KPj4+Cj4+PiBXaGljaCBJUCBhcmUgeW91IHRhbGtpbmcgYWJvdXQgaW4gaGVyZSA/Cj4+
Pgo+Pj4+IEl0J3MgdGhlIHNhbWUgcHJpbmNpcGxlIGZvciBhbGwga2VybmVsIG9mIHRoaXMgc29j
Lgo+Pj4KPj4+IFRoZSBmaXJzdCBvcHRpb24gaXMgd3JvbmcsIGJlY2F1c2UgaW4gdGhhdCBtb2Rl
bCwgeW91IGhhdmUgdHdvIAo+Pj4gY29tcG9zaXRlIGNsb2NrIHdoaWNoIGNvbnRyb2wgdGhlIHNh
bWUgb25lIG11eCBiaXQgaW4gdGhlIHNhbWUgCj4+PiByZWdpc3Rlci4gQmFzaWNhbGx5IHlvdSBy
ZWdpc3RlciB0d28gZGlzdGluY3QgY2xvY2sgd2hpY2ggb3BlcmF0ZSB0aGUgCj4+PiBzYW1lIGhh
cmR3YXJlIGtub2IuCj4+Pgo+Pj4+IEkgY2FuIGFzayB0byBBbGV4YW5kcmUgdG8gY29tZWJhY2sg
b2YgdGhpcyBwcmluY2lwbGUsIGJ1dCBpICdtIG5vdCAKPj4+PiBmYXZvcmFibGUuCj4+Pgo+Pgo+
PiBUaGUgb25seSBkaXNjdXNzaW5nIHRoaW5nIGlzIGhvdyB0aGUgY2xvY2sgaXMgc2hvd24uIEkg
bWVhbiBlaXRoZXIgdHdvIAo+PiBjb21wb3NpdGVzIG9yIG9uZSBtdXggcGx1cyB0d28gZ2F0ZXMu
IEdhYnJpZWwgbWFkZSBhIGNob2ljZSB0byAKPj4gYWJzdHJhY3QgdGhlIG11eCBpbiB0d28gY29t
cG9zaXRlIGNsb2Nrcy4gQnV0IGl0IHNlZW1zIHRoYXQgYXQgdGhlIGVuZCAKPj4gd2UgaGF2ZSB0
aGUgc2FtZSBiZWhhdmlvdXIsIGlzbid0ID8KPiAKPiBOb3QgcmVhbGx5LiBTaW5jZSB0aGUgdHdv
IGNvbXBvc2l0ZSBjbG9jayBjb250cm9sIHRoZSBzYW1lIG11eCBiaXQsIAo+IGNvbnNpZGVyIHdo
YXQgd291bGQgaGFwcGVuIGlmIHlvdSB3ZXJlIHRvIHNlbGVjdCBwbGw0X3BfY2sgYXMgcGFyZW50
IGZvciAKPiBvbmUgKGUuZy4gRVRIQ0tfSyksIGFuZCBwbGwzX3FfY2sgYXMgcGFyZW50IGZvciB0
aGUgb3RoZXIgKGUuZy4gCj4gRVRIUFRQX0spLCB3aGF0IHdvdWxkIGJlIHRoZSByZXN1bHQgPyBJ
IGd1ZXNzIHRoZSByZXN1bHQgd291bGQgZGVwZW5kIG9uIAo+IHdoZW4gdGhlIHJlcGFyZW50aW5n
IG9mIGVhY2ggRVRIQ0tfSy9FVEhQVFBfSyBoYXBwZW5zIG9uIGJvb3QsIGFuZCBJIAo+IGRvbid0
IHRoaW5rIHRoYXQncyBob3cgaXQgc2hvdWxkIHdvcmsuIFdpdGggYSBzaW5nbGUgbXV4IGNvbnRy
b2xsaW5nIAo+IHRoYXQgb25lIHNpbmdsZSBiaXQsIHN1Y2ggc2l0dWF0aW9uIHdvdWxkbid0IGhh
cHBlbi4KClRoZSByZXBhcmVudGluZyBpcyBtYW5hZ2VkLiBUaGlzIG11eCBoYXMgc3BlY2lmaWMg
b3BzLgpyb290QHN0bTMybXAxLWRpc2NvLW9zczp+IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xr
L2V0aGNrX2svY2xrX3BhcmVudCAKJiYgY2F0IC9zeXMva2VybmVsL2RlYnVnL2Nsay9ldGhwdHBf
ay9jbGtfcGFyZW50CnBsbDRfcApwbGw0X3AKcm9vdEBzdG0zMm1wMS1kaXNjby1vc3M6fiMgZWNo
byBwbGwzX3EgPiAKL3N5cy9rZXJuZWwvZGVidWcvY2xrL2V0aHB0cF9rL2Nsa19zZXRfcGFyZW50
CnJvb3RAc3RtMzJtcDEtZGlzY28tb3NzOn4jIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9jbGsvZXRo
Y2tfay9jbGtfcGFyZW50IAomJiBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xrL2V0aHB0cF9rL2Ns
a19wYXJlbnQKcGxsM19xCnBsbDNfcQoKPiAKPj4gQWRkaW5nICJja19rZXJfZXRoIiB3b3VsZCBp
bXBvc2UgYSBuZXcgY2xvY2sgdG8gdGFrZSBpbiBEVCA/Cj4gTm9wZSwgdGhlIGNrX2tlcl9ldGgg
aXMgd2l0aG91dCBJRCBhbmQgaW50ZXJuYWwgdG8gdGhlIGRyaXZlci4gVGhleSAKPiBleGlzdCBv
bmx5IHRvIGRlc2NyaWJlIHRoZSBjbG9jayB0cmVlIGNvcnJlY3RseS4KPiAKPiBbLi4uXQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
