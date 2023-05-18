Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4857079C4
	for <lists+linux-stm32@lfdr.de>; Thu, 18 May 2023 07:47:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9640CC6B443;
	Thu, 18 May 2023 05:47:20 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16294C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 May 2023 05:47:19 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-9661a1ff1e9so240111166b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 22:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684388838; x=1686980838;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7eRcxPv6i2LjuI0pmkTnJMMBCOEi56+JVbuNv0/EY6A=;
 b=i4M5i6CngU1gIAj3bi2+OhwykS7aRAbrnmy9w0luZcc0vUrHxxnpo5Jdw+5WcRjtgS
 ZLZMnDAzG3/ub7HKvXy0qO9uFKfMcf8q6RyLCwzWheGhA0bN+LJALnxCeqSe4gW+0oHm
 7kbBUKuOonb4WUpBdJZOmSrf+M66kzorNjV51KpcWETJnyBPdMI9Yizp78EIkc/SwlYu
 zYbDWWiQfEWqe0zCLA98nT8qgXuCflf3+sjyHHJixah0QndLq726llaEW/VTWNyo2bl6
 5lDqbE1iwJx4NfAdySNww/Gow9Cq/P3aATQx+j0UQhcPq2PcNZmaZvcS0yYtViMj1QaY
 RatA==
X-Gm-Message-State: AC+VfDxeibzlQZj5ykz8k6NdtOFOItgIBl39tOtLRhObNYDoKTXdQbTZ
 rWj2SO2YsFnZb4a/EPV4r9s=
X-Google-Smtp-Source: ACHHUZ59I3H6vUmV1k3rny1D7mM/VmSjzgyyobWhn5a5iNKfaVT+8oqh13OcdcYgyqKUF0ypB2Lmvw==
X-Received: by 2002:a17:906:7949:b0:969:ffcb:1eb4 with SMTP id
 l9-20020a170906794900b00969ffcb1eb4mr28875926ejo.2.1684388838321; 
 Wed, 17 May 2023 22:47:18 -0700 (PDT)
Received: from [10.223.1.187] ([195.39.106.162])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a170906660200b0096557203071sm481061ejp.217.2023.05.17.22.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 22:47:17 -0700 (PDT)
Message-ID: <0e159dd4-a693-8c8c-2810-f60eb3a7f74c@kernel.org>
Date: Thu, 18 May 2023 07:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230512173810.131447-1-u.kleine-koenig@pengutronix.de>
 <20230512173810.131447-2-u.kleine-koenig@pengutronix.de>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230512173810.131447-2-u.kleine-koenig@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-serial@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH 1/2] serial: stm32: Ignore return value of
 uart_remove_one_port() in .remove()
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

T24gMTIuIDA1LiAyMywgMTk6MzgsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IFJldHVybmlu
ZyBlYXJseSBmcm9tIHN0bTMyX3VzYXJ0X3NlcmlhbF9yZW1vdmUoKSByZXN1bHRzIGluIGEgcmVz
b3VyY2UKPiBsZWFrIGFzIHNldmVyYWwgY2xlYW51cCBmdW5jdGlvbnMgYXJlIG5vdCBjYWxsZWQu
IFRoZSBkcml2ZXIgY29yZSBpZ25vcmVzCj4gdGhlIHJldHVybiB2YWx1ZSBhbmQgdGhlcmUgaXMg
bm8gcG9zc2liaWxpdHkgdG8gY2xlYW4gdXAgbGF0ZXIuCj4gCj4gdWFydF9yZW1vdmVfb25lX3Bv
cnQoKSBvbmx5IHJldHVybnMgbm9uLXplcm8gaWYgdGhlcmUgaXMgc29tZQo+IGluY29uc2lzdGVu
Y3kgKGkuZS4gc3RtMzJfdXNhcnRfZHJpdmVyLnN0YXRlW3BvcnQtPmxpbmVdLnVhcnRfcG9ydCA9
PSBOVUxMKS4KPiBUaGlzIHNob3VsZCBuZXZlciBoYXBwZW4sIGFuZCBldmVuIGlmIGl0IGRvZXMg
aXQncyBhIGJhZCBpZGVhIHRvIGV4aXQKPiBlYXJseSBpbiB0aGUgcmVtb3ZlIGNhbGxiYWNrIHdp
dGhvdXQgY2xlYW5pbmcgdXAuCj4gCj4gVGhpcyBwcmVwYXJlcyBjaGFuZ2luZyB0aGUgcHJvdG90
eXBlIG9mIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXI6OnJlbW92ZSB0bwo+IHJldHVybiB2b2lkLiBT
ZWUgY29tbWl0IDVjNWE3NjgwZTY3YiAoInBsYXRmb3JtOiBQcm92aWRlIGEgcmVtb3ZlIGNhbGxi
YWNrCj4gdGhhdCByZXR1cm5zIG5vIHZhbHVlIikgZm9yIGZ1cnRoZXIgZGV0YWlscyBhYm91dCB0
aGlzIHF1ZXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpSZXZpZXdlZC1ieTogSmlyaSBTbGFieSA8amlyaXNs
YWJ5QGtlcm5lbC5vcmc+Cgp0aGFua3MsCi0tIApqcwpzdXNlIGxhYnMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
