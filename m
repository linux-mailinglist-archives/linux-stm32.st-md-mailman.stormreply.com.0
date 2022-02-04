Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E087D4AC459
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 16:51:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 740AAC60483;
	Mon,  7 Feb 2022 15:43:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9FF1C60481
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 15:43:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 214EF34A014088;
 Fri, 4 Feb 2022 16:41:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rJOveNVJGX7DUGKosJTj/eP0Rf6Ql1gp9b9F/RL8EE8=;
 b=UZzJOO+hHBvX7Hedp1IyXXl4kFp9uLhmE78AG2xYPWkZ93swtWDb2NbbKgtmbq1qUINs
 4YlA49z5DOgaP5F651pgTwWOEHD6noSkHafNJwO1ui2mGjpxS6uWLtvuDw5PE3pL9Tq8
 0StRDCGl6Edl4BrudAD1E1SonnOl8sQkgfKCdIra1AHg4PpF1ypCsn7/rbI6DvNEQLg/
 /rLXRjDEVEfTEb1vZICw8Xh8s/DOn8kTLrmoDDf/aoQVuzL/Bs5DfPUg+nuBVmNmIxqi
 dQqHoRyHOTrMiKiQRqlVvo42dKpF6So4uBxZAWA4yHlKZeedhIB/N+zJxrivUbjdf4QB mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e0n4e4paj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 16:41:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A015E10002A;
 Fri,  4 Feb 2022 16:41:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9328D229A8C;
 Fri,  4 Feb 2022 16:41:56 +0100 (CET)
Received: from lmecxl0566.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 4 Feb
 2022 16:41:55 +0100
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Ahmad Fatoum
 <a.fatoum@pengutronix.de>
References: <20220203171114.10888-1-erwan.leray@foss.st.com>
 <cc7633c5-de5f-0abf-4ac8-64a74633dfcc@pengutronix.de>
 <f5aec360-c33c-0145-6596-541003e305b2@foss.st.com>
From: Erwan LE RAY <erwan.leray@foss.st.com>
Message-ID: <98823363-710c-6286-8e63-ba8e5dcadeba@foss.st.com>
Date: Fri, 4 Feb 2022 16:41:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f5aec360-c33c-0145-6596-541003e305b2@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-kernel@vger.kernel.org,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/16] STM32 configure UART nodes for DMA
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

