Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D6A79C96F
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 10:13:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DADBC6B46F;
	Tue, 12 Sep 2023 08:13:41 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E3EFC6B46E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 08:13:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 76526CE1A57;
 Tue, 12 Sep 2023 08:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6430DC433C8;
 Tue, 12 Sep 2023 08:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694506414;
 bh=jHqmw/CsOsU8hNk9mweTs2csj+HphLKzucu7Buu5sxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZzJh6b1zv9eNjzwLoDxfeKqgfhaC2zPqE2YVgwpS+EPLXhMOTYpnm8uaZb15XZGYy
 HORZ/er9UZFVIyZxqyJN7CIXpJ6teIaDntYJnBa558fKiciv79efmyZbGsLw9nFFBK
 l6E183fn0AKqvW6k2Xxj06yRLFnK7Dnn5gmye4V/uR26B1brbLIX2jqJS9HgPlJltQ
 Tn4usyNqeEnB/Bh4xnEA7cZcVeVlFKlikAyQ1gs0ldpA9hU/VwEyJ+T+OH9Lw7FoqE
 r1HNnUJXPQATydpGf2xkLlC5W15/SyeQnpuLHFLBTKbYArVN2oBzP+G+j0yUAVV3iB
 xsX9fT8xv7Rlg==
Date: Tue, 12 Sep 2023 16:01:35 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZQAa3277GC4c9W1D@xhacker>
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
aXJ0eSAjMjEKPiAJSGFyZHdhcmUgbmFtZTogU1RNMzIgKERldmljZSBUcmVlIFN1cHBvcnQpCj4g
CSB1bndpbmRfYmFja3RyYWNlIGZyb20gc2hvd19zdGFjaysweDE4LzB4MWMKPiAJIHNob3dfc3Rh
Y2sgZnJvbSBkdW1wX3N0YWNrX2x2bCsweDYwLzB4OTAKPiAJIGR1bXBfc3RhY2tfbHZsIGZyb20g
cmVnaXN0ZXJfbG9ja19jbGFzcysweDk4Yy8weDk5Ywo+IAkgcmVnaXN0ZXJfbG9ja19jbGFzcyBm
cm9tIF9fbG9ja19hY3F1aXJlKzB4NzQvMHgyOTNjCj4gCSBfX2xvY2tfYWNxdWlyZSBmcm9tIGxv
Y2tfYWNxdWlyZSsweDEzNC8weDM5OAo+IAkgbG9ja19hY3F1aXJlIGZyb20gc3RtbWFjX2dldF9z
dGF0czY0KzB4MmFjLzB4MmZjCj4gCSBzdG1tYWNfZ2V0X3N0YXRzNjQgZnJvbSBkZXZfZ2V0X3N0
YXRzKzB4NDQvMHgxMzAKPiAJIGRldl9nZXRfc3RhdHMgZnJvbSBydG5sX2ZpbGxfc3RhdHMrMHgz
OC8weDEyMAo+IAkgcnRubF9maWxsX3N0YXRzIGZyb20gcnRubF9maWxsX2lmaW5mbysweDgzNC8w
eDE3ZjQKPiAJIHJ0bmxfZmlsbF9pZmluZm8gZnJvbSBydG1zZ19pZmluZm9fYnVpbGRfc2tiKzB4
YzAvMHgxNDQKPiAJIHJ0bXNnX2lmaW5mb19idWlsZF9za2IgZnJvbSBydG1zZ19pZmluZm8rMHg1
MC8weDg4Cj4gCSBydG1zZ19pZmluZm8gZnJvbSBfX2Rldl9ub3RpZnlfZmxhZ3MrMHhjMC8weGVj
Cj4gCSBfX2Rldl9ub3RpZnlfZmxhZ3MgZnJvbSBkZXZfY2hhbmdlX2ZsYWdzKzB4NTAvMHg1Ywo+
IAkgZGV2X2NoYW5nZV9mbGFncyBmcm9tIGlwX2F1dG9fY29uZmlnKzB4MmY0LzB4MTI2MAo+IAkg
aXBfYXV0b19jb25maWcgZnJvbSBkb19vbmVfaW5pdGNhbGwrMHg3MC8weDM1Ywo+IAkgZG9fb25l
X2luaXRjYWxsIGZyb20ga2VybmVsX2luaXRfZnJlZWFibGUrMHgyYWMvMHgzMDgKPiAJIGtlcm5l
bF9pbml0X2ZyZWVhYmxlIGZyb20ga2VybmVsX2luaXQrMHgxYy8weDEzOAo+IAkga2VybmVsX2lu
aXQgZnJvbSByZXRfZnJvbV9mb3JrKzB4MTQvMHgyYwo+IAlFeGNlcHRpb24gc3RhY2soMHhlMDgx
NWZiMCB0byAweGUwODE1ZmY4KQo+IAk1ZmEwOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMAo+IAk1ZmMwOiAwMDAw
MDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAw
MCAwMDAwMDAwMAo+IAk1ZmUwOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAxMyAwMDAwMDAwMAo+IAlkd2MyIDQ5MDAwMDAwLnVzYi1vdGc6IG5ldyBkZXZpY2UgaXMg
aGlnaC1zcGVlZAo+IAo+IEkgZGlkbid0IHRyeSB1bmRlcnN0YW5kIHRoaXMgcHJvYmxlbSwgaXQn
cyB0b28gY2xvc2UgdG8gcXVpdHRpbmcgdGltZQo+IDotKQoKVGhhbmtzIGZvciB0aGUgYnVnIHJl
cG9ydCwgSSdtIGNoZWNraW5nIHRoZSBjb2RlLgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IAo+
IC0tIAo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBL
bGVpbmUtS8O2bmlnICAgICAgICAgICAgfAo+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25zICAg
ICAgICAgICAgICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlLyB8CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
