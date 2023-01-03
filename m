Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 616F565BB83
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Jan 2023 09:00:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 070B8C65E45;
	Tue,  3 Jan 2023 08:00:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9ACEC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 08:00:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3033rgmb028440; Tue, 3 Jan 2023 08:59:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PNcgxNLrMP0ObiUeiUV2qBm0Q2P10GbILBPXF0O27jY=;
 b=xxa2ch6McfHSRjGdCal5Jq9fg60bsM9BzY+X1vRnUQGjXLLvI+WgOC5xcSAh68cICj0W
 D72QMnHvDxMOrdfP9kSQDeMtd07yUSJTXnEuDQ+pJnelFZKWyEWRX2mI0LolVEuLsYgJ
 kfOg+YTSokgXYbPXkq73wdDFha4RljTplvQ/GBcDQshNzgumh6+oHFblLSSQU501YWwr
 lmL2NPFr0zYsYzwPw/RQgmNGqVdcbhaCz4wkpvg/vD7wY29LhXJJ7X+DWHjtpYc4NDg5
 +XygFdf93FzpVNJ8I6eGGbcgV4N0R2NGwpPqDa1kKYf2d7hWgNoJkWGpgsomjMFM25nM OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtb3e3mf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 08:59:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFF4410002A;
 Tue,  3 Jan 2023 08:59:54 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB08A2132D2;
 Tue,  3 Jan 2023 08:59:54 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 08:59:53 +0100
Message-ID: <e16e9030-931a-61be-d034-9a1206f0f906@foss.st.com>
Date: Tue, 3 Jan 2023 08:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 <devicetree@vger.kernel.org>
References: <20221129023401.278780-1-bero@baylibre.com>
 <20221129023401.278780-8-bero@baylibre.com> <7hlenm56lb.fsf@baylibre.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <7hlenm56lb.fsf@baylibre.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_14,2022-12-30_01,2022-06-22_01
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 7/7] ARM: dts: stm32: Remove the
 pins-are-numbered property
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

SGkgS2V2aW4KCk9uIDEyLzUvMjIgMTQ6MjEsIEtldmluIEhpbG1hbiB3cm90ZToKPiBBbGV4YW5k
cmUsCj4gCj4gQmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+IHdyaXRl
czoKPiAKPj4gUmVtb3ZlIHRoZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tIFNUTTMy
IERldmljZVRyZWVzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIg
PGJlcm9AYmF5bGlicmUuY29tPgo+PiBSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0
dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiAKPiBOb3cgdGhhdCB0aGUgZHJpdmVyICYgYmluZGluZyBx
cmUgcXVldWVkLCBJJ20gYXNzdW1pbmcgeW91J2xsIHF1ZXVlIHRoaXMKPiBvbmUgdmlhIHRoZSBz
dG0zMiB0cmVlPwo+IAoKWWVzIEknbGwgdGFrZSBpdC4KCmNoZWVycwpBbGV4CgoKPiBUaGFua3Ms
Cj4gCj4gS2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
