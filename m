Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3743A395BD
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 09:42:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95AC4C78F87;
	Tue, 18 Feb 2025 08:42:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAA69C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 08:42:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51I8ERDf013018;
 Tue, 18 Feb 2025 09:41:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 m+3/1tyVa1Qn4CQ2/7kBF87oG9qDd6zKjpbib5cEEhE=; b=Ibz22OBmZ62P3bGD
 d9E/xAJHN3cUuLw6amZCi2WWuYjp70NmQobfeWx0UUlMYN3KpuVUe6u1hoM0qaAE
 9SgLRIBxnVmEiUgdp6UrOsHvA052TQEQhIpkR0zY8M5GdkP8d9XsV+9eShy8yn1A
 bvBdCsUoezygapIyhY5BxOckyFjaN3SNjKdR9BetHfFXiw27JnOYrA7PRk3WY679
 yvfANtotS6xK1YwFXOr8PmEW0JQND75PIzBoaw4a3jEoF9i+OTyPWheb5zcHx3Y7
 wKdFKVykqQ5c6ym7Np1M1SbG1oDYAH7U2leUlpW8tiESvHiI8NHicGX4uF6iRXte
 nK+SRg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44tkttu4rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2025 09:41:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D30AE40044;
 Tue, 18 Feb 2025 09:40:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7E7C2F80C7;
 Tue, 18 Feb 2025 09:39:32 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 09:39:32 +0100
Message-ID: <ad738b22-7d09-4734-a546-759c23222925@foss.st.com>
Date: Tue, 18 Feb 2025 09:39:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann
 <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
 <20250210131826.220318-2-patrice.chotard@foss.st.com>
 <67fe157ce8ca3c3c4e08451da52f7c94f73439b2.camel@pengutronix.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <67fe157ce8ca3c3c4e08451da52f7c94f73439b2.camel@pengutronix.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_03,2025-02-18_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/8] dt-bindings: spi: Add STM32 OSPI
	controller
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

