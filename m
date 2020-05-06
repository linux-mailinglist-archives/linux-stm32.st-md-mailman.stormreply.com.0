Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0A81C7369
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 16:55:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6F94C32EB3;
	Wed,  6 May 2020 14:55:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55059C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 14:55:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 046Epgj0002819; Wed, 6 May 2020 16:55:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=IlqKhhUb3TjAiX8MxAisX7NF8L8uHtYK3ys5TzgEwW0=;
 b=dD81mSEGQ3ZA8op5mEIDlj/kRvv3yTdDwod9KIw4AM+I413RbPo/gA6bP9TOtGL2ytLs
 8eK5OA12UFSkAHwmdRKyVRcBTYMENpUWF7d5M9ofbY5JnaetS6ZnTP88oq3zl0oK+2SK
 NqOo0khsQvjX34W6uZMGnk6kl61/UtKyArqsPWh7MMuZlBR4t9w2a3FQHeoO3vT7sD56
 8j8+roZU4ngmuzyvuMlgBf5PT2lRUo7YirubEhxfdfAzzN0u+s8rb72qdIARJrTckNDK
 XNsF7uXJeqyPp1eS9mrpz7nFWikY28eHZJQk4V+9/FaOAGbUPhiu7ym9QurtgLQD/npE Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30ryrjeq7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 16:55:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32F7310002A;
 Wed,  6 May 2020 16:55:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1ADAC2C38A9;
 Wed,  6 May 2020 16:55:31 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 6 May
 2020 16:55:26 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200429163743.67854-1-marex@denx.de>
 <13aabff1-d4d0-7afb-6a57-a8136e35c6a4@st.com>
 <1d9cbde1-2be1-f54e-7c65-202f2bc7e0a9@denx.de>
 <b100645c-32ac-325d-5838-0fab2c93df22@st.com>
 <6dc6b79f-2a20-3899-e42f-eabaeb33a829@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c012b356-c935-3536-a3eb-0683f4339dda@st.com>
Date: Wed, 6 May 2020 16:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6dc6b79f-2a20-3899-e42f-eabaeb33a829@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-06_08:2020-05-05,
 2020-05-06 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 01/12] ARM: dts: stm32: Add alternate
	pinmux for I2C2 pins
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

CgpPbiA1LzYvMjAgNDozOSBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNS82LzIwIDQ6MjYg
UE0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4+Cj4+Cj4+Cj4+PiBBbGwgcmlnaHQsIHRoYW5r
cy4KPj4+Cj4+PiBidHcgSSBoYWQgdGhpcyBpbnRlcm5hbCBkaXNjdXNzaW9uIG5vdyBhYm91dCBo
YW5kbGluZyB0aGUgY29tYmluYXRvcmlhbAo+Pj4gZXhwbG9zaW9uIG9mIGJvYXJkIERUcyBoZXJl
LiBJZiB3ZSBzdXBwb3J0IHRoZW0gYWxsLCBieSB0aGUgZW5kIG9mIHRoZQo+Pj4gbGlmZXNwYW4g
b2YgdGhlc2UgZGV2aWNlcywgd2UgZW5kIHVwIHdpdGg6Cj4+Pgo+Pj4gU1RNMzJNUDE1ezEsMyw3
fXthLGMsZCxmfSBTb00gcmV2LiB7MC4uN30wMCBvbiBiYXNlYm9hcmQgcmV2LiB7MC4uN30wMC4K
Pj4+Cj4+PiBUaGVyZSB3b24ndCBiZSBldmVyeSBTb00gYW5kIGJhc2Vib2FyZCByZXZpc2lvbiBj
b21iaW5hdGlvbiBhbGwgcmlnaHQuCj4+PiBCdXQgZXZlbiB0aGUgYW1vdW50IG9mIFNvTSBvcHRp
b25zIGdpdmVzIG1lIDEyIERUcy4gVGhhdCBpcyBub3QgYSBsb3cKPj4+IG51bWJlci4gRG9lcyBT
VCBoYXZlIHNvbWUgcGxhbiB0byBoYW5kbGUgc3VjaCBzaXR1YXRpb24gPwo+Pgo+PiBZZXMgSSBo
YXZlIHRoZSBzYW1lIHBvaW50IGluIG1pbmQuIEhvdyB0byBtYWludGFpbiBhbGwgYm9hcmRzID8g
U2hvdWxkCj4+IHdlIHJlZnVzZSBzb21lIGJvYXJkcyBhbmQgb25seSBrZWVwIG9uZSBhcyBleGFt
cGxlID8KPiAKPiBCdXQgd2hpY2ggb25lcyBkbyB5b3Ugd2FudCB0byBkcm9wPyBUaGUgcGRrMiBp
cyBhIGRldmtpdCAsIHNvIHlvdSBjYW4KPiBwdXQgaW4gYW55IFNvTSBvcHRpb24sIHRoYXQncyB0
aGUgcHJvYmxlbS4KCk9rIGJ1dCB3ZSBjb3VsZCBjaG9pY2UgdG8gYnVpbGQgb25seSBvbmUgKG9y
IGZldykgcG9zc2liaWxpdGllcy4gSSBtZWFuIAptYXliZSBvbmx5IG1wMTU3ID8KCgo+Pj4gSSBj
YW4gaW1hZ2luZSB0aGF0IFUtQm9vdCBjYW4gcGF0Y2ggdGhlIERUIGFuZCBlbmFibGUvZGlzYWJs
ZQo+Pj4gZnVuY3Rpb25hbGl0eSAsIHdoaWNoIGNvdWxkIGhhbmRsZSB0aGUge2EsYyxkLGZ9IG9w
dGlvbnMgYW5kIHJlZHVjZSB0aGUKPj4+IGFtb3VudCBvZiBEVHMuIEl0IGNvdWxkIHBvc3NpYmx5
IGFsc28gaGFuZGxlIHRoZSB7MSwzLDd9IG9wdGlvbnMuCj4+Pgo+Pgo+PiBJdCBpcyBzb21ldGhp
bmcgSSBkaXNjdXNzZWQgd2l0aCBLZXZpbiBIaWxtYW4gYXQgRUxDRSBhbmQgc29tZXRpbWUgd2l0
aAo+PiBSb2Igb24gSUlSYy4gV2UgY291bGQgdXNlIHUtYm9vdCB0byBoYW5kbGUgZGlmZmVyZW5j
ZXMgYmV0d2VlbiBTb0MsIGFuZAo+PiBib2FyZHMuIFRlY2huaWNhbGx5IGl0J3MgcG9zc2libGUg
YnV0IHRoZSBtYWluIGlzc3VlIGRvaW5nIHRoYXQgaXMswqAgeW91Cj4+IHdpbGwgaGlkZSBzb21l
IHVwZGF0ZXMgaW4geW91ciBib290bG9hZGVyIGFuZCB0aGVuIHlvdXIgZHRiIHVzZWQgYnkKPj4g
a2VybmVsIHdpbGwgbm90IHJlZmxlY3QgeW91ciBkdHMgZmlsZS4gSXQgY291bGQgYmUgY29uZnVz
ZWQgZm9yCj4+IGN1c3RvbWVycyBhbmQgdXNlcnMuCj4gCj4gWWVzLgo+IAo+Pj4gQW55IG90aGVy
IGlkZWFzID8KPj4KPj4gV2hhdCBpcyBmb3IgeW91IHRoZSBtYWluIGlzc3VlID8gdGhlIG51bWJl
ciBvZiBmaWxlcyB0byBhZGQgb3IgaG93IHRvCj4+IG1haW50YWluIGFsbCB0aG9zZSBmaWxlcyA/
Cj4gCj4gVGhlIG51bWJlci4gTWFpbnRhaW5pbmcgdGhlbSBpcyBub3QgdGhhdCBtdWNoIG9mIGEg
cHJvYmxlbS4KCkkgYWdyZWUKCj4gCj4+IElmIGl0IGlzIHRoZSBudW1iZXIgb2YgZmlsZXMgdG8g
YWRkLCB3ZSBjYW4gdGhpbmsgYWJvdXQgc2V2ZXJhbCB3YXlzOgo+Pgo+PiAxLUFzIG1lbnRpb25l
ZCBhYm92ZSwgdG8gb25seSBrZWVwIGtpbmQgb2YgcmVmZXJlbmNlIHBsYXRmb3Jtcwo+Pgo+PiAy
LUhhdmUgdmVuZG9yIGRpcmVjdG9yaWVzIGluIGFyY2gvYXJtL2Jvb3QvZHRzIChidXQgaXQncyBh
bm90aGVyIHN0b3J5Cj4+IHRvIG1ha2UgaXQgYWNjZXB0ZWQpCj4gCj4gTWF5YmUgdGhhdCdzIHNv
bWV0aGluZyB3ZSBzaG91bGQgY29uc2lkZXIgZm9yIGFybTMyLCBidXQgdGhhdCdzIGEKPiBkaWZm
ZXJlbnQgZGlzY3Vzc2lvbiBhbHRvZ2V0aGVyLgoKSSBnb25uYSBzZWUgaG93IHRvIHN0YXJ0IGRp
c2N1c3Npb24gb24gdGhhdCAobWF5YmUgdGhhbmtzIHRvIExpbmFybyBhbmQgCmRldmljZSB0cmVl
IGV2b2x1dGlvbikKCgo+PiAzLU9yIG1heWJlIHVzZSBEVEJPIHRvIG92ZXJ3cml0ZSBzb21lIGNv
bmZpZ3VyYXRpb24uCj4+Cj4+IElmIHRoZSBjb25jZXJuIGlzIGFib3V0IGhvdyB0byBtYWludGFp
biwgbWF5YmUgSSdtIHdyb25nIGJ1dCBJIHRoaW5rCj4+IHRoYXQgd2l0aCBhIGdvb2Qgc3BsaXQg
YW5kIGZhY3Rvcml6YXRpb24gd2UgY291bGQgbWluaW1pemUgc3VwcG9ydC4KPj4KPj4gQ3VycmVu
dGx5IEkgb25seSB0aG9zZSB0aGluZ3MgaW4gbWluZCBidXQgbm90aGluZyByZWFsbHkgbWF0dXJl
Lgo+IAo+IEkgaG9wZSB0aGlzIHBhdGNoc2V0IGRvZXMgdGhlIHNwbGl0IHJpZ2h0LCBpdCdzIHRo
ZSBudW1iZXIuCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
