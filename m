Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D43821F2D
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jan 2024 17:04:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F7B3C6DD69;
	Tue,  2 Jan 2024 16:04:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DFAEC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jan 2024 16:04:50 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 4029YjnI027210; Tue, 2 Jan 2024 17:04:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:subject:from:to:cc:in-reply-to:references
 :content-type:content-transfer-encoding:date:mime-version; s=
 selector1; bh=xTNBlY1w8JNfk8zCUyUIFx2RuHLff5EdQRBRmQo53c8=; b=4T
 vVVlXip65ETRQBYAwqh8yg/ZhQrmJq3PJvBn9i3IDp+pw2OfA4707QXQ25+f/xjU
 Wtz3x2BChhkJPR4MTHODlDNi16RJ5qzprrAKJCOQTuoN1A5DNr0G5bp8kX2bYw3Q
 t7zTYdz6Lv1QzlIOoWCUta31TOVn7klN6GdinUrcgkmXuFVFwHfSojiM8HqbpLRQ
 YRnT2UoGh40H71YXeKrkdJkZMnOOt9VVKr2ALJEmyfBmAFGWBc+3ZaCOq5vH5J1L
 untvT79+/n8NfrloHndDhFg5GCW0DMy5RqMqumtsHDe9A9EcZNf6EEiWVL1OCRez
 XuELy2W6m3lNJV2BpLBw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3va9gkrx0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jan 2024 17:04:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F14E1100059;
 Tue,  2 Jan 2024 17:04:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DAA202B566B;
 Tue,  2 Jan 2024 17:04:37 +0100 (CET)
Received: from [192.168.8.15] (10.201.20.114) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 2 Jan
 2024 17:04:37 +0100
Message-ID: <ee4d31698bc8dfdc6e89045dff57f3e3164b33f7.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <74126e6e301d2f4a0e5a546caa54961dbc2d492c.camel@perches.com>
References: <20231212094310.3633-1-antonio.borneo@foss.st.com>
 <74126e6e301d2f4a0e5a546caa54961dbc2d492c.camel@perches.com>
