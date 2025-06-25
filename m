Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9FAE7A60
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 10:36:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28504C32EA8;
	Wed, 25 Jun 2025 08:36:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77522C32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 08:36:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P6nksJ008379;
 Wed, 25 Jun 2025 10:36:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 5iWKPTMFpX+lonpPcbekR/V8/MBsHrjUivVDN79opdU=; b=SqHnV/GqxnozxlFn
 ObEanHvfEI2F+FZtdB/7rtcovax1mQOyY1mVLlQ1BSYzN3yIdeS4b9QiEoUlf22n
 cTk3tMwbAYEgr0NzY+C6Hu4ePlqFtc4ohf3c5cI1MVAtveM2SqSkuPOgaXVJl9t2
 lNCnLxNPGVWfXjSSFjGP4wGMV2SqlxyIdFceC6pGRDWYwmmr/huHgqdJtS0AtyK8
 zzxhKbVp4Gp7CwnIsip3EpIf8VWMfTaCJeNLMvIY5aPom3oUeQlg0pEMpwG3qDpL
 WCHhLTWw5LXNeUKngpRNl/Swhe1B9upvwpikOj5INAqO+91z2RN6R3qE/iQ39qUX
 HZIp/w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dkmjrekf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jun 2025 10:36:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A845540047;
 Wed, 25 Jun 2025 10:35:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36FE8B0C401;
 Wed, 25 Jun 2025 10:33:50 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 10:33:49 +0200
Message-ID: <e2400615-f21e-40bf-84f8-384242632193@foss.st.com>
Date: Wed, 25 Jun 2025 10:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Gatien Chevallier
 <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
 <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
 <9cb1575e-ae27-4a78-adb7-8a9e7072375e@kernel.org>
 <5044c733-8836-43bd-85d7-0f552b000fb1@foss.st.com>
 <49483568-b287-45ca-a66c-1e0ad0490225@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <49483568-b287-45ca-a66c-1e0ad0490225@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/13] perf: stm32: introduce DDRPERFM
	driver
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

