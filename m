Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D74572E729
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 17:26:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0898BC6A61A;
	Tue, 13 Jun 2023 15:26:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17E27C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 15:26:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35DEHX9q030088; Tue, 13 Jun 2023 17:26:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pBHSboRIQNpMiFH/8SkhlwI8gI5E2jj1uj7up3t7/sY=;
 b=Se3ODTP3BuI9HRGau2KbeVij397T9MYRuKiEC8Z2OT0TuP/GsjoCvHRSIeSztyJpfvZY
 YXELzuHkDYgCrGnp5EwtEipq1ZSv3pB2jGDcbMrp6Ip9XiMq46Hcx6cUFL8yJxBXmLAk
 sWERIN0meZ7kxLkrCoBn+BQuo3C06J/y52xi0nDMm7mfprr6g0CWwJlOfQgfchhAwNRW
 lqh32DKvfru9Q3Z4HCSkoPQ+5PALI/IMzSwlk8T+IYVJcYuF3kA5TMPvKYiDzfjQijQ2
 btZ6qXPr9ZzqdeE423fK5f/rGDLnxWOEbTvXi24sbYUDuRrYseT8jJPGYs4TQrypynDw mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6t3agd98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 17:26:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9792810002A;
 Tue, 13 Jun 2023 17:26:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C555233009;
 Tue, 13 Jun 2023 17:26:33 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 17:26:32 +0200
Message-ID: <0da03538-fac6-385d-d74f-f7657eca542b@foss.st.com>
Date: Tue, 13 Jun 2023 17:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Philippe CORNU
 <philippe.cornu@foss.st.com>
