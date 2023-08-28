Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4615C78B531
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 18:15:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE87AC6A61D;
	Mon, 28 Aug 2023 16:15:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2DD5C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 16:15:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B468A612D1;
 Mon, 28 Aug 2023 16:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D33CC433C7;
 Mon, 28 Aug 2023 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693239347;
 bh=EXag5HMY6SlOvR4DazyxL95o7MXc5ZXzhpW8NYQZm0Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UgHpqvXmxHlpbaD1JE2Fd9hEGfXfDjEB1abZD8W1PiapXHm3RTvlOxsU7sYNq88fT
 xOCfZhGDiImMGdV8yXf2sHh5KEMQaaypsQSj7rR2BinSqetWg9dpJAwCp4ZrjgugHd
 T1jrrtS695dtBZM+HV7yv669bqndee8qf7sfnOH4eEPX1rfJijNGvTpvC+tqeTMc+J
 QCqYjIvOdCPTP8qc0K+kHYEEsW6IeTSbwPQBL2Hm9Zu4nQ1+CS6LZknnh7tIQgrytn
 CLqKv3HfxjNZTpVV7hce17Tt4P1ydsqRC76JS4flLbQWXvyZ8S1VJLNyjMfXP9hAb/
 0geEwc+kyNqiA==
Date: Mon, 28 Aug 2023 17:16:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Message-ID: <20230828171605.15c51c28@jic23-huawei>
In-Reply-To: <tencent_CF6E986A75B63EC09E3D98143650B5241809@qq.com>
References: <tencent_994DA85912C937E3B5405BA960B31ED90A08@qq.com>
 <20230716170821.3305e3fa@jic23-huawei>
 <tencent_CF6E986A75B63EC09E3D98143650B5241809@qq.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] io: adc: stm32-adc: fix potential NULL
 pointer dereference in stm32_adc_probe()
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