T24gNi8yNS8yNSAwODozNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyNC8wNi8y
MDI1IDEyOjQzLCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPj4gT24gNi8yMy8yNSAxMTo0NSwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gWy4uLl0KPj4KPj4gSGkgS3J6eXN6dG9mLAo+
Pgo+PiBTb3JyeSBJIGZvcmdvdCB0byBhZGRyZXNzIGNvbW1lbnRzIGJlbG93Lgo+Pgo+Pj4+ICsK
Pj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzdG0zMl9kZHJfcG11X2NmZyBzdG0zMl9kZHJfcG11
X2NmZ19tcDEgPSB7Cj4+Pj4gKwkucmVncyA9ICZzdG0zMl9kZHJfcG11X3JlZ3NwZWNfbXAxLAo+
Pj4+ICsJLmF0dHJpYnV0ZSA9IHN0bTMyX2Rkcl9wbXVfYXR0cl9ncm91cHNfbXAxLAo+Pj4+ICsJ
LmNvdW50ZXJzX25iID0gTVAxX0NOVF9OQiwKPj4+PiArCS5ldnRfY291bnRlcnNfbmIgPSBNUDFf
Q05UX05CIC0gMSwgLyogVGltZSBjb3VudGVyIGlzIG5vdCBhbiBldmVudCBjb3VudGVyICovCj4+
Pj4gKwkudGltZV9jbnRfaWR4ID0gTVAxX1RJTUVfQ05UX0lEWCwKPj4+PiArCS5nZXRfY291bnRl
ciA9IHN0bTMyX2Rkcl9wbXVfZ2V0X2V2ZW50X2NvdW50ZXJfbXAxLAo+Pj4+ICt9Owo+Pj4+ICsK
Pj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzdG0zMl9kZHJfcG11X2NmZyBzdG0zMl9kZHJfcG11
X2NmZ19tcDIgPSB7Cj4+Pj4gKwkucmVncyA9ICZzdG0zMl9kZHJfcG11X3JlZ3NwZWNfbXAyLAo+
Pj4+ICsJLmF0dHJpYnV0ZSA9IHN0bTMyX2Rkcl9wbXVfYXR0cl9ncm91cHNfbXAyLAo+Pj4+ICsJ
LmNvdW50ZXJzX25iID0gTVAyX0NOVF9OQiwKPj4+PiArCS5ldnRfY291bnRlcnNfbmIgPSBNUDJf
Q05UX05CIC0gMSwgLyogVGltZSBjb3VudGVyIGlzIGFuIGV2ZW50IGNvdW50ZXIgKi8KPj4+PiAr
CS50aW1lX2NudF9pZHggPSBNUDJfVElNRV9DTlRfSURYLAo+Pj4+ICsJLmdldF9jb3VudGVyID0g
c3RtMzJfZGRyX3BtdV9nZXRfZXZlbnRfY291bnRlcl9tcDIsCj4+Pj4gK307Cj4+Pj4gKwo+Pj4+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgc3RtMzJfZGRyX3BtdV9wbV9vcHMgPSB7
Cj4+Pj4gKwlTRVRfU1lTVEVNX1NMRUVQX1BNX09QUyhOVUxMLCBzdG0zMl9kZHJfcG11X2Rldmlj
ZV9yZXN1bWUpCj4+Pj4gK307Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBzdG0zMl9kZHJfcG11X29mX21hdGNoW10gPSB7Cj4+Pj4gKwl7Cj4+Pj4gKwkJLmNv
bXBhdGlibGUgPSAic3Qsc3RtMzJtcDEzMS1kZHItcG11IiwKPj4+PiArCQkuZGF0YSA9ICZzdG0z
Ml9kZHJfcG11X2NmZ19tcDEKPj4+PiArCX0sCj4+Pj4gKwl7Cj4+Pj4gKwkJLmNvbXBhdGlibGUg
PSAic3Qsc3RtMzJtcDE1MS1kZHItcG11IiwKPj4+PiArCQkuZGF0YSA9ICZzdG0zMl9kZHJfcG11
X2NmZ19tcDEKPj4+Cj4+PiBTbyBkZXZpY2VzIGFyZSBjb21wYXRpYmxlLCB0aHVzIGV4cHJlc3Mg
aXQgY29ycmVjdGx5IGFuZCBkcm9wIHRoaXMuCj4+Cj4+IE9rIHNvIEkgYXNzdW1lIHRoaXMgY29t
ZXMgd2l0aCB5b3VyIGNvbW1lbnQgaW4gdGhlIGJpbmRpbmdzIGFuZAo+PiBiYXNpY2FsbHkgZG9u
J3QgZ2V0IHlvdSBwb2ludCBoZXJlLgo+PiBDYW4geW91IHBsZWFzZSBiZSBtb3JlIHByZWNpc2Ug
Pwo+IAo+IEV4cHJlc3MgY29tcGF0aWJpbGl0eSBpbiB0aGUgYmluZGluZ3MsIGxpa2UgOTAlIG9m
IFNvQ3MgYXJlIGRvaW5nLCBzbwo+IHdpdGggcHJvcGVyIGZhbGxiYWNrIGFuZCBkcm9wIHRoaXMg
ZW50cnkgaW4gdGhlIHRhYmxlLiBNeSBjb21tZW50IHdhcwo+IHByZXR0eSBwcmVjaXNlLCBiZWNh
dXNlIHRoaXMgaXMgY29tcGxldGVseSBzdGFuZGFyZCBwYXR0ZXJuLCBhbHNvIHVzZWQKPiBhbHJl
YWR5IGluIHN0bTMyLgo+IAoKT2sgSSByZW1lbWJlciB5b3VyIGRpc2N1c3Npb24gd2l0aCBBbGV4
IGluIG15IFYxIG9mIHBpbmN0cmwtaGRwIDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzFk
ZTU4NjcyLTUzNTUtNGI3NS05OWY0LWM0ODY4NzAxN2QyZkBrZXJuZWwub3JnLwoKRG9lcyBpdCBz
dWl0cyB5b3UgOgpJbiB0aGUgU29DIERUOgpNUDEzOiBjb21wYXRpYmxlID0gInN0LHN0bTMybXAx
MzEtZGRyLXBtdSIsICJzdCxzdG0zMm1wMS1kZHItcG11IjsKTVAxNTogY29tcGF0aWJsZSA9ICJz
dCxzdG0zMm1wMTUxLWRkci1wbXUiLCAic3Qsc3RtMzJtcDEtZGRyLXBtdSI7Ck1QMjU6IGNvbXBh
dGlibGUgPSAic3Qsc3RtMzJtcDI1MS1kZHItcG11IjsKCkluIHRoZSBiaW5kaW5nczoKcHJvcGVy
dGllczoKICAgY29tcGF0aWJsZToKICAgICBlbnVtOgogICAgICAgLSBzdCxzdG0zMm1wMS1kZHIt
cG11CiAgICAgICAtIHN0LHN0bTMybXAxMzEtZGRyLXBtdQogICAgICAgLSBzdCxzdG0zMm1wMTUx
LWRkci1wbXUKICAgICAgIC0gc3Qsc3RtMzJtcDI1MS1kZHItcG11CgpJbiB0aGUgZHJpdmVyOgpz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG0zMl9kZHJfcG11X29mX21hdGNoW10g
PSB7Cgl7CgkJLmNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEtZGRyLXBtdSIsCgkJLmRhdGEgPSAm
c3RtMzJfZGRyX3BtdV9jZmdfbXAxCgl9LAoJewoJCS5jb21wYXRpYmxlID0gInN0LHN0bTMybXAy
NTEtZGRyLXBtdSIsCgkJLmRhdGEgPSAmc3RtMzJfZGRyX3BtdV9jZmdfbXAyCgl9LAoJeyB9LAp9
OwoKQmVzdCByZWdhcmRzLApDbMOpbWVudAoKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
