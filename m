Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6EC3623D2
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Apr 2021 17:23:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8D21C57B79;
	Fri, 16 Apr 2021 15:23:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94F99C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 15:23:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GFHtkL009472; Fri, 16 Apr 2021 17:23:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SRX50N81IlAeTymmL103QV/nd+qvtEy6AcdtlmCoSQ4=;
 b=r1nbn9oLRZNI+S0ICud6wK4RpYY6OWjYrDGE8tXj4sKIlfnUpGqcfRPb6yT5Ro2HJmZ0
 PIJseN9kZJKXEadx9X3Xdrv8xNtUTjCD3a7RaZL6GDDSXdG37wlvVg8E/KkAMvpHLGIL
 sEuC4j/P/7oC9sGy2WW23Q9VWqk3vT4qKeOytBdKXaJaTopgvz6aDuNZ5H4qEydGtfQf
 GCCvH4qooAc7meLAP76U4eLGvdI6GKxr+kWSQKdtPUBS0SCAsMt4JyE4JKoGnnFxXtML
 O/AqQUVE1uvQr3szxXGIjYH9RyJI81ubghvq0LJ2gnIl2jZmr2B5iyqh3vMhIE+HkwT/ lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37xm4jr992-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 17:23:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C567A10002A;
 Fri, 16 Apr 2021 17:23:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5790245F0E;
 Fri, 16 Apr 2021 17:23:07 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Apr
 2021 17:23:06 +0200
To: Marek Vasut <marex@denx.de>, "gabriel.fernandez@foss.st.com"
 <gabriel.fernandez@foss.st.com>, <linux-arm-kernel@lists.infradead.org>
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-2-marex@denx.de>
 <2b10f5d9-54cb-ce83-b7aa-f4ec8e67c001@foss.st.com>
 <92dd5798-8f5a-66e4-06bc-e3beb16690f5@denx.de>
 <d168aed8-aebd-1bee-aa72-3a3601718cad@foss.st.com>
 <e27dbccd-518f-7718-8cf7-cc9c8adb8a56@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <6416577a-ea06-a014-543a-9ef86aae603d@foss.st.com>
Date: Fri, 16 Apr 2021 17:23:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e27dbccd-518f-7718-8cf7-cc9c8adb8a56@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
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

