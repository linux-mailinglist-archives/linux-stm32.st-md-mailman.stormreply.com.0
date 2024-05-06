Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A58BCD73
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2024 14:08:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C46BC78002;
	Mon,  6 May 2024 12:08:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97545C78001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2024 12:07:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4468VNBQ032357;
 Mon, 6 May 2024 14:07:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=6EJVQ+wMxEHRL14RVOpH9mV9WNJQFrNy5pxAip0Pyy8=; b=2w
 HWU+qJMRg1YngPQfOl2Y2ECz9cKoNqJYUwSlTSND6V/PbTOT0MsrXLeTeu4HssOT
 wasRDCloTdPyC97jZm9AFjC/JtAnmD481ohyP5/jZjH01hwzyOlLb2zXsnSAVjTU
 VjEY5x7+x3IiEegYTgUQXLsQfq0YN0e6zYGPWQGrzh9eUb65Pa8ebxy1BykX7ryc
 1YzhT/l/BocGomvLB8ulcKVxEq2bzszRDKlm1TlhLzBaJJgT4nEqYEgJOdQa53y2
 WltLcY8euLHAX704v+gmlpwXXgrScCrwqzpJodRmLLxwJrGx5p8BhdZ6PVlE7IdM
 6cNahAQMf6Lxhx//AUsg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xwcbx6qg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 May 2024 14:07:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 52CF64002D;
 Mon,  6 May 2024 14:07:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4895B21A239;
 Mon,  6 May 2024 14:07:11 +0200 (CEST)
Received: from [10.48.86.107] (10.48.86.107) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 14:07:08 +0200
Message-ID: <02e9e9c5-449a-48ae-88a7-0483895cd4bf@foss.st.com>
Date: Mon, 6 May 2024 14:07:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antonio Borneo <antonio.borneo@foss.st.com>, Andy Whitcroft
 <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20231212094310.3633-1-antonio.borneo@foss.st.com>
 <20240102161038.22347-1-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20240102161038.22347-1-antonio.borneo@foss.st.com>
X-Originating-IP: [10.48.86.107]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_07,2024-05-06_01,2023-05-22_02
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

SGVsbG8sCgpBIGdlbnRsZSByZW1pbmRlciB0byByZXZpZXcgdGhpcyBwYXRjaC4KCkJlc3QgcmVn
YXJkcywKCkNsw6ltZW50CgpPbiAxLzIvMjQgMTc6MTAsIEFudG9uaW8gQm9ybmVvIHdyb3RlOgo+
IFRoZSBjdXJyZW50IGNvZGUgdGhhdCBjaGVja3MgZm9yIG1pc3NwZWxsaW5nIHZlcmlmaWVzLCBp
biBhIG1vcmUKPiBjb21wbGV4IHJlZ2V4LCBpZiAkcmF3bGluZSBtYXRjaGVzIFteXHddKCRtaXNz
cGVsbGluZ3MpW15cd10KPiAKPiBCZWluZyAkcmF3bGluZSBhIGJ5dGUtc3RyaW5nLCBhIHV0Zi04
IGNoYXJhY3RlciBpbiAkcmF3bGluZSBjYW4KPiBtYXRjaCB0aGUgbm9uLXdvcmQtY2hhciBbXlx3
XS4KPiBFLmcuOgo+IAkuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLWdpdCA4MWMyZjA1OWFiOQo+
IAlXQVJOSU5HOiAnbWVudCcgbWF5IGJlIG1pc3NwZWxsZWQgLSBwZXJoYXBzICdtZWFudCc/Cj4g
CSMzNjogRklMRTogTUFJTlRBSU5FUlM6MTQzNjA6Cj4gCStNOiAgICAgQ2zDqW1lbnQgTMOpZ2Vy
IDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgo+IAkgICAgICAgICAgICBeXl5eCj4gCj4gVXNl
IGEgdXRmLTggdmVyc2lvbiBvZiAkcmF3bGluZSBmb3Igc3BlbGwgY2hlY2tpbmcuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgo+
IFJlcG9ydGVkLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5z
dC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIHVzZSAkcmF3bGluZV91dGY4IGFsc28g
aW4gdGhlIHdoaWxlLWxvb3AncyBib2R5Owo+IC0gZml4IHBhdGggb2YgY2hlY2twYXRjaCBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UuCj4gLS0tCj4gICBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgfCA1ICsr
Ky0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgYi9zY3JpcHRzL2NoZWNrcGF0
Y2gucGwKPiBpbmRleCAyNWZkYjdmZGExMTIuLjJkMTIyZDIzMmM2ZCAxMDA3NTUKPiAtLS0gYS9z
Y3JpcHRzL2NoZWNrcGF0Y2gucGwKPiArKysgYi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwKPiBAQCAt
MzQ3Nyw5ICszNDc3LDEwIEBAIHN1YiBwcm9jZXNzIHsKPiAgICMgQ2hlY2sgZm9yIHZhcmlvdXMg
dHlwbyAvIHNwZWxsaW5nIG1pc3Rha2VzCj4gICAJCWlmIChkZWZpbmVkKCRtaXNzcGVsbGluZ3Mp
ICYmCj4gICAJCSAgICAoJGluX2NvbW1pdF9sb2cgfHwgJGxpbmUgPX4gL14oPzpcK3xTdWJqZWN0
OikvaSkpIHsKPiAtCQkJd2hpbGUgKCRyYXdsaW5lID1+IC8oPzpefFteXHdcLSdgXSkoJG1pc3Nw
ZWxsaW5ncykoPzpbXlx3XC0nYF18JCkvZ2kpIHsKPiArCQkJbXkgJHJhd2xpbmVfdXRmOCA9IGRl
Y29kZSgidXRmOCIsICRyYXdsaW5lKTsKPiArCQkJd2hpbGUgKCRyYXdsaW5lX3V0ZjggPX4gLyg/
Ol58W15cd1wtJ2BdKSgkbWlzc3BlbGxpbmdzKSg/OlteXHdcLSdgXXwkKS9naSkgewo+ICAgCQkJ
CW15ICR0eXBvID0gJDE7Cj4gLQkJCQlteSAkYmxhbmsgPSBjb3B5X3NwYWNpbmcoJHJhd2xpbmUp
Owo+ICsJCQkJbXkgJGJsYW5rID0gY29weV9zcGFjaW5nKCRyYXdsaW5lX3V0ZjgpOwo+ICAgCQkJ
CW15ICRwdHIgPSBzdWJzdHIoJGJsYW5rLCAwLCAkLVsxXSkgLiAiXiIgeCBsZW5ndGgoJHR5cG8p
Owo+ICAgCQkJCW15ICRoZXJlcHRyID0gIiRoZXJlbGluZSRwdHJcbiI7Cj4gICAJCQkJbXkgJHR5
cG9fZml4ID0gJHNwZWxsaW5nX2ZpeHtsYygkdHlwbyl9Owo+IAo+IGJhc2UtY29tbWl0OiBiODVl
YTk1ZDA4NjQ3MWFmYjRhZDA2MjAxMmE0ZDczY2QzMjhmYTg2Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
