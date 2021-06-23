Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B763B167E
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jun 2021 11:09:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C23EC597BD;
	Wed, 23 Jun 2021 09:09:18 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6010FC597B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 09:00:01 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id q14so2396689eds.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 02:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FP9EsChXCfC6ERvq/VEROgpzH3E542Er7LriVewZlDk=;
 b=ing6KloUgctO1neeEVoQc8Hzz8xmwpQNpZ//JACly27y5KT9cMPTveD95i1RTp1gp/
 I+HE2N+Jtnn9K4yjZZ7UBZX5hyp+Q71+XeSlpeFuQeKLsD51QBObLNuejbmv3FBo4bnc
 oNb71+HVe+3tVWsSylLHtllFwBaS0mdbzfkRkFgYLvCKx+pTIgY6GqkejrI9SKKFbSXK
 8wrpFoHcR4pAnOuhc2/T1ODyBTbpeuxQboqsQZtO+qWZ+e2FA2GugxlWtvNEUgJ0iM8Z
 015NX9+GIF/zt5SpdgVwWBE86MKRTFHCtsPDoDUpoPGkEKCqWLB5NC/dGsGgcvifzjxA
 5LhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FP9EsChXCfC6ERvq/VEROgpzH3E542Er7LriVewZlDk=;
 b=gz02stIsKiygSVb1W/JzYY+oCWJ7EuD1+mk85/yF77wc9gIn2bhxR9v7VgkEWHVwyo
 qUbnyATvmLQegH9K4EUapaINNfDxDau1Aytkd1UsbZdrD1L96oo6K1Su6+aZtKHC7edy
 x1a8wf9r9iGV/RncSFA8w49rNYy5+1agPskchMWyo/FfHPdnIxS60+FufLADlzCFkCkK
 8KaBCjcHZ0abDCwqA8ItwA7tYVThT4FcOzWS9hTGhb/xGO9hijjYNnSofUF1oobyhwxp
 +a/GfsAjZTOP0OFS0YtwojC934bUxitRREunRFqZF2JcxC00LU9WIQc6mAMi3NoxgzmT
 BEVQ==
X-Gm-Message-State: AOAM531nYwQ5XHgPfpaKGbwIgNrDTOAvyYIsd9ySUMWRlz//wx/sBmoz
 X5TsyNRbY1DQhaO/FJ+agJyJjpjnwgZ31CM2OrTaPg==
X-Google-Smtp-Source: ABdhPJxKvaPk7aofu67kpiTg2LdEBMmh3ykWTcvt5e3BKRfcI4oOVJvqm0yfYA7i2RbesRb6/jBFkhu9bV1OmDXetzs=
X-Received: by 2002:a05:6402:42cc:: with SMTP id
 i12mr6914846edc.88.1624438801003; 
 Wed, 23 Jun 2021 02:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-4-krzk@kernel.org>
In-Reply-To: <20200902150643.14839-4-krzk@kernel.org>
From: Michal Simek <monstr@monstr.eu>
Date: Wed, 23 Jun 2021 10:59:50 +0200
Message-ID: <CAHTX3dLT5FoOZ0Hi9UArYCoxy4b69r6cHLiLPo25DGX2_1B-xA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Approved-At: Wed, 23 Jun 2021 09:09:16 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, Sekhar Nori <nsekhar@ti.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-i2c@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-rpi-kernel@lists.infradead.org,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, LKML <linux-kernel@vger.kernel.org>,
 Oleksij Rempel <linux@rempel-privat.de>, Wolfram Sang <wsa@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Peter Rosin <peda@axentia.se>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [Linux-stm32] [PATCH 4/9] i2c: cadence: Simplify with
	dev_err_probe()
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

c3QgMi4gOS4gMjAyMCB2IDE3OjEwIG9kZXPDrWxhdGVsIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gbmFwc2FsOgo+Cj4gQ29tbW9uIHBhdHRlcm4gb2YgaGFuZGxpbmcgZGVm
ZXJyZWQgcHJvYmUgY2FuIGJlIHNpbXBsaWZpZWQgd2l0aAo+IGRldl9lcnJfcHJvYmUoKS4gIExl
c3MgY29kZSBhbmQgdGhlIGVycm9yIHZhbHVlIGdldHMgcHJpbnRlZC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1jYWRlbmNlLmMgfCA5ICsrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtY2FkZW5jZS5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1jYWRl
bmNlLmMKPiBpbmRleCBlNGI3ZjJhOTUxYWQuLmVlZmRlNTU0YzUwYyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWNhZGVuY2UuYwo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtY2FkZW5jZS5jCj4gQEAgLTEyMTQsMTEgKzEyMTQsMTAgQEAgc3RhdGljIGludCBjZG5z
X2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAg
ICAgIkNhZGVuY2UgSTJDIGF0ICUwOGx4IiwgKHVuc2lnbmVkIGxvbmcpcl9tZW0tPnN0YXJ0KTsK
Pgo+ICAgICAgICAgaWQtPmNsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCBOVUxMKTsKPiAt
ICAgICAgIGlmIChJU19FUlIoaWQtPmNsaykpIHsKPiAtICAgICAgICAgICAgICAgaWYgKFBUUl9F
UlIoaWQtPmNsaykgIT0gLUVQUk9CRV9ERUZFUikKPiAtICAgICAgICAgICAgICAgICAgICAgICBk
ZXZfZXJyKCZwZGV2LT5kZXYsICJpbnB1dCBjbG9jayBub3QgZm91bmQuXG4iKTsKPiAtICAgICAg
ICAgICAgICAgcmV0dXJuIFBUUl9FUlIoaWQtPmNsayk7Cj4gLSAgICAgICB9Cj4gKyAgICAgICBp
ZiAoSVNfRVJSKGlkLT5jbGspKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9i
ZSgmcGRldi0+ZGV2LCBQVFJfRVJSKGlkLT5jbGspLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiaW5wdXQgY2xvY2sgbm90IGZvdW5kLlxuIik7Cj4gKwo+ICAgICAgICAg
cmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGlkLT5jbGspOwo+ICAgICAgICAgaWYgKHJldCkKPiAg
ICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiVW5hYmxlIHRvIGVuYWJsZSBjbG9j
ay5cbiIpOwo+IC0tCj4gMi4xNy4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKPiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwKCkFsc28gdGhpcyBvbmUgaXMg
cGVuZGluZyBidXQgc3RpbGwgcG9zc2libGUgdG8gYXBwbHkgd2l0aG91dCBhbnkgY29uZmxpY3Qu
CgpBY2tlZC1ieTogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAeGlsaW54LmNvbT4KClRoYW5r
cywKTWljaGFsCgoKLS0gCk1pY2hhbCBTaW1laywgSW5nLiAoTS5FbmcpLCBPcGVuUEdQIC0+IEtl
eUlEOiBGRTNEMUY5MQp3OiB3d3cubW9uc3RyLmV1IHA6ICs0Mi0wLTcyMTg0Mjg1NApNYWludGFp
bmVyIG9mIExpbnV4IGtlcm5lbCAtIFhpbGlueCBNaWNyb2JsYXplCk1haW50YWluZXIgb2YgTGlu
dXgga2VybmVsIC0gWGlsaW54IFp5bnEgQVJNIGFuZCBaeW5xTVAgQVJNNjQgU29DcwpVLUJvb3Qg
Y3VzdG9kaWFuIC0gWGlsaW54IE1pY3JvYmxhemUvWnlucS9aeW5xTVAvVmVyc2FsIFNvQ3MKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
