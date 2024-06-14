Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28416908775
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:31:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD7CEC6C83A;
	Fri, 14 Jun 2024 09:31:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A658C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:31:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8684A61ECF;
 Fri, 14 Jun 2024 09:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27173C2BD10;
 Fri, 14 Jun 2024 09:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718357489;
 bh=GHeElqe8VrB34C9wBIcEMogZsFo2aeiU/M3nJbLyXxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uVyVB1Q13OgHfxDgorVlgcTtPWWke8R6tnuozRHFZqo8a9Jwd3zF/iajHtabIgDSN
 fJUC450HjXueTqfpKmdaFk4pP+C4KBHDWlioCDY9YSYiGfcFB+zVJlUQ32lyPuIv8e
 76fCrocYx59ivwY2AKivgZ4sRrf5zE1DDrhTAmqu8BcWI9cyHo7+iaQoit+LazNjKb
 YMF/Poqeivz7CbcPm3E7T3vqy2luQaTwMisOR5oM6ltsy6SOO8arAfb5zwxClBDPii
 skZhlEj4yjnBBPfaXF/cEw445MAyEu3lmkliENODUC/MChs81QWnQdksjcSBDoYOww
 w7id1AERN7VGA==
Date: Fri, 14 Jun 2024 10:31:24 +0100
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <20240614093124.GD3029315@google.com>
References: <cover.1718352022.git.u.kleine-koenig@baylibre.com>
 <0735860960b1b38570bffa5b0de81a97f6e3230e.1718352022.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0735860960b1b38570bffa5b0de81a97f6e3230e.1718352022.git.u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 William Breathitt Gray <wbg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 3/4] mfd: stm32-timers: Drop
 TIM_DIER_CC_IE(x) in favour of TIM_DIER_CCxIE(x)
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