CgpPbiAyLzE3LzI1IDEwOjE3LCBQaGlsaXBwIFphYmVsIHdyb3RlOgo+IE9uIE1vLCAyMDI1LTAy
LTEwIGF0IDE0OjE4ICswMTAwLCBwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20gd3JvdGU6Cj4+
IEZyb206IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pgo+
PiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBTVE0zMiBPU1BJIGNvbnRyb2xsZXIu
Cj4+Cj4+IE1haW4gZmVhdHVyZXMgb2YgdGhlIE9jdG8tU1BJIGNvbnRyb2xsZXIgOgo+PiAgIC0g
c3VwcG9ydCBzTk9SIC8gc05BTkQgLyBIeXBlclJBTeKEoiBhbmQgSHlwZXJGbGFzaOKEoiBkZXZp
Y2VzLgo+PiAgIC0gVGhyZWUgZnVuY3Rpb25hbCBtb2RlczogaW5kaXJlY3QsIGF1dG9tYXRpYy1z
dGF0dXMgcG9sbGluZywKPj4gICAgIG1lbW9yeS1tYXBwZWQuCj4+ICAgLSBVcCB0byA0IEdieXRl
cyBvZiBleHRlcm5hbCBtZW1vcnkgY2FuIGJlIGFkZHJlc3NlZCBpbiBpbmRpcmVjdAo+PiAgICAg
bW9kZSAocGVyIHBoeXNpY2FsIHBvcnQgYW5kIHBlciBDUyksIGFuZCB1cCB0byAyNTYgTWJ5dGVz
IGluCj4+ICAgICBtZW1vcnktbWFwcGVkIG1vZGUgKGNvbWJpbmVkIGZvciBib3RoIHBoeXNpY2Fs
IHBvcnRzIGFuZCBwZXIgQ1MpLgo+PiAgIC0gU2luZ2xlLSwgZHVhbC0sIHF1YWQtLCBhbmQgb2N0
YWwtU1BJIGNvbW11bmljYXRpb24uCj4+ICAgLSBEdWFsLXF1YWQgY29tbXVuaWNhdGlvbi4KPj4g
ICAtIFNpbmdsZSBkYXRhIHJhdGUgKFNEUikgYW5kIGRvdWJsZSB0cmFuc2ZlciByYXRlIChEVFIp
Lgo+PiAgIC0gTWF4aW11bSB0YXJnZXQgZnJlcXVlbmN5IGlzIDEzMyBNSHogZm9yIFNEUiBhbmQg
MTMzIE1IeiBmb3IgRFRSLgo+PiAgIC0gRGF0YSBzdHJvYmUgc3VwcG9ydC4KPj4gICAtIERNQSBj
aGFubmVsIGZvciBpbmRpcmVjdCBtb2RlLgo+PiAgIC0gRG91YmxlIENTIG1hcHBpbmcgdGhhdCBh
bGxvd3MgdHdvIGV4dGVybmFsIGZsYXNoIGRldmljZXMgdG8gYmUKPj4gICAgIGFkZHJlc3NlZCB3
aXRoIGEgc2luZ2xlIE9DVE9TUEkgY29udHJvbGxlciBtYXBwZWQgb24gYSBzaW5nbGUKPj4gICAg
IE9DVE9TUEkgcG9ydC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRy
aWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgLi4uL2JpbmRpbmdzL3NwaS9zdCxz
dG0zMm1wMjUtb3NwaS55YW1sICAgICAgIHwgMTA1ICsrKysrKysrKysrKysrKysrKwo+PiAgMSBm
aWxlIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zdCxzdG0zMm1wMjUtb3NwaS55YW1s
Cj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3Bp
L3N0LHN0bTMybXAyNS1vc3BpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3BpL3N0LHN0bTMybXAyNS1vc3BpLnlhbWwKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4g
aW5kZXggMDAwMDAwMDAwMDAwLi41ZjI3NmYyN2RjNGMKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMybXAyNS1vc3Bp
LnlhbWwKPj4gQEAgLTAsMCArMSwxMDUgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4g
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc3BpL3N0LHN0bTMybXAyNS1vc3Bp
LnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMiBPY3RhbCBT
ZXJpYWwgUGVyaXBoZXJhbCBJbnRlcmZhY2UgKE9TUEkpCj4+ICsKPj4gK21haW50YWluZXJzOgo+
PiArICAtIFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAr
Cj4+ICthbGxPZjoKPj4gKyAgLSAkcmVmOiBzcGktY29udHJvbGxlci55YW1sIwo+PiArCj4+ICtw
cm9wZXJ0aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiArICAgIGNvbnN0OiBzdCxzdG0zMm1wMjUt
b3NwaQo+PiArCj4+ICsgIHJlZzoKPj4gKyAgICBtYXhJdGVtczogMQo+PiArCj4+ICsgIG1lbW9y
eS1yZWdpb246Cj4+ICsgICAgZGVzY3JpcHRpb246Cj4+ICsgICAgICBNZW1vcnkgcmVnaW9uIHRv
IGJlIHVzZWQgZm9yIG1lbW9yeS1tYXAgcmVhZCBhY2Nlc3MuCj4+ICsgICAgICBJbiBtZW1vcnkt
bWFwcGVkIG1vZGUsIHJlYWQgYWNjZXNzIGFyZSBwZXJmb3JtZWQgZnJvbSB0aGUgbWVtb3J5Cj4+
ICsgICAgICBkZXZpY2UgdXNpbmcgdGhlIGRpcmVjdCBtYXBwaW5nLgo+PiArICAgIG1heEl0ZW1z
OiAxCj4+ICsKPj4gKyAgY2xvY2tzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgaW50
ZXJydXB0czoKPj4gKyAgICBtYXhJdGVtczogMQo+PiArCj4+ICsgIHJlc2V0czoKPj4gKyAgICBp
dGVtczoKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IHBoYW5kbGUgdG8gT1NQSSBibG9jayByZXNl
dAo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogcGhhbmRsZSB0byBkZWxheSBibG9jayByZXNldAo+
IAo+IEFyZSB5b3UgcG9zaXRpdmUgdGhhdCB0aGVzZSB3aWxsIG9ubHkgZXZlciBoYXZlIHRvIGJl
IHJlc2V0IHRvZ2V0aGVyPwo+IE90aGVyd2lzZSBJJ2QgYWRkIGEgcmVzZXQtbmFtZXMgcHJvcGVy
dHkganVzdCBpbiBjYXNlLgoKWWVzIGkgY29uZmlybSB0aGF0IHRoZXNlIGJvdGggcmVzZXQgYXJl
IHJlc2V0IHRvZ2V0aGVyLgoKVGhhbmtzClBhdHJpY2UKCj4gCj4gcmVnYXJkcwo+IFBoaWxpcHAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
