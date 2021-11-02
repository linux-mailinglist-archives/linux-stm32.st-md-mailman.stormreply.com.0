Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB142442BD5
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Nov 2021 11:48:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FC50C5AB60;
	Tue,  2 Nov 2021 10:48:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C20F0C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Nov 2021 10:48:50 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id o14so32460299wra.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Nov 2021 03:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tjHxLBOlGFUwoythfcIXHJVOGhDQe/iG25qk3veKCD4=;
 b=EEc+JD0XsC3VGqaE5qXWCYRjO0yRs45+ECxfmZj30mu7VgkRVswKwYTRXJ/xEiy9Gh
 IAvAA3t6agxJVcyExDLUKJkCJ1AJqYBdyfJTHPCVSEEAvcJNLDofKOqfAC1vVfsBR9+L
 Nb9aIH/CGiNYjw9Ocjm5wWev+T2MR9H3dPwUBi94TMeoQgliZhZBmLmEZtJY/rnmgW4C
 /IL/nE8bOImJIQ5lToAcCPMNiwNRqfs9/WJZpwwqTQ4HRLPZyLV45dLwJICz7+tSEPyU
 Oa1tpjG+fA6Vl0JK61sCyL8qYoqT3r9vmz9ivGUI1J3tQ4WeOrAVapyMr0x2drczjr83
 ZgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tjHxLBOlGFUwoythfcIXHJVOGhDQe/iG25qk3veKCD4=;
 b=uzl+ucWzD9GFWP3zahpmCDs3GzxmLOL9eWwDoEyS6CXtHzh4O32CzM7eAF/1KUbyZq
 /QuX/itABS3Dr1IrWsUwzFNO4Vpt2rMMRQ/Qb0dZz1AnNTLvqwFKigge4RbrXtjgFANS
 LEM9r7pCWvpSA62wbArLrG1KkX4aqSdXEuDwU320hER7HkTFOri0tkXTpb63iSpH07X0
 qkyGC8R8OoKs4GmPQUsBC6UIrenkueVRqm8yPyWV3k3dNHOs5YcR39XgBDkOQ3O+0rJj
 dkMXDp6YxAogjIshRgXS4lFCqKdamAGSE05G8ZWTnXRNcy19vlSl2qIKMZe5mcrH4Oh2
 qHDw==
X-Gm-Message-State: AOAM531Q4vfWZ99NHTEhIh+4b3GdkpUCrMtTI5lYJ6mEyUk5GTehmc6n
 r96YgEBAPVS9pttum+Xl4h5FWg==
X-Google-Smtp-Source: ABdhPJwtEHbUMbCeAtw4rOoML0SGRNYL06mu4CwNHUGVkq5Lh6683+bJXm65Bxh2NAa0r1vRiPW9oQ==
X-Received: by 2002:adf:f708:: with SMTP id r8mr39888329wrp.198.1635850130255; 
 Tue, 02 Nov 2021 03:48:50 -0700 (PDT)
Received: from google.com ([95.148.6.174])
 by smtp.gmail.com with ESMTPSA id f81sm2289827wmf.22.2021.11.02.03.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:48:49 -0700 (PDT)
Date: Tue, 2 Nov 2021 10:48:47 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Message-ID: <YYEXj3bzOB4g1x9N@google.com>
References: <20211027082155.206449-1-francesco.dolcini@toradex.com>
 <20211101094844.GA4549@francesco-nb.int.toradex.com>
 <YX/Z47ztw8d4uMuQ@google.com>
 <20211102082147.GA5168@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211102082147.GA5168@francesco-nb.int.toradex.com>
Cc: marcel.ziswiler@toradex.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmpe: Support disabling
	sub-functions
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

T24gVHVlLCAwMiBOb3YgMjAyMSwgRnJhbmNlc2NvIERvbGNpbmkgd3JvdGU6Cgo+IE9uIE1vbiwg
Tm92IDAxLCAyMDIxIGF0IDEyOjEzOjIzUE0gKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiA+IE9u
IE1vbiwgMDEgTm92IDIwMjEsIEZyYW5jZXNjbyBEb2xjaW5pIHdyb3RlOgo+ID4gPiBIZWxsbyBM
ZWUsCj4gPiA+IGFueSBjaGFuY2UgeW91IGNvdWxkIHRha2UgdGhpcyBvbmUgbGluZSBwYXRjaCBm
b3IgdGhpcyBtZXJnZSB3aW5kb3c/Cj4gPiAKPiA+IEZvciBhIHBhdGNoIHNlbnQgMC41IHdlZWtz
IGJlZm9yZSB0aGUgbWVyZ2Utd2luZG93PyAgTm9wZS4gOikKPiAKPiBIZWxsbyBMZWUsCj4gbm8g
cHJvYmxlbSwgSSB0aG91Z2h0IGl0IHdhcyB0aGF0IHRyaXZpYWwgdG8gbm90IGNyZWF0ZSBhbnkg
d29ycmllcy4KPiBJJ2xsIHJlc2VuZCBpdCBpbiBhIHdoaWxlIHVubGVzcyB5b3UgdGFrZSBpdCBi
ZWZvcmUuCgpJIGxpa2UgKmFsbCogcGF0Y2hlcyB0byBoYXZlIGEgc29hayBpbiAtbmV4dC4KCllv
dSBkb24ndCBuZWVkIHRvIHJlc2VuZCBpdC4gIEknbGwgYXBwbHkgaXQgaW4gZHVlIGNvdXJzZS4K
Ci0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxv
cGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0g
U29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
