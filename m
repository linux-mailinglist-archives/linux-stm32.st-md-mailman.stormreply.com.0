Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81820A82495
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Apr 2025 14:23:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 481F6C78F98;
	Wed,  9 Apr 2025 12:23:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA54FC78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Apr 2025 12:23:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 61CA15C2DAE;
 Wed,  9 Apr 2025 12:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC35C4CEE3;
 Wed,  9 Apr 2025 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744201423;
 bh=ndAoFBQiFkaWAC8OWaF8W+3qr9/sgyFXOJUizNVSs08=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ih9nkr9EK+GvVC1zn1vkzYS6i+GnRJQqGzU+CyioHyp721JLoTfNdARiWF52J7SOx
 nde/NDMXSJkHQBIgZryWvxl0UEaC2KT1a+DC9lwJwld8f+udb55yF7GldEgTyvpmhS
 JulpQKa7Oq4EHTuCmz3rqU86y1W52CG01cTcI2cIzdgLF35Jw7LjESz6l/CHlGO5IO
 OUMFHEiEKeiUVStSxL2xtivilWaWrQ0+3vTzt6esb2NR58/Udha3FPNPmMh6bRUprb
 ocYTIwL2/JPxNyFjMa9q44+po4nj8RHLaSCefvzEcly9Iv7SU6Zuvzz8/3dGBLVuf0
 5gAfcUqzyrNWw==
From: Arnd Bergmann <arnd@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed,  9 Apr 2025 14:22:55 +0200
Message-Id: <20250409122314.2848028-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, Yu Jiaoliang <yujiaoliang@vivo.com>,
 Oliver Graute <oliver.graute@kococonnector.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-input@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 03/10] [v2] Input: stmpe-ts - use module alias
	instead of device table
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

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCldoZW4gY29tcGlsZSB0ZXN0ZWQg
d2l0aCBXPTEgb24geDg2XzY0IHdpdGggZHJpdmVyIGFzIGJ1aWx0LWluOgoKICBzdG1wZS10cy5j
OjM3MTozNDogZXJyb3I6IHVudXNlZCB2YXJpYWJsZSAnc3RtcGVfdHNfaWRzJyBbLVdlcnJvciwt
V3VudXNlZC1jb25zdC12YXJpYWJsZV0KCklkZWFsbHkgdGhpcyB3b3VsZCBiZSByZWZlcmVuY2Vk
IGZyb20gdGhlIHBsYXRmb3JtX2RyaXZlciwgYnV0IHNpbmNlCnRoZSBjb21wYXRpYmxlIHN0cmlu
ZyBpcyBhbHJlYWR5IG1hdGNoZWQgYnkgdGhlIG1mZCBkcml2ZXIgZm9yIGl0cwpwYXJlbnQgZGV2
aWNlLCB0aGF0IHdvdWxkIGJyZWFrIHByb2JpbmcuCgpJbiB0aGlzIGNhc2UsIHRoZSBvZl9kZXZp
Y2VfaWQgdGFibGUganVzdCBzZXJ2ZXMgYXMgYSBtb2R1bGUgYWxpYXMKZm9yIGxvYWRpbmcgdGhl
IGRyaXZlciwgd2hpbGUgdGhlIGRldmljZSBpdHNlbGYgaXMgcHJvYmVkIHVzaW5nCnRoZSBwbGF0
Zm9ybSBkZXZpY2UgbmFtZS4KClJlbW92ZSB0aGUgdGFibGUgYW5kIGluc3RlYWQgdXNlIGEgbW9k
dWxlIGFsaWFzIHRoYXQgcmVmbGVjdHMgaG93CnRoZSBkcml2ZXIgaXMgYWN0dWFsbHkgcHJvYmVk
LgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MDQwMzA4MDcwMi4zNTA5
Mjg4LTgtYXJuZEBrZXJuZWwub3JnLwpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzE4MWRiZGI4LWMwNTAtNDk2Ni04Y2I0LTJmMzk0OTVmZjNmOUBhcHAuZmFzdG1haWwuY29tLwpD
YzogVXdlIEtsZWluZS1Lw7ZuaWciIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgpDYzog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KdjI6IHVzZSBhIGRp
ZmZlcmVudCBhcHByb2FjaCwgaG9wZWZ1bGx5IHRoaXMgbWFrZXMgbW9yZSBzZW5zZS4KLS0tCiBk
cml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL3N0bXBlLXRzLmMgfCA3ICstLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2lucHV0L3RvdWNoc2NyZWVuL3N0bXBlLXRzLmMgYi9kcml2ZXJzL2lucHV0L3RvdWNoc2Ny
ZWVuL3N0bXBlLXRzLmMKaW5kZXggYTk0YTE5OTdmOTZiLi5hZjBmYjM4YmNmZGMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vc3RtcGUtdHMuYworKysgYi9kcml2ZXJzL2lu
cHV0L3RvdWNoc2NyZWVuL3N0bXBlLXRzLmMKQEAgLTM2NiwxMiArMzY2LDcgQEAgc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtcGVfdHNfZHJpdmVyID0gewogfTsKIG1vZHVsZV9wbGF0
Zm9ybV9kcml2ZXIoc3RtcGVfdHNfZHJpdmVyKTsKIAotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgc3RtcGVfdHNfaWRzW10gPSB7Ci0JeyAuY29tcGF0aWJsZSA9ICJzdCxzdG1wZS10
cyIsIH0sCi0JeyB9LAotfTsKLU1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHN0bXBlX3RzX2lkcyk7
Ci0KK01PRFVMRV9BTElBUygicGxhdGZvcm06c3RtcGUtdHMiKTsKIE1PRFVMRV9BVVRIT1IoIkx1
b3RhbyBGdSA8bC5mdUBwZW5ndXRyb25peC5kZT4iKTsKIE1PRFVMRV9ERVNDUklQVElPTigiU1RN
UEVYWFggdG91Y2hzY3JlZW4gZHJpdmVyIik7CiBNT0RVTEVfTElDRU5TRSgiR1BMIik7Ci0tIAoy
LjM5LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
