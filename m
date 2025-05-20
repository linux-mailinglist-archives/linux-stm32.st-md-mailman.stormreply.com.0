Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C8FABD91C
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 15:16:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 400BEC78F9C;
	Tue, 20 May 2025 13:16:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCCDAC78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 13:16:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KBStlD006650;
 Tue, 20 May 2025 15:16:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 yBy5SJPnGNYkoa6Z5ILQ91Byp9mkblFSTlrqPKH6O2c=; b=TH/qe1I0XC4SnMpF
 aqiuuGS6atDP6k3ZyrAwOjgIDHDT1VD3w+vSQ9qkMsKV6vKpjc56seghHJj0XMgI
 giE2W5SfW5DMbBv11vRYxwSzzUNy6fjb2s1sTrFXQveo6r5vr4wzDldQaIApM69+
 hG5mEptSxLbrBOGz0mFVPwcTsfXkkggjYFK1N+qfoGwmSk26TsRdxScvdeYLoanx
 WgzREXSNd0GZSiGfFLsJxq2qxb/dXNxRGnjPaWOUTUSEsjeOhrJzf2VO6cG1fKmR
 0pPwvN187Kfd6BIDqpU7YYMS1WzLNDj5L9PEfikP8+vopigiAGJ4F9sTxEdBYsfV
 /C+1Aw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46phbgn3xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 15:16:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B955740047;
 Tue, 20 May 2025 15:14:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 795F3AF993E;
 Tue, 20 May 2025 15:14:03 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 15:14:02 +0200
Message-ID: <e1bd523b-e7da-41eb-ad1a-a56488c4f0cd@foss.st.com>
Date: Tue, 20 May 2025 15:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>, Andy Whitcroft
 <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20231212094310.3633-1-antonio.borneo@foss.st.com>
 <20240102161038.22347-1-antonio.borneo@foss.st.com>
 <02e9e9c5-449a-48ae-88a7-0483895cd4bf@foss.st.com>
Content-Language: en-US
In-Reply-To: <02e9e9c5-449a-48ae-88a7-0483895cd4bf@foss.st.com>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_05,2025-05-16_03,2025-03-28_01
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] checkpatch: use utf-8 match for spell
	checking
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

