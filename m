Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7109158016
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2020 17:48:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 919D5C36B0B;
	Mon, 10 Feb 2020 16:48:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43083C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 16:48:51 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01AGiPBI001193; Mon, 10 Feb 2020 17:48:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=oG/c7xToD+8agrdTSotNNCOqQBNlCbg+lnwHNTqbVFc=;
 b=0qfTzYTrCTPk3/aNPM2qSH7B0K0E+yfORdkCxhCP9lvNEllYv8KiWHHRe1K32EPAFcvM
 vsEPOot473Hj9MsQINnwnDCa2c3Me2pMp+rRL20Nub0NsuqYf/vfQ2fatcOgeAEL7RL/
 r9tjXQBOAtTdJ1eNmm1yquEooFSzgyN5jrA8pedRqFiqEzl4rWLo4Jm/PItL9+8cgL7+
 AMH/AFvqmZaNtjy6UKj3EZyiaCZk8RXmGd6YpcgOZIjyG+Wydzxztyv5LfX8WrGLgm4t
 yQTI5v8y0uGtYKpghV8IFWItHDo3eYdur0+PL8iTgGx1EmL9AZ8Rp3NqtTPJv5Sd5FmJ 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urguu92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 17:48:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB14610002A;
 Mon, 10 Feb 2020 17:48:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C140F2BAEE6;
 Mon, 10 Feb 2020 17:48:37 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 10 Feb
 2020 17:48:36 +0100
To: Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
References: <20200204141053.28072-1-amelie.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <2fad34db-660f-4e5e-a0b8-16ca05da3125@st.com>
Date: Mon, 10 Feb 2020 17:48:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204141053.28072-1-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_06:2020-02-10,
 2020-02-10 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: add resets property
 on all DMA nodes on stm32mp151
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

SGkgQW3DqWxpZQoKT24gMi80LzIwIDM6MTAgUE0sIEFtZWxpZSBEZWxhdW5heSB3cm90ZToKPiBy
ZXNldHMgcHJvcGVydHkgaXMgd2VsbC1tYW5hZ2VkIGluIERNQSBkcml2ZXJzLiBJbiBwcmV2aW91
cyBwcm9kdWN0cywKPiB0aGVyZSB3ZXJlIG5vIHJlc2V0IGxpbmVzLCB0aGF0J3Mgd2h5IHRoZXkg
YXJlIG1pc3NpbmcgaGVyZSBpbiBkbWExLCBkbWEyLAo+IGRtYW11eCBhbmQgbWRtYSBub2Rlcy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbWVsaWUgRGVsYXVuYXkgPGFtZWxpZS5kZWxhdW5heUBzdC5j
b20+CgpBcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpUaGFua3MKQWxleApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
