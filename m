Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B5F5B969C
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Sep 2022 10:48:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3125C640F5;
	Thu, 15 Sep 2022 08:48:50 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8440C0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 01:29:11 +0000 (UTC)
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MSfg75vb4znVDw;
 Thu, 15 Sep 2022 09:26:27 +0800 (CST)
Received: from dggpeml500010.china.huawei.com (7.185.36.155) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 09:29:09 +0800
Received: from [10.67.111.232] (10.67.111.232) by
 dggpeml500010.china.huawei.com (7.185.36.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 09:29:09 +0800
Message-ID: <739724e5-6b5d-0f79-72a8-87267dd85723@huawei.com>
Date: Thu, 15 Sep 2022 09:29:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: Wolfram Sang <wsa@kernel.org>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <akpm@linux-foundation.org>, <wim@iguana.be>, 
 <linux-rtc@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220914032159.94812-1-linyujun809@huawei.com>
 <YyJdf1AswoJNUcu0@shikoro>
From: "linyujun (C)" <linyujun809@huawei.com>
In-Reply-To: <YyJdf1AswoJNUcu0@shikoro>
X-Originating-IP: [10.67.111.232]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500010.china.huawei.com (7.185.36.155)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 15 Sep 2022 08:48:49 +0000
Subject: Re: [Linux-stm32] [PATCH -next] rtc: stmp3xxx: Add failure handling
 for stmp3xxx_wdt_register()
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

VGhhbmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24sIEkgd2lsbCBzZW5kIG91dCB0aGUgdjIgdmVy
c2lvbiBhcyBzb29uIGFzIApwb3NzaWJsZS4KCuWcqCAyMDIyLzkvMTUgNzowMiwgV29sZnJhbSBT
YW5nIOWGmemBkzoKPiBUaGlzIGlzIGNvcnJlY3QsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
