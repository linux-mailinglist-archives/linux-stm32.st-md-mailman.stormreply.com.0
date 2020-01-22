Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE3145A5C
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2020 17:56:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43DBDC36B0C;
	Wed, 22 Jan 2020 16:56:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BC78C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2020 16:56:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00MGsJHq027353; Wed, 22 Jan 2020 17:56:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=jAofysKmTGDIe4uI2hyjowvegh3nfAUkdVFQzLbkYOo=;
 b=gKOzHILeo1KDtzrB4mK2DNL8NNXirLO4Blnw2JMEBTiBdimQMMRudPLqaYH2svcVQEsn
 mEtrlZ3m0Gki2cxtAtNAttn1fcaPZYSeqBynYqrqgzlWLEvN68RRFlDJ63Jl20tKNl6J
 Y+bjexaXxlahsJnU9ao7sJIxubrDxpmSbhFzjz7u9eJ0N0eJLZupCBhPaDNhl85tkNNb
 a3/Cx1DSAKXhM7orUYICfi65FjPUEZEx1Nl7+rRQH9SARP7H83gmDEpMWTMIxUI0LKw5
 up8fT3295kHjGRjioXPqUlgFgSNtheqocL6dnKeUQe5kZs9yob9FTFi6l09QB9vRIKQc 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrc55q54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 17:56:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C42510002A;
 Wed, 22 Jan 2020 17:56:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56E5D22030F;
 Wed, 22 Jan 2020 17:56:33 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 Jan
 2020 17:56:32 +0100
To: Marc Zyngier <maz@kernel.org>
References: <20bb72d0-8258-abc0-e729-4d3d5a75c41c@denx.de>
 <d6e02817-2464-51b9-246a-7720b607b8d6@st.com>
 <82d4619107e9ac76d317268637f050cf@kernel.org>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <5f788bb1-d3b3-4ae3-2a85-de19a7d40ff2@st.com>
Date: Wed, 22 Jan 2020 17:56:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <82d4619107e9ac76d317268637f050cf@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-22_07:2020-01-22,
 2020-01-22 signatures=0
Cc: Marek Vasut <marex@denx.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] STM32MP1 level triggered interrupts
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

CgpPbiAxLzIxLzIwIDY6MjEgUE0sIE1hcmMgWnluZ2llciB3cm90ZToKPiBPbiAyMDIwLTAxLTIx
IDE3OjEyLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+PiBIaSBNYXJlaywKPj4KPj4gT24gMS8y
MC8yMCA3OjMyIFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IEkgaGF2ZSBh
IGRldmljZSBjb25uZWN0ZWQgdG8gU1RNMzJNUDE1N0Mgd2hpY2ggcmVxdWlyZXMgYWN0aXZlLWxv
dwo+Pj4gbGV2ZWwtdHJpZ2dlcmVkIGludGVycnVwdCBzaW5rLiBUaGUgZGV2aWNlIGludGVycnVw
dCBsaW5lIGlzIGNvbm5lY3RlZAo+Pj4gdG8gdGhlIFNvQyBncGlvLUMgYmFuaywgd2hpY2ggaGFz
IGl0J3MgaW50ZXJydXB0IGxpbmUgcm91dGVkIGludG8gRVhUSSwKPj4+IHdoaWNoIGNhbiBvbmx5
IGhhbmRsZSBlZGdlIHRyaWdnZXJlZCBpbnRlcnJ1cHRzIHRvIG15IHVuZGVyc3RhbmRpbmcuCj4+
Cj4+IGNvcnJlY3QuCj4+Cj4+Pgo+Pj4gSG93ZXZlciwgQVJNIEdJQyBzaG91bGQgYmUgYWJsZSB0
byBkbyBib3RoIGFuZCBFWFRJIGhhcyB0aGlzIGlycW11eCAvCj4+PiBFWFRJbXV4IGZ1bmN0aW9u
YWxpdHksIHdoaWNoIC0tIGlmIG15IHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdCAtLSBpcwo+Pj4g
Y2FwYWJsZSBvZiByb3V0aW5nIGEgc2VsZWN0IEdQSU8gbGluZSBkaXJlY3RseSBpbnRvIHRoZSBH
SUMgYXMgYW4gRVhUSW4KPj4+IGludGVycnVwdCBzaWduYWwuIFRodXMsIHRoaXMgbWlnaHQgcGVy
bWl0IGhhbmRsaW5nIGFjdGl2ZSBsb3cKPj4+IGxldmVsLXRyaWdnZXJlZCBpbnRlcnJ1cHRzLiBJ
cyB0aGVyZSBzb21lIERUIGJpbmRpbmcgdG8gY29uZmlndXJlIAo+Pj4gdGhpcyB5ZXQgPwo+Pj4K
Pj4+IE9yIGlzIHRoZXJlIHNvbWUgb3RoZXIsIGJldHRlciwgd2F5ID8KPj4+Cj4+Cj4+IEZvciBT
UElzLCBHSUMgY29udHJvbGxlciBoYW5kbGVzIHJpc2luZyBlZGdlIHRyaWdnZXJlZCBpbnRlcnJ1
cHQgYW5kCj4+IGFjdGl2ZSBoaWdoIGxldmVsLXNlbnNpdGl2ZS4gR0lDIGludGVncmF0aW9uIGlu
IFNUTTMyTVAxNTdjIG1ha2VzIHRoYXQKPj4gb25seSBhY3RpdmUgaGlnaCBsZXZlbC1zZW5zaXRp
dmUgY29uZmlndXJhdGlvbiBmb3IgU1BJIGludGVycnVwdHMgaXMKPj4gc3VwcG9ydGVkLgo+IAo+
IFRoaXMgc3RhdGVtZW50IGlzIGEgc2xpZ2h0IGV4YWdnZXJhdGlvbi4gKmFueSogR0lDIHdpbGwg
aGFwcGlseSBzZXJ2aWNlCj4gcmlzaW5nLWVkZ2UgdHJpZ2dlcmVkIFNQSXMsIGFzIGl0IGlzIG1h
bmRhdGVkIGJ5IHRoZSBzcGVjLiBXaGF0IEkgc3VzcGVjdAo+IGlzIHRoYXQgdGhlcmUgaXMgbm8g
U1BJIHRoYXQgaXMgcm91dGVkIG91dCBvZiB0aGUgU29DIGZvciBhbnlvbmUgdG8gCj4gZGlyZWN0
bHkKPiBwbHVnIGFueXRoaW5nIGludG8gaXQuCgpZZXMgY29ycmVjdC4gTm8gU1BJIGFyZSByb3V0
ZWQgb3V0IG9mIHRoZSBTb0MuIEV4dGVybmFsIGludGVycnVwdGlvbnMgCmFyZSBtYXBwZWQgdG8g
RXh0aS4gRXh0aSBpcyB0aGVuIHJvdXRlZCB0byB0aGUgR0lDIHdpdGggb3RoZXIgc2lnbmFscy4K
ClJlZ2FyZHMKQWxleAoKPiAKPiAgwqDCoMKgwqDCoMKgwqDCoCBNLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
