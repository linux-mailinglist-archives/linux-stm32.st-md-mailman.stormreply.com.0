Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 133EC6325E
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 09:50:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97872C79A9E
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 07:50:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 129A6C79A9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2019 07:50:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x697fIMC005989; Tue, 9 Jul 2019 09:50:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=/DmdBFluf3TNNYk0EQ5Y03piO+O0zI/xncWXtOGKcac=;
 b=P+nWViIidUmuppObGmoj4H4VowV9mJSROGx0hIanQdkFgY9X/9Q4mNFhKSYMf129WOWg
 BUnGr/00pT5Q8nB2AfajhXVLGc41p5UNbuDGArY3UWqg6E/rxIDuZFRyKiiars0JUQ05
 Fpd/mYHI/4OrsAdGMX6uEAO04FGUNlXbvJZF1Iu4UHOGorgaBmPf2nZ8aPcRANomMvc1
 l8xRc7P+xfONcOulMYA8ww5z9yNu+jvJ5Lzk4tvP0pDT66y/xZs84Q6nzcJnYSRCxuS4
 RI+cg9ipLGn6KJcwsKFpAY4epJrvhq/247/r7iD6yRkkATQQD3LNI9VMAcwmdnQ6FPR4 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tmh511qy7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 09 Jul 2019 09:50:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E23D34;
 Tue,  9 Jul 2019 07:50:28 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DDEC228B4;
 Tue,  9 Jul 2019 07:50:25 +0000 (GMT)
Received: from [10.201.23.29] (10.75.127.46) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 9 Jul
 2019 09:50:24 +0200
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1561128189-14411-1-git-send-email-christophe.kerello@st.com>
 <20190701091128.4e67f1de@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <13d30ef8-b649-6416-3814-35a53c5c09ce@st.com>
Date: Tue, 9 Jul 2019 09:50:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701091128.4e67f1de@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_03:, , signatures=0
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: avoid warnings
 when building with W=1 option
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

CgpPbiA3LzEvMTkgOToxMSBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBDaHJpc3RvcGhl
LAo+IAo+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3Jv
dGUgb24gRnJpLCAyMSBKdW4KPiAyMDE5IDE2OjQzOjA5ICswMjAwOgo+IAo+PiBUaGlzIHBhdGNo
IHNvbHZlcyB3YXJuaW5ncyBkZXRlY3RlZCBieSBzZXR0aW5nIFc9MSB3aGVuIGJ1aWxkaW5nLgo+
Pgo+PiBXYXJuaW5ncyB0eXBlIGRldGVjdGVkOgo+PiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0z
Ml9mbWMyX25hbmQuYzogSW4gZnVuY3Rpb24g4oCYc3RtMzJfZm1jMl9jYWxjX3RpbWluZ3PigJk6
Cj4+IGRyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jOjE0MTc6MjM6IHdhcm5p
bmc6IGNvbXBhcmlzb24gaXMKPj4gYWx3YXlzIGZhbHNlIGR1ZSB0byBsaW1pdGVkIHJhbmdlIG9m
IGRhdGEgdHlwZSBbLVd0eXBlLWxpbWl0c10KPj4gICAgZWxzZSBpZiAodGltcy0+dHdhaXQgPiBG
TUMyX1BNRU1fUEFUVF9USU1JTkdfTUFTSykKPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
ZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+PiAtLS0KPiAKPiBBcHBsaWVk
IHRvIG5hbmQvbmV4dCwgdGhhbmtzLgoKSGkgTWlxdWVsLAoKQWZ0ZXIgZmV0Y2hpbmcgbmFuZC9u
ZXh0LCBJIGRvIG5vdCBzZWUgdGhpcyBwYXRjaCBhcHBsaWVkLgoKUmVnYXJkcywKQ2hyaXN0b3Bo
ZSBLZXJlbGxvLgoKPiAKPiBNaXF1w6hsCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
