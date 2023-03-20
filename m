Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD6B6C0EF6
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 11:35:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8A5EC6A5EF;
	Mon, 20 Mar 2023 10:35:06 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F64CC6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 10:35:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98E4EB80DF4;
 Mon, 20 Mar 2023 10:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348B5C433EF;
 Mon, 20 Mar 2023 10:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679308504;
 bh=M/wWyAoTmx9mB/cTEjucMK8opbUBCDiaoVYvdKCtM00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ug4MGKB5x6BjiRYYC4VzrvoxvY/oDRwFjN2VLdzI5TBwlSfpiMayNt3lfjtPibAHu
 St7oiHUW9MjFsGWKPzLGvkvvUZqr8LOyeFgbzc19GlegmF6RIPsYIgGp3bTH5Q8xbI
 n7QyKIU3IjeRQwkowbrl/zEVnMX59V2xCugTCcAfq5tKdRQBJjp7lWTJET6pIfxMzH
 De+CtrWrTv4duxBvCTvGLvc2V1yU0OKYCkVIuUYnQkuAxg1YiezlnRyCdqXOo3KJWx
 C9ffVaU5Fppad0dttD16qvp+PBUE7PpEdPBO9Xp6YD6Bux3Yej/BZmKW9RY8T6CaBL
 AWpIEJI+3iQUQ==
Date: Mon, 20 Mar 2023 16:04:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20230320103452.GD4564@thinkpad>
References: <20230316-immutable-chips-2-v1-0-053d6ede831b@linaro.org>
 <20230316-immutable-chips-2-v1-1-053d6ede831b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230316-immutable-chips-2-v1-1-053d6ede831b@linaro.org>
Cc: linux-kernel@vger.kernel.org, Srinivas Neeli <srinivas.neeli@xilinx.com>,
 Robert Richter <rric@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 Ray Jui <rjui@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-gpio@vger.kernel.org,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Marc Zyngier <maz@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/9] gpio: rda: Convert to immutable
	irq_chip
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

