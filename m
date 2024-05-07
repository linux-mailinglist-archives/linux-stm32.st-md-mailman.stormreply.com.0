Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E23C88BE24F
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 14:38:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F9EAC5E2D2;
	Tue,  7 May 2024 12:38:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80121CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 12:38:49 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447BU3o7015293;
 Tue, 7 May 2024 14:38:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=3qiNad6x8nitVdBqmEwvTox+u+eOjMKAzrRDqOFgNqk=; b=yU
 pJq8RbP6KPnmwTrLGmrjcNLqKBOgXfewISyJ56HJGVNPlxB8OJSXZtpYCPgLx9FK
 qVQmy/NnXOuxKJV3lbKDHz9sKvzctFg/v0NrjNu1FJlfWrsEXceSHbUVLuyd8O3h
 ssMde6+uKwJ8gNT80JL8n3rzuI0wje4rR8Cc5zYzDViXOhQ6WDL8I3DOjrPvCam1
 kv+eeYFAFeXedgUOLaZZ75hSVIubXdGx47WzLDBumLqUlz8aCzh7qFvB+RXHv8cE
 Z1ul+T3OKKFRbu7OZPN3kAqT7RKR6XRXZ09jk3su4OD6LPtdMHwwXSlSTFTjmzjj
 xrKfe9vGo/yvLCKQ/H5g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xwxk1hv16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 May 2024 14:38:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7F3914002D;
 Tue,  7 May 2024 14:38:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F2F1921A8F6;
 Tue,  7 May 2024 14:37:38 +0200 (CEST)
Received: from [10.48.86.143] (10.48.86.143) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 14:37:38 +0200
Message-ID: <41d66c51-be2d-43a5-9dfd-9e94304980dd@foss.st.com>
Date: Tue, 7 May 2024 14:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20240423123302.1550592-1-amelie.delaunay@foss.st.com>
 <20240423123302.1550592-6-amelie.delaunay@foss.st.com>
 <38193848-597d-47c1-9aea-5357e58f9983@wanadoo.fr>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <38193848-597d-47c1-9aea-5357e58f9983@wanadoo.fr>
X-Originating-IP: [10.48.86.143]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_06,2024-05-06_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/12] dmaengine: Add STM32 DMA3 support
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

