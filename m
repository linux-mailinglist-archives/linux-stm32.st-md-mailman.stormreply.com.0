Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 620A18BBC6A
	for <lists+linux-stm32@lfdr.de>; Sat,  4 May 2024 16:28:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8F3BC6B45B;
	Sat,  4 May 2024 14:28:03 +0000 (UTC)
Received: from msa.smtpout.orange.fr (smtp-81.smtpout.orange.fr [80.12.242.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66AC4C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 May 2024 14:27:57 +0000 (UTC)
Received: from [192.168.1.37] ([86.243.17.157]) by smtp.orange.fr with ESMTPA
 id 3GMjsEyZGuPiV3GMks2HSj; Sat, 04 May 2024 16:27:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1714832877;
 bh=RqYKhXyxQzsUalkpz50XF6z0vFeF3FJ712ZCIzLOHG8=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=O+Cinq1GHFo+jJb97aeSNFRGj+H8OP8dSpV1RTewlr5gqGFWj53U9nVBYsLVvR17A
 aYOjbdrUmOsjkOoDotHQUmjYU3Eau+pmDq17bSYJHRJRtJKFy3jcUsqF5RNTc+ZJeM
 rgb6nt8YEfd/qknPKkLPGrOD5NrrNPFxuOilOnYZLx3kSn4yul/Is530EWIv8UT3kP
 Inj4NRv0/vpB9qdqvD8hZaqfWayVMZrgYvbkcl1rFOeW/C+5XlBThL2EIySkOokDiB
 3e46zWAq8OYdwC9URU18DTDrq2QVY+0Eyy0ldIVJhJilnkdSjyNoayU+kJMW/F+bao
 beI882/ZtHiMg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 04 May 2024 16:27:57 +0200
X-ME-IP: 86.243.17.157
Message-ID: <38193848-597d-47c1-9aea-5357e58f9983@wanadoo.fr>
Date: Sat, 4 May 2024 16:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: amelie.delaunay@foss.st.com
References: <20240423123302.1550592-1-amelie.delaunay@foss.st.com>
 <20240423123302.1550592-6-amelie.delaunay@foss.st.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240423123302.1550592-6-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/12] dmaengine: Add STM32 DMA3 support
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

TGUgMjMvMDQvMjAyNCDDoCAxNDozMiwgQW1lbGllIERlbGF1bmF5IGEgw6ljcml0wqA6Cj4gU1RN
MzIgRE1BMyBkcml2ZXIgc3VwcG9ydHMgdGhlIDMgaGFyZHdhcmUgY29uZmlndXJhdGlvbnMgb2Yg
dGhlIFNUTTMyIERNQTMKPiBjb250cm9sbGVyOgo+IC0gTFBETUEgKExvdyBQb3dlcik6IDQgY2hh
bm5lbHMsIG5vIEZJRk8KPiAtIEdQRE1BIChHZW5lcmFsIFB1cnBvc2UpOiAxNiBjaGFubmVscywg
RklGTyBmcm9tIDggdG8gMzIgYnl0ZXMKPiAtIEhQRE1BIChIaWdoIFBlcmZvcm1hbmNlKTogMTYg
Y2hhbm5lbHMsIEZJRk8gZnJvbSA4IHRvIDI1NiBieXRlcwo+IEhhcmR3YXJlIGNvbmZpZ3VyYXRp
b24gb2YgdGhlIGNoYW5uZWxzIGlzIHJldHJpZXZlZCBmcm9tIHRoZSBoYXJkd2FyZQo+IGNvbmZp
Z3VyYXRpb24gcmVnaXN0ZXJzLgo+IFRoZSBjbGllbnQgY2FuIHNwZWNpZnkgaXRzIGNoYW5uZWwg
cmVxdWlyZW1lbnRzIHRocm91Z2ggZGV2aWNlIHRyZWUuCj4gU1RNMzIgRE1BMyBjaGFubmVscyBj
YW4gYmUgaW5kaXZpZHVhbGx5IHJlc2VydmVkIGVpdGhlciBiZWNhdXNlIHRoZXkgYXJlCj4gc2Vj
dXJlLCBvciBkZWRpY2F0ZWQgdG8gYW5vdGhlciBDUFUuCj4gSW5kZWVkLCBjaGFubmVscyBhdmFp
bGFiaWxpdHkgZGVwZW5kcyBvbiBSZXNvdXJjZSBJc29sYXRpb24gRnJhbWV3b3JrCj4gKFJJRikg
Y29uZmlndXJhdGlvbi4gUklGIGdyYW50cyBhY2Nlc3MgdG8gYnVzZXMgd2l0aCBDb21wYXJ0aW1l
bnQgSUQKPiAoQ0lGKSBmaWx0ZXJpbmcsIHNlY3VyZSBhbmQgcHJpdmlsZWdlIGxldmVsLiBJdCBh
bHNvIGFzc2lnbnMgRE1BIGNoYW5uZWxzCj4gdG8gb25lIG9yIHNldmVyYWwgcHJvY2Vzc29ycy4K
PiBETUEgY2hhbm5lbHMgdXNlZCBieSBMaW51eCBzaG91bGQgYmUgQ0lELWZpbHRlcmVkIGFuZCBz
dGF0aWNhbGx5IGFzc2lnbmVkCj4gdG8gQ0lEMSBvciBzaGFyZWQgd2l0aCBvdGhlciBDUFVzIGJ1
dCB1c2luZyBzZW1hcGhvcmUuIEluIGNhc2UgQ0lECj4gZmlsdGVyaW5nIGlzIG5vdCBjb25maWd1
cmVkLCBkbWEtY2hhbm5lbC1tYXNrIHByb3BlcnR5IGNhbiBiZSB1c2VkIHRvCj4gc3BlY2lmeSBh
dmFpbGFibGUgRE1BIGNoYW5uZWxzIHRvIHRoZSBrZXJuZWwsIG90aGVyd2lzZSBzdWNoIGNoYW5u
ZWxzCj4gd2lsbCBiZSBtYXJrZWQgYXMgcmVzZXJ2ZWQgYW5kIGNhbid0IGJlIHVzZWQgYnkgTGlu
dXguCj4gCj4gU2lnbmVkLW9mZi1ieTogQW1lbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXkt
cmowSWVsL0pSNE5CRGdqSzd5N1RVUUBwdWJsaWMuZ21hbmUub3JnPgo+IC0tLQoKLi4uCgo+ICsJ
cG1fcnVudGltZV9zZXRfYWN0aXZlKCZwZGV2LT5kZXYpOwo+ICsJcG1fcnVudGltZV9lbmFibGUo
JnBkZXYtPmRldik7Cj4gKwlwbV9ydW50aW1lX2dldF9ub3Jlc3VtZSgmcGRldi0+ZGV2KTsKPiAr
CXBtX3J1bnRpbWVfcHV0KCZwZGV2LT5kZXYpOwo+ICsKPiArCWRldl9pbmZvKCZwZGV2LT5kZXYs
ICJTVE0zMiBETUEzIHJlZ2lzdGVyZWQgcmV2OiVsdS4lbHVcbiIsCj4gKwkJIEZJRUxEX0dFVChW
RVJSX01BSlJFViwgdmVyciksIEZJRUxEX0dFVChWRVJSX01JTlJFViwgdmVycikpOwo+ICsKPiAr
CXJldHVybiAwOwo+ICsKPiArZXJyX2Nsa19kaXNhYmxlOgo+ICsJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGRkYXRhLT5jbGspOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gK3N0YXRpYyB2
b2lkIHN0bTMyX2RtYTNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gK3sK
PiArCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKCkhpLAoKbWlzc2luZyBjbGtfZGlz
YWJsZV91bnByZXBhcmUoZGRhdGEtPmNsayk7PwoKYXMgaW4gdGhlIGVycm9yIGhhbmRsaW5nIHBh
dGggb24gdGhlIHByb2JlIGp1c3QgYWJvdmU/CgpDSgoKPiArfQoKLi4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
