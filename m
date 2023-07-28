Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A807665C2
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jul 2023 09:50:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF4DBC6B466;
	Fri, 28 Jul 2023 07:50:14 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C5F7C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 07:50:10 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3178fa77b27so50380f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690530610; x=1691135410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDrQSF4flbfX31MTNsZ15td23C3i0hNJdQ7UI0vCA3I=;
 b=DJXTLmy58DH82+ndYnRhovf0F46i4Qt08gyosVKYjJaphIunwDUwAzldq17njcyipw
 26pLbTBaOdB3JYXsJoFdcXPWy7flzVbsdlKiZEfyzzYj6AcyQPQ29RjWE8eTLmbJY86P
 dYK718jc4GtH7GdMCLY1g4FhRK8c0X0OtY2m9r16b79F5J69pOb7genW+sPoMKqvVIR6
 /MIAXbW+qxMPhX9L4SEsn4ulVqwoztDabTSdLzcSnBN1lcF7xBmLmZjDd3dUWPQDnfZU
 ObWglzNlQBifg+6WGmKCl+PQN8NlOft/lPIDp8kOvQHi8ZWimM/PYJYj8BUQLarguzWD
 A6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690530610; x=1691135410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DDrQSF4flbfX31MTNsZ15td23C3i0hNJdQ7UI0vCA3I=;
 b=ZoxGSq/WhNLXuOxPeHzFFz2w1/TdNA4sWsGb0h6nOGNy4sn8TtsrcVchwfd2GERfjT
 nxSYbhu6d6KkCLoF33yi/pawJCEMqmGn3eDM4DrJi5xq8oicRaBTC724lLBANIBJdTTv
 jxQjC6yX1am3DDcpqhBzkfMVE1TKlACaq1EVK30KGzyC2TALCpI7rU9/Lh/L5lcB1pMg
 slxSgIWsddKBTgfzREipUoKXuFgCxb8Ty6B9Mh8yCN8GTOze0vveXhMEk/cR/iv7wt9c
 o9RSsYBN8rMAPfMGmMxXv+9sY8dqnFXHDiIG94DEfM+ov9nMGLOgbB/+Pj8AkogxsYhN
 mQsQ==
X-Gm-Message-State: ABy/qLYf2usu1bHNKBNgxnlBRPWDLCrlzQ7xQzLdELfeYlcYwZpieg7h
 7noGlmUa5YPtxtyZq7FqQwo=
X-Google-Smtp-Source: APBJJlEgSiKQeIzrK/jf6155faui04e89WIa1lf3pSVZA/JOpzJggqhsijVHEfTfWO5PmXty8T+t1g==
X-Received: by 2002:a5d:4533:0:b0:317:69c7:98ad with SMTP id
 j19-20020a5d4533000000b0031769c798admr1181655wra.3.1690530609932; 
 Fri, 28 Jul 2023 00:50:09 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 y8-20020adffa48000000b003159d2dabbasm4080107wrr.94.2023.07.28.00.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 00:50:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 28 Jul 2023 09:50:07 +0200
Message-ID: <169053057431.3515253.3807570644936028334.b4-ty@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714214519.2503468-1-u.kleine-koenig@pengutronix.de>
References: <20230714214519.2503468-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@pengutronix.de
Subject: Re: [Linux-stm32] (subset) [PATCH 1/2] pwm: stmpe: Handle errors
	when disabling the signal
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

Ck9uIEZyaSwgMTQgSnVsIDIwMjMgMjM6NDU6MTggKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdy
b3RlOgo+IEJlZm9yZSB0aGUgcHdtIGZyYW1ld29yayBpbXBsZW1lbnRlZGF0b21pYyB1cGRhdGVz
ICh3aXRoIHRoZSAuYXBwbHkoKQo+IGNhbGxiYWNrKSB0aGUgLmRpc2FibGUoKSBjYWxsYmFjayBy
ZXR1cm5lZCB2b2lkLiBUaGlzIGlzIHN0aWxsIHZpc2libGUKPiBpbiB0aGUgc3RtcGUgZHJpdmVy
IHdoaWNoIGRyb3BzIGVycm9ycyBpbiB0aGUgZGlzYWJsZSBwYXRoLgo+IAo+IEltcHJvdmUgdGhl
IGRyaXZlciB0byBmb3J3YXJkIGZhaWx1cmVzIGluIHN0bXBlXzI0eHhfcHdtX2Rpc2FibGUoKSB0
bwo+IHRoZSBjYWxsZXIgb2YgcHdtX2FwcGx5X3N0YXRlKCkuCj4gCj4gWy4uLl0KCkFwcGxpZWQs
IHRoYW5rcyEKClsxLzJdIHB3bTogc3RtcGU6IEhhbmRsZSBlcnJvcnMgd2hlbiBkaXNhYmxpbmcg
dGhlIHNpZ25hbAogICAgICBjb21taXQ6IGIyYzcxZTlmOGRkMGQwMjNhODQ3ZjZjMzhmOWE4M2Mw
OTQ5ZWMwMWEKCkJlc3QgcmVnYXJkcywKLS0gClRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGlu
Z0BnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