T24gNS82LzI0IDE0OjA3LCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPiBIZWxsbywKPiAKPiBB
IGdlbnRsZSByZW1pbmRlciB0byByZXZpZXcgdGhpcyBwYXRjaC4KPiAKPiBCZXN0IHJlZ2FyZHMs
Cj4gCj4gQ2zDqW1lbnQKPiAKPiBPbiAxLzIvMjQgMTc6MTAsIEFudG9uaW8gQm9ybmVvIHdyb3Rl
Ogo+PiBUaGUgY3VycmVudCBjb2RlIHRoYXQgY2hlY2tzIGZvciBtaXNzcGVsbGluZyB2ZXJpZmll
cywgaW4gYSBtb3JlCj4+IGNvbXBsZXggcmVnZXgsIGlmICRyYXdsaW5lIG1hdGNoZXMgW15cd10o
JG1pc3NwZWxsaW5ncylbXlx3XQo+Pgo+PiBCZWluZyAkcmF3bGluZSBhIGJ5dGUtc3RyaW5nLCBh
IHV0Zi04IGNoYXJhY3RlciBpbiAkcmF3bGluZSBjYW4KPj4gbWF0Y2ggdGhlIG5vbi13b3JkLWNo
YXIgW15cd10uCj4+IEUuZy46Cj4+IMKgwqDCoMKgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1n
aXQgODFjMmYwNTlhYjkKPj4gwqDCoMKgwqBXQVJOSU5HOiAnbWVudCcgbWF5IGJlIG1pc3NwZWxs
ZWQgLSBwZXJoYXBzICdtZWFudCc/Cj4+IMKgwqDCoMKgIzM2OiBGSUxFOiBNQUlOVEFJTkVSUzox
NDM2MDoKPj4gwqDCoMKgwqArTTrCoMKgwqDCoCBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVn
ZXJAYm9vdGxpbi5jb20+Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeXl5eCj4+
Cj4+IFVzZSBhIHV0Zi04IHZlcnNpb24gb2YgJHJhd2xpbmUgZm9yIHNwZWxsIGNoZWNraW5nLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3JuZW9AZm9zcy5z
dC5jb20+Cj4+IFJlcG9ydGVkLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2Zm
aWNAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIHYyOgo+PiAtIHVzZSAkcmF3bGlu
ZV91dGY4IGFsc28gaW4gdGhlIHdoaWxlLWxvb3AncyBib2R5Owo+PiAtIGZpeCBwYXRoIG9mIGNo
ZWNrcGF0Y2ggaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+PiAtLS0KPj4gwqAgc2NyaXB0cy9jaGVj
a3BhdGNoLnBsIHwgNSArKystLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jaGVja3BhdGNoLnBs
IGIvc2NyaXB0cy9jaGVja3BhdGNoLnBsCj4+IGluZGV4IDI1ZmRiN2ZkYTExMi4uMmQxMjJkMjMy
YzZkIDEwMDc1NQo+PiAtLS0gYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwKPj4gKysrIGIvc2NyaXB0
cy9jaGVja3BhdGNoLnBsCj4+IEBAIC0zNDc3LDkgKzM0NzcsMTAgQEAgc3ViIHByb2Nlc3Mgewo+
PiDCoCAjIENoZWNrIGZvciB2YXJpb3VzIHR5cG8gLyBzcGVsbGluZyBtaXN0YWtlcwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGRlZmluZWQoJG1pc3NwZWxsaW5ncykgJiYKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKCRpbl9jb21taXRfbG9nIHx8ICRsaW5lID1+IC9eKD86XCt8U3Vi
amVjdDopL2kpKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdoaWxlICgkcmF3bGluZSA9
fiAvKD86XnxbXlx3XC0nYF0pKCRtaXNzcGVsbGluZ3MpKD86IAo+PiBbXlx3XC0nYF18JCkvZ2kp
IHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXkgJHJhd2xpbmVfdXRmOCA9IGRlY29kZSgi
dXRmOCIsICRyYXdsaW5lKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2hpbGUgKCRyYXds
aW5lX3V0ZjggPX4gLyg/Ol58W15cd1wtJ2BdKSgkbWlzc3BlbGxpbmdzKSAKPj4gKD86W15cd1wt
J2BdfCQpL2dpKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXkgJHR5
cG8gPSAkMTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBteSAkYmxhbmsgPSBj
b3B5X3NwYWNpbmcoJHJhd2xpbmUpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG15ICRibGFuayA9IGNvcHlfc3BhY2luZygkcmF3bGluZV91dGY4KTsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBteSAkcHRyID0gc3Vic3RyKCRibGFuaywgMCwgJC1bMV0p
IC4gIl4iIHggCj4+IGxlbmd0aCgkdHlwbyk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbXkgJGhlcmVwdHIgPSAiJGhlcmVsaW5lJHB0clxuIjsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBteSAkdHlwb19maXggPSAkc3BlbGxpbmdfZml4e2xjKCR0
eXBvKX07Cj4+Cj4+IGJhc2UtY29tbWl0OiBiODVlYTk1ZDA4NjQ3MWFmYjRhZDA2MjAxMmE0ZDcz
Y2QzMjhmYTg2CgpIaSwKCklzIGl0IGp1c3QgZHVlIHRvIC1FTk9USU1FIGZvciB0aGUgbWFpbnRh
aW5lcnMsIG9yIGFyZSB0aGVyZSBkb3VidHMgCmFib3V0IHRoaXMgcGF0Y2g/IChpbnNwaXJlZCBm
cm9tIGEgcmVzcG9uc2Ugb2YgVXdlKS4KCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
