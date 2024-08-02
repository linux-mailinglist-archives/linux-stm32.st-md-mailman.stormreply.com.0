Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B70C39465FD
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Aug 2024 00:48:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 708D0C7129D;
	Fri,  2 Aug 2024 22:48:42 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8791AC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 22:48:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 472DCCE1AC7;
 Fri,  2 Aug 2024 22:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFB9C32782;
 Fri,  2 Aug 2024 22:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722638912;
 bh=u1OvSoK1rFbwNdxFMjcrpR4gd5lDO5xx65Jvjp77uVU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qmhwDZJGgTnu1+dpNZRrJeHfPTNenRtIC8SNAzseHLplj1qdOKt0FQZPQGlT15c8V
 8pj46mhNxENKcPsgA2mAz+0amh7io/z3VkHcuOMgN5xsaOeBWnYR3cgRswuh1IxzOK
 twMOW7zE2Bu1GrvvPya+EDlXdGALAdr23yxnCeB8yd/L085d9++zzqzU2gOd9rViso
 gWXEnKjXWao4MW1TpXUYsQzllc7Utkk30HZDwEHxg1rdP1VZ2ssK3b7scVBtTPHy2o
 zbELD7LwlL5KYu4zqdADVyBwlFIwYWdL5CQfE782dbdpLlfopUz0xfan84SMNvOlcr
 axu/1/O1tosjg==
Date: Fri, 2 Aug 2024 15:48:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20240802154830.7b147f75@kernel.org>
In-Reply-To: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC v3 0/14] net: stmmac: convert stmmac
 "pcs" to phylink
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

T24gRnJpLCAyIEF1ZyAyMDI0IDExOjQ1OjIxICswMTAwIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3
cm90ZToKPiBTdWJqZWN0OiBbUEFUQ0ggUkZDIHYzIDAvMTRdIG5ldDogc3RtbWFjOiBjb252ZXJ0
IHN0bW1hYyAicGNzIiB0byBwaHlsaW5rCgp3ZSBoYXZlIGEgYnVpbGQgZXJyb3IgaGVyZSBpbnNp
ZGUgdGhlIHRhc3R5IGxheWVyZWQgY2FrZSB0aGF0IGlzIHRoZSBvcApoYW5kbGluZyBpbiB0aGlz
IGRyaXZlciAoZnJvbSBwYXRjaCAyIHRvIDEzLCBpbmNsdXNpdmUpOgoKSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2NvbW1vbi5oOjI2LAog
ICAgICAgICAgICAgICAgIGZyb20gZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
c3RtbWFjLmg6MjAsCiAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfZXRodG9vbC5jOjE5Ogpkcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfZXRodG9vbC5jOiBJbiBmdW5jdGlvbiDigJhzdG1tYWNfZXRo
dG9vbF9zZXRfbGlua19rc2V0dGluZ3PigJk6CmRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2h3aWYuaDoxNToxNzogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBmdW5jdGlv
biDigJhwcml2LT5ody0+bWFjLT5wY3NfY3RybF9hbmXigJkKICAgMTUgfCAgICAgICAgICAgICAg
ICAgKF9fcHJpdiktPmh3LT5fX21vZHVsZS0+X19jbmFtZSgoX19hcmcwKSwgIyNfX2FyZ3MpOyBc
CiAgICAgIHwgICAgICAgICAgICAgICAgIF4KZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvaHdpZi5oOjQ4NTo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYc3RtbWFj
X2RvX3ZvaWRfY2FsbGJhY2vigJkKICA0ODUgfCAgICAgICAgIHN0bW1hY19kb192b2lkX2NhbGxi
YWNrKF9fcHJpdiwgbWFjLCBwY3NfY3RybF9hbmUsIF9fcHJpdiwgX19hcmdzKQogICAgICB8ICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX2V0aHRvb2wuYzo0MTk6MTc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyDigJhzdG1tYWNfcGNzX2N0cmxfYW5l4oCZCiAgNDE5IHwgICAgICAgICAgICAgICAgIHN0
bW1hY19wY3NfY3RybF9hbmUocHJpdiwgcHJpdi0+aW9hZGRyLCAxLCBwcml2LT5ody0+cHMsIDAp
OwogICAgICB8ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
