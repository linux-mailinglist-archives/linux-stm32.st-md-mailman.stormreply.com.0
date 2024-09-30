Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7B298AC14
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Sep 2024 20:28:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44BDBC78002;
	Mon, 30 Sep 2024 18:28:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50F2FC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2024 18:28:31 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6526488670;
 Mon, 30 Sep 2024 20:28:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727720910;
 bh=v8W0AftGD5WCKt0vquLj4HDVyAid7m6TozrgpAGchU0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IciaZ6XevgcyexP0Jru4yixkH+pXJ2Dz9p2ZpYi8xncRZWg0limeMGCwB2S2EDn8E
 LqGzW5LfCDUN4pHOzg0R7Mt8w6n4X6ON45+9uEgt47Dh8aoJ7p8uQs+zRsDqrfl1q9
 70x0UMNbDaeuvwP5CKTnn64pD2KASjS4KjaMnMiRA5y9UESwPxt09q7fruRrd98gdU
 DB5VUpZT7oWY1ZIjPf429ebR0Ks/SpnQ2H3syCrXXHSTaEl5VUYNj1Q3c2JdMGx8OO
 g0MhV6vRxLn3jhw3dCN28CeSjB3sdtNwTSArifpCUC6YoRSOZhvoHtipZuezkKiB7Y
 cynR/fDnZxWBg==
Message-ID: <a556f3f9-467f-4c8e-aed5-e1e318376b31@denx.de>
Date: Mon, 30 Sep 2024 20:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
References: <20240415134903.8084-1-marex@denx.de>
 <eb0ab015-57bc-4aae-b518-dc12392f3ea0@roeck-us.net>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <eb0ab015-57bc-4aae-b518-dc12392f3ea0@roeck-us.net>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] watchdog: stm32_iwdg: Add pretimeout
	support
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

T24gOS8zMC8yNCA4OjIzIFBNLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+IE9uIDQvMTUvMjQgMDY6
NDgsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBUaGUgU1RNMzJNUDE1eHggSVdERyBhZGRzIHJlZ2lz
dGVycyB3aGljaCBwZXJtaXQgdGhpcyBJUCB0byBnZW5lcmF0ZQo+PiBwcmV0aW1lb3V0IGludGVy
cnVwdC4gVGhpcyBpbnRlcnJ1cHQgY2FuIGFsc28gYmUgdXNlZCB0byB3YWtlIHRoZSBDUFUKPj4g
ZnJvbSBzdXNwZW5kLiBJbXBsZW1lbnQgc3VwcG9ydCBmb3IgZ2VuZXJhdGluZyB0aGlzIGludGVy
cnVwdCBhbmQgbGV0Cj4+IHVzZXJzcGFjZSBjb25maWd1cmUgdGhlIHByZXRpbWVvdXQuIEluIGNh
c2UgdGhlIHByZXRpbWVvdXQgaXMgbm90Cj4+IGNvbmZpZ3VyZWQgYnkgdXNlciwgc2V0IHByZXRp
bWVvdXQgdG8gMy80IG9mIHRoZSBXRFQgdGltZW91dCBjeWNsZS4KPj4KPj4gUmV2aWV3ZWQtYnk6
IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPj4gVGVz
dGVkLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IAo+IFJldmll
d2VkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+ClRoYW5rIHlvdQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
