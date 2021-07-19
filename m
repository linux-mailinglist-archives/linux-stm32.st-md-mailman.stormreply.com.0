Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3C23CD5D5
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jul 2021 15:40:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A168C57B6B;
	Mon, 19 Jul 2021 13:40:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C45C3C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 13:40:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JDaoJh017942; Mon, 19 Jul 2021 15:40:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ZcrhWZxjqzw+tLt3ksAwkFTYrwwcbGzvtLZGLF4ZfNk=;
 b=Z4FtGDp7HjhOsUz0+FRIcems2MI7KjNmQkNa5mX/BuTbyaJ2404ja3XeGL+zjev+ZWlk
 SJNXM/GHgbdLnh8wnAW2oUFvhvFo9uWmIJIhfMoHT8sZAG39Vk9wXZz5RXeXDQFDjSnL
 rrdRmqtHs3P2A0mxy5Xjg5Mk8gitrix+E8SFHzlTOKuuAZctZCRTTU+H4NDL3ONdvHXt
 2Njl1kQYbsDl0oTgiIeaxS4lwPI2uu+3ydZmybai/eJvi0HOs3/VRXTQIOvSNzhD7TKD
 2OKP1uKktlN6nZsioP5TqbFre1i1Igexk/vwpxQVfnYV08E4OFzq43FNVuDbXPnFjPRo OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39w76ds2f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 15:40:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B89010002A;
 Mon, 19 Jul 2021 15:40:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 435732291C7;
 Mon, 19 Jul 2021 15:40:23 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Jul
 2021 15:40:21 +0200
From: Philippe CORNU <philippe.cornu@foss.st.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
References: <20210704135914.268308-1-jagan@amarulasolutions.com>
 <9008c9b8-ae48-588c-cfb4-cda7323e15dd@foss.st.com>
Message-ID: <5306eb41-64d7-1aa3-91f4-2f787c3a2109@foss.st.com>
Date: Mon, 19 Jul 2021 15:40:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9008c9b8-ae48-588c-cfb4-cda7323e15dd@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_05:2021-07-19,
 2021-07-19 signatures=0
Cc: linux-arm-kernel@lists.infradead.org, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: Silence -EPROBE_DEFER till
	bridge attached
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

CgpPbiA3LzEzLzIxIDY6NDMgUE0sIFBoaWxpcHBlIENPUk5VIHdyb3RlOgo+IEhpIEphZ2FuLAo+
IAo+IE9uIDcvNC8yMSAzOjU5IFBNLCBKYWdhbiBUZWtpIHdyb3RlOgo+PiBBcyBkdy1taXBpLWRz
aSBzdXBwb3J0ZWQgYWxsIHBvc3NpYmxlIHdheXMgdG8gZmluZCB0aGUgRFNJCj4+IGRldmljZXMu
IEl0IGNhbiB0YWtlIG11bHRpcGxlIGl0ZXJhdGlvbnMgZm9yIGx0ZGMgdG8gZmluZAo+PiBhbGwg
Y29tcG9uZW50cyBhdHRhY2hlZCB0byB0aGUgRFNJIGJyaWRnZS4KPj4KPj4gVGhlIGN1cnJlbnQg
bHRkYyBkcml2ZXIgZmFpbGVkIHRvIGZpbmQgdGhlIGVuZHBvaW50IGFzCj4+IGl0IHJldHVybmVk
IC1FSU5WQUwgZm9yIHRoZSBmaXJzdCBpdGVyYXRpb24gaXRzZWxmLiBUaGlzIGxlYWRzCj4+IHRv
IGZvbGxvd2luZyBlcnJvcjoKPj4KPj4gWyDCoCDCoDMuMDk5Mjg5XSBbZHJtOmx0ZGNfbG9hZF0g
KkVSUk9SKiBpbml0IGVuY29kZXIgZW5kcG9pbnQgMAo+Pgo+PiBTbywgY2hlY2sgdGhlIHJldHVy
biB2YWx1ZSBhbmQgY2xlYW51cCB0aGUgZW5jb2RlciBvbmx5IGlmIGl0J3MKPj4gbm90IC1FUFJP
QkVfREVGRVIuIFRoaXMgbWFrZSBhbGwgY29tcG9uZW50cyBpbiB0aGUgYXR0YWNoZWQgRFNJCj4+
IGJyaWRnZSBmb3VuZCBwcm9wZXJseS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8
amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
c3RtL2x0ZGMuYyB8IDggKysrKystLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9z
dG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPj4gaW5kZXggMDhiNzEyNDgw
NDRkLi45NWU5ODNkM2ZmYjUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRk
Yy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4+IEBAIC0xMTIyLDggKzEx
MjIsOSBAQCBzdGF0aWMgaW50IGx0ZGNfZW5jb2Rlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlIAo+
PiAqZGRldiwgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPj4gwqDCoMKgwqDCoCByZXQgPSBk
cm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBicmlkZ2UsIE5VTEwsIDApOwo+PiDCoMKgwqDCoMKg
IGlmIChyZXQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGRybV9lbmNvZGVyX2NsZWFudXAoZW5jb2Rl
cik7Cj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gK8KgwqDCoMKgwqDCoMKg
IGlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJt
X2VuY29kZXJfY2xlYW51cChlbmNvZGVyKTsKPiAKPiBNYW55IHRoYW5rcyBmb3IgeW91ciBwYXRj
aC4KPiAKPiBUaGlzIG1lYW5zIHRoYXQgd2UgYXJlIGNvdW50aW5nIG9uIHRoZSBmdXR1cmUgc3Vj
Y2VzcyBvZiB0aGUgZGVmZXJyZWQgCj4gcHJvYmUgYmVjYXVzZSB3ZSBkbyBub3QgY2xlYW4gdGhl
IGVuY29kZXIuLi4KPiBIb3dldmVyLCBZYW5uaWNrIGdhdmUgaGlzICJUZXN0ZWQtYnkiIGFuZCB0
aGlzIHBhdGNoIHNlZW1zIHVzZWZ1bCBzbwo+IAo+IEFja2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8
cGhpbGlwcGUuY29ybnVAZm9zcy5zdC5jb20+Cj4gCj4gSSB3aWxsIG1lcmdlIGl0IGZyaWRheSBv
ciBlYXJseSBuZXh0IHdlZWssCj4gCj4gVGhhbmsgeW91Cj4gUGhpbGlwcGUgOi0pCj4gCj4gCj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDC
oCBEUk1fREVCVUdfRFJJVkVSKCJCcmlkZ2UgZW5jb2RlcjolZCBjcmVhdGVkXG4iLCBlbmNvZGVy
LT5iYXNlLmlkKTsKPj4gQEAgLTEyNjYsNyArMTI2Nyw4IEBAIGludCBsdGRjX2xvYWQoc3RydWN0
IGRybV9kZXZpY2UgKmRkZXYpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoYnJpZGdlKSB7Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGx0ZGNfZW5jb2Rlcl9pbml0KGRkZXYs
IGJyaWRnZSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoImluaXQgZW5jb2RlciBlbmRw
b2ludCAlZFxuIiwgaSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJl
dCAhPSAtRVBST0JFX0RFRkVSKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgRFJNX0VSUk9SKCJpbml0IGVuY29kZXIgZW5kcG9pbnQgJWRcbiIsIGkpOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOwo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+CgpBcHBsaWVkIG9uIGRy
bS1taXNjLW5leHQuCk1hbnkgdGhhbmtzIGZvciB5b3VyIHBhdGNoLApQaGlsaXBwZSA6LSkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
