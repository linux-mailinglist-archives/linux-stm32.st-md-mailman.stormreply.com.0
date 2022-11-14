Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3131C628252
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Nov 2022 15:21:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACCC9C6504B;
	Mon, 14 Nov 2022 14:21:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA85FC640EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Nov 2022 14:21:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AEECO6l004656; Mon, 14 Nov 2022 15:21:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8k8wy4rZLTlTfBDj4MdDZV1ef9nz7sSUdKXYYs2wBxA=;
 b=3cgP44siccOR8Gtf4MAStx1mc5obDx9B8GG3ScNoa4T8x919GMTjtjonh63dbENmLLTv
 Kp6CR3oZKsHEmvxTWGuK53IcITYlOynakZxgOsqj1O7k1HxBAmuFnX8KIrDjxRO+3aWJ
 JrJ/gncO5/lJ/DBVeuPV1b8+pBUWnmnsSNZ7dVmI5zDe7zlR2BDzA/oYafrUCxoPX+oL
 ALYKvhKGxNecuM8aiUTHz/hgKV31b/ZDON8mOHddkyMN+Ae084/5N1LnTu/hheBejzVk
 3k1KeuIOAczZiedjw+UAkqMWixyWi6SjcXkK2L52LyOGoB5CT2YoTXI+imTZl+xMoHjF HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kudxqkcub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 15:21:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3EB5E100034;
 Mon, 14 Nov 2022 15:20:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3736123150E;
 Mon, 14 Nov 2022 15:20:57 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 14 Nov
 2022 15:20:56 +0100
Message-ID: <814e7d66-4e97-e394-e183-ac174c7298ad@foss.st.com>
Date: Mon, 14 Nov 2022 15:20:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Alexandre TORGUE
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20221110154550.3220800-1-patrick.delaunay@foss.st.com>
 <20221110164329.v2.2.Ibc43aa73f865090affeb1751af0cc260c7f1dd07@changeid>
 <46a5151e-73e4-e1e3-cb3a-7b36ef34221c@linaro.org>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <46a5151e-73e4-e1e3-cb3a-7b36ef34221c@linaro.org>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_12,2022-11-11_01,2022-06-22_01
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Etienne CARRIERE <etienne.carriere@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] nvmem: stm32: add OP-TEE support
	for STM32MP13x
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

