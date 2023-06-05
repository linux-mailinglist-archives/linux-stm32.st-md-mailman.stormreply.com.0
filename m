Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C015B722569
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jun 2023 14:18:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E9E1C6A5FA;
	Mon,  5 Jun 2023 12:18:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 696CCC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jun 2023 12:18:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3558WwJS016759; Mon, 5 Jun 2023 14:18:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=atnfwiK6Q0P8mro3RmnESTGq/63rKA2UZraorjLfXCs=;
 b=j0LtofPZmMII8sNb8zBLS0ZTJLLtJNpHU/KY3ZF7jq+G8vEWYhvm5N2Nwsn9p1SnFXaR
 fVghK4vsv40SWNdZ6s1UjFGwr+SqkQ/2BCcJKpYHQes2tWdI4LnfOSJSTJJIJ60rVRFn
 lziEaGEuHJJjRtXdrQ43RJd5TYof3PMLdeQgfNDDCWra7N+3MfYsminXiL6sO2xVYReO
 8c24ths+0S2T6wald4Lvsmh7HTbasX8XysWroFNd94hwCypYZl0YaLO4Mb5f22wPQn2J
 xw58tsxHXDl/f0UJfDtqByDBm/cJyP8IU+jXszSNrvco2prjWAIiFvcR6yjQoBnUfzOc WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r1c9s9f1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jun 2023 14:18:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56C4610002A;
 Mon,  5 Jun 2023 14:18:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 463F5227EE0;
 Mon,  5 Jun 2023 14:18:33 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 5 Jun
 2023 14:18:32 +0200
Message-ID: <4fb3f166-69b1-f06a-b395-d7c5d8be00bb@foss.st.com>
Date: Mon, 5 Jun 2023 14:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 michael@amarulasolutions.com, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/6] Add display support on the
	stm32f746-disco board
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

SGkgRGFyaW8sCgoKVGhhbmtzIGZvciB0aGlzIHNlcmllLiBJJ2xsIGxvb2sgYXQgaXQgc2hvcnRs
eS4KCkluIHRoZSBtZWFudGltZSwgd291bGQgaXQgYmUgcG9zc2libGUgdG8gc2VuZCBpdCBhZ2Fp
biBhcyBJIHRoaW5rIGl0IGlzIG5vdApjb21wbGV0ZS4KCnBhdGNod29yayBhbmQgbG9yZS5rZXJu
ZWwub3JnIGJvdGggcHJvbXB0IGluY29tcGxldGUgcGFydHMgb2YgeW91ciBzZXJpZS4KCmh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTE4ODE0Lz9fc21fYXVfPWlWVnJr
UVFrdjVyMXIwclFjTHBzdks2MThWZjYxCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2
ZWwvMjAyMzA2MDIxMDIxMjMuMzM0NTU4Ny0xLWRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlv
bnMuY29tLwoKClRoYW5rcywKClJhcGhhw6tsCgpPbiA2LzIvMjMgMTI6MjEsIERhcmlvIEJpbmFj
Y2hpIHdyb3RlOgo+IFRoZSBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgZGlzcGxheSBvbiB0
aGUgc3RtMzJmNzQ2LWRpc2NvIGJvYXJkLAo+IGFsb25nIHdpdGggYSBnZW5lcmljIHBhdGNoIHRo
YXQgYWRkcyB0aGUgImJwcCIgcGFyYW1ldGVyIHRvIHRoZSBzdG0tZHJtCj4gbW9kdWxlLiBUaGUg
aW50ZW50aW9uIGlzIHRvIGFsbG93IHVzZXJzIHRvIHNpemUsIHdpdGhpbiBjZXJ0YWluIGxpbWl0
cywKPiB0aGUgbWVtb3J5IGZvb3RwcmludCByZXF1aXJlZCBieSB0aGUgZnJhbWVidWZmZXIuCj4K
PiBDaGFuZ2VzIGluIHYyOgo+IC0gQWRkICdBY2tlZC1ieScgdGFnIG9mIENvbm9yIERvb2xleS4K
PiAtIEZpeCBidWlsZCB3YXJuaW5nIHJlcG9ydGVkIGJ5IGtlcm5lbCB0ZXN0IHJvYm90Lgo+IC0g
QWRkICdSZXBvcnRlZC1ieScgdGFnIG9mIGtlcm5lbCB0ZXN0IHJvYm90Lgo+Cj4gRGFyaW8gQmlu
YWNjaGkgKDYpOgo+ICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgbHRkYyBzdXBwb3J0IG9uIHN0bTMy
Zjc0NiBNQ1UKPiAgIEFSTTogZHRzOiBzdG0zMjogYWRkIHBpbiBtYXAgZm9yIExUREMgb24gc3Rt
MzJmNwo+ICAgQVJNOiBkdHM6IHN0bTMyOiBzdXBwb3J0IGRpc3BsYXkgb24gc3RtMzJmNzQ2LWRp
c2NvIGJvYXJkCj4gICBkdC1iaW5kaW5nczogZGlzcGxheTogc2ltcGxlOiBhZGQgUm9ja3RlY2gg
UkswNDNGTjQ4SAo+ICAgZHJtL3BhbmVsOiBzaW1wbGU6IGFkZCBzdXBwb3J0IGZvciBSb2NrdGVj
aCBSSzA0M0ZONDhIIHBhbmVsCj4gICBkcm0vc3RtOiBhZGQgYW4gb3B0aW9uIHRvIGNoYW5nZSBG
QiBicHAKPgo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFtbCAg
fCAgMiArCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjctcGluY3RybC5kdHNpICAgICAgICB8
IDM1ICsrKysrKysrKysrKysKPiAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNzQ2LWRpc2NvLmR0
cyAgICAgICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL2FybS9ib290L2R0cy9z
dG0zMmY3NDYuZHRzaSAgICAgICAgICAgICAgfCAxMCArKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaW1wbGUuYyAgICAgICAgICB8IDI5ICsrKysrKysrKysrCj4gIGRyaXZlcnMv
Z3B1L2RybS9zdG0vZHJ2LmMgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrLQo+ICA2IGZpbGVz
IGNoYW5nZWQsIDEzNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
