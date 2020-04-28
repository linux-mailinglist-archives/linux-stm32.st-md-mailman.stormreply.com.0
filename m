Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD051BC048
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2020 15:54:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7D90C36B0C;
	Tue, 28 Apr 2020 13:54:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C28DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 13:54:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SDqISY023858; Tue, 28 Apr 2020 15:54:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Lr6m56x4ziJWtLz47MJKoCaxyDv2NAOY5kY0XvCwqWQ=;
 b=qxlpJn7m3ujfJbr+DDY5AwpNMke20KwLQx67wzZoEDWe9SMM6mMjFsxmNuKBkPFVGsJ5
 eX6ehbNEpq0nNsMVbkaUeZ/mEw5WpbPXx2RaztRKQL/5B5CQE0BI7SAGoR9dfXcCm+ig
 RsUC0quH184Cv3xesHM+DDCJEfSRbhEgUyf+hHa0tdTIbJjSk6gvB/5EyQOyBdSbvkOI
 PUlb7KUuSoJaxxoYfcOZ/JOzjuRG8NGKVSzxKZLfovn7OdePPH0QV5AQklHne5W3ne1J
 xp/Zu2UkwYYvRyh93pKTAsI9QsU4rU14yIRcbo7m8mU4D8nK1UujiUh8PeGlp+G5e7rN Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjwrbn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 15:54:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B20B10002A;
 Tue, 28 Apr 2020 15:54:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35D622BE24A;
 Tue, 28 Apr 2020 15:54:27 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Apr
 2020 15:54:23 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200422104613.96944-1-marex@denx.de>
 <222f356a-2f4a-47d7-9e4f-e80b6a3f32b0@st.com>
 <daf1bcdc-29a6-db60-cd60-3521aca2ce9b@denx.de>
 <49762c79-a374-92a2-975e-afe7a4e7eb3c@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <a7e83ab6-a62a-d501-2e09-be7954418e01@st.com>
Date: Tue, 28 Apr 2020 15:54:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <49762c79-a374-92a2-975e-afe7a4e7eb3c@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_09:2020-04-28,
 2020-04-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V5 00/20] ARM: dts: stm32: Repair AV96
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

