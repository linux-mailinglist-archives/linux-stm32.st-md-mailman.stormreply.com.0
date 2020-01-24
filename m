Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F355148571
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2020 13:55:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F37AC36B0C;
	Fri, 24 Jan 2020 12:55:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E56A6C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 12:55:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OCsTCw012368; Fri, 24 Jan 2020 13:55:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=HsT5XOh0k0Oip5e4q1QwfFV3XVw3YKpi81ECZxj8y6Q=;
 b=aqxG94s1vaUPEi7oDUwgOsYy3ksvsgGOaWryEalFEw+6Zgdpn66PA45Wk9YnaG06YC0O
 aBklNAsLyjk63X/6JayBKfFWnPoajK64SDY5dhXmGZ5SYJXnDEuGIwkrxaDGKW7Lqoxu
 5imLP6Ba6rd3VLxeGfE5eELqunxfwIp/TEo6qOT1oIRrHt8ADdzIe97YYl01EGefCZ68
 8tbO7EMpd0mYn/mc8D923WscSRyQv2abfuiZbik1+S7JawA9NuI1C8Ct9ZKLLcp5B7N1
 ApvOKGuEbrfLmwvcTx3KpafV0loMaKPLNCmf9fnU1DQyWTdhTUdaAVSVhzPPor7hJXBG Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrc5g12e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2020 13:55:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE8E310002A;
 Fri, 24 Jan 2020 13:55:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B75A72A847D;
 Fri, 24 Jan 2020 13:55:23 +0100 (CET)
Received: from lmecxl0923.lme.st.com (10.75.127.48) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Jan
 2020 13:55:23 +0100
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
References: <20200110134823.14882-1-ludovic.barre@st.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <6d859def-351e-abd7-0d5f-962ad935dff2@st.com>
Date: Fri, 24 Jan 2020 13:55:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20200110134823.14882-1-ludovic.barre@st.com>
Content-Language: fr
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_03:2020-01-24,
 2020-01-24 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

aGkgVWxmCgpKdXN0IGEgImdlbnRsZW1hbiBwaW5nIiBvbiB0aGlzIHNlcmllcwpodHRwczovL2xr
bWwub3JnL2xrbWwvMjAyMC8xLzEwLzM5MgoKUmVnYXJkcwpMdWRvCgpMZSAxLzEwLzIwIMOgIDI6
NDggUE0sIEx1ZG92aWMgQmFycmUgYSDDqWNyaXTCoDoKPiBUbyBzdXBwb3J0IHRoZSBzZHIxMDQg
bW9kZSwgc2RtbWMgdmFyaWFudCBuZWVkczoKPiAtSGFyZHdhcmUgZGVsYXkgYmxvY2sgc3VwcG9y
dCBmb3Igc2RtbWMgdmFyaWFudAo+ICAgd2l0aCB0dW5pbmcgcHJvY2VkdXJlCj4gLVZvbHRhZ2Ug
c3dpdGNoIGNhbGxiYWNrcwo+IC1zZG1tYyByZXZpc2lvbiAyLjAKPiAKPiBMdWRvdmljIEJhcnJl
ICg5KToKPiAgICBtbWM6IG1tY2k6IHNkbW1jOiByZXBsYWNlIHNnX2RtYV94eHggbWFjcm9zCj4g
ICAgbW1jOiBtbWNpOiBzZG1tYzogcmVuYW1lIHNkbW1jX3ByaXYgc3RydWN0IHRvIHNkbW1jX2lk
bWEKPiAgICBtbWM6IG1tY2k6IGFkZCBhIHJlZmVyZW5jZSBhdCBtbWNfaG9zdF9vcHMgaW4gbW1j
aSBzdHJ1Y3QKPiAgICBtbWM6IG1tY2k6IGFkZCBwcml2YXRlIHBvaW50ZXIgZm9yIHZhcmlhbnQK
PiAgICBkdC1iaW5kaW5nczogbW1jOiBtbWNpOiBhZGQgZGVsYXkgYmxvY2sgYmFzZSByZWdpc3Rl
ciBmb3Igc2RtbWMKPiAgICBtbWM6IG1tY2k6IHNkbW1jOiBhZGQgZXhlY3V0ZSB0dW5pbmcgd2l0
aCBkZWxheSBibG9jawo+ICAgIG1tYzogbW1jaTogYWRkIHZvbHRfc3dpdGNoIGNhbGxiYWNrcwo+
ICAgIG1tYzogbW1jaTogc2RtbWM6IGFkZCB2b2x0YWdlIHN3aXRjaCBmdW5jdGlvbnMKPiAgICBt
bWM6IG1tY2k6IGFkZCBzZG1tYyB2YXJpYW50IHJldmlzaW9uIDIuMAo+IAo+ICAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbW1jL21tY2kudHh0ICAgICAgICAgIHwgICAyICsKPiAgIGRyaXZlcnMv
bW1jL2hvc3QvbW1jaS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAzOSArKysrCj4gICBkcml2
ZXJzL21tYy9ob3N0L21tY2kuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKwo+ICAgZHJp
dmVycy9tbWMvaG9zdC9tbWNpX3N0bTMyX3NkbW1jLmMgICAgICAgICAgIHwgMTk5ICsrKysrKysr
KysrKysrKysrLQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyNDEgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
