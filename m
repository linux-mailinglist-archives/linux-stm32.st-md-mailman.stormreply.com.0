Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA81ED666
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jun 2020 20:52:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BC99C36B21;
	Wed,  3 Jun 2020 18:52:49 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABF5FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2020 18:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591210349;
 bh=7F6r5LW73SkyMamkRXQGUSJaJ9i1/pRDOcqL9DLIkyw=;
 h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
 b=QGdyUPAfd6foz/CZDzljbLA14SrUEWVUN6zDbUNsWFS2e4nX7epgQ8I7Affu1mq4S
 ebGx9doVhwYdyHJyzi/kH4Rtfx1cfrkh691c+Kym8ReqaswipXAnnSQrT5mRh4z/re
 NfKjnc8tWXKAL5m77Kqa5RMferlPBKxi186uiMkQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.82.231]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MPrwQ-1jbagx1m5a-004yTy; Wed, 03
 Jun 2020 20:52:29 +0200
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Navid Emamdoost <navid.emamdoost@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Message-ID: <873bfb31-52d8-7c9b-5480-4a94dc945307@web.de>
Date: Wed, 3 Jun 2020 20:52:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:LFgtFx/OT1Th7OxO55HEWjIgsKzljGMVBXU/JXtDSO9tpjt0k7M
 M+FtRQ+E22ElXdA6HhwXbCrld+Re0WGcZDijbXI3xC2S43VLbuOvDanE8UQFqjHP3YDVCPd
 +ZUuRHYZsNZgxppzcQ7Nlr+DwXxan/IHD1Rp6BEineinn6pQD5g4ofuxEn7He7yKRJKbr50
 xqWnCyWFwPKNBj1IZiTOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SI3bB6ZYjLA=:8uJUY1dPEM52b/VyJBchLo
 Ki2Qml/Wns2CVIny7eakOkRIj4RKfskUIbxvHQsCSTPNd1ZG6jT2XOWxAx/H0MvPpSDiVsasu
 JwrlP6GMhWDUdHum+LPdzBXb61shRiHGmZMAejJynZOHvxi/reqie7V6mCmK+GKnr+ghGzkWu
 RVX5TC4kKJ5gYlCWCSGc7Cztbpx4YfaHYyzByubcM2injH8TlA8qsuZYCbPbfMgF8fku3DWGA
 u9qTluTwZ60Z5mt3Fd+dHid34Xe9mxm4wUV6bOfe9RARZzj265ziYpWYYJQlb/ET12fz6n8Pp
 WBr5NueY8KleMZHQWnUX5Fkb4TPJF90eite0N4MU22ekpibwc57yBCI1sy35nx8HP42sgz9AF
 W7iHt64LXH3AJpk9dP3QcDkxmh9Hp1kk0pMUSotAcqryL8sRV93eOjTOCyokvXlERPLG5vD83
 Jm95IxK1WLsCafaF3y064Srmyt+IXfI0KtG0qtXFV+LwlVLzXHZSZTrRy+8b7OUF1A+T3XlcJ
 /peK+VCQV5MudKFgmJDpoZV47UsHAdgE2BiyKdMuyqN7xhXa6dpmgoIt67uJLsi5wsa7bEfx3
 cFC3iJpYYG3SNnB8ZvDwaFO3SK/BCJLHxwyAt/aYNZ4LQj/387N9ALQbAQOeBN9BP5YZCHiF2
 xz48zhl3fe9UoOG3gE3nKFJ6cFiaKMsM5ZsntQbGhw5e8vrugDhuk36stg8R+SHxMUi7TDSID
 /jFUOIKczakn7IA/vf21gY6vRbYvwzQ4dmj3mLBzxIQkyr3Kxhm/WcD0K6tU8oxWPRcZw2IGw
 smv3duRz7fJMsq6LwZuMjjuIxTGnhlW09jfCHs60RDk+nI7In9IhqN2Z714hhxFUh5Zt5J3Z2
 r8S4TTc/uOlSkO0uhLama6/QvjjNZ6lxqOYZrujFTjyj6mqN87QX1Tm9lSgpcJSLOC+mgg9qg
 Qs1bgcH8WgB3r2ZNkRPBPiYItk7Op3mrEh5WgYTSoYiG31/g3A7FFnNGAkFNylvYv8Ij/9cZ7
 Ltf34ciISsSO5wUmoENgKLN915DqPA2BqakeqZx6C8okOOd83TvooC1Jvtob8gBjXVofiAj3I
 szC1a24ZAUOWMammB1VwEPfM+SYf4dPRBSV1bNyA68eEpoSM3muy2wmqpZQVWnp2TufPf47iS
 mBF0fXKdWQNPRlTQIK25gCTMqJUHvDLU/eq+5VEYgHrvmVKV7nw3CJOMocBmOqOoDaqzmDhig
 5NtajeUM3ZIwbrs6w
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>, Qiushi Wu <wu000273@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: call
 pm_runtime_put if pm_runtime_get_sync fails
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

PiBDYWxsaW5nIHBtX3J1bnRpbWVfZ2V0X3N5bmMgaW5jcmVtZW50cyB0aGUgY291bnRlciBldmVu
IGluIGNhc2Ugb2YKPiBmYWlsdXJlLCBjYXVzaW5nIGluY29ycmVjdCByZWYgY291bnQuIENhbGwg
cG1fcnVudGltZV9wdXQgaWYKPiBwbV9ydW50aW1lX2dldF9zeW5jIGZhaWxzLgoKSXMgaXQgYXBw
cm9wcmlhdGUgdG8gY29weSBhIHNlbnRlbmNlIGZyb20gdGhlIGNoYW5nZSBkZXNjcmlwdGlvbgpp
bnRvIHRoZSBwYXRjaCBzdWJqZWN0PwoKSG93IGRvIHlvdSB0aGluayBhYm91dCBhIHdvcmRpbmcg
dmFyaWFudCBsaWtlIHRoZSBmb2xsb3dpbmc/CgogICBUaGUgUE0gcnVudGltZSByZWZlcmVuY2Ug
Y291bnRlciBpcyBnZW5lcmFsbHkgaW5jcmVtZW50ZWQgYnkgYSBjYWxsIG9mCiAgIHRoZSBmdW5j
dGlvbiDigJxwbV9ydW50aW1lX2dldF9zeW5j4oCdLgogICBUaHVzIGNhbGwgdGhlIGZ1bmN0aW9u
IOKAnHBtX3J1bnRpbWVfcHV04oCdIGFsc28gaW4gdHdvIGVycm9yIGNhc2VzCiAgIHRvIGtlZXAg
dGhlIHJlZmVyZW5jZSBjb3VudGluZyBjb25zaXN0ZW50LgoKCldvdWxkIHlvdSBsaWtlIHRvIGFk
ZCB0aGUgdGFnIOKAnEZpeGVz4oCdIHRvIHRoZSBjb21taXQgbWVzc2FnZT8KClJlZ2FyZHMsCk1h
cmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
