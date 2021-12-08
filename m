Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F168C46D06D
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 10:55:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A50FAC5F1EA;
	Wed,  8 Dec 2021 09:55:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56845C5F1E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 09:55:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B83PgUK015911;
 Wed, 8 Dec 2021 10:55:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=TyAvxbW9AUw+fp0lLnm8rh6Mts5UvlpDwToo1N9WL3M=;
 b=QsNAjIL9gWzh2LxtdywE0Iduw0i4x8rwbTEOtjDnC9sAAp892JBLEswJwOWLIIedPV07
 U3Gl3cJiDw1KCiSM8YIqyBd12765x10brSZHOzRLBQD0Wh3J6C1EPAgMaeXXIyuniSpe
 8pbrN14ZxPtUEw664MuG4Safds5bgItPP0L1QCexvqL9p2MLr0vXm7Vw3j5UDohUSE+j
 6n9vjFC5CS7r8xQPUoDdHyW6Y9RZ9V1H11QmNTjbdjUfA6SbPZUzP3GSjMo4uDZ3bViE
 iY7Jbutdg8f7qvfTqBvBmEAXkk4RlDn/3NVl+I+7VoiRHDf0Kia8VSrqg0KguZ/38JSM aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ctmsrhq7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 10:55:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB5A210002A;
 Wed,  8 Dec 2021 10:55:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8BC02259A3;
 Wed,  8 Dec 2021 10:55:21 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 8 Dec
 2021 10:55:20 +0100
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Olivier MOYSAN <olivier.moysan@foss.st.com>, Lee Jones
 <lee.jones@linaro.org>, Fabrice GASNIER <fabrice.gasnier@st.com>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-2-olivier.moysan@foss.st.com>
 <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
 <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
 <Yaf4jiZIp8+ndaXs@robh.at.kernel.org>
 <627777a4-7458-88ed-e7c5-d11e3db847b5@foss.st.com>
 <cf5f994b-aecf-e051-f5c9-4a46e6414207@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <cb7f19c0-3826-fcc8-227c-982838acf599@foss.st.com>
Date: Wed, 8 Dec 2021 10:55:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cf5f994b-aecf-e051-f5c9-4a46e6414207@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_03,2021-12-06_02,2021-12-02_01
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 alain.volmat@foss.st.com, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] ASoC: dt-bindings: stm32: i2s: add
 audio-graph-card port
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

