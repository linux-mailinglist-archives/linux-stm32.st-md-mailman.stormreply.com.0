Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E647E5804
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Nov 2023 14:39:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47BBCC6B44D;
	Wed,  8 Nov 2023 13:39:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1684C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Nov 2023 13:39:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A8CPMZw030934; Wed, 8 Nov 2023 14:38:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=DFtbioxDNAXutgfgT//Bjlhv4YfwX1TOTV2WWZ22Sg8=; b=3b
 bwDlG5yB3UQTGKy8BeullFID2SRBZpoCYcfJU+dmAYT0Z8gapcJR5nbYeZl/OuqY
 b1T5LsHx+SPyhGc5FAT0q/RlR/PmvxBMLnGJsXwT4o2qbmCV6rzjX6K2Plm/T50Y
 HthxmrPRDceYOrB9IC5Hh1NNAk6Onsw/JzrBFskN3nu1EuEiznEj2tuBVMKTBge0
 fIzLPCYvzOnJzaLO6I/HrB2zPbx4enLPi9TLoOrWlHgTtpnpUmTXdmqEPNwh/6iV
 9A6F9+DSSmWRTMj/90jOVKZgzlq2jGrnjuPY1MJJqrZOs5CoVwk5pxP2/hvp6zAw
 eAQySHz0eyE7HsUjLMDQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u7w26bkp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Nov 2023 14:38:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C96C5100056;
 Wed,  8 Nov 2023 14:38:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9BB3F2207B0;
 Wed,  8 Nov 2023 14:38:50 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 8 Nov
 2023 14:38:49 +0100
Message-ID: <35fb85cd-4c4c-48f5-802b-82f2df360437@foss.st.com>
Date: Wed, 8 Nov 2023 14:38:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20230904180635.923506-1-dario.binacchi@amarulasolutions.com>
 <5e75b5fd-c351-1f42-94ed-b6dc1d3f030e@foss.st.com>
 <CABGWkvquib1WEKGR-DFiNN62gLcYF3Y==K29_w-=9pV0gnjEqg@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CABGWkvquib1WEKGR-DFiNN62gLcYF3Y==K29_w-=9pV0gnjEqg@mail.gmail.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-08_01,2023-11-08_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH] ARM: dts: stm32f469-disco: use the
 same 3v3 for SD and DSI nodes
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

