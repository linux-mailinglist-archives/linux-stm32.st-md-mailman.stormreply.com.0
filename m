Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEC86E9163
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Apr 2023 13:01:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C9EAC65E4F;
	Thu, 20 Apr 2023 11:01:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0056CC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Apr 2023 11:01:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4CD1647A7;
 Thu, 20 Apr 2023 11:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1A5C433EF;
 Thu, 20 Apr 2023 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681988477;
 bh=40BVpmsumFk3aPJFU2dLAwtHIV2znVDn+AorQnPvg6U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rwc9h8CxmHsWH284LQ5Y9kjXKGF9zPhi6pLlHfED54eNbX2FmxNVsemhJ7eirXBc/
 5AgxzXtlUt+BHop476+JBDh9JGzRVvm6iNmwxq4ShniCA3ivmFTRHvNYAA2uwItmgN
 Imwzc8LZwYlUoE+V5dpZj30PkfNPvNFQxH8hnoOzDnEvkaszH7gVrr/zq5p5jyFBdK
 FhQpbGbSnalKu7k0vRBI+XQzzAgwoIqoMKVQHVFY1eczA3whwPW2MUGDSz7hLuCTtO
 SJqSA0go6sPOd3AK7Hu42fdk3MNzJCt0HYfU3FAeoBRkGzLEvBJUCqOMrCOtMD7WPw
 HYj+dYmI5SCvA==
Date: Thu, 20 Apr 2023 12:01:11 +0100
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20230420110111.GM9904@google.com>
References: <20230412153709.3557323-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230412153709.3557323-1-u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-iio@vger.kernel.org, William Breathitt Gray <william.gray@linaro.org>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: Reset TIM_TISEL
 and TIM_SMCR to their default value
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

T24gV2VkLCAxMiBBcHIgMjAyMywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IFRoZSBkcml2
ZXIgYXNzdW1lcyB0aGF0IHRoZSBpbnB1dCBzZWxlY3Rpb24gcmVnaXN0ZXIgKFRJTV9USVNFTCkg
aXMgYXQKPiBpdHMgcmVzZXQgZGVmYXVsdCB2YWx1ZS4gVXN1YWxseSB0aGlzIGlzIHRoZSBjYXNl
LCBidXQgdGhlIGJvb3Rsb2FkZXIKPiBtaWdodCBoYXZlIG1vZGlmaWVkIGl0LiBBbHNvIHJlc2V0
IHRoZSBTTUNSIHJlZ2lzdGVyIHdoaWxlIGF0IGl0Lgo+IAo+IFRoaXMgYmFzZXMgb24gdGhlIGVm
ZmVjdGl2ZWx5IHNhbWUgcGF0Y2ggc3VibWl0dGVkIGJ5IE9saXZpZXIgTW95c2FuIGZvcgo+IHB3
bS1zdG0zMi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+IEhlbGxvLAo+IAo+IG5vdGUgdGhhdCB0aGUg
cGF0Y2ggYnkgT2xpdmllciBNb3lzYW5bMV0gZm9yIHB3bS1zdG0zMiBpcyBleHBlY3RlZCB0bwo+
IGFwcGVhciBpbiBUaGllcnJ5J3MgdHJlZSBzb29uLiBJdCBhZGRlZCB0aGUgZGVmaW5pdGlvbiBv
ZiBUSU1fVElTRUwgaW4KPiB0aGUgc2FtZSB3YXksIHNvIHRoZSB0d28gcGF0Y2hlcyBzaG91bGQg
bWVyZ2UganVzdCBmaW5lLiBBbHRlcm5hdGl2ZWx5Cj4geW91IGNhbiBjb21taXQgaXQgdG8gYSB0
cmVlIHRoYXQgYWxyZWFkeSBoYXMgdGhlIHB3bSBjaGFuZ2UgKGFuZCB0aGVuCj4gZHJvcCB0aGUg
Y2hhbmdlIHRvIGluY2x1ZGUvbGludXgvbWZkL3N0bTMyLXRpbWVycy5oIGZyb20gdGhpcyBvbmUp
Lgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1wd20vMjAyMjEyMTMxMDI3MDcuMTA5NjM0NS0xLW9saXZpZXIubW95c2FuQGZvc3Mu
c3QuY29tCj4gCj4gIGRyaXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQuYyB8IDQgKysrKwoK
PiAgaW5jbHVkZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmggIHwgMSArCgpBY2tlZC1ieTogTGVl
IEpvbmVzIDxsZWVAa2VybmVsLm9yZz4KCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQuYyBi
L2RyaXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQuYwo+IGluZGV4IDliZjIwYTVkNmJkYS4u
ZDAwMWQ3N2YxN2FjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY291bnRlci9zdG0zMi10aW1lci1j
bnQuYwo+ICsrKyBiL2RyaXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQuYwo+IEBAIC0zNDIs
NiArMzQyLDEwIEBAIHN0YXRpYyBpbnQgc3RtMzJfdGltZXJfY250X3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcHJp
dik7Cj4gIAo+ICsJLyogUmVzZXQgaW5wdXQgc2VsZWN0b3IgdG8gaXRzIGRlZmF1bHQgaW5wdXQg
YW5kIGRpc2FibGUgc2xhdmUgbW9kZSAqLwo+ICsJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwg
VElNX1RJU0VMLCAweDApOwo+ICsJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgVElNX1NNQ1Is
IDB4MCk7Cj4gKwo+ICAJLyogUmVnaXN0ZXIgQ291bnRlciBkZXZpY2UgKi8KPiAgCXJldCA9IGRl
dm1fY291bnRlcl9hZGQoZGV2LCBjb3VudGVyKTsKPiAgCWlmIChyZXQgPCAwKQo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaCBiL2luY2x1ZGUvbGludXgvbWZk
L3N0bTMyLXRpbWVycy5oCj4gaW5kZXggNWY1YzQzZmQ2OWRkLi4xYjk0MzI1ZmViYjMgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmgKPiArKysgYi9pbmNsdWRl
L2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaAo+IEBAIC0zMSw2ICszMSw3IEBACj4gICNkZWZpbmUg
VElNX0JEVFIJMHg0NAkvKiBCcmVhayBhbmQgRGVhZC1UaW1lIFJlZyAqLwo+ICAjZGVmaW5lIFRJ
TV9EQ1IJCTB4NDgJLyogRE1BIGNvbnRyb2wgcmVnaXN0ZXIgICAgKi8KPiAgI2RlZmluZSBUSU1f
RE1BUgkweDRDCS8qIERNQSByZWdpc3RlciBmb3IgdHJhbnNmZXIgKi8KPiArI2RlZmluZSBUSU1f
VElTRUwJMHg2OAkvKiBJbnB1dCBTZWxlY3Rpb24gICAgICAgICAqLwo+ICAKPiAgI2RlZmluZSBU
SU1fQ1IxX0NFTglCSVQoMCkJLyogQ291bnRlciBFbmFibGUJICAgKi8KPiAgI2RlZmluZSBUSU1f
Q1IxX0RJUglCSVQoNCkgIC8qIENvdW50ZXIgRGlyZWN0aW9uCSAgICovCj4gCj4gYmFzZS1jb21t
aXQ6IGZlMTVjMjZlZTI2ZWZhMTE3NDFhN2I2MzJlOWYyM2IwMWFjYTRjYzYKPiAtLSAKPiAyLjM5
LjIKPiAKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