CgpPbiA0LzE2LzIxIDM6NDcgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDQvMTYvMjEgODo0
NCBBTSwgZ2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20gd3JvdGU6Cj4+IEhpIE1hcmVrCj4g
Cj4gSGVsbG8gR2FicmllbCwKPiAKPj4gT24gNC8xNC8yMSA0OjA0IFBNLCBNYXJlayBWYXN1dCB3
cm90ZToKPj4+IE9uIDQvMTQvMjEgMzowMyBQTSwgZ2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5j
b20gd3JvdGU6Cj4+Pj4gSGkgTWFyZWssCj4+Pgo+Pj4gSGVsbG8gR2FicmllbCwKPj4+Cj4+Pj4g
VGhhbmtzIGZvciB0aGUgcGF0Y2hzZXQKPj4+Pgo+Pj4+IE9uIDQvOC8yMSA4OjU3IFBNLCBNYXJl
ayBWYXN1dCB3cm90ZToKPj4+Pj4gVGhlIEVUSENLX0sgYXJlIG1vZGVsZWQgYXMgY29tcG9zaXRl
IGNsb2NrIG9mIE1VWCBhbmQgR0FURSwgaG93ZXZlciAKPj4+Pj4gcGVyCj4+Pj4+IFNUTTMyTVAx
IFJlZmVyZW5jZSBNYW51YWwgUk0wNDM2IFJldiAzLCBQYWdlIDU3NCwgRmlndXJlIDgzLiAKPj4+
Pj4gUGVyaXBoZXJhbAo+Pj4+PiBjbG9jayBkaXN0cmlidXRpb24gZm9yIEV0aGVybmV0LCBFVEhQ
VFBESVYgZGl2aWRlciBpcyBhdHRhY2hlZCBwYXN0IAo+Pj4+PiB0aGUKPj4+Pj4gRVRIQ0tfSyBt
dXgsIGFuZCBFVEhfQ0xLL2V0aF9jbGtfZmIgY2xvY2sgYXJlIG91dHB1dCBwYXN0IEVUSENLRU4g
Cj4+Pj4+IGdhdGUuCj4+Pj4+IFRoZXJlZm9yZSwgaW4gY2FzZSBFVEhfQ0xLL2V0aF9jbGtfZmIg
YXJlIG5vdCBpbiB1c2UgQU5EIFBUUCBjbG9jayBhcmUKPj4+Pj4gaW4gdXNlLCBFVEhDS0VOIGdh
dGUgY2FuIGJlIHR1cm5lZCBvZmYuIEN1cnJlbnQgZHJpdmVyIGRvZXMgbm90IHBlcm1pdAo+Pj4+
PiB0aGF0LCBmaXggaXQuCj4+Pj4KPj4+PiBJIGRvbiJ0IHVuZGVyc3RhbmQsIGl0J3MgYWxyZWFk
eSB0aGUgY2FzZS4KPj4+Pgo+Pj4+IEVUSENLX0sgaXQncyBhIGNvbXBvc2l0ZSB3aXRoIGEgTVVY
IGFuZCBhIEdBVEUuCj4+Pgo+Pj4gQnV0IEVUSENLX0sgaXMgX25vdF8gYSBjb21wb3NpdGUgY2xv
Y2ssIGxvb2sgYXQgdGhlIEZpZ3VyZSA4MyBpbiB0aGUgCj4+PiBkYXRhc2hlZXQgYWdhaW4gYW5k
IHNjaGVtYXRpYyBiZWxvdy4KPj4+Cj4+Pj4gRVRIUFRQX0sgKEVUSFBUUERJVikgaXQncyBhIGNv
bXBvc2l0ZSB3aXRoIHRoZSBzYW1lIE1VWCBhbmQgYSBESVYgCj4+Pj4gKG5vIGdhdGUpCj4+Pgo+
Pj4gQnV0IEVUSFBUUF9LIHNob3VsZG4ndCBjb250cm9sIGFueSBtdXgsIGl0IGlzIG9ubHkgYSBk
aXZpZGVyLgo+Pj4KPj4+PiBJZiB5b3UgdXNlIG9ubHkgRVRIUFRQRElWLMKgIEVUSENLRU4gZ2F0
ZSBjYW4gYmUgdHVybmVkIG9mZi4KPj4+Cj4+PiBMb29rLCB0aGlzIGlzIHdoYXQgeW91IGhhdmUg
dG9kYXk6Cj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLS0tLS0tLS0tLS0tIEVUSENL
X0sgLS0tLS0tLS0tLS0uCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHxfX19fX19fwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX19fX19fwqDCoCB8Cj4+PiBwbGw0X3BfY2stLXxNX0VU
SENLXMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8R19FVEhDS1zCoCB8Cj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgTVVYwqDCoMKgIHwtLS0tLS0rLS0tLS18IEdBVEXCoMKgIHwtLS0tLS0t
LS0tLS0tW3hdIEVUSF9DTEsKPj4+IHBsbDNfcV9jay0tfF9fX19fX18vwqDCoMKgwqDCoMKgIHzC
oMKgwqDCoCB8X19fX19fXy/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV0aF9j
bGtfZmIKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAnLS0oRVRIQ0tTRUxSWzc6NF0gZGl2aWRlciktLVt4XSBjbGtfcHRwX3JlZgo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICctLS0tLS0tLS0tLS0gRVRIUFRQX0sgLS0tLS0tLS0tLS0t
LS0tLS0tLS0nCj4+Pgo+Pj4gQW5kIHRoaXMgaXMgd2hhdCB5b3Ugc2hvdWxkIGhhdmUsIHRvIGF2
b2lkIGhhdmluZyB0d28gY29tcG9zaXRlIGNsb2NrIAo+Pj4gd2hpY2ggY29udHJvbCB0aGUgc2Ft
ZSBtdXggdXNpbmcgdGhlIHNhbWUgcmVnaXN0ZXIgYml0LCBpLmUuIHdoYXQgCj4+PiB0aGlzIHBh
dGNoIGltcGxlbWVudHM6Cj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLSBja19rZXJf
ZXRoIC0uwqAgLi0tLSBFVEhDS19LIC0tLgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8X19f
X19fX8KgwqDCoMKgwqDCoCB8wqAgfMKgwqDCoCBfX19fX19fwqDCoCB8Cj4+PiBwbGw0X3BfY2st
LXxNX0VUSENLXMKgwqDCoMKgwqAgfMKgIHzCoMKgIHxHX0VUSENLXMKgIHwKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCBNVVjCoMKgwqAgfC0tLS0tLSstLS0tLXwgR0FURcKgwqAgfC0tLS0t
LS0tLS0tLS1beF0gRVRIX0NMSwo+Pj4gcGxsM19xX2NrLS18X19fX19fXy/CoMKgwqDCoMKgwqAg
fMKgwqDCoMKgIHxfX19fX19fL8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXRo
X2Nsa19mYgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAnLS0oRVRIQ0tTRUxSWzc6NF0gZGl2aWRlciktLVt4XSBjbGtfcHRwX3Jl
Zgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAnLS0tLSBFVEhQVFBfSyAtLS0tLS0tLS0tLScKPj4+Cj4+Cj4+IFRoZXNlIDIgc29sdXRp
b25zIGFyZSB2YWxpZC4gSSBtYWRlIHRoZSBjaG9pY2UgdG8gaW1wbGVtZW50IHRoZSBmaXJzdCAK
Pj4gb25lIHRvIGJlIGFibGUgdG8gY2hhbmdlIHBhcmVudCB3aXRoIHRoZSBrZXJuZWwgY2xvY2sg
b2YgdGhlIElQIChubyAKPj4gbmVlZCB0byBhZGQgYW4gaW50ZXJtZWRpYXRlIGJpbmRpbmcpLgo+
IAo+IFdoaWNoIElQIGFyZSB5b3UgdGFsa2luZyBhYm91dCBpbiBoZXJlID8KPiAKPj4gSXQncyB0
aGUgc2FtZSBwcmluY2lwbGUgZm9yIGFsbCBrZXJuZWwgb2YgdGhpcyBzb2MuCj4gCj4gVGhlIGZp
cnN0IG9wdGlvbiBpcyB3cm9uZywgYmVjYXVzZSBpbiB0aGF0IG1vZGVsLCB5b3UgaGF2ZSB0d28g
Y29tcG9zaXRlIAo+IGNsb2NrIHdoaWNoIGNvbnRyb2wgdGhlIHNhbWUgb25lIG11eCBiaXQgaW4g
dGhlIHNhbWUgcmVnaXN0ZXIuIEJhc2ljYWxseSAKPiB5b3UgcmVnaXN0ZXIgdHdvIGRpc3RpbmN0
IGNsb2NrIHdoaWNoIG9wZXJhdGUgdGhlIHNhbWUgaGFyZHdhcmUga25vYi4KPiAKPj4gSSBjYW4g
YXNrIHRvIEFsZXhhbmRyZSB0byBjb21lYmFjayBvZiB0aGlzIHByaW5jaXBsZSwgYnV0IGkgJ20g
bm90IAo+PiBmYXZvcmFibGUuCj4gCgpUaGUgb25seSBkaXNjdXNzaW5nIHRoaW5nIGlzIGhvdyB0
aGUgY2xvY2sgaXMgc2hvd24uIEkgbWVhbiBlaXRoZXIgdHdvIApjb21wb3NpdGVzIG9yIG9uZSBt
dXggcGx1cyB0d28gZ2F0ZXMuIEdhYnJpZWwgbWFkZSBhIGNob2ljZSB0byBhYnN0cmFjdCAKdGhl
IG11eCBpbiB0d28gY29tcG9zaXRlIGNsb2Nrcy4gQnV0IGl0IHNlZW1zIHRoYXQgYXQgdGhlIGVu
ZCB3ZSBoYXZlIAp0aGUgc2FtZSBiZWhhdmlvdXIsIGlzbid0ID8KCkFkZGluZyAiY2tfa2VyX2V0
aCIgd291bGQgaW1wb3NlIGEgbmV3IGNsb2NrIHRvIHRha2UgaW4gRFQgPwoKcmVnYXJkcwphbGV4
Cgo+IFBsZWFzZSBhc2suCj4gCj4+Pj4+IFRoaXMgcGF0Y2ggY29udmVydHMgRVRIQ0tfSyBmcm9t
IGNvbXBvc2l0ZSBjbG9jayBpbnRvIGEgRVRIQ0tFTiBnYXRlLAo+Pj4+PiBFVEhQVFBfSyBmcm9t
IGNvbXBvc2l0ZSBjbG9jayBpbnRvIEVUSFBUUERJViBkaXZpZGVyLCBhbmQgYWRkcyBhbm90aGVy
Cj4+Pj4+IE5PX0lEIGNsb2NrICJja19rZXJfZXRoIiB3aGljaCBtb2RlbHMgdGhlIEVUSFNSQyBt
dXggYW5kIGlzIHBhcmVudCAKPj4+Pj4gY2xvY2sKPj4+Pj4gdG8gYm90aCBFVEhDS19LIGFuZCBF
VEhQVFBfSy4gVGhlcmVmb3JlLCBhbGwgcmVmZXJlbmNlcyB0byBFVEhDS19LIGFuZAo+Pj4+PiBF
VEhQVFBfSyByZW1haW4gZnVuY3Rpb25hbCBhcyBiZWZvcmUuCj4+Pj4+Cj4+Pj4+IFsxXSBTVE0z
Mk1QMSBSZWZlcmVuY2UgTWFudWFsIFJNMDQzNiBSZXYgMywgUGFnZSA1NzQsCj4+Pj4+IMKgwqDC
oMKgIEZpZ3VyZSA4My4gUGVyaXBoZXJhbCBjbG9jayBkaXN0cmlidXRpb24gZm9yIEV0aGVybmV0
Cj4+Pj4+IGh0dHBzOi8vd3d3LnN0LmNvbS9yZXNvdXJjZS9lbi9yZWZlcmVuY2VfbWFudWFsL2Rt
MDAzMjc2NTktc3RtMzJtcDE1Ny1hZHZhbmNlZC1hcm1iYXNlZC0zMmJpdC1tcHVzLXN0bWljcm9l
bGVjdHJvbmljcy5wZGYgCj4+Pj4+Cj4+Pgo+Pj4gWy4uLl0KPj4+Cj4+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2Nsay9jbGstc3RtMzJtcDEuYyBiL2RyaXZlcnMvY2xrL2Nsay1zdG0zMm1wMS5j
Cj4+Pj4+IGluZGV4IGE4NzU2NDlkZjhiOC4uYTdjN2Y1NDRlZTVkIDEwMDY0NAo+Pj4+PiAtLS0g
YS9kcml2ZXJzL2Nsay9jbGstc3RtMzJtcDEuYwo+Pj4+PiArKysgYi9kcml2ZXJzL2Nsay9jbGst
c3RtMzJtcDEuYwo+Pj4+PiBAQCAtMTk0OSw3ICsxOTQ5LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBjbG9ja19jb25maWcgCj4+Pj4+IHN0bTMybXAxX2Nsb2NrX2NmZ1tdID0gewo+Pj4+PiDCoMKg
wqDCoMKgIEtDTEsoRFNJX0ssICJkc2lfayIsIGRzaV9zcmMsIDAsIEdfRFNJLCBNX0RTSSksCj4+
Pj4+IMKgwqDCoMKgwqAgS0NMSyhBREZTRE1fSywgImFkZnNkbV9rIiwgc2FpX3NyYywgMCwgR19B
REZTRE0sIE1fU0FJMSksCj4+Pj4+IMKgwqDCoMKgwqAgS0NMSyhVU0JPX0ssICJ1c2JvX2siLCB1
c2JvX3NyYywgMCwgR19VU0JPLCBNX1VTQk8pLAo+Pj4+PiAtwqDCoMKgIEtDTEsoRVRIQ0tfSywg
ImV0aGNrX2siLCBldGhfc3JjLCAwLCBHX0VUSENLLCBNX0VUSENLKSwKPj4+Pj4gwqDCoMKgwqDC
oCAvKiBQYXJ0aWN1bGFyeSBLZXJuZWwgQ2xvY2tzIChubyBtdXggb3Igbm8gZ2F0ZSkgKi8KPj4+
Pj4gwqDCoMKgwqDCoCBNR0FURV9NUDEoREZTRE1fSywgImRmc2RtX2siLCAiY2tfbWN1IiwgMCwg
R19ERlNETSksCj4+Pj4+IEBAIC0xOTU4LDExICsxOTU3LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgY2xvY2tfY29uZmlnIAo+Pj4+PiBzdG0zMm1wMV9jbG9ja19jZmdbXSA9IHsKPj4+Pj4gwqDC
oMKgwqDCoCBNR0FURV9NUDEoR1BVX0ssICJncHVfayIsICJwbGwyX3EiLCAwLCBHX0dQVSksCj4+
Pj4+IMKgwqDCoMKgwqAgTUdBVEVfTVAxKERBQzEyX0ssICJkYWMxMl9rIiwgImNrX2xzaSIsIDAs
IEdfREFDMTIpLAo+Pj4+PiAtwqDCoMKgIENPTVBPU0lURShFVEhQVFBfSywgImV0aHB0cF9rIiwg
ZXRoX3NyYywgQ0xLX09QU19QQVJFTlRfRU5BQkxFIHwKPj4+Pj4gK8KgwqDCoCBDT01QT1NJVEUo
Tk9fSUQsICJja19rZXJfZXRoIiwgZXRoX3NyYywgQ0xLX09QU19QQVJFTlRfRU5BQkxFIHwKPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQsCj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX05PX0dBVEUsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgX01NVVgoTV9FVEhDSyksCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqAgX0RJVihSQ0Nf
RVRIQ0tTRUxSLCA0LCA0LCAwLCBOVUxMKSksCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgX05P
X0RJViksCj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBNR0FURV9NUDEoRVRIQ0tfSywgImV0aGNrX2si
LCAiY2tfa2VyX2V0aCIsIDAsIEdfRVRIQ0spLAo+Pj4+IGFzc2lnbmVkIHBhcmVudCB3aXRoIEVU
SENLX0sgd2lsbCBub3Qgd29yawo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgRElWKEVUSFBUUF9LLCAi
ZXRocHRwX2siLCAiY2tfa2VyX2V0aCIsIENMS19PUFNfUEFSRU5UX0VOQUJMRSB8Cj4+Pj4KPj4+
PiBDTEtfT1BTX1BBUkVOVF9FTkFCTEUgZmxhZ3Mgbm90IHVzZWZ1bCB3aXRoIGEgZGl2aWRlci4K
Pj4+Cj4+PiBIb3cgc28gPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
