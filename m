Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6C3B317DD
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 14:32:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEEABC3F95A;
	Fri, 22 Aug 2025 12:32:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAC34C3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 12:32:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCHGJl009682;
 Fri, 22 Aug 2025 14:31:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JBT1UDpbACmKUTz7QVz33kNvVsoysRpJ/dCT2cDLpW4=; b=Zahfk0R3fVBUSlts
 KqSACcCnut8KaGkwtIZecPsqlTIN+SuQG3TxqHT8iCCddekygt83cXwczb6jvr8l
 VA5fiAaU2B9eDZFRDludMIopoz/7pBF3ktLeHYyH/cMsPjipz1O0bMlQJpx4wQfS
 R/Z3uz3liKRAL6xgoz7HxXQeBAnVxPFRkQlz9/kEK8Drl08bmPIB4x2w7LuNiFd7
 tFg1Rqwtz1vEr1JgQ6B4pyq+Yd6e9hfmFKl5XtKOSJ5bNofx1m2eWSIvSe4ggcJj
 ckmbEczqw+Lql/Way9StH+kZfUmq3PrmX24dfd2vKR6z6qZLobT/H9ddXOm+zsss
 BcUoMw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48np7n752x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 14:31:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1470240046;
 Fri, 22 Aug 2025 14:30:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F9F26C2A88;
 Fri, 22 Aug 2025 14:29:43 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 14:29:42 +0200
Message-ID: <512c5e41-276d-4c2c-936c-718347df3711@foss.st.com>
Date: Fri, 22 Aug 2025 14:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-1-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-1-7060500f8fd3@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 01/13] dt-bindings: display: st: add
 two new compatibles to LTDC device
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

SGkgUmFwaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQWNrZWQtYnk6IFlhbm5pY2sgRmVy
dHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KCkxlIDIxLzA4LzIwMjUgw6AgMTM6MDgs
IFJhcGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPiBUaGUgbmV3IFNUTWljcm9lbGVjdHJv
bmljcyBTb0MgZmVhdHVyZXMgYSBkaXNwbGF5IGNvbnRyb2xsZXIgc2ltaWxhciB0bwo+IHRoZSBv
bmUgdXNlZCBpbiBwcmV2aW91cyBTb0NzLiAgQmVjYXVzZSB0aGVyZSBpcyBhZGRpdGlvbmFsIHJl
Z2lzdGVycywKPiBhbmQgZGlmZmVyZW50IG1hbmRhdG9yeSBjbG9ja3MgaXQgaXMgaW5jb21wYXRp
YmxlIHdpdGggZXhpc3RpbmcgSVBzLiAgT24KPiBTVE0zMk1QMjUxLCB0aGUgZGV2aWNlIG9ubHkg
bmVlZHMgdHdvIGNsb2NrcyB3aGlsZSBvbiBTVE0zMk1QMjU1IGl0Cj4gbmVlZHMgZm91ci4KPgo+
IEFkZCB0aGUgbmV3IG5hbWVzIHRvIHRoZSBsaXN0IG9mIGNvbXBhdGlibGUgc3RyaW5nIGFuZCBo
YW5kbGUgZWFjaAo+IHF1aXJrcyBhY2NvcmRpbmdseS4KPgo+IFNpZ25lZC1vZmYtYnk6IFJhcGhh
ZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+Cj4gLS0tCj4g
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMueWFtbCB8IDUw
ICsrKysrKysrKysrKysrKysrKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMueWFtbAo+IGluZGV4IGQ2
ZWE0ZDYyYTJjZmFlMjYzNTNjOWYyMGEzMjZhNDMyOWZlZDNhMmYuLmJjZWRjZmVmNTQyN2Y1NzI1
YTA0NzNjMDk2MjhlNzBkMTcyYzhmNTggMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy55YW1sCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy55YW1sCj4g
QEAgLTEyLDcgKzEyLDEwIEBAIG1haW50YWluZXJzOgo+ICAgCj4gICBwcm9wZXJ0aWVzOgo+ICAg
ICBjb21wYXRpYmxlOgo+IC0gICAgY29uc3Q6IHN0LHN0bTMyLWx0ZGMKPiArICAgIGVudW06Cj4g
KyAgICAgIC0gc3Qsc3RtMzItbHRkYwo+ICsgICAgICAtIHN0LHN0bTMybXAyNTEtbHRkYwo+ICsg
ICAgICAtIHN0LHN0bTMybXAyNTUtbHRkYwo+ICAgCj4gICAgIHJlZzoKPiAgICAgICBtYXhJdGVt
czogMQo+IEBAIC0yNCwxMSArMjcsMTYgQEAgcHJvcGVydGllczoKPiAgICAgICBtaW5JdGVtczog
MQo+ICAgCj4gICAgIGNsb2NrczoKPiAtICAgIG1heEl0ZW1zOiAxCj4gKyAgICBtaW5JdGVtczog
MQo+ICsgICAgbWF4SXRlbXM6IDQKPiAgIAo+ICAgICBjbG9jay1uYW1lczoKPiAgICAgICBpdGVt
czoKPiAgICAgICAgIC0gY29uc3Q6IGxjZAo+ICsgICAgICAtIGNvbnN0OiBidXMKPiArICAgICAg
LSBjb25zdDogcmVmCj4gKyAgICAgIC0gY29uc3Q6IGx2ZHMKPiArICAgIG1pbkl0ZW1zOiAxCj4g
ICAKPiAgICAgcmVzZXRzOgo+ICAgICAgIG1heEl0ZW1zOiAxCj4gQEAgLTUxLDYgKzU5LDQ0IEBA
IHJlcXVpcmVkOgo+ICAgICAtIHJlc2V0cwo+ICAgICAtIHBvcnQKPiAgIAo+ICthbGxPZjoKPiAr
ICAtIGlmOgo+ICsgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4gKyAg
ICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICAgZW51bToKPiArICAgICAgICAgICAgICAt
IHN0LHN0bTMyLWx0ZGMKPiArICAgIHRoZW46Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAg
ICAgY2xvY2tzOgo+ICsgICAgICAgICAgbWF4SXRlbXM6IDEKPiArICAgICAgICBjbG9jay1uYW1l
czoKPiArICAgICAgICAgIG1heEl0ZW1zOiAxCj4gKyAgLSBpZjoKPiArICAgICAgcHJvcGVydGll
czoKPiArICAgICAgICBjb21wYXRpYmxlOgo+ICsgICAgICAgICAgY29udGFpbnM6Cj4gKyAgICAg
ICAgICAgIGVudW06Cj4gKyAgICAgICAgICAgICAgLSBzdCxzdG0zMm1wMjUxLWx0ZGMKPiArICAg
IHRoZW46Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICAgY2xvY2tzOgo+ICsgICAgICAg
ICAgbWF4SXRlbXM6IDIKPiArICAgICAgICBjbG9jay1uYW1lczoKPiArICAgICAgICAgIG1heEl0
ZW1zOiAyCj4gKyAgLSBpZjoKPiArICAgICAgcHJvcGVydGllczoKPiArICAgICAgICBjb21wYXRp
YmxlOgo+ICsgICAgICAgICAgY29udGFpbnM6Cj4gKyAgICAgICAgICAgIGVudW06Cj4gKyAgICAg
ICAgICAgICAgLSBzdCxzdG0zMm1wMjU1LWx0ZGMKPiArICAgIHRoZW46Cj4gKyAgICAgIHByb3Bl
cnRpZXM6Cj4gKyAgICAgICAgY2xvY2tzOgo+ICsgICAgICAgICAgbWluSXRlbXM6IDQKPiArICAg
ICAgICBjbG9jay1uYW1lczoKPiArICAgICAgICAgIG1pbkl0ZW1zOiA0Cj4gKwo+ICAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4gICAKPiAgIGV4YW1wbGVzOgo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
