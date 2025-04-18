Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F53A936F4
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 14:20:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B06F5C7802C;
	Fri, 18 Apr 2025 12:20:26 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr
 [80.12.242.25])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C647BC78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 12:20:24 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id 5khfuawZP2zsA5khiuLkN8; Fri, 18 Apr 2025 14:20:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1744978824;
 bh=8k3JMAls+GQlxYkbc31pLWubjNcA+n4tKYL4qcb01q8=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=c3UDLAiNAdgLs93k5n13OjKXU1eQHkZjqRYCwDjFQw+hJZJbMhcK/Q2vEba2GECIH
 jQ4C6zqdYrmkkDi7pwNdezlK7smSs4yzSj1rTs0jMUS1Hxou6Y/0HwPKaZaDD73A+b
 ceSBDUulm6zB6g9E1tayiI2McCbCLGTPmREqzUbMjuGDpSyaoAs+eP4siDFK/np4iO
 pO7elE6u7+2f6Z8aBd7joo7wnH7Ha/asmqLEpKSoc6srKHVRvf4O1w3zfjIO41idG9
 cV54wdfcI8N85nLHUdhjYiwCKTWOpeDBydRNIYb4BVMFZIoJS8plNeBAYMrDqyV0se
 dsZp2sO0Ms/CQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 18 Apr 2025 14:20:24 +0200
X-ME-IP: 90.11.132.44
Message-ID: <e148faa8-6ee0-45bd-8cd8-37ea42a1de2a@wanadoo.fr>
Date: Fri, 18 Apr 2025 14:20:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: quic_msavaliy@quicinc.com
References: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
 <72f49447-5c99-4028-90cf-3f5cc11e8b53@quicinc.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <72f49447-5c99-4028-90cf-3f5cc11e8b53@quicinc.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, christophe.jaillet@wanadoo.fr, mcoquelin.stm32@gmail.com,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-ospi: Fix an error handling
 path in stm32_ospi_probe()
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

TGUgMTgvMDQvMjAyNSDDoCAxNDowOSwgTXVrZXNoIEt1bWFyIFNhdmFsaXlhIGEgw6ljcml0wqA6
Cj4gCj4gCj4gT24gNC8xOC8yMDI1IDQ6NTcgUE0sIENocmlzdG9waGUgSkFJTExFVCB3cm90ZToK
PiBbLi4uXQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXN0bTMyLW9zcGkuYyBiL2Ry
aXZlcnMvc3BpL3NwaS1zdG0zMi1vc3BpLmMKPj4gaW5kZXggNjY4MDIyMDk4YjFlLi45ZWM5ODIz
NDA5Y2MgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi1vc3BpLmMKPj4gKysr
IGIvZHJpdmVycy9zcGkvc3BpLXN0bTMyLW9zcGkuYwo+PiBAQCAtOTYwLDYgKzk2MCwxMCBAQCBz
dGF0aWMgaW50IHN0bTMyX29zcGlfcHJvYmUoc3RydWN0IAo+PiBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4+IMKgIGVycl9wbV9lbmFibGU6Cj4+IMKgwqDCoMKgwqAgcG1fcnVudGltZV9mb3JjZV9z
dXNwZW5kKG9zcGktPmRldik7Cj4+IMKgwqDCoMKgwqAgbXV0ZXhfZGVzdHJveSgmb3NwaS0+bG9j
ayk7Cj4+ICvCoMKgwqAgaWYgKG9zcGktPmRtYV9jaHR4KQo+PiArwqDCoMKgwqDCoMKgwqAgZG1h
X3JlbGVhc2VfY2hhbm5lbChvc3BpLT5kbWFfY2h0eCk7Cj4gd2h5IGNhbid0IHlvdSBtb3ZlIHRv
IGRldm1fZG1hX3JlcXVlc3RfY2hhbiA/IE5vIG5lZWQgdG8gY2xlYW51cC4KClVubGVzcyBJIG1p
c3Mgc29tZXRoaW5nIG9idmlvdXMsIHRoaXMgZnVuY3Rpb24gZG9lcyBub3QgZXhpc3QuCgpDSgoK
Pj4gK8KgwqDCoCBpZiAob3NwaS0+ZG1hX2NocngpCj4+ICvCoMKgwqDCoMKgwqDCoCBkbWFfcmVs
ZWFzZV9jaGFubmVsKG9zcGktPmRtYV9jaHJ4KTsKPj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+
PiDCoCB9Cj4gCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
