Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2AA79CA14
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 10:35:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 591C0C6B46F;
	Tue, 12 Sep 2023 08:35:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5174CC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 08:35:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC18C6163E;
 Tue, 12 Sep 2023 08:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61821C433C9;
 Tue, 12 Sep 2023 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694507713;
 bh=kNlewa3yEJmphIOpPB7B1g/AA9EWzeGvAITRxrDFzeY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nmKX93rdLncAS3a8Dk1FhPWhoocfn4ar1ps2ikGOwfciw1WvSW7sad6fCbg7Udkj6
 mDh/BkMpWlM/MJoNccj56NmfW5U/fgYCZUEcTENrTBgBtit4VzGzGUuIZ5v0z8ObHy
 Ghl5o7iMB3VZYL+ZLUryR4pWDYStnRfnD1TdHpNar+6RVcvwNE6otgpB8IRrX2ZZdU
 lkKXKg/KPrvq+URXpujmKkgsyF+TdMFBPWa2nmfOAbQhMmnIl7j8y7zzI8JGuc/Bys
 In2DcClRuRJWvu5AwhmjHWUWRgj063x1ORkXZ/4r5QI9idygD6anZdz4V8VW7OLSQa
 //7qtQWczNnQg==
Date: Tue, 12 Sep 2023 16:23:16 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZQAf9ArWfRkY/yPR@xhacker>
References: <20230717160630.1892-1-jszhang@kernel.org>
 <20230717160630.1892-3-jszhang@kernel.org>
 <20230911171102.cwieugrpthm7ywbm@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230911171102.cwieugrpthm7ywbm@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [REGRESSION] [PATCH net-next v5 2/2] net: stmmac:
 use per-queue 64 bit statistics where necessary
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

