Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 217C21910FC
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 14:38:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5EA1C36B0B;
	Tue, 24 Mar 2020 13:38:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36D69C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 13:38:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02ODbei2031397; Tue, 24 Mar 2020 14:37:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=eQiuzCr6Ulml5kiC7ssdMbg0RnTvDoNBvb95ESMzd7k=;
 b=pXhARpHcYUw1u0xicEqkY8jwk47it6F2IN97o5tr8n+DGklTajANxqS47Wvl0A8Md8xD
 ErkOxHIhcq6uOJVneWyRi4uChPbNhqpcXiPuH5kN25bXXCjpW5FCdzumeRHB8qWTjtT4
 8VPevQumwFWIs7euwQbd+asr3dnBeSB+k57oXhXLG8yabniuZI8HBGEncFMGE1jFYcak
 PjmIlGDjY9jM2Jr5HvmiFYG+VmBEon3YriqkueuWnuADN9WtChY1ksBjdN/OiA6Gtt+J
 iFxU4Ugzm8lX+WNy67KgN8YMdTWRhDUvjbUjfZMnHvTXlgp8nILeP63TWIIhPdnORZBo Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw995fsx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 14:37:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8ED5100039;
 Tue, 24 Mar 2020 14:37:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A47722AE6A4;
 Tue, 24 Mar 2020 14:37:48 +0100 (CET)
Received: from [10.211.5.183] (10.75.127.49) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 24 Mar
 2020 14:37:46 +0100
To: Marek Vasut <marex@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <tony@atomide.com>
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <466cf542-7575-d791-da81-da32c0919505@denx.de>
 <156b55b5-1b09-fa7e-e3bc-a0d5dea870db@st.com>
 <6827412d-1350-5daf-6882-41dc2a9307e5@denx.de>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <dba36415-824f-fab7-ad97-f9f5d804435d@st.com>
Date: Tue, 24 Mar 2020 14:37:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6827412d-1350-5daf-6882-41dc2a9307e5@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_05:2020-03-23,
 2020-03-24 signatures=0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [00/12] add STM32 FMC2 controller drivers
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

