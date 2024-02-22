Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C94785F368
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 09:48:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABAA0C6B47A;
	Thu, 22 Feb 2024 08:48:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1772C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 08:48:48 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41M5VbiF028185; Thu, 22 Feb 2024 09:48:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=MzQfgSPOvlgzIc/To6XZ7nOyLSlsNDINxhaTxuo7Bww=; b=1C
 4BRdbLbw+j2x8CxsjcrQWbVQWS2Ok6JgpboEwvLC83CeRvPE2kPdGUuMC+SlV6LX
 0IW2zyO9vcO3afRcWE3SBHZLcVMAhFDGnVQcFNcZCNUzwhZtSGKTOIDvYD0L4lX+
 3KrXwCS6G5EblEuMNNxpQ3CfzWZ6tDue7HfwsBDHIJ00LdScrZQYpZIZQmlH1wcS
 BpMFq3HEZadHoYBlyLrJ6fqRRJ6YL/6o76KfPo7JWyGAKutSmknJXduzHtnlrFg1
 4ZM5d/hMaCeaOy2OBe8xpXDxKVjnZCb3nL+B1rXoP5cqH/xliQ9FACKCvjwir4K8
 qQiXpSRS/po8b6sDsX0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wd201q8f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 09:48:31 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0EFCF40046;
 Thu, 22 Feb 2024 09:48:19 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD5F52967CA;
 Thu, 22 Feb 2024 09:47:53 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 22 Feb
 2024 09:47:53 +0100
Received: from [10.201.20.75] (10.201.20.75) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 22 Feb
 2024 09:47:52 +0100
Message-ID: <adcf0c0d-f452-4285-8651-c147fcca001b@foss.st.com>
Date: Thu, 22 Feb 2024 09:47:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Naman Jain <quic_namajain@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, "Jens
 Wiklander" <jens.wiklander@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
References: <20240214172127.1022199-1-arnaud.pouliquen@foss.st.com>
 <fe4ec29f-7521-4369-a382-bae50dbf0ee5@quicinc.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <fe4ec29f-7521-4369-a382-bae50dbf0ee5@quicinc.com>
X-Originating-IP: [10.201.20.75]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_06,2024-02-22_01,2023-05-22_02
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

