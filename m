Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0EFCBC9E
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 16:05:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DC9CC36B0B;
	Fri,  4 Oct 2019 14:05:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD1C9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 14:05:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x94DphSn032172; Fri, 4 Oct 2019 16:05:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=+37tYreV7tZjGivq3lYs5eVtMuF7z9GI89L7hwCaTGg=;
 b=iNoBCSQJEHje/AKpfU6DnVH4WWKPpMLuUGe+FMd39vrZpwjkqwwkNejC4Oid9Qrtxjaq
 yu0omMn5fEoKMTDtmOupHUciiVQj8JjZPFGMlhv69BkyTrYKg1hwnwjeMTPche3a3TBp
 7+LLr7BnPXhX3L9hH4yUTndhi/mU/IfFq++ooPvI2rzxrwPmV2ryj1pn2qeNA5jN4+fT
 OKD0wVZqEuRGOoyS0HlJcqlrj+ZwctTYFwLSRX5/TukG97SBhhdQr4Z5sKYkVAVgTnus
 CUWbaZe7XOk80jsqqDzKAs974owrhRJvITHj86GuaePbnwrEMtaFLHC+Y9lFBV2SH+Qb 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w9wbd3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2019 16:05:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 50B7E10002A;
 Fri,  4 Oct 2019 16:05:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B7C32C6CED;
 Fri,  4 Oct 2019 16:05:15 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 4 Oct
 2019 16:05:14 +0200
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier
 <fabrice.gasnier@st.com>
References: <1570195022-23327-1-git-send-email-yannick.fertre@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c834748b-17f3-39ca-041b-1be86ad61d76@st.com>
Date: Fri, 4 Oct 2019 16:05:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570195022-23327-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-04_07:2019-10-03,2019-10-04 signatures=0
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add focaltech
 touchscreen on stm32mp157c-dk2 board
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

SGkgeWFubmljawoKT24gMTAvNC8xOSAzOjE3IFBNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6Cj4g
RW5hYmxlIGZvY2FsdGVjaCBmdDYyMzYgdG91Y2hzY3JlZW4gb24gU1RNMzJNUDE1N0MtREsyIGJv
YXJkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVA
c3QuY29tPgo+IC0tLQo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cyB8
IDEzICsrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHMgYi9h
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzCj4gaW5kZXggMjBlYTYwMS4uZDQ0
YTdjNiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRz
Cj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cwo+IEBAIC02MSw2
ICs2MSwxOSBAQAo+ICAgCX07Cj4gICB9Owo+ICAgCj4gKyZpMmMxIHsKPiArCXRvdWNoc2NyZWVu
QDM4IHsKPiArCQljb21wYXRpYmxlID0gImZvY2FsdGVjaCxmdDYyMzYiOwo+ICsJCXJlZyA9IDww
eDM4PjsKPiArCQlpbnRlcnJ1cHRzID0gPDIgMj47Cj4gKwkJaW50ZXJydXB0LXBhcmVudCA9IDwm
Z3Bpb2Y+Owo+ICsJCWludGVycnVwdC1jb250cm9sbGVyOwo+ICsJCXRvdWNoc2NyZWVuLXNpemUt
eCA9IDw0ODA+Owo+ICsJCXRvdWNoc2NyZWVuLXNpemUteSA9IDw4MDA+Owo+ICsJCXN0YXR1cyA9
ICJva2F5IjsKPiArCX07Cj4gK307Cj4gKwo+ICAgJmx0ZGMgewo+ICAgCXN0YXR1cyA9ICJva2F5
IjsKPiAgIAo+IAoKRm9yIHRoZSBuZXh0IHRpbWUsIHBsZWFzZSBkb24ndCBmb3JnZXQgdG8gYWRk
ICJQQVRDSC12MiIgYXMgaXQgaXMgYSAKc2Vjb25kIHZlcnNpb24gb2YgdGhpcyBwYXRjaC4KCkFw
cGxpZWQgb24gc3RtMzItbmV4dC4KClRoYW5rcy4KQWxleApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