SGkgTWFyZWsKCk9uIDQvMjgvMjAgMzozMiBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNC8y
My8yMCA0OjA0IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gNC8yMy8yMCAzOjM2IFBNLCBB
bGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+Pj4gS2kgTWFyZWsKPj4KPj4gSGksCj4gCj4gSGVsbG8g
YWdhaW4sCj4gCj4+PiBPbiA0LzIyLzIwIDEyOjQ1IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+
PiBUaGUgQVY5NiBib2FyZCBkZXZpY2UgdHJlZSBpcyBjb21wbGV0ZWx5IGJyb2tlbiBhbmQgZG9l
cyBub3QgbWF0Y2ggdGhlCj4+Pj4gaGFyZHdhcmUuIFRoaXMgc2VyaWVzIGZpeGVzIGl0IHVwLgo+
Pj4+Cj4+Pj4gTWFyZWsgVmFzdXQgKDIwKToKPj4+PiAgwqDCoCBBUk06IGR0czogc3RtMzI6IFJl
cGFpciBQTUlDIGNvbmZpZ3VyYXRpb24gb24gQVY5Ngo+Pj4+ICDCoMKgIEFSTTogZHRzOiBzdG0z
MjogUmVwYWlyIFBNSUMgaW50ZXJydXB0IG9uIEFWOTYKPj4+PiAgwqDCoCBBUk06IGR0czogc3Rt
MzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBldGhlcm5ldCBSR01JSQo+Pj4+ICDCoMKgIEFS
TTogZHRzOiBzdG0zMjogUmVwYWlyIGV0aGVybmV0IG9wZXJhdGlvbiBvbiBBVjk2Cj4+Pj4gIMKg
wqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgbWlzc2luZyBldGhlcm5ldCBQSFkgcmVzZXQgb24gQVY5
Ngo+Pj4+ICDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIG1pc3NpbmcgZXRoZXJuZXQgUEhZIHNr
ZXdzIG9uIEFWOTYKPj4+PiAgwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlu
bXV4IGZvciBTRE1NQyBwaW5zCj4+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBSZXBhaXIgU0RN
TUMxIG9wZXJhdGlvbiBvbiBBVjk2Cj4+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgZU1N
QyBhdHRhY2hlZCB0byBTRE1NQzIgb24gQVY5Ngo+Pj4+ICDCoMKgIEFSTTogZHRzOiBzdG0zMjog
QWRkIFFTUEkgTk9SIG9uIEFWOTYKPj4+PiAgwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBjb25m
aWd1cmF0aW9uIEVFUFJPTSBvbiBBVjk2Cj4+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBFbmFi
bGUgV2lGaSBvbiBBVjk2Cj4+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRl
IHBpbm11eCBmb3IgVVNBUlQyIHBpbnMKPj4+PiAgwqDCoCBBUk06IGR0czogc3RtMzI6IEVuYWJs
ZSBCbHVldG9vdGggb24gQVY5Ngo+Pj4+ICDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGFsdGVy
bmF0ZSBwaW5tdXggZm9yIExUREMgcGlucwo+Pj4+ICDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRk
IGJpbmRpbmdzIGZvciBIRE1JIHZpZGVvIG9uIEFWOTYKPj4+PiAgwqDCoCBBUk06IGR0czogc3Rt
MzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBTQUkyIHBpbnMKPj4+PiAgwqDCoCBBUk06IGR0
czogc3RtMzI6IEFkZCBiaW5kaW5ncyBmb3IgYXVkaW8gb24gQVY5Ngo+Pj4+ICDCoMKgIEFSTTog
ZHRzOiBzdG0zMjogQWRkIGJpbmRpbmdzIGZvciBVU0Igb24gQVY5Ngo+Pj4+ICDCoMKgIEFSTTog
ZHRzOiBzdG0zMjogUmVuYW1lIExFRHMgdG8gbWF0Y2ggc2lsa3NjcmVlbiBvbiBBVjk2Cj4+Pj4K
Pj4+PiAgwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1LXBpbmN0cmwuZHRzacKgwqDCoCB8
IDI4MCArKysrKysrKysrKysrKysrKwo+Pj4+ICDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1w
MTU3YS1hdmVuZ2VyOTYuZHRzIHwgMzI0ICsrKysrKysrKysrKysrKysrKy0tCj4+Pj4gIMKgIDIg
ZmlsZXMgY2hhbmdlZCwgNTcyIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+
Pj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPgo+Pj4+IENj
OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3Jn
Pgo+Pj4+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4+
Pj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4KPj4+PiBDYzog
UGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+Cj4+Pj4gQ2M6IGxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4+PiBUbzogbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4KPj4+Cj4+PiBTZXJpZXMgbG9va3MgZ29vZCB0
byBtZS4gSSdsbCBtZXJnZSBpdCBmb3IgbXkgbmV4dCBQci4KPj4+IEp1c3Qgb25lIHF1ZXN0aW9u
LCBBcmUgd2Ugc3RpbGwgYWJsZSB0byBib290IG9sZGVyIGJvYXJkIHJldmlzaW9uCj4+PiAocHJv
dG90eXBlIG9uZXMpPwo+Pgo+PiBJIGRvbid0IGhhdmUgb25lLCBidXQgaWYgd2Ugd2FudCB0byBz
dXBwb3J0IHRoZSBwcm90b3R5cGVzLCB3ZSB3aWxsIG5lZWQKPj4gYSBzZXBhcmF0ZSBEVCBmb3Ig
dGhhdCAob3IgYSBmZXcgRFRTaSB0byBoYW5kbGUgdGhlIEhXIGRpZmZlcmVuY2VzKS4KPiAKPiBJ
IGdvdCB0aGUgNTg4LTEwMCBwcm90b3R5cGUgdG9vIG5vdywgYW5kIEkgaGF2ZSBtb3JlIHBhdGNo
ZXMgd2hpY2ggSQo+IHdvdWxkIGxpa2UgdG8gc3RhcnQgdXBzdHJlYW1pbmcgb24gdG9wIG9mIHRo
aXMgc2VyaWVzIChsaWtlIHNwbGl0IHRoZQo+IFNvTSBEVCBmcm9tIHRoZSBib2FyZCBEVCksIGNh
biB0aGVzZSBiZSBhcHBsaWVkIHNvIEkgY2FuIHN0YXJ0IHNlbmRpbmcKPiB0aGUgcmVzdD8KPiAK
CkknbGwgdHJ5IHRvIGRvIGl0IHRvZGF5IG9yIHRvbW9ycm93LgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