SGksCgpPbiAxMS8xMS8yMiAxODoxOCwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPgo+Cj4g
T24gMTAvMTEvMjAyMiAxNTo0NSwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPj4gRm9yIGJvb3Qg
d2l0aCBPUC1URUUgb24gU1RNMzJNUDEzLCB0aGUgY29tbXVuaWNhdGlvbiB3aXRoIHRoZSBzZWN1
cmUKPj4gd29ybGQgbm8gbW9yZSB1c2UgU1RNaWNyb2VsZWN0cm9uaWNzIFNNQyBidXQgY29tbXVu
aWNhdGlvbiB3aXRoIHRoZQo+PiBCU0VDIFRBLCBmb3IgZGF0YSBhY2Nlc3MgKHJlYWQvd3JpdGUp
IG9yIGxvY2sgb3BlcmF0aW9uOgo+PiAtIGFsbCB0aGUgcmVxdWVzdCBhcmUgc2VudCB0byBPUC1U
RUUgdHJ1c3RlZCBhcHBsaWNhdGlvbiwKPj4gLSBmb3IgdXBwZXIgT1RQIHdpdGggRUNDIHByb3Rl
Y3Rpb24gYW5kIHdpdGggd29yZCBwcm9ncmFtbWluZyBvbmx5Cj4+IMKgwqAgZWFjaCBPVFAgYXJl
IHBlcm1hbmVudGx5IGxvY2tlZCB3aGVuIHByb2dyYW1tZWQgdG8gYXZvaWQgRUNDIGVycm9yCj4+
IMKgwqAgb24gdGhlIHNlY29uZCB3cml0ZSBvcGVyYXRpb24KPj4KPj4gU2lnbmVkLW9mZi1ieTog
UGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+
Cj4+IENoYW5nZXMgaW4gdjI6Cj4+IC0gcmViYXNlIHNlcmllcyBvbiBsaW51eC1uZXh0L21hc3Rl
cgo+PiAtIG1pbm9yIHVwZGF0ZSBhZnRlciBWMSByZXZ1ZQo+PiAtIGFkZCBtaXNzaW5nIHNlbnRp
bmVsIGluIHN0bTMyX3JvbWVtX29mX21hdGNoKCkKPj4gLSByZW9yZGVyIGZ1bmN0aW9uIGFuZCBy
ZW1vdmUgcHJvdG90eXBlcyBmb3Igc3RtMzJfYnNlY19wdGEuLi4gZnVuY3Rpb25zCj4+IC0gY2hh
bmdlIHN0bTMyX2JzZWNfcHRhX2ZpbmQgdG8gc3RhdGljCj4+IC0gYWRkIHJldHVybiB2YWx1ZSBp
biBkZXZfZXJyKCkKPj4gLSBjbGVhbnVwcyBzb21lIGNvbW1lbnRzLCB3aGljaCBjYW4gYmUgb24g
b25lIGxpbmUKPj4gLSByZW1vdmUgdGVzdCBvbiBwcml2LT5jdHggaW4gc3RtMzJfYnNlY19wdGFf
cmVtb3ZlCj4+IC0gYWRkIG1pc3NpbmcgdGVlX3NobV9mcmVlKHNobSkgaW4gc3RtMzJfYnNlY19w
dGFfd3JpdGUoKSB3aGVuCj4+IMKgwqAgdGVlX3NobV9nZXRfdmEgZmFpbGVkCj4+IC0gcmV0dXJu
IGVycm9yIGluIHN0bTMyX2JzZWNfcHRhX2ZpbmQgd2hlbiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVz
ZXQgCj4+IGZhaWxlZAo+PiAtIGhhbmRsZSBkcml2ZXJfcmVnaXN0ZXIgZXJyb3IgaW4gc3RtMzJf
cm9tZW1faW5pdAo+Pgo+PiDCoCBkcml2ZXJzL252bWVtL3N0bTMyLXJvbWVtLmMgfCA0NDUgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0
NDEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbnZtZW0vc3RtMzItcm9tZW0uYyBiL2RyaXZlcnMvbnZtZW0vc3RtMzItcm9tZW0uYwo+PiBp
bmRleCBkMWQwM2MyYWQwODEuLjBhMGUyOWQwOWI2NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9u
dm1lbS9zdG0zMi1yb21lbS5jCj4+ICsrKyBiL2RyaXZlcnMvbnZtZW0vc3RtMzItcm9tZW0uYwo+
PiBAQCAtMTEsNiArMTEsNyBAQAo+PiDCoCAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+IMKg
ICNpbmNsdWRlIDxsaW51eC9udm1lbS1wcm92aWRlci5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgv
b2ZfZGV2aWNlLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvdGVlX2Rydi5oPgo+PiDCoCDCoCAvKiBC
U0VDIHNlY3VyZSBzZXJ2aWNlIGFjY2VzcyBmcm9tIG5vbi1zZWN1cmUgKi8KPj4gwqAgI2RlZmlu
ZSBTVE0zMl9TTUNfQlNFQ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHg4MjAwMTAwMwo+PiBAQCAt
MjUsMTQgKzI2LDQwMSBAQAo+PiDCoCBzdHJ1Y3Qgc3RtMzJfcm9tZW1fY2ZnIHsKPj4gwqDCoMKg
wqDCoCBpbnQgc2l6ZTsKPj4gwqDCoMKgwqDCoCB1OCBsb3dlcjsKPj4gK8KgwqDCoCBib29sIHRh
Owo+PiDCoCB9Owo+PiDCoCDCoCBzdHJ1Y3Qgc3RtMzJfcm9tZW1fcHJpdiB7Cj4+IMKgwqDCoMKg
wqAgdm9pZCBfX2lvbWVtICpiYXNlOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBudm1lbV9jb25maWcg
Y2ZnOwo+PiDCoMKgwqDCoMKgIHU4IGxvd2VyOwo+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2UgKnRh
Owo+PiDCoCB9Owo+PiDCoCArI2lmIElTX0VOQUJMRUQoQ09ORklHX09QVEVFKQo+PiArLyoKPgo+
IC4uLgo+Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGVlX2NsaWVudF9kZXZpY2VfaWQg
c3RtMzJfYnNlY19pZF90YWJsZVtdID0gewo+PiArwqDCoMKgIHsKPj4gK8KgwqDCoMKgwqDCoMKg
IFVVSURfSU5JVCgweDk0Y2Y3MWFkLCAweDgwZTYsIDB4NDBiNSwKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDB4YTcsIDB4YzYsIDB4M2QsIDB4YzUsIDB4MDEsIDB4ZWIsIDB4MjgsIDB4
MDMpCj4+ICvCoMKgwqAgfSwKPj4gK8KgwqDCoCB7IH0KPj4gK307Cj4+ICsKPj4gK01PRFVMRV9E
RVZJQ0VfVEFCTEUodGVlLCBzdG0zMl9ic2VjX2lkX3RhYmxlKTsKPj4gKwo+PiArc3RhdGljIHN0
cnVjdCB0ZWVfY2xpZW50X2RyaXZlciBzdG0zMl9ic2VjX3B0YV9kcml2ZXIgPSB7Cj4+ICvCoMKg
wqAgLmlkX3RhYmxlwqDCoMKgID0gc3RtMzJfYnNlY19pZF90YWJsZSwKPj4gK8KgwqDCoCAuZHJp
dmVywqDCoMKgwqDCoMKgwqAgPSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAubmFtZSA9ICJzdG0zMi1i
c2VjLXB0YSIsCj4+ICvCoMKgwqDCoMKgwqDCoCAuYnVzID0gJnRlZV9idXNfdHlwZSwKPj4gK8Kg
wqDCoMKgwqDCoMKgIC5wcm9iZSA9IHN0bTMyX2JzZWNfcHRhX3Byb2JlLAo+PiArwqDCoMKgwqDC
oMKgwqAgLnJlbW92ZSA9IHN0bTMyX2JzZWNfcHRhX3JlbW92ZSwKPj4gK8KgwqDCoCB9LAo+PiAr
fTsKPj4gKwo+PiArc3RhdGljIHZvaWQgc3RtMzJfYnNlY19wdXRfZGV2aWNlKHZvaWQgKmRhdGEp
Cj4+ICt7Cj4+ICvCoMKgwqAgcHV0X2RldmljZShkYXRhKTsKPj4gK30KPj4gKwo+PiArc3RhdGlj
IHN0cnVjdCBkZXZpY2UgKnN0bTMyX2JzZWNfcHRhX2ZpbmQoc3RydWN0IGRldmljZSAqZGV2KQo+
PiArewo+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2UgKnB0YV9kZXY7Cj4+ICvCoMKgwqAgaW50IHJl
dDsKPj4gKwo+PiArwqDCoMKgIHB0YV9kZXYgPSBkcml2ZXJfZmluZF9uZXh0X2RldmljZSgmc3Rt
MzJfYnNlY19wdGFfZHJpdmVyLmRyaXZlciwgCj4+IE5VTEwpOwo+Cj4gVGhpcyBpcyBjbGVhcmx5
IG5vdCByZXByZXNlbnRpbmcgdGhlIGRlcGVuZGVuY2llcyBpbiBhIHByb3BlciBkZXZpY2UgCj4g
bW9kZWwuCj4KPgo+IElmIHRoZSBudm1lbSBwcm92aWRlciBpcyBhIFRFRSBjbGllbnQgZHJpdmVy
IGxldHMgbW9kZWwgaXQgdGhhdCB3YXkuLiAKPiBicmluaW5nIGluIGEgYWRkaXRpb25hbCBkZXZp
Y2UgYW5kIHNvbWVob3cgdHJ5aW5nIHRvIGxpbmsgaXQgd2l0aCBURUUgCj4gZHJpdmVyIGlzwqAg
YSBoYWNrLgo+CgpURUUgaXMgYSBmaXJtd2FyZSB3aGljaCBhbGxvdyBhY2Nlc3MgdG8gc2VjdXJl
IHJlc3NvdXJjZS4uLiBpbmNsdWRpbmcgCkJTRUMgcmVzc291cmNlcwoKCkkgdGhpbmsgaXQgaXMg
YWxzbyB0aGUgY2FzZSBvbiBhIG90aGVyIGRyaXZlciA9IG1zb25fc20uYwoKPT4gZWNvbmZpZy0+
cHJpdiA9IGZ3OwoKIMKgwqDCoMKgwqAgZncgaXMgYSBoYW5kbGUgdG8gdGhlIGZpcm13YXJlIChz
ZWN1cmUgbW9uaXRvcikgd2hpY2ggcHJvdmlkZSAKYWNjZXNzIHRvIHNlY3VyZSByZXNzb3VyY2UK
CgoKQlNFQyBpcyBhIGhhcmR3YXJlIGRldmljZSBvbiB0aGUgYnVzLAoKaXQgaXQgZGVzY3JpYmUg
aW4gdGhlIGRldmljZSB0cmVlLCB3aXRoIGEgY29tcGF0aWJsZSwKCnRoZSBzYW1lIGRlc2NyaXB0
aW9uIHNob3VsZCBiZSB1c2VkIGZvciBhbnkgU1csIG5vdCBvbmx5IExpbnV4IGtlcm5lbC4KCmFu
ZCB0aGUgbnZtZW0gY2VsbCBkZXNjcmlwdGlvbiBhcmUgc3ViLW5vZGUgb2YgQlNFQyBub2RlLCB1
c2VkIGFzIApwaGFuZGxlIGJ5IG90aGVyIGRldmljZS4KCgpJIG5lZWQgdG8gaGF2ZSBhIGxpbmsg
YmV0d2VlbiB0aGUgTlZNRU0gZHJpdmVyIGFuZCB0aGUgT1AtVEVFIHNlc3Npb247CgpCdXQgSSB1
c2UgdGhlIHRlZSBidXMgZGlzY292ZXJ5IGhlcmUgaXQgaXMgYSBlcnJvciwKCmJlY2F1c2UgdGhh
dCBjcmVhdGUgYSBzZWNvbmQgdW5lZWRlZCBkcml2ZXIgInN0bTMyX2JzZWNfcHRhX2RyaXZlciIu
Li4KCgpJIHdpbGwgcmVtb3ZlIHRoaXMgcGFydCwgYW5kIG9ubHkga2VwdCB0aGUgUFRBIHJlcXVl
c3Qgd2l0aCBuZXcgbGliIApmdW5jdGlvbnMgInN0bTMyX2JzZWNfcHRhX1hYWCgpIi4KCgoKPgo+
PiArCj4+ICvCoMKgwqAgaWYgKHB0YV9kZXYpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IGRl
dm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIHN0bTMyX2JzZWNfcHV0X2RldmljZSwgCj4+IHB0
YV9kZXYpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZGV2X2VycihkZXYsICJkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSBmYWlsZWQgKCVk
KVxuIiwgCj4+IHJldCk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKHJl
dCk7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIHB0YV9kZXY7Cj4+ICt9Cj4+
ICsKPj4gKyNlbHNlCj4+ICtzdGF0aWMgaW50IHN0bTMyX2JzZWNfcHRhX3JlYWQodm9pZCAqY29u
dGV4dCwgdW5zaWduZWQgaW50IG9mZnNldCwgCj4+IHZvaWQgKmJ1ZiwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplX3QgYnl0ZXMpCj4+ICt7Cj4+ICvCoMKgwqAg
cHJfZGVidWcoIiVzOiBUQSBCU0VDIHJlcXVlc3Qgd2l0aG91dCBPUFRFRSBzdXBwb3J0XG4iLCBf
X2Z1bmNfXyk7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gLUVOWElPOwo+PiArfQo+PiArCj4+ICtz
dGF0aWMgaW50IHN0bTMyX2JzZWNfcHRhX3dyaXRlKHZvaWQgKmNvbnRleHQsIHVuc2lnbmVkIGlu
dCBvZmZzZXQsIAo+PiB2b2lkICpidWYsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc2l6ZV90IGJ5dGVzKQo+PiArewo+PiArwqDCoMKgIHByX2RlYnVnKCIlczogVEEgQlNFQyBy
ZXF1ZXN0IHdpdGhvdXQgT1BURUUgc3VwcG9ydFxuIiwgX19mdW5jX18pOwo+PiArCj4+ICvCoMKg
wqAgcmV0dXJuIC1FTlhJTzsKPj4gK30KPj4gKwo+PiArc3RhdGljIHN0cnVjdCBkZXZpY2UgKnN0
bTMyX2JzZWNfcHRhX2ZpbmQoc3RydWN0IGRldmljZSAqZGV2KQo+PiArewo+PiArwqDCoMKgIHBy
X2RlYnVnKCIlczogVEEgQlNFQyByZXF1ZXN0IHdpdGhvdXQgT1BURUUgc3VwcG9ydFxuIiwgX19m
dW5jX18pOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIE5VTEw7Cj4+ICt9Cj4+ICsjZW5kaWYKPgo+
IGlmZGVmaW5nIGluc2lkZSB0aGUgZHJ2aWVyIGlzIHJlYWxseSB1Z2x5LCBwbGVhc2UgbW92ZSB0
aGlzIGxpYmFyeSAKPiBmdW5jdGlvbnMgdG8gYSBzZXBlcmF0ZSBmaWxlIGFuZCBhZGQgZGVwZW5k
ZWN5IHByb3Blcmx5IGluIEtjb25maWcuCgoKT2sKCnJlZ2FyZHMKCgpQYXRyaWNrCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
