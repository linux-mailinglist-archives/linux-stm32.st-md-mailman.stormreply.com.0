Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D418613A8
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 15:11:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50D84C6B47A;
	Fri, 23 Feb 2024 14:11:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 744C2C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 14:11:26 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N8C67k012818; Fri, 23 Feb 2024 15:11:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=BtiOK7zNGmf7T/HNpNbS7LRFrHlD65J1Nz54bRzladI=; b=pC
 t+DOqE5VNZYO1AF14Au2IruOE4S9FDoF3BkLNh6k7+/2X+Bh3XFjyzpTbA0vfw14
 ifnMSoqHxO1FGhffD86z63Plq+2shAbSKNSowLIt6Qbpka9JNoTzso30Z6SfpUi4
 qXaMFYNisKMw26zDwOwgHrfFmPvcNFwIPzLNocjYeGP+H+qlc3XzQ6iDLkaQKzs7
 sy8cykZ2WEd3fv2IZA3DPogrIZCRZFyD4/L3hhXmhDNFpKLxiQ0hvF5e84TiuMyW
 mpKsALRzc1TtPDGwScf8zSk82JETDKV2i8kdg2P/rD00vgSAQtNRN9IoifuF9bUC
 GnUqi1WSAfTz2AZFYpTA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3weqn41faw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 15:11:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 464FF4002D;
 Fri, 23 Feb 2024 15:10:59 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0DB42A14CB;
 Fri, 23 Feb 2024 15:10:05 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 23 Feb
 2024 15:10:05 +0100
Received: from [10.252.31.57] (10.252.31.57) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 23 Feb
 2024 15:10:04 +0100
Message-ID: <c80d0ca1-1ae3-4af3-ba84-6dc5efaff1c7@foss.st.com>
Date: Fri, 23 Feb 2024 15:10:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Naman Jain <quic_namajain@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, "Jens
 Wiklander" <jens.wiklander@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
References: <20240214172127.1022199-1-arnaud.pouliquen@foss.st.com>
 <fe4ec29f-7521-4369-a382-bae50dbf0ee5@quicinc.com>
 <adcf0c0d-f452-4285-8651-c147fcca001b@foss.st.com>
 <8af59b01-53cf-4fc4-9946-6c630fb7b38e@quicinc.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <8af59b01-53cf-4fc4-9946-6c630fb7b38e@quicinc.com>
X-Originating-IP: [10.252.31.57]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/7] Introduction of a remoteproc tee
 to load signed firmware
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

