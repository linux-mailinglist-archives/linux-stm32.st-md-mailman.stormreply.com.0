Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D380C3EAD2
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 08:02:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD600C5F1FF;
	Fri,  7 Nov 2025 07:02:03 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50D05C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 07:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1762498873; x=1763103673; i=markus.elfring@web.de;
 bh=nI3CXGkvAFlQIUQ/j6GtegTtizhopghGL4+tXDlE14w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=UfLkC3vY+o1sZDmcHZH9kkBYo5A0K9b8bVOlqP5/TJATwA7bbzxajYTnhVtoGZ1v
 ex0VRgryWn8miVR5b4pBfVt2nrpN3lkgKtXKJzZ2n25jNcNn8cYpTe/N/MKh0XEY6
 Ffx6j/j+h+oriIhLiqNPD7hBVPEeK9V56WGyuSccZF31kVKSNKJMQQsMHWuU4H7C4
 c9qJqVanAYD5aEnnV8JlfG1Y2kkOLt3PYBunTlfi2PXceJpEqw3BS3dXPZ0h/MG4b
 HqRAiopz9X9enfr3LdesErstm9xuXqqf9qC203q2W82ZL9wdScjusnLAX1wCEKt6o
 XbQ52VqyJE5Uk+zYTA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.187]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQgks-1vcltX2w6A-00VV68; Fri, 07
 Nov 2025 08:01:13 +0100
Message-ID: <396b2d11-29ca-4fae-97c3-7280c879cbfd@web.de>
Date: Fri, 7 Nov 2025 08:00:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liyuan Pang <pangliyuan1@huawei.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 wanqian10@huawei.com, Yang Liu <young.liuyang@huawei.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>
References: <dff05531-f5e3-400a-abf0-a5307c50357e@web.de>
 <20251107021137.874150-1-pangliyuan1@huawei.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251107021137.874150-1-pangliyuan1@huawei.com>
X-Provags-ID: V03:K1:+WdNf1CX4372udFUpsF6/LvjYNnzhBvXTIekGJH2+DckSbHGF5E
 KoK4pXI9XszPfc2Ya1kPKks6HpB7Flus+UTohWIhQk646qDuDebK+VnuXPKQCSxY+EZ8tRU
 oBd7DeuzeFONsGjtWRo9njPeLuyJPIf8vaXSxPQ+vC/whSTlyRaA8jY3AGLb1WtV2Z6LblB
 k3efc22BnQhRpj5YdV+tg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oL26OuA+5Tc=;cxozs17R1289roWpigGmXh1D5vB
 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
 bf0AYeSraKjLd2TBSl/47vZ2co=
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] ubi: fastmap: fix ubi->fm memory leak
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

Pj4g4oCmCj4+PiArKysgYi9kcml2ZXJzL210ZC91YmkvZmFzdG1hcC5jCj4+PiBAQCAtMTY0NCwz
ICsxNjQ0LDE1IEBAIGludCB1YmlfdXBkYXRlX2Zhc3RtYXAoc3RydWN0IHViaV9kZXZpY2UgKnVi
aSkKPj4g4oCmCj4+PiArdm9pZCB1YmlfZnJlZV9mYXN0bWFwKHN0cnVjdCB1YmlfZGV2aWNlICp1
YmkpCj4+PiArewo+Pj4gKwlpbnQgaTsKPj4+ICsKPj4+ICsJaWYgKHViaS0+Zm0pIHsKPj4gKwkJ
Zm9yIChpID0gMDsgaSA8IHViaS0+Zm0tPnVzZWRfYmxvY2tzOyBpKyspCj4+ICsJCQlrbWVtX2Nh
Y2hlX2ZyZWUodWJpX3dsX2VudHJ5X3NsYWIsIHViaS0+Zm0tPmVbaV0pOwo+PiDigKYKPj4gKwl9
Cj4+ICt9Cj4+IOKApgo+Pgo+PiBNYXkgdGhlIGxvY2FsIHZhcmlhYmxlIOKAnGnigJ0gYmUgZGVm
aW5lZCBpbiB0aGUgbG9vcCBoZWFkZXI/Cj4gCj4gSSB0aGluayBpdCdzIGJldHRlciB0byBsZWF2
ZSBpdCBhcyBpdCBpcywgbW9zdCBvZiB0aGUgY29kZSBpbgo+IHViaSBkZWZpbmVzIHZhcmlhYmxl
cyBvdXRzaWRlIHRoZSBsb29wIGhlYWRlciwgYW5kIGRlZmluaW5nCj4gImkiIGluIHRoZSBsb29w
IGhlYWRlciBtYXkgY2F1c2UgY29tcGlsYXRpb24gZXJyb3IgaW4gc29tZSBvbGQKPiBrZXJuZWwg
dmVyc2lvbnMgdGhhdCB1c2UgQzg5LgoKV291bGQgeW91IHN1cHBvcnQgdG8gcmVkdWNlIHRoZSBz
Y29wZSBmb3Igc3VjaCBhIHZhcmlhYmxlIHRvCnRoZSBjb2RlIGJsb2NrIG9mIHRoZSBpZiBicmFu
Y2g/CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