SGkgQ2hyaXN0b3BoZSwKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCk9uIDUvNC8yNCAxNjoyNywg
Q2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgo+IExlIDIzLzA0LzIwMjQgw6AgMTQ6MzIsIEFtZWxp
ZSBEZWxhdW5heSBhIMOpY3JpdMKgOgo+PiBTVE0zMiBETUEzIGRyaXZlciBzdXBwb3J0cyB0aGUg
MyBoYXJkd2FyZSBjb25maWd1cmF0aW9ucyBvZiB0aGUgU1RNMzIgCj4+IERNQTMKPj4gY29udHJv
bGxlcjoKPj4gLSBMUERNQSAoTG93IFBvd2VyKTogNCBjaGFubmVscywgbm8gRklGTwo+PiAtIEdQ
RE1BIChHZW5lcmFsIFB1cnBvc2UpOiAxNiBjaGFubmVscywgRklGTyBmcm9tIDggdG8gMzIgYnl0
ZXMKPj4gLSBIUERNQSAoSGlnaCBQZXJmb3JtYW5jZSk6IDE2IGNoYW5uZWxzLCBGSUZPIGZyb20g
OCB0byAyNTYgYnl0ZXMKPj4gSGFyZHdhcmUgY29uZmlndXJhdGlvbiBvZiB0aGUgY2hhbm5lbHMg
aXMgcmV0cmlldmVkIGZyb20gdGhlIGhhcmR3YXJlCj4+IGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJz
Lgo+PiBUaGUgY2xpZW50IGNhbiBzcGVjaWZ5IGl0cyBjaGFubmVsIHJlcXVpcmVtZW50cyB0aHJv
dWdoIGRldmljZSB0cmVlLgo+PiBTVE0zMiBETUEzIGNoYW5uZWxzIGNhbiBiZSBpbmRpdmlkdWFs
bHkgcmVzZXJ2ZWQgZWl0aGVyIGJlY2F1c2UgdGhleSBhcmUKPj4gc2VjdXJlLCBvciBkZWRpY2F0
ZWQgdG8gYW5vdGhlciBDUFUuCj4+IEluZGVlZCwgY2hhbm5lbHMgYXZhaWxhYmlsaXR5IGRlcGVu
ZHMgb24gUmVzb3VyY2UgSXNvbGF0aW9uIEZyYW1ld29yawo+PiAoUklGKSBjb25maWd1cmF0aW9u
LiBSSUYgZ3JhbnRzIGFjY2VzcyB0byBidXNlcyB3aXRoIENvbXBhcnRpbWVudCBJRAo+PiAoQ0lG
KSBmaWx0ZXJpbmcsIHNlY3VyZSBhbmQgcHJpdmlsZWdlIGxldmVsLiBJdCBhbHNvIGFzc2lnbnMg
RE1BIGNoYW5uZWxzCj4+IHRvIG9uZSBvciBzZXZlcmFsIHByb2Nlc3NvcnMuCj4+IERNQSBjaGFu
bmVscyB1c2VkIGJ5IExpbnV4IHNob3VsZCBiZSBDSUQtZmlsdGVyZWQgYW5kIHN0YXRpY2FsbHkg
YXNzaWduZWQKPj4gdG8gQ0lEMSBvciBzaGFyZWQgd2l0aCBvdGhlciBDUFVzIGJ1dCB1c2luZyBz
ZW1hcGhvcmUuIEluIGNhc2UgQ0lECj4+IGZpbHRlcmluZyBpcyBub3QgY29uZmlndXJlZCwgZG1h
LWNoYW5uZWwtbWFzayBwcm9wZXJ0eSBjYW4gYmUgdXNlZCB0bwo+PiBzcGVjaWZ5IGF2YWlsYWJs
ZSBETUEgY2hhbm5lbHMgdG8gdGhlIGtlcm5lbCwgb3RoZXJ3aXNlIHN1Y2ggY2hhbm5lbHMKPj4g
d2lsbCBiZSBtYXJrZWQgYXMgcmVzZXJ2ZWQgYW5kIGNhbid0IGJlIHVzZWQgYnkgTGludXguCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEFtZWxpZSBEZWxhdW5heSAKPj4gPGFtZWxpZS5kZWxhdW5heS1y
ajBJZWwvSlI0TkJEZ2pLN3k3VFVRQHB1YmxpYy5nbWFuZS5vcmc+Cj4+IC0tLQo+IAo+IC4uLgo+
IAo+PiArwqDCoMKgIHBtX3J1bnRpbWVfc2V0X2FjdGl2ZSgmcGRldi0+ZGV2KTsKPj4gK8KgwqDC
oCBwbV9ydW50aW1lX2VuYWJsZSgmcGRldi0+ZGV2KTsKPj4gK8KgwqDCoCBwbV9ydW50aW1lX2dl
dF9ub3Jlc3VtZSgmcGRldi0+ZGV2KTsKPj4gK8KgwqDCoCBwbV9ydW50aW1lX3B1dCgmcGRldi0+
ZGV2KTsKPj4gKwo+PiArwqDCoMKgIGRldl9pbmZvKCZwZGV2LT5kZXYsICJTVE0zMiBETUEzIHJl
Z2lzdGVyZWQgcmV2OiVsdS4lbHVcbiIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgIEZJRUxEX0dFVChW
RVJSX01BSlJFViwgdmVyciksIEZJRUxEX0dFVChWRVJSX01JTlJFViwgdmVycikpOwo+PiArCj4+
ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICsKPj4gK2Vycl9jbGtfZGlzYWJsZToKPj4gK8KgwqDCoCBj
bGtfZGlzYWJsZV91bnByZXBhcmUoZGRhdGEtPmNsayk7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4g
cmV0Owo+PiArfQo+PiArCj4+ICtzdGF0aWMgdm9pZCBzdG0zMl9kbWEzX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiArewo+PiArwqDCoMKgIHBtX3J1bnRpbWVfZGlzYWJs
ZSgmcGRldi0+ZGV2KTsKPiAKPiBIaSwKPiAKPiBtaXNzaW5nIGNsa19kaXNhYmxlX3VucHJlcGFy
ZShkZGF0YS0+Y2xrKTs/Cj4gCj4gYXMgaW4gdGhlIGVycm9yIGhhbmRsaW5nIHBhdGggb24gdGhl
IHByb2JlIGp1c3QgYWJvdmU/Cj4gCj4gQ0oKPiAKCkNsb2NrIGlzIGVudGlyZWx5IG1hbmFnZWQg
YnkgcG1fcnVudGltZSwgZXhjZXB0IGluIGVycm9yIHBhdGggb2YgcHJvYmUgCnNpbmNlIHBtX3J1
bnRpbWUgaXMgZW5hYmxlZCBvbmx5IGF0IHRoZSB2ZXJ5IGVuZC4KQ2xvY2sgaXMgZW5hYmxlZCB3
aXRoIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKSB3aGVuIGEgY2hhbm5lbCBpcyAKcmVxdWVz
dGVkIG9yIHdoZW4gYW4gYXN5bmNocm9ub3VzIHJlZ2lzdGVyIGFjY2VzcyBvY2N1cnMgKGZpbHRl
cl9mbiwgCmRlYnVnZnMsIHJ1bnRpbWVfcmVzdW1lKSBhbmQgY2xvY2sgaXMgZGlzYWJsZWQgd2l0
aCAKcG1fcnVudGltZV9wdXRfc3luYygpIHdoZW4gcmVsZWFzaW5nIGEgY2hhbm5lbCBvciBhdCB0
aGUgZW5kIG9mIAphc3luY2hyb25vdXMgcmVnaXN0ZXIgYWNjZXNzIChmaWx0ZXJfZm4sIGRlYnVn
ZnMsIHJ1bnRpbWVfc3VzcGVuZCkuCkFkZGluZyBjbGtfZGlzYWJsZV91bnByZXBhcmUoZGRhdGEt
PmNsayk7IGhlcmUgbGVhZHMgdG8gY2xvY2sgYWxyZWFkeSAKZGlzYWJsZWQvdW5wcmVwYXJlZCB3
YXJuaW5ncyBpbiBkcml2ZXJzL2Nsay9jbGsuYyAKY2xrX2NvcmVfZGlzYWJsZSgpL2Nsa19jb3Jl
X3VucHJlcGFyZSgpLgoKPj4gK30KPiAKPiAuLi4KPiAKClJlZ2FyZHMsCkFtZWxpZQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
