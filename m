Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A87BAF6E81
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 11:23:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 045D9C3F943;
	Thu,  3 Jul 2025 09:23:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 081F9C3F93E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 09:23:49 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5637OLbU018922;
 Thu, 3 Jul 2025 11:23:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mi/np96huTpzemlSEPT47ivnNTAhi9p9kP4BY7V5Dek=; b=plTe8ttnU3beSTHr
 Oq7OU+9mH5o57+1TikvjDuCxgr+8f1FVkcIWT777l+P3VM4cp8lHkPxMN97FoDWN
 mumYZ3vLNIuCYKoKyPLLg76qriKwwVLUwkI+A46tjtUp5O59pbaHeI8N57ElxEpX
 8o9rkdDBtRsz+hx+jfaloob+i+rhesP5mWMdeIjjiiO9ZbOSBx3E3MuZaSeViRy2
 XD7kze4NlfLXeahkYLkR/+Qp4ZTN3lkkLIAwxgMdgfsXEMKqKx2n1vuFppXsIOaE
 rlkBHxVlTYS5w7dlwoSLudMlie04jdTbTfTfScCtCg3DGxNw6mZoEsdhE3I569ge
 vwrbuw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tmf6ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jul 2025 11:23:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 27B8440059;
 Thu,  3 Jul 2025 11:22:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92F68AF65C7;
 Thu,  3 Jul 2025 11:21:01 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Jul
 2025 11:21:00 +0200
Message-ID: <313d1cc7-eff9-47c7-940f-4ef9e92bccd0@foss.st.com>
Date: Thu, 3 Jul 2025 11:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andi Shyti <andi.shyti@kernel.org>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
 <4lqsyuabfwnclt2pbxmgqz5zpd6zm5y6q5djiwopuq5eelz7ui@fgep3x24ur3e>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <4lqsyuabfwnclt2pbxmgqz5zpd6zm5y6q5djiwopuq5eelz7ui@fgep3x24ur3e>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_02,2025-07-02_04,2025-03-28_01
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Pierre-Yves
 MORDRET <pierre-yves.mordret@st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] i2c: stm32f7: support
	i2c_*_dma_safe_msg_buf APIs
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

SGkgQW5keSwKCk9uIDcvMi8yNSAxOToxNSwgQW5kaSBTaHl0aSB3cm90ZToKPiBIaSBDbGVtZW50
LAo+IAo+IE9uIE1vbiwgSnVuIDMwLCAyMDI1IGF0IDAyOjU1OjE1UE0gKzAyMDAsIENsw6ltZW50
IExlIEdvZmZpYyB3cm90ZToKPj4gVXNlIHRoZSBpMmMtY29yZS1iYXNlIEFQSXMgdG8gYWxsb2Nh
dGUgYSBETUEgc2FmZSBidWZmZXIgd2hlbiBuZWVkZWQuCj4gCj4gc2FtZSBoZXJlLCBJIGRvbid0
IHVuZGVyc3RhbmQgYW55dGhpbmcuLi4geW91IGNvdWxkIGhhdmUgd3JpdHRlbgo+ICJkbyBzb21l
IGNvZGluZyIgYW5kIGl0IHdvdWxkIGhhdmUgYmVlbiB0aGUgc2FtZSA6LSkKCk9rIEknbGwgdHJ5
IHRvIGJlIG1vcmUgcHJlY2lzZSBoZXJlIGFsc28uCgpCZXN0IHJlZ2FyZHMsCkNsw6ltZW50Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
