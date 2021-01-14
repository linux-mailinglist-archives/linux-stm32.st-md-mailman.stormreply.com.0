Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC3E2F66E5
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 18:11:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AF20C56635;
	Thu, 14 Jan 2021 17:11:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00802C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 17:11:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EH2bGJ014697; Thu, 14 Jan 2021 18:11:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=OZozVddpEGjy69da9fnXIRc989fwDqSTZQHEvvdmXmU=;
 b=enEHpOmjSBzwM6Ky6UM+RPqjVHcf8jynqPVgwHiKQ4fSLfZVA9qdPUMctMzbj5MbJ6vz
 E6eee/olzUiX9yGuTcN6KwWjHZ6Y8rIXC3z8OsUFyLXkxZct2r6fdl1/V/67NLg8zhqy
 hZFcQGbmbI0IZHstDxOgmo2g4tnYco/rprsjaeRoU3Zz8kP8dEMx9nM+VY/6v3qQXAn/
 Z3SFzBHNELfJ+8pAHRAoCoxuJ+PGSXd7y4EPGKJOFXnGvssklz3VK22w2AP7jBhQgynE
 iWTl3DYJVWiW+3SP/REILoc2rHbKcFj4bZsmERnUKWk9yNv9/biVZ78oQzJqhuNFB0Pc KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5kyy4q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 18:11:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B77BB10002A;
 Thu, 14 Jan 2021 18:11:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A83852C41EB;
 Thu, 14 Jan 2021 18:11:46 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 18:11:45 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20201229175521.268234-1-marex@denx.de>
 <c893ad3e-dba2-e1b2-ed7a-24937532d0e6@foss.st.com>
 <30988ce3-93c2-85be-8039-1a886a3f57dc@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <d0ff80e5-5298-c822-ca9f-b4365464fc5a@foss.st.com>
Date: Thu, 14 Jan 2021 18:11:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <30988ce3-93c2-85be-8039-1a886a3f57dc@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
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

CgpPbiAxLzE0LzIxIDY6MDggUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDEvMTQvMjEgNDox
MSBQTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4gSGkgTWFyZWsKPiAKPiBIaSwKPiAKPiBb
Li4uXQo+IAo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRo
Y29tLXBpY29pdHguZHRzaSAKPj4+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhj
b20tcGljb2l0eC5kdHNpCj4+PiBpbmRleCAyNTUyOGExYzA5NmYuLjc1NzcwNzc2NmZhMCAxMDA2
NDQKPj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29tLXBpY29pdHgu
ZHRzaQo+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20tcGljb2l0
eC5kdHNpCj4+PiBAQCAtNDksNyArNDksNyBAQCAmZ3Bpb2Egewo+Pj4gwqDCoMKgwqDCoMKgICov
Cj4+PiDCoMKgwqDCoMKgIHVzYi1wb3J0LXBvd2VyLWhvZyB7Cj4+Cj4+IE9uIG15IHRyZWUgdGhp
cyBub2RlIGlzICJ1c2ItcG9ydC1wb3dlciIuIERvIHlvdSB3YW50IHRvIHVwZGF0ZSB0aGUgCj4+
IG5vZGUgbmFtZSB0b28gPyBJIGNhbiBkbyBpdCBkaXJlY3RseSBkdXJpbmcgdGhlIG1lcmdlIGlm
IHlvdSB3YW50Lgo+PiAoTm90ZSwgaXQgaXMgdGhlIGNhc2UgZm9yIERSQzAyIGhvZyB1cGRhdGUp
Lgo+IAo+IFBsZWFzZSBwaWNrICJbUEFUQ0hdIEFSTTogZHRzOiBzdG0zMjogRml4IEdQSU8gaG9n
IG5hbWVzIG9uIERIQ09NIiAKPiBmaXJzdCwgdGhlbiB0aGlzIHBhdGNoIHNob3VsZCBhcHBseSBj
bGVhbmx5LgoKWWVzIEkganVzdCBzYXcgdGhpcyBvbmUuIEl0IGRvZXNuJ3QgY29udGFpbiBhIGZp
eGVzIHRhZywgSSBjYW4gYWRkIHRoZSAKc2FtZSB0aGFuIGZvciBvdGhlciBob2cgcGF0Y2hlcyA/
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
