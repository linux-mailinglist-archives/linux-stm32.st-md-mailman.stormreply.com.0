Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 602837F6158
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 15:24:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25610C6B476;
	Thu, 23 Nov 2023 14:24:51 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF981C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 14:24:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4DEC7B82D01;
 Thu, 23 Nov 2023 14:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DD5C433C8;
 Thu, 23 Nov 2023 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700749488;
 bh=qOdkWYm5UvV/HgiRSNx6MF2oGmugCohlm/2HC3o1mdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VfSdJkXJvS+mtHT+AedviFCC5Fwt7buyviGMcgvclSiCLKck5taZwx6DN7+Vr8MhP
 bYybYMtsQZTERqVPVgMzznDeOf1dNbqGyLHKosiiJddBeeR+pcMCKhChs5saZodgtZ
 qyuOks1rpFxXU6apAiooZehcQudKVAwdNiPDZaWfLE22Q80auZXKk+Z5MWpQeEeLVd
 SVLaM9SA30kKgY3eDmsV2p9GzukXkgY/P/tyu7qwoaae1qytqDsCUX57l6Dwo3pBXd
 87u7lO+IrutWC/ytZT/CL1hhgVXrrI+WvBUmrLKbuvHvqeL5lShciRRRquuZ8UrG+D
 SyqprgaqzmibQ==
Date: Thu, 23 Nov 2023 14:24:41 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20231123142441.GA1354538@google.com>
References: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
Cc: Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-omap@vger.kernel.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/18] mfd: Convert to platform remove
 callback returning void
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

