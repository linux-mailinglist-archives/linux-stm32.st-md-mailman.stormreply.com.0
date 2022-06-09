Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 945865450ED
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jun 2022 17:36:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42A36C5EC76;
	Thu,  9 Jun 2022 15:36:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A844C5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jun 2022 15:36:21 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 259CqInK014220;
 Thu, 9 Jun 2022 17:36:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fBBK0lRj7eRfQiKEbQnTSqGbA1p8lUqyMPbkLL/n2hM=;
 b=IZEyTsmCQsBm3CFjoZJzXyY6TStR7QMuWnhr6iKGYgESbiU3gOMRrGEOWBAVh/wlTiMO
 Y3VFPey3Iy9SjY1JsagqevT/BsZ5bXY8wMI9uW0CueyYvrHlPWy+s8TJTuvvRa0/zp06
 Ssxg4Sa7BlFp8VfvZ1Em0vVzmnSlfPOr/Omfzgp6L2bquQcZdHbS9s/2Uk8zDM7YqhiN
 8Q415dk5ac8aHwR8CZzKD2sWiFicN74Ls+w0hyUSJcU2NriiLQn4q1FdWKmUrguqILkj
 Sq7wNFxyI23CN5s12zJWv6cx+fuXs1U4rn9RnfmJhGRAG4eBI9+bkPKnrV/uSJ5TATuY lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gj3cu1smg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 17:36:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0FB110002A;
 Thu,  9 Jun 2022 17:36:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9B59221793;
 Thu,  9 Jun 2022 17:36:13 +0200 (CEST)
Received: from [10.201.21.53] (10.75.127.51) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 9 Jun
 2022 17:36:12 +0200
Message-ID: <be63f46a-d6b0-8109-4c8a-a421aa791e3b@foss.st.com>
Date: Thu, 9 Jun 2022 17:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220603134334.592805-1-yannick.fertre@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20220603134334.592805-1-yannick.fertre@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_12,2022-06-09_01,2022-02-23_01
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: fix various coding-style
	warnings
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

SGksCgoKVGhhbmtzCgpBY2tlZC1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxs
YWlzLXBvdUBmb3NzLnN0LmNvbT4KCgpDaGVlcnMsCgpSYXBoYcOrbAoKT24gNi8zLzIyIDE1OjQz
LCBZYW5uaWNrIEZlcnRyZSB3cm90ZToKPiBGaXggaXNzdWVzIHJlcG9ydGVkIGJ5IGNoZWNrcGF0
Y2gucGw6Cj4gLSBCcmFjZXMge30gc2hvdWxkIGJlIHVzZWQgb24gYWxsIGFybXMKPiAtIEJsYW5r
IGxpbmVzCj4KPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5mZXJ0cmVA
Zm9zcy5zdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwgNSArKy0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJt
L3N0bS9sdGRjLmMKPiBpbmRleCBhNDA5OGFhZmYyNDMuLjZhOWY2MTM4MzliNSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
dG0vbHRkYy5jCj4gQEAgLTkwOCw5ICs5MDgsOSBAQCBzdGF0aWMgdm9pZCBsdGRjX2NydGNfbW9k
ZV9zZXRfbm9mYihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gIAkJZHJtX2Nvbm5lY3Rvcl9saXN0
X2l0ZXJfZW5kKCZpdGVyKTsKPiAgCX0KPiAgCj4gLQlpZiAoYnJpZGdlICYmIGJyaWRnZS0+dGlt
aW5ncykKPiArCWlmIChicmlkZ2UgJiYgYnJpZGdlLT50aW1pbmdzKSB7Cj4gIAkJYnVzX2ZsYWdz
ID0gYnJpZGdlLT50aW1pbmdzLT5pbnB1dF9idXNfZmxhZ3M7Cj4gLQllbHNlIGlmIChjb25uZWN0
b3IpIHsKPiArCX0gZWxzZSBpZiAoY29ubmVjdG9yKSB7Cj4gIAkJYnVzX2ZsYWdzID0gY29ubmVj
dG9yLT5kaXNwbGF5X2luZm8uYnVzX2ZsYWdzOwo+ICAJCWlmIChjb25uZWN0b3ItPmRpc3BsYXlf
aW5mby5udW1fYnVzX2Zvcm1hdHMpCj4gIAkJCWJ1c19mb3JtYXRzID0gY29ubmVjdG9yLT5kaXNw
bGF5X2luZm8uYnVzX2Zvcm1hdHNbMF07Cj4gQEAgLTE5MTcsNyArMTkxNyw2IEBAIGludCBsdGRj
X2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYpCj4gIAkJCURSTV9FUlJPUigiRmFpbGVkIHRv
IHJlZ2lzdGVyIExUREMgaW50ZXJydXB0XG4iKTsKPiAgCQkJZ290byBlcnI7Cj4gIAkJfQo+IC0K
PiAgCX0KPiAgCj4gIAljcnRjID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpjcnRjKSwgR0ZQ
X0tFUk5FTCk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
