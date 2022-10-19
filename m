Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3972E604E89
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Oct 2022 19:24:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C72EAC64104;
	Wed, 19 Oct 2022 17:24:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60DC7C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 17:24:04 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JFwhdS021524;
 Wed, 19 Oct 2022 19:23:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=z4NuzLYnlhuUAveYIXaA0i15wFwqK0u8Xd/CIKAqiIg=;
 b=NFKujf5ixQszUEjatken2l9ciMY1ctnAjSp39seTO4kzacyeyBb5qNecgBiM/58D0R47
 9WIbKrgJVojkLDymJtHpglLYhbJzOczg38pBY2OBAvmf5rAvFk0HO2IeAOCUAnDhbcwq
 puWuwJuj+cDvwI9PA21fc7tAOL9Xbmg5DyhVFCPO/dUrzXsh54LBn+p0ZwGwT8Vs5f07
 YMDarjzE61A8Gx2afrSFzWAGLlhgIv3TSuZ59rSTaoxT6gkrl2J/4p7pylDW/Tr0Iidu
 zsTfNnJ0fzNybSLgec1ko/T+fTlZR9EWKJBFa4npcUJGaLF1ZGCZtr+Bp0APxRan2ino aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k7j9n4n32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 19:23:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67874100034;
 Wed, 19 Oct 2022 19:23:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 61E4623D3F0;
 Wed, 19 Oct 2022 19:23:38 +0200 (CEST)
Received: from [10.48.0.213] (10.48.0.213) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 19:23:35 +0200
Message-ID: <4d113cfd-4c22-780e-2a13-48ca0e2b28ab@foss.st.com>
Date: Wed, 19 Oct 2022 19:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
References: <20221014172324.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid>
 <7ada410d-8d13-b29a-869c-3f5d032528bf@linaro.org>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <7ada410d-8d13-b29a-869c-3f5d032528bf@linaro.org>
X-Originating-IP: [10.48.0.213]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_10,2022-10-19_04,2022-06-22_01
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

