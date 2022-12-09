Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B095648202
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Dec 2022 13:00:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D518BC65E4F;
	Fri,  9 Dec 2022 12:00:38 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21EC8C65E6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Dec 2022 12:00:37 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id vv4so10997511ejc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Dec 2022 04:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCwzWMPdgO9Dcc0FuYTNg8nT6gaYsC62geOPdirkTlQ=;
 b=blV6eki9f/dE3yt8k9vQjmYbdmKqtjXhWL8aRDi0+PTy9DZ7PoASn6Hb4YDawt6/Pq
 TOTWkNyJ1bQ0LXeAOKmZsgrohPEAxg4I9Vxq8Iql4MCfOpzd9bk59Kg8A1l2aCabzc1i
 Pwb8zUD5pTagBDWz9wlqw8be8RXHOe4ntLhBEh7HXgPppKgizTPX68btz3fJ69iSfJef
 zAFAyKFjvCY4s0mBfuw+77i/sj6ivMcyXsKkk5Q+7miuQY1uqqYMcxvazgbad3gQhSeN
 osKwSC1CYREx2mikz7Rsbjiro/V/gVq1uBZVJYbtUMGcexuFEHFb/xJK0jJPCO1YVyoF
 GpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CCwzWMPdgO9Dcc0FuYTNg8nT6gaYsC62geOPdirkTlQ=;
 b=RtaF3NgRCF63W0WrO+wc5yKIsimIle40fnY51k6UxPoyKP9wXd38HysAGBCfm2TqYh
 C7QqvINXV76ZxReut6IE8h5goMpB7EqCB8IgTUqka6KF2GMlEUaFex1dSApEA5cuLzPA
 82e10BQUUsEWzkeIyRIAXRrIJImS+ngcz8CUgXZmGiCuLLC2rHPGx+Vv8hgpeeLIg/EA
 OZ9ygdSp/Ps4sWIDKWEumG4hjLhfT+3kdalaqZxaeK0WryeKKlcvHX0V8i/olXy5nhHU
 ZGYf2hCgWAIN4T9dUosi+uaieU3wILN9gzDf+CcTuRBR6rFQ01RfKyCzou51206b0iuv
 hzSA==
X-Gm-Message-State: ANoB5plFjOCYsSk24M/fgDfr832Gvfwv8Xzli7sw/vWO9hk8QKPjjIHX
 lcr2cdFNyBpoVod4ZHtWx74Z4g==
X-Google-Smtp-Source: AA0mqf7P1uuFrcKToZQL1Qs7OSMRUELHntqUphTx86r+y9eGx8OMntNtg5Twtz4wxSVo6DNFFYUZgg==
X-Received: by 2002:a17:906:4907:b0:7c0:d4fa:3151 with SMTP id
 b7-20020a170906490700b007c0d4fa3151mr4765674ejq.17.1670587236522; 
 Fri, 09 Dec 2022 04:00:36 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a170906861700b007c0a7286c0asm489597ejx.58.2022.12.09.04.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 04:00:35 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>
Date: Fri,  9 Dec 2022 13:00:14 +0100
Message-Id: <167058708567.1651663.18170722235132459286.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] (subset) [PATCH 000/606] i2c: Complete conversion
	to i2c_probe_new
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

