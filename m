Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4CC716200
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 15:33:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F85FC6A613;
	Tue, 30 May 2023 13:33:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3935C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 13:33:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34UC17fS018195; Tue, 30 May 2023 15:32:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/vLDIut8DJG9/eudnX+eCqcgRJdHJKKJcvNGCV6EgSY=;
 b=IF0c4aWTvw6kQpygbI7aSAGl8lG61Uovd2rE+eGYHgBEZ+23cf9L7Evwmp3T+Dt725NO
 GuxtfWC10wi93QsbClbeL/M2w7SaYvHlf4ca9FOTI6VS0zA17pXAaIyJRXG1VmxVgzxr
 2c4ECcQ2qEJ3XeqksAgYT+xjSvu57FRLKnZPJOPi80rFJlJ1/EZ9dRDZfVIHLFyfpFaK
 iQkG4n7rYBcKgO7SoQNdtLmKDxDaCX14s+TbEY7LmqfmOwXnFV28Wn3n8L8/4l/3ALb1
 BVvARjsvG+3irUzOC0k7/4NcQNZWPUZoPrY1P7LFVTzDRIzz8aQslhNglEd3i4WwYr6F kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qwdm5j20a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 15:32:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E713100038;
 Tue, 30 May 2023 15:32:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DAECD228A2D;
 Tue, 30 May 2023 15:32:56 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 15:32:55 +0200
Message-ID: <78a7cbcd-2fe5-0533-857c-e50f89aa6dd5@foss.st.com>
Date: Tue, 30 May 2023 15:32:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <CACRpkdboHeg-=thHvZrQXcx_HnecwmuBJskJTPjxFOB9z9R0gw@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CACRpkdboHeg-=thHvZrQXcx_HnecwmuBJskJTPjxFOB9z9R0gw@mail.gmail.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_10,2023-05-30_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/11] Add STM32MP25 support
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

SGkgTGludXMKCk9uIDUvMzAvMjMgMTQ6MzksIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gT24gTW9u
LCBNYXkgMjksIDIwMjMgYXQgNjoyMOKAr1BNIEFsZXhhbmRyZSBUb3JndWUKPiA8YWxleGFuZHJl
LnRvcmd1ZUBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4gCj4+IEFsZXhhbmRyZSBUb3JndWUgKDEwKToK
Pj4gICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IHN0bTMyOiBzdXBwb3J0IGZvciBzdG0zMm1wMjU3
IGFuZCBhZGRpdGlvbmFsCj4+ICAgICAgcGFja2FnZXMKPj4gICAgcGluY3RybDogc3RtMzI6IGFk
ZCBzdG0zMm1wMjU3IHBpbmN0cmwgc3VwcG9ydAo+IAo+IENhbiBwYXRjaCAxICYgMiBiZSBhcHBs
aWVkIHRvIHRoZSBwaW5jdHJsIHRyZWUgc2VwYXJhdGVseT8KClllcyBwbGVhc2UuIEknbGwgdGFr
ZSBvdGhlcnMgZGlyZWN0bHkgaW4gbXkgcGxhdGZvcm0gdHJlZS4KClRoYW5rcwpBbGV4Cgo+IFlv
dXJzLAo+IExpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