SGkgRGFyaW8KCgoKT24gMTAvMjMvMjMgMTM6MDAsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IEhl
bGxvIEFsZXhhbmRyZSwKPiAKPiBPbiBUaHUsIFNlcCAxNCwgMjAyMyBhdCAxMDo1N+KAr0FNIEFs
ZXhhbmRyZSBUT1JHVUUKPiA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+
Cj4+IE9uIDkvNC8yMyAyMDowNiwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4+PiBJbiB0aGUgYm9h
cmQgc2NoZW1hdGljLCB0aGUgcG93ZXIgc3VwcGx5IGZvciB0aGUgU0QgY2FyZCBpcyB0aGUgc2Ft
ZSAzLjMKPj4+IHZvbHRzIHVzZWQgdG8gcG93ZXIgdGhlIExDRCBwYW5lbCBhbmQgb3RoZXIgcGVy
aXBoZXJhbHMuIEJ5IGdlbmVyYWxpemluZwo+Pj4gdGhlIG5hbWUgb2YgdGhlIHZvbHRhZ2UgcmVn
dWxhdG9yLCBpdCBzaW1wbGlmaWVzIHRoZSBkZXZpY2UgdHJlZSBhbmQgbWFrZXMKPj4+IGl0IG1v
cmUgcmVhZGFibGUuCj4+Pgo+Pgo+PiBJdCBtYWtlcyBzZW5zIGFzIGl0IGlzIHRoZSBzYW1lIGRp
c2NyZXQgcmVndWxhdG9yIChubyBwbWljIGludm9sdmVkKS4KPj4KPiAKPiBJIGRvbid0IHNlZSBp
dCBhcHBsaWVkIHRvIGxpbnV4LXN0bTMyL25leHQuIElzIHNvbWV0aGluZyBtaXNzaW5nPwoKb2ss
IEl0IGlzIGJlY2F1c2UgdGhlIFtSRkMuLl0gaGFzIGJlZW4ga2VwdC4gUGxlYXNlIHJlc2VuZCBi
eSBkcm9wcGluZyBpdC4KCkNoZWVycwpBbGV4Cgo+IAo+IFRoYW5rcyBhbmQgcmVnYXJkcywKPiBE
YXJpbwo+IAo+PiByZWdhcmRzCj4+IEFsZXgKPj4KPj4+IExpbms6IGh0dHBzOi8vd3d3LnN0LmNv
bS9lbi9ldmFsdWF0aW9uLXRvb2xzLzMyZjQ2OWlkaXNjb3ZlcnkuaHRtbCNjYWQtcmVzb3VyY2Vz
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVs
YXNvbHV0aW9ucy5jb20+Cj4+Pgo+Pj4gLS0tCj4+Pgo+Pj4gICAgYXJjaC9hcm0vYm9vdC9kdHMv
c3Qvc3RtMzJmNDY5LWRpc2NvLmR0cyB8IDE1ICsrKystLS0tLS0tLS0tLQo+Pj4gICAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjQ2OS1kaXNjby5kdHMgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMmY0NjktZGlzY28uZHRzCj4+PiBpbmRleCBjYmJkNTIxYmYwMTAu
LjhhNGY4ZGRkMDgzZCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMy
ZjQ2OS1kaXNjby5kdHMKPj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjQ2OS1k
aXNjby5kdHMKPj4+IEBAIC02OSwxNiArNjksOSBAQCBhbGlhc2VzIHsKPj4+ICAgICAgICAgICAg
ICAgIHNlcmlhbDAgPSAmdXNhcnQzOwo+Pj4gICAgICAgIH07Cj4+Pgo+Pj4gLSAgICAgbW1jX3Zj
YXJkOiBtbWNfdmNhcmQgewo+Pj4gKyAgICAgdmNjXzN2MzogdmNjLTN2MyB7Cj4+PiAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7Cj4+PiAtICAgICAgICAgICAg
IHJlZ3VsYXRvci1uYW1lID0gIm1tY192Y2FyZCI7Cj4+PiAtICAgICAgICAgICAgIHJlZ3VsYXRv
ci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+Owo+Pj4gLSAgICAgICAgICAgICByZWd1bGF0b3It
bWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKPj4+IC0gICAgIH07Cj4+PiAtCj4+PiAtICAgICB2
ZGRfZHNpOiB2ZGQtZHNpIHsKPj4+IC0gICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0
b3ItZml4ZWQiOwo+Pj4gLSAgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJ2ZGRfZHNpIjsK
Pj4+ICsgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAidmNjXzN2MyI7Cj4+PiAgICAgICAg
ICAgICAgICByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKPj4+ICAgICAgICAg
ICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Owo+Pj4gICAgICAgIH07
Cj4+PiBAQCAtMTY0LDcgKzE1Nyw3IEBAIHBhbmVsQDAgewo+Pj4gICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJvcmlzZXRlY2gsb3RtODAwOWEiOwo+Pj4gICAgICAgICAgICAgICAgcmVnID0g
PDA+OyAvKiBkc2kgdmlydHVhbCBjaGFubmVsICgwLi4zKSAqLwo+Pj4gICAgICAgICAgICAgICAg
cmVzZXQtZ3Bpb3MgPSA8JmdwaW9oIDcgR1BJT19BQ1RJVkVfTE9XPjsKPj4+IC0gICAgICAgICAg
ICAgcG93ZXItc3VwcGx5ID0gPCZ2ZGRfZHNpPjsKPj4+ICsgICAgICAgICAgICAgcG93ZXItc3Vw
cGx5ID0gPCZ2Y2NfM3YzPjsKPj4+ICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPj4+
Cj4+PiAgICAgICAgICAgICAgICBwb3J0IHsKPj4+IEBAIC0yMTksNyArMjEyLDcgQEAgdGltZXJA
MiB7Cj4+Pgo+Pj4gICAgJnNkaW8gewo+Pj4gICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPj4+IC0g
ICAgIHZtbWMtc3VwcGx5ID0gPCZtbWNfdmNhcmQ+Owo+Pj4gKyAgICAgdm1tYy1zdXBwbHkgPSA8
JnZjY18zdjM+Owo+Pj4gICAgICAgIGNkLWdwaW9zID0gPCZncGlvZyAyIEdQSU9fQUNUSVZFX0xP
Vz47Cj4+PiAgICAgICAgYnJva2VuLWNkOwo+Pj4gICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCIsICJvcGVuZHJhaW4iOwo+Pgo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
