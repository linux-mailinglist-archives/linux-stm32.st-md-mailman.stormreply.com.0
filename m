Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2312F48C139
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jan 2022 10:45:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1005C5F1F5;
	Wed, 12 Jan 2022 09:45:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AAEEC5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 09:45:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20C7J52B019096;
 Wed, 12 Jan 2022 10:44:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QKXUvjkTnqfyuuJJ/9fLbLqUbNNWBj6UxoTZSD1VgXg=;
 b=0g/MsK1OiOZU3dq3G+D9GapTzmQoW0YuFw/h5Ckk73elOP3+Le70B19CLQZcWzaRyP+A
 CJJBRhXPyMms72FMVYJk3TOCHFDbI5dWJ6SRMK37GhUNW+Xo/92x3ZUQYRTNMetn/plf
 qJcjWFbMshrfUEyUXbAa96a9pb1pTnOQFHy/Va4Cm9oO1XzV1IU5a26vFN/B3CzB+UHH
 zpD3IaZSjYd4SMqVYH1WdlcLmzjSoZLij/SvntyI0C2GCNkF7D3DQ9W2G9qqPfn8IGo9
 LUnkfzMr0E40eeuyzSNluk4L97Pk3TSMlhXoXbFvXqZctksW32DqKb/1XyS2fsZah23f aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhtg9s0m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 10:44:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 81091100034;
 Wed, 12 Jan 2022 10:44:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72E2D218120;
 Wed, 12 Jan 2022 10:44:28 +0100 (CET)
Received: from lmecxl0951.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan
 2022 10:44:27 +0100
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 <contact@emersion.fr>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
 <20211222090552.25972-7-jose.exposito89@gmail.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <c5ffa201-4811-b070-75b5-85064cd78506@foss.st.com>
Date: Wed, 12 Jan 2022 10:44:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222090552.25972-7-jose.exposito89@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
Cc: airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 alexandre.torgue@foss.st.com, stefan@agner.ch, benjamin.gaignard@linaro.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, marex@denx.de,
 linux-imx@nxp.com, intel-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, daniel@ffwll.ch,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 jani.nikula@linux.intel.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, dmitry.baryshkov@linaro.org, shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 6/6] drm/stm: ltdc: Drop
	format_mod_supported function
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

SGVsbG8gSm9zw6ksCnRoYW5rcyBmb3IgeW91ciBwYXRjaC4KClJldmlld2VkLWJ5OiBZYW5uaWNr
IEZlcnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+ClRlc3RlZC1ieTogWWFubmljayBG
ZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKCk9uIDEyLzIyLzIxIDEwOjA1IEFN
LCBKb3PDqSBFeHDDs3NpdG8gd3JvdGU6Cj4gVGhlICJkcm1fcGxhbmVfZnVuY3MuZm9ybWF0X21v
ZF9zdXBwb3J0ZWQiIGNhbiBiZSByZW1vdmVkIGluIGZhdm9yIG9mCj4gdGhlIGRlZmF1bHQgaW1w
bGVtZW50YXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgRXhww7NzaXRvIDxqb3NlLmV4
cG9zaXRvODlAZ21haWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMg
fCAxMSAtLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdG0vbHRkYy5jCj4gaW5kZXggZGJkZWU5NTQ2OTJhLi5lZjkwOWU1MGYwZTQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
c3RtL2x0ZGMuYwo+IEBAIC05MjUsMTYgKzkyNSw2IEBAIHN0YXRpYyB2b2lkIGx0ZGNfcGxhbmVf
YXRvbWljX3ByaW50X3N0YXRlKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwKPiAgIAlmcHNpLT5jb3Vu
dGVyID0gMDsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgYm9vbCBsdGRjX3BsYW5lX2Zvcm1hdF9tb2Rf
c3VwcG9ydGVkKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+IC0JCQkJCSAgICB1MzIgZm9ybWF0
LAo+IC0JCQkJCSAgICB1NjQgbW9kaWZpZXIpCj4gLXsKPiAtCWlmIChtb2RpZmllciA9PSBEUk1f
Rk9STUFUX01PRF9MSU5FQVIpCj4gLQkJcmV0dXJuIHRydWU7Cj4gLQo+IC0JcmV0dXJuIGZhbHNl
Owo+IC19Cj4gLQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MgbHRkY19w
bGFuZV9mdW5jcyA9IHsKPiAgIAkudXBkYXRlX3BsYW5lID0gZHJtX2F0b21pY19oZWxwZXJfdXBk
YXRlX3BsYW5lLAo+ICAgCS5kaXNhYmxlX3BsYW5lID0gZHJtX2F0b21pY19oZWxwZXJfZGlzYWJs
ZV9wbGFuZSwKPiBAQCAtOTQzLDcgKzkzMyw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3Bs
YW5lX2Z1bmNzIGx0ZGNfcGxhbmVfZnVuY3MgPSB7Cj4gICAJLmF0b21pY19kdXBsaWNhdGVfc3Rh
dGUgPSBkcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9kdXBsaWNhdGVfc3RhdGUsCj4gICAJLmF0b21p
Y19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfZGVzdHJveV9zdGF0ZSwK
PiAgIAkuYXRvbWljX3ByaW50X3N0YXRlID0gbHRkY19wbGFuZV9hdG9taWNfcHJpbnRfc3RhdGUs
Cj4gLQkuZm9ybWF0X21vZF9zdXBwb3J0ZWQgPSBsdGRjX3BsYW5lX2Zvcm1hdF9tb2Rfc3VwcG9y
dGVkLAo+ICAgfTsKPiAgIAo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfaGVscGVy
X2Z1bmNzIGx0ZGNfcGxhbmVfaGVscGVyX2Z1bmNzID0gewo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
