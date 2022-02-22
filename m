Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADC74BF243
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 07:52:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4C7EC60463;
	Tue, 22 Feb 2022 06:52:39 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B678C60461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 06:52:39 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id qx21so39684607ejb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Feb 2022 22:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=3KiCNnYtMhTLO7dCmwg9IIrAqJrsqdSjvq0y9ThzW3A=;
 b=6P9ylcFX63sbqD6K8LVsTuQQJ2645WbWPNdPgRX3enMEzt0MD9npWGrgrBHVdxFgmW
 ZiYJyKezB00vTh34etUJioHcxVYJEY6XCzS+iqjC1J0iZTMPqd0CKjNIeuqeRWGjklMX
 DDEJ7y2qdJNfEh8ONzkd0Vl8KzXDyTWGmaR6Ojm19VpbrViug+4Mqq6LW9931bnR+rJ2
 zjYEOal15kwnnqZLDbDQWo3dipbKAxowYzeWkhBugVm9X2X0BNHDvFXDAlc+4H6ycP4f
 tjrplJzTb/f1owgt61akJ/Scip/4dkBxnkd6YePfbQT6kJpIJetvdC9qxMW2SykNIfBj
 JJRA==
X-Gm-Message-State: AOAM531xKHIrUOzEiJqmHLq5l9fJlCqIxgt/4dO2pt9dJOW7gpkV+6Kn
 aSc8Lw59cBlZF+8rP5Mx6UY=
X-Google-Smtp-Source: ABdhPJxaNpxWuhXmRofT3wJpeWaHuFbVIMpSvbMGv/p8Z6rw6Rn6E3NujCb1HmmwnDPwMni0Rfncsg==
X-Received: by 2002:a17:906:8493:b0:6ce:710:3739 with SMTP id
 m19-20020a170906849300b006ce07103739mr18139821ejx.409.1645512758577; 
 Mon, 21 Feb 2022 22:52:38 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id e27sm6089342ejm.18.2022.02.21.22.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 22:52:38 -0800 (PST)
Message-ID: <8c65bc42-438e-bf3e-fb76-2a4cbc7296c0@kernel.org>
Date: Tue, 22 Feb 2022 07:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>, gregkh@linuxfoundation.org,
 u.kleine-koenig@pengutronix.de
References: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
 <20220222011433.8761-2-LinoSanfilippo@gmx.de>
 <e883ccb5-68ea-f802-e4fd-864672d8ad7b@kernel.org>
In-Reply-To: <e883ccb5-68ea-f802-e4fd-864672d8ad7b@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, richard.genoud@gmail.com, festevam@gmail.com,
 s.hauer@pengutronix.de, linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: Re: [Linux-stm32] [PATCH v3 1/9] serial: core: move RS485
 configuration tasks from drivers into core
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

