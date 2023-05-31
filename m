Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 523F8717FDB
	for <lists+linux-stm32@lfdr.de>; Wed, 31 May 2023 14:23:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03EBCC69069;
	Wed, 31 May 2023 12:23:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6D17C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 12:23:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34V8vGVY012865; Wed, 31 May 2023 14:23:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=f/4V+3ywcAJTl9+Rz8L8N43LFhDVxFDBScrS7zYm3+Q=;
 b=ceITOanTGnl+bZkJBzk11F9bDED2a1fxEu8JFfvAl1LOwv7hfrGUo320mMVy5Ve5MYtL
 2z5joZhGREfc1euWlM6p+YvltXDxpk/o4Wto8YKabpD6wtiz1qDo9/XFZcewQhS67HLF
 vXnT3A3uCEb/GukNToMye2aewsnlAth+w7KgAbNdcMB1OkSAxB3365zpAaI7k92VL2kz
 gxzdbvOhsho21YR6IWiuP59dqPNNYlxxKC7dmgTIzqPiUEQrnNFM1mih4si7G7Zcoh5O
 yP+g9tXSnd0ehULbcMgKnq83QBQkYl80uBCy05HQwB6Fw6EqXlMrqFOBmhcc1KsI7VPN iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qx3671dth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 14:23:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BACE010002A;
 Wed, 31 May 2023 14:23:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A65E0233C8E;
 Wed, 31 May 2023 14:23:03 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 31 May
 2023 14:23:03 +0200
Message-ID: <421ecc95-413d-71c3-36e3-abc8da9db316@foss.st.com>
Date: Wed, 31 May 2023 14:23:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Claudiu Beznea <claudiu.beznea@microchip.com>,
 <yannick.fertre@foss.st.com>, <philippe.cornu@foss.st.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
References: <20230531072854.142629-1-claudiu.beznea@microchip.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20230531072854.142629-1-claudiu.beznea@microchip.com>
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_08,2023-05-31_01,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: check memory returned by
	devm_kzalloc()
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

Ck9uIDUvMzEvMjMgMDk6MjgsIENsYXVkaXUgQmV6bmVhIHdyb3RlOgo+IGRldm1fa3phbGxvYygp
IGNhbiBmYWlsIGFuZCByZXR1cm4gTlVMTCBwb2ludGVyLiBDaGVjayBpdHMgcmV0dXJuIHN0YXR1
cy4KPiBJZGVudGlmaWVkIHdpdGggQ29jY2luZWxsZSAoa21lcnIuY29jY2kgc2NyaXB0KS4KPgo+
IEZpeGVzOiA0ODRlNzJkMzE0NmIgKCJkcm0vc3RtOiBsdGRjOiBhZGQgc3VwcG9ydCBvZiB5Y2Jj
ciBwaXhlbCBmb3JtYXRzIikKPiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRp
dS5iZXpuZWFAbWljcm9jaGlwLmNvbT4KPiAtLS0KPgo+IEhpLApIaSBDbGF1ZGl1Cj4KPiBUaGlz
IGhhcyBiZWVuIGFkZHJlc3NlZCB1c2luZyBrbWVyci5jb2NjaSBzY3JpcHQgcHJvcG9zZWQgZm9y
IHVwZGF0ZQo+IGF0IFsxXS4KPgo+IFRoYW5rIHlvdSwKPiBDbGF1ZGl1IEJlem5lYQo+Cj4gWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDUzMDA3NDA0NC4xNjAzNDI2LTEtY2xh
dWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbS8KPgo+ICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMu
YyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRj
LmMKPiBpbmRleCAwM2M2YmVjZGE3OTUuLjlmM2FjNTRkNGNiMyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5j
Cj4gQEAgLTE1NzksNiArMTU3OSw4IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX3BsYW5lICpsdGRjX3Bs
YW5lX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiwKPiAgCQkJICAgICAgIEFSUkFZX1NJ
WkUobHRkY19kcm1fZm10X3ljYmNyX3NwKSArCj4gIAkJCSAgICAgICBBUlJBWV9TSVpFKGx0ZGNf
ZHJtX2ZtdF95Y2Jjcl9mcCkpICoKPiAgCQkJICAgICAgIHNpemVvZigqZm9ybWF0cyksIEdGUF9L
RVJORUwpOwo+ICsJaWYgKCFmb3JtYXRzKQo+ICsJCXJldHVybiBOVUxMOwo+ICAKPiAgCWZvciAo
aSA9IDA7IGkgPCBsZGV2LT5jYXBzLnBpeF9mbXRfbmI7IGkrKykgewo+ICAJCWRybV9mbXQgPSBs
ZGV2LT5jYXBzLnBpeF9mbXRfZHJtW2ldOwoKCkFja2VkLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91
IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNo
LgoKQ2hlZXJzLApSYXBoYcOrbCBHLi1QLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