SGksCgpPbiAxMC8xOC8yMiAwMzo1NiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAx
NC8xMC8yMDIyIDExOjIzLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBBZGQgYSBuZXcgY29t
cGF0aWJsZSBmb3Igc3RtMzJtcDEzIHN1cHBvcnQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiAg
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9zdCxzdG0zMi1yb21lbS55
YW1sIHwgMSArCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3RtMzIt
cm9tZW0ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9zdCxz
dG0zMi1yb21lbS55YW1sCj4+IGluZGV4IDQ0OGEyNjc4ZGM2Mi4uMTZmNGNhZDJmYTU1IDEwMDY0
NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3Rt
MzItcm9tZW0ueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bnZtZW0vc3Qsc3RtMzItcm9tZW0ueWFtbAo+PiBAQCAtMjIsNiArMjIsNyBAQCBwcm9wZXJ0aWVz
Ogo+PiAgICAgY29tcGF0aWJsZToKPj4gICAgICAgZW51bToKPj4gICAgICAgICAtIHN0LHN0bTMy
ZjQtb3RwCj4+ICsgICAgICAtIHN0LHN0bTMybXAxMy1ic2VjCj4+ICAgICAgICAgLSBzdCxzdG0z
Mm1wMTUtYnNlYwo+IEFjY29yZGluZyB0byB1c2FnZSBpbiBEVFMgKHNlcGFyYXRlIHBhdGNoIGZv
ciBzb21lIHJlYXNvbiksIHRoZSBkZXZpY2VzCj4gYXJlIGNvbXBhdGlibGUsIHNvIHBsZWFzZSBk
ZXNjcmliZSB0aGVtIGxpa2UgdGhhdC4KCgpJIHB1c2ggdGhlIHNlcGFyYXRlIHBhdGNoICJBUk06
IGR0czogc3RtMzJtcDEzOiBmaXggY29tcGF0aWJsZSBmb3IgQlNFQyIKCkl0IGlzIGEgYWR2aWNl
IG9mIG15IGNvbGxlYWd1ZXM6IHNlbmQgYW4gdXBkYXRlIG9mIGRldmljZSB0cmVlCgpvbmx5IHdo
ZW4gdGhlIGJpbmRpbmcgbW9kaWZpY2F0aW9uIGlzIGFja2VkLgoKClNvcnJ5IGZvciBkaXN0dXJi
YW5jZSwgSSBjYW4gc2VudCBhIFYyIHdpdGggdGhlIDIgcGF0Y2hlcy4KCgpUaGUgU1RNMzJNUDE1
IGFuZCBTVE0zMk1QMTMgZG9uJ3QgdXNlIHRoZSBzYW1lIHZlcnNpb24gb2YgdGhlIEJTRUMgZGV2
aWNlLAoKYW5kIHRoZSBkcml2ZXIgbmVlZCB0byBoYW5kbGUgaXQuCgoKSW4gdGhlc2UgMiBwYXRj
aGVzOgoKLSBbUEFUQ0hdIGR0LWJpbmRpbmdzOiBudm1lbTogYWRkIG5ldyBzdG0zMm1wMTMgY29t
cGF0aWJsZSBmb3Igc3RtMzItcm9tZW0KCi0gW1BBVENIXSBBUk06IGR0czogc3RtMzJtcDEzOiBm
aXggY29tcGF0aWJsZSBmb3IgQlNFQwoKCkkgZml4IGEgZXJyb3IgZm9yIEJTRUMgbm9kZSBpbiB0
aGUgaW5pdGlhbCBwYXRjaCB0byBzdXBwb3J0IFNUTTMyTVAxM3gsCgp0aGUgRFRTICJzdG0zMm1w
MTMxLmR0c2kiIHNob3VsZCBub3QgdXNlZC9hY2NlcHRlZCB3aXRoIHRoZSBhIEJTRUMgbm9kZSAK
dXNpbmcKCnRoZSBjb21wYXRpYmxlICJzdCxzdG0zMm1wMTUtYnNlYyIgaW4gY29tbWl0IDFkYTg3
NzljMDAyOSAoIkFSTTogZHRzOiAKc3RtMzI6IGFkZCBTVE0zMk1QMTMgU29DcyBzdXBwb3J0IikK
CgpJdCBpcyBhIHByZWxpbWluYXJ5IHN0ZXAgdG8gYWRkIHN1cHBvcnQgb2YgU1RNMzJNUDEzeCBp
biBTVE0zMiBST01FTSBkcml2ZXIuCgoKSSBkb24ndCBpbmRpY2F0ZSB0aGVzZSBwYXRjaGVzIGFz
ICJGaXhlczoiIHRvIGF2b2lkIGEgZHRzIGNoZWNrIGlzc3VlCgppZiBvbmx5IHRoZSBEVFMgcGF0
Y2ggd2FzIGJhY2twb3J0ZWQuCgoKVG9kYXkgaXQgbm90IGJsb2NraW5nIGZvciBTVE0zMk1QMTN4
IHVzZXJzIGJlY2F1c2UgdGhpcyBTb0MgaXMgbm90IHlldCAKYXZhaWxhYmxlIGZvciBjdXN0b21l
cnMKCmFuZCBpdCBpcyBvbmx5IHVzZWQgaW50ZXJuYWxseSBvbiB0aGUgU1QgTWljcm9lbGVjdHJv
bmljcyBib2FyZCAKU1RNMzJNUDEzNUYtREsuCgoKTm9ib2R5IChleGNlcHQgU1RNaWNyb2VsZWN0
cm9uaWNzKSB1c2UgdGhpcyBTb0PCoCBTVE0zMk1QMTN4IHdpdGggdGhlIApjdXJyZW50IERUUyAv
IExpbnV4IHZlcnNpb24uCgoKTW9yZW92ZXIsIGJ5IGRlZmF1bHQsIHRoZSBTVE0zMiBST01FTSBk
cml2ZXIgaW4gbm90IGFjdGl2YXRlZCBpbiBhbnkgCmRlZmNvbmZpZywKCkkgcHJlcGFyZSBhIG90
aGVyIHBhdGNoIHRvIGFjdGl2YXRlZCBpdCBieSBkZWZhdWx0IGluIGFybV9tdWx0aXY3X2RlZmNv
bmZpZy4KCmJ1dCBJIGFtIHdhaXRpbmcgdGhpcyBEVFMgY29ycmVjdGlvbiB0byBhdm9pZCB0byBw
cm9iZSB0aGUgc3RtMzIgcm9tZW4gCmRyaXZlciB3aXRoIFNUTTMyTVAxNQoKY29uZmlndXJhdGlv
biBvbiBTVE0zMk1QMTN4IFNvQy4KCgpJIHRoaW5rIGlzIGEgZ29vZCB0aW1lIHRvIHVwZGF0ZSB0
aGlzIERUUyBlcnJvciBiZWZvcmUgdGhlIFNvQyBhdmFpbGFiaWxpdHksCgphZ3JlZWQgd2l0aCBT
b0MgTWFpbnRhaW5lciwgQWxleGFuZHJlIFRvcmd1ZSwgZXZlbiBpZiB0aGlzIHBhdGNoIGJyZWFr
cyAKc3VycmVudCB1c2VycwoKb2YgU1RNMzJNUDEzeCBEVFMgKGJ1dCBpdCBpcyBvbmx5IGludGVy
bmFscyB1c2VyIFNUTWljcm9lbGVjdHJvbmljcyAKdW50aWwgbm93KS4KCgpidXQgcGVyaGFwcyB5
b3UgcHJlZmVyIGEgb3RoZXIgc29sdXRpb24gPwoKCmFkZCBGaXhlcyBpbiB0aGUgRFRTIHBhdGNo
ID8KCisgRml4ZXM6IDFkYTg3NzljMDAyOSAoIkFSTTogZHRzOiBzdG0zMjogYWRkIFNUTTMyTVAx
MyBTb0NzIHN1cHBvcnQiKQoKb3IKCgogwqDCoMKgIMKgwqDCoCBic2VjOiBlZnVzZUA1YzAwNTAw
MCB7CiDCoMKgwqAgwqDCoMKgIMKgwqDCoCBjb21wYXRpYmxlID0gInN0LHN0bTMybXAxMy1ic2Vj
IiwgInN0LHN0bTMybXAxNS1ic2VjIjsKCgpzb3JyeSwgSSBtaXNzZXMgdG8gc2hhcmUgdGhpcyBj
b250ZXh0LgoKCj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgoKUmVnYXJkcwoKUGF0cmlj
awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