References: <20230609062050.2107143-1-dario.binacchi@amarulasolutions.com>
 <20230609062050.2107143-5-dario.binacchi@amarulasolutions.com>
 <376dc16d-8896-0a47-b8dd-3f919c1e50bf@foss.st.com>
 <CAOf5uwmpAZeO=w-+cQNfy4VHS80NK-_HpDv5koZfTB8cRHOECQ@mail.gmail.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <CAOf5uwmpAZeO=w-+cQNfy4VHS80NK-_HpDv5koZfTB8cRHOECQ@mail.gmail.com>
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_18,2023-06-12_02,2023-05-22_02
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Ck9uIDYvMTMvMjMgMTY6NTIsIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSB3cm90ZToKPiBI
aQo+Cj4gT24gVHVlLCBKdW4gMTMsIDIwMjMgYXQgNDo0MeKAr1BNIFBoaWxpcHBlIENPUk5VCj4g
PHBoaWxpcHBlLmNvcm51QGZvc3Muc3QuY29tPiB3cm90ZToKPj4KPj4KPj4gT24gNi85LzIzIDA4
OjIwLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPj4+IEJvYXJkcyB0aGF0IHVzZSB0aGUgU1RNMzJG
ezQsN30gc2VyaWVzIGhhdmUgbGltaXRlZCBhbW91bnRzIG9mIFJBTS4gVGhlCj4+PiBhZGRlZCBw
YXJhbWV0ZXIgYWxsb3dzIHVzZXJzIHRvIHNpemUsIHdpdGhpbiBjZXJ0YWluIGxpbWl0cywgdGhl
IG1lbW9yeQo+Pj4gZm9vdHByaW50IHJlcXVpcmVkIGJ5IHRoZSBmcmFtZWJ1ZmZlci4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20+Cj4+Pgo+Pj4gLS0tCj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2MzoKPj4+IC0gZHJv
cCBbNC82XSBkdC1iaW5kaW5nczogZGlzcGxheTogc2ltcGxlOiBhZGQgUm9ja3RlY2ggUkswNDNG
TjQ4SAo+Pj4gICAgQXBwbGllZCB0byBodHRwczovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2dp
dC9kcm0vZHJtLW1pc2MuZ2l0IChkcm0tbWlzYy1uZXh0KToKPj4+ICAgIGh0dHBzOi8vY2dpdC5m
cmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9YzQyYTM3YTI3Yzc3N2Q2Mzk2
MWRkNjM0YTMwZjdjODg3OTQ5NDkxYQo+Pj4gLSBkcm9wIFs1LzZdIGRybS9wYW5lbDogc2ltcGxl
OiBhZGQgc3VwcG9ydCBmb3IgUm9ja3RlY2ggUkswNDNGTjQ4SCBwYW5lbAo+Pj4gICAgQXBwbGll
ZCB0byBodHRwczovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2dpdC9kcm0vZHJtLW1pc2MuZ2l0
IChkcm0tbWlzYy1uZXh0KQo+Pj4gICAgaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0v
ZHJtLW1pc2MvY29tbWl0Lz9pZD0xM2NkZDEyYTlmOTM0MTU4ZjRlYzgxN2NmMDQ4ZmNiNDM4NGFh
OWRjCj4+Pgo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIHwgOCArKysrKysrLQo+Pj4g
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
c3RtL2Rydi5jCj4+PiBpbmRleCA0MjIyMjBkZjdkOGMuLjY1YmUyYjQ0MmE2YSAxMDA2NDQKPj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdG0vZHJ2LmMKPj4+IEBAIC0zMCw2ICszMCwxMSBAQAo+Pj4gICAjZGVmaW5lIFNUTV9NQVhf
RkJfV0lEVEggICAgMjA0OAo+Pj4gICAjZGVmaW5lIFNUTV9NQVhfRkJfSEVJR0hUICAgMjA0OCAv
KiBzYW1lIGFzIHdpZHRoIHRvIGhhbmRsZSBvcmllbnRhdGlvbiAqLwo+Pj4KPj4+ICtzdGF0aWMg
dWludCBzdG1fYnBwID0gMTY7Cj4+PiArCj4+PiArTU9EVUxFX1BBUk1fREVTQyhicHAsICJiaXRz
LXBlci1waXhlbCAoZGVmYXVsdDogMTYpIik7Cj4+PiArbW9kdWxlX3BhcmFtX25hbWVkKGJwcCwg
c3RtX2JwcCwgdWludCwgMDY0NCk7Cj4+PiArCj4+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X21vZGVfY29uZmlnX2Z1bmNzIGRydl9tb2RlX2NvbmZpZ19mdW5jcyA9IHsKPj4+ICAgICAgIC5m
Yl9jcmVhdGUgPSBkcm1fZ2VtX2ZiX2NyZWF0ZSwKPj4+ICAgICAgIC5hdG9taWNfY2hlY2sgPSBk
cm1fYXRvbWljX2hlbHBlcl9jaGVjaywKPj4+IEBAIC05Myw2ICs5OCw3IEBAIHN0YXRpYyBpbnQg
ZHJ2X2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYpCj4+PiAgICAgICBkZGV2LT5tb2RlX2Nv
bmZpZy5taW5faGVpZ2h0ID0gMDsKPj4+ICAgICAgIGRkZXYtPm1vZGVfY29uZmlnLm1heF93aWR0
aCA9IFNUTV9NQVhfRkJfV0lEVEg7Cj4+PiAgICAgICBkZGV2LT5tb2RlX2NvbmZpZy5tYXhfaGVp
Z2h0ID0gU1RNX01BWF9GQl9IRUlHSFQ7Cj4+PiArICAgICBkZGV2LT5tb2RlX2NvbmZpZy5wcmVm
ZXJyZWRfZGVwdGggPSBzdG1fYnBwOwo+Pj4gICAgICAgZGRldi0+bW9kZV9jb25maWcuZnVuY3Mg
PSAmZHJ2X21vZGVfY29uZmlnX2Z1bmNzOwo+Pj4gICAgICAgZGRldi0+bW9kZV9jb25maWcubm9y
bWFsaXplX3pwb3MgPSB0cnVlOwo+Pj4KPj4+IEBAIC0yMDMsNyArMjA5LDcgQEAgc3RhdGljIGlu
dCBzdG1fZHJtX3BsYXRmb3JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+
PiAgICAgICBpZiAocmV0KQo+Pj4gICAgICAgICAgICAgICBnb3RvIGVycl9wdXQ7Cj4+Pgo+Pj4g
LSAgICAgZHJtX2ZiZGV2X2RtYV9zZXR1cChkZGV2LCAxNik7Cj4+PiArICAgICBkcm1fZmJkZXZf
ZG1hX3NldHVwKGRkZXYsIHN0bV9icHApOwo+Pj4KPj4+ICAgICAgIHJldHVybiAwOwo+Pj4KPj4g
QWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBmb3NzLnN0LmNvbT4KPj4g
TWFueSB0aGFua3MsCj4+IFBoaWxpcHBlIDotKQo+Pgo+IEFjY29yZGluZyB0byB0aGUgbGF0ZXN0
IHJldmlldyBvbiB1c2IgcGF0Y2hzZXQ6ICJQbGVhc2UgZG8gbm90IGFkZCBuZXcKPiBtb2R1bGUg
cGFyYW1ldGVycywgdGhpcyBpcyBub3QgdGhlIDE5OTAncyBhbnltb3JlLgo+IFdlIGhhdmUgcGVy
LWRldmljZSBzZXR0aW5ncyBldmVyeXdoZXJlLCB0aGlzIG1ha2VzIHRoYXQgaW1wb3NzaWJsZS4K
PiBKdXN0IHVzZSBhIERUIHZhbHVlLCBpZiBpdCBpcyB3cm9uZywgdGhlbiBmaXggdGhlIERUIHZh
bHVlISAgTm8gbmVlZCB0bwo+IGhhdmUgdGhlIGtlcm5lbCBvdmVycmlkZSBpdCwgdGhhdCdzIG5v
dCB3aGF0IERUIGZpbGVzIGFyZSBmb3IuIgoKCkkgYWN0dWFsbHkgYW0gY29uZmxpY3RlZCBhYm91
dCB0aGlzIGlkZWEsIGJ1dCBJIHN0aWxsIHRoaW5rIHRoYXQgaGVyZSB0aGUgYmVzdApvcHRpb24g
d291bGQgYmUgdG8gcHV0IGEgZGV2aWNlLXRyZWUgcHJvcGVydHkuCgpJbiB3aGljaCBjb250ZXh0
IGhlcmUgdGhlIG1vZHVsZSBwYXJhbWV0ZXJzIGNvdWxkIGJlIHVzZWQgPyBJIHRoaW5rIGEgbW9k
dWxlCnBhcmFtZXRlciB3b3VsZCBiZSBxdWl0ZSB0cm91Ymxlc29tZSBmb3IgdXNlcnNwYWNlIGFw
cGxpY2F0aW9ucyBpbiB0aGF0IGNhc2UuCgoKUmFwaGHDq2wKCj4KPiBJIHRoaW5rIGl0IG1ha2Vz
IG1vcmUgc2Vuc2UgdG8gaGF2ZSBkdHMgcGFyYW1ldGVycy4gU2hvdWxkIG1heWJlIGFwcGx5IGhl
cmUgdG9vCj4KPiBNaWNoYWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
