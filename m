Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5855A22C4
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Aug 2022 10:17:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22888C640F6;
	Fri, 26 Aug 2022 08:17:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48FB3C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Aug 2022 08:17:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27Q1rmbk002258;
 Fri, 26 Aug 2022 10:17:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xTqTKT5qg+4P3M9I13cayvKlazY2ygk4YynAz0m1NCU=;
 b=Ah15l5VwbiNPYqz3AMkvaSMXDdvZYD4aHMSwmc1fn4/2m1G7aRMDpIC/RESzpY6k8F1v
 Q40NrJn+Bct0ZUiGhJOxnPbuPMQxq85v0x94QqXcIzpCxBQVeRAndzCh4PYI4TtFIcQc
 DneYrYrcP/NfSs+ISX721qWO8ybj7URi79s62OYIFQ4XwIsVePSdyo3q932Fpmjxbb6b
 y33ijFQgm+YDkucd7PUzQuvUVDeik7nObPLbnBncbIjLLIO/NSAVOLY4Y+UeSnGsMZfg
 6Kf8ZCAzBEyjCyT7VgDNGrVPMD8PLMFLYNp/M5ZJ+BacurIDfiG9qBE/TEcY3RKcOgEx Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j5h4wmuqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Aug 2022 10:17:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB4FD10002A;
 Fri, 26 Aug 2022 10:17:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5B14215157;
 Fri, 26 Aug 2022 10:17:26 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 26 Aug
 2022 10:17:26 +0200
Message-ID: <b181598a-a9db-45f0-5123-0e757fbeed29@foss.st.com>
Date: Fri, 26 Aug 2022 10:17:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>
References: <20220519162838.695404-1-u.kleine-koenig@pengutronix.de>
 <20220519162838.695404-2-u.kleine-koenig@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220519162838.695404-2-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_03,2022-08-25_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/2] ARM: dts: stm32mp15x: Add timer
	interrupts
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

SGkgVXdlCgpPbiA1LzE5LzIyIDE4OjI4LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGUg
dGltZXIgdW5pdHMgaW4gdGhlIHN0bTMybXAxNXggQ1BVcyBoYXZlIGludGVycnVwdHMsIGRlcGVu
ZGluZyBvbiB0aGUKPiB0aW1lciBmbGF2b3VyIGVpdGhlciBvbmUgImdsb2JhbCIgb3IgZm91ciBk
ZWRpY2F0ZWQgb25lcy4gQWRkIHRoZSBpcnFzCj4gdG8gdGhlIHRpbWVyIHVuaXRzIG9uIHN0bTMy
bXAxNXguCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAx
NTEuZHRzaSB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4gCgpTb3JyeSBmb3IgdGhlIGRlbGF5cy4KCkFwcGxp
ZWQgb24gc3RtMzItbmV4dC4KClRoYW5rcy4KQWxleApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
