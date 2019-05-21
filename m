Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C7F24C90
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 12:22:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44F06C78001
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 10:22:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 660C5C78000
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 10:22:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4LAC0jl012556; Tue, 21 May 2019 12:22:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=uBeTxmf+H4C1rTAhfKgga+Zi5F1l6OoU1pJr8tM6Vkw=;
 b=rfNoC2Oq1Jrf+4wUp+9/dXRC+gN5yQWchGC1N7jqWp5ZLRTH2Uo3GAV3B9liim8ihTaI
 WNmwmu7hIW+SlHUBzC3ROixRqzRjJ/id/M44gp6wnXUmhnvFIEKcrZff/N8y0FhXY4Cq
 Tns0q54stxItIPQprzVsO/ftovA+HHZbHoR4ETl053LF9UbdAkAqZb6kzRNb9lhySzS3
 CpuOsSr0UTDPYJY5QWSsvXECNJ+pGtUHP8b0ZKDvAUj3hTVR0KnyC4NlAxzJ8LTV9TaL
 64LhytZtpsuddaooSGJAvmFWy9iXpU7e10n9D91LpwT3iqxFn4mHNtROPeMkqFR5XItE Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7tu0qsj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 21 May 2019 12:22:06 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2713334;
 Tue, 21 May 2019 10:22:06 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 05B862649;
 Tue, 21 May 2019 10:22:06 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 May
 2019 12:22:05 +0200
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier
 <fabrice.gasnier@st.com>
References: <1553863438-6720-1-git-send-email-yannick.fertre@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <5864f09f-4cd3-cadc-2210-4946142e582d@st.com>
Date: Tue, 21 May 2019 12:22:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1553863438-6720-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_01:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH v1 0/2] enable display on stm32mp157c-dk1
	board
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

SGkgWWFubmljawoKT24gMy8yOS8xOSAxOjQzIFBNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6Cj4g
RW5hYmxlIGRpc3BsYXkgb24gc3RtMzJtcDE1N2MtZGsxIGJvYXJkLiBJMmMgbm9kZSBtdXN0IGJl
IGNyZWF0ZWQgZmlyc3QuCj4gCj4gWWFubmljayBGZXJ0csOpICgyKToKPiAgICBBUk06IGR0czog
c3RtMzI6IEFkZCBJMkMgMSBhbmQgNCBjb25maWcgZm9yIHN0bTMybXAxNTdhLWRrMQo+ICAgIEFS
TTogZHRzOiBzdG0zMjogZW5hYmxlIGRpc3BsYXkgb24gc3RtMzJtcDE1N2MtZGsxIGJvYXJkCj4g
Cj4gICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kazEuZHRzIHwgNzggKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA3OCBpbnNlcnRp
b25zKCspCj4gCj4gLS0KPiAyLjcuNAo+IAoKU2VyaWVzIGFwcGxpZWQgb24gc3RtMzItbmV4dC4K
ClJlZ2FyZHMKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
