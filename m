Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 345685B969E
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Sep 2022 10:48:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3087C64107;
	Thu, 15 Sep 2022 08:48:50 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24329C0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 06:54:41 +0000 (UTC)
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MSnsS0r30zmVNN;
 Thu, 15 Sep 2022 14:50:52 +0800 (CST)
Received: from dggpeml500010.china.huawei.com (7.185.36.155) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 14:54:38 +0800
Received: from [10.67.111.232] (10.67.111.232) by
 dggpeml500010.china.huawei.com (7.185.36.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 14:54:38 +0800
Message-ID: <ae138b14-1479-3988-06f9-b69e4c174a90@huawei.com>
Date: Thu, 15 Sep 2022 14:54:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: Wolfram Sang <wsa@kernel.org>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <akpm@linux-foundation.org>, <wim@iguana.be>, 
 <linux-rtc@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220915013304.213917-1-linyujun809@huawei.com>
 <YyLGsybCM5a5N1Mt@shikoro>
From: "linyujun (C)" <linyujun809@huawei.com>
In-Reply-To: <YyLGsybCM5a5N1Mt@shikoro>
X-Originating-IP: [10.67.111.232]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500010.china.huawei.com (7.185.36.155)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 15 Sep 2022 08:48:49 +0000
Subject: Re: [Linux-stm32] [PATCH -next v2] rtc: stmp3xxx: Add failure
 handling for stmp3xxx_wdt_register()
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

T0ssIEknbGwgcmVtb3ZlIHRoZSBzZWNvbmQgcGFydCBvZiB0aGUgY29tbWl0IG1lc3NhZ2UgYW5k
IHNlbmQgYSB2MyBwYXRjaC4KCuWcqCAyMDIyLzkvMTUgMTQ6MzEsIFdvbGZyYW0gU2FuZyDlhpnp
gZM6Cj4gT24gVGh1LCBTZXAgMTUsIDIwMjIgYXQgMDk6MzM6MDRBTSArMDgwMCwgTGluIFl1anVu
IHdyb3RlOgo+PiBVc2UgcGxhdGZvcm1fZGV2aWNlX3B1dCgpIHRvIGZyZWUgcGxhdGZvcm0gZGV2
aWNlIGJlZm9yZSBwcmludAo+PiBlcnJvciBtZXNzYWdlIHdoZW4gcGxhdGZvcm1fZGV2aWNlX2Fk
ZCgpIGZhaWxzIHRvIHJ1bi4gQWRkIGRldl9lcnIoKQo+PiB0byByZXBvcnQgZXJyb3IgaW4gY2Fz
ZSBvZiBhbGxvYyBtZW1vcnkgdG8gd2R0X3BkZXYgZmFpbC4KPiBUaGUgc2Vjb25kIHBhcnQgb2Yg
dGhlIGNvbW1pdCBtZXNzYWdlIGlzIG5vdyBvYnNvbGV0ZS4KPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
