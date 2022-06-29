Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 993EC5612E9
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jun 2022 09:08:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4567AC04000;
	Thu, 30 Jun 2022 07:08:10 +0000 (UTC)
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68612C03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 21:20:26 +0000 (UTC)
Received: from [37.161.29.0] (port=43545 helo=[192.168.131.30])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <luca@lucaceresoli.net>) id 1o6f6m-000BzC-Qd;
 Wed, 29 Jun 2022 23:20:25 +0200
Message-ID: <d682fb60-c254-f89e-5d6d-cdf7aa752939@lucaceresoli.net>
Date: Wed, 29 Jun 2022 23:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Luca Ceresoli <luca@lucaceresoli.net>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Thu, 30 Jun 2022 07:08:09 +0000
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-staging@lists.linux.dev, kasan-dev@googlegroups.com,
 linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, acpi4asus-user@lists.sourceforge.net,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, openipmi-developer@lists.sourceforge.net,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com,
 linux-usb@vger.kernel.org, linux-crypto@vger.kernel.org,
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

SGksCgpba2VlcGluZyBvbmx5IGluZGl2aWR1YWxzIGFuZCBsaXN0cyBpbiBDYyB0byBhdm9pZCBi
b3VuY2VzXQoKT24gMjgvMDYvMjIgMTY6MDMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEZy
b206IFV3ZSBLbGVpbmUtS8O2bmlnIDx1d2VAa2xlaW5lLWtvZW5pZy5vcmc+Cj4gCj4gVGhlIHZh
bHVlIHJldHVybmVkIGJ5IGFuIGkyYyBkcml2ZXIncyByZW1vdmUgZnVuY3Rpb24gaXMgbW9zdGx5
IGlnbm9yZWQuCj4gKE9ubHkgYW4gZXJyb3IgbWVzc2FnZSBpcyBwcmludGVkIGlmIHRoZSB2YWx1
ZSBpcyBub24temVybyB0aGF0IHRoZQo+IGVycm9yIGlzIGlnbm9yZWQuKQo+IAo+IFNvIGNoYW5n
ZSB0aGUgcHJvdG90eXBlIG9mIHRoZSByZW1vdmUgZnVuY3Rpb24gdG8gcmV0dXJuIG5vIHZhbHVl
LiBUaGlzCj4gd2F5IGRyaXZlciBhdXRob3JzIGFyZSBub3QgdGVtcHRlZCB0byBhc3N1bWUgdGhh
dCBwYXNzaW5nIGFuIGVycm9yIHRvCj4gdGhlIHVwcGVyIGxheWVyIGlzIGEgZ29vZCBpZGVhLiBB
bGwgZHJpdmVycyBhcmUgYWRhcHRlZCBhY2NvcmRpbmdseS4KPiBUaGVyZSBpcyBubyBpbnRlbmRl
ZCBjaGFuZ2Ugb2YgYmVoYXZpb3VyLCBhbGwgY2FsbGJhY2tzIHdlcmUgcHJlcGFyZWQgdG8KPiBy
ZXR1cm4gMCBiZWZvcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KCkZvciB2ZXJzYWNsb2NrOgoKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvY2xrLXZlcnNhY2xvY2s1LmMgYi9kcml2ZXJzL2Nsay9jbGstdmVy
c2FjbG9jazUuYwo+IGluZGV4IGU3YmUzZTU0YjliZS4uNjU3NDkzZWNjZTRjIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvY2xrL2Nsay12ZXJzYWNsb2NrNS5jCj4gKysrIGIvZHJpdmVycy9jbGsvY2xr
LXZlcnNhY2xvY2s1LmMKPiBAQCAtMTEzOCw3ICsxMTM4LDcgQEAgc3RhdGljIGludCB2YzVfcHJv
YmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4g
LXN0YXRpYyBpbnQgdmM1X3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ICtzdGF0
aWMgdm9pZCB2YzVfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gIHsKPiAgCXN0
cnVjdCB2YzVfZHJpdmVyX2RhdGEgKnZjNSA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQpOwo+
ICAKPiBAQCAtMTE0Niw4ICsxMTQ2LDYgQEAgc3RhdGljIGludCB2YzVfcmVtb3ZlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpCj4gIAo+ICAJaWYgKHZjNS0+Y2hpcF9pbmZvLT5mbGFncyAmIFZD
NV9IQVNfSU5URVJOQUxfWFRBTCkKPiAgCQljbGtfdW5yZWdpc3Rlcl9maXhlZF9yYXRlKHZjNS0+
cGluX3hpbik7Cj4gLQo+IC0JcmV0dXJuIDA7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgX19tYXli
ZV91bnVzZWQgdmM1X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQoKUmV2aWV3ZWQtYnk6IEx1
Y2EgQ2VyZXNvbGkgPGx1Y2FAbHVjYWNlcmVzb2xpLm5ldD4KUmV2aWV3ZWQtYnk6IEx1Y2EgQ2Vy
ZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+CgotLSAKTHVjYQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