T24gTW9uLCAyOCBBdWcgMjAyMyAyMzowMjowNyArMDgwMApaaGFuZyBTaHVyb25nIDx6aGFuZ19z
aHVyb25nQGZveG1haWwuY29tPiB3cm90ZToKCj4g5ZyoIDIwMjPlubQ35pyIMTfml6XmmJ/mnJ/k
uIAgQ1NUIOS4iuWNiDEyOjA4OjIx77yMSm9uYXRoYW4gQ2FtZXJvbiDlhpnpgZPvvJoKPiA+IE9u
IFNhdCwgMTUgSnVsIDIwMjMgMjM6NTU6NTAgKzA4MDAKPiA+IAo+ID4gWmhhbmcgU2h1cm9uZyA8
emhhbmdfc2h1cm9uZ0Bmb3htYWlsLmNvbT4gd3JvdGU6ICAKPiA+ID4gb2ZfbWF0Y2hfZGV2aWNl
KCkgbWF5IGZhaWwgYW5kIHJldHVybnMgYSBOVUxMIHBvaW50ZXIuCj4gPiA+IAo+ID4gPiBGaXgg
dGhpcyBieSBjaGVja2luZyB0aGUgcmV0dXJuIHZhbHVlIG9mIG9mX21hdGNoX2RldmljZSgpLgo+
ID4gPiAKPiA+ID4gRml4ZXM6IDY0YWQ3ZjY0MzhmMyAoImlpbzogYWRjOiBzdG0zMjogaW50cm9k
dWNlIGNvbXBhdGlibGUgZGF0YSBjZmciKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFuZyBTaHVy
b25nIDx6aGFuZ19zaHVyb25nQGZveG1haWwuY29tPiAgCj4gPiAKPiA+IEhpIFpoYW5nLAo+ID4g
Cj4gPiBJJ20gbm90IHN1cmUgd2UgY2FuIGFjdHVhbGx5IG1ha2UgdGhpcyBidWcgaGFwcGVuLiBE
byB5b3UgaGF2ZQo+ID4gYSB3YXkgb2YgdHJpZ2dlcmluZyBpdD8gIFRoZSBkcml2ZXIgaXMgb25s
eSBwcm9iZWQgb24gZGV2aWNlcyB3aGVyZQo+ID4gdGhhdCBtYXRjaCB3aWxsIHdvcmsuCj4gPiAK
PiA+IEFsc28sIGFzc3VtaW5nIHRoZSBtYXRjaCB0YWJsZSBpcyB0aGUgc2FtZSBvbmUgYXNzb2Np
YXRlZCB3aXRoIHRoaXMgcHJvYmUKPiA+IGZ1bmN0aW9uLCB0aGVuIHVzIHByaXYtPmNmZyA9IG9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YSgpIGFuZCBjaGVjayB0aGUKPiA+IG91dHB1dCBvZiB0aGF0
IHdoaWNoIGlzIHdoYXQgd2UgcmVhbGx5IGNhcmUgYWJvdXQuCj4gPiAKPiA+IEpvbmF0aGFuCj4g
PiAgIAo+ID4gPiAtLS0KPiA+ID4gCj4gPiA+ICBkcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNv
cmUuYyB8IDkgKysrKysrKy0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2Fk
Yy9zdG0zMi1hZGMtY29yZS5jCj4gPiA+IGIvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy1jb3Jl
LmMgaW5kZXggNDhmMDJkY2M4MWMxLi43MDAxMWZkYmY1ZjYKPiA+ID4gMTAwNjQ0Cj4gPiA+IC0t
LSBhL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMv
aWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jCj4gPiA+IEBAIC03MDYsNiArNzA2LDggQEAgc3RhdGlj
IGludCBzdG0zMl9hZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAgCj4gPiA+ICpwZGV2
KT4gICAKPiA+ID4gIAlzdHJ1Y3Qgc3RtMzJfYWRjX3ByaXYgKnByaXY7Cj4gPiA+ICAJc3RydWN0
IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+ID4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
ID0gcGRldi0+ZGV2Lm9mX25vZGU7Cj4gPiA+IAo+ID4gPiArCWNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgKm9mX2lkOwo+ID4gPiArCj4gPiA+IAo+ID4gPiAgCXN0cnVjdCByZXNvdXJjZSAqcmVz
Owo+ID4gPiAgCXUzMiBtYXhfcmF0ZTsKPiA+ID4gIAlpbnQgcmV0Owo+ID4gPiAKPiA+ID4gQEAg
LTcxOCw4ICs3MjAsMTEgQEAgc3RhdGljIGludCBzdG0zMl9hZGNfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAgCj4gPiA+ICpwZGV2KT4gICAKPiA+ID4gIAkJcmV0dXJuIC1FTk9NRU07Cj4g
PiA+ICAJCj4gPiA+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgJnByaXYtPmNvbW1vbik7
Cj4gPiA+IAo+ID4gPiAtCXByaXYtPmNmZyA9IChjb25zdCBzdHJ1Y3Qgc3RtMzJfYWRjX3ByaXZf
Y2ZnICopCj4gPiA+IC0JCW9mX21hdGNoX2RldmljZShkZXYtPmRyaXZlci0+b2ZfbWF0Y2hfdGFi
bGUsIGRldiktPmRhdGE7Cj4gPiA+ICsJb2ZfaWQgPSBvZl9tYXRjaF9kZXZpY2UoZGV2LT5kcml2
ZXItPm9mX21hdGNoX3RhYmxlLCBkZXYpOwo+ID4gPiArCWlmICghb2ZfaWQpCj4gPiA+ICsJCXJl
dHVybiAtRU5PREVWOwo+ID4gPiArCj4gPiA+ICsJcHJpdi0+Y2ZnID0gKGNvbnN0IHN0cnVjdCBz
dG0zMl9hZGNfcHJpdl9jZmcgKilvZl9pZC0+ZGF0YTsKPiA+ID4gCj4gPiA+ICAJcHJpdi0+bmJf
YWRjX21heCA9IHByaXYtPmNmZy0+bnVtX2FkY3M7Cj4gPiA+ICAJc3Bpbl9sb2NrX2luaXQoJnBy
aXYtPmNvbW1vbi5sb2NrKTsgIAo+IEhlbGxvIEpvbmF0aGFuLAo+IAo+IEkgdGhpbmsgd2UgY2Fu
IG1ha2UgaXQgaGFwcGVuIGJ5IGRlc2lnbmluZyB0aGUgcGxhdGZvcm0gZGV2aWNlIGluIGEgd2F5
IHRoYXQgCj4gaXRzIG5hbWUgYWxpZ25zIHdpdGggdGhhdCBvZiB0aGUgZHJpdmVyLiBJbiBzdWNo
IGEgc2NlbmFyaW8sIHdoZW4gdGhlIGRyaXZlciAKPiBpcyBwcm9iZWQsIHRoZSBvZl9tYXRjaF9k
ZXZpY2UgZnVuY3Rpb24gd2lsbCByZXR1cm4gbnVsbC4gWW91IGNhbiB2ZXJpZnkgdGhpcyAKPiBm
dW5jdGlvbmFsaXR5IGJ5IHJldmlld2luZyB0aGUgZm9sbG93aW5nIGZ1bmN0aW9uOgo+IAo+IHN0
YXRpYyBpbnQgcGxhdGZvcm1fbWF0Y2goc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNl
X2RyaXZlciAqZHJ2KQoKSSBkb24ndCB0aGluayB3ZSBjYXJlIGFib3V0IHRoYXQgY2FzZS4gIElm
IHRoZXJlIGlzIGEgcmVhbCBleGFtcGxlIG9mCndoeSBzb21lb25lIHdvdWxkIGRvIHRoaXMgdGhl
biB0aGF0IHdvdWxkIGJlIGEgZGlmZmVyZW50IG1hdHRlci4KCkpvbmF0aGFuCgo+IAo+IEJlc3Qg
cmVnYXJkcywKPiBTaHVyb25nCj4gCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