SGVsbG8gTmFtYW4sCgpPbiAyLzIyLzI0IDA2OjQzLCBOYW1hbiBKYWluIHdyb3RlOgo+IE9uIDIv
MTQvMjAyNCAxMDo1MSBQTSwgQXJuYXVkIFBvdWxpcXVlbiB3cm90ZToKPj4gVXBkYXRlcyBmcm9t
IHRoZSBwcmV2aW91cyB2ZXJzaW9uIFsxXToKPj4KPj4gVGhpcyB2ZXJzaW9uIHByb3Bvc2VzIGFu
b3RoZXIgYXBwcm9hY2ggYmFzZWQgb24gYW4gYWx0ZXJuYXRlIGxvYWQgYW5kIGJvb3QKPj4gb2Yg
dGhlIGNvcHJvY2Vzc29yLiBUaGVyZWZvcmUsIHRoZSBjb25zdHJhaW50IGludHJvZHVjZWQgYnkg
dGVlX3JlbW90ZXByb2MKPj4gaXMgdGhhdCB0aGUgZmlybXdhcmUgaGFzIHRvIGJlIGF1dGhlbnRp
Y2F0ZWQgYW5kIGxvYWRlZCBiZWZvcmUgdGhlIHJlc291cmNlCj4+IHRhYmxlIGNhbiBiZSBvYnRh
aW5lZC4KPj4KPj4gVGhlIGV4aXN0aW5nIGJvb3Qgc2VxdWVuY2UgaXM6ID4KPj4gwqDCoCAxKSBH
ZXQgdGhlIHJlc291cmNlIHRhYmxlIGFuZCBzdG9yZSBpdCBpbiBhIGNhY2hlLAo+PiDCoMKgwqDC
oMKgIGNhbGxpbmcgcnByb2MtPm9wcy0+cGFyc2VfZncoKS4KPj4gwqDCoCAyKSBQYXJzZSB0aGUg
cmVzb3VyY2UgdGFibGUgYW5kIGhhbmRsZSByZXNvdXJjZXMsCj4+IMKgwqDCoMKgwqAgY2FsbGlu
ZyBycHJvY19oYW5kbGVfcmVzb3VyY2VzLgo+PiDCoMKgIDMpIExvYWQgdGhlIGZpcm13YXJlLCBj
YWxsaW5nIHJwcm9jLT5vcHMtPmxvYWQoKS4KPj4gwqDCoCA0KSBTdGFydCB0aGUgZmlybXdhcmUs
IGNhbGxpbmcgcnByb2MtPm9wcy0+c3RhcnQoKS4KPj4gwqAgPT4gU3RlcHMgMSBhbmQgMiBhcmUg
ZXhlY3V0ZWQgaW4gcnByb2NfZndfYm9vdCgpLCB3aGlsZSBzdGVwcyAzIGFuZCA0IGFyZQo+PiDC
oMKgwqAgZXhlY3V0ZWQgaW4gcnByb2Nfc3RhcnQoKS4KPj4gPT4gdGhlIHVzZSBvZiBycHJvYy0+
b3BzLT5sb2FkKCkgb3BzIGlzIG1hbmRhdG9yeQo+Pgo+PiBUaGUgYm9vdCBzZXF1ZW5jZSBuZWVk
ZWQgZm9yIFRFRSBib290IGlzOgo+Pgo+PiDCoMKgIDEpIExvYWQgdGhlIGZpcm13YXJlLgo+PiDC
oMKgIDIpIEdldCB0aGUgbG9hZGVkIHJlc291cmNlLCBubyBjYWNoZS4KPj4gwqDCoCAzKSBQYXJz
ZSB0aGUgcmVzb3VyY2UgdGFibGUgYW5kIGhhbmRsZSByZXNvdXJjZXMuCj4+IMKgwqAgNCkgU3Rh
cnQgdGhlIGZpcm13YXJlLgo+IAo+IEhpLAo+IFdoYXQgcHJvYmxlbSBhcmUgd2UgcmVhbGx5IGFk
ZHJlc3NpbmcgaGVyZSBieSByZW9yZGVyaW5nIGxvYWQsIHBhcnNlIG9mCj4gRlcgcmVzb3VyY2Vz
PwoKVGhlIGZlYXR1cmUgaW50cm9kdWNlZCBpbiBURUUgaXMgdGhlIHNpZ25hdHVyZSBvZiB0aGUg
ZmlybXdhcmUgaW1hZ2VzLiBUaGF0Cm1lYW5zIHRoYXQgYmVmb3JlIGdldHRpbmcgdGhlIHJlc291
cmNlIHRhYmxlLCB3ZSBuZWVkIHRvIGZpcnN0IGF1dGhlbnRpY2F0ZSB0aGUKZmlybXdhcmUgaW1h
Z2VzLgpBdXRoZW50aWNhdGluZyBhIGZpcm13YXJlIGltYWdlIG1lYW5zIHRoYXQgd2UgaGF2ZSB0
byBjb3B5IHRoZSBmaXJtd2FyZSBpbnRvCnByb3RlY3RlZCBtZW1vcnkgdGhhdCBjYW5ub3QgYmUg
Y29ycnVwdGVkIGJ5IHRoZSBub24tc2VjdXJlIGFuZCB0aGVuIHZlcmlmeSB0aGUKc2lnbmF0dXJl
LgpUaGUgc3RyYXRlZ3kgaW1wbGVtZW50ZWQgaW4gT1AtVEVFIGlzIHRvIGxvYWQgdGhlIGZpcm13
YXJlIGludG8gZGVzdGluYXRpb24KbWVtb3J5IGFuZCB0aGVuIGF1dGhlbnRpY2F0ZSBpdC4KVGhp
cyBzdHJhdGVneSBhdm9pZHMgaGF2aW5nIGEgdGVtcG9yYXJ5IGNvcHkgb2YgdGhlIHdob2xlIGlt
YWdlcyBpbiBhIHNlY3VyZSBtZW1vcnkuClRoaXMgc3RyYXRlZ3kgaW1wb3NlcyBsb2FkaW5nIHRo
ZSBmaXJtd2FyZSBpbWFnZXMgYmVmb3JlIHJldHJpZXZpbmcgdGhlIHJlc291cmNlCnRhYmxlLgoK
PiBCYXNpY2FsbHksIHdoYXQgYXJlIHRoZSBsaW1pdGF0aW9ucyBvZiB0aGUgY3VycmVudCBkZXNp
Z24geW91IGFyZSByZWZlcnJpbmcgdG8/Cj4gSSB1bmRlcnN0b29kIHRoYXQgVEVFIGlzIGRlc2ln
bmVkIHRoYXQgd2F5LgoKVGhlIGxpbWl0YXRpb24gb2YgdGhlIGN1cnJlbnQgZGVzaWduIGlzIHRo
YXQgd2Ugb2J0YWluIHRoZSByZXNvdXJjZSB0YWJsZSBiZWZvcmUKbG9hZGluZyB0aGUgZmlybXdh
cmUuIEZvbGxvd2luZyB0aGUgY3VycmVudCBkZXNpZ24gd291bGQgaW1wb3NlIGNvbnN0cmFpbnRz
IGluClRFRSB0aGF0IGFyZSBub3Qgc3RyYWlnaHRmb3J3YXJkLiBTdGVwIDEgKGdldHRpbmcgdGhl
IHJlc291cmNlIHRhYmxlIGFuZCBzdG9yaW5nCml0IGluIGEgY2FjaGUpIHdvdWxkIHJlcXVpcmUg
aGF2aW5nIGEgY29weSBvZiB0aGUgcmVzb3VyY2UgdGFibGUgaW4gVEVFIGFmdGVyCmF1dGhlbnRp
Y2F0aW5nIHRoZSBpbWFnZXMuIEhvd2V2ZXIsIGF1dGhlbnRpY2F0aW5nIHRoZSBmaXJtd2FyZSwg
YXMgZXhwbGFpbmVkCmJlZm9yZSwgZGVwZW5kcyBvbiB0aGUgc3RyYXRlZ3kgaW1wbGVtZW50ZWQu
IEluIFRFRSBpbXBsZW1lbnRhdGlvbiwgd2UgbG9hZCB0aGUKZmlybXdhcmUgdG8gYXV0aGVudGlj
YXRlIGl0IGluIHRoZSBkZXN0aW5hdGlvbiBtZW1vcnkuCgpSZWdhcmRzLApBcm5hdWQKCj4gCj4+
Cj4+IFRoZW4gdGhlIGNyYXNoIHJlY292ZXJ5IGFsc28gaGFzIHRvIGJlIG1hbmFnZWQuRm9yIHJl
Y292ZXJ5LCB0aGUgY2FjaGUgaXMKPj4gdXNlZCB0byB0ZW1wb3JhcmlseSBzYXZlIHRoZSByZXNv
dXJjZSB0YWJsZSBhbmQgdGhlbiByZWFwcGx5IGl0IG9uCj4+IHJlc3RhcnQ6Cj4+IMKgwqAgMSkg
U3RvcCB0aGUgcmVtb3RlIHByb2Nlc3NvciwgY2FsbGluZyBycHJvYy0+b3BzLT5zdG9wKCkuCj4+
IMKgwqAgMikgTG9hZCB0aGUgZmlybXdhcmUsIGNhbGxpbmcgcnByb2MtPm9wcy0+bG9hZCgpLgo+
PiDCoMKgIDMpIENvcHkgY2FjaGVkIHJlc291cmNlIHRhYmxlLgo+PiDCoMKgIDQpIFN0YXJ0IHRo
ZSByZW1vdGUgcHJvY2Vzc29yLCBjYWxsaW5nIHJwcm9jLT5vcHMtPnN0YXJ0KCkuCj4+Cj4+ID0+
IFRoaXMgc2VxdWVuY2UgaXMgYWxzbyBuZWVkZWQgd2hlbiBURUUgbWFuYWdlcyB0aGUgYm9vdCBv
ZiB0aGUgcmVtb3RlCj4+IMKgwqDCoCBwcm9jZXNzb3IuCj4+ID0+IFRoZSBycHJvYy0+b3BzLT5s
b2FkKCkgaXMgYWxzbyB1c2VkIGluIHJlY292ZXJ5IHNlcXVlbmNlLgo+Pgo+PiBCYXNlZCBvbiB0
aGUgc2VxdWVuY2VzIGRlc2NyaWJlZCBhYm92ZSwgdGhlIHByb3Bvc2FsIGlzIHRvOgo+Pgo+PiAt
IFJld29yayB0ZWVfcnByb2MgQVBJIHRvIGJldHRlciBtYXRjaCB0aGUgcnByb2Nfb3BzIHN0cnVj
dHVyZS4KPj4gwqDCoCBUaGlzIGFsbG93cyB0byBzaW1wbHkgbWFwIHRoZSBmdW5jdGlvbiB0byBp
bXBsZW1lbnQgdGhlIGxvYWQgb3BzLCB3aGljaAo+PiDCoMKgIGlzIG5vdCBvcHRpb25hbC4gVGhl
IHRlZV9ycHJvY19sb2FkX2Z3KCkgaXMgdXBkYXRlZCBpbiBjb25zZXF1ZW5jZS4KPj4gLSBSZW1v
dmUgdGhlIGNhbGwgb2YgcnByb2NfbG9hZF9zZWdtZW50cyBmcm9tIHJwcm9jX3N0YXJ0KCkgdG8g
ZGlzc29jaWF0ZQo+PiDCoMKgIHRoZSBsb2FkIGFuZCB0aGUgc3RhcnQuIFRoaXMgaXMgbmVjZXNz
YXJ5IHRvIGltcGxlbWVudCB0aGUgYm9vdCBzZXF1ZW5jZQo+PiDCoMKgIHJlcXVlc3RlZCBmb3Ig
dGhlIFRFRSByZW1vdGUgcHJvYyBzdXBwb3J0Lgo+PiAtIEludHJvZHVjZSBhbiBycHJvY19hbHRf
ZndfYm9vdCgpIGZ1bmN0aW9uIHRoYXQgaXMgYW4gYWx0ZXJuYXRpdmUgYm9vdAo+PiDCoMKgIHNl
cXVlbmNlLCB3aGljaCBpbXBsZW1lbnRzIHRoZSBzZXF1ZW5jZSByZXF1ZXN0ZWQgZm9yIHRoZSBU
RUUgcmVtb3RlcHJvYwo+PiDCoMKgIHN1cHBvcnQuCj4+Cj4+Cj4+IFsxXQo+PiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzIwMjQwMTE4MTAwNDMzLjM5ODQxOTYtMS1hcm5hdWQucG91bGlx
dWVuQGZvc3Muc3QuY29tL1QvCj4+Cj4+Cj4+IERlc2NyaXB0aW9uIG9mIHRoZSBmZWF0dXJlOgo+
Pgo+PiBUaGlzIHNlcmllcyBwcm9wb3NlcyB0aGUgaW1wbGVtZW50YXRpb24gb2YgYSByZW1vdGVw
cm9jIHRlZSBkcml2ZXIgdG8KPj4gY29tbXVuaWNhdGUgd2l0aCBhIFRFRSB0cnVzdGVkIGFwcGxp
Y2F0aW9uIHJlc3BvbnNpYmxlIGZvciBhdXRoZW50aWNhdGluZyBhbmQKPj4gbG9hZGluZyB0aGUg
cmVtb3RlcHJvYyBmaXJtd2FyZSBpbWFnZSBpbiBhbiBBcm0gc2VjdXJlIGNvbnRleHQuCj4+Cj4+
IDEpIFByaW5jaXBsZToKPj4KPj4gVGhlIHJlbW90ZXByb2MgdGVlIGRyaXZlciBwcm92aWRlcyBz
ZXJ2aWNlcyB0byBjb21tdW5pY2F0ZSB3aXRoIHRoZSBPUC1URUUKPj4gdHJ1c3RlZCBhcHBsaWNh
dGlvbiBydW5uaW5nIG9uIHRoZSBUcnVzdGVkIEV4ZWN1dGlvbiBDb250ZXh0IChURUUpLgo+IAo+
IHMvQ29udGV4dC9FbnZpcm9ubWVudD8KPiAKPj4gVGhlIHRydXN0ZWQgYXBwbGljYXRpb24gaW4g
VEVFIG1hbmFnZXMgdGhlIHJlbW90ZSBwcm9jZXNzb3IgbGlmZWN5Y2xlOgo+Pgo+PiAtIGF1dGhl
bnRpY2F0aW5nIGFuZCBsb2FkaW5nIGZpcm13YXJlIGltYWdlcywKPj4gLSBpc29sYXRpbmcgYW5k
IHNlY3VyaW5nIHRoZSByZW1vdGUgcHJvY2Vzc29yIG1lbW9yaWVzLAo+PiAtIHN1cHBvcnRpbmcg
bXVsdGktZmlybXdhcmUgKGUuZy4sIFRGLU0gKyBaZXBoeXIgb24gYSBDb3J0ZXgtTTMzKSwKPj4g
LSBtYW5hZ2luZyB0aGUgc3RhcnQgYW5kIHN0b3Agb2YgdGhlIGZpcm13YXJlIGJ5IHRoZSBURUUu
Cj4+Cj4gCj4gUmVnYXJkcywKPiBOYW1hbiBKYWluCj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
