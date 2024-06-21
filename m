Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E190C9125F8
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 14:51:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E1A0C7128D;
	Fri, 21 Jun 2024 12:51:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6743BC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 12:51:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LAxF6i023086;
 Fri, 21 Jun 2024 14:51:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 F9PP+GAMB8H3TC0+mWhS7Ioi9VtML4Ue6Qm1isIiHOg=; b=GIMz+r+01qM4OmTQ
 Rw+Wbi6zox3ftv07m3IquRWIoQ9UCkoFhYFyWMcBxIcrHsnP0g+FpwPr7ahH/1bk
 pWBXE6vchfTG9C5ymy1CuvMBoLaDs2t9Hp6jJmYa6W+xqFSzLpwTHd2TyOtpfAgE
 PkAAwAN0KIa1L/FDJMWR3uvr8PtlyFnDa26X/WsKuIBDdL8soSCQnnj1ifC6hNpC
 cA42Q7grH6/qFTje3Qe8qP/kY2uwtRUO3jwC4YeqGdNWK3lB0Ho75d4ZvURjXNSs
 uxz/QeQSxWNXx4tO+JPobX0uRZWMS81fk+7VPWSqOmFiES254oirLx1YrDuJJ5TP
 nE4Gwg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yvrkkkp4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 14:51:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 68C084002D;
 Fri, 21 Jun 2024 14:51:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFCA92207AE;
 Fri, 21 Jun 2024 14:50:28 +0200 (CEST)
Received: from [10.48.87.177] (10.48.87.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 21 Jun
 2024 14:50:28 +0200
Message-ID: <2fd903ba-3daf-4aeb-896b-702183252f19@foss.st.com>
Date: Fri, 21 Jun 2024 14:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <20240129104106.43141-2-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20240129104106.43141-2-raphael.gallais-pou@foss.st.com>
X-Originating-IP: [10.48.87.177]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RESEND v3 1/3] drm/stm: dsi: use new
 SYSTEM_SLEEP_PM_OPS() macro
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

SGkgUmFwaGFlbCwKCnRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQWNrZWQtYnk6IFlhbm5pY2sgRmVy
dHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KClRlc3RlZC1ieTogWWFubmljayBGZXJ0
cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKQlIKCgpMZSAyOS8wMS8yMDI0IMOgIDEx
OjQxLCBSYXBoYWVsIEdhbGxhaXMtUG91IGEgw6ljcml0wqA6Cj4gVXNlIFJVTlRJTUVfUE1fT1BT
KCkgaW5zdGVhZCBvZiB0aGUgb2xkIFNFVF9TWVNURU1fU0xFRVBfUE1fT1BTKCkuCj4gVGhpcyBt
ZWFucyB3ZSBkb24ndCBuZWVkICBfX21heWJlX3VudXNlZCBvbiB0aGUgZnVuY3Rpb25zLgo+Cj4g
U2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBm
b3NzLnN0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3Rt
LmMgfCA4ICsrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9k
c2ktc3RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCj4gaW5kZXgg
ZDVmOGM5MjNkN2JjLi5iMWFlZTQzZDUxZTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3N0bS9kd19taXBpX2RzaS1zdG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlw
aV9kc2ktc3RtLmMKPiBAQCAtNTQ0LDcgKzU0NCw3IEBAIHN0YXRpYyB2b2lkIGR3X21pcGlfZHNp
X3N0bV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAlyZWd1bGF0b3Jf
ZGlzYWJsZShkc2ktPnZkZF9zdXBwbHkpOwo+ICAgfQo+ICAgCj4gLXN0YXRpYyBpbnQgX19tYXli
ZV91bnVzZWQgZHdfbWlwaV9kc2lfc3RtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICtz
dGF0aWMgaW50IGR3X21pcGlfZHNpX3N0bV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAg
IHsKPiAgIAlzdHJ1Y3QgZHdfbWlwaV9kc2lfc3RtICpkc2kgPSBkd19taXBpX2RzaV9zdG1fcGxh
dF9kYXRhLnByaXZfZGF0YTsKPiAgIAo+IEBAIC01NTYsNyArNTU2LDcgQEAgc3RhdGljIGludCBf
X21heWJlX3VudXNlZCBkd19taXBpX2RzaV9zdG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiAtc3RhdGljIGludCBfX21heWJlX3VudXNlZCBk
d19taXBpX2RzaV9zdG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiArc3RhdGljIGludCBk
d19taXBpX2RzaV9zdG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgIHsKPiAgIAlzdHJ1
Y3QgZHdfbWlwaV9kc2lfc3RtICpkc2kgPSBkd19taXBpX2RzaV9zdG1fcGxhdF9kYXRhLnByaXZf
ZGF0YTsKPiAgIAlpbnQgcmV0Owo+IEBAIC01ODAsOCArNTgwLDggQEAgc3RhdGljIGludCBfX21h
eWJlX3VudXNlZCBkd19taXBpX2RzaV9zdG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiAg
IH0KPiAgIAo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGR3X21pcGlfZHNpX3N0
bV9wbV9vcHMgPSB7Cj4gLQlTRVRfU1lTVEVNX1NMRUVQX1BNX09QUyhkd19taXBpX2RzaV9zdG1f
c3VzcGVuZCwKPiAtCQkJCWR3X21pcGlfZHNpX3N0bV9yZXN1bWUpCj4gKwlTWVNURU1fU0xFRVBf
UE1fT1BTKGR3X21pcGlfZHNpX3N0bV9zdXNwZW5kLAo+ICsJCQkgICAgZHdfbWlwaV9kc2lfc3Rt
X3Jlc3VtZSkKPiAgIH07Cj4gICAKPiAgIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGR3
X21pcGlfZHNpX3N0bV9kcml2ZXIgPSB7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
