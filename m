Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1756DAEB432
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 12:18:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8190BC35E00;
	Fri, 27 Jun 2025 10:18:48 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 882DFC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jun 2025 10:18:47 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R9hWB5006538;
 Fri, 27 Jun 2025 12:18:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JT/oZIZ3g44uQwFbSBm3mpKN5NBsBXZqXoDPZXCZ6qI=; b=jSnTASSp2oBQkLw2
 Qztvz8e1Qcq6x2XtbPu46cXqFGcZVewFDLTPfYdWrK+EmKBpLAXq5vHLcY0shDlV
 06M7TVBh5kBSOU1ffW6b54hqFfLjxiiUDfGAk7n5PBP2OQnu3+p0Krlqq27dYfJ2
 ufGczDWmxh3DaJ7oV7la4zPl6Z6OE9x3mRghUpzj9hXlJazoIYx4BZa/15hapccW
 37D2a84ioyvi3WwzycdcbG59eONlrCH9c6A1r1VLgD3UucFgNZXUn/q/E5eCaZ4G
 BRk1Z/dmdw8HTvOuDXkSdKvq6xckNLe7l0Wl9/BiTJZFMEHwUkxVyffuO1im/veP
 nW8oGw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e7ppr59e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 12:18:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1D30A4005B;
 Fri, 27 Jun 2025 12:17:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC6FABE10A9;
 Fri, 27 Jun 2025 12:16:13 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 12:16:12 +0200
Message-ID: <813dda8d-7871-46ca-bf22-4e231be4cbf1@foss.st.com>
Date: Fri, 27 Jun 2025 12:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alain Volmat <alain.volmat@foss.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
 <20250616-i2c-upstream-v1-2-42d3d5374e65@foss.st.com>
 <20250626090301.GC348766@gnbcxd0016.gnb.st.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250626090301.GC348766@gnbcxd0016.gnb.st.com>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_03,2025-06-26_05,2025-03-28_01
Cc: linaro-mm-sig@lists.linaro.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Pierre-Yves
 MORDRET <pierre-yves.mordret@st.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/3] i2c: stm32f7: unmap DMA mapped buffer
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

T24gNi8yNi8yNSAxMTowMywgQWxhaW4gVm9sbWF0IHdyb3RlOgo+IEhpIENsw6ltZW50LAo+IAo+
IHRoYW5rcyBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIE1vbiwgSnVuIDE2LCAyMDI1IGF0IDEwOjUz
OjU1QU0gKzAyMDAsIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToKPj4gRml4IGFuIGlzc3VlIHdo
ZXJlIHRoZSBtYXBwZWQgRE1BIGJ1ZmZlciB3YXMgbm90IHVubWFwcGVkLgo+Pgo+PiBGaXhlczog
N2VjYzhjZmRlNTUzICgiaTJjOiBpMmMtc3RtMzJmNzogQWRkIERNQSBzdXBwb3J0IikKPj4gU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3Qu
Y29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYyB8IDQgKysr
Kwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1zdG0zMmY3LmMKPj4gaW5kZXggOTczYTNhOGM2ZDRhLi5hMDVjYWM1ZWU5ZGIgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCj4+ICsrKyBiL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCj4+IEBAIC0xNjIyLDYgKzE2MjIsOCBAQCBzdGF0aWMg
aXJxcmV0dXJuX3Qgc3RtMzJmN19pMmNfaXNyX2V2ZW50X3RocmVhZChpbnQgaXJxLCB2b2lkICpk
YXRhKQo+PiAgIAkJaWYgKGkyY19kZXYtPnVzZV9kbWEpIHsKPj4gICAJCQlzdG0zMmY3X2kyY19k
aXNhYmxlX2RtYV9yZXEoaTJjX2Rldik7Cj4+ICAgCQkJZG1hZW5naW5lX3Rlcm1pbmF0ZV9hc3lu
YyhkbWEtPmNoYW5fdXNpbmcpOwo+PiArCQkJZG1hX3VubWFwX3NpbmdsZShpMmNfZGV2LT5kZXYs
IGRtYS0+ZG1hX2J1ZiwgZG1hLT5kbWFfbGVuLAo+PiArCQkJCQkgZG1hLT5kbWFfZGF0YV9kaXIp
Owo+PiAgIAkJfQo+PiAgIAkJZjdfbXNnLT5yZXN1bHQgPSAtRU5YSU87Cj4+ICAgCX0KPj4gQEAg
LTE2NDIsNiArMTY0NCw4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0zMmY3X2kyY19pc3JfZXZl
bnRfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRhdGEpCj4+ICAgCQkJCWRldl9kYmcoaTJjX2Rldi0+
ZGV2LCAiPCVzPjogVGltZWQgb3V0XG4iLCBfX2Z1bmNfXyk7Cj4+ICAgCQkJCXN0bTMyZjdfaTJj
X2Rpc2FibGVfZG1hX3JlcShpMmNfZGV2KTsKPj4gICAJCQkJZG1hZW5naW5lX3Rlcm1pbmF0ZV9h
c3luYyhkbWEtPmNoYW5fdXNpbmcpOwo+PiArCQkJCWRtYV91bm1hcF9zaW5nbGUoaTJjX2Rldi0+
ZGV2LCBkbWEtPmRtYV9idWYsIGRtYS0+ZG1hX2xlbiwKPj4gKwkJCQkJCSBkbWEtPmRtYV9kYXRh
X2Rpcik7Cj4+ICAgCQkJCWY3X21zZy0+cmVzdWx0ID0gLUVUSU1FRE9VVDsKPj4gICAJCQl9Cj4+
ICAgCQl9Cj4+Cj4gCj4gU291bmRzIGdvb2QgdG8gbWUsIGhvd2V2ZXIgdGhlcmUgbWlnaHQgYmUg
YW4gYWRkaXRpb25hbCBwbGFjZSB0byBmaXgKPiB3aXRoaW4gdGhlIGZ1bmN0aW9uIHN0bTMyZjdf
aTJjX2hhbmRsZV9pc3JfZXJyczoKPiBDb3VsZCB5b3UgYWxzbyB0YWtlIGNhcmUgb2YgdGhlIHVu
bWFwIGluIHRoZSBlcnJvciBJVHMgaGFuZGxpbmcgPwoKQWNrCj4gCj4gUmVnYXJkcywKPiBBbGFp
bgo+IAo+PiAtLSAKPj4gMi40My4wCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
