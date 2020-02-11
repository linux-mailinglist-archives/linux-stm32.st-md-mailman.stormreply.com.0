Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F49115922D
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2020 15:47:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B74FC36B0B;
	Tue, 11 Feb 2020 14:47:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 895ACC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 14:47:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01BEhxtu031462; Tue, 11 Feb 2020 15:47:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=4odbdGyV5/+IAGjp9TQdg9pxlhPR5wtUbp4gIY0SBm8=;
 b=1MOS4e4ncw/kDNfQr8/cX7QpgjwFPMEHqD2n3akoDcWaw3SXXs3MZlNcqXzns/nILAQ0
 AYy55VbzeWSDdblBzLcEYdCK4g+MV2mz9OkgqpDZvNMBjsKn+My9En+6sPGXgWrHu2HX
 ksFM9bc3uNFzNl1b5zGh3gk3h4HtRsaI3tcmBuzZjC2uDwMFnVt85Fx4Tmd2/nxTT2gA
 6MnF8IUPsr2umgdYLnc0uzdxu2rwNR3LY/Jyc/uVsz3NXbl4hD1ji9uThAIF45emp3Le
 YiK1M1ljfRs+ohhH4uYRuu/UT0XVfA2pknjw0LAAbPdIaKbjX9TDtqVd/B/f4MQqcKbB IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvddt9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 15:47:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2BDBC10002A;
 Tue, 11 Feb 2020 15:47:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AC802BD409;
 Tue, 11 Feb 2020 15:47:27 +0100 (CET)
Received: from lmecxl0923.lme.st.com (10.75.127.48) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Feb
 2020 15:47:26 +0100
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
References: <20200128090636.13689-1-ludovic.barre@st.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <0d4a3df8-fd1a-4839-116c-149f9e478f42@st.com>
Date: Tue, 11 Feb 2020 15:47:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20200128090636.13689-1-ludovic.barre@st.com>
Content-Language: fr
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_04:2020-02-10,
 2020-02-11 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 0/9] mmc: mmci: sdmmc: add sdr104
	support
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

aGkgVWxmCgpKdXN0IGEgImdlbnRsZW1hbiBwaW5nIiBvbiB0aGlzIHNlcmllcwpodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbW1jL2xpc3QvP3Nlcmllcz0yMzQwMTEK
ClJlZ2FyZHMKTHVkbwoKTGUgMS8yOC8yMCDDoCAxMDowNiBBTSwgTHVkb3ZpYyBCYXJyZSBhIMOp
Y3JpdMKgOgo+IFRvIHN1cHBvcnQgdGhlIHNkcjEwNCBtb2RlLCBzZG1tYyB2YXJpYW50IG5lZWRz
Ogo+IC1IYXJkd2FyZSBkZWxheSBibG9jayBzdXBwb3J0IGZvciBzZG1tYyB2YXJpYW50Cj4gICB3
aXRoIHR1bmluZyBwcm9jZWR1cmUKPiAtVm9sdGFnZSBzd2l0Y2ggY2FsbGJhY2tzCj4gLXNkbW1j
IHJldmlzaW9uIDIuMAo+IAo+IFYyOgo+IC1yZWdyb3VwIGhvc3QtPm1tY19vcHMgJiBtbWMtPm9w
cyBhc3NpZ25tZW50Cj4gLWFkZCB0aW1lb3V0IGRlZmluZQo+IC1yZW5hbWUgcHJlcF92b2x0X3N3
aXRjaCB0byBwcmVfc2lnX3ZvbHRfc3dpdGNoCj4gLXJlbmFtZSB2b2x0X3N3aXRjaCB0byBwb3N0
X3NpZ192b2x0X3N3aXRjaAo+IC1hZGQgJ3doeScgY29tbWVudCBmb3IgIm1tYzogbW1jaTogYWRk
IHZvbHRfc3dpdGNoIGNhbGxiYWNrcyIKPiAKPiBMdWRvdmljIEJhcnJlICg5KToKPiAgICBtbWM6
IG1tY2k6IHNkbW1jOiByZXBsYWNlIHNnX2RtYV94eHggbWFjcm9zCj4gICAgbW1jOiBtbWNpOiBz
ZG1tYzogcmVuYW1lIHNkbW1jX3ByaXYgc3RydWN0IHRvIHNkbW1jX2lkbWEKPiAgICBtbWM6IG1t
Y2k6IGFkZCBhIHJlZmVyZW5jZSBhdCBtbWNfaG9zdF9vcHMgaW4gbW1jaSBzdHJ1Y3QKPiAgICBt
bWM6IG1tY2k6IGFkZCBwcml2YXRlIHBvaW50ZXIgZm9yIHZhcmlhbnQKPiAgICBkdC1iaW5kaW5n
czogbW1jOiBtbWNpOiBhZGQgZGVsYXkgYmxvY2sgYmFzZSByZWdpc3RlciBmb3Igc2RtbWMKPiAg
ICBtbWM6IG1tY2k6IHNkbW1jOiBhZGQgZXhlY3V0ZSB0dW5pbmcgd2l0aCBkZWxheSBibG9jawo+
ICAgIG1tYzogbW1jaTogYWRkIHZvbHRfc3dpdGNoIGNhbGxiYWNrcwo+ICAgIG1tYzogbW1jaTog
c2RtbWM6IGFkZCB2b2x0YWdlIHN3aXRjaCBmdW5jdGlvbnMKPiAgICBtbWM6IG1tY2k6IGFkZCBz
ZG1tYyB2YXJpYW50IHJldmlzaW9uIDIuMAo+IAo+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
bW1jL21tY2kudHh0ICAgICAgICAgIHwgICAyICsKPiAgIGRyaXZlcnMvbW1jL2hvc3QvbW1jaS5j
ICAgICAgICAgICAgICAgICAgICAgICB8ICA0MiArKystCj4gICBkcml2ZXJzL21tYy9ob3N0L21t
Y2kuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKwo+ICAgZHJpdmVycy9tbWMvaG9zdC9t
bWNpX3N0bTMyX3NkbW1jLmMgICAgICAgICAgIHwgMjA0ICsrKysrKysrKysrKysrKysrLQo+ICAg
NCBmaWxlcyBjaGFuZ2VkLCAyNDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