T24gRnJpLCAxNCBKdW4gMjAyNCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IFRoZXNlIHR3
byBkZWZpbmVzIGhhdmUgdGhlIHNhbWUgcHVycG9zZSBhbmQgdGhpcyBjaGFuZ2UgZG9lc24ndAo+
IGludHJvZHVjZSBhbnkgZGlmZmVyZW5jZXMgaW4gZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVy
LWNudC5vLgo+IAo+IFRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdHdvIGlzIHRoYXQK
PiAKPiAJVElNX0RJRVJfQ0NfSUUoMSkgPT0gVElNX0RJRVJfQ0MySUUKPiAKPiB3aGlsZQo+IAo+
IAlUSU1fRElFUl9DQ3hJRSgxKSA9PSBUSU1fRElFUl9DQzFJRQo+IAo+IC4gVGhhdCBtYWtlcyBp
dCBuZWNlc3NhcnkgdG8gaGF2ZSBhbiBleHBsaWNpdCAiKyAxIiBpbiB0aGUgdXNlciBjb2RlLAo+
IGJ1dCBJTUhPIHRoaXMgaXMgYSBnb29kIHRoaW5nIGFzIHRoaXMgaXMgdGhlIGNvZGUgbG9jYXRh
dGlvbiB0aGF0Cj4gImtub3dzIiB0aGF0IGZvciBzb2Z0d2FyZSBjaGFubmVsIDEgeW91IGhhdmUg
dG8gdXNlIFRJTV9ESUVSX0NDMklFCj4gKGJlY2F1c2Ugc29mdHdhcmUgZ3V5cyBzdGFydCBjb3Vu
dGluZyBhdCAwLCB3aGlsZSB0aGUgcmVsZXZhbnQgaGFyZHdhcmUKPiBkZXNpZ25lciBzdGFydGVk
IGF0IDEpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXIt
Y250LmMgfCA0ICsrLS0KClRoZSBzdWJqZWN0IHNob3VsZCBiZSByZW5hbWVkLgoKPiAgaW5jbHVk
ZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmggIHwgMSAtCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nv
dW50ZXIvc3RtMzItdGltZXItY250LmMgYi9kcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250
LmMKPiBpbmRleCAwNjY0ZWY5NjlmNzkuLjE4NmU3M2Q2Y2NiNCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMKPiArKysgYi9kcml2ZXJzL2NvdW50ZXIvc3Rt
MzItdGltZXItY250LmMKPiBAQCAtNDY1LDcgKzQ2NSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfY291
bnRfZXZlbnRzX2NvbmZpZ3VyZShzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIpCj4gIAkJ
CXJldCA9IHN0bTMyX2NvdW50X2NhcHR1cmVfY29uZmlndXJlKGNvdW50ZXIsIGV2ZW50X25vZGUt
PmNoYW5uZWwsIHRydWUpOwo+ICAJCQlpZiAocmV0KQo+ICAJCQkJcmV0dXJuIHJldDsKPiAtCQkJ
ZGllciB8PSBUSU1fRElFUl9DQ19JRShldmVudF9ub2RlLT5jaGFubmVsKTsKPiArCQkJZGllciB8
PSBUSU1fRElFUl9DQ3hJRShldmVudF9ub2RlLT5jaGFubmVsICsgMSk7Cj4gIAkJCWJyZWFrOwo+
ICAJCWRlZmF1bHQ6Cj4gIAkJCS8qIHNob3VsZCBuZXZlciByZWFjaCB0aGlzIHBhdGggKi8KPiBA
QCAtNDc4LDcgKzQ3OCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfY291bnRfZXZlbnRzX2NvbmZpZ3Vy
ZShzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIpCj4gIAo+ICAJLyogY2hlY2sgZm9yIGRp
c2FibGVkIGNhcHR1cmUgZXZlbnRzICovCj4gIAlmb3IgKGkgPSAwIDsgaSA8IHByaXYtPm5jaGFu
bmVsczsgaSsrKSB7Cj4gLQkJaWYgKCEoZGllciAmIFRJTV9ESUVSX0NDX0lFKGkpKSkgewo+ICsJ
CWlmICghKGRpZXIgJiBUSU1fRElFUl9DQ3hJRShpICsgMSkpKSB7Cj4gIAkJCXJldCA9IHN0bTMy
X2NvdW50X2NhcHR1cmVfY29uZmlndXJlKGNvdW50ZXIsIGksIGZhbHNlKTsKPiAgCQkJaWYgKHJl
dCkKPiAgCQkJCXJldHVybiByZXQ7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL3N0
bTMyLXRpbWVycy5oIGIvaW5jbHVkZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmgKPiBpbmRleCA5
MmI0NWE1NTk2NTYuLmYwOWJhNTk4Yzk3YSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21m
ZC9zdG0zMi10aW1lcnMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWZkL3N0bTMyLXRpbWVycy5o
Cj4gQEAgLTQ3LDcgKzQ3LDYgQEAKPiAgI2RlZmluZSBUSU1fRElFUl9DQzJJRQkJVElNX0RJRVJf
Q0N4SUUoMikJCQkvKiBDQzIgSW50ZXJydXB0IEVuYWJsZQkJCQkqLwo+ICAjZGVmaW5lIFRJTV9E
SUVSX0NDM0lFCQlUSU1fRElFUl9DQ3hJRSgzKQkJCS8qIENDMyBJbnRlcnJ1cHQgRW5hYmxlCQkJ
CSovCj4gICNkZWZpbmUgVElNX0RJRVJfQ0M0SUUJCVRJTV9ESUVSX0NDeElFKDQpCQkJLyogQ0M0
IEludGVycnVwdCBFbmFibGUJCQkJKi8KPiAtI2RlZmluZSBUSU1fRElFUl9DQ19JRSh4KQlCSVQo
KHgpICsgMSkJCQkJLyogQ0MxLCBDQzIsIENDMywgQ0M0IGludGVycnVwdCBlbmFibGUJCSovCj4g
ICNkZWZpbmUgVElNX0RJRVJfVURFCQlCSVQoOCkJCQkJCS8qIFVwZGF0ZSBETUEgcmVxdWVzdCBF
bmFibGUJCQkqLwo+ICAjZGVmaW5lIFRJTV9ESUVSX0NDeERFKHgpCUJJVCg5ICsgKCh4KSAtIDEp
KQkJCS8qIENDeCBETUEgcmVxdWVzdCBFbmFibGUgKHgg4oiIIHsxLCAuLiA0fSkJKi8KPiAgI2Rl
ZmluZSBUSU1fRElFUl9DQzFERQkJVElNX0RJRVJfQ0N4REUoMSkJCQkvKiBDQzEgRE1BIHJlcXVl
c3QgRW5hYmxlCQkJKi8KPiAtLSAKPiAyLjQzLjAKPiAKCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
