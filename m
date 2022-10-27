Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E070560FB85
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Oct 2022 17:11:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85750C04003;
	Thu, 27 Oct 2022 15:11:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94CCDC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 15:11:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RD5jsK014867;
 Thu, 27 Oct 2022 17:11:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Ub/UuR49D98JnSHq7xzP8q4azrXYgGYGBiD0zPIpIJ8=;
 b=qTM77UVu7ZQvg3xadL0m3caMY1WyMSlAIjuye2hIHVfkrOfU1oBraFX3wopVy8LRBRnq
 UrRgEEAAuSzAL4umWmohZxkFr5ZH/0+3aqwS/jEMIFsLr4STItNvektz4QjkM6I+7u63
 SWXNGwJf09ERbw4N3/71GvLG3uP1BLwkpyjEvLyvhlTBELC6yuZqV71rODFUybyrokAj
 u2zdVGKrFge1F1nYGiUp/9fcVkci+pVBWLMxmPsXPfV9M67TmfLa4Clz9/xHcF94gSwL
 bxA0Fb0Y7W83mi9w9LZNTyRj7FA3bdpmn9eeFFhcsCFJX87qmO3vEUYDcR0p2j9rp3TE qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kfajf6pt3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 17:11:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6386C10002A;
 Thu, 27 Oct 2022 17:10:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E4A822A6D6;
 Thu, 27 Oct 2022 17:10:56 +0200 (CEST)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 27 Oct
 2022 17:10:53 +0200
Message-ID: <d032cc58-fc6a-0bad-acb6-2437102e9732@foss.st.com>
Date: Thu, 27 Oct 2022 17:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
References: <20221014172324.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid>
 <7ada410d-8d13-b29a-869c-3f5d032528bf@linaro.org>
 <4d113cfd-4c22-780e-2a13-48ca0e2b28ab@foss.st.com>
 <730eec7e-deb2-2d04-6ba9-132a41ebed58@linaro.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <730eec7e-deb2-2d04-6ba9-132a41ebed58@linaro.org>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: add new stm32mp13
 compatible for stm32-romem
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

