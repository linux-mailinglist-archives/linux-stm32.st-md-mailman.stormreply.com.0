Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D784564DFA
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jul 2022 08:51:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19DE0C640F4;
	Mon,  4 Jul 2022 06:51:56 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26676C03FE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 06:51:55 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id o25so15027635ejm.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Jul 2022 23:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V3WLzRQE5hlj9Ag2r0vYMFsjKsgZON5RNX5KPeYiXww=;
 b=6bCByHQM/8fa5xqYVoyEY4oLubRHnFpMGC+pDK7DYUvIQtcArANmkvxZVzMFMeQaP8
 Eq8Ga/0cATbhzIe0ClfgPV5Gi6ZmPKBmH5WuNaYCZcAn0JuM5X8Nip+8jG3JJ6fataZE
 X24JKOr4a9a+ByaM4h8OTxKFuzRgGi2UJyf/QthgfjtYga43ZY7BFOyE+R+HNO0C641u
 f34l+UhHP/2dHq+gv0ac0eExYCS5DkinvmdXBAT+4DXqqFc/qNaLlz8TtdGQQRnsE0xn
 HR2iTSd/PXYpZEuqvc3A5aNNs93ysRTrcjfieCBHojNQBzUPY3I5BgstyxXFztE2iDc9
 1C6Q==
X-Gm-Message-State: AJIora+5pQDJxbicFKfsXib3VgjLlNha9kUa7GxZaqYlXnPcILXGXJMc
 ZzklKV3StfLBSur+GEj1dmc=
X-Google-Smtp-Source: AGRyM1v8dChAQI8X41cjbxblEKGrrl0gDwkuRmFOZKgWiz0FHKJWfFar01jZsrywV4UoVL2Tkx3+Ww==
X-Received: by 2002:a17:906:8315:b0:726:38da:f0f with SMTP id
 j21-20020a170906831500b0072638da0f0fmr27302882ejx.462.1656917514750; 
 Sun, 03 Jul 2022 23:51:54 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a056402249000b00438a13508c4sm8472754eda.51.2022.07.03.23.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 23:51:54 -0700 (PDT)
Message-ID: <60678c81-27bf-6f37-bae5-ccc91d714204@kernel.org>
Date: Mon, 4 Jul 2022 08:51:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>,
 Richard Genoud <richard.genoud@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20220624204210.11112-1-ilpo.jarvinen@linux.intel.com>
 <20220624204210.11112-5-ilpo.jarvinen@linux.intel.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220624204210.11112-5-ilpo.jarvinen@linux.intel.com>
Cc: Lukas Wunner <lukas@wunner.de>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v9 4/6] serial: take termios_rwsem for
 ->rs485_config() & pass termios as param
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

T24gMjQuIDA2LiAyMiwgMjI6NDIsIElscG8gSsOkcnZpbmVuIHdyb3RlOgo+IFRvIGJlIGFibGUg
dG8gYWx0ZXIgQUREUkIgd2l0aGluIC0+cnM0ODVfY29uZmlnKCksIHRha2UgdGVybWlvc19yd3Nl
bQo+IGJlZm9yZSBjYWxsaW5nIC0+cnM0ODVfY29uZmlnKCkgYW5kIHBhc3MgdGVybWlvcy4KCk9L
LCBGVFIsIHdvcnRoIG5vdGluZyB0aGUgdHR5LT50ZXJtaW9zX3J3c2VtIC0+IHBvcnQtPm11dGV4
IGxvY2sgY2hhaW4gCmlzIHByZWV4aXN0aW5nLgoKQW55d2F5LCBJJ20gbm90IHN1cmUgSSBidXkg
dGhlIGFib3ZlLiBXaHkgaXMgdGVybWlvc19yd3NlbSBuZWVkZWQgdG8gCmFsdGVyIEFERFJCPwoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmMgYi9kcml2ZXJz
L3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUuYwo+IGluZGV4IDYyMWZjMTVlMmU1NC4uNDRjMzc4NTQ0
NWUzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfY29yZS5jCj4gKysr
IGIvZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmMKLi4uCj4gQEAgLTE1MTEsNiArMTUx
MSwxMCBAQCB1YXJ0X2lvY3RsKHN0cnVjdCB0dHlfc3RydWN0ICp0dHksIHVuc2lnbmVkIGludCBj
bWQsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ICAgCWlmIChyZXQgIT0gLUVOT0lPQ1RMQ01EKQo+ICAg
CQlnb3RvIG91dDsKPiAgIAo+ICsJLyogcnM0ODVfY29uZmlnIHJlcXVpcmVzIG1vcmUgbG9ja2lu
ZyB0aGFuIG90aGVycyAqLwo+ICsJaWYgKGNtZCA9PSBUSU9DR1JTNDg1KQo+ICsJCWRvd25fd3Jp
dGUoJnR0eS0+dGVybWlvc19yd3NlbSk7Cj4gKwo+ICAgCW11dGV4X2xvY2soJnBvcnQtPm11dGV4
KTsKPiAgIAl1cG9ydCA9IHVhcnRfcG9ydF9jaGVjayhzdGF0ZSk7Cj4gICAKLi4uCj4gQEAgLTE1
NTEsNiArMTU1NSw4IEBAIHVhcnRfaW9jdGwoc3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSwgdW5zaWdu
ZWQgaW50IGNtZCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gICAJfQo+ICAgb3V0X3VwOgo+ICAgCW11
dGV4X3VubG9jaygmcG9ydC0+bXV0ZXgpOwo+ICsJaWYgKGNtZCA9PSBUSU9DR1JTNDg1KQo+ICsJ
CXVwX3dyaXRlKCZ0dHktPnRlcm1pb3NfcndzZW0pOwo+ICAgb3V0Ogo+ICAgCXJldHVybiByZXQ7
Cj4gICB9Cgp0aGFua3MsCi0tIApqcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