T24gTW9uLCBNYXIgMjAsIDIwMjMgYXQgMTA6NTU6MDhBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBDb252ZXJ0IHRoZSBkcml2ZXIgdG8gaW1tdXRhYmxlIGlycS1jaGlwIHdpdGggYSBi
aXQgb2YKPiBpbnR1aXRpb24uCj4gCj4gQ2M6IE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+
Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3Jn
PgoKQWNrZWQtYnk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgoKVGhh
bmtzLApNYW5pCgo+IC0tLQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby1yZGEuYyB8IDIyICsrKysrKysr
KysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLXJkYS5jIGIvZHJp
dmVycy9ncGlvL2dwaW8tcmRhLmMKPiBpbmRleCA2MmJhMThiM2E2MDIuLmRkNTY4OTA3ZDM4OSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1yZGEuYwo+ICsrKyBiL2RyaXZlcnMvZ3Bp
by9ncGlvLXJkYS5jCj4gQEAgLTM4LDcgKzM4LDYgQEAgc3RydWN0IHJkYV9ncGlvIHsKPiAgCXN0
cnVjdCBncGlvX2NoaXAgY2hpcDsKPiAgCXZvaWQgX19pb21lbSAqYmFzZTsKPiAgCXNwaW5sb2Nr
X3QgbG9jazsKPiAtCXN0cnVjdCBpcnFfY2hpcCBpcnFfY2hpcDsKPiAgCWludCBpcnE7Cj4gIH07
Cj4gIAo+IEBAIC03NCw2ICs3Myw3IEBAIHN0YXRpYyB2b2lkIHJkYV9ncGlvX2lycV9tYXNrKHN0
cnVjdCBpcnFfZGF0YSAqZGF0YSkKPiAgCXZhbHVlIHw9IEJJVChvZmZzZXQpIDw8IFJEQV9HUElP
X0lSUV9GQUxMX1NISUZUOwo+ICAKPiAgCXdyaXRlbF9yZWxheGVkKHZhbHVlLCBiYXNlICsgUkRB
X0dQSU9fSU5UX0NUUkxfQ0xSKTsKPiArCWdwaW9jaGlwX2Rpc2FibGVfaXJxKGNoaXAsIG9mZnNl
dCk7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIHJkYV9ncGlvX2lycV9hY2soc3RydWN0IGlycV9k
YXRhICpkYXRhKQo+IEBAIC0xNTQsNiArMTU0LDcgQEAgc3RhdGljIHZvaWQgcmRhX2dwaW9faXJx
X3VubWFzayhzdHJ1Y3QgaXJxX2RhdGEgKmRhdGEpCj4gIAl1MzIgb2Zmc2V0ID0gaXJxZF90b19o
d2lycShkYXRhKTsKPiAgCXUzMiB0cmlnZ2VyID0gaXJxZF9nZXRfdHJpZ2dlcl90eXBlKGRhdGEp
Owo+ICAKPiArCWdwaW9jaGlwX2VuYWJsZV9pcnEoY2hpcCwgb2Zmc2V0KTsKPiAgCXJkYV9ncGlv
X3NldF9pcnEoY2hpcCwgb2Zmc2V0LCB0cmlnZ2VyKTsKPiAgfQo+ICAKPiBAQCAtMTk1LDYgKzE5
NiwxNiBAQCBzdGF0aWMgdm9pZCByZGFfZ3Bpb19pcnFfaGFuZGxlcihzdHJ1Y3QgaXJxX2Rlc2Mg
KmRlc2MpCj4gIAljaGFpbmVkX2lycV9leGl0KGljLCBkZXNjKTsKPiAgfQo+ICAKPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBpcnFfY2hpcCByZGFfZ3Bpb19pcnFfY2hpcCA9IHsKPiArCS5uYW1lID0g
InJkYS1ncGlvIiwKPiArCS5pcnFfYWNrID0gcmRhX2dwaW9faXJxX2FjaywKPiArCS5pcnFfbWFz
ayA9IHJkYV9ncGlvX2lycV9tYXNrLAo+ICsJLmlycV91bm1hc2sgPSByZGFfZ3Bpb19pcnFfdW5t
YXNrLAo+ICsJLmlycV9zZXRfdHlwZSA9IHJkYV9ncGlvX2lycV9zZXRfdHlwZSwKPiArCS5mbGFn
cyA9IElSUUNISVBfU0tJUF9TRVRfV0FLRSB8IElSUUNISVBfSU1NVVRBQkxFLAo+ICsJR1BJT0NI
SVBfSVJRX1JFU09VUkNFX0hFTFBFUlMsCj4gK307Cj4gKwo+ICBzdGF0aWMgaW50IHJkYV9ncGlv
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgCXN0cnVjdCBkZXZp
Y2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gQEAgLTI0MSwxNSArMjUyLDggQEAgc3RhdGljIGludCBy
ZGFfZ3Bpb19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJcmRhX2dwaW8t
PmNoaXAuYmFzZSA9IC0xOwo+ICAKPiAgCWlmIChyZGFfZ3Bpby0+aXJxID49IDApIHsKPiAtCQly
ZGFfZ3Bpby0+aXJxX2NoaXAubmFtZSA9ICJyZGEtZ3BpbyIsCj4gLQkJcmRhX2dwaW8tPmlycV9j
aGlwLmlycV9hY2sgPSByZGFfZ3Bpb19pcnFfYWNrLAo+IC0JCXJkYV9ncGlvLT5pcnFfY2hpcC5p
cnFfbWFzayA9IHJkYV9ncGlvX2lycV9tYXNrLAo+IC0JCXJkYV9ncGlvLT5pcnFfY2hpcC5pcnFf
dW5tYXNrID0gcmRhX2dwaW9faXJxX3VubWFzaywKPiAtCQlyZGFfZ3Bpby0+aXJxX2NoaXAuaXJx
X3NldF90eXBlID0gcmRhX2dwaW9faXJxX3NldF90eXBlLAo+IC0JCXJkYV9ncGlvLT5pcnFfY2hp
cC5mbGFncyA9IElSUUNISVBfU0tJUF9TRVRfV0FLRSwKPiAtCj4gIAkJZ2lycSA9ICZyZGFfZ3Bp
by0+Y2hpcC5pcnE7Cj4gLQkJZ2lycS0+Y2hpcCA9ICZyZGFfZ3Bpby0+aXJxX2NoaXA7Cj4gKwkJ
Z3Bpb19pcnFfY2hpcF9zZXRfY2hpcChnaXJxLCAmcmRhX2dwaW9faXJxX2NoaXApOwo+ICAJCWdp
cnEtPmhhbmRsZXIgPSBoYW5kbGVfYmFkX2lycTsKPiAgCQlnaXJxLT5kZWZhdWx0X3R5cGUgPSBJ
UlFfVFlQRV9OT05FOwo+ICAJCWdpcnEtPnBhcmVudF9oYW5kbGVyID0gcmRhX2dwaW9faXJxX2hh
bmRsZXI7Cj4gCj4gLS0gCj4gMi4zNC4xCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p
4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