SGkgQWhtYWQsCgoKT24gMi80LzIyIDI6MjIgUE0sIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4g
SGkgQWhtYWQKPiAKPiBPbiAyLzMvMjIgMTg6MjUsIEFobWFkIEZhdG91bSB3cm90ZToKPj4gSGVs
bG8gRXJ3YW4sCj4+Cj4+IE9uIDAzLjAyLjIyIDE4OjEwLCBFcndhbiBMZSBSYXkgd3JvdGU6Cj4+
PiBBZGQgRE1BIGNvbmZpZ3VyYXRpb24gdG8gVUFSVCBub2RlcyBpbiBzdG0zMm1wMTV4IChTT0Mg
bGV2ZWwpIGFuZAo+Pj4gcmVtb3ZlIGl0IGF0IGJvYXJkIGxldmVsIHRvIGtlZXAgY3VycmVudCBQ
SU8gYmVoYXZpb3Igd2hlbiBuZWVkZWQuCj4+PiBGb3Igc3RtMzItZWQxIGFuZCBzdG0zMi1ka3gg
Ym9hcmRzLCBVQVJUNCAoY29uc29sZSkgYW5kIFVBUlQ3Cj4+PiAobm8gSFcgZmxvdyBjb250cm9s
IHBpbiBhdmFpbGFibGUpIGFyZSBrZXB0IGluIFBJTyBtb2RlLCB3aGlsZSBVU0FSVDMKPj4+IGlz
IG5vdyBjb25maWd1cmVkIGluIERNQSBtb2RlLgo+Pj4gVUFSVDQgKGNvbnNvbGUgVUFSVCkgaGFz
IHRvIGJlIGtlcHQgaW4gaXJxIG1vZGUsIGFzIERNQSBzdXBwb3J0IGZvcgo+Pj4gY29uc29sZSBo
YXMgYmVlbiByZW1vdmVkIGZyb20gdGhlIGRyaXZlciBieSBjb21taXQgZTM1OWI0NDExYzI4Cj4+
PiAoInNlcmlhbDogc3RtMzI6IGZpeCB0aHJlYWRlZCBpbnRlcnJ1cHQgaGFuZGxpbmciKS4KPj4K
Pj4gRG8gSSB1bmRlcnN0YW5kIGNvcnJlY3RseSB0aGF0IHlvdXIgZmlyc3QgcGF0Y2ggYnJlYWtz
IGNvbnNvbGVzIG9mCj4+IG1vc3QvYWxsIGJvYXJkcywgYmVjYXVzZSB0aGV5IHdpbGwgYnJpZWZs
eSB1c2UgRE1BLCB3aGljaCBpcyByZWZ1c2VkCj4+IGJ5IHRoZSBzdG0zMi11c2FydCBkcml2ZXIg
YW5kIHRoZW4geW91IGFkZCBhIHBhdGNoIGZvciBlYWNoIGJvYXJkCj4+IHRvIGZpeCB0aGF0IGJy
ZWFrYWdlPwo+IAo+IFdlIGhhdmUgdHdvIHNvbHV0aW9ucyBhbmQgYm90aCBoYXZlIHByby9kcmF3
YmFja3MuIFRoZSBmaXJzdCBvbmUgKEVyd2FuIAo+IG9uZXMsIGNhbiBicmVhayB0aGUgYm9vdCBp
ZiB0aGUgcGF0Y2ggaXMgdGFrZW4gImFsb25lIi4gWW91ciBwcm9wb3NpdGlvbiAKPiBhdm9pZHMg
dGhpcyBicmVha2FnZSBidXQgZGVsZXRlcyBhIG5vbiBkZWZpbmUgcHJvcGVydHkgKHdoaWNoIGlz
IGEgYml0IAo+IHdlaXJkKS4gSG93ZXZlciBJIHByZWZlciB0byBrZWVwIGEgZnVuY3Rpb25hbCBi
ZWhhdmlvciwgYW5kIGtlZXAgQWhtYWQgCj4gcHJvcG9zaXRpb24uIEFobWFkLCBqdXN0IG9uZSBx
dWVzdGlvbiwgZHQtYmluZGluZ3MgY2hlY2sgZG9lc24ndCAKPiBjb21wbGFpbiBhYm91dCBpdCA/
Cj4gCj4gQ2hlZXJzCj4gQWxleAo+IAo+Pgo+PiBTdWNoIGludGVybWl0dGVudCBicmVha2FnZSBt
YWtlcyBiaXNlY3Rpb24gYSBoYXNzbGUuIC9kZWxldGUtcHJvcGVydHkvCj4+IGlzIGEgbm8tb3Ag
d2hlbiB0aGUgcHJvcGVydHkgZG9lc24ndCBleGlzdCwgc28geW91IGNvdWxkIG1vdmUgdGhlIGZp
cnN0Cj4+IHBhdGNoIHRvIHRoZSB2ZXJ5IGVuZCB0byBhdm9pZCBpbnRlcm1pdHRlbnQgYnJlYWth
Z2UuCj4+Cj4+IEkgYWxzbyB0aGluayB0aGF0IHRoZSBkcml2ZXIncyBiZWhhdmlvciBpcyBhIGJp
dCBoYXJzaC4gSSB0aGluayBpdCB3b3VsZAo+PiBiZSBiZXR0ZXIgZm9yIHRoZSBVQVJUIGRyaXZl
ciB0byBwcmludCBhIHdhcm5pbmcgYW5kIGZhbGwgYmFjayB0bwo+PiBQSU8gZm9yIGNvbnNvbGUg
aW5zdGVhZCBvZiBvdXRyaWdodCByZWZ1c2luZyBhbmQgcmVuZGVyaW5nIHRoZSBzeXN0ZW0KPj4g
c2lsZW50LiBUaGF0J3Mgbm90IG11dHVhbGx5IGV4Y2x1c2l2ZSB3aXRoIHlvdXIgcGF0Y2ggc2Vy
aWVzIGhlcmUsIG9mIAo+PiBjb3Vyc2UuCj4+Cj4+IENoZWVycywKPj4gQWhtYWQKPj4KClRoZSBk
cml2ZXIgaW1wbGVtZW50YXRpb24gd2lsbCBjb25zaWRlciB0aGUgcmVxdWVzdCB0byBwcm9iZSB0
aGUgVUFSVCAKY29uc29sZSBpbiBETUEgbW9kZSBhcyBhbiBlcnJvciAoLUVOT0RFViksIGFuZCB3
aWxsIGZhbGxiYWNrIHRoaXMgVUFSVCAKcHJvYmUgaW4gaXJxIG1vZGUuCldoYXRldmVyIHRoZSBw
YXRjaCBvcmRlcmluZywgdGhlIGJvb3Qgd2lsbCBuZXZlciBiZSBicm9rZW4uIFRoZSBib2FyZCBk
dCAKcGF0Y2hlcyBhaW0gdG8gZ2V0IGEgInByb3BlciIgaW1wbGVtZW50YXRpb24sIGJ1dCBmcm9t
IGZ1bmN0aW9uYWwgCnBlcnNwZWN0aXZlIHRoZSBkcml2ZXIgd2lsbCBtYW5hZ2UgYSByZXF1ZXN0
IHRvIHByb2JlIGFuIFVBUlQgY29uc29sZSBpbiAKRE1BIG1vZGUgYXMgYW4gZXJyb3IgYW5kIGZh
bGwgaXQgYmFjayBpbiBpcnEgbW9kZS4KCkNoZWVycywgRXJ3YW4uCgo+Pj4KPj4+IEZvciBvdGhl
ciBzdG0zMm1wMTV4LWJhc2VkIGJvYXJkcywgY3VycmVudCBjb25maWd1cmF0aW9uIGlzIGtlcHQg
Zm9yCj4+PiBhbGwgVUFSVCBpbnN0YW5jZXMuCj4+Pgo+Pj4gRXJ3YW4gTGUgUmF5ICgxNik6Cj4+
PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogYWRkIERNQSBjb25maWd1cmF0aW9uIHRvIFVBUlQgbm9k
ZXMgb24gc3RtMzJtcDE1MQo+Pj4gwqDCoCBBUk06IGR0czogc3RtMzI6IGtlZXAgdWFydDQgYmVo
YXZpb3Igb24gc3RtMzJtcDE1N2MtZWQxCj4+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjoga2VlcCB1
YXJ0NCBhbmQgdWFydDcgYmVoYXZpb3Igb24gc3RtMzJtcDE1eHgtZGt4Cj4+PiDCoMKgIEFSTTog
ZHRzOiBzdG0zMjoga2VlcCB1YXJ0NCBiZWhhdmlvciBvbiBpY29yZS1zdG0zMm1wMS1jdG91Y2gy
Cj4+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjoga2VlcCB1YXJ0NCBiZWhhdmlvciBvbiBpY29yZS1z
dG0zMm1wMS1lZGltbTIuMgo+Pj4gwqDCoCBBUk06IGR0czogc3RtMzI6IGtlZXAgdWFydDQgYmVo
YXZpb3Igb24gc3RtMzJtcDE1N2EtaW90LWJveAo+Pj4gwqDCoCBBUk06IGR0czogc3RtMzI6IGtl
ZXAgdWFydCBub2RlcyBiZWhhdmlvciBvbiBzdG0zMm1wMS1taWNyb2RldjIuMC1vZjcKPj4+IMKg
wqAgQVJNOiBkdHM6IHN0bTMyOiBrZWVwIHVhcnQgbm9kZXMgYmVoYXZpb3Igb24gc3RtMzJtcDEt
bWljcm9kZXYyLjAKPj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBrZWVwIHVhcnQgbm9kZXMgYmVo
YXZpb3Igb24gc3RtMzJtcDE1N2Etc3Rpbmdlcjk2Cj4+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjog
a2VlcCB1YXJ0NCBiZWhhdmlvciBvbiBzdG0zMm1wMTU3Yy1seGEtbWMxCj4+PiDCoMKgIEFSTTog
ZHRzOiBzdG0zMjoga2VlcCB1YXJ0NCBiZWhhdmlvciBvbiBzdG0zMm1wMTU3Yy1vZHlzc2V5Cj4+
PiDCoMKgIEFSTTogZHRzOiBzdG0zMjoga2VlcCB1YXJ0IG5vZGVzIGJlaGF2aW9yIG9uIHN0bTMy
bXAxNXh4LWRoY29tLWRyYzAyCj4+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjoga2VlcCB1YXJ0IG5v
ZGVzIGJlaGF2aW9yIG9uIHN0bTMybXAxNXh4LWRoY29tLXBkazIKPj4+IMKgwqAgQVJNOiBkdHM6
IHN0bTMyOiBrZWVwIHVhcnQgbm9kZXMgYmVoYXZpb3Igb24gCj4+PiBzdG0zMm1wMTV4eC1kaGNv
bS1waWNvaXR4Cj4+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjoga2VlcCB1YXJ0NCBiZWhhdmlvciBv
biBzdG0zMm1wMTV4eC1kaGNvbS1zb20KPj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBrZWVwIHVh
cnQgbm9kZXMgYmVoYXZpb3Igb24KPj4+IMKgwqDCoMKgIHN0bTMybXAxNXh4LWRoY29yLWF2ZW5n
ZXI5Ngo+Pj4KPj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzacKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDIxICsrKysrKysrKysrKysrKysrKysKPj4+IMKgIC4uLi9zdG0z
Mm1wMTU3YS1pY29yZS1zdG0zMm1wMS1jdG91Y2gyLmR0c8KgwqDCoCB8wqAgMiArKwo+Pj4gwqAg
Li4uL3N0bTMybXAxNTdhLWljb3JlLXN0bTMybXAxLWVkaW1tMi4yLmR0c8KgwqAgfMKgIDIgKysK
Pj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWlvdC1ib3guZHRzwqDCoMKgwqAg
fMKgIDIgKysKPj4+IMKgIC4uLjE1N2EtbWljcm9nZWEtc3RtMzJtcDEtbWljcm9kZXYyLjAtb2Y3
LmR0cyB8wqAgNCArKysrCj4+PiDCoCAuLi4zMm1wMTU3YS1taWNyb2dlYS1zdG0zMm1wMS1taWNy
b2RldjIuMC5kdHMgfMKgIDQgKysrKwo+Pj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
N2Etc3Rpbmdlcjk2LmR0c2nCoCB8wqAgNiArKysrKysKPj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLWVkMS5kdHPCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsrCj4+PiDCoCBhcmNo
L2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1seGEtbWMxLmR0c8KgwqDCoMKgIHzCoCAyICsrCj4+
PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LmR0c8KgwqDCoMKgIHzC
oCAyICsrCj4+PiDCoCAuLi4vYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29tLWRyYzAyLmR0
c2kgfMKgIDQgKysrKwo+Pj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20t
cGRrMi5kdHNpIHzCoCA0ICsrKysKPj4+IMKgIC4uLi9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNv
bS1waWNvaXR4LmR0c2nCoMKgIHzCoCA0ICsrKysKPj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMybXAxNXh4LWRoY29tLXNvbS5kdHNpwqAgfMKgIDIgKysKPj4+IMKgIC4uLi9ib290L2R0cy9z
dG0zMm1wMTV4eC1kaGNvci1hdmVuZ2VyOTYuZHRzaSB8wqAgNiArKysrKysKPj4+IMKgIGFyY2gv
YXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRreC5kdHNpwqDCoMKgwqDCoMKgwqAgfMKgIDQgKysr
Kwo+Pj4gwqAgMTYgZmlsZXMgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKQo+Pj4KPj4KPj4KPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
