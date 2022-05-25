Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (unknown [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F7533CAE
	for <lists+linux-stm32@lfdr.de>; Wed, 25 May 2022 14:31:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D40BEC03FCA;
	Wed, 25 May 2022 12:31:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E50EDC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 May 2022 12:31:10 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PCK9qm022732;
 Wed, 25 May 2022 14:30:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bPVKOjeRLgXhCaHSGPSwKkUnur7RswwoIBP9rTXhPjQ=;
 b=jCDdo5yiVDPtLuDw4vitdYjaky4ixEwyDDa//s/LwSA+o1NuoKVKs6DK6TKzVxFvkmtP
 qWpzv0rUNCdU6bZssDznIsZHKp5EycQgTe7D6UhvUJdzcx7Poi2hV7O/XlfGPgLfzMex
 HjzSmEBK3RnQpxj7hkHKUIh8McLyh3Vh0GAZIqGBQr1QfLI8RR5iiNkYptBQlB2EY3g3
 xH/iPLzvbApkgc1+lKG6lapfF/tfdZe38lKZDmzUMU7CmAfPpHlNu0z6TyATDdr94yTx
 OhIKgeRRtqE4nPAgszg/iQCiJXs6zDzy99XQoP7SeUgxWJ0lO+kOddgLxGk1ls1StD4D +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g93v864rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 14:30:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEDD9100034;
 Wed, 25 May 2022 14:30:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A28FE229A8D;
 Wed, 25 May 2022 14:30:14 +0200 (CEST)
Received: from [10.211.12.178] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 25 May
 2022 14:30:13 +0200
Message-ID: <b346eb00-fde1-2dc0-e6e3-09dbf1359c20@foss.st.com>
Date: Wed, 25 May 2022 14:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: tangbin <tangbin@cmss.chinamobile.com>, Mark Brown <broonie@kernel.org>
References: <20220519124235.21100-1-tangbin@cmss.chinamobile.com>
 <69d5cef3-57c0-9bc7-a83b-a85ef1c4cf29@foss.st.com>
 <YovZAf4S0XphBsco@sirena.org.uk>
 <3fb8d7f8-4506-3b28-22cb-863bda1f21c8@cmss.chinamobile.com>
 <d5ab354a-eb10-d31c-d55e-46a4c4d1a4ce@foss.st.com>
 <cd375914-a3e6-37c7-4a16-551937006f92@cmss.chinamobile.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <cd375914-a3e6-37c7-4a16-551937006f92@cmss.chinamobile.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_03,2022-05-25_02,2022-02-23_01
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, mcoquelin.stm32@gmail.com,
 arnaud.pouliquen@foss.st.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: sai: Use
 of_device_get_match_data()tosimplify code
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

SGkgVGFuZywKCk9uIDUvMjUvMjIgMDk6MzYsIHRhbmdiaW4gd3JvdGU6Cj4gSGkgT2xpdmllcu+8
mgo+IAo+IE9uIDIwMjIvNS8yNCAyMjozMCwgT2xpdmllciBNT1lTQU4gd3JvdGU6Cj4+IEhpIFRh
bmcsCj4+Cj4+IE9uIDUvMjQvMjIgMDM6NDQsIHRhbmdiaW4gd3JvdGU6Cj4+PiBIaSBNYXJrICYg
T2xpdmllcu+8mgo+Pj4KPj4+IE9uIDIwMjIvNS8yNCAyOjU3LCBNYXJrIEJyb3duIHdyb3RlOgo+
Pj4+IE9uIE1vbiwgTWF5IDIzLCAyMDIyIGF0IDAzOjI4OjQ4UE0gKzAyMDAsIE9saXZpZXIgTU9Z
U0FOIHdyb3RlOgo+Pj4+Cj4+Pj4+IFRoZSBjdXJyZW50IHBhdGNoIHJlcXVpcmVzIGEgY2hhbmdl
IGluIHRoZSBkcml2ZXIuCj4+Pj4+IEVpdGhlciBjaGFuZ2luZyBTVE1fU0FJX3hfSUQgZW51bXMs
IG9yIHJlcGxhY2luZyBkYXRhIGJ5IGEgc3RydWN0Lgo+Pj4+PiBGb3IgaW5zdGFuY2U6Cj4+Pj4+
IHN0cnVjdCBzdG0zMl9zYWlfY29tcF9kYXRhIHsKPj4+Pj4gwqDCoMKgwqB1bnNpZ25lZCBpbnQg
aWQ7Cj4+Pj4+IH0KPj4+Pj4gc3RydWN0IHN0bTMyX3NhaV9jb21wX2RhdGEgc3RtMzJfc2FpX2Nv
bXBfZGF0YV9hID0gewo+Pj4+PiDCoMKgwqDCoC5pZCA9IFNUTV9TQUlfQV9JRDsKPj4+Pj4gfQo+
Pj4+PiBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN0bTMyX3NhaV9zdWJfaWRzW10gPSB7Cj4+Pj4+IMKg
wqDCoMKgLmRhdGEgPSAmc3RtMzJfc2FpX2NvbXBfZGF0YV9hfSwKPj4+Pj4gfQo+Pj4+IEVpdGhl
ciBhcHByb2FjaCB3b3JrcyBmb3IgbWUgKG9yIGEgcmV2ZXJ0IGZvciB0aGF0IG1hdHRlcikuCj4+
Pgo+Pj4gwqDCoMKgwqAgVGhhbmtzIGZvciB5b3VyIGFkdmljZSwgSSB3YXMgdGhvdWdodGxlc3Mu
Cj4+Pgo+Pj4gwqDCoMKgwqAgSSB0aGluayBjaGFuZ2UgdGhlIGRhdGUgb2YgU1RNX1NBSV94X0lE
IG1heWJlIHNpbXBsZS4gQnV0IGlmIHdlIAo+Pj4gZG9uJ3QgY2hhbmdlIHRoZSBpZCwKPj4+Cj4+
PiB3aGF0IGFib3V0IGFkZCBhICIjZGVmaW5lIiBsaWtlIHRoZSBsaW5lIDQ3Ogo+Pj4KPj4+ICNk
ZWZpbmUgU1RNX1NBSV9JU19TVUIoeCkgKCh4KS0+aWQgPT0gU1RNX1NBSV9BX0lEIHx8ICh4KS0+
aWQgPT0gCj4+PiBTVE1fU0FJX0JfSUQpCj4+Pgo+Pj4gdGhlbiBpbiB0aGUganVkZ2VtZW50LCB3
dSB1c2U6Cj4+Pgo+Pj4gwqDCoMKgwqAgc2FpLT5pZCA9ICh1aW50cHRyX3Qpb2ZfZGV2aWNlX2dl
dF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+Pj4KPj4+IMKgwqDCoMKgIGlmICghU1RNX1NBSV9J
U19TVUIoc2FpKSkKPj4+Cj4+PiDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIHJldHVybiAtRUlOVkFM
Owo+Pj4KPj4+Cj4+PiBpZiB5b3UgdGhpbmsgdGhhdCdzIG9rLCBJIHdpbGwgc2VuZCBwYXRjaCB2
MiBmb3IgeW91IC4KPj4+Cj4+Cj4+IElmIHdlIGFsbG93IG51bGwgdmFsdWUgaW4gU1RNX1NBSV9J
U19TVUIoc2FpKSBjaGVjaywgd2UgY2FuIG1pc3MgcmVhbCAKPj4gTlVMTCBwb2ludGVyIGVycm9y
IGZyb20gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkuCj4+Cj4+IFRoZSBzaW1wbGVzdCB3YXkg
aXMgdG8gY2hhbmdlIFNUTV9TQUlfeF9JRCBlbnVtcyBJIHRoaW5rLgo+PiBCdXQgaG9ubmVzdGx5
LCBJIGZlZWwgbW9yZSBjb21mb3J0YWJsZSB0byBsZXQgdGhlIGRyaXZlciB1bmNoYW5nZWQuCj4+
Cj4gT2jvvIx5b3UgYXJlIHJpZ2h0LCBJIGFtIHNvcnJ5Lgo+IAo+IFBsZWFzZSBmb3JnZXQgdGhp
cyBwYXRjaCwgSSdtIHNvcnJ5IHRvIGhhdmUgd2FzdGVkIHlvdXIgdGltZS4KPiAKPiBCdXQgSSBz
YXcgc29tZSBjb2RlcyBpcyB1c2VsZXNzIGluIHRoZSBsaW5lIDQ4ICYgbGluZSA0OSwgSSB0aGlu
ayB3ZSBjYW4gCj4gcmVtb3ZlIGl0Lgo+IAoKWWVzLCB0aGVzZSB0d28gZGVmaW5lcyBhcmUgbm8g
bW9yZSB1c2VmdWwuCkZlZWwgZnJlZSB0byBzZW5kIGEgY2xlYW51cCBwYXRjaC4KCkJScwoKT2xp
dmllcgoKPiBJZiB5b3UgdGhpbmsgc28sIEkgd2lsbCBzZW5kIHRoaXMgcGF0Y2ggZm9yIHlvdS4K
PiAKPiAKPiBUaGFua3MKPiAKPiBUYW5nIEJpbgo+IAo+IAo+PiBCUnMKPj4gT2xpdmllcgo+Pgo+
Pj4gVGhhbmtzCj4+Pgo+Pj4gVGFuZyBCaW4KPj4+Cj4+Pgo+IAo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
