Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD7072E8E4
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 18:59:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92691C6A61A;
	Tue, 13 Jun 2023 16:59:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AF71C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 16:59:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35DDYKjc010243; Tue, 13 Jun 2023 18:59:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=r0/BP0SDZNjkyzInU6CzpWLDgV0h4tEoifbUZlb3LzE=;
 b=FBU9KIAkX28BTurj/w0o9lsSy8md2VqnSLhfF4+Zm8vUD+s/naTceoMmtgtRlvWUPych
 uCL1L3uRaJz/KtjS1WER2XHePCgpsrPuW2f2j2bOWeU2VwgPRutre2726IIB9F51+c0R
 KIN9fWQlpWhluS1UXrcLBQexazjpZArVSU2WV6mNrvmWFRfbO69FhEY71vibEi6tTVP3
 BKwCDqFXabSM1748+StBeE2ejhJajeFw25rWk3uIaKRo1DLfxzl48jWLESYXF3Nbc8SO
 ffRR9p81AxOzudCt+xI2DSUmqQ0fHnFZwXdcrqTgEi0KJKM2GlHQOtzUE1SPDGYZ+htU +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6sf31416-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 18:59:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE70710002A;
 Tue, 13 Jun 2023 18:59:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E38CA245504;
 Tue, 13 Jun 2023 18:59:04 +0200 (CEST)
Received: from [10.48.1.204] (10.48.1.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 18:59:04 +0200
Message-ID: <4b5d8872-64bc-34b0-c329-71aea734022a@foss.st.com>
Date: Tue, 13 Jun 2023 18:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Michael Nazzareno
 Trimarchi <michael@amarulasolutions.com>
References: <20230609062050.2107143-1-dario.binacchi@amarulasolutions.com>
 <20230609062050.2107143-5-dario.binacchi@amarulasolutions.com>
 <376dc16d-8896-0a47-b8dd-3f919c1e50bf@foss.st.com>
 <CAOf5uwmpAZeO=w-+cQNfy4VHS80NK-_HpDv5koZfTB8cRHOECQ@mail.gmail.com>
 <0da03538-fac6-385d-d74f-f7657eca542b@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <0da03538-fac6-385d-d74f-f7657eca542b@foss.st.com>
X-Originating-IP: [10.48.1.204]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 4/4] drm/stm: add an option to change
	FB bpp
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