SGksCgpPbiAxMC8yMC8yMiAxNDo0OCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAx
OS8xMC8yMDIyIDEzOjIzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24g
MTAvMTgvMjIgMDM6NTYsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBPbiAxNC8xMC8y
MDIyIDExOjIzLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+Pj4+IEFkZCBhIG5ldyBjb21wYXRp
YmxlIGZvciBzdG0zMm1wMTMgc3VwcG9ydC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+Pj4gLS0tCj4+Pj4K
Pj4+PiAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3RtMzIt
cm9tZW0ueWFtbCB8IDEgKwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
dm1lbS9zdCxzdG0zMi1yb21lbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL252bWVtL3N0LHN0bTMyLXJvbWVtLnlhbWwKPj4+PiBpbmRleCA0NDhhMjY3OGRjNjIuLjE2
ZjRjYWQyZmE1NSAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbnZtZW0vc3Qsc3RtMzItcm9tZW0ueWFtbAo+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9zdCxzdG0zMi1yb21lbS55YW1sCj4+Pj4gQEAgLTIy
LDYgKzIyLDcgQEAgcHJvcGVydGllczoKPj4+PiAgICAgIGNvbXBhdGlibGU6Cj4+Pj4gICAgICAg
IGVudW06Cj4+Pj4gICAgICAgICAgLSBzdCxzdG0zMmY0LW90cAo+Pj4+ICsgICAgICAtIHN0LHN0
bTMybXAxMy1ic2VjCj4+Pj4gICAgICAgICAgLSBzdCxzdG0zMm1wMTUtYnNlYwo+Pj4gQWNjb3Jk
aW5nIHRvIHVzYWdlIGluIERUUyAoc2VwYXJhdGUgcGF0Y2ggZm9yIHNvbWUgcmVhc29uKSwgdGhl
IGRldmljZXMKPj4+IGFyZSBjb21wYXRpYmxlLCBzbyBwbGVhc2UgZGVzY3JpYmUgdGhlbSBsaWtl
IHRoYXQuCj4+Cj4+IEkgcHVzaCB0aGUgc2VwYXJhdGUgcGF0Y2ggIkFSTTogZHRzOiBzdG0zMm1w
MTM6IGZpeCBjb21wYXRpYmxlIGZvciBCU0VDIgo+Pgo+PiBJdCBpcyBhIGFkdmljZSBvZiBteSBj
b2xsZWFndWVzOiBzZW5kIGFuIHVwZGF0ZSBvZiBkZXZpY2UgdHJlZQo+Pgo+PiBvbmx5IHdoZW4g
dGhlIGJpbmRpbmcgbW9kaWZpY2F0aW9uIGlzIGFja2VkLgo+IFRoYXQncyBub3QgY29ycmVjdCBh
ZHZpY2UgLSBvbmx5IGZvciBmZXcgY2FzZXMgaXQncyB2YWxpZCAod2hlbgo+IHN1YnN5c3RlbSBt
YWludGFpbmVyIHdhbnRzIHRvIHRha2UgZW50aXJlIHBhdGNoc2V0LCBzbyB0aGVyZSBzaG91bGQg
YmUKPiBubyBEVFMgaW5zaWRlKS4gV2Ugd2FudCB0byBzZWUgdGhlIGJpbmRpbmdzIGFuZCBpdHMg
dXNhZ2UsIHNvIG9uZSBvZjoKPiAxLiB0aGUgc2FtZSBwYXRjaHNldAo+IDIuIGlmIHR3byBwYXRj
aHNldHMsIHRoZW4gY3Jvc3MgbGlua2VkIHRvIGVhY2ggb3RoZXIgd2l0aCBVUkxzIHRvCj4gbG9y
ZS5rZXJuZWwub3JnLiBJIHNlZSBEVFMgaGFkIGxpbmsgYnV0IG5vdCB0aGlzIG9uZS4KPgo+IERy
aXZlciBjaGFuZ2VzIGFsc28gbXVzdCBiZSBzZW50IHRvZ2V0aGVyIHdpdGggdGhlIGJpbmRpbmdz
LiBTaW5jZSB0aGVyZQo+IGFyZSBubyBkcml2ZXIgY2hhbmdlcyBoZXJlLCBpdCBtZWFucyBmb3Ig
dXMgdGhlIGRldmljZXMgYXJlIGNvbXBhdGlibGUKPiBmcm9tIExpbnV4IHBvaW50IG9mIHZpZXcu
Cj4KPj4KPj4gU29ycnkgZm9yIGRpc3R1cmJhbmNlLCBJIGNhbiBzZW50IGEgVjIgd2l0aCB0aGUg
MiBwYXRjaGVzLgo+Pgo+Pgo+PiBUaGUgU1RNMzJNUDE1IGFuZCBTVE0zMk1QMTMgZG9uJ3QgdXNl
IHRoZSBzYW1lIHZlcnNpb24gb2YgdGhlIEJTRUMgZGV2aWNlLAo+Pgo+PiBhbmQgdGhlIGRyaXZl
ciBuZWVkIHRvIGhhbmRsZSBpdC4KPj4KPj4KPj4gSW4gdGhlc2UgMiBwYXRjaGVzOgo+Pgo+PiAt
IFtQQVRDSF0gZHQtYmluZGluZ3M6IG52bWVtOiBhZGQgbmV3IHN0bTMybXAxMyBjb21wYXRpYmxl
IGZvciBzdG0zMi1yb21lbQo+Pgo+PiAtIFtQQVRDSF0gQVJNOiBkdHM6IHN0bTMybXAxMzogZml4
IGNvbXBhdGlibGUgZm9yIEJTRUMKPj4KPj4KPj4gSSBmaXggYSBlcnJvciBmb3IgQlNFQyBub2Rl
IGluIHRoZSBpbml0aWFsIHBhdGNoIHRvIHN1cHBvcnQgU1RNMzJNUDEzeCwKPiBUaGUgcXVlc3Rp
b24gaXMgdGhlbiB3aGV0aGVyIGRldmljZSB3YXMgd29ya2luZyBiZWZvcmUgb3Igbm90LiBJZiBp
dCB3YXMKPiB3b3JraW5nLCB5b3UgZml4IG9uZSBlcnJvciBidXQgYnJlYWsgRFRTIHVzYWdlIG9u
IGFueSBzeXN0ZW0gd2hpY2ggZG9lcwo+IG5vdCBoYXZlIHVwZGF0ZWQgZHJpdmVyIChzbyBCU0Qs
IHUtYm9vdCwgb3RoZXIgZmlybXdhcmUsIG90aGVyIExpbnV4Cj4ga2VybmVsIHZlcnNpb25zKS4K
Pgo+IElmIGl0IHdhcyBub3Qgd29ya2luZywgdGhlbiBpdCdzIG9rYXksIGJ1dCBzdWNoIGNhc2Ug
d2FzIG5vdCBleHBsYWluZWQKPiBpbiBEVFMgcGF0Y2gsIEkgdGhpbmsuCj4KPj4gdGhlIERUUyAi
c3RtMzJtcDEzMS5kdHNpIiBzaG91bGQgbm90IHVzZWQvYWNjZXB0ZWQgd2l0aCB0aGUgYSBCU0VD
IG5vZGUKPj4gdXNpbmcKPj4KPj4gdGhlIGNvbXBhdGlibGUgInN0LHN0bTMybXAxNS1ic2VjIiBp
biBjb21taXQgMWRhODc3OWMwMDI5ICgiQVJNOiBkdHM6Cj4+IHN0bTMyOiBhZGQgU1RNMzJNUDEz
IFNvQ3Mgc3VwcG9ydCIpCj4+Cj4+Cj4+IEl0IGlzIGEgcHJlbGltaW5hcnkgc3RlcCB0byBhZGQg
c3VwcG9ydCBvZiBTVE0zMk1QMTN4IGluIFNUTTMyIFJPTUVNIGRyaXZlci4KPj4KPj4KPj4gSSBk
b24ndCBpbmRpY2F0ZSB0aGVzZSBwYXRjaGVzIGFzICJGaXhlczoiIHRvIGF2b2lkIGEgZHRzIGNo
ZWNrIGlzc3VlCj4+Cj4+IGlmIG9ubHkgdGhlIERUUyBwYXRjaCB3YXMgYmFja3BvcnRlZC4KPj4K
Pj4KPj4gVG9kYXkgaXQgbm90IGJsb2NraW5nIGZvciBTVE0zMk1QMTN4IHVzZXJzIGJlY2F1c2Ug
dGhpcyBTb0MgaXMgbm90IHlldAo+PiBhdmFpbGFibGUgZm9yIGN1c3RvbWVycwo+Pgo+PiBhbmQg
aXQgaXMgb25seSB1c2VkIGludGVybmFsbHkgb24gdGhlIFNUIE1pY3JvZWxlY3Ryb25pY3MgYm9h
cmQKPj4gU1RNMzJNUDEzNUYtREsuCj4gRFRTIHBhdGNoIHNheXMgbm90aGluZyBhYm91dCBpdC4u
Lgo+Cj4+Cj4+IE5vYm9keSAoZXhjZXB0IFNUTWljcm9lbGVjdHJvbmljcykgdXNlIHRoaXMgU29D
wqAgU1RNMzJNUDEzeCB3aXRoIHRoZQo+PiBjdXJyZW50IERUUyAvIExpbnV4IHZlcnNpb24uCj4+
Cj4+Cj4+IE1vcmVvdmVyLCBieSBkZWZhdWx0LCB0aGUgU1RNMzIgUk9NRU0gZHJpdmVyIGluIG5v
dCBhY3RpdmF0ZWQgaW4gYW55Cj4+IGRlZmNvbmZpZywKPiBJbmRlcGVuZGVudCBpc3N1ZS4KPgo+
PiBJIHByZXBhcmUgYSBvdGhlciBwYXRjaCB0byBhY3RpdmF0ZWQgaXQgYnkgZGVmYXVsdCBpbiBh
cm1fbXVsdGl2N19kZWZjb25maWcuCj4+Cj4+IGJ1dCBJIGFtIHdhaXRpbmcgdGhpcyBEVFMgY29y
cmVjdGlvbiB0byBhdm9pZCB0byBwcm9iZSB0aGUgc3RtMzIgcm9tZW4KPj4gZHJpdmVyIHdpdGgg
U1RNMzJNUDE1Cj4+Cj4+IGNvbmZpZ3VyYXRpb24gb24gU1RNMzJNUDEzeCBTb0MuCj4+Cj4+Cj4+
IEkgdGhpbmsgaXMgYSBnb29kIHRpbWUgdG8gdXBkYXRlIHRoaXMgRFRTIGVycm9yIGJlZm9yZSB0
aGUgU29DIGF2YWlsYWJpbGl0eSwKPj4KPj4gYWdyZWVkIHdpdGggU29DIE1haW50YWluZXIsIEFs
ZXhhbmRyZSBUb3JndWUsIGV2ZW4gaWYgdGhpcyBwYXRjaCBicmVha3MKPj4gc3VycmVudCB1c2Vy
cwo+Pgo+PiBvZiBTVE0zMk1QMTN4IERUUyAoYnV0IGl0IGlzIG9ubHkgaW50ZXJuYWxzIHVzZXIg
U1RNaWNyb2VsZWN0cm9uaWNzCj4+IHVudGlsIG5vdykuCj4+Cj4+Cj4+IGJ1dCBwZXJoYXBzIHlv
dSBwcmVmZXIgYSBvdGhlciBzb2x1dGlvbiA/Cj4gV2l0aCB0aGF0IGV4cGxhbmF0aW9uIGl0IGlz
IGZpbmUsIGJ1dCB0aGUgRFRTIGNvbW1pdCB3YXMgbm90IG1lbnRpb25pbmcKPiBleHBsYW5hdGlv
bi4KCgpPSwoKCj4KPj4gYWRkIEZpeGVzIGluIHRoZSBEVFMgcGF0Y2ggPwo+Pgo+PiArIEZpeGVz
OiAxZGE4Nzc5YzAwMjkgKCJBUk06IGR0czogc3RtMzI6IGFkZCBTVE0zMk1QMTMgU29DcyBzdXBw
b3J0IikKPj4KPj4gb3IKPj4KPj4KPj4gICDCoMKgwqAgwqDCoMKgIGJzZWM6IGVmdXNlQDVjMDA1
MDAwIHsKPj4gICDCoMKgwqAgwqDCoMKgIMKgwqDCoCBjb21wYXRpYmxlID0gInN0LHN0bTMybXAx
My1ic2VjIiwgInN0LHN0bTMybXAxNS1ic2VjIjsKPgo+IERlcGVuZHMgd2hldGhlciBkZXZpY2Vz
IGFyZSBjb21wYXRpYmxlIG9yIG5vdC4KPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgoK
Rm9yIGRldmljZSBwb2ludCBvZiB2aWV3LCB0aGUgQlNFQyB1c2VkIG9uIFNUTTMyTVAxMyBoYXZl
IGZldwoKY29ycmVjdGlvbnMgd2ljaCBuZWVkIHRvIGJlIG1hbmFnZWQgaW4gdGhlIGRyaXZlci4K
CgpCdXQgZm9yIGRyaXZlciBwb2ludCBvZiB2aWV3LCBhcyB0aGUgQlNFQyBJUCBpcyBzZWN1cmVk
IG9uIFNUTTMyTVAxMwoKdGhlIElQIGlzIG1hbmFnZWQgYnkgT1AtVEVFLCBhY2VzcyBzaG91bGQg
YmUgcHJvdmlkZWQgd2l0aCBUQSAvIE9QLVRFRQoKYW5kIHNvbWUgb2Jjb2xldGUgZmVhdHVyZXMg
d2lsbCBiZSBuZXZlciBzdXBwb3J0ZWQgKGFjY2VzcyB0byBPVFAgd2l0aAoKcHJvcHJpZXRhcnkg
U01DOiBTVE0zMl9TTUNfQlNFQykgb24gU1RNMzJNUDEzeCBTb0MuCgoKVGhlIGRldmljZSBhcmUg
bm90IGNvbXBhdGlibGVzIGluIHRoZSAyIFNvQywgSSB3aWxsIHNlbnQgYSBWMiB3aXRoCgpjb3Zl
ciBsZXR0ZXIgK8KgIGJpbmRpbmcswqAgRFQgYW5kIGRyaXZlciBtb2RpZmljYXRpb24gdG8gYmUg
bW9yZSBjbGVhci4KCgpSZWdhcmRzCgoKUGF0cmljawoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
