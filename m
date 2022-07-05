Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB09A566A0A
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jul 2022 13:43:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79611C640F4;
	Tue,  5 Jul 2022 11:43:13 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1141FC640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jul 2022 10:08:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BB4A1F91F;
 Tue,  5 Jul 2022 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657015735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvMJ4J1/LuqJ2bm7BlZIoOLJOYmWh+4Rpvkk33SZGOA=;
 b=eByb4sSPqg6rRuVWR7Uyol2qkXUh2FlAJZJl6kQB2+c8EEhcdaxtq/jkX0dVzdvL/5s6D3
 /efNTsY/bdasP3pVQxu6qP4nvHO+zcS4O9fblGgs1NR89rSYgTvYETM292rGHy3CrhOSj+
 qGcOFU+GGl+mKHAF54mbZA9ZrTUJOaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657015735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvMJ4J1/LuqJ2bm7BlZIoOLJOYmWh+4Rpvkk33SZGOA=;
 b=jKWTp5GMggeoLloojImrUvPvKkYL+8GQzQSR8Qi8VzqCYEK46zUKh7GMjl/cO3qvfPDiP7
 DHXFfHIde+vxx5CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E2AF1339A;
 Tue,  5 Jul 2022 10:08:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VBGsCbYNxGK1BQAAMHmgww
 (envelope-from <jdelvare@suse.de>); Tue, 05 Jul 2022 10:08:54 +0000
Date: Tue, 5 Jul 2022 12:08:52 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20220705120852.049dc235@endymion.delvare>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 05 Jul 2022 11:43:12 +0000
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-clk@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 6/6] i2c: Make remove callback return void
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

T24gVHVlLCAyOCBKdW4gMjAyMiAxNjowMzoxMiArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gRnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHV3ZUBrbGVpbmUta29lbmlnLm9yZz4KPiAK
PiBUaGUgdmFsdWUgcmV0dXJuZWQgYnkgYW4gaTJjIGRyaXZlcidzIHJlbW92ZSBmdW5jdGlvbiBp
cyBtb3N0bHkgaWdub3JlZC4KPiAoT25seSBhbiBlcnJvciBtZXNzYWdlIGlzIHByaW50ZWQgaWYg
dGhlIHZhbHVlIGlzIG5vbi16ZXJvIHRoYXQgdGhlCj4gZXJyb3IgaXMgaWdub3JlZC4pCj4gCj4g
U28gY2hhbmdlIHRoZSBwcm90b3R5cGUgb2YgdGhlIHJlbW92ZSBmdW5jdGlvbiB0byByZXR1cm4g
bm8gdmFsdWUuIFRoaXMKPiB3YXkgZHJpdmVyIGF1dGhvcnMgYXJlIG5vdCB0ZW1wdGVkIHRvIGFz
c3VtZSB0aGF0IHBhc3NpbmcgYW4gZXJyb3IgdG8KPiB0aGUgdXBwZXIgbGF5ZXIgaXMgYSBnb29k
IGlkZWEuIEFsbCBkcml2ZXJzIGFyZSBhZGFwdGVkIGFjY29yZGluZ2x5Lgo+IFRoZXJlIGlzIG5v
IGludGVuZGVkIGNoYW5nZSBvZiBiZWhhdmlvdXIsIGFsbCBjYWxsYmFja3Mgd2VyZSBwcmVwYXJl
ZCB0bwo+IHJldHVybiAwIGJlZm9yZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQoKVGhhdCdzIGEgaHVn
ZSBjaGFuZ2UgZm9yIGEgcmVsYXRpdmVseSBzbWFsbCBiZW5lZml0LCBidXQgaWYgdGhpcyBpcwph
cHByb3ZlZCBieSB0aGUgSTJDIGNvcmUgbWFpbnRhaW5lciB0aGVuIGZpbmUgd2l0aCBtZS4gRm9y
OgoKPiAgZHJpdmVycy9od21vbi9hZGMxMjhkODE4LmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaHdtb24vYWR0NzQ3MC5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvaHdtb24vYXNiMTAwLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tCj4gIGRyaXZlcnMvaHdt
b24vYXNjNzYyMS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+
ICBkcml2ZXJzL2h3bW9uL2RtZTE3MzcuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCA0ICstLS0KPiAgZHJpdmVycy9od21vbi9mNzUzNzVzLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgNSArKy0tLQo+ICBkcml2ZXJzL2h3bW9uL2ZzY2htZC5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQo+ICBkcml2ZXJzL2h3bW9u
L2Z0c3RldXRhdGVzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQo+ICBk
cml2ZXJzL2h3bW9uL2luYTIwOS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCA0ICstLS0KPiAgZHJpdmVycy9od21vbi9pbmEzMjIxLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaHdtb24vamM0Mi5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvaHdtb24vbWNwMzAy
MS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJz
L2h3bW9uL29jYy9wOF9pMmMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICst
LS0KPiAgZHJpdmVycy9od21vbi9wY2Y4NTkxLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9od21vbi9zbW02NjUuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9od21vbi90cHMyMzg2MS5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaHdtb24v
dzgzNzgxZC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBk
cml2ZXJzL2h3bW9uL3c4Mzc5MWQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCA2ICsrLS0tLQo+ICBkcml2ZXJzL2h3bW9uL3c4Mzc5MmQuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCA2ICsrLS0tLQo+ICBkcml2ZXJzL2h3bW9uL3c4Mzc5My5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQo+ICBkcml2ZXJzL2h3bW9u
L3c4Mzc5NS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KPiAg
ZHJpdmVycy9od21vbi93ODNsNzg1dHMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgNiArKy0tLS0KPiAgZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgNiArLS0tLS0KPiAgZHJpdmVycy9pMmMvaTJjLXNsYXZlLWVlcHJv
bS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaTJjL2ky
Yy1zbGF2ZS10ZXN0dW5pdC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDMgKy0tCj4gIGRy
aXZlcnMvaTJjL2kyYy1zbWJ1cy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDMgKy0tCj4gIGRyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtbHRjNDMwNi5jICAgICAgICAgICAg
ICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NDEu
YyAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQo+ICBkcml2ZXJzL2kyYy9tdXhlcy9pMmMt
bXV4LXBjYTk1NHguYyAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQoKUmV2aWV3ZWQtYnk6
IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5kZT4KCi0tIApKZWFuIERlbHZhcmUKU1VTRSBM
MyBTdXBwb3J0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
