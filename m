Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDB414A572
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2020 14:52:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D783C36B0B;
	Mon, 27 Jan 2020 13:52:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55516C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 13:52:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00RDqbnt009301; Mon, 27 Jan 2020 14:52:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=O6+dl2h2jXKNX+fyEpk/L/rLP8vjpdo1SJpvyPqDs8o=;
 b=X/iiA29CNOrjDNNUARjzkyJpC1jddl3AsBxKBhiHW+SWoftFjY8Gi4idGPQEkJG5183x
 krj9qylWMsE8A6gNOBlZqR6kDZrYQxmgYytDDj5hc2gFbkwdeZXnicL6BmcgfKUmlkS6
 48/Ua5wooQ/Z1K5UN5otgsaMIwZSvUyBejfnvh2CuMlSiLWsNZLH0Cue+aWsDbs2G+xe
 AqvY1Wu2uxfxnMhZ+I30pSzC53NG16S6S8pYprESRWtO5t6nIIDl1SFxMtvJIWY4ugk4
 qa1FE1Yehgv2YPYf1ZJdHV3obXWB/iF8jmS4pOEK97Bk4ybbfI35+Hs/KWOhFRNnm3vu Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrdek90x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 14:52:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 15257100038;
 Mon, 27 Jan 2020 14:52:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00C312B2F22;
 Mon, 27 Jan 2020 14:52:29 +0100 (CET)
Received: from lmecxl0923.lme.st.com (10.75.127.49) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jan
 2020 14:52:29 +0100
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <6d859def-351e-abd7-0d5f-962ad935dff2@st.com>
 <CAPDyKFo+4qTZbE=4Zgj3VN9BPYUHGskPSnYEJRo1TpARzg5zJg@mail.gmail.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <cdc08d8d-ffb1-0fe9-377d-a1e5faf089ce@st.com>
Date: Mon, 27 Jan 2020 14:52:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFo+4qTZbE=4Zgj3VN9BPYUHGskPSnYEJRo1TpARzg5zJg@mail.gmail.com>
Content-Language: fr
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_02:2020-01-24,
 2020-01-27 signatures=0
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/9] mmc: mmci: sdmmc: add sdr104 support
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

aGkgVWxmCgpMZSAxLzI0LzIwIMOgIDI6MTkgUE0sIFVsZiBIYW5zc29uIGEgw6ljcml0wqA6Cj4g
T24gRnJpLCAyNCBKYW4gMjAyMCBhdCAxMzo1NSwgTHVkb3ZpYyBCQVJSRSA8bHVkb3ZpYy5iYXJy
ZUBzdC5jb20+IHdyb3RlOgo+Pgo+PiBoaSBVbGYKPj4KPj4gSnVzdCBhICJnZW50bGVtYW4gcGlu
ZyIgb24gdGhpcyBzZXJpZXMKPj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvMS8xMC8zOTIK
PiAKPiBJIHdhcyBqdXN0IHJldmlld2luZyA6LSkgVGhhbmtzIGZvciBwaW5naW5nIQo+IAo+IE9u
ZSBvdmVyYWxsIGNvbW1lbnQgaXMgdGhhdCBJIHRoaW5rIHlvdSBjYW4gdHJ5IHRvIHdvcmsgYSBi
aXQgb24gdGhlCj4gY2hhbmdlbG9ncy4gSW4gc29tZSBjYXNlcyB5b3UgZGVzY3JpYmVkIHdoYXQg
dGhlIHBhdGNoIGRvZXMsIHdoaWNoIGlzCj4gZ29vZCwgYnV0IGl0IG1heSBsYWNrIGluZm9ybWF0
aW9uIGFib3V0ICp3aHkqIHRoZSBjaGFuZ2UgaXMgd2FudGVkLgoKT2ssIEkgdHJ5IHRvIGFkZCBh
IGNvbW1lbnQgdG8gKndoeSoKCj4gCj4gT3ZlcmFsbCwgdGhlIHNlcmllcyBsb29rcyBuaWNlLgo+
IAo+IEtpbmQgcmVnYXJkcwo+IFVmZmUKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
