Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8FB6DB867
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Apr 2023 04:57:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27269C6B44C;
	Sat,  8 Apr 2023 02:57:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23C72C6B447
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 02:57:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C956561224;
 Sat,  8 Apr 2023 02:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A94C433D2;
 Sat,  8 Apr 2023 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680922652;
 bh=iP8ZWnwE0T7PXtn7EQ51ZN7kOpLNp41+kNEFR32XrEA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qO4e+GkE8r2CQ7Z32n0cj8YH9qsjSTGzwi7wxYdiZFkYbAimRaCN+8tr1y32nqWIa
 HFXrH99fE2PF/+56nZxSk1CZNIrSKhOjoSvkDKsAmdPQDq6X0Ei1GT+N+CpJKCGySY
 ZpZRMFHO0AHi7GTb61W3zBM8AQLmWitf8+Ng1//9UoGi6BR8oq6IaVBDkP61PLKpgS
 w0cw4v/u5sXRHoFmQFJ7yctI6C3N5co7KRIEfnZpRVjJ+YaNlXDxvdMpF3xdWNkcx7
 JA+jb4QLCqd77cQLykn6JFJo5h+tGa/ojKjiVMUx1kjrhL+CO5KuMZFNqbA8MK3ayF
 MUZWcd/ZMe89w==
Date: Fri, 7 Apr 2023 19:57:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: louts <rocklouts@sina.com>
Message-ID: <20230407195730.298867dd@kernel.org>
In-Reply-To: <20230406100437.5402-1-rocklouts@sina.com>
References: <20230406100437.5402-1-rocklouts@sina.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix system hang when setting
 up standalone tag_8021q VLAN for DSA ports
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

T24gVGh1LCAgNiBBcHIgMjAyMyAxODowNDozNyArMDgwMCBsb3V0cyB3cm90ZToKPiBUaGUgc3lz
dGVtIGhhbmcgYmVjYXVzZSBvZiBkc2FfdGFnXzgwMjFxX3BvcnRfc2V0dXAoKSBjYWxsYmNhawo+
IHN0bW1hY192bGFuX3J4X2FkZF92aWQoKS5JIGZvdW5kIGluIHN0bW1hY19kcnZfcHJvYmUoKSB0
aGF0Cj4gY2FpbGluZyBwbV9ydW50aW1lX3B1dCgpIGRpc2FibGVkIHRoZSBjbG9jayB3aGVuIGNo
ZWNrIHRoZSBzdG1tYWMKPiBkaXJ2ZXIuCj4gCj4gRmlyc3QsIHdoZW4gdGhlIGtlcm5lbCBpcyBj
b21waWxlZCB3aXRoIENPTkZJR19QTT15LFRoZSBzdG1tYWMncwo+IHJlc3VtZS9zdXNwZW5kIGlz
IGFjdGl2ZS4KPiAKPiBTZWNvbmRseSxzdG1tYWMgYXMgRFNBIG1hc3Rlcix0aGUgZHNhX3RhZ184
MDIxcV9wb3J0X3NldHVwKCkgZnVuY3Rpb24KPiB3aWxsIGNhbGxiYWNrIHN0bW1hY192bGFuX3J4
X2FkZF92aWQgd2hlbiBEU0EgZGlydmVyIHN0YXJ0cy4gSG93ZXZlciwKPiBUaGUgc3lzdGVtIGlz
IGhhbmdlZCBmb3IgdGhlIHN0bW1hY192bGFuX3J4X2FkZF92aWQoKSAgYWNjZXNzZXMgaXRzCj4g
cmVnaXN0ZXJzIGFmdGVyIHN0bW1hYydzIGNsb2NrIGlzIGNsb3NlZC4KPiAKPiBJIHdvdWxkIHN1
Z2dlc3QgYWRkaW5nIHRoZSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgdG8gdGhlCj4gc3Rt
bWFjX3ZsYW5fcnhfYWRkX3ZpZCgpLlRoaXMgZ3VhcmFudGVlcyB0aGF0IHJlc3VtaW5nIGNsb2Nr
IG91dHB1dAo+IHdoaWxlIGluIHVzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBsb3V0cyA8cm9ja2xv
dXRzQHNpbmEuY29tPgoKSXMgdGhhdCB5b3VyIGZ1bGwgbmFtZT8gSWYgeW91ciBuYW1lIGlzIG5v
dCBpbiB0aGUgTGF0aW4gYWxwaGFiZXQKZmVlbCBmcmVlIHRvIHB1dCBpdCBpbiBicmFja2V0cyBh
ZnRlciB0aGUgTGF0aW4gdmVyc2lvbiwgZS5nLjoKClNpZ25lZC1vZmYtYnk6IEpvaG4gKNGP0LrQ
tdGB0Ywg0ZbQvCfRjykgPGpvaG5AYmxhLmFiYz4KCj4gQEAgLTYxOTgsMTYgKzYyMDIsMTkgQEAg
c3RhdGljIGludCBzdG1tYWNfdmxhbl9yeF9hZGRfdmlkKHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2
LCBfX2JlMTYgcHJvdG8sIHUxNiB2aWQKPiAgCXJldCA9IHN0bW1hY192bGFuX3VwZGF0ZShwcml2
LCBpc19kb3VibGUpOwo+ICAJaWYgKHJldCkgewo+ICAJCWNsZWFyX2JpdCh2aWQsIHByaXYtPmFj
dGl2ZV92bGFucyk7Cj4gLQkJcmV0dXJuIHJldDsKPiArCQlnb3RvIHVwZGF0ZV92bGFuX2Vycm9y
Owo+ICAJfQo+ICAKPiAgCWlmIChwcml2LT5ody0+bnVtX3ZsYW4pIHsKPiAgCQlyZXQgPSBzdG1t
YWNfYWRkX2h3X3ZsYW5fcnhfZmx0cihwcml2LCBuZGV2LCBwcml2LT5odywgcHJvdG8sIHZpZCk7
Cj4gIAkJaWYgKHJldCkKPiAtCQkJcmV0dXJuIHJldDsKPiArCQkJZ290byBhZGRfdmxhbl9lcnJv
cjsKPiAgCX0KPiArdXBkYXRlX3ZsYW5fZXJyb3I6Cj4gK2FkZF92bGFuX2Vycm9yOgoKTmFtZSB0
aGUgbGFiZWxzIGFmdGVyIHRoZSB0YXJnZXQgcGxlYXNlLgoKZXJyX3BtX3B1dDoKCj4gKwlwbV9y
dW50aW1lX3B1dChwcml2LT5kZXZpY2UpOwo+ICAKPiAtCXJldHVybiAwOwo+ICsJcmV0dXJuIHJl
dDsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