Date: Tue, 2 Jan 2024 17:04:11 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.48.4 
X-Originating-IP: [10.201.20.114]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-02_04,2024-01-02_01,2023-05-22_02
Cc: =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] checkpatch: use utf-8 match for spell
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVHVlLCAyMDIzLTEyLTEyIGF0IDExOjA3IC0wODAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBP
biBUdWUsIDIwMjMtMTItMTIgYXQgMTA6NDMgKzAxMDAsIEFudG9uaW8gQm9ybmVvIHdyb3RlOgo+
ID4gVGhlIGN1cnJlbnQgY29kZSB0aGF0IGNoZWNrcyBmb3IgbWlzc3BlbGxpbmcgdmVyaWZpZXMs
IGluIGEgbW9yZQo+ID4gY29tcGxleCByZWdleCwgaWYgJHJhd2xpbmUgbWF0Y2hlcyBbXlx3XSgk
bWlzc3BlbGxpbmdzKVteXHddCj4gPiAKPiA+IEJlaW5nICRyYXdsaW5lIGEgYnl0ZS1zdHJpbmcs
IGEgdXRmLTggY2hhcmFjdGVyIGluICRyYXdsaW5lIGNhbgo+ID4gbWF0Y2ggdGhlIG5vbi13b3Jk
LWNoYXIgW15cd10uCj4gPiBFLmcuOgo+ID4gwqDCoMKgwqDCoMKgwqDCoC4vc2NyaXB0L2NoZWNr
cGF0Y2gucGwgLS1naXQgODFjMmYwNTlhYjkKPiA+IMKgwqDCoMKgwqDCoMKgwqBXQVJOSU5HOiAn
bWVudCcgbWF5IGJlIG1pc3NwZWxsZWQgLSBwZXJoYXBzICdtZWFudCc/Cj4gPiDCoMKgwqDCoMKg
wqDCoMKgIzM2OiBGSUxFOiBNQUlOVEFJTkVSUzoxNDM2MDoKPiA+IMKgwqDCoMKgwqDCoMKgwqAr
TTrCoMKgwqDCoCBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeXl5eCj4gPiAKPiA+IFVz
ZSBhIHV0Zi04IHZlcnNpb24gb2YgJHJhd2xpbmUgZm9yIHNwZWxsIGNoZWNraW5nLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3JuZW9AZm9zcy5zdC5j
b20+Cj4gPiBSZXBvcnRlZC1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmlj
QGZvc3Muc3QuY29tPgo+IAo+IFNlZW1zIHNlbnNpYmxlLCB0aGFua3MsIGJ1dDoKPiAKPiA+IGRp
ZmYgLS1naXQgYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgYi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwK
PiBbXQo+ID4gQEAgLTM0NzcsNyArMzQ3Nyw4IEBAIHN1YiBwcm9jZXNzIHsKPiA+IMKgIyBDaGVj
ayBmb3IgdmFyaW91cyB0eXBvIC8gc3BlbGxpbmcgbWlzdGFrZXMKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaWYgKGRlZmluZWQoJG1pc3NwZWxsaW5ncykgJiYKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgkaW5fY29tbWl0X2xvZyB8fCAkbGlu
ZSA9fiAvXig/OlwrfFN1YmplY3Q6KS9pKSkgewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3aGlsZSAoJHJhd2xpbmUgPX4gLyg/Ol58W15cd1wtJ2Bd
KSgkbWlzc3BlbGxpbmdzKSg/OlteXHdcLSdgXXwkKS9naSkgewo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBteSAkcmF3bGluZV91dGY4ID0gZGVjb2Rl
KCJ1dGY4IiwgJHJhd2xpbmUpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB3aGlsZSAoJHJhd2xpbmVfdXRmOCA9fiAvKD86XnxbXlx3XC0nYF0pKCRt
aXNzcGVsbGluZ3MpKD86W15cd1wtJ2BdfCQpL2dpKSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbXkgJHR5cG8gPSAk
MTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBteSAkYmxhbmsgPSBjb3B5X3NwYWNpbmcoJHJhd2xpbmUpOwo+IAo+IE1h
eWJlIHRoaXMgbmVlZHMgdG8gdXNlICRyYXdsaW5lX3V0ZjggPwoKQ29ycmVjdCwgSSB3aWxsIHNl
bmQgYSB2MiEKCj4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbXkgJHB0ciA9IHN1YnN0cigkYmxhbmssIDAsICQtWzFd
KSAuICJeIiB4IGxlbmd0aCgkdHlwbyk7Cj4gCj4gQW5kIG1heSBub3cgdGhlICRmaXggYml0IHdp
bGwgbm90IGFsd2F5cyB3b3JrIHByb3Blcmx5CgpJIGhhdmUgcnVuIHNvbWUgdGVzdCBhbmQgaXQg
bG9va3Mgb2sgd2l0aCBjdXJyZW50IEFTQ0lJIGZpbGUgc2NyaXB0cy9zcGVsbGluZy50eHQuCgpJ
IGhhdmUgYWxzbyB0ZXN0ZWQgYWRkaW5nIHNvbWUgdXRmLTggc3RyaW5nIGluIHRoZSBzcGVsbGlu
ZyBmaWxlLCBidXQgY2hlY2twYXRjaCByZWFkcyBpdCBhcwpBU0NJSSBhbmQgZXh0ZW5kaW5nIGl0
IHRvIHV0Zi04IHdpbGwgcmVxdWlyZSBmdXJ0aGVyIG1vZGlmaWNhdGlvbnMgaW4gY2hlY2twYXRj
aCwgd2F5IGJleW9uZAp0aGlzIHNpbXBsZSBmaXguCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCkFu
dG9uaW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
