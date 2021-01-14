Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD762F67DE
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 18:37:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3CEBC424C0;
	Thu, 14 Jan 2021 17:37:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CD5FC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 17:37:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EHW4hG003431; Thu, 14 Jan 2021 18:37:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5qtHW+UBlWyRv/VrsWXA6re0AT+J/gQ6drt+PeHlnY4=;
 b=jhSaBp7TJ4/TBsAImN1zjx8PxhyEHsh7u9QCBl2bY3IBKUbeDQqgK9EC5kF4ic9SePOJ
 9kJANTnlB1364+1+cfI5riVrmAAqWoD/OfAnR+to0hFLjffb10wN0TnylS8uSNSDNf4V
 CBS4E0TRghZK+X1ZFNOk5xkcQL3mBRQBLFiKB/C9BW+qgrESEUJ537cQQbZTLj5gAwZb
 PNJvpwp5srBkdccwUmBLnVyBSbvhOlvbbDRnhJN5oY2XAjaCe5Nt84vftWmptJoCeYWD
 rr1QBpdzR/a5TyUwOdSgrb0ZjroKni/wp7SVlPDxiPVijtVMuueD3gvlIdTZVO1cnB91 mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 362379ey1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 18:37:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2DA910002A;
 Thu, 14 Jan 2021 18:37:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A565621236B;
 Thu, 14 Jan 2021 18:37:48 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 18:37:47 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20201229175521.268234-1-marex@denx.de>
 <c893ad3e-dba2-e1b2-ed7a-24937532d0e6@foss.st.com>
 <30988ce3-93c2-85be-8039-1a886a3f57dc@denx.de>
 <d0ff80e5-5298-c822-ca9f-b4365464fc5a@foss.st.com>
 <ba2efe46-9e5e-f5bf-02d7-537b5667f76a@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <94b834b4-d2c3-1352-9db2-47a3766876ae@foss.st.com>
Date: Thu, 14 Jan 2021 18:37:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ba2efe46-9e5e-f5bf-02d7-537b5667f76a@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_06:2021-01-14,
 2021-01-14 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: Fix GPIO hog flags
	on DHCOM PicoITX
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

CgpPbiAxLzE0LzIxIDY6MTMgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDEvMTQvMjEgNjox
MSBQTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4KPj4KPj4gT24gMS8xNC8yMSA2OjA4IFBN
LCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IE9uIDEvMTQvMjEgNDoxMSBQTSwgQWxleGFuZHJlIFRP
UkdVRSB3cm90ZToKPj4+PiBIaSBNYXJlawo+Pj4KPj4+IEhpLAo+Pj4KPj4+IFsuLi5dCj4+Pgo+
Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20tcGlj
b2l0eC5kdHNpIAo+Pj4+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29tLXBp
Y29pdHguZHRzaQo+Pj4+PiBpbmRleCAyNTUyOGExYzA5NmYuLjc1NzcwNzc2NmZhMCAxMDA2NDQK
Pj4+Pj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20tcGljb2l0eC5k
dHNpCj4+Pj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29tLXBpY29p
dHguZHRzaQo+Pj4+PiBAQCAtNDksNyArNDksNyBAQCAmZ3Bpb2Egewo+Pj4+PiDCoMKgwqDCoMKg
wqAgKi8KPj4+Pj4gwqDCoMKgwqDCoCB1c2ItcG9ydC1wb3dlci1ob2cgewo+Pj4+Cj4+Pj4gT24g
bXkgdHJlZSB0aGlzIG5vZGUgaXMgInVzYi1wb3J0LXBvd2VyIi4gRG8geW91IHdhbnQgdG8gdXBk
YXRlIHRoZSAKPj4+PiBub2RlIG5hbWUgdG9vID8gSSBjYW4gZG8gaXQgZGlyZWN0bHkgZHVyaW5n
IHRoZSBtZXJnZSBpZiB5b3Ugd2FudC4KPj4+PiAoTm90ZSwgaXQgaXMgdGhlIGNhc2UgZm9yIERS
QzAyIGhvZyB1cGRhdGUpLgo+Pj4KPj4+IFBsZWFzZSBwaWNrICJbUEFUQ0hdIEFSTTogZHRzOiBz
dG0zMjogRml4IEdQSU8gaG9nIG5hbWVzIG9uIERIQ09NIiAKPj4+IGZpcnN0LCB0aGVuIHRoaXMg
cGF0Y2ggc2hvdWxkIGFwcGx5IGNsZWFubHkuCj4+Cj4+IFllcyBJIGp1c3Qgc2F3IHRoaXMgb25l
LiBJdCBkb2Vzbid0IGNvbnRhaW4gYSBmaXhlcyB0YWcsIEkgY2FuIGFkZCB0aGUgCj4+IHNhbWUg
dGhhbiBmb3Igb3RoZXIgaG9nIHBhdGNoZXMgPwo+IAo+IElmIHRoYXQgaXMgT0sgd2l0aCB5b3Us
IHBsZWFzZSBkby4gVGhhbmtzCgpEb25lLiBTZXJpZXMgYXBwbGllZCBvbiBzdG0zMi1maXhlcy4K
ClJlZ2FyZHMKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