T24gMjIuIDAyLiAyMiwgNzo1MSwgSmlyaSBTbGFieSB3cm90ZToKPiBPbiAyMi4gMDIuIDIyLCAy
OjE0LCBMaW5vIFNhbmZpbGlwcG8gd3JvdGU6Cj4+IFNldmVyYWwgZHJpdmVycyB0aGF0IHN1cHBv
cnQgc2V0dGluZyB0aGUgUlM0ODUgY29uZmlndXJhdGlvbiB2aWEgCj4+IHVzZXJzcGFjZQo+PiBp
bXBsZW1lbnQgb25lIG9yIG1vcmUgb2YgdGhlIGZvbGxvd2luZyB0YXNrczoKPj4KPj4gLSBpbiBj
YXNlIG9mIGFuIGludmFsaWQgUlRTIGNvbmZpZ3VyYXRpb24gKGJvdGggUlRTIGFmdGVyIHNlbmQg
YW5kIFJUUyBvbgo+PiDCoMKgIHNlbmQgc2V0IG9yIGJvdGggdW5zZXQpIGZhbGwgYmFjayB0byBl
bmFibGUgUlRTIG9uIHNlbmQgYW5kIGRpc2FibGUgCj4+IFJUUwo+PiDCoMKgIGFmdGVyIHNlbmQK
Pj4KPj4gLSBudWxsaWZ5IHRoZSBwYWRkaW5nIGZpZWxkIG9mIHRoZSByZXR1cm5lZCBzZXJpYWxf
cnM0ODUgc3RydWN0Cj4+Cj4+IC0gY29weSB0aGUgY29uZmlndXJhdGlvbiBpbnRvIHRoZSB1YXJ0
IHBvcnQgc3RydWN0Cj4+Cj4+IC0gbGltaXQgUlRTIGRlbGF5cyB0byAxMDAgbXMKPj4KPj4gTW92
ZSB0aGVzZSB0YXNrcyBpbnRvIHRoZSBzZXJpYWwgY29yZSB0byBtYWtlIHRoZW0gZ2VuZXJpYyBh
bmQgdG8gcHJvdmlkZQo+PiBhIGNvbnNpc3RlbnQgYmVoYXZpb3VyIGFtb25nIGFsbCBkcml2ZXJz
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBMaW5vIFNhbmZpbGlwcG8gPExpbm9TYW5maWxpcHBvQGdt
eC5kZT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfY29yZS5jIHwgMjkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxf
Y29yZS5jIAo+PiBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfY29yZS5jCj4+IGluZGV4IDg0
NjE5MmE3YjRiZi4uMmIzYWZlMDM4YzFjIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJp
YWwvc2VyaWFsX2NvcmUuYwo+PiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUu
Ywo+PiBAQCAtNDIsNiArNDIsMTEgQEAgc3RhdGljIHN0cnVjdCBsb2NrX2NsYXNzX2tleSBwb3J0
X2xvY2tfa2V5Owo+PiDCoCAjZGVmaW5lIEhJR0hfQklUU19PRkZTRVTCoMKgwqAgKChzaXplb2Yo
bG9uZyktc2l6ZW9mKGludCkpKjgpCj4+ICsvKgo+PiArICogTWF4IHRpbWUgd2l0aCBhY3RpdmUg
UlRTIGJlZm9yZS9hZnRlciBkYXRhIGlzIHNlbnQuCj4+ICsgKi8KPj4gKyNkZWZpbmUgUlM0ODVf
TUFYX1JUU19ERUxBWcKgwqDCoCAxMDAgLyogbXNlY3MgKi8KPj4gKwo+PiDCoCBzdGF0aWMgdm9p
ZCB1YXJ0X2NoYW5nZV9zcGVlZChzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5LCBzdHJ1Y3QgCj4+IHVh
cnRfc3RhdGUgKnN0YXRlLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGt0ZXJtaW9zICpvbGRfdGVybWlvcyk7Cj4+IMKgIHN0YXRpYyB2b2lkIHVh
cnRfd2FpdF91bnRpbF9zZW50KHN0cnVjdCB0dHlfc3RydWN0ICp0dHksIGludCB0aW1lb3V0KTsK
Pj4gQEAgLTEyODIsOCArMTI4NywzMiBAQCBzdGF0aWMgaW50IHVhcnRfc2V0X3JzNDg1X2NvbmZp
ZyhzdHJ1Y3QgCj4+IHVhcnRfcG9ydCAqcG9ydCwKPj4gwqDCoMKgwqDCoCBpZiAoY29weV9mcm9t
X3VzZXIoJnJzNDg1LCByczQ4NV91c2VyLCBzaXplb2YoKnJzNDg1X3VzZXIpKSkKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiAtRUZBVUxUOwo+PiArwqDCoMKgIC8qIHBpY2sgc2FuZSBzZXR0
aW5ncyBpZiB0aGUgdXNlciBoYXNuJ3QgKi8KPj4gK8KgwqDCoCBpZiAoIShyczQ4NS5mbGFncyAm
IFNFUl9SUzQ4NV9SVFNfT05fU0VORCkgPT0KPj4gK8KgwqDCoMKgwqDCoMKgICEocnM0ODUuZmxh
Z3MgJiBTRVJfUlM0ODVfUlRTX0FGVEVSX1NFTkQpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBwcl93
YXJuKCJpbnZhbGlkIFJUUyBzZXR0aW5nLCB1c2luZyBSVFNfT05fU0VORCBpbnN0ZWFkXG4iKTsK
PiAKPiBDYW4ndCB3ZSBoYXZlIGEgZGV2aWNlIHByZWZpeCBoZXJlLCBzbyB0aGF0IGV2ZXJ5b25l
IGtub3dzIHdoYXQgZGV2aWNlIAo+IGlzIGFmZmVjdGVkPyBXaXRob3V0IHRoYXQsIGl0J3Mgbm90
IHRoYXQgdXNlZnVsLiBBdCBsZWFzdCBwb3J0LT5uYW1lICYgCj4gcG9ydC0+bGluZSBjb3VsZCBi
ZSBwcmludGVkLiBUaGUgdWFydCBjb3JlIHVzZXMgZGV2XyogcHJpbnRzLCBidXQgcHJpbnRzIAo+
IGFsc28gbGluZSBhcyB1cG9ydC0+ZGV2IGNhbiBiZSBOVUxMIHNvbWV0aW1lcy4KCkFuZCB0aGlz
IGNvbWVzIGZyb20gdXNlcnNwYWNlLCBzbyBzaG91bGQgYmUgcmF0ZWxpbWl0ZWQuCgotLSAKanMK
c3VzZSBsYWJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
