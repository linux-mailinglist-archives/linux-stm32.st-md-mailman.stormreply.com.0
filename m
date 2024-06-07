Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ADF8FFF20
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 11:20:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C19AC71290;
	Fri,  7 Jun 2024 09:20:14 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4580DC6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 09:20:08 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45791ZeF002170;
 Fri, 7 Jun 2024 11:19:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 d3Kov9mztOBAq1R8O1XYu0dkAhTelqCjkvoNBjjUVWM=; b=hmGhh3TDJB9G8snz
 L5K5RwqNIWpHceqzBF1ct2BcIvol02o5LJ3j30qBCxtKcnwgmquWjFl1O09TLzPr
 Eydbe7AZr/ipURjAd5X8Xla/9UBd9Dpa64NTB5fRDKF+HzrVnONfvoePLGU5T4Cn
 nd3TTa/ZprsdHs0Z4ypXaqUkCDTyfAEBPVo4en3InsR4/6ayP1PQtTXi7z+fQ2K2
 1zYEcMNtNe2wHmAfmlgCPohrhlDGLSXs3uM6AYbgj8k3ubEywwvPKLswyjIHIpwY
 cRbsUmUWGd8Ig78xP5dm7sVSwYJn0zQQQN3fD4gGExmaVnNsgpw+p4aREqw2mMaU
 1Oxx3Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ygekj809d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jun 2024 11:19:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5AEA340047;
 Fri,  7 Jun 2024 11:19:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 05BD02138CA;
 Fri,  7 Jun 2024 11:18:23 +0200 (CEST)
Received: from [10.252.19.205] (10.252.19.205) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 11:18:19 +0200
Message-ID: <3aeecd23-355e-4824-8706-a746e84b37b7@foss.st.com>
Date: Fri, 7 Jun 2024 11:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20240604143502.154463-1-christophe.roullier@foss.st.com>
 <20240604143502.154463-9-christophe.roullier@foss.st.com>
 <e8e69a34-b9b2-4b4c-9b2e-079c7a23b756@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <e8e69a34-b9b2-4b4c-9b2e-079c7a23b756@denx.de>
X-Originating-IP: [10.252.19.205]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_04,2024-06-06_02,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 08/11] ARM: dts: stm32: add ethernet1
 and ethernet2 support on stm32mp13
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

