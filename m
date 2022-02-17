Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FF84B9BE7
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Feb 2022 10:22:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FD0BC5F1F2;
	Thu, 17 Feb 2022 09:22:06 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A75C5CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Feb 2022 09:22:05 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 k127-20020a1ca185000000b0037bc4be8713so5658756wme.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Feb 2022 01:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uEF/FU/QB3+JPW9i0x2lAGeqkeJMKwTkLaDfp85o4eA=;
 b=DY+MxSUAazGgw0yYDJltTUdAkc4UgtVq4+ctUknKf21YBPaMDiGfUnVX7BHtJJuqHu
 1SYdMuGzCw+h4q8+FwO+M7XjGOkzjXPQXhTwf+I9PpvoHSRBA7ehI1K3BugPXbedrc1p
 aVCOobSkjGFu+kR91na4ZDELFbcmv+HlgA1AhukRVY4kzK+XIK2j+TyqNlRN/gd+Of8X
 UoYHrOua6xlip9UDXmcWaMftQmZ4uA2bIKAOPpCj3yS/X50MySCDwh/RP6Pxma3ui19H
 exH1l/GR9ZT+PrEB9p+ai3Fvt3S68xBiawm9KjnFnYyGYdVy02sqs/MBti/L5jSXVGY9
 Dylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uEF/FU/QB3+JPW9i0x2lAGeqkeJMKwTkLaDfp85o4eA=;
 b=Lp5p7OJKg+EzJracwHSWWShzG8uXizx4WZA1JCY3WVKmOuw1g4UoAe05BgO0H/qLae
 RYd6f4batnIiZexQViN5bjFaigsx69P/wFTNtIfbGxDtY24TR2ljU1vjjmHBPq882ogc
 cIwdeRhVjjXQP97isM47AcYvRSESUOXAYfnAKlTDsTdXpuarjgMwjPkYDJix7Da9rdQY
 RvDgwN8uy+MdkWA3EZpsQiMTeZL1KoWKuG5ow6wHB35fGyUXhhiWGZvM6A75XvU2slZR
 uNq2sD5jJRjngn6aTZstIYCWM4AtaYVyj87Zq5DgADzui/xIPZggl2ZT5WKL3TQdwH89
 kH9w==
X-Gm-Message-State: AOAM533+J6Rp8FU/1LjVDEYcewRguw9GpY2S29aKOi/XjDXuLe6s7Dpo
 lxb5OWP2WRhfzsc1B7XVgr8=
X-Google-Smtp-Source: ABdhPJxLAKZpTcdUX9zsbSPT39Xp2a3eU0dgLLZ3ehz2f2hFJv3v5S8CmNO4M+fKKNRAi5NErhBVvg==
X-Received: by 2002:a1c:7c0d:0:b0:37d:1e29:5cc6 with SMTP id
 x13-20020a1c7c0d000000b0037d1e295cc6mr5162767wmc.31.1645089725110; 
 Thu, 17 Feb 2022 01:22:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:181:90d0:6ce1:d6aa:6a23:353b?
 ([2a01:e0a:181:90d0:6ce1:d6aa:6a23:353b])
 by smtp.gmail.com with ESMTPSA id f18sm1184725wre.66.2022.02.17.01.22.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 01:22:04 -0800 (PST)
Message-ID: <b8721c78-e422-7dff-3cf1-7a9bcda6dce3@gmail.com>
Date: Thu, 17 Feb 2022 10:22:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: fr-FR
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, u.kleine-koenig@pengutronix.de
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
 <20220216001803.637-10-LinoSanfilippo@gmx.de>
From: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <20220216001803.637-10-LinoSanfilippo@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, richard.genoud@gmail.com, festevam@gmail.com,
 s.hauer@pengutronix.de, linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2 9/9] serial: atmel: remove redundant
 assignment in rs485_config
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

CkxlIDE2LzAyLzIwMjIgw6AgMDE6MTgsIExpbm8gU2FuZmlsaXBwbyBhIMOpY3JpdMKgOgo+IElu
IHVhcnRfc2V0X3JzNDg1X2NvbmZpZygpIHRoZSBzZXJpYWwgY29yZSBhbHJlYWR5IGFzc2lnbnMg
dGhlIHBhc3NlZAo+IHNlcmlhbF9yczQ4NSBzdHJ1Y3QgdG8gdGhlIHVhcnQgcG9ydC4KPiAKPiBT
byByZW1vdmUgdGhlIGFzc2lnbm1lbnQgZnJvbSB0aGUgZHJpdmVycyByczQ4NV9jb25maWcoKSBm
dW5jdGlvbiB0byBhdm9pZAo+IHJlZHVuZGFuY3kuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGlubyBT
YW5maWxpcHBvIDxMaW5vU2FuZmlsaXBwb0BnbXguZGU+CkFja2VkLWJ5OiBSaWNoYXJkIEdlbm91
ZCA8cmljaGFyZC5nZW5vdWRAZ21haWwuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvdHR5L3Nlcmlh
bC9hdG1lbF9zZXJpYWwuYyB8IDQgKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwv
YXRtZWxfc2VyaWFsLmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvYXRtZWxfc2VyaWFsLmMKPiBpbmRl
eCAyZDA5YTg5OTc0YTIuLjJhYjU4OWEzZDg2YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3R0eS9z
ZXJpYWwvYXRtZWxfc2VyaWFsLmMKPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvYXRtZWxfc2Vy
aWFsLmMKPiBAQCAtMjk5LDExICsyOTksOSBAQCBzdGF0aWMgaW50IGF0bWVsX2NvbmZpZ19yczQ4
NShzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0LAo+ICAgCS8qIFJlc2V0dGluZyBzZXJpYWwgbW9kZSB0
byBSUzIzMiAoMHgwKSAqLwo+ICAgCW1vZGUgJj0gfkFUTUVMX1VTX1VTTU9ERTsKPiAgIAo+IC0J
cG9ydC0+cnM0ODUgPSAqcnM0ODVjb25mOwo+IC0KPiAgIAlpZiAocnM0ODVjb25mLT5mbGFncyAm
IFNFUl9SUzQ4NV9FTkFCTEVEKSB7Cj4gICAJCWRldl9kYmcocG9ydC0+ZGV2LCAiU2V0dGluZyBV
QVJUIHRvIFJTNDg1XG4iKTsKPiAtCQlpZiAocG9ydC0+cnM0ODUuZmxhZ3MgJiBTRVJfUlM0ODVf
UlhfRFVSSU5HX1RYKQo+ICsJCWlmIChyczQ4NWNvbmYtPmZsYWdzICYgU0VSX1JTNDg1X1JYX0RV
UklOR19UWCkKPiAgIAkJCWF0bWVsX3BvcnQtPnR4X2RvbmVfbWFzayA9IEFUTUVMX1VTX1RYUkRZ
Owo+ICAgCQllbHNlCj4gICAJCQlhdG1lbF9wb3J0LT50eF9kb25lX21hc2sgPSBBVE1FTF9VU19U
WEVNUFRZOwoKVGhhbmtzICEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
