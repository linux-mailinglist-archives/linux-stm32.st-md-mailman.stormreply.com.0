Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2738B39FE
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 16:29:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF3EFC7128C;
	Fri, 26 Apr 2024 14:29:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D5DAC7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 14:29:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43QDIXEs017548;
 Fri, 26 Apr 2024 16:29:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=moqXTB1lv5GnDsCg4JCgVgGRj4Dtsh3+19cxb1K9VLU=; b=wj
 Q6mG0yMk0mpbsc57DiRqHjh3zMUBXwhAhlXzP+RS2uo7xqnd5duaHfBPnBn6Cgnz
 ZBfa4z4w90BzGbovCO67RPYWggMHi5OhM+2nS6y1dFDKnLyBH8BHJznndsa1IVho
 Vs2bnPamSybmhTWlaBfmtKz87wGsuuU9gAL62q0KlhbHWli7rY07Mgy1SwVAtzjr
 bd0MNwDDHPTUlKA2hxKD78S89ilQvRbxs8XOkA3yZlbMRe3vQWUVnAXiczqrHfmJ
 eH5XHeVLhxZdbu466gls1B6SYQPmHgEd4ZlsacUcSvKjt8fYAkLEt0aQCg6OQFv/
 Htj998zGCQZv4vZfVhvA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4cntxpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 16:29:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 20BFD40044;
 Fri, 26 Apr 2024 16:28:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6450C223661;
 Fri, 26 Apr 2024 16:28:11 +0200 (CEST)
Received: from [10.48.86.112] (10.48.86.112) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 16:28:10 +0200
Message-ID: <574df1fe-7562-40a2-b7bf-7b4b5d3901ba@foss.st.com>
Date: Fri, 26 Apr 2024 16:28:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>, Marek Vasut <marex@denx.de>
References: <20240425074835.760134-1-patrick.delaunay@foss.st.com>
 <20240425163035.GA2783061-robh@kernel.org>
 <28aeb8b1-72f1-4dd9-b433-f5b693150475@foss.st.com>
 <CAL_Jsq+KGd2tumATzhJu0aZDZ0C1k9VGm5_xxTiE1RE2KHs0hA@mail.gmail.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <CAL_Jsq+KGd2tumATzhJu0aZDZ0C1k9VGm5_xxTiE1RE2KHs0hA@mail.gmail.com>
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] ARM: st: use a correct pwr compatible
	for stm32mp15
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

