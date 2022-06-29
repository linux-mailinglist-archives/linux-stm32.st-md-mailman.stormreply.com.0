Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E6455F9FA
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 10:09:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81AB7C5F1EE;
	Wed, 29 Jun 2022 08:09:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38055C04001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 08:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656490147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=;
 b=fgsDzeyRjFEk2KeWSqmbecKyn25Vy9Yr9ksDNykkz9dbfibRQ1L2qZtCKWDjwTLV/Uk6rf
 5eskSYYjJuqE8dTfdzbVu/c8lHf9ZfI/MxhZTUQ/0PRnz/2WCOCjXmOWpkNEs2HTUBOUZc
 hcCoase9/NGzpmY7V6jwkU2icPl1iRM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-mJjmRrhiPa6Z_6YEsfRsrA-1; Wed, 29 Jun 2022 04:09:05 -0400
X-MC-Unique: mJjmRrhiPa6Z_6YEsfRsrA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso6293598wma.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 01:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=;
 b=v2Su+XfJcIN8SX03E+uIeQtvzBPZ8CkMID9am75Mc6x6mwFanm/Huv0z/5QDg/UYfy
 KCxZ9Ghk1gL1SfDf1gBqBG9C5KBEZADUt3t6jfVHLaJL8T3nD6fVlb9mE8YLmsPzXEiT
 40qsbMz8QYjLDze2o/vMgLramz3O2rAJHws1Le+JuWwYZ6DDzzS2wFi9/DwXRGUyUBYm
 aug29uv51Ejf4gCzDbfzZDt+SwQPG7q+w3QiG/K9L0jtrJ62cwSLKO/SJEplvkoAccyw
 ZugDtQ8oGFE84X/F/Ktc1De4V2FDpxELmITDXeMU5oAAh/8JzDMAuLkQISWbU8UMWet6
 df3g==
X-Gm-Message-State: AJIora/0mb6PP4qiVgzexUHQZRQkN7a7sWQY7mn7QTUqxZjsHKgHsgst
 SSeYxsYgsfQhtr+FKMWm6R/i8eJ1djaH7aNCoVpQYJK4N0eEEW/L3FuEWBenQ6eMYW6hbpUhPFs
 S618QeXltHOgmfQRk1UKMMh9ukqWCD2X9sRZhaNCq
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9d5 with SMTP id
 a6-20020a05600c224600b003a04d14e9d5mr2201665wmm.70.1656490144655; 
 Wed, 29 Jun 2022 01:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usFW/96xeCeX9gWa5EcwEsowhB540yEb4Gaanj9433iMcJH3n1uDXhdEWzSLPQicn1TmuJ9w==
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9d5 with SMTP id
 a6-20020a05600c224600b003a04d14e9d5mr2201616wmm.70.1656490144372; 
 Wed, 29 Jun 2022 01:09:04 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c358200b003942a244f47sm2507134wmq.32.2022.06.29.01.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 01:09:03 -0700 (PDT)
Message-ID: <a5a3e2ca-030a-4838-296e-50dbb6d87330@redhat.com>
Date: Wed, 29 Jun 2022 10:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jeremy Kerr <jk@codeconstruct.com.au>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
 <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
 <5517f329-b6ba-efbd-ccab-3d5caa658b80@csgroup.eu>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <5517f329-b6ba-efbd-ccab-3d5caa658b80@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "acpi4asus-user@lists.sourceforge.net" <acpi4asus-user@lists.sourceforge.net>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 Wolfram Sang <wsa@kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
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

T24gNi8yOS8yMiAwOTo1NSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAyOS8w
Ni8yMDIyIMOgIDA5OjIzLCBVd2UgS2xlaW5lLUvDtm5pZyBhIMOpY3JpdMKgOgo+PiBIZWxsbywK
Pj4KPj4gW0kgZHJvcHBlZCBuZWFybHkgYWxsIGluZGl2aWR1YWxzIGZyb20gdGhlIENjOiBsaXN0
IGJlY2F1c2UgdmFyaW91cwo+PiBib3VuY2VzIHJlcG9ydGVkIHRvIGJlIHVuaGFwcHkgYWJvdXQg
dGhlIGxvbmcgKGxvZ2ljYWwpIGxpbmUuXQo+IAo+IEdvb2QgaWRlYSwgZXZlbiBwYXRjaHdvcmsg
bWFkZSBhIG1lc3Mgb2YgaXQsIHNlZSAKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMjIwNjI4MTQwMzEzLjc0OTg0LTctdS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlLwo+IAoKRllJLCBmb3IgcGF0Y2hlcyBsaWtlIHRoZXNlIHdo
YXQgSSB1c3VhbGx5IHVzZSBpczoKCi4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAtLW5vZ2l0
LWZhbGxiYWNrIC0tbm8tbSAtLW5vLXIKCi0tIApCZXN0IHJlZ2FyZHMsCgpKYXZpZXIgTWFydGlu
ZXogQ2FuaWxsYXMKTGludXggRW5naW5lZXJpbmcKUmVkIEhhdAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