T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMDc6MTE6MDJQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gdGhpcyBwYXRjaCBiZWNhbWUgY29tbWl0IDEzMzQ2NmMz
YmJlMTcxZjgyNjI5NDE2MWRiMjAzZjc2NzBiYjMwYzggYW5kIGlzCj4gcGFydCBvZiB2Ni42LXJj
MS4KPiAKPiBPbiBteSBhcm0vc3RtMzJtcDE1NyBiYXNlZCBtYWNoaW5lIHVzaW5nIE5GUyByb290
IHRoaXMgY29tbWl0IG1ha2VzIHRoZQo+IGZvbGxvd2luZyBhcHBlYXIgaW4gdGhlIGtlcm5lbCBs
b2c6Cj4gCj4gCUlORk86IHRyeWluZyB0byByZWdpc3RlciBub24tc3RhdGljIGtleS4KPiAJVGhl
IGNvZGUgaXMgZmluZSBidXQgbmVlZHMgbG9ja2RlcCBhbm5vdGF0aW9uLCBvciBtYXliZQo+IAl5
b3UgZGlkbid0IGluaXRpYWxpemUgdGhpcyBvYmplY3QgYmVmb3JlIHVzZT8KPiAJdHVybmluZyBv
ZmYgdGhlIGxvY2tpbmcgY29ycmVjdG5lc3MgdmFsaWRhdG9yLgo+IAlDUFU6IDAgUElEOiAxIENv
bW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA2LjUuMC1yYzEtMDA0NDktZzEzMzQ2NmMzYmJlMS1k
aXJ0eSAjMjEKCkhpLAoKV2hpY2gga2VybmVsIHZlcnNpb24gYXJlIHlvdSB1c2luZz8gVGhlIGxh
dGVzdCBsaW51cyB0cmVlPyBCdXQgd2h5IGhlcmUKc2F5IDYuNS4wLXJjMT8KClRoYW5rcwo+IAlI
YXJkd2FyZSBuYW1lOiBTVE0zMiAoRGV2aWNlIFRyZWUgU3VwcG9ydCkKPiAJIHVud2luZF9iYWNr
dHJhY2UgZnJvbSBzaG93X3N0YWNrKzB4MTgvMHgxYwo+IAkgc2hvd19zdGFjayBmcm9tIGR1bXBf
c3RhY2tfbHZsKzB4NjAvMHg5MAo+IAkgZHVtcF9zdGFja19sdmwgZnJvbSByZWdpc3Rlcl9sb2Nr
X2NsYXNzKzB4OThjLzB4OTljCj4gCSByZWdpc3Rlcl9sb2NrX2NsYXNzIGZyb20gX19sb2NrX2Fj
cXVpcmUrMHg3NC8weDI5M2MKPiAJIF9fbG9ja19hY3F1aXJlIGZyb20gbG9ja19hY3F1aXJlKzB4
MTM0LzB4Mzk4Cj4gCSBsb2NrX2FjcXVpcmUgZnJvbSBzdG1tYWNfZ2V0X3N0YXRzNjQrMHgyYWMv
MHgyZmMKPiAJIHN0bW1hY19nZXRfc3RhdHM2NCBmcm9tIGRldl9nZXRfc3RhdHMrMHg0NC8weDEz
MAo+IAkgZGV2X2dldF9zdGF0cyBmcm9tIHJ0bmxfZmlsbF9zdGF0cysweDM4LzB4MTIwCj4gCSBy
dG5sX2ZpbGxfc3RhdHMgZnJvbSBydG5sX2ZpbGxfaWZpbmZvKzB4ODM0LzB4MTdmNAo+IAkgcnRu
bF9maWxsX2lmaW5mbyBmcm9tIHJ0bXNnX2lmaW5mb19idWlsZF9za2IrMHhjMC8weDE0NAo+IAkg
cnRtc2dfaWZpbmZvX2J1aWxkX3NrYiBmcm9tIHJ0bXNnX2lmaW5mbysweDUwLzB4ODgKPiAJIHJ0
bXNnX2lmaW5mbyBmcm9tIF9fZGV2X25vdGlmeV9mbGFncysweGMwLzB4ZWMKPiAJIF9fZGV2X25v
dGlmeV9mbGFncyBmcm9tIGRldl9jaGFuZ2VfZmxhZ3MrMHg1MC8weDVjCj4gCSBkZXZfY2hhbmdl
X2ZsYWdzIGZyb20gaXBfYXV0b19jb25maWcrMHgyZjQvMHgxMjYwCj4gCSBpcF9hdXRvX2NvbmZp
ZyBmcm9tIGRvX29uZV9pbml0Y2FsbCsweDcwLzB4MzVjCj4gCSBkb19vbmVfaW5pdGNhbGwgZnJv
bSBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDJhYy8weDMwOAo+IAkga2VybmVsX2luaXRfZnJlZWFi
bGUgZnJvbSBrZXJuZWxfaW5pdCsweDFjLzB4MTM4Cj4gCSBrZXJuZWxfaW5pdCBmcm9tIHJldF9m
cm9tX2ZvcmsrMHgxNC8weDJjCj4gCUV4Y2VwdGlvbiBzdGFjaygweGUwODE1ZmIwIHRvIDB4ZTA4
MTVmZjgpCj4gCTVmYTA6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAwMDAw
MDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwCj4gCTVmYzA6IDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwCj4g
CTVmZTA6IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDEzIDAwMDAw
MDAwCj4gCWR3YzIgNDkwMDAwMDAudXNiLW90ZzogbmV3IGRldmljZSBpcyBoaWdoLXNwZWVkCj4g
Cj4gSSBkaWRuJ3QgdHJ5IHVuZGVyc3RhbmQgdGhpcyBwcm9ibGVtLCBpdCdzIHRvbyBjbG9zZSB0
byBxdWl0dGluZyB0aW1lCj4gOi0pCj4gCj4gQmVzdCByZWdhcmRzCj4gVXdlCj4gCj4gLS0gCj4g
UGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgVXdlIEtsZWluZS1L
w7ZuaWcgICAgICAgICAgICB8Cj4gSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAg
ICAgICAgIHwgaHR0cHM6Ly93d3cucGVuZ3V0cm9uaXguZGUvIHwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
