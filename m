Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A50D1CED40
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 08:50:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03E99C36B38;
	Tue, 12 May 2020 06:50:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BADCC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 06:50:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04C6mDFD014173; Tue, 12 May 2020 08:49:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=iEKjer/AUZHyZOt8W1uqSZTqu50DObD4a45HBZNn1gg=;
 b=WGIsw95lqD0h3WMhec/jt5cW8wF8MlhfrFKGP/m06rYBvMAlXVCoO0WSKxYFbboKoxmZ
 D0rtymgEp5jsRaZcCf1ON6ck6FQb1fhal73CUajnkQRUvvhEbqQJEMlPA/iVdUALLAw7
 JeQrggkQ81PpYnIfDJHkGbVBehC0DcdJbsTYtgcVFE4Yk9lBkIAom7oXKfJ2G8ZNQm0c
 U/mMkY9GHTTVaOMCp+UtVazLUAg0REwjobdpNhBPNmqiK7FUZbfonJZKZ6sdYPswEyMU
 ra6sXeG8e8tlvbALus+swRodDS9Fsvk2kjSTQxCRX5uB9AdGv1INMl0TJ4eCzMxWX8DZ BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30whn9ekuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 08:49:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6295100034;
 Tue, 12 May 2020 08:49:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8BCD221A49;
 Tue, 12 May 2020 08:49:57 +0200 (CEST)
Received: from [10.211.13.100] (10.75.127.46) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 12 May
 2020 08:49:56 +0200
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-5-git-send-email-christophe.kerello@st.com>
 <20200511223900.030fe5f4@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <49c51a13-96a1-0241-f4d1-c5ff7d52921d@st.com>
Date: Tue, 12 May 2020 08:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200511223900.030fe5f4@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_01:2020-05-11,
 2020-05-12 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 04/10] mtd: rawnand: stm32_fmc2: cleanup
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

SGkgTWlxdWVsLAoKT24gNS8xMS8yMCAxMDozOSBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiAK
PiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+IHdyb3RlIG9u
IFdlZCwgNiBNYXkgMjAyMAo+IDExOjExOjEzICswMjAwOgo+IAo+PiBUaGlzIHBhdGNoIHJlbmFt
ZXMgZnVuY3Rpb25zIGFuZCBsb2NhbCB2YXJpYWJsZXMuCj4+IFRoaXMgY2xlYW51cCBpcyBkb25l
IHRvIGdldCBhbGwgZnVuY3Rpb25zIHN0YXJ0aW5nIGJ5IHN0bTMyX2ZtYzJfbmZjCj4+IGluIHRo
ZSBGTUMyIHJhdyBOQU5EIGRyaXZlciB3aGVuIGFsbCBmdW5jdGlvbnMgd2lsbCBzdGFydCBieQo+
PiBzdG0zMl9mbWMyX2ViaSBpbiB0aGUgRk1DMiBFQkkgZHJpdmVyLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4+IFJl
dmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IAo+
IEFwcGxpZWQgdG8gbmFuZC9uZXh0IGFzIHdlbGwgYnV0IGZvciBhbiB1bmtub3duIHJlYXNvbiBJ
IGhhZCB0byBkbyBpdAo+IGJ5IGhhbmQgYmVjYXVzZSB0aGUgcGF0Y2ggd291bGQgbm90IGFwcGx5
Lgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gClRoaXMgaXMgc3RyYW5nZSwgSSBjYW4gYXBwbHkg
dGhpcyBwYXRjaCBvbiBteSB0cmVlIHdpdGhvdXQgYW55IGNvbmZsaWN0cy4KVGhlcmUgaXMgYSBj
b21waWxhdGlvbiBpc3N1ZSBsaW5lIDEzMDEuCgpAQCAtMTMwMiw0NCArMTI5OCw0NSBAQCBzdGF0
aWMgdm9pZCBzdG0zMl9mbWMyX3dyaXRlX2RhdGEoc3RydWN0IApuYW5kX2NoaXAgKmNoaXAsIGNv
bnN0IHZvaWQgKmJ1ZiwKCiAgCWlmIChmb3JjZV84Yml0ICYmIGNoaXAtPm9wdGlvbnMgJiBOQU5E
X0JVU1dJRFRIXzE2KQogIAkJLyogUmVjb25maWd1cmUgYnVzIHdpZHRoIHRvIDE2LWJpdCAqLwot
CQlzdG0zMl9mbWMyX3NldF9idXN3aWR0aF8xNihmbWMyLCB0cnVlKTsKKwkJc3RtMzJfZm1jMl9u
ZmNfc2V0X2J1c3dpZHRoXzE2KG5mYywgdHJ1ZSk7CiAgfQoKSSB3aWxsIHJlYmFzZSBvbiB0b3Ag
b2YgbmFuZC9uZXh0IHRvZGF5IHRvIGNoZWNrIHRoYXQgdGhlcmUgaXMgbm8gaXNzdWVzIAp3aXRo
IHRoZSBkcml2ZXIuCgpSZWdhcmRzLApDaHJpc3RvcGhlIEtlcmVsbG8uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
