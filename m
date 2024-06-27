Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB9691A3DC
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 12:33:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13558C71282;
	Thu, 27 Jun 2024 10:33:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76DE4C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 10:33:04 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R8B1Qu023858;
 Thu, 27 Jun 2024 12:32:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 lbhirqQymdicyl7dxfSReYwF0TRfooQNjkPnJCgVEkY=; b=tKJKdlzrxuyXqrrT
 0hPwPywGQN8P7zqVq1V+9eqXK5x9FCskokglsbc8PtcuKLqR4bAbeXeJkKJevZ1J
 UFfSA33kYFBgtuM4SEN/V54BrAeSg6U9kb+YRMipHAd/uNYdxKr8NisMxH8fT+rM
 t/EvHytKCWW26FnwqoQOEOoDzZkaaCVsKspYiO1GN6fEEe/bZoQFiFdS1zy2dr5N
 lHztGc8HbHv0Au7kL/n0JQzEl81DhF9QZmT7zdtwthrg8x2u36XJ8iYKDpSzeMDB
 90GSs8L3Ciw6yP+duMEKIRa1iTobkWFOh0XRnmCNNrXt2XVvgnhrehEo3c68Jb95
 uDlIcg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywm1gnfna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 12:32:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C267640045;
 Thu, 27 Jun 2024 12:32:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F323F216857;
 Thu, 27 Jun 2024 12:31:50 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 27 Jun
 2024 12:31:50 +0200
Message-ID: <5ca1b43c-3f8d-43fa-bffd-a4cea5c39a6d@foss.st.com>
Date: Thu, 27 Jun 2024 12:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20240613080229.2292413-2-u.kleine-koenig@baylibre.com>
 <b2796be8-d372-44e6-959c-e212097e99e8@foss.st.com>
 <rrj2srkxpsomywut67sfmziuvi7w2vmbcrhtxxmr5tp376tdm7@6fce2i47xeus>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <rrj2srkxpsomywut67sfmziuvi7w2vmbcrhtxxmr5tp376tdm7@6fce2i47xeus>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-27_02,2024-05-17_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32mp135f-dk: Document output
	pins for PWMs
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

