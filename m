Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A605264A4F6
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Dec 2022 17:37:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45A4DC65E75;
	Mon, 12 Dec 2022 16:37:03 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DAB1C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 16:37:01 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id d20so13736701edn.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 08:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lvYON1Uq6UT3Qph7OPPr0NH47G6rUYR8O1BO9MFwJow=;
 b=lIFXcScE+1mmzH1SBNLfPzmU2yyZ22FDa7zo6/O0Bw9aIOxDeXxYkEVfus52JWuhda
 4ouELocZnEhmnwFppolEYq4c3c7RHYAqD4pax4M3unQDLONiM/9+ejXSM9E2FE+Z0v02
 plxbNMhSLCExfq6g58BwEJLatQLzpt/xLWOhKWfMwSgaHbhPuPfGnoShEU2Q/8V0GhBe
 I8mO/6POKEHTvHhiQrSmT3i/DlcfyH1o4pAMtSuNXvNoHj+mOy3GKKCsRTSQGVPFd3Z7
 AQYI0FN6wamo3RnZf0VXDCwVvMRjPWjYDkKYXDeP5o/vQIFIn9FanCQzU/XNFNQHrfWF
 2geA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lvYON1Uq6UT3Qph7OPPr0NH47G6rUYR8O1BO9MFwJow=;
 b=H8QoKrhqnVnRcqhhtldCgC4qI3uAAjtCrlHvk450hxG3eP31BtKJDiWTdejq9j5p2p
 aNkKakmKlnhYpckRKz5VhwgOF38GTH0+z3pglEfsqoXj/pY3EK/5Nllgq4rj1HvyMWGa
 /JXhmCQyzlOMg1O+Xo7+DZ9AW6y32tcYng6bYqw0OkqwvZS2hvifs3oKrYCj27bZzRHN
 x4p+NQTIzMb6Btc4gqbXe27UNj6wGsj6YOVRSuI8UNfPYiwLQgTzgFENkLi45UJQ0pcQ
 OQQOO9TVmOW1oqObqatzcchTGKLDAHu0stm3/8f8SG9DfV1ZJ2eLegBQTP/u4tc6Su4c
 HfLg==
X-Gm-Message-State: ANoB5pmYSTTYAM2a4yOf0sZE4s7AXMvepBNfutcbaJFafhdOZ+ZwND+r
 a2PBW46gldfBtnkGE7nqxv0tlw==
X-Google-Smtp-Source: AA0mqf5ppTTyM6N0bPOAfBX//eKXVRPakyRimeYdkY/8NocUbAvjnOSiYLmQOcD2W7tmhBu2XO410g==
X-Received: by 2002:a05:6402:702:b0:46f:68d0:76 with SMTP id
 w2-20020a056402070200b0046f68d00076mr10093614edx.34.1670863020790; 
 Mon, 12 Dec 2022 08:37:00 -0800 (PST)
Received: from prec5560.. ([2001:bf7:830:a7a8:ff97:7d8d:1f2e:ffaa])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a50930f000000b00463597d2c25sm4051979eda.74.2022.12.12.08.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 08:37:00 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Grant Likely <grant.likely@linaro.org>
Date: Mon, 12 Dec 2022 17:36:51 +0100
Message-Id: <167086288411.3041259.17824406556561546642.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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
IGludG8geW91ciB0cmVlIHRvIGdldCBpdDoKPiAKPiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoK
UmVwbzogaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MvCgoKWzAxNC82
MDZdIGRybS9icmlkZ2U6IGFkdjc1MTE6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAg
ICAgICAgICBjb21taXQ6IDFjNTQ2ODk0ZmY4MmY4YjdjMDcwOTk4YzAzZjliMTVhMzQ5OWYzMjYK
WzAyOC82MDZdIGRybS9icmlkZ2U6IHBhcmFkZS1wczg2MjI6IENvbnZlcnQgdG8gaTJjJ3MgLnBy
b2JlX25ldygpCiAgICAgICAgICBjb21taXQ6IGQ2YjUyMmU5YmJiMGNjYTFhZWFlNGVmNjE4ODgw
MDUzNDc5NDgzNmYKWzAzNS82MDZdIGRybS9icmlkZ2U6IHRpLXNuNjVkc2k4MzogQ29udmVydCB0
byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIGNvbW1pdDogMGY2NTQ4ODA3ZmE3N2U4N2Ji
YzM3OTY0YzZiMWVkOWJhNmUxMTU1ZAoKCgpyb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
