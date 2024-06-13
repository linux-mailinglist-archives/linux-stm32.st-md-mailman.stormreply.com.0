Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A283907A75
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2024 19:59:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E3C8C78011;
	Thu, 13 Jun 2024 17:59:30 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3426CC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 17:59:22 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-797a7f9b552so80969185a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 10:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718301561; x=1718906361;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8DxvYUGVHxRZE8NgyFyBxxrydXJ+gJq/RSG2sz2esD8=;
 b=t0Q636BuwsKiXiUDdmnHX8V5B8xPUgkexdjRPRlIijyKDy5ttTq067cmwm4Kf1igP9
 qINmaQizz72a3x9MzGrMSEtCT9W5QrXbJEnTV/Dwtg0aQzyu7vWpbXc1h0QkK0A6NaRq
 Cl7f8jnH8f5/e/sdDgjoHTKOEN8qqL6ZbJbUZI69gg5PFqRLWcMoYEJB2qfocp70wt1T
 928QQQ9at7J3tTqIBNeKkH1M8vN4ZaHnmzfYMeYot0lt9qf/44aXB4WH6BpDRJZ60Ljm
 YyTGovQsDPUJQonpP8VpNg86xPyuURxoZH/yU04dN+wCMQCiQWaKhU9s3AQrxdBX4iPo
 1FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718301561; x=1718906361;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8DxvYUGVHxRZE8NgyFyBxxrydXJ+gJq/RSG2sz2esD8=;
 b=cV8cGz3ONNJxA8Q2Gu2nyxXfTB1wbg27HniH6dVL4jBJgim4MnhGIZPw/L3qJWZ9HZ
 fkvY4GMCFgyzT/Y8b+O2/OVEXwQGv2luqX+fempxgEVRf1CljD6wnIcaH+c0Wa3DplxQ
 Jhfdb1DBNagha1Wa0BFI8uxj6tpf57L6gEKiB1Ez4JM69UeB+GuilrqmyUVHlZRFvM3v
 8VmdWx2H2zlZelgWvHtrQtRClkzAb4OHKUW6kRVA6AEFZ5o4MHX+k2Q/YpI22M20Leub
 QLg5+oh0d9tIJ4xvtg53MvHF/vSqBIbg5Q2Rdzc7tsnaEZ3G1zRB96x8eDvs5+n/cnxG
 5yEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQK7AKNe7cX20p2MQC3gwu/K6qYx+uESoF+r0FW1wj4+2iv36rEGRKrbNoGDJPVBf12SdubeAiZnYG4OdVs9sYjLG31pKzS6aZ280Yzd6X56FiJRlaD/B6
X-Gm-Message-State: AOJu0YzNLKCqQ2PjI3/9/LtMvGI81a79GpNRkCsrIpvC2PbW+hrDY9w6
 a8ki015WfsgoT3WKvTnHUv6S7t2UEeQoODdIFDYnphEjJh/5sL16oGZkhMNWh2A=
X-Google-Smtp-Source: AGHT+IHYu0HIgU07HmWdvzdf4u4qWBn8WlIILCE4f7D5lT6HmhfiWx5mZ5m4ZVSvcO8gHLmSoTykaQ==
X-Received: by 2002:a05:620a:44d1:b0:795:4d93:9e86 with SMTP id
 af79cd13be357-798d2411207mr28622885a.22.1718301560815; 
 Thu, 13 Jun 2024 10:59:20 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798a9d8fb49sm73268185a.0.2024.06.13.10.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 10:59:20 -0700 (PDT)
Message-ID: <0003e57b-4c6a-470b-a0d8-20a13091d325@baylibre.com>
Date: Thu, 13 Jun 2024 13:59:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20240611165214.4091591-1-tgamblin@baylibre.com>
 <20240613182021.00005072@Huawei.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20240613182021.00005072@Huawei.com>
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-amlogic@lists.infradead.org,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [RESEND][PATCH] iio: simplify with
 regmap_set_bits(), regmap_clear_bits()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Ck9uIDIwMjQtMDYtMTMgMToyMCBwLm0uLCBKb25hdGhhbiBDYW1lcm9uIHdyb3RlOgo+IE9uIFR1