CgpPbiAyLzIyLzI0IDEwOjU1LCBOYW1hbiBKYWluIHdyb3RlOgo+IE9uIDIvMjIvMjAyNCAyOjE3
IFBNLCBBcm5hdWQgUE9VTElRVUVOIHdyb3RlOgo+PiBIZWxsbyBOYW1hbiwKPj4KPj4gT24gMi8y
Mi8yNCAwNjo0MywgTmFtYW4gSmFpbiB3cm90ZToKPj4+IE9uIDIvMTQvMjAyNCAxMDo1MSBQTSwg
QXJuYXVkIFBvdWxpcXVlbiB3cm90ZToKPj4+PiBVcGRhdGVzIGZyb20gdGhlIHByZXZpb3VzIHZl
cnNpb24gWzFdOgo+Pj4+Cj4+Pj4gVGhpcyB2ZXJzaW9uIHByb3Bvc2VzIGFub3RoZXIgYXBwcm9h
Y2ggYmFzZWQgb24gYW4gYWx0ZXJuYXRlIGxvYWQgYW5kIGJvb3QKPj4+PiBvZiB0aGUgY29wcm9j
ZXNzb3IuIFRoZXJlZm9yZSwgdGhlIGNvbnN0cmFpbnQgaW50cm9kdWNlZCBieSB0ZWVfcmVtb3Rl
cHJvYwo+Pj4+IGlzIHRoYXQgdGhlIGZpcm13YXJlIGhhcyB0byBiZSBhdXRoZW50aWNhdGVkIGFu
ZCBsb2FkZWQgYmVmb3JlIHRoZSByZXNvdXJjZQo+Pj4+IHRhYmxlIGNhbiBiZSBvYnRhaW5lZC4K
Pj4+Pgo+Pj4+IFRoZSBleGlzdGluZyBib290IHNlcXVlbmNlIGlzOiA+Cj4+Pj4gwqDCoMKgIDEp
IEdldCB0aGUgcmVzb3VyY2UgdGFibGUgYW5kIHN0b3JlIGl0IGluIGEgY2FjaGUsCj4+Pj4gwqDC
oMKgwqDCoMKgIGNhbGxpbmcgcnByb2MtPm9wcy0+cGFyc2VfZncoKS4KPj4+PiDCoMKgwqAgMikg
UGFyc2UgdGhlIHJlc291cmNlIHRhYmxlIGFuZCBoYW5kbGUgcmVzb3VyY2VzLAo+Pj4+IMKgwqDC
oMKgwqDCoCBjYWxsaW5nIHJwcm9jX2hhbmRsZV9yZXNvdXJjZXMuCj4+Pj4gwqDCoMKgIDMpIExv
YWQgdGhlIGZpcm13YXJlLCBjYWxsaW5nIHJwcm9jLT5vcHMtPmxvYWQoKS4KPj4+PiDCoMKgwqAg
NCkgU3RhcnQgdGhlIGZpcm13YXJlLCBjYWxsaW5nIHJwcm9jLT5vcHMtPnN0YXJ0KCkuCj4+Pj4g
wqDCoCA9PiBTdGVwcyAxIGFuZCAyIGFyZSBleGVjdXRlZCBpbiBycHJvY19md19ib290KCksIHdo
aWxlIHN0ZXBzIDMgYW5kIDQgYXJlCj4+Pj4gwqDCoMKgwqAgZXhlY3V0ZWQgaW4gcnByb2Nfc3Rh
cnQoKS4KPj4+PiA9PiB0aGUgdXNlIG9mIHJwcm9jLT5vcHMtPmxvYWQoKSBvcHMgaXMgbWFuZGF0
b3J5Cj4+Pj4KPj4+PiBUaGUgYm9vdCBzZXF1ZW5jZSBuZWVkZWQgZm9yIFRFRSBib290IGlzOgo+
Pj4+Cj4+Pj4gwqDCoMKgIDEpIExvYWQgdGhlIGZpcm13YXJlLgo+Pj4+IMKgwqDCoCAyKSBHZXQg
dGhlIGxvYWRlZCByZXNvdXJjZSwgbm8gY2FjaGUuCj4+Pj4gwqDCoMKgIDMpIFBhcnNlIHRoZSBy
ZXNvdXJjZSB0YWJsZSBhbmQgaGFuZGxlIHJlc291cmNlcy4KPj4+PiDCoMKgwqAgNCkgU3RhcnQg
dGhlIGZpcm13YXJlLgo+Pj4KPj4+IEhpLAo+Pj4gV2hhdCBwcm9ibGVtIGFyZSB3ZSByZWFsbHkg
YWRkcmVzc2luZyBoZXJlIGJ5IHJlb3JkZXJpbmcgbG9hZCwgcGFyc2Ugb2YKPj4+IEZXIHJlc291
cmNlcz8KPj4KPj4gVGhlIGZlYXR1cmUgaW50cm9kdWNlZCBpbiBURUUgaXMgdGhlIHNpZ25hdHVy
ZSBvZiB0aGUgZmlybXdhcmUgaW1hZ2VzLiBUaGF0Cj4+IG1lYW5zIHRoYXQgYmVmb3JlIGdldHRp
bmcgdGhlIHJlc291cmNlIHRhYmxlLCB3ZSBuZWVkIHRvIGZpcnN0IGF1dGhlbnRpY2F0ZSB0aGUK
Pj4gZmlybXdhcmUgaW1hZ2VzLgo+PiBBdXRoZW50aWNhdGluZyBhIGZpcm13YXJlIGltYWdlIG1l
YW5zIHRoYXQgd2UgaGF2ZSB0byBjb3B5IHRoZSBmaXJtd2FyZSBpbnRvCj4+IHByb3RlY3RlZCBt
ZW1vcnkgdGhhdCBjYW5ub3QgYmUgY29ycnVwdGVkIGJ5IHRoZSBub24tc2VjdXJlIGFuZCB0aGVu
IHZlcmlmeSB0aGUKPj4gc2lnbmF0dXJlLgo+PiBUaGUgc3RyYXRlZ3kgaW1wbGVtZW50ZWQgaW4g
T1AtVEVFIGlzIHRvIGxvYWQgdGhlIGZpcm13YXJlIGludG8gZGVzdGluYXRpb24KPj4gbWVtb3J5
IGFuZCB0aGVuIGF1dGhlbnRpY2F0ZSBpdC4KPj4gVGhpcyBzdHJhdGVneSBhdm9pZHMgaGF2aW5n
IGEgdGVtcG9yYXJ5IGNvcHkgb2YgdGhlIHdob2xlIGltYWdlcyBpbiBhIHNlY3VyZQo+PiBtZW1v
cnkuCj4+IFRoaXMgc3RyYXRlZ3kgaW1wb3NlcyBsb2FkaW5nIHRoZSBmaXJtd2FyZSBpbWFnZXMg
YmVmb3JlIHJldHJpZXZpbmcgdGhlIHJlc291cmNlCj4+IHRhYmxlLgo+Pgo+Pj4gQmFzaWNhbGx5
LCB3aGF0IGFyZSB0aGUgbGltaXRhdGlvbnMgb2YgdGhlIGN1cnJlbnQgZGVzaWduIHlvdSBhcmUg
cmVmZXJyaW5nIHRvPwo+Pj4gSSB1bmRlcnN0b29kIHRoYXQgVEVFIGlzIGRlc2lnbmVkIHRoYXQg
d2F5Lgo+Pgo+PiBUaGUgbGltaXRhdGlvbiBvZiB0aGUgY3VycmVudCBkZXNpZ24gaXMgdGhhdCB3
ZSBvYnRhaW4gdGhlIHJlc291cmNlIHRhYmxlIGJlZm9yZQo+PiBsb2FkaW5nIHRoZSBmaXJtd2Fy
ZS4gRm9sbG93aW5nIHRoZSBjdXJyZW50IGRlc2lnbiB3b3VsZCBpbXBvc2UgY29uc3RyYWludHMg
aW4KPj4gVEVFIHRoYXQgYXJlIG5vdCBzdHJhaWdodGZvcndhcmQuIFN0ZXAgMSAoZ2V0dGluZyB0
aGUgcmVzb3VyY2UgdGFibGUgYW5kIHN0b3JpbmcKPj4gaXQgaW4gYSBjYWNoZSkgd291bGQgcmVx
dWlyZSBoYXZpbmcgYSBjb3B5IG9mIHRoZSByZXNvdXJjZSB0YWJsZSBpbiBURUUgYWZ0ZXIKPj4g
YXV0aGVudGljYXRpbmcgdGhlIGltYWdlcy4gSG93ZXZlciwgYXV0aGVudGljYXRpbmcgdGhlIGZp
cm13YXJlLCBhcyBleHBsYWluZWQKPj4gYmVmb3JlLCBkZXBlbmRzIG9uIHRoZSBzdHJhdGVneSBp
bXBsZW1lbnRlZC4gSW4gVEVFIGltcGxlbWVudGF0aW9uLCB3ZSBsb2FkIHRoZQo+PiBmaXJtd2Fy
ZSB0byBhdXRoZW50aWNhdGUgaXQgaW4gdGhlIGRlc3RpbmF0aW9uIG1lbW9yeS4KPj4KPj4gUmVn
YXJkcywKPj4gQXJuYXVkCj4gCj4gCj4gSGVsbG8gQXJuYXVkLAo+IEkgdGhpbmsgbm93IEkgZ290
IHlvdXIgcG9pbnQuIEluIFRFRSwgeW91IGRvbid0IHdhbnQgdG8gZG8gYW55dGhpbmcocmVhZAo+
IHJlc291cmNlIHRhYmxlKSB3aXRoIEZXIGltYWdlcywgdW50aWwgaXRzIGxvYWRlZCBhbmQgYXV0
aGVudGljYXRlZC4KPiBTaW5jZSBjdXJyZW50IGRlc2lnbiB3YXMgbm90IGFsbG93aW5nIHlvdSB0
byBkbyBpdCwgeW91IGhhZCB0byByZW9yZ2FuaXplIHRoZQo+IGNvZGUgc28gdGhhdCB0aGlzIGNh
biBiZSBhY2hpZXZlZC4KPiAKPiBHZW5lcmFsbHkgc3BlYWtpbmcsIGluIGN1cnJlbnQgZGVzaWdu
LCBpZiBhdXRoZW50aWNhdGlvbiBmYWlscyBmb3Igc29tZQo+IHJlYXNvbiBsYXRlciwgb25lIGNh
biBoYW5kbGUgaXQsIGJ1dCBpdCBkZXBlbmRzIG9uIHRoZSBpbXBsZW1lbnRhdGlvbiBvZgo+IHBh
cnNlX2Z3IG9wIGlmIHRoZSBkYW1hZ2UgaXMgYWxyZWFkeSBkb25lLgo+IAo+IFBsZWFzZSBjb3Jy
ZWN0IG1lIGlmIHRoaXMgaXMgd3JvbmcgYXNzdW1wdGlvbi4KClRoYXQncyBjb3JyZWN0LgoKUmVn
YXJkcywKQXJuYXVkCgo+IFBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuCj4gCj4gUmVnYXJkcywKPiBO
YW1hbiBKYWluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
