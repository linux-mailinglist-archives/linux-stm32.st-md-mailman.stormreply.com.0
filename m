Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97898A689B6
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Mar 2025 11:35:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5313AC7803C;
	Wed, 19 Mar 2025 10:35:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4159C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 10:35:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J9SO6l032495;
 Wed, 19 Mar 2025 11:34:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 RqFuZz63Z0ImK/Xp33t4bPUN4JwD2jEIzeGx3AgsiHM=; b=5aReOAGqEuu0So7V
 SAQzjUOWvtgN07YbhV4I9rLlny5ac/TtdSBkjJViXoWFM4Xvm2910RucXUqBWhZk
 y0VyK6eV0mf04Z1NXvxLMPKvAxcs7O1yhwPZqZvMq8x92ZH9VVDo+AgEHqcXrFb1
 uVGlqleuj4OETGz5lP4qt76Cr/iVvd+aHseLrDiVmRTfyTL7ZVdiTlpo8p5Xiefr
 VGloWHc74hbhblyU2dvkdyUE9t2sCMj52XHIANWQxWs7x0R1b00yx8M071qlacwU
 EtsLIM7e/npVQvCgpG5vjz7sh7KcAPj/1jPwx8OQKjBu49e7Zxfal8Yhok/6Yt4e
 c3MeLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45fuaw0ccb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Mar 2025 11:34:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E486440048;
 Wed, 19 Mar 2025 11:31:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 068276C8A18;
 Wed, 19 Mar 2025 11:29:14 +0100 (CET)
Received: from [192.168.8.15] (10.48.86.14) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Mar
 2025 11:29:12 +0100
Message-ID: <45d5baa5a93fec388a75e91653439f7678d000ee.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, <tglx@linutronix.de>
Date: Wed, 19 Mar 2025 11:29:10 +0100
In-Reply-To: <20250319092951.37667-7-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-7-jirislaby@kernel.org>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.14]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Herve Codina <herve.codina@bootlin.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, WANG
 Xuerui <kernel@xen0n.name>, Janne
 Grunau <j@jannau.net>, linux-stm32@st-md-mailman.stormreply.com, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 Alexandre Ghiti <alex@ghiti.fr>, maz@kernel.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Sven Peter <sven@svenpeter.dev>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, loongarch@lists.linux.dev,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Tero Kristo <kristo@kernel.org>,
 Anup Patel <anup@brainfault.org>, Linus Walleij <linusw@kernel.org>,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 asahi@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Imre Kaloz <kaloz@openwrt.org>,
 Antoine Tenart <atenart@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 06/57] irqdomain: irqchip: Switch to
 of_fwnode_handle()
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

T24gV2VkLCAyMDI1LTAzLTE5IGF0IDEwOjI4ICswMTAwLCBKaXJpIFNsYWJ5IChTVVNFKSB3cm90
ZToKPiBvZl9ub2RlX3RvX2Z3bm9kZSgpIGlzIGlycWRvbWFpbidzIHJlaW1wbGVtZW50YXRpb24g
b2YgdGhlICJvZmZpY2lhbGx5Igo+IGRlZmluZWQgb2ZfZndub2RlX2hhbmRsZSgpLiBUaGUgZm9y
bWVyIGlzIGluIHRoZSBwcm9jZXNzIG9mIGJlaW5nCj4gcmVtb3ZlZCwgc28gdXNlIHRoZSBsYXR0
ZXIgaW5zdGVhZC4KPiAKCi4uLiBzbmlwIC4uLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFj
aGlwL2lycS1zdG0zMm1wLWV4dGkuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc3RtMzJtcC1leHRp
LmMKPiBpbmRleCBjYjgzZDZjYzYxMTMuLjY0OWI4NGYxMmVmYyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2lycWNoaXAvaXJxLXN0bTMybXAtZXh0aS5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2ly
cS1zdG0zMm1wLWV4dGkuYwo+IEBAIC01MzEsNyArNTMxLDcgQEAgc3RhdGljIGludCBzdG0zMm1w
X2V4dGlfZG9tYWluX2FsbG9jKHN0cnVjdCBpcnFfZG9tYWluICpkbSwKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoC8qIHdlIG9ubHkgc3VwcG9ydCBvbmUgcGFyZW50LCBzbyBmYXIgKi8KPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKG9mX25vZGVfdG9fZndub2RlKG91dF9pcnEu
bnApICE9IGRtLT5wYXJlbnQtPmZ3bm9kZSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWYgKG9mX2Z3bm9kZV9oYW5kbGUob3V0X2lycS5ucCkgIT0gZG0tPnBhcmVudC0+Zndub2Rl
KQo+IAoKRm9yIGRyaXZlcnMvaXJxY2hpcC9pcnEtc3RtMzJtcC1leHRpLmMKUmV2aWV3ZWQtYnk6
IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0Bmb3NzLnN0LmNvbT4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