SGkKCk9uIDYvNC8yNCAxODo0OSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNi80LzI0IDQ6MzQg
UE0sIENocmlzdG9waGUgUm91bGxpZXIgd3JvdGU6Cj4+IEJvdGggaW5zdGFuY2VzIGV0aGVybmV0
IGJhc2VkIG9uIEdNQUMgU05QUyBJUCBvbiBzdG0zMm1wMTMuCj4+IEdNQUMgSVAgdmVyc2lvbiBp
cyBTTlBTIDQuMjAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgUm91bGxpZXIgPGNo
cmlzdG9waGUucm91bGxpZXJAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiDCoCBhcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzMuZHRzaSB8IDMxICsrKysrKysr
KysrKysrKysrKysrKysrCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzMS5kdHNpIAo+
PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzEuZHRzaQo+PiBpbmRleCA2NzA0Y2Vl
ZjI4NGQzLi45ZDA1ODUzZWNlY2Y3IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9z
dC9zdG0zMm1wMTMxLmR0c2kKPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEz
MS5kdHNpCj4+IEBAIC05NzksNiArOTc5LDEyIEBAIHRzX2NhbDE6IGNhbGliQDVjIHsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHNfY2FsMjogY2FsaWJANWUgewo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDVlIDB4Mj47Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH07Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV0aGVybmV0X21h
YzFfYWRkcmVzczogbWFjMUBlNCB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmVnID0gPDB4ZTQgMHg2PjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZXRoZXJuZXRfbWFjMl9hZGRyZXNzOiBtYWMyQGVhIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHhlYSAweDY+Owo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gwqAgwqDCoMKg
wqDCoMKgwqDCoMKgIGV0enBjOiBidXNANWMwMDcwMDAgewo+PiBAQCAtMTUwNSw2ICsxNTExLDM4
IEBAIHNkbW1jMjogbW1jQDU4MDA3MDAwIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB9Owo+PiDCoCArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBldGhlcm5ldDE6IGV0aGVybmV0QDU4
MDBhMDAwIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0g
InN0LHN0bTMybXAxMy1kd21hYyIsICJzbnBzLGR3bWFjLTQuMjBhIjsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHg1ODAwYTAwMCAweDIwMDA+Owo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZy1uYW1lcyA9ICJzdG1tYWNldGgiOwo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmludGMg
R0lDX1NQSSA2MiAKPj4gSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmZXh0aSA2OCAxPjsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHQtbmFtZXMgPSAibWFj
aXJxIiwgImV0aF93YWtlX2lycSI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y2xvY2stbmFtZXMgPSAic3RtbWFjZXRoIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJtYWMtY2xrLXR4IiwKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJtYWMtY2xrLXJ4IiwKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJldGhzdHAi
LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ImV0aC1jayI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZy
Y2MgRVRIMU1BQz4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDwmcmNjIEVUSDFUWD4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDwmcmNjIEVUSDFSWD4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDwmcmNjIEVUSDFTVFA+LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCA8JnJjYyBFVEgxQ0tfSz47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3Qsc3lzY29uID0gPCZzeXNjZmcgMHg0IDB4ZmYwMDAwPjsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzbnBzLG1peGVkLWJ1cnN0Owo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNucHMscGJsID0gPDI+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHNucHMsYXhpLWNvbmZpZyA9IDwmc3RtbWFjX2F4aV9jb25maWdfMT47Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc25wcyx0c287Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYWNjZXNzLWNvbnRyb2xsZXJzID0gPCZldHpwYyA0OD47Cj4KPiBQ
bGVhc2Uga2VlcCB0aGUgbGlzdCBvZiBwcm9wZXJ0aWVzIHNvcnRlZC4KPgpUbyBiZSBjb2hlcmVu
dCB3aXRoIGFsbCBvdGhlciBJUCwgSSB3aWxsIGtlZXAgImFjY2Vzcy1jb250cm9sbGVycyIgCnBy
b3BlcnR5IGp1c3QgYmVmb3JlICJzdGF0dXMiIHByb3BlcnR5Lgo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+ICsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzdG1tYWNfYXhpX2NvbmZpZ18xOiBzdG1tYWMtYXhpLWNvbmZp
ZyB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbnBzLHdyX29z
cl9sbXQgPSA8MHg3PjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHNucHMscmRfb3NyX2xtdCA9IDwweDc+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc25wcyxibGVuID0gPDAgMCAwIDAgMTYgOCA0PjsKPgo+IFNvcnQgaGVyZSB0
b28uCm9rCj4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9Owo+PiArCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVz
YnBoeWM6IHVzYnBoeWNANWEwMDYwMDAgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDA+Owo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9v
dC9kdHMvc3Qvc3RtMzJtcDEzMy5kdHNpIAo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMy
bXAxMzMuZHRzaQo+PiBpbmRleCAzZTM5NGM4ZTU4YjkyLi4wOWM3ZGExYTJlZGE4IDEwMDY0NAo+
PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMzLmR0c2kKPj4gKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzMy5kdHNpCj4+IEBAIC02Nyw1ICs2NywzNiBAQCBj
aGFubmVsQDE4IHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsYWJlbCA9
ICJ2cmVmaW50IjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGV0aGVybmV0MjogZXRoZXJuZXRA
NTgwMGUwMDAgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInN0LHN0
bTMybXAxMy1kd21hYyIsICJzbnBzLGR3bWFjLTQuMjBhIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVnID0gPDB4NTgwMGUwMDAgMHgyMDAwPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVnLW5hbWVzID0gInN0bW1hY2V0aCI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlu
dGVycnVwdHMtZXh0ZW5kZWQgPSA8JmludGMgR0lDX1NQSSA5NyAKPj4gSVJRX1RZUEVfTEVWRUxf
SElHSD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdC1uYW1lcyA9ICJtYWNp
cnEiOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9ICJzdG1tYWNldGgi
LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJtYWMtY2xr
LXR4IiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAibWFj
LWNsay1yeCIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ImV0aHN0cCIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ImV0aC1jayI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmcmNjIEVUSDJN
QUM+LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZyY2MgRVRIMlRYPiwK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmcmNjIEVUSDJSWD4sCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JnJjYyBFVEgyU1RQPiwKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmcmNjIEVUSDJDS19LPjsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3Qsc3lzY29uID0gPCZzeXNjZmcgMHg0IDB4ZmYwMDAwMDA+Owo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbnBzLG1peGVkLWJ1cnN0Owo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzbnBzLHBibCA9IDwyPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc25w
cyxheGktY29uZmlnID0gPCZzdG1tYWNfYXhpX2NvbmZpZ18yPjsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc25wcyx0c287Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFjY2Vzcy1jb250
cm9sbGVycyA9IDwmZXR6cGMgNDk+Owo+Cj4gU29ydCBoZXJlIHRvby4KPgo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0bW1hY19heGlfY29uZmlnXzI6IHN0bW1hYy1heGktY29uZmlnIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbnBzLHdyX29zcl9sbXQgPSA8MHg3PjsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbnBzLHJkX29zcl9sbXQgPSA8MHg3PjsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbnBzLGJsZW4gPSA8MCAwIDAgMCAx
NiA4IDQ+Owo+Cj4gU29ydCBoZXJlIHRvby4KPgo+IFsuLi5dCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