CgpPbiA2LzI3LzI0IDExOjMxLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbyBBbGV4
YW5kcmUsCj4gCj4gT24gVGh1LCBKdW4gMjcsIDIwMjQgYXQgMTA6Mzg6MzRBTSArMDIwMCwgQWxl
eGFuZHJlIFRPUkdVRSB3cm90ZToKPj4gT24gNi8xMy8yNCAxMDowMiwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4+PiBUbyBzaW1wbGlmeSBpZGVudGlmeWluZyB0aGUgcGlucyB3aGVyZSB0aGUg
UFdNIG91dHB1dCBpcyByb3V0ZWQgdG8sCj4+PiBhZGQgYSBjb21tZW50IHRvIGVhY2ggUFdNIGRl
dmljZSBhYm91dCB0aGUgcmVzcGVjdGl2ZSBwaW4gb24gdGhlCj4+PiBleHBhbnNpb24gY29ubmVj
dG9yLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAYmF5bGlicmUuY29tPgo+Pj4gLS0tCj4+PiAgICBhcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTM1Zi1kay5kdHMgfCA0ICsrKysKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJt
cDEzNWYtZGsuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGsuZHRzCj4+
PiBpbmRleCA1NjdlNTNhZDI4NWYuLmYxYjUwZTRjMTA1OSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0cwo+Pj4gKysrIGIvYXJjaC9hcm0vYm9v
dC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGsuZHRzCj4+PiBAQCAtMjczLDYgKzI3Myw3IEBAICZ0aW1l
cnMzIHsKPj4+ICAgIAkvZGVsZXRlLXByb3BlcnR5L2RtYS1uYW1lczsKPj4+ICAgIAlzdGF0dXMg
PSAiZGlzYWJsZWQiOwo+Pj4gICAgCXB3bSB7Cj4+PiArCQkvKiBQV00gb3V0cHV0IG9uIHBpbiA3
IG9mIHRoZSBleHBhbnNpb24gY29ubmVjdG9yIChDTjguNykgdXNpbmcgVElNM19DSDQgZnVuY3Rp
b24gKi8KPj4+ICAgIAkJcGluY3RybC0wID0gPCZwd20zX3BpbnNfYT47Cj4+PiAgICAJCXBpbmN0
cmwtMSA9IDwmcHdtM19zbGVlcF9waW5zX2E+Owo+Pj4gICAgCQlwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiLCAic2xlZXAiOwo+Pj4gQEAgLTI4OCw2ICsyODksNyBAQCAmdGltZXJzNCB7Cj4+PiAg
ICAJL2RlbGV0ZS1wcm9wZXJ0eS9kbWEtbmFtZXM7Cj4+PiAgICAJc3RhdHVzID0gImRpc2FibGVk
IjsKPj4+ICAgIAlwd20gewo+Pj4gKwkJLyogUFdNIG91dHB1dCBvbiBwaW4gMzEgb2YgdGhlIGV4
cGFuc2lvbiBjb25uZWN0b3IgKENOOC4zMSkgdXNpbmcgVElNNF9DSDIgZnVuY3Rpb24gKi8KPj4+
ICAgIAkJcGluY3RybC0wID0gPCZwd200X3BpbnNfYT47Cj4+PiAgICAJCXBpbmN0cmwtMSA9IDwm
cHdtNF9zbGVlcF9waW5zX2E+Owo+Pj4gICAgCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAi
c2xlZXAiOwo+Pj4gQEAgLTMwMyw2ICszMDUsNyBAQCAmdGltZXJzOCB7Cj4+PiAgICAJL2RlbGV0
ZS1wcm9wZXJ0eS9kbWEtbmFtZXM7Cj4+PiAgICAJc3RhdHVzID0gImRpc2FibGVkIjsKPj4+ICAg
IAlwd20gewo+Pj4gKwkJLyogUFdNIG91dHB1dCBvbiBwaW4gMzIgb2YgdGhlIGV4cGFuc2lvbiBj
b25uZWN0b3IgKENOOC4zMikgdXNpbmcgVElNOF9DSDMgZnVuY3Rpb24gKi8KPj4+ICAgIAkJcGlu
Y3RybC0wID0gPCZwd204X3BpbnNfYT47Cj4+PiAgICAJCXBpbmN0cmwtMSA9IDwmcHdtOF9zbGVl
cF9waW5zX2E+Owo+Pj4gICAgCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic2xlZXAiOwo+
Pj4gQEAgLTMxNiw2ICszMTksNyBAQCB0aW1lckA3IHsKPj4+ICAgICZ0aW1lcnMxNCB7Cj4+PiAg
ICAJc3RhdHVzID0gImRpc2FibGVkIjsKPj4+ICAgIAlwd20gewo+Pj4gKwkJLyogUFdNIG91dHB1
dCBvbiBwaW4gMzMgb2YgdGhlIGV4cGFuc2lvbiBjb25uZWN0b3IgKENOOC4zMykgdXNpbmcgVElN
MTRfQ0gxIGZ1bmN0aW9uICovCj4+PiAgICAJCXBpbmN0cmwtMCA9IDwmcHdtMTRfcGluc19hPjsK
Pj4+ICAgIAkJcGluY3RybC0xID0gPCZwd20xNF9zbGVlcF9waW5zX2E+Owo+Pj4gICAgCQlwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiLCAic2xlZXAiOwo+Pj4KPj4+IGJhc2UtY29tbWl0OiAxNjEz
ZTYwNGRmMGNkMzU5Y2YyYTdmYmQ5YmU3YTBiY2ZhY2ZhYmQwCj4+Cj4+IEdvb2QgaWRlYS4gU29t
ZSBsaW5lcyBleGNlZWQgdGhlIDEwMCBjaGFyLiBJIGNvdWxkIHJlbW92ZSAiZnVuY3Rpb24iIG9y
IG9ubHkKPj4ga2VlcCAiZnVuYyIgaW5zdGVhZC4gV2hhdCBkbyB1IHRoaW5rID8KPiAKPiBJIGRv
bid0IGNhcmUgbXVjaCBhbmQgd291bGQgaGF2ZSBleHBlY3RlZCB0aGF0IHRoZSBsaW5lIGxlbmd0
aCBpc24ndAo+IHRoYXQgY3JpdGljYWwuIEFueWhvdywgc2hvcnRlbiBpdCB0byBmdW5jIGlmIHlv
dSBwcmVmZXIuCgpOb3QgY3JpdGljYWwgZm9yIHN1cmUuIEp1c3QgY2hlY2twYXRjaCB0aGF0IGNv
bXBsYWluIGFib3V0IGl0LgoKPiAgIAo+PiBOb3RlIGFsc28gdGhhdCBjb21taXQgc2hvdWxkIGJl
OiAiQVJNOiBkdHM6IHN0bTMyOiAuLi4uIi4gaSBjYW4gZml4IGl0IGJ5Cj4+IG15c2VsZi4KPiAK
PiBBY2suIEkgY29uc2lkZXJlZCB1c2luZwo+IAo+IAlBUk06IGR0czogc3RtMzI6IHN0bTMybXAx
MzVmLWRrOiAuLi4KPiAKPiBidXQgdGhhdCBmZWx0IGxpa2UgZHVwbGljYXRpbmcgc28gSSBkcm9w
cGVkIHRoZSAic3RtMzIiIHBhcnQuIEZlZWwgZnJlZQo+IHRvIGFkZCBpdC4KCk9rIHRoYW5rcwoK
YWxleAoKPiAKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
