Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2503E71623C
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 15:39:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAB26C6A613;
	Tue, 30 May 2023 13:39:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2C95C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 13:39:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34UC3ghA017399; Tue, 30 May 2023 15:38:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=h3UJJ7gv6LbZY+kgVidEBO7tNCMRdOY5R4jWJYzfASU=;
 b=E/qCAVSEb2LZOD/LX+28gscOj8xRXRisI6JDDFiZPNH6eX0D/+LpjJ/WP4Mswln/FreS
 od+vhg9iV6OFDPjq7DhMg+t5Ze/UkWiLkmhpi0pwdmkpVR1cKKRUuDJF/RXlynaxcxEM
 94m4aZn61Z+mvlY88Yq1jfdnpNsxHoklL96St0WZrsXV8u4XfGim5YS8Fc3BVzdWnQ8I
 CmINMCJf5YXkRf9kn64CnmqhrcQ6OFfhCo9e73NX+f583dwbKL9fWCb++ib1Kav6+TVZ
 989jjzhE4rG2+fTH5mHqO+u854vXF8lfQdF4cQ4pMo46jIdsSLWWphltmuPPNXlUn81f cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quahy8aue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 15:38:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AF5910002A;
 Tue, 30 May 2023 15:38:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 11B16228A35;
 Tue, 30 May 2023 15:38:38 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 15:38:37 +0200
Message-ID: <af31ae21-2711-2fac-e885-b3bbbcb12be8@foss.st.com>
Date: Tue, 30 May 2023 15:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
References: <20230529091359.71987-1-raphael.gallais-pou@foss.st.com>
 <20230529091359.71987-3-raphael.gallais-pou@foss.st.com>
 <20230530122736.tflfu5cugbd7ooup@krzk-bin>
 <92d5a699-9f5d-2e40-ca73-4604f3e5a657@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <92d5a699-9f5d-2e40-ca73-4604f3e5a657@foss.st.com>
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_10,2023-05-30_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/4] dt-bindings: display: st,
 stm32-dsi: Remove unnecessary fields
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

Ck9uIDUvMzAvMjMgMTU6MzAsIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4gT24gNS8zMC8yMyAx
NDoyNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gTW9uLCAyOSBNYXkgMjAyMyAx
MToxMzo1NyArMDIwMCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPj4+ICIjYWRkcmVzcy1j
ZWxscyIgYW5kICIjc2l6ZS1jZWxscyIgYXJlIHR3byBwcm9wZXJ0aWVzIHRoYXQgYXJlIG5vdAo+
Pj4gbWFuZGF0b3J5LiBGb3IgaW5zdGFuY2UsIHRoZSBEU0kgY291bGQgcmVmZXIgdG8gYSBicmlk
Z2Ugb3V0c2lkZSB0aGUgc2NvcGUKPj4+IG9mIHRoZSBub2RlIHJhdGhlciB0aGFuIGluY2x1ZGUg
YSAncGFuZWxAMCcgc3Vibm9kZS4gQnkgZG9pbmcgc28sIGFkZHJlc3MKPj4+IGFuZCBzaXplIGZp
ZWxkcyBiZWNvbWUgdGhlbiB1bm5lY2Vzc2FyeSwgY3JlYXRpbmcgYSB3YXJuaW5nIGF0IGJ1aWxk
IHRpbWUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFl
bC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KPj4+IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNv
bm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IE1hcmVrIFZhc3V0IDxt
YXJleEBkZW54LmRlPgo+Pj4gLS0tCj4+PiDCoCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1kc2kueWFtbCB8IDIgLS0KPj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4KPj4gUnVubmluZyAnbWFrZSBkdGJzX2NoZWNrJyB3
aXRoIHRoZSBzY2hlbWEgaW4gdGhpcyBwYXRjaCBnaXZlcyB0aGUKPj4gZm9sbG93aW5nIHdhcm5p
bmdzLiBDb25zaWRlciBpZiB0aGV5IGFyZSBleHBlY3RlZCBvciB0aGUgc2NoZW1hIGlzCj4+IGlu
Y29ycmVjdC4gVGhlc2UgbWF5IG5vdCBiZSBuZXcgd2FybmluZ3MKPiBJIGNoZWNrZWQgaXQgYmVm
b3JlIG1lcmdpbmcgdGhlIHNlcmllcyBvbiBzdG0zMi1uZXh0IHRyZWUuIEkgZGlkbid0IGdldCB0
aGlzCj4gZXJyb3IuIEkgZGlkbid0IGNoZWNrIGNvbW1pdCBwZXIgY29tbWl0Lgo+Cj4gRG8geW91
IGdldCB0aGlzIGVycm9yIGFmdGVyIG1lcmdpbmcgdGhlIHdob2xlIHNlcmllcyA/CgoKSSB0aGlu
ayB0aGlzIGlzIGJlY2F1c2Ugb2YgdGhlIG9yZGVyIG9mIHRoZSBwYXRjaGVzIHdpdGhpbiB0aGUg
c2VyaWUuIFRoZSBwYXRjaApjb3JyZWN0aW5nIHRoZSB5YW1sIGlzIGJlZm9yZSB0aG9zZSBtb2Rp
ZnlpbmcgdGhlIGRldmljZS10cmVlcy4gVGhpcyBjb3VsZApleHBsYWluIHdhcm5pbmdzIHJpc2Ug
dXAgd2hlbiBjaGVja2luZyBwYXRjaCBwZXIgcGF0Y2guIEhvd2V2ZXIgSSBkaWQgbm90IGdldAph
bnkgZXJyb3JzIG9uIHRvcCBvZsKgIHRoZSB3aG9sZSBzZXJpZS4KCj4KPgo+Pgo+PiBOb3RlIHRo
YXQgaXQgaXMgbm90IHlldCBhIHJlcXVpcmVtZW50IHRvIGhhdmUgMCB3YXJuaW5ncyBmb3IgZHRi
c19jaGVjay4KPj4gVGhpcyB3aWxsIGNoYW5nZSBpbiB0aGUgZnV0dXJlLgo+Pgo+PiBGdWxsIGxv
ZyBpcyBhdmFpbGFibGUgaGVyZTogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8x
Nzg3MDM0Cj4+Cj4+Cj4+IGRzaUA0MDAxNmMwMDogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUg
bm90IGFsbG93ZWQgKCdwYW5lbC1kc2lAMCcgd2FzCj4+IHVuZXhwZWN0ZWQpCj4+IMKgwqDCoMKg
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNDY5LWRpc2NvLmR0Ygo+Pgo+PiBkc2lANWEwMDAwMDA6
IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgncGFuZWwtZHNpQDAnIHdh
cwo+PiB1bmV4cGVjdGVkKQo+PiDCoMKgwqDCoGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdj
LWV2MS5kdGIKPj4gwqDCoMKgwqBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEtc2Nt
aS5kdGIKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