SGksCgpPbiA0LzI2LzI0IDE0OjUxLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBGcmksIEFwciAy
NiwgMjAyNCBhdCA2OjQy4oCvQU0gUGF0cmljayBERUxBVU5BWQo+IDxwYXRyaWNrLmRlbGF1bmF5
QGZvc3Muc3QuY29tPiB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDQvMjUvMjQgMTg6MzAsIFJvYiBI
ZXJyaW5nIHdyb3RlOgo+Pj4gT24gVGh1LCBBcHIgMjUsIDIwMjQgYXQgMDk6NDg6MzFBTSArMDIw
MCwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPj4+PiBUaGlzIHBhdGNoc2V0IHJlbW92ZXMgdGhl
IHVuZXhwZWN0ZWQgY29tbWEgaW4gdGhlIFBXUiBjb21wYXRpYmxlCj4+Pj4gInN0LHN0bTMybXAx
LHB3ci1yZWciIGFuZCB1c2VzIGEgbmV3IGNvbXBhdGlibGUgInN0LHN0bTMybXAxLXB3ci1yZWci
Cj4+Pj4gaW4gU1RNM01QMTUgZGV2aWNlIHRyZWVzLgo+Pj4gV2h5PyBJIGRvbid0IHNlZSBhbnkg
d2FybmluZ3MgZnJvbSB0aGlzLiBZZXMsIHdlIHdvdWxkbid0IG5ldyBjYXNlcwo+Pj4gZm9sbG93
aW5nIHRoaXMgcGF0dGVybiwgYnV0IEkgZG9uJ3QgdGhpbmsgaXQgaXMgd29ydGggbWFpbnRhaW5p
bmcKPj4+IHN1cHBvcnQgZm9yIGJvdGggc3RyaW5ncy4gV2UncmUgc3R1Y2sgd2l0aCBpdC4gQW5k
IHRoZSBvbmx5IHdheSB0bwo+Pj4gbWFpbnRhaW4gZm9yd2FyZCBjb21wYXRpYmlsaXR5IGlzOgo+
Pgo+PiBZZXMsIG5vIHdhcm5pbmcgYmVjYXVzZSB0aGUgY29tcGF0aWJsZSBzdHJpbmcgYXJlIG5v
dCB5ZXQgY2hlY2tlZCBieSB0b29scy4KPiBXaGF0IGRvIHlvdSBtZWFuPyBUaGVyZSdzIGEgc2No
ZW1hIGZvciBpdCwgc28gaXQgaXMgY2hlY2tlZC4gSSByYW4gdGhlCj4gdG9vbHMgYW5kIHRoZXJl
J3Mgbm8gd2FybmluZy4gSWYgdGhlcmUgd2FzIGEgd2FybmluZywgSSdkIGZpeCB0aGUKPiB0b29s
cyBpbiB0aGlzIGNhc2UuCgoKU29ycnksIEkgYW3CoCBubyBjbGVhcgoKCnRoZSB0b29scyAoZHRz
IGNoZWNrIG9yIGNoZWNrIHBhdGNoKSBkb24ndCBjaGVjayB0aGUgcmVjb21tZW5kYXRpb24gZm9y
IApjb21wYXRpYmxlIG5hbWU6CgogwqDCoMKgIHZlbmRvciBzcGVjaWZpYyBzdHJpbmcgaW4gdGhl
IGZvcm18PHZlbmRvcj4sWzxkZXZpY2U+LV08dXNhZ2U+fAoKfMKgwqAgPT4gZm9yIG1lOiBjb21w
YXRpYmxlIHNob3VsZCBoYXZlIG9ubHkgb25lIGNvbW1hLAogwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdXNlZCBhcyBzZXBhcmF0b3IgYmV0d2VlbiB2ZW5kb3IgcHJlZml4IGVuZCB0aGUgZGV2
aWNlIAppZGVudGlmaWVyLnwKCgpCdXQgaXQgaXMgbm9ybWFsIGJlY2F1c2UgZXhpc3RpbmcgZGV2
aWNlIHRyZWUgaGF2ZSBhIGFscmVhZHkgbG90IGEgCnN0cmFuZ2UgY29tcGF0aWJsZQoKCj4+IEkg
cHJvcG9zZSB0aGlzIHBhdGNoIHRvIGF2b2lkIHRoZSB1c2FnZSBvZiB0aGlzIGNvbXBhdGlibGUg
Zm9yIG90aGVyIFNvQwo+PiBpbiBTVE0zMk1QMSBmYW1pbHkuCj4+Cj4+Cj4+IEkgc2VlIHRoZSBp
bnZhbGlkIGNvbXBhdGlibGUgc3RyaW5nIHdoZW4gSSByZXZpZXdlZCB0aGUgVS1Cb290IHBhdGNo
IHRvCj4+IGFkZCB0aGUgUFdSIG5vZGUgZm9yIFNUTTMyTVAxMyBmYW1pbHk6Cj4+Cj4+IGh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC91Ym9vdC9wYXRjaC8yMDI0MDMxOTAyNDUz
NC4xMDMyOTktMS1tYXJleEBkZW54LmRlLwo+Pgo+IFBlcmhhcHMgeW91IHNob3VsZCBhZGQgU29D
IHNwZWNpZmljIGNvbXBhdGlibGUgc3RyaW5nIGluc3RlYWQuCgoKeWVzIGl0IGlzIGEgc29sdXRp
b24uCgoKPgo+PiBTbyBJIHByZWZlciBjaGFuZ2UgdGhlIFBXUiBiaW5kaW5nIGJlZm9yZSB0byBo
YXZlIHRoZSBzYW1lIHBhdGNoIGFwcGxpZWQKPj4gb24gTGludXggZGV2aWNlIHRyZWUKPj4KPj4+
IGNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEtcHdyLXJlZyIsICJzdCxzdG0zMm1wMSxwd3ItcmVn
IjsKPj4KPj4gWWVzLCBJIHdpbGwgdXBkYXRlIHRoZSBTb0MgcGF0Y2ggd2l0aCB5b3UgcHJvcG9z
YWwuCj4gTk8hIFdlIGRvbid0IHdhbnQgdG8gc3VwcG9ydCB0aGF0LgoKCkV2ZW4gbWFyayB0aGUg
b2xkIGJpbmRpbmcgZGVwcmVjYXRlZCBpcyBub3QgYWNjZXB0YWJsZToKCiDCoHByb3BlcnRpZXM6
CiDCoMKgIGNvbXBhdGlibGU6Ci3CoMKgwqAgY29uc3Q6IHN0LHN0bTMybXAxLHB3ci1yZWcKK8Kg
wqDCoCBvbmVPZjoKK8KgwqDCoCAtIGNvbnN0OiBzdCxzdG0zMm1wMS1wd3ItcmVnCivCoMKgwqAg
LSBpdGVtczoKK8KgwqDCoMKgwqAgLSBjb25zdDogc3Qsc3RtMzJtcDEtcHdyLXJlZworwqDCoMKg
wqDCoCAtIGNvbnN0OiBzdCxzdG0zMm1wMSxwd3ItcmVnCivCoMKgwqDCoMKgIGRlcHJlY2F0ZWQ6
IHRydWUKCgpJIHVuZGVyc3Rvb2QuCgoKPgo+IFdlIGhhdmUgKnRvbnMqIG9mIGV4YW1wbGVzIGlu
IERUIHdoaWNoIGRvbid0IGZvbGxvdyByZWNvbW1lbmRlZAo+IHBhdHRlcm5zIGFuZCB3ZSdyZSBz
dHVjayB3aXRoIHRoZW0uIFRoaXMgaXMgbm8gZGlmZmVyZW50LiBXZSBjYW4gZ2V0Cj4gYXdheSB3
aXRoIGNoYW5naW5nIG5vZGUgbmFtZXMsIGJ1dCB0aGF0J3MgYWJvdXQgaXQuCgoKT2sswqAgSSBh
bSBzdHVja2VkIHdpdGggdGhpcyBjb21wYXRpYmxlIGZvciBTVE0zMk1QMTUgPSAic3Qsc3RtMzJt
cDEscHdyLXJlZyIKCmFuZCBJIGhhdmUgbm8gZWxlZ2FudCBzb2x1dGlvbiB0byBzb2x2ZWQgaXQu
CgpTbyBJIHdpbGwgY2hhbmdlIG15IHNlcmllIHRvIGFkZCBhIG5ldyBjb21wYXRpYmxlIGZvciBT
VE0zMk1QMTMKCiJzdCxzdG0zMm1wMTMtcHdyLXJlZyIKCgo+Cj4gUm9iCgoKUmVnYXJkcwoKUGF0
cmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
