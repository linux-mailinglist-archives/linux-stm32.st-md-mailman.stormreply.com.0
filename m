Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E15CF249EC
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 10:13:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D158C725A9
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 08:13:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F84EC725A8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 08:13:46 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4L875aA001663; Tue, 21 May 2019 10:13:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=wbqGG8HuDpV3tZJFOhJKGCU27qgfbSdFuxdaOzI8vDQ=;
 b=Qa0hmHH3fbgr1Qh1hO3qmsjBmLMxNUiuF2akEV2t1FZ+ymEY/RoQG2Sd6wOw2yMHsUwE
 tyUWx/GFZbFk77lanlGc9DENBAFoUjcs9Yc4h2gX9v5Rxe+YPRAOQIUmt8B/XQY1dauJ
 Az4cSInjeewi4fCnbtuVbUzVXEgGUfndzsFzpVKiuAtPeorw70Ol3Z5gtj9OQM4pdWVN
 QzL1PNjj2Xbleil4j/QqkJJu9osO1xzjHGLC/L6qlSoWtoQNe2alBIi38qOJvBvpA37z
 p3QqGZ1G3umnhIDWZR18W1Pz8zoqrzMwVrFkWajybeg0q9cySz2ZumtQ4C+BAQQoNwUm OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7h0r4ck-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 21 May 2019 10:13:37 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0040A34;
 Tue, 21 May 2019 08:13:36 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D20E17FB;
 Tue, 21 May 2019 08:13:36 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 May
 2019 10:13:34 +0200
To: Amelie Delaunay <amelie.delaunay@st.com>, Lee Jones <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <0a9bf716-addc-9342-09fe-06ff048ff7d7@st.com>
Date: Tue, 21 May 2019 10:13:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_01:, , signatures=0
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 0/9] Introduce STMFX I2C Multi-Function
	eXpander
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

SGkgQW3DqWxpZSwKCk9uIDUvOS8xOSAxMDo1OCBBTSwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgo+
IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgU1RNaWNyb2VsZWN0cm9uaWNzIE11bHRpLUZ1
bmN0aW9uIGVYcGFuZGVyCj4gKFNUTUZYKSwgdXNlZCBvbiBzb21lIFNUTTMyIGRpc2NvdmVyeSBh
bmQgZXZhbHVhdGlvbiBib2FyZHMuCj4gCj4gU1RNRlggaXMgYW4gU1RNMzJMMTUyIHNsYXZlIGNv
bnRyb2xsZXIgd2hvc2UgZmlybXdhcmUgZW1iZWRzIHRoZSBmb2xsb3dpbmcKPiBmZWF0dXJlczoK
PiAtIEkvTyBleHBhbmRlciAoMTYgR1BJT3MgKyA4IGV4dHJhIGlmIHRoZSBvdGhlciBmZWF0dXJl
cyBhcmUgbm90IGVuYWJsZWQpLAo+IC0gcmVzaXN0aXZlIHRvdWNoc2NyZWVuIGNvbnRyb2xsZXIs
Cj4gLSBJREQgbWVhc3VyZW1lbnQuCj4gCj4gSTJDIHN0dWZmIGFuZCBjaGlwIGluaXRpYWxpemF0
aW9uIGlzIGJhc2VkIG9uIGFuIE1GRCBwYXJlbnQgZHJpdmVyLCB3aGljaAo+IHJlZ2lzdGVycyBT
VE1GWCBmZWF0dXJlcyBNRkQgY2hpbGRyZW4uCgouLi4KCj4gQW1lbGllIERlbGF1bmF5ICg5KToK
PiAgICBkdC1iaW5kaW5nczogbWZkOiBBZGQgU1QgTXVsdGktRnVuY3Rpb24gZVhwYW5kZXIgKFNU
TUZYKSBjb3JlIGJpbmRpbmdzCj4gICAgbWZkOiBBZGQgU1QgTXVsdGktRnVuY3Rpb24gZVhwYW5k
ZXIgKFNUTUZYKSBjb3JlIGRyaXZlcgo+ICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBkb2N1bWVu
dCB0aGUgU1RNRlggcGluY3RybCBiaW5kaW5ncwo+ICAgIHBpbmN0cmw6IEFkZCBTVE1GWCBHUElP
IGV4cGFuZGVyIFBpbmN0cmwvR1BJTyBkcml2ZXIKPiAgICBBUk06IGR0czogc3RtMzI6IGFkZCBT
VE1GWCBzdXBwb3J0IG9uIHN0bTMyNzQ2Zy1ldmFsCj4gICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQg
am95c3RpY2sgc3VwcG9ydCBvbiBzdG0zMjc0NmctZXZhbAo+ICAgIEFSTTogZHRzOiBzdG0zMjog
YWRkIG9yYW5nZSBhbmQgYmx1ZSBsZWRzIG9uIHN0bTMyNzQ2Zy1ldmFsCj4gICAgQVJNOiBkdHM6
IHN0bTMyOiBhZGQgU1RNRlggc3VwcG9ydCBvbiBzdG0zMm1wMTU3Yy1ldjEKPiAgICBBUk06IGR0
czogc3RtMzI6IGFkZCBqb3lzdGljayBzdXBwb3J0IG9uIHN0bTMybXAxNTdjLWV2MQoKRGV2aWNl
IHRyZWUgcGF0Y2hlcyAoNSB0byA5KSBhcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpUaGFua3MKQWxl
eAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