T24gTW9uLCAwNiBOb3YgMjAyMywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IEhlbGxvLAo+
IAo+IHRoaXMgc2VyaWVzIGNvbnZlcnRzIGFsbCBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRyaXZl
cnMvbWZkIHRvIHVzZQo+IC5yZW1vdmVfbmV3KCkuIENvbXBhcmVkIHRvIHRoZSB0cmFkaXRpb25h
bCAucmVtb3ZlKCkgY2FsbGJhY2sKPiAucmVtb3ZlX25ldygpIHJldHVybnMgbm8gdmFsdWUuIFRo
aXMgaXMgYSBnb29kIHRoaW5nIGJlY2F1c2UgdGhlIGRyaXZlcgo+IGNvcmUgZG9lc24ndCAoYW5k
IGNhbm5vdCkgY29wZSBmb3IgZXJyb3JzIGR1cmluZyByZW1vdmUuIFRoZSBvbmx5IGVmZmVjdAo+
IG9mIGEgbm9uLXplcm8gcmV0dXJuIHZhbHVlIGluIC5yZW1vdmUoKSBpcyB0aGF0IHRoZSBkcml2
ZXIgY29yZSBlbWl0cyBhCj4gd2FybmluZy4gVGhlIGRldmljZSBpcyByZW1vdmVkIGFueWhvdyBh
bmQgYW4gZWFybHkgcmV0dXJuIGZyb20gLnJlbW92ZSgpCj4gdXN1YWxseSB5aWVsZHMgcmVzb3Vy
Y2UgbGVha3MgYW5kL29yIHVzZS1hZnRlci1mcmVlIGJ1Z3MuCj4gCj4gU2VlIGNvbW1pdCA1YzVh
NzY4MGU2N2IgKCJwbGF0Zm9ybTogUHJvdmlkZSBhIHJlbW92ZSBjYWxsYmFjayB0aGF0Cj4gcmV0
dXJucyBubyB2YWx1ZSIpIGZvciBhbiBleHRlbmRlZCBleHBsYW5hdGlvbiBhbmQgdGhlIGV2ZW50
dWFsIGdvYWwuCj4gCj4gQWxsIGRyaXZlcnMgY29udmVydGVkIGhlcmUgYWxyZWFkeSByZXR1cm5l
ZCB6ZXJvIHVuY29uZGl0aW9uYWxseSBpbgo+IC5yZW1vdmUoKSwgc28gdGhleSBhcmUgY29udmVy
dGVkIGhlcmUgdHJpdmlhbGx5Lgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IAo+IFV3ZSBLbGVp
bmUtS8O2bmlnICgxOCk6Cj4gICBtZmQ6IGFiODUwMC1zeXNjdHJsOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcKPiAgICAgdm9pZAo+ICAgbWZkOiBjcm9zX2Vj
X2RldjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQK
PiAgIG1mZDogZXh5bm9zLWxwYXNzOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFj
ayByZXR1cm5pbmcgdm9pZAo+ICAgbWZkOiBmc2wtaW14MjUtdHNhZGM6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZwo+ICAgICB2b2lkCj4gICBtZmQ6IGhpNjU1
eC1wbWljOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAo+ICAgbWZkOiBpbnRlbC1scHNzLWFjcGk6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZwo+ICAgICB2b2lkCj4gICBtZmQ6IGtlbXBsZC1jb3JlOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAo+ICAgbWZkOiBtY3At
c2ExMXgwOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAo+ICAgbWZkOiBteHMtbHJhZGM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCj4gICBtZmQ6IG9tYXAtdXNiLWhvc3Q6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gICBtZmQ6IG9tYXAtdXNiLXRsbDog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAgIG1m
ZDogcGNmNTA2MzMtYWRjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1
cm5pbmcgdm9pZAo+ICAgbWZkOiBxY29tLXBtOHh4eDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAgIG1mZDogc201MDE6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4gICBtZmQ6IHN0bTMyLXRpbWVy
czogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAg
IG1mZDogdGlfYW0zMzV4X3RzY2FkYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nCj4gICAgIHZvaWQKPiAgIG1mZDogdHBzNjU5MTEtY29tcGFyYXRvcjogQ29u
dmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sKPiAgICAgcmV0dXJuaW5nIHZvaWQKPiAg
IG1mZDogdHdsNDAzMC1hdWRpbzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQKCkxvb2tzIGxpa2UgeW91IG1pc3NlZCB0aGUgbWFpbGluZyBsaXN0IG9u
IGEgYnVuY2ggb2YgdGhlc2UuCgpJJ20gZ29pbmcgdG8gcmVtb3ZlIHRoaXMgc2V0IGZvciBub3cu
CgpDb3VsZCB5b3UgcGxlYXNlIHJlc3VibWl0IGl0IGFuZCBDYzogTEtNTD8KCj4gIGRyaXZlcnMv
bWZkL2FiODUwMC1zeXNjdHJsLmMgICAgICB8IDYgKystLS0tCj4gIGRyaXZlcnMvbWZkL2Nyb3Nf
ZWNfZGV2LmMgICAgICAgICB8IDUgKystLS0KPiAgZHJpdmVycy9tZmQvZXh5bm9zLWxwYXNzLmMg
ICAgICAgIHwgNiArKy0tLS0KPiAgZHJpdmVycy9tZmQvZnNsLWlteDI1LXRzYWRjLmMgICAgIHwg
NiArKy0tLS0KPiAgZHJpdmVycy9tZmQvaGk2NTV4LXBtaWMuYyAgICAgICAgIHwgNSArKy0tLQo+
ICBkcml2ZXJzL21mZC9pbnRlbC1scHNzLWFjcGkuYyAgICAgfCA2ICsrLS0tLQo+ICBkcml2ZXJz
L21mZC9rZW1wbGQtY29yZS5jICAgICAgICAgfCA2ICsrLS0tLQo+ICBkcml2ZXJzL21mZC9tY3At
c2ExMXgwLmMgICAgICAgICAgfCA2ICsrLS0tLQo+ICBkcml2ZXJzL21mZC9teHMtbHJhZGMuYyAg
ICAgICAgICAgfCA2ICsrLS0tLQo+ICBkcml2ZXJzL21mZC9vbWFwLXVzYi1ob3N0LmMgICAgICAg
fCA1ICsrLS0tCj4gIGRyaXZlcnMvbWZkL29tYXAtdXNiLXRsbC5jICAgICAgICB8IDUgKystLS0K
PiAgZHJpdmVycy9tZmQvcGNmNTA2MzMtYWRjLmMgICAgICAgIHwgNiArKy0tLS0KPiAgZHJpdmVy
cy9tZmQvcWNvbS1wbTh4eHguYyAgICAgICAgIHwgNiArKy0tLS0KPiAgZHJpdmVycy9tZmQvc201
MDEuYyAgICAgICAgICAgICAgIHwgNiArKy0tLS0KPiAgZHJpdmVycy9tZmQvc3RtMzItdGltZXJz
LmMgICAgICAgIHwgNiArKy0tLS0KPiAgZHJpdmVycy9tZmQvdGlfYW0zMzV4X3RzY2FkYy5jICAg
IHwgNiArKy0tLS0KPiAgZHJpdmVycy9tZmQvdHBzNjU5MTEtY29tcGFyYXRvci5jIHwgNiArKy0t
LS0KPiAgZHJpdmVycy9tZmQvdHdsNDAzMC1hdWRpby5jICAgICAgIHwgNiArKy0tLS0KPiAgMTgg
ZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgNjggZGVsZXRpb25zKC0pCj4gCj4gYmFz
ZS1jb21taXQ6IDNmZjdhNTc4MWNlZWUzYmVmYjkyMjRkMjljZWY2ZTZhNDc2NmM1ZmUKPiAtLSAK
PiAyLjQyLjAKPiAKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
