Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2543B9E2D
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Jul 2021 11:25:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E575AC597AE;
	Fri,  2 Jul 2021 09:25:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61297C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jul 2021 09:23:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1629AxOI019441; Fri, 2 Jul 2021 11:23:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5ywvL4VVQ+2r/jhdIM14ypRiW/ywajQXfPzZ2maovTA=;
 b=LCFPp+Y/RgFx7ixHPOVRqbIYocI4RlvALr9i9XihsloC62P6IqcJYwyoVmO8ylFHUZ20
 L8og9QpEFFl1aiSqTNk9cS9Z7SrCTiYbrmqAsWAxFMurq+NRNG26/Sl2q2j4+Kmtysz5
 k0vqFhDN2uHI6j8gFBRBfBWOgFNkLlXVQGdpeN5Sxsf19WOtmvPibI9VciZUFYW9yYdL
 gc/Mewf4JRC9Ocf81Ywq18JbF7ik0ZCTLv5Bb7qoXfgJQ0Zjm56yfEe6pdpc4QASptl3
 H9b5gRz0WrsJfQE7zpIvK19h/jh6l6GLIR4EuT5PLLUFMAC9x0eLi+cos7DiI+ViAvAo lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39hw3cscpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 11:23:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 317E610002A;
 Fri,  2 Jul 2021 11:23:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E2F8217B92;
 Fri,  2 Jul 2021 11:23:23 +0200 (CEST)
Received: from lmecxl0557.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 2 Jul
 2021 11:23:22 +0200
To: Marek Vasut <marex@denx.de>
References: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
 <420e243d-7541-a07e-177b-d2db11c26aef@denx.de>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <3bb823e4-4724-7072-fe9f-7b8a355c8e50@foss.st.com>
Date: Fri, 2 Jul 2021 11:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <420e243d-7541-a07e-177b-d2db11c26aef@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-02_01:2021-07-02,
 2021-07-02 signatures=0
X-Mailman-Approved-At: Fri, 02 Jul 2021 09:25:48 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: improve pm_runtime to stop
	clocks
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

SGVsbG8gTWFyZWssCgoKU29ycnkgZm9yIHRoZSBsYXRlIGFuc3dlci4KCgpPbiA2LzMwLzIxIDI6
MzUgQU0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDYvMjkvMjEgMTo1OCBQTSwgUmFwaGFlbCBH
QUxMQUlTLVBPVSAtIGZvc3Mgd3JvdGU6Cj4KPiBbLi4uXQo+Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9zdG0vbHRkYy5jCj4+IEBAIC00MjUsMTAgKzQyNSwxNyBAQCBzdGF0aWMgdm9pZCBsdGRj
X2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgCj4+IGRybV9jcnRjICpjcnRjLAo+PiDCoCB7Cj4+
IMKgwqDCoMKgwqAgc3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0gY3J0Y190b19sdGRjKGNydGMp
Owo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gY3J0Yy0+ZGV2Owo+PiAr
wqDCoMKgIGludCByZXQ7Cj4+IMKgIMKgwqDCoMKgwqAgRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsK
Pj4gwqAgLcKgwqDCoCBwbV9ydW50aW1lX2dldF9zeW5jKGRkZXYtPmRldik7Cj4+ICvCoMKgwqAg
aWYgKCFwbV9ydW50aW1lX2FjdGl2ZShkZGV2LT5kZXYpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKGRkZXYtPmRldik7Cj4KPiBBbGwgdGhlc2UgaWYgKCFw
bV9ydW50aW1lX2FjdGl2ZSgpKSB0aGVuIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBjYWxscyAKPiBs
b29rIGxpa2Ugd29ya2Fyb3VuZCBmb3Igc29tZSBsYXJnZXIgaXNzdWUuIFNob3VsZG4ndCB0aGUg
cG1fcnVudGltZSAKPiBkbyBzb21lIHJlZmNvdW50aW5nIG9uIGl0cyBvd24gLCBzbyB0aGlzIHNo
b3VsZG4ndCBiZSBuZWVkZWQgPwoKClRoaXMgcHJvYmxlbSBwdXJlbHkgY29tZXMgZnJvbSB0aGUg
ZHJpdmVyIGludGVybmFscywgc28gSSBkb24ndCB0aGluayBpdCAKaXMgYSB3b3JrYXJvdW5kLgoK
QmVjYXVzZSBvZiB0aGUgImx0ZGNfY3J0Y19tb2RlX3NldF9ub2ZiIiBmdW5jdGlvbiB3aGljaCBk
b2VzIG5vdCBoYXZlIAphbnkgInN5bW1ldHJpY2FsIiBjYWxsLCBzdWNoIGFzIGVuYWJsZS9kaXNh
YmxlIGZ1bmN0aW9ucywgdGhlcmUgd2FzIHR3byAKY2FsbHMgdG8gcG1fcnVudGltZV9nZXRfc3lu
YyBhZ2FpbnN0IG9uZSBjYWxsIHRvIHBtX3J1bnRpbWVfcHV0X3N5bmMuCgpUaGlzIGluc3RhYmls
aXR5IHJlc3VsdGVkIGluIHRoZSBMVERDIGNsb2NrcyBiZWluZyBhbHdheXMgZW5hYmxlZCwgZXZl
biAKd2hlbiB0aGUgcGVyaXBoZXJhbCB3YXMgZGlzYWJsZWQuIFRoaXMgY291bGQgYmUgc2VlbiBp
biB0aGUgY2xrX3N1bW1hcnkgCmFzIGV4cGxhaW5lZCBpbiB0aGUgcGF0Y2ggc3VtbWFyeSBhbW9u
ZyBvdGhlciB0aGluZ3MuCgpCeSBkb2luZyBzbywgd2UgZmlyc3QgY2hlY2sgaWYgdGhlIGNsb2Nr
cyBhcmUgbm90IGFscmVhZHkgYWN0aXZhdGVkLCBhbmQgCmluIHRoYXQgY2FzZSB3ZSBjYWxsIHBt
X3J1bnRpbWVfZ2V0X3N5bmMuCgoKClJlZ2FyZHMsCgpSYXBoYcOrbCBHLVAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
