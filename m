Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A03E923AFF
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jul 2024 12:02:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8585AC71282;
	Tue,  2 Jul 2024 10:02:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3848C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2024 10:02:01 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46284MAV002305;
 Tue, 2 Jul 2024 12:01:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 MIg3DBI11sSmG6wbpd1DN3SW8f/bMTTym/JO7g3ovAY=; b=meLx/pdejVh1bTGy
 uiOCkKrNavNX2j6fEcHeoDBVA9rQI/vqeh/OSOWTTRsttxc8sHmjPcZIS0i6dlcF
 r+2Ekv1DYq9MKu9Bruma9yWFHdmR9uvctzaJnTFSVuZDm8JO/c57GsEqoC4ifMI9
 kXj+u56SubQnamAqrK9K6qSex+Ehy3cegUGyr0LfhS39ypwUB4pmajtm8SCuwWd3
 XWmUfNPcJ8z+WzEWJrmrwF8JgfzQKOezzYepK7oL7lWlxRAXGiCiUDAlB0QU3gpB
 Wn5O+H0ZWUHuZa/LOv5itGw0pYjiPz3vFkGgN7oH6f23+83dPscbIS4xiiklspxG
 YxxZdw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4027pgjyqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jul 2024 12:01:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 725024004B;
 Tue,  2 Jul 2024 12:01:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BE492207C0;
 Tue,  2 Jul 2024 12:00:37 +0200 (CEST)
Received: from [10.252.8.242] (10.252.8.242) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Jul
 2024 12:00:36 +0200
Message-ID: <b33d9470-b845-478f-97d3-636e158693d2@foss.st.com>
Date: Tue, 2 Jul 2024 12:00:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 <yannick.fertre@foss.st.com>
References: <20240701062304.42844-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240701062304.42844-1-jiapeng.chong@linux.alibaba.com>
X-Originating-IP: [10.252.8.242]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_06,2024-07-02_02,2024-05-17_01
Cc: mcoquelin.stm32@gmail.com, tzimmermann@suse.de,
 Abaci Robot <abaci@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: Remove unnecessary .owner for
 lvds_platform_driver
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

SGkgSmlhcGVuZywKCk9uIDcvMS8yNCAwODoyMywgSmlhcGVuZyBDaG9uZyB3cm90ZToKPiBSZW1v
dmUgLm93bmVyIGZpZWxkIGlmIGNhbGxzIGFyZSB1c2VkIHdoaWNoIHNldCBpdCBhdXRvbWF0aWNh
bGx5Lgo+Cj4gLi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x2ZHMuYzoxMjEzOjMtODogTm8gbmVlZCB0
byBzZXQgLm93bmVyIGhlcmUuIFRoZSBjb3JlIHdpbGwgZG8gaXQuCj4KPiBSZXBvcnRlZC1ieTog
QWJhY2kgUm9ib3QgPGFiYWNpQGxpbnV4LmFsaWJhYmEuY29tPgo+IENsb3NlczogaHR0cHM6Ly9i
dWd6aWxsYS5vcGVuYW5vbGlzLmNuL3Nob3dfYnVnLmNnaT9pZD05NDU3Cj4gU2lnbmVkLW9mZi1i
eTogSmlhcGVuZyBDaG9uZyA8amlhcGVuZy5jaG9uZ0BsaW51eC5hbGliYWJhLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdmRzLmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x2ZHMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9zdG0vbHZkcy5jCj4gaW5kZXggMmZhMmM4MTc4NGU5Li4wNmYyZDdh
NTZjYzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdmRzLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x2ZHMuYwo+IEBAIC0xMjEwLDcgKzEyMTAsNiBAQCBzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciBsdmRzX3BsYXRmb3JtX2RyaXZlciA9IHsKPiAgCS5yZW1v
dmUgPSBsdmRzX3JlbW92ZSwKPiAgCS5kcml2ZXIgPSB7Cj4gIAkJLm5hbWUgPSAic3RtMzItZGlz
cGxheS1sdmRzIiwKPiAtCQkub3duZXIgPSBUSElTX01PRFVMRSwKPiAgCQkub2ZfbWF0Y2hfdGFi
bGUgPSBsdmRzX2R0X2lkcywKPiAgCX0sCj4gIH07CgoKSW5kZWVkLCBwbGF0Zm9ybV9kcml2ZXJf
cmVnaXN0ZXIoKSBvdmVycmlkZXMgdGhlIHZhbHVlIG9mIHRoZSBvd25lci4KCkFja2VkLWJ5OiBS
YXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgoKVGhh
bmtzLApSYXBoYcOrbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