CgpPbiA2LzEzLzIzIDE3OjI2LCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+IAo+IE9uIDYv
MTMvMjMgMTY6NTIsIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSB3cm90ZToKPj4gSGkKPj4K
Pj4gT24gVHVlLCBKdW4gMTMsIDIwMjMgYXQgNDo0MeKAr1BNIFBoaWxpcHBlIENPUk5VCj4+IDxw
aGlsaXBwZS5jb3JudUBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDYvOS8yMyAw
ODoyMCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4+Pj4gQm9hcmRzIHRoYXQgdXNlIHRoZSBTVE0z
MkZ7NCw3fSBzZXJpZXMgaGF2ZSBsaW1pdGVkIGFtb3VudHMgb2YgUkFNLiBUaGUKPj4+PiBhZGRl
ZCBwYXJhbWV0ZXIgYWxsb3dzIHVzZXJzIHRvIHNpemUsIHdpdGhpbiBjZXJ0YWluIGxpbWl0cywg
dGhlIG1lbW9yeQo+Pj4+IGZvb3RwcmludCByZXF1aXJlZCBieSB0aGUgZnJhbWVidWZmZXIuCj4+
Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1h
cnVsYXNvbHV0aW9ucy5jb20+Cj4+Pj4KPj4+PiAtLS0KPj4+Pgo+Pj4+IENoYW5nZXMgaW4gdjM6
Cj4+Pj4gLSBkcm9wIFs0LzZdIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBzaW1wbGU6IGFkZCBSb2Nr
dGVjaCBSSzA0M0ZONDhICj4+Pj4gICAgIEFwcGxpZWQgdG8gaHR0cHM6Ly9hbm9uZ2l0LmZyZWVk
ZXNrdG9wLm9yZy9naXQvZHJtL2RybS1taXNjLmdpdCAoZHJtLW1pc2MtbmV4dCk6Cj4+Pj4gICAg
IGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9YzQy
YTM3YTI3Yzc3N2Q2Mzk2MWRkNjM0YTMwZjdjODg3OTQ5NDkxYQo+Pj4+IC0gZHJvcCBbNS82XSBk
cm0vcGFuZWw6IHNpbXBsZTogYWRkIHN1cHBvcnQgZm9yIFJvY2t0ZWNoIFJLMDQzRk40OEggcGFu
ZWwKPj4+PiAgICAgQXBwbGllZCB0byBodHRwczovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2dp
dC9kcm0vZHJtLW1pc2MuZ2l0IChkcm0tbWlzYy1uZXh0KQo+Pj4+ICAgICBodHRwczovL2NnaXQu
ZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQvP2lkPTEzY2RkMTJhOWY5MzQxNThm
NGVjODE3Y2YwNDhmY2I0Mzg0YWE5ZGMKPj4+Pgo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9zdG0v
ZHJ2LmMgfCA4ICsrKysrKystCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9z
dG0vZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jCj4+Pj4gaW5kZXggNDIyMjIwZGY3
ZDhjLi42NWJlMmI0NDJhNmEgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9k
cnYuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMKPj4+PiBAQCAtMzAsNiAr
MzAsMTEgQEAKPj4+PiAgICAjZGVmaW5lIFNUTV9NQVhfRkJfV0lEVEggICAgMjA0OAo+Pj4+ICAg
ICNkZWZpbmUgU1RNX01BWF9GQl9IRUlHSFQgICAyMDQ4IC8qIHNhbWUgYXMgd2lkdGggdG8gaGFu
ZGxlIG9yaWVudGF0aW9uICovCj4+Pj4KPj4+PiArc3RhdGljIHVpbnQgc3RtX2JwcCA9IDE2Owo+
Pj4+ICsKPj4+PiArTU9EVUxFX1BBUk1fREVTQyhicHAsICJiaXRzLXBlci1waXhlbCAoZGVmYXVs
dDogMTYpIik7Cj4+Pj4gK21vZHVsZV9wYXJhbV9uYW1lZChicHAsIHN0bV9icHAsIHVpbnQsIDA2
NDQpOwo+Pj4+ICsKPj4+PiAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19m
dW5jcyBkcnZfbW9kZV9jb25maWdfZnVuY3MgPSB7Cj4+Pj4gICAgICAgIC5mYl9jcmVhdGUgPSBk
cm1fZ2VtX2ZiX2NyZWF0ZSwKPj4+PiAgICAgICAgLmF0b21pY19jaGVjayA9IGRybV9hdG9taWNf
aGVscGVyX2NoZWNrLAo+Pj4+IEBAIC05Myw2ICs5OCw3IEBAIHN0YXRpYyBpbnQgZHJ2X2xvYWQo
c3RydWN0IGRybV9kZXZpY2UgKmRkZXYpCj4+Pj4gICAgICAgIGRkZXYtPm1vZGVfY29uZmlnLm1p
bl9oZWlnaHQgPSAwOwo+Pj4+ICAgICAgICBkZGV2LT5tb2RlX2NvbmZpZy5tYXhfd2lkdGggPSBT
VE1fTUFYX0ZCX1dJRFRIOwo+Pj4+ICAgICAgICBkZGV2LT5tb2RlX2NvbmZpZy5tYXhfaGVpZ2h0
ID0gU1RNX01BWF9GQl9IRUlHSFQ7Cj4+Pj4gKyAgICAgZGRldi0+bW9kZV9jb25maWcucHJlZmVy
cmVkX2RlcHRoID0gc3RtX2JwcDsKPj4+PiAgICAgICAgZGRldi0+bW9kZV9jb25maWcuZnVuY3Mg
PSAmZHJ2X21vZGVfY29uZmlnX2Z1bmNzOwo+Pj4+ICAgICAgICBkZGV2LT5tb2RlX2NvbmZpZy5u
b3JtYWxpemVfenBvcyA9IHRydWU7Cj4+Pj4KPj4+PiBAQCAtMjAzLDcgKzIwOSw3IEBAIHN0YXRp
YyBpbnQgc3RtX2RybV9wbGF0Zm9ybV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+Pj4+ICAgICAgICBpZiAocmV0KQo+Pj4+ICAgICAgICAgICAgICAgIGdvdG8gZXJyX3B1dDsK
Pj4+Pgo+Pj4+IC0gICAgIGRybV9mYmRldl9kbWFfc2V0dXAoZGRldiwgMTYpOwo+Pj4+ICsgICAg
IGRybV9mYmRldl9kbWFfc2V0dXAoZGRldiwgc3RtX2JwcCk7Cj4+Pj4KPj4+PiAgICAgICAgcmV0
dXJuIDA7Cj4+Pj4KPj4+IEFja2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVA
Zm9zcy5zdC5jb20+Cj4+PiBNYW55IHRoYW5rcywKPj4+IFBoaWxpcHBlIDotKQo+Pj4KPj4gQWNj
b3JkaW5nIHRvIHRoZSBsYXRlc3QgcmV2aWV3IG9uIHVzYiBwYXRjaHNldDogIlBsZWFzZSBkbyBu
b3QgYWRkIG5ldwo+PiBtb2R1bGUgcGFyYW1ldGVycywgdGhpcyBpcyBub3QgdGhlIDE5OTAncyBh
bnltb3JlLgo+PiBXZSBoYXZlIHBlci1kZXZpY2Ugc2V0dGluZ3MgZXZlcnl3aGVyZSwgdGhpcyBt
YWtlcyB0aGF0IGltcG9zc2libGUuCj4+IEp1c3QgdXNlIGEgRFQgdmFsdWUsIGlmIGl0IGlzIHdy
b25nLCB0aGVuIGZpeCB0aGUgRFQgdmFsdWUhICBObyBuZWVkIHRvCj4+IGhhdmUgdGhlIGtlcm5l
bCBvdmVycmlkZSBpdCwgdGhhdCdzIG5vdCB3aGF0IERUIGZpbGVzIGFyZSBmb3IuIgo+IAo+IAo+
IEkgYWN0dWFsbHkgYW0gY29uZmxpY3RlZCBhYm91dCB0aGlzIGlkZWEsIGJ1dCBJIHN0aWxsIHRo
aW5rIHRoYXQgaGVyZSB0aGUgYmVzdAo+IG9wdGlvbiB3b3VsZCBiZSB0byBwdXQgYSBkZXZpY2Ut
dHJlZSBwcm9wZXJ0eS4KPiAKPiBJbiB3aGljaCBjb250ZXh0IGhlcmUgdGhlIG1vZHVsZSBwYXJh
bWV0ZXJzIGNvdWxkIGJlIHVzZWQgPyBJIHRoaW5rIGEgbW9kdWxlCj4gcGFyYW1ldGVyIHdvdWxk
IGJlIHF1aXRlIHRyb3VibGVzb21lIGZvciB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIGluIHRoYXQg
Y2FzZS4KPiAKPiAKPiBSYXBoYcOrbAo+IAo+Pgo+PiBJIHRoaW5rIGl0IG1ha2VzIG1vcmUgc2Vu
c2UgdG8gaGF2ZSBkdHMgcGFyYW1ldGVycy4gU2hvdWxkIG1heWJlIGFwcGx5IGhlcmUgdG9vCj4+
Cj4+IE1pY2hhZWwKCkhpIFJhcGhhw6tsICYgTWljaGFlbCwKCk1hbnkgdGhhbmtzIGZvciB5b3Vy
IGNvbW1lbnRzLgoKRGFyaW8ncyB1c2FnZSBvZiB0aGlzIHN0bSBkcml2ZXIgaXMgU1RNMzIgTUNV
cyAoU1RNMzJGNCAmIEY3Li4uKSB3aGVyZSwgCnNvbWV0aW1lcywgb2xkIHVzZXJsYW5kIGZiZGV2
LWJhc2VkIGFwcGxpY2F0aW9ucyBhcmUgdXNlZCwgYW5kIEkgaW1hZ2luZSAKaXQgaXMgbWF5YmUg
ImVhc2llciIgdG8gdXNlIGEgbW9kdWxlIHBhcmFtZXRlciAodGhyb3VnaCB0aGUga2VybmVsIApj
b21tYW5kIGxpbmUgb3Igd2hhdGV2ZXIuLi4pIGluIHRoZXNlIHVzZSBjYXNlcyAoZXZlbiBpZiB1
c2luZyBkdCBpcyAKYWx3YXlzIGJldHRlciBhbmQgbm90IHRoYXQgY29tcGxleCkuCgpNb3Jlb3Zl
ciwgYXMgSSBkaWQgbm90IGZpbmQgYW55IGRybSBkcml2ZXJzIHdpdGggZHJtX2ZiZGV2X2RtYV9z
ZXR1cCgpIAp1c2luZyBhIGR0IHByb3BlcnR5ICJhcyBleGFtcGxlIiAoYnV0IGFsd2F5cyBoYXJk
LWNvZGVkIHZhbHVlKSwgdGhlbiBJIApkZWNpZGVkIHRvIG5vdCBibG9jayB0aGlzIHByb3Bvc2Fs
IDopCgpUaGFua3MgdG8geW91ciBmZWVkYmFjaywgSSBhbSByZWNvbnNpZGVyaW5nIG15IHBvc2l0
aW9uLiBBbmQgc29ycnkgCkRhcmlvLCBob3BlIHlvdSB1bmRlcnN0YW5kIGl0IHdpbGwgdGFrZSBt
b3JlIHRpbWUgZm9yIHJldmlld2luZyB5b3VyIHBhdGNoLgoKRG9lcyBhbnlvbmUgaGF2ZSBhbiBv
cGluaW9uIHRvIHNoYXJlIG9uIHRoaXMgcG9pbnQ/CgpNYW55IHRoYW5rcywKUGhpbGlwcGUgOi0p
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
