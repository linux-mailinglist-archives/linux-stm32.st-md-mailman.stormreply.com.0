Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C37DA13D6AA
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2020 10:21:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DE7DC36B0F;
	Thu, 16 Jan 2020 09:21:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86B6BC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 09:21:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00G9CnvH019865; Thu, 16 Jan 2020 10:21:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=oXdqzOpECkceymNrXiBm0gzyy2jK6pABw4YC8ToVezU=;
 b=LMueDRVNZKKBRk7fSc5+0a3lqbIPoJPBRTNrEgkh4C1ln5yOoQPN+tqH2sPOEu2EGXX7
 lRHlD9VVCTqquV6qsTeLW3QbpLkk2UxWKBtLOtZ2L1iqzSFXSZvyLsRFVdujE7J08L5I
 tQdLg9dbTxjs8mWkym5Y3Nqo49WhML66pez9GPL0cqdNSuAcDBLqMV6La8GbLAtfI+/u
 aTgHKn+fe5ebXVHPS5+8jOPZNnkwQMVzuEhX8r/ruGCpD5DbAV6KLFigrnZo9gN+CMta
 20YLGfb5MbuGarnghgi6Uxqje3JdGYOU8rDJ8dU+cPokjeAKr3gPWWM43LnU2KxCHwXI yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf7jpr5pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 10:21:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF267100034;
 Thu, 16 Jan 2020 10:20:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB8B62A900B;
 Thu, 16 Jan 2020 10:20:58 +0100 (CET)
Received: from lmecxl0923.lme.st.com (10.75.127.46) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Jan
 2020 10:20:58 +0100
To: Rob Herring <robh@kernel.org>
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <20200110134823.14882-6-ludovic.barre@st.com> <20200115145645.GA599@bogus>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <2ce63f11-8b0c-8261-63fa-cd19e874c537@st.com>
Date: Thu, 16 Jan 2020 10:20:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20200115145645.GA599@bogus>
Content-Language: fr
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-16_02:2020-01-16,
 2020-01-15 signatures=0
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/9] dt-bindings: mmc: mmci: add delay
 block base register for sdmmc
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

SGkgUm9iCgpMZSAxLzE1LzIwIMOgIDM6NTYgUE0sIFJvYiBIZXJyaW5nIGEgw6ljcml0wqA6Cj4g
T24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMDI6NDg6MTlQTSArMDEwMCwgTHVkb3ZpYyBCYXJyZSB3
cm90ZToKPj4gVG8gc3VwcG9ydCB0aGUgc2RyMTA0IG1vZGUsIHRoZSBzZG1tYyB2YXJpYW50IGhh
cyBhCj4+IGhhcmR3YXJlIGRlbGF5IGJsb2NrIHRvIG1hbmFnZSB0aGUgY2xvY2sgcGhhc2Ugd2hl
biBzYW1wbGluZwo+PiBkYXRhIHJlY2VpdmVkIGJ5IHRoZSBjYXJkLgo+Pgo+PiBUaGlzIHBhdGNo
IGFkZHMgYSBzZWNvbmQgYmFzZSByZWdpc3RlciAob3B0aW9uYWwpIGZvcgo+PiBzZG1tYyBkZWxh
eSBibG9jay4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTHVkb3ZpYyBCYXJyZSA8bHVkb3ZpYy5iYXJy
ZUBzdC5jb20+Cj4+IC0tLQo+PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
bWMvbW1jaS50eHQgfCAyICsrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9t
bWNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1jaS50eHQK
Pj4gaW5kZXggNmQzYzYyNmUwMTdkLi40ZWM5MjFlNGJmMzQgMTAwNjQ0Cj4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1jaS50eHQKPj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tbWNpLnR4dAo+PiBAQCAtMjgsNiArMjgs
OCBAQCBzcGVjaWZpYyBmb3IgdXg1MDAgdmFyaWFudDoKPj4gICAtIHN0LHNpZy1waW4tZmJjbGsg
ICAgICAgOiBmZWVkYmFjayBjbG9jayBzaWduYWwgcGluIHVzZWQuCj4+ICAgCj4+ICAgc3BlY2lm
aWMgZm9yIHNkbW1jIHZhcmlhbnQ6Cj4+ICstIHJlZwkJCSA6IGEgc2Vjb25kIGJhc2UgcmVnaXN0
ZXIgbWF5IGJlIGRlZmluZWQgaWYgYSBkZWxheQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYmxvY2sgaXMgcHJlc2VudCBhbmQgdXNlZCBmb3IgdHVuaW5nLgo+IAo+IFdoaWNoIGNvbXBh
dGlibGVzIGhhdmUgYSAybmQgcmVnIGVudHJ5PwoKSW4gZmFjdCwgbW1jaSBkcml2ZXIgaXMgQVJN
IEFtYmEgZHJpdmVyIChhcm0scHJpbWVjZWxsKSBhbmQgaGFzIG9ubHkgb25lCmNvbXBhdGlibGUg
ImFybSxwbDE4eCIuClRoZSB2YXJpYW50cyBhcmUgaWRlbnRpZmllZCBieSBwcmltZWNlbGwtcGVy
aXBoaWQgcHJvcGVydHkKKGRpc2NvdmVyZWQgYXQgcnVudGltZSB3aXRoIEhXIGJsb2NrIHJlZ2lz
dGVyIG9yIGRlZmluZWQgYnkKZGV2aWNlIHRyZWUgcHJvcGVydHkgImFybSxwcmltZWNlbGwtcGVy
aXBoaWQiKS4KClRoZSBkZWZhdWx0cyAiYXJtLHBsMTh4IiB2YXJpYW50cyBoYXZlIG9ubHkgb25l
IGJhc2UgcmVnaXN0ZXIsCmJ1dCB0aGUgU0RNTUMgbmVlZCBhIHNlY29uZCBiYXNlIHJlZ2lzdGVy
IGZvciB0aGVzZQpkZWxheSBibG9jayByZWdpc3RlcnMuCgpleGFtcGxlIG9mIHNkbW1jIG5vZGU6
CglzZG1tYzE6IHNkbW1jQDU4MDA1MDAwIHsKCQljb21wYXRpYmxlID0gImFybSxwbDE4eCIsICJh
cm0scHJpbWVjZWxsIjsKCQlhcm0scHJpbWVjZWxsLXBlcmlwaGlkID0gPDB4MDAyNTMxODA+OwoJ
CXJlZyA9IDwweDU4MDA1MDAwIDB4MTAwMD4sIDwweDU4MDA2MDAwIDB4MTAwMD47Cgl9OwoKd2hh
dCBkbyB5b3UgYWR2aXNlPwoKPiAKPj4gICAtIHN0LHNpZy1kaXIgICAgICAgICAgICAgOiBzaWdu
YWwgZGlyZWN0aW9uIHBvbGFyaXR5IHVzZWQgZm9yIGNtZCwgZGF0MCBkYXQxMjMuCj4+ICAgLSBz
dCxuZWctZWRnZSAgICAgICAgICAgIDogZGF0YSAmIGNvbW1hbmQgcGhhc2UgcmVsYXRpb24sIGdl
bmVyYXRlZCBvbgo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNkIGNsb2NrIGZhbGxp
bmcgZWRnZS4KPj4gLS0gCj4+IDIuMTcuMQo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
