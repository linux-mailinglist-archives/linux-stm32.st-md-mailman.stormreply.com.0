Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 696FA268571
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Sep 2020 09:04:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11FDBC3FAE1;
	Mon, 14 Sep 2020 07:04:51 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06DA3C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Sep 2020 07:04:47 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R391e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=30; SR=0;
 TI=SMTPD_---0U8qdePo_1600067075; 
Received: from B-455UMD6M-2027.local(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U8qdePo_1600067075) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 14 Sep 2020 15:04:37 +0800
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20200903131242.128665-1-tianjia.zhang@linux.alibaba.com>
 <20200911042442.GA5420@gondor.apana.org.au>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <be5f7e28-5645-3923-ceb5-d840e41ad2ed@linux.alibaba.com>
Date: Mon, 14 Sep 2020 15:04:35 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200911042442.GA5420@gondor.apana.org.au>
Content-Language: en-US
Cc: Stephan Mueller <smueller@chronox.de>,
 Brendan Higgins <brendanhiggins@google.com>,
 Jia Zhang <zhang.jia@linux.alibaba.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Vitaly Chikunov <vt@altlinux.org>, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Marcelo Henrique Cerri <marcelo.cerri@canonical.com>,
 Waiman Long <longman@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Gilad Ben-Yossef <gilad@benyossef.com>,
 Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 linux-arm-kernel@lists.infradead.org, David Howells <dhowells@redhat.com>,
 Pascal van Leeuwen <pvanleeuwen@rambus.com>, linux-kernel@vger.kernel.org,
 Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v6 0/8] crpyto: introduce OSCCA
 certificate and SM2 asymmetric algorithm
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

SGnvvIwKCk9uIDkvMTEvMjAgMTI6MjQgUE0sIEhlcmJlcnQgWHUgd3JvdGU6Cj4gT24gVGh1LCBT
ZXAgMDMsIDIwMjAgYXQgMDk6MTI6MzRQTSArMDgwMCwgVGlhbmppYSBaaGFuZyB3cm90ZToKPj4K
Pj4gLS0tCj4+IHY2IGNoYW5nZXM6Cj4+ICAgIDEuIHJlbW92ZSBtcGlfc3ViX3VpIGZ1bmN0aW9u
IGZyb20gbXBpIGxpYnJhcnkuCj4+ICAgIDIuIHJlYmFzZSBvbiBtYWlubGluZS4KPiAKPiBUaGlz
IHNlcmllcyBpcyBzdGlsbCBtaXNzaW5nIGFja3MgZm9yIHBhdGNoZXMgNi04LiAgV2l0aG91dCB0
aGVtCj4gaXQgY2Fubm90IHByb2NlZWQuCj4gCj4gVGhhbmtzLAo+IAoKVGhpcyBzZXJpZXMgaGFz
IHNvbWUgcmV2aWV3IHN1Z2dlc3Rpb25zIGZvciBwYXRjaGVzIDYtOCwgYnV0IHRoZSAKbWFpbnRh
aW5lciBvZiBhc3ltbWV0cmljIGtleXMgRGF2aWQgSG93ZWxscyA8ZGhvd2VsbHNAcmVkaGF0LmNv
bT4sIEkgCmNhbuKAmXQgZ2V0IGluIHRvdWNoLiBUaGUgZW1haWwgaGFzIGJlZW4gc2VudCBzdWNj
ZXNzZnVsbHkuIENhbiB5b3UgaGVscCAKcGluZyBoaW0gPwoKVGhhbmtzIGFuZCBiZXN0LApUaWFu
amlhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
