Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FA53BEBE2
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jul 2021 18:18:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 466A1C57B5B;
	Wed,  7 Jul 2021 16:18:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86C25C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jul 2021 16:18:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167GGpEh001466; Wed, 7 Jul 2021 18:18:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=q6ZRt8wYu3JAWTlz2Hw+S+Lmg2EkQ6azSVM1iOGAut4=;
 b=G2pys3L8qIlSZbSHUln/mo0CymN7cmTmhWS3R4UPv4iWtr+RJ2TYQpFfp43J1VzMNAQG
 fh5p/YVq21akB8jOSDJHSBVDndabSytaALJrP0ZOiLdPq3NSqkPcdssKxMiQNFw2n1hS
 VPZ4YXrspBq8d+pWiFJXQ+7GfSfWaB5wXWWbR8CtC1S6Zj71e2yUDbetL/LdYSLTpTHP
 RbvwoFDF4e0LIx4E7rXwpsCzv21nmD+K5uGYe+35gGMy0dMExbfYNHytJDL3xrvHdNyd
 9MA/70UtuGKR9/zXjSCEXJUJZhBWjvTPysQ6dMXqjlg5PRGLjXkdrhl3qlg1bOZ076fl sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39n8evtu12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 18:18:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CD78210002A;
 Wed,  7 Jul 2021 18:18:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71215231515;
 Wed,  7 Jul 2021 18:18:18 +0200 (CEST)
Received: from lmecxl0951.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Jul
 2021 18:18:17 +0200
To: Jagan Teki <jagan@amarulasolutions.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
References: <20210704135914.268308-1-jagan@amarulasolutions.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <b9264009-81be-e722-1127-c69baf72f4ce@foss.st.com>
Date: Wed, 7 Jul 2021 18:18:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704135914.268308-1-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_08:2021-07-06,
 2021-07-07 signatures=0
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

SGkgSmFnYW4sCgp0aGFua3MgZm9yIHRoZSBwYXRjaC4KClRlc3RlZC1ieTogWWFubmljayBGZXJ0
cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKCk9uIDcvNC8yMSAzOjU5IFBNLCBKYWdh
biBUZWtpIHdyb3RlOgo+IEFzIGR3LW1pcGktZHNpIHN1cHBvcnRlZCBhbGwgcG9zc2libGUgd2F5
cyB0byBmaW5kIHRoZSBEU0kKPiBkZXZpY2VzLiBJdCBjYW4gdGFrZSBtdWx0aXBsZSBpdGVyYXRp
b25zIGZvciBsdGRjIHRvIGZpbmQKPiBhbGwgY29tcG9uZW50cyBhdHRhY2hlZCB0byB0aGUgRFNJ
IGJyaWRnZS4KPiAKPiBUaGUgY3VycmVudCBsdGRjIGRyaXZlciBmYWlsZWQgdG8gZmluZCB0aGUg
ZW5kcG9pbnQgYXMKPiBpdCByZXR1cm5lZCAtRUlOVkFMIGZvciB0aGUgZmlyc3QgaXRlcmF0aW9u
IGl0c2VsZi4gVGhpcyBsZWFkcwo+IHRvIGZvbGxvd2luZyBlcnJvcjoKPiAKPiBbIMKgIMKgMy4w
OTkyODldIFtkcm06bHRkY19sb2FkXSAqRVJST1IqIGluaXQgZW5jb2RlciBlbmRwb2ludCAwCj4g
Cj4gU28sIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgYW5kIGNsZWFudXAgdGhlIGVuY29kZXIgb25s
eSBpZiBpdCdzCj4gbm90IC1FUFJPQkVfREVGRVIuIFRoaXMgbWFrZSBhbGwgY29tcG9uZW50cyBp
biB0aGUgYXR0YWNoZWQgRFNJCj4gYnJpZGdlIGZvdW5kIHByb3Blcmx5Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCA4ICsrKysrLS0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gaW5k
ZXggMDhiNzEyNDgwNDRkLi45NWU5ODNkM2ZmYjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3N0bS9sdGRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+IEBAIC0x
MTIyLDggKzExMjIsOSBAQCBzdGF0aWMgaW50IGx0ZGNfZW5jb2Rlcl9pbml0KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZGV2LCBzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ICAgCj4gICAJcmV0ID0g
ZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgYnJpZGdlLCBOVUxMLCAwKTsKPiAgIAlpZiAocmV0
KSB7Cj4gLQkJZHJtX2VuY29kZXJfY2xlYW51cChlbmNvZGVyKTsKPiAtCQlyZXR1cm4gLUVJTlZB
TDsKPiArCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCj4gKwkJCWRybV9lbmNvZGVyX2NsZWFu
dXAoZW5jb2Rlcik7Cj4gKwkJcmV0dXJuIHJldDsKPiAgIAl9Cj4gICAKPiAgIAlEUk1fREVCVUdf
RFJJVkVSKCJCcmlkZ2UgZW5jb2RlcjolZCBjcmVhdGVkXG4iLCBlbmNvZGVyLT5iYXNlLmlkKTsK
PiBAQCAtMTI2Niw3ICsxMjY3LDggQEAgaW50IGx0ZGNfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGRldikKPiAgIAkJaWYgKGJyaWRnZSkgewo+ICAgCQkJcmV0ID0gbHRkY19lbmNvZGVyX2luaXQo
ZGRldiwgYnJpZGdlKTsKPiAgIAkJCWlmIChyZXQpIHsKPiAtCQkJCURSTV9FUlJPUigiaW5pdCBl
bmNvZGVyIGVuZHBvaW50ICVkXG4iLCBpKTsKPiArCQkJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZF
UikKPiArCQkJCQlEUk1fRVJST1IoImluaXQgZW5jb2RlciBlbmRwb2ludCAlZFxuIiwgaSk7Cj4g
ICAJCQkJZ290byBlcnI7Cj4gICAJCQl9Cj4gICAJCX0KPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