T24gRnJpLCAxOCBOb3YgMjAyMiAyMzozNTozNCArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gc2luY2UgY29tbWl0IGI4YTFhNGNkNWE5OCAoImkyYzogUHJvdmlkZSBhIHRlbXBvcmFy
eSAucHJvYmVfbmV3KCkKPiBjYWxsLWJhY2sgdHlwZSIpIGZyb20gMjAxNiB0aGVyZSBpcyBhICJ0
ZW1wb3JhcnkiIGFsdGVybmF0aXZlIHByb2JlCj4gY2FsbGJhY2sgZm9yIGkyYyBkcml2ZXJzLgo+
IAo+IFRoaXMgc2VyaWVzIGNvbXBsZXRlcyBhbGwgZHJpdmVycyB0byB0aGlzIG5ldyBjYWxsYmFj
ayAodW5sZXNzIEkgbWlzc2VkCj4gc29tZXRoaW5nKS4gSXQncyBiYXNlZCBvbiBjdXJyZW50IG5l
eHQvbWFzdGVyLgo+IEEgcGFydCBvZiB0aGUgcGF0Y2hlcyBkZXBlbmQgb24gY29tbWl0IDY2MjIz
MzczMWQ2NiAoImkyYzogY29yZToKPiBJbnRyb2R1Y2UgaTJjX2NsaWVudF9nZXRfZGV2aWNlX2lk
IGhlbHBlciBmdW5jdGlvbiIpLCB0aGVyZSBpcyBhIGJyYW5jaCB0aGF0Cj4geW91IGNhbiBwdWxs
IGludG8geW91ciB0cmVlIHRvIGdldCBpdDoKPiAKPiBbLi4uXQoKQXBwbGllZCBhbGwgcGF0Y2hl
cyB0aGF0IGJ1aWxkLgoKUGF0Y2hlcyBleGNsdWRlZDoKIC0gcHM4NjIyCiAtIHRpLXNuNjVkc2k4
MwogLSBhZHY3NTExCgpSZXBvOiBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0t
bWlzYy8KCgpbMDE0LzYwNl0gZHJtL2JyaWRnZTogYWR2NzUxMTogQ29udmVydCB0byBpMmMncyAu
cHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykKWzAxNS82MDZdIGRybS9icmlk
Z2UvYW5hbG9naXgvYW54NjM0NTogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAg
ICAgIChubyBjb21taXQgaW5mbykKWzAxNi82MDZdIGRybS9icmlkZ2UvYW5hbG9naXgvYW54Nzh4
eDogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5m
bykKWzAxNy82MDZdIGRybS9icmlkZ2U6IGFueDc2MjU6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2Jl
X25ldygpCiAgICAgICAgICAobm8gY29tbWl0IGluZm8pClswMTgvNjA2XSBkcm0vYnJpZGdlOiBp
Y242MjExOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgKG5vIGNvbW1p
dCBpbmZvKQpbMDE5LzYwNl0gZHJtL2JyaWRnZTogY2hyb250ZWwtY2g3MDMzOiBDb252ZXJ0IHRv
IGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiA4ZGM2ZGUyODBmMDFjMGY3Yjhk
NDA0MzU3MzZmM2M5NzUzNjhhZDcwClswMjAvNjA2XSBkcm0vYnJpZGdlOiBpdDY1MDU6IENvbnZl
cnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICAobm8gY29tbWl0IGluZm8pClswMjEv
NjA2XSBkcm0vYnJpZGdlOiBpdDY2MTIxOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQog
ICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDIyLzYwNl0gZHJtL2JyaWRnZTogbHQ4OTEyYjog
Q29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykK
WzAyMy82MDZdIGRybS9icmlkZ2U6IGx0OTIxMTogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3
KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykKWzAyNC82MDZdIGRybS9icmlkZ2U6IGx0OTYx
MTogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5m
bykKWzAyNS82MDZdIGRybS9icmlkZ2U6IGx0OTYxMXV4YzogQ29udmVydCB0byBpMmMncyAucHJv
YmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykKWzAyNi82MDZdIGRybS9icmlkZ2U6
IG1lZ2FjaGlwczogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBj
b21taXQgaW5mbykKWzAyNy82MDZdIGRybS9icmlkZ2U6IG54cC1wdG4zNDYwOiBDb252ZXJ0IHRv
IGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDI4LzYwNl0g
ZHJtL2JyaWRnZTogcGFyYWRlLXBzODYyMjogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkK
ICAgICAgICAgIChubyBjb21taXQgaW5mbykKWzAyOS82MDZdIGRybS9icmlkZ2U6IHNpaTkwMng6
IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICAobm8gY29tbWl0IGluZm8p
ClswMzAvNjA2XSBkcm0vYnJpZGdlOiBzaWk5MjM0OiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9u
ZXcoKQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDMxLzYwNl0gZHJtL2JyaWRnZTogc2lp
ODYyMDogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQg
aW5mbykKWzAzMi82MDZdIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBDb252ZXJ0IHRvIGkyYydzIC5w
cm9iZV9uZXcoKQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDMzLzYwNl0gZHJtL2JyaWRn
ZTogdGMzNTg3Njg6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICAobm8g
Y29tbWl0IGluZm8pClswMzQvNjA2XSBkcm0vYnJpZGdlL3RjMzU4Nzc1OiBDb252ZXJ0IHRvIGky
YydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDM1LzYwNl0gZHJt
L2JyaWRnZTogdGktc242NWRzaTgzOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAg
ICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDM3LzYwNl0gZHJtL2JyaWRnZTogdGZwNDEwOiBDb252
ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQoKCgpy
b2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
