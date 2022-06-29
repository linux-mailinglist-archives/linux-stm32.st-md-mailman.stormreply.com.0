Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8605603B7
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 17:01:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D4AEC5F1F2;
	Wed, 29 Jun 2022 15:01:44 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA97DC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 14:25:58 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id fi2so32909282ejb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 07:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nzVAkjUIXnSmifmZO/KNuTW33GCGTCzsi9aX026XXeg=;
 b=S2dVib/eYmAFl827WdIoCLllzfbxALRjIjzfRRwuBWpdbVEMsjXdf1fQZ0QK1n2n0J
 7Rc0uKmDUlj06sv7gme85B+3fLmze+mOouy0tIsuBDVpy1nD4eEh9k2i1LyAyfo/z7Zj
 KDlk5RBwfb1T/0o1rVzuZORFiKZsCvSsNfve9fNt60vuT8XdzQWLTwkS/9FAhK69nmEs
 mEzSIHBFyIvznhb3ZYEmWznM5HxrpFTwi8PXn2kSF7LDJWEQQU2316sTZ03OvudAaN+G
 thYeRK11RnXT7zItby/QP43/O2E1Z4EfVZv3Nyn7dRrR7zoEuvKZKKrx+f9P5pfvx3Rg
 uLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nzVAkjUIXnSmifmZO/KNuTW33GCGTCzsi9aX026XXeg=;
 b=6zAVep4EX9rm6fZXRJaVUg+e/wMiX2VQ9VYCC6EwHNtFoohIamQnyxND4M43UKC/a9
 xZuvmg/mlMvFrkEoaLyzTKZA+YLLgOuPyMAniVFhbGiiJX+QYazJ8b1hIjdlrDSsk5+a
 3Biy/R9KVMvQorlzxbPIQdP1TiKENp2kTQa+01G5K3qseeDna8GxhreGLDpum9iEgGQa
 8ORMDSuIBRjifeRpUThHy/kgrWPUFbqmMavk6cIhUuBzycOCEmvad7OGx4t7pPaFOLSZ
 g5crBfg8/T1d7jlHiK2B/3Wu8Q2b0ha752yU964TdD9FWENvo4LdngxrHG1vbN9Ld4jj
 hloA==
X-Gm-Message-State: AJIora8YBgebshd9p+t9/GiZVAa0+krSPKl7+x3OkDe65Fg/iRfHLAJM
 vyJ50e3aV4N3whb5diTTaqE=
X-Google-Smtp-Source: AGRyM1vLxTFMIxeh0MQDJmw094z51hmalDIKhKM+71jelG0gY6NpuuzQXDALY4ZT1iSuYjMs9++euw==
X-Received: by 2002:a17:906:58cf:b0:722:e4e1:c174 with SMTP id
 e15-20020a17090658cf00b00722e4e1c174mr3593366ejs.85.1656512758310; 
 Wed, 29 Jun 2022 07:25:58 -0700 (PDT)
Received: from [10.29.0.16] ([37.120.217.82]) by smtp.gmail.com with ESMTPSA id
 jy19-20020a170907763300b007263713cfe9sm7220580ejc.169.2022.06.29.07.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 07:25:57 -0700 (PDT)
Message-ID: <80117936-6869-19b2-45a6-96a4562c6cd2@gmail.com>
Date: Wed, 29 Jun 2022 16:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Wed, 29 Jun 2022 15:01:43 +0000
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, kasan-dev@googlegroups.com, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-omap@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Bastien Nocera <hadess@hadess.net>,
 linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, Shawn Tu <shawnx.tu@intel.com>,
 linux-hwmon@vger.kernel.org, acpi4asus-user@lists.sourceforge.net,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-gpio@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 platform-driver-x86@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-crypto@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 linux-integrity@vger.kernel.org, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gNi8yOC8yMiAxNjowMywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gRnJvbTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHV3ZUBrbGVpbmUta29lbmlnLm9yZz4KPiAKPiBUaGUgdmFsdWUgcmV0dXJu
ZWQgYnkgYW4gaTJjIGRyaXZlcidzIHJlbW92ZSBmdW5jdGlvbiBpcyBtb3N0bHkgaWdub3JlZC4K
PiAoT25seSBhbiBlcnJvciBtZXNzYWdlIGlzIHByaW50ZWQgaWYgdGhlIHZhbHVlIGlzIG5vbi16
ZXJvIHRoYXQgdGhlCj4gZXJyb3IgaXMgaWdub3JlZC4pCj4gCj4gU28gY2hhbmdlIHRoZSBwcm90
b3R5cGUgb2YgdGhlIHJlbW92ZSBmdW5jdGlvbiB0byByZXR1cm4gbm8gdmFsdWUuIFRoaXMKPiB3
YXkgZHJpdmVyIGF1dGhvcnMgYXJlIG5vdCB0ZW1wdGVkIHRvIGFzc3VtZSB0aGF0IHBhc3Npbmcg
YW4gZXJyb3IgdG8KPiB0aGUgdXBwZXIgbGF5ZXIgaXMgYSBnb29kIGlkZWEuIEFsbCBkcml2ZXJz
IGFyZSBhZGFwdGVkIGFjY29yZGluZ2x5Lgo+IFRoZXJlIGlzIG5vIGludGVuZGVkIGNoYW5nZSBv
ZiBiZWhhdmlvdXIsIGFsbCBjYWxsYmFja3Mgd2VyZSBwcmVwYXJlZCB0bwo+IHJldHVybiAwIGJl
Zm9yZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPgoKWy4uLl0KPiAgIGRyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9z
dXJmYWNlM19wb3dlci5jICAgICAgICAgICAgICAgICB8IDQgKy0tLQoKWy4uLl0KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9zdXJmYWNlM19wb3dlci5jIGIvZHJpdmVy
cy9wbGF0Zm9ybS9zdXJmYWNlL3N1cmZhY2UzX3Bvd2VyLmMKPiBpbmRleCA0NDRlYzgxYmEwMmQu
LjNiMjBkZGRlYjgxNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3N1cmZhY2Uvc3Vy
ZmFjZTNfcG93ZXIuYwo+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9zdXJmYWNlM19w
b3dlci5jCj4gQEAgLTU1NCw3ICs1NTQsNyBAQCBzdGF0aWMgaW50IG1zaHcwMDExX3Byb2JlKHN0
cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gICAJcmV0dXJuIGVycm9yOwo+ICAgfQo+ICAgCj4g
LXN0YXRpYyBpbnQgbXNodzAwMTFfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4g
K3N0YXRpYyB2b2lkIG1zaHcwMDExX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+
ICAgewo+ICAgCXN0cnVjdCBtc2h3MDAxMV9kYXRhICpjZGF0YSA9IGkyY19nZXRfY2xpZW50ZGF0
YShjbGllbnQpOwo+ICAgCj4gQEAgLTU2NCw4ICs1NjQsNiBAQCBzdGF0aWMgaW50IG1zaHcwMDEx
X3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ICAgCQlrdGhyZWFkX3N0b3AoY2Rh
dGEtPnBvbGxfdGFzayk7Cj4gICAKPiAgIAlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoY2RhdGEtPmJh
dDApOwo+IC0KPiAtCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0
IGFjcGlfZGV2aWNlX2lkIG1zaHcwMDExX2FjcGlfbWF0Y2hbXSA9IHsKCkZvciB0aGUgcXVvdGVk
IGFib3ZlOgoKUmV2aWV3ZWQtYnk6IE1heGltaWxpYW4gTHV6IDxsdXptYXhpbWlsaWFuQGdtYWls
LmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