CgpPbiAzLzI0LzIwIDI6MjcgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDMvMjQvMjAgODoz
NiBBTSwgQ2hyaXN0b3BoZSBLZXJlbGxvIHdyb3RlOgo+Pgo+Pgo+PiBPbiAzLzI0LzIwIDE6Mzcg
QU0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gT24gMy8yMy8yMCAzOjU4IFBNLCBDaHJpc3RvcGhl
IEtlcmVsbG8gd3JvdGU6Cj4+Pj4gVGhlIEZNQzIgZnVuY3Rpb25hbCBibG9jayBtYWtlcyB0aGUg
aW50ZXJmYWNlIHdpdGg6IHN5bmNocm9ub3VzIGFuZAo+Pj4+IGFzeW5jaHJvbm91cyBzdGF0aWMg
ZGV2aWNlcyAoc3VjaCBhcyBQU05PUiwgUFNSQU0gb3Igb3RoZXIgbWVtb3J5LW1hcHBlZAo+Pj4+
IHBlcmlwaGVyYWxzKSBhbmQgTkFORCBmbGFzaCBtZW1vcmllcy4KPj4+PiBJdHMgbWFpbiBwdXJw
b3NlcyBhcmU6Cj4+Pj4gIMKgwqAgLSB0byB0cmFuc2xhdGUgQVhJIHRyYW5zYWN0aW9ucyBpbnRv
IHRoZSBhcHByb3ByaWF0ZSBleHRlcm5hbCBkZXZpY2UKPj4+PiAgwqDCoMKgwqAgcHJvdG9jb2wK
Pj4+PiAgwqDCoCAtIHRvIG1lZXQgdGhlIGFjY2VzcyB0aW1lIHJlcXVpcmVtZW50cyBvZiB0aGUg
ZXh0ZXJuYWwgZGV2aWNlcwo+Pj4+IEFsbCBleHRlcm5hbCBkZXZpY2VzIHNoYXJlIHRoZSBhZGRy
ZXNzZXMsIGRhdGEgYW5kIGNvbnRyb2wgc2lnbmFscwo+Pj4+IHdpdGggdGhlCj4+Pj4gY29udHJv
bGxlci4gRWFjaCBleHRlcm5hbCBkZXZpY2UgaXMgYWNjZXNzZWQgYnkgbWVhbnMgb2YgYSB1bmlx
dWUgQ2hpcAo+Pj4+IFNlbGVjdC4gVGhlIEZNQzIgcGVyZm9ybXMgb25seSBvbmUgYWNjZXNzIGF0
IGEgdGltZSB0byBhbiBleHRlcm5hbAo+Pj4+IGRldmljZS4KPj4+Pgo+Pj4+IENocmlzdG9waGUg
S2VyZWxsbyAoMTIpOgo+Pj4+ICDCoMKgIGR0LWJpbmRpbmdzOiBtZmQ6IHN0bTMyLWZtYzI6IGFk
ZCBTVE0zMiBGTUMyIGNvbnRyb2xsZXIgZG9jdW1lbnRhdGlvbgo+Pj4+ICDCoMKgIG1mZDogc3Rt
MzItZm1jMjogYWRkIFNUTTMyIEZNQzIgY29udHJvbGxlciBkcml2ZXIKPj4+PiAgwqDCoCBidXM6
IHN0bTMyLWZtYzItZWJpOiBhZGQgU1RNMzIgRk1DMiBFQkkgY29udHJvbGxlciBkcml2ZXIKPj4+
PiAgwqDCoCBtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IG1hbmFnZSBhbGwgZXJyb3JzIGNhc2Vz
IGF0IHByb2JlIHRpbWUKPj4+PiAgwqDCoCBtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IHJlbW92
ZSB1c2VsZXNzIGlubGluZSBjb21tZW50cwo+Pj4+ICDCoMKgIG10ZDogcmF3bmFuZDogc3RtMzJf
Zm1jMjogdXNlIEZNQzJfVElNRU9VVF9NUyBmb3IgdGltZW91dHMKPj4+PiAgwqDCoCBtdGQ6IHJh
d25hbmQ6IHN0bTMyX2ZtYzI6IGNsZWFudXAKPj4+PiAgwqDCoCBtdGQ6IHJhd25hbmQ6IHN0bTMy
X2ZtYzI6IHVzZSBGSUVMRF9QUkVQL0ZJRUxEX0dFVCBtYWNyb3MKPj4+PiAgwqDCoCBtdGQ6IHJh
d25hbmQ6IHN0bTMyX2ZtYzI6IG1vdmUgYWxsIHJlZ2lzdGVycwo+Pj4+ICDCoMKgIG10ZDogcmF3
bmFuZDogc3RtMzJfZm1jMjogdXNlIHJlZ21hcCBBUElzCj4+Pj4gIMKgwqAgbXRkOiByYXduYW5k
OiBzdG0zMl9mbWMyOiB1c2Ugc3RtMzJfZm1jMiBzdHJ1Y3R1cmUgaW4gbmZjIGNvbnRyb2xsZXIK
Pj4+PiAgwqDCoCBtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IGFkZCBuZXcgTVAxIGNvbXBhdGli
bGUgc3RyaW5nCj4+Pgo+Pj4gVGhpcyBkb2Vzbid0IGFwcGx5IHRvIGVpdGhlciBuZXh0IG9yIDUu
Ni1yYzcsIGRvIHlvdSBoYXZlIGEgdHJlZQo+Pj4gc29tZXdoZXJlIHdpdGggdGhvc2UgcGF0Y2hl
cyBhcHBsaWVkID8KPj4+Cj4+Cj4+IEhpIE1hcmVrLAo+IAo+IEhpLAo+IAo+PiBUaGlzIGltcGxl
bWVudGF0aW9uIGhhcyBiZWVuIGRvbmUgb24gbXRkL25hbmQvbmV4dCBicmFuY2guCj4gCj4gT2Yg
d2hpY2ggdHJlZSA/Cj4gCgpIaSBNYXJlaywKCkkgYW0gdXNpbmcgaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdAoKUmVnYXJkcywKQ2hy
aXN0b3BoZSBLZXJlbGxvLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