SGkgQWhtYWQKCk9uIDEyLzcvMjEgMjo1OSBQTSwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+IEhlbGxv
IEFsZXgsCj4gCj4gT24gMDcuMTIuMjEgMTQ6NTIsIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4+
IEhpIFJvYgo+Pgo+PiBPbiAxMi8xLzIxIDExOjM0IFBNLCBSb2IgSGVycmluZyB3cm90ZToKPj4+
IE9uIEZyaSwgTm92IDI2LCAyMDIxIGF0IDExOjI1OjI3QU0gKzAxMDAsIE9saXZpZXIgTU9ZU0FO
IHdyb3RlOgo+Pj4+IEhpIFJvYiwKPj4+Pgo+Pj4+IE9uIDExLzI1LzIxIDEwOjI2IFBNLCBSb2Ig
SGVycmluZyB3cm90ZToKPj4+Pj4gT24gVGh1LCAyNSBOb3YgMjAyMSAxNTo0MDo1MCArMDEwMCwg
T2xpdmllciBNb3lzYW4gd3JvdGU6Cj4+Pj4+PiBUaGUgU1RNMiBJMlMgREFJIGNhbiBiZSBjb25u
ZWN0ZWQgdmlhIHRoZSBhdWRpby1ncmFwaC1jYXJkLgo+Pj4+Pj4gQWRkIHBvcnQgZW50cnkgaW50
byB0aGUgYmluZGluZ3MuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xpdmllciBNb3lz
YW4gPG9saXZpZXIubW95c2FuQGZvc3Muc3QuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgwqDCoCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvc3Qsc3RtMzItaTJzLnlhbWwg
fCA1ICsrKysrCj4+Pj4+PiAgwqDCoCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+
Pj4+Pgo+Pj4+Pgo+Pj4+PiBSdW5uaW5nICdtYWtlIGR0YnNfY2hlY2snIHdpdGggdGhlIHNjaGVt
YSBpbiB0aGlzIHBhdGNoIGdpdmVzIHRoZQo+Pj4+PiBmb2xsb3dpbmcgd2FybmluZ3MuIENvbnNp
ZGVyIGlmIHRoZXkgYXJlIGV4cGVjdGVkIG9yIHRoZSBzY2hlbWEgaXMKPj4+Pj4gaW5jb3JyZWN0
LiBUaGVzZSBtYXkgbm90IGJlIG5ldyB3YXJuaW5ncy4KPj4+Pj4KPj4+Pj4gTm90ZSB0aGF0IGl0
IGlzIG5vdCB5ZXQgYSByZXF1aXJlbWVudCB0byBoYXZlIDAgd2FybmluZ3MgZm9yIGR0YnNfY2hl
Y2suCj4+Pj4+IFRoaXMgd2lsbCBjaGFuZ2UgaW4gdGhlIGZ1dHVyZS4KPj4+Pj4KPj4+Pj4gRnVs
bCBsb2cgaXMgYXZhaWxhYmxlIGhlcmU6IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0
Y2gvMTU1OTc1MAo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBhdWRpby1jb250cm9sbGVyQDQwMDBiMDAwOiAn
cG9ydCcgZG9lcyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOiAnXnBvcnRAWzAtOV0nLCAn
cGluY3RybC1bMC05XSsnCj4+Pj4+ICDCoMKgwqDCoGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAx
NTdhLWRrMS5kdC55YW1sCj4+Pj4+ICDCoMKgwqDCoGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAx
NTdjLWRrMi5kdC55YW1sCj4+Pj4+Cj4+Pj4KPj4+PiBUaGlzIHdhcm5pbmcgaXMgbm90IGEgbmV3
IG9uZS4KPj4+Pgo+Pj4+IFRoZSBpMnMyIG5vZGUgaW4gc3RtMzJtcDE1eHgtZGt4LmR0c2kgd291
bGQgcmVxdWlyZSB0aGUgZm9sbG93aW5nIGJpbmRpbmc6Cj4+Pj4gcG9ydDoKPj4+PiAgwqDCoMKg
wqAkcmVmOiBhdWRpby1ncmFwaC1wb3J0LnlhbWwjCj4+Pj4gIMKgwqDCoMKgdW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzOiBmYWxzZQo+Pj4+Cj4+Pj4gSG93ZXZlciB0aGUgc3BpIGJpbmRpbmcgcmVxdWly
ZXMgdG8gaW50cm9kdWNlIGEgdW5pdCBhZGRyZXNzOgo+Pj4+IHBhdHRlcm5Qcm9wZXJ0aWVzOgo+
Pj4+ICDCoMKgICdecG9ydEBbMC05XSc6Cj4+Pj4gIMKgwqDCoMKgICRyZWY6IGF1ZGlvLWdyYXBo
LXBvcnQueWFtbCMKPj4+PiAgwqDCoMKgwqAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+
Pj4+Cj4+Pj4gVGhlIHdhcm5pbmcgY2FuIGJlIHJlbW92ZWQgYnkgcmUtb3JkZXJpbmcgdGhlIGJp
bmRpbmdzIHBhdGNoZXMgaW4gdGhlIHNlcmllLAo+Pj4+IGFzICJhZGRpdGlvbmFsUHJvcGVydGll
czogdHJ1ZSIgbWFrZXMgdGhlIGNoZWNrIG1vcmUgdG9sZXJhbnQgb24gZXh0cmEKPj4+PiBwcm9w
ZXJ0aWVzLgo+Pj4KPj4+IFRoYXQncyBuZXZlciByaWdodC4KPj4+Cj4+Pj4gVGhlIHBhdGNoICJB
U29DOiBkdC1iaW5kaW5nczogc3RtMzI6IGkyczogYWRkIGF1ZGlvLWdyYXBoLWNhcmQgcG9ydCIg
Y2FuCj4+Pj4gZXZlbiBiZSBtZXJlbHkgZHJvcHBlZC4KPj4+PiBTbywgSSBzdWdnZXN0IHRvIHJl
c2VuZCB0aGUgc2VyaWUgd2l0aG91dCBhdWRpby1ncmFwaC1jYXJkIHBhdGNoLgo+Pj4KPj4+IE9u
bHkgaWYgeW91IGFyZW4ndCB1c2luZyBhdWRpby1ncmFwaC1jYXJkLgo+Pj4KPj4+Pgo+Pj4+IERv
ZXMgaXQgc291bmQgdG9vIHBlcm1pc3NpdmUgdG8geW91ID8KPj4+Cj4+PiBJIHRoaW5rIHBlcmhh
cHMgeW91IG5lZWQgdG8gY29tYmluZSB0aGUgc2NoZW1hcyBpbnRvIDEuIE9yIHlvdSBuZWVkIHRv
Cj4+PiByZXN0cnVjdHVyZSB5b3VyIGR0c2kgZmlsZXMgc3VjaCB0aGF0IHlvdSBvbmx5IGFkZCBz
cGkgc3BlY2lmaWMKPj4+IHByb3BlcnRpZXMgd2hlbiBzcGkgbW9kZSBpcyBlbmFibGVkIGFuZCBv
bmx5IGFkZCBpMnMgc3BlY2lmaWMgcHJvcGVydGllcwo+Pj4gd2hlbiBpMnMgbW9kZSBpcyBlbmFi
bGVkLiBPciB1c2UgdGhlIC9kZWxldGUtcHJvcGVydHkvIGRpcmVjdGl2ZS4KPj4KPj4gSW5pdGlh
bGx5IHRoZSBhaW0gb2YgdGhpcyBzZXJpZXMgd2FzIHRvIGZpeCBhICJtYWtlIFc9MSIgd2Fybmlu
Z3Mgc2VlbiBvbiBzcGkgYW5kIGkycyBub2RlcyAoZHVwbGljYXRlIHVuaXQtYWRkcmVzcykuIE1v
dmluZyBib3RoIG5vZGVzIGluIGEgY29tbW9uIG5vZGUgKyB1c2luZyBhIGRpZmZlcmVudCBjb21w
YXRpYmxlIGRlcGVuZGluZyBvbiBTUEkgb3IgSTJTIHVzYWdlIHNvdW5kZWQgZ29vZCkgYnV0IGl0
IGlzIG5vdCBlbm91Z2guIEluIHRoaXMgc2VyaWVzIHRoZSBjb21tb24gbm9kZSBpcyBuYW1lZCBh
cyBmb2xsb3dpbmc6ICJzcGkyczI6IHNwaUA0MDAwYjAwMCIuIEl0IGlzIGZpbmUgZm9yIGEgc3Bp
IHVzYWdlIGJ1dCBpZiB3ZSB3YW50IHRvIHVzZSB0aGlzICJjb21tb24gbm9kZSIgd2l0aCBJMlMg
Y29tcGF0aWJsZSBhbmQgc3BlY2lmaWMgYmluZGluZ3MsIHRoZSBub2RlIG5hbWUgcmVtYWlucyBz
cGlALi4uIGFuZCB0aGVuIHNwZWNpZmljIHNwaSBjaGVja3MgYXJlIGRvbmUuIEZvciB0aGlzIHdp
dGggdGhpcyBzZXJpZXMgYXBwbGllZCB3ZSBnb3QgdGhpcyBpc3N1ZSByZXBvcnRlZCBieSBzcGkt
Y29udHJvbGxlci55YW1sOgo+Pgo+PiBzcGlANDAwMGIwMDA6IHBvcnRAMDogJ2NvbXBhdGlibGUn
IGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPj4KPj4gU28sIGlmIHdlIHVzZSB0d28gc2VwYXJhdGVz
IG5vZGVzIHdlIGdvdCBXPTEgd2FybmluZyBhbmQgaWYgd2UgdXNlIGEgY29tbW9uIG5vZGUgd2Ug
Z290IHlhbWwgY2hlY2sgaXNzdWUuIE9uZSBwb3NzaWJpbGl0eSB3b3VsZCBiZSB0byB1c2UgYSBj
b21tb24gbm9kZSB3aXRoIGEgbmV3IG5vZGUgbmFtZSAoZm9yIGV4YW1wbGUgaTJzcGlALi4uKSBi
dXQgSSB0aGluayBpdCBpcyBub3QgYWNjZXB0YWJsZS4KPj4KPj4gSG93IHRvIHByb2dyZXNzID8K
PiAKPiBBdG1lbCBGbGV4Y29tIGNhbiBiZSBjb25maWd1cmVkIHRvIGJlIGVpdGhlciBVQVJULCBT
UEkgb3IgaTJjLiBGdW5jdGlvbnMKPiBhcmUgY2hpbGQgbm9kZXMgb2YgdGhlIGZsZXhjb20gbm9k
ZSBhbmQgdGhlIE1GRCBkcml2ZXIgbWF0Y2hpbmcgYWdhaW5zdCBpdCwKPiBqdXN0IGNvbmZpZ3Vy
ZSB0aGUgb3BlcmF0aW5nIG1vZGUgYW5kIHRoZW4gY2FsbHMgb2ZfcGxhdGZvcm1fcG9wdWxhdGUu
Cj4gCj4gV291bGQgc29tZXRoaW5nIGFsb25nIHRoZXNlIGxpbmVzIGZpdCBoZXJlIGFzIHdlbGw/
CgpZZXMgaXQgY291bGQgYnV0IGluIG15IG1pbmQgaXQgd2FzIG5vdCBhIE1GRCBhcyBib3RoIGZl
YXR1cmUgY2Fubm90IGJlIAp1c2VkIGF0IHRoZSBzYW1lIHRpbWU6IGl0IGlzIGVpdGhlciBTUEkg
b3IgSTJTIGFuZCBjaG9pY2UgaXMgZG9uZSAKInN0YXRpY2FsbHkiIGluIGRldmljZSB0cmVlIGRl
cGVuZGluZyBib2FyZCB1c2FnZS4KCkxlZSwgd2hhdCBpdCBpcyB5b3VyIGZlZWxpbmcgYWJvdXQg
dGhhdCA/IFdpbGwgeW91IGFjY2VwdCB0byBhZGQgYSBNRkQgCmRyaXZlciBmb3IgdGhpcyBTUEkv
STJTIHBlcmlwaGVyYWwgd2hvc2UgcHJ1cnBvc2UgaXMgb25seSB0byBwb3B1bGF0ZSAKY2hpbGQg
bm9kZSAoZWl0aGVyIFNQSSBvciBJMlMpID8KCkNoZWVycwpBbGV4Cgo+IAo+IENoZWVycywKPiBB
aG1hZAo+IAo+Pgo+PiBUaGFua3MKPj4gQWxleAo+Pgo+Pgo+Pj4gUm9iCj4+Pgo+Pgo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKPj4gTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQo+PiBodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo+Pgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