ZSwgMTEgSnVuIDIwMjQgMTI6NTI6MDYgLTA0MDAKPiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5A
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+PiBTaW1wbGlmeSB0aGUgd2F5IHJlZ21hcCBpcyBhY2Nl
c3NlZCBpbiBpaW8gZHJpdmVycy4KPj4KPj4gSW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRl
X2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFzayB0d2ljZSwgdXNlCj4+IHJlZ21hcF9zZXRfYml0
cygpLgo+Pgo+PiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVfYml0cygpIGFuZCBwYXNz
aW5nIHZhbCA9IDAsIHVzZQo+PiByZWdtYXBfY2xlYXJfYml0cygpLgo+Pgo+PiBTdWdnZXN0ZWQt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgo+PiBT
aWduZWQtb2ZmLWJ5OiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPgo+IExv
b2tzIGxpa2UgYSBnb29kIGNoYW5nZSBpbiBnZW5lcmFsLiBIb3dldmVyLi4uCj4KPiBUaGUgcHJv
YmxlbSB3aXRoIGEgY2hhbmdlIGxpa2UgdGhpcyBpcyBpdCByZXN1bHRzIGluCj4gbm9uIHRyaXZp
YWwgYmFja3BvcnRpbmcgaWYgd2UgbmVlZCB0byBkdWUgdG8gYSBmaXggaW4gcmVsYXRlZAo+IGNv
ZGUuCj4KPiBBcyBzdWNoLCB3aGlsc3QgaXQgd2lsbCBvYnZpb3VzbHkgZ2VuZXJhdGUgYSBsb3Qg
b2YgcGF0Y2hlcywgSSdkCj4gbGlrZSB0aGlzIHNwbGl0IHVwIGludG8gYSBzZXJpZXMgc28gZWFj
aCBwYXRjaCB0b3VjaGVzIG9ubHkgb25lIGRyaXZlci4KPiBGaW5lIHRvIGtlZXAgYSBzaW5nbGUg
cGF0Y2ggZm9yIHRoZSBtdWx0aXBsZSBtb2R1bGUgZm9yIGEgc2luZ2xlCj4gZGV2aWNlIGNhc2Vz
IHRob3VnaC4KPgo+IEFsc28gc29tZSB2ZXJ5IGxvbmcgbGluZXMgdGhhdCBuZWVkIHRoZSBsaW5l
IGJyZWFrcyBwdXQgYmFjay4KClRoYW5rIHlvdS4gSSdsbCByZXN1Ym1pdCBhcyBhIHNlcmllcyBv
ZiBzZXBhcmF0ZSBwYXRjaGVzIHdpdGggdGhvc2UgCmZpeGVzIHNvb24uCgpUcmV2b3IKCj4KPiBK
b25hdGhhbgo+Cj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FjY2VsL21zYTMxMS5jIGIv
ZHJpdmVycy9paW8vYWNjZWwvbXNhMzExLmMKPj4gaW5kZXggYjhkZGJmZDk4ZjExLi40MGU2MDVj
NTdhZGIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaWlvL2FjY2VsL21zYTMxMS5jCj4+ICsrKyBi
L2RyaXZlcnMvaWlvL2FjY2VsL21zYTMxMS5jCj4+IEBAIC0xMDM0LDEwICsxMDM0LDggQEAgc3Rh
dGljIGludCBtc2EzMTFfY2hpcF9pbml0KHN0cnVjdCBtc2EzMTFfcHJpdiAqbXNhMzExKQo+PiAg
IAkJCQkgICAgICJmYWlsZWQgdG8gdW5tYXAgbWFwMC9tYXAxIGludGVycnVwdHNcbiIpOwo+PiAg
IAo+PiAgIAkvKiBEaXNhYmxlIGFsbCBheGVzIGJ5IGRlZmF1bHQgKi8KPj4gLQllcnIgPSByZWdt
YXBfdXBkYXRlX2JpdHMobXNhMzExLT5yZWdzLCBNU0EzMTFfT0RSX1JFRywKPj4gLQkJCQkgTVNB
MzExX0dFTk1BU0soRl9YX0FYSVNfRElTKSB8Cj4+IC0JCQkJIE1TQTMxMV9HRU5NQVNLKEZfWV9B
WElTX0RJUykgfAo+PiAtCQkJCSBNU0EzMTFfR0VOTUFTSyhGX1pfQVhJU19ESVMpLCAwKTsKPj4g
KwllcnIgPSByZWdtYXBfY2xlYXJfYml0cyhtc2EzMTEtPnJlZ3MsIE1TQTMxMV9PRFJfUkVHLAo+
PiArCQkJCU1TQTMxMV9HRU5NQVNLKEZfWF9BWElTX0RJUykgfCBNU0EzMTFfR0VOTUFTSyhGX1lf
QVhJU19ESVMpIHwgTVNBMzExX0dFTk1BU0soRl9aX0FYSVNfRElTKSk7Cj4gVG9vIGxvbmcKPgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL2NwY2FwLWFkYy5jIGIvZHJpdmVycy9paW8v
YWRjL2NwY2FwLWFkYy5jCj4+IGluZGV4IGI2YzRlZjcwNDg0ZS4uOGZhYmY3NDhjMzZiIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2lpby9hZGMvY3BjYXAtYWRjLmMKPj4gKysrIGIvZHJpdmVycy9p
aW8vYWRjL2NwY2FwLWFkYy5jCj4+IEBAIC0zODUsOSArMzg1LDggQEAgc3RhdGljIGlycXJldHVy
bl90IGNwY2FwX2FkY19pcnFfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRhdGEpCj4+IEBAIC00MjQs
MjMgKzQyMywxNyBAQCBzdGF0aWMgdm9pZCBjcGNhcF9hZGNfc2V0dXBfY2FsaWJyYXRlKHN0cnVj
dCBjcGNhcF9hZGMgKmRkYXRhLAo+PiAgIAlpZiAoZXJyb3IpCj4+ICAgCQlyZXR1cm47Cj4+ICAg
Cj4+IC0JZXJyb3IgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGRhdGEtPnJlZywgQ1BDQVBfUkVHX0FE
Q0MyLAo+PiAtCQkJCSAgIENQQ0FQX0JJVF9BVE9YX1BTX0ZBQ1RPUiB8Cj4+IC0JCQkJICAgQ1BD
QVBfQklUX0FEQ19QU19GQUNUT1IxIHwKPj4gLQkJCQkgICBDUENBUF9CSVRfQURDX1BTX0ZBQ1RP
UjAsCj4+IC0JCQkJICAgMCk7Cj4+ICsJZXJyb3IgPSByZWdtYXBfY2xlYXJfYml0cyhkZGF0YS0+
cmVnLCBDUENBUF9SRUdfQURDQzIsCj4+ICsJCQkJICBDUENBUF9CSVRfQVRPWF9QU19GQUNUT1Ig
fCBDUENBUF9CSVRfQURDX1BTX0ZBQ1RPUjEgfCBDUENBUF9CSVRfQURDX1BTX0ZBQ1RPUjApOwo+
IFRoYXQgb25lIGlzIG92ZXIgMTAwIQo+PiAgIAlpZiAoZXJyb3IpCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lpby9neXJvL21wdTMwNTAtY29yZS5jIGIvZHJpdmVycy9paW8vZ3lyby9tcHUzMDUw
LWNvcmUuYwo+PiBpbmRleCBhNzkxYmEzYTY5M2EuLmZmMWM4MTU1MzA0NSAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9paW8vZ3lyby9tcHUzMDUwLWNvcmUuYwo+PiArKysgYi9kcml2ZXJzL2lpby9n
eXJvL21wdTMwNTAtY29yZS5jCj4+ICAgCj4+IEBAIC01MTMsMTIgKzUxMyw4IEBAIHN0YXRpYyBp
cnFyZXR1cm5fdCBtcHUzMDUwX3RyaWdnZXJfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpwKQo+PiAg
IAkJCQkgIkZJRk8gb3ZlcmZsb3chIEVtcHR5aW5nIGFuZCByZXNldHRpbmcgRklGT1xuIik7Cj4+
ICAgCQkJZmlmb19vdmVyZmxvdyA9IHRydWU7Cj4+ICAgCQkJLyogUmVzZXQgYW5kIGVuYWJsZSB0
aGUgRklGTyAqLwo+PiAtCQkJcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKG1wdTMwNTAtPm1hcCwK
Pj4gLQkJCQkJCSBNUFUzMDUwX1VTUl9DVFJMLAo+PiAtCQkJCQkJIE1QVTMwNTBfVVNSX0NUUkxf
RklGT19FTiB8Cj4+IC0JCQkJCQkgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX1JTVCwKPj4gLQkJCQkJ
CSBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fRU4gfAo+PiAtCQkJCQkJIE1QVTMwNTBfVVNSX0NUUkxf
RklGT19SU1QpOwo+PiArCQkJcmV0ID0gcmVnbWFwX3NldF9iaXRzKG1wdTMwNTAtPm1hcCwgTVBV
MzA1MF9VU1JfQ1RSTCwKPj4gKwkJCQkJICAgICAgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX0VOIHwg
TVBVMzA1MF9VU1JfQ1RSTF9GSUZPX1JTVCk7Cj4gS2VlcCB0aGUgbGluZSBicmVhayB0byBzdGF5
IHVuZGVyIDgwIGNoYXJzLgo+Cj4+IEBAIC05OTcsMTEgKzk5MSw4IEBAIHN0YXRpYyBpbnQgbXB1
MzA1MF9kcmR5X3RyaWdnZXJfc2V0X3N0YXRlKHN0cnVjdCBpaW9fdHJpZ2dlciAqdHJpZywKPj4g
ICAJCQlyZXR1cm4gcmV0Owo+PiAgIAo+PiAgIAkJLyogUmVzZXQgYW5kIGVuYWJsZSB0aGUgRklG
TyAqLwo+PiAtCQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMobXB1MzA1MC0+bWFwLCBNUFUzMDUw
X1VTUl9DVFJMLAo+PiAtCQkJCQkgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX0VOIHwKPj4gLQkJCQkJ
IE1QVTMwNTBfVVNSX0NUUkxfRklGT19SU1QsCj4+IC0JCQkJCSBNUFUzMDUwX1VTUl9DVFJMX0ZJ
Rk9fRU4gfAo+PiAtCQkJCQkgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX1JTVCk7Cj4+ICsJCXJldCA9
IHJlZ21hcF9zZXRfYml0cyhtcHUzMDUwLT5tYXAsIE1QVTMwNTBfVVNSX0NUUkwsCj4+ICsJCQkJ
ICAgICAgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX0VOIHwgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX1JT
VCk7Cj4gRm9yIElJTyBzdHVmZiB0cnkgYW5kIHN0YXkgdW5kZXIgODAgY2hhcnMgdW5sZXNzIHRo
ZXJlIGlzIGEgc3Ryb25nCj4gcmVhZGFiaWxpdHkgYXJndW1lbnQgZm9yIGdvaW5nIGxvbmdlci4g
IEhlcmUgdGhlcmUgaXNuJ3Qgb25lLgo+Cj4+ICAgCQlpZiAocmV0KQo+PiAgIAkJCXJldHVybiBy
ZXQ7Cj4+ICAgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
