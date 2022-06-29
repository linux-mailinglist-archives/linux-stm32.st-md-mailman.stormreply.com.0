Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0B655F925
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 09:37:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58AE7C5F1EE;
	Wed, 29 Jun 2022 07:37:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A208C04001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 07:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656488235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1h0smKgkaQYyMckjg1gEO+92UXCJgyf7f6YfzsCAFg4=;
 b=Yee1Q7EYn12pBlgOLi2B58zPMomPzdqfKtxSB3qvOJaExRiy99h2saX9jDy9ftjD1JHoex
 cPfeE4FdB7vfNbdKbOFDOeqkAV9HD5O9jckAZKJfDwWjhQ8YIraRPfHNkD4/I984yzYC3t
 DBJiHcI8+wWSO8WFW3+9lBICHWH6c5w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-N9Q8HT45P_ifVLaJNz-ooA-1; Wed, 29 Jun 2022 03:37:12 -0400
X-MC-Unique: N9Q8HT45P_ifVLaJNz-ooA-1
Received: by mail-wm1-f71.google.com with SMTP id
 h125-20020a1c2183000000b003a03a8475c6so5757981wmh.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 00:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1h0smKgkaQYyMckjg1gEO+92UXCJgyf7f6YfzsCAFg4=;
 b=CmkzyomICi6ZBvpapnng83+AlouA6x5lfulrutNJRu+Zsyk60fIqGB1XhSSxa9zt6K
 5mdi5N0GzouViJCzj8a7DUCMl2nonrLe1yG6jqNdMoPZRil58LheHs3VUNf4dA/Wom3G
 hmCrJ8URG3FCOsiZzpF0+ev3W41L8/HTglBiq/UXqYSX3rjD5+uR9szgN4hOIFEX/Qdy
 Xmrb5sXLcynxASSw9QfDXWs31RSQP5TW4cGcHvDyy7yipIN7R6qrJc6N12L6eU8lbPsw
 ENrG37QOAoRzTcLMEhFJdXDp8qG2N/hD2VJNFP81l8YYxemdavrgloIs+REBDLHyJD9E
 fz6g==
X-Gm-Message-State: AJIora/IDEaQMfrMtMth+Uz4BHJJLCbCSstQGkX2q4frXwwopl+G9EGK
 rBcdDxlMrfx7V1MvwlIQ2tKPeZjDZAXMXatwYIOpPdTU7JigJzh0EnlYpZyQwcomRQ5jg9yn19p
 pkpEL+/gizC/H3vD5kQRRCEuJQNhdnFMJhyGJ0axO
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id
 v8-20020a056000144800b0021bb7dbc40bmr1650253wrx.279.1656488230976; 
 Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfq7mqFRSJqFJPQOP6rs25Ch1nA7fBeueZwuaRaLaWENw0ay54yTOP4QHXmGLo1NEA4L9c5g==
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id
 v8-20020a056000144800b0021bb7dbc40bmr1650238wrx.279.1656488230741; 
 Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j10-20020a5d448a000000b0021b8c99860asm15832366wrq.115.2022.06.29.00.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
Message-ID: <7654a74e-a410-a8a5-c228-d006dbbc200f@redhat.com>
Date: Wed, 29 Jun 2022 09:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jeremy Kerr <jk@codeconstruct.com.au>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
 <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 patches@opensource.cirrus.com, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-staging@lists.linux.dev, kasan-dev@googlegroups.com,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@kernel.org>,
 linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
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

T24gNi8yOS8yMiAwOToyMywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
W0kgZHJvcHBlZCBuZWFybHkgYWxsIGluZGl2aWR1YWxzIGZyb20gdGhlIENjOiBsaXN0IGJlY2F1
c2UgdmFyaW91cwo+IGJvdW5jZXMgcmVwb3J0ZWQgdG8gYmUgdW5oYXBweSBhYm91dCB0aGUgbG9u
ZyAobG9naWNhbCkgbGluZS5dCj4KClllcywgaXQgYWxzbyBib3VuY2VkIGZvciBtZSB3aGVuIEkg
dHJpZWQgdG8gcmVwbHkgZWFybGllciB0b2RheS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9zb2xvbW9uL3NzZDEzMHgtaTJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2Qx
MzB4LWkyYy5jCj4gaW5kZXggMWUwZmNlYzdiZTQ3Li5kZGZhMGJiNWQ5YzkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC1pMmMuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9zb2xvbW9uL3NzZDEzMHgtaTJjLmMKPiBAQCAtMzksMTMgKzM5LDExIEBAIHN0YXRp
YyBpbnQgc3NkMTMweF9pMmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiAgCXJl
dHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IHNzZDEzMHhfaTJjX3JlbW92ZShzdHJ1Y3Qg
aTJjX2NsaWVudCAqY2xpZW50KQo+ICtzdGF0aWMgdm9pZCBzc2QxMzB4X2kyY19yZW1vdmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiAgewo+ICAJc3RydWN0IHNzZDEzMHhfZGV2aWNlICpz
c2QxMzB4ID0gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVudCk7Cj4gIAo+ICAJc3NkMTMweF9yZW1v
dmUoc3NkMTMweCk7Cj4gLQo+IC0JcmV0dXJuIDA7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIHNz
ZDEzMHhfaTJjX3NodXRkb3duKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCgpSZXZpZXdlZC1i
eTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+IAotLSAKQmVz
dCByZWdhcmRzLAoKSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzCkxpbnV4IEVuZ2luZWVyaW5nClJl
ZCBIYXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
