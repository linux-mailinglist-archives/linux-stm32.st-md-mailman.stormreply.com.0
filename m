Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F697FC087
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Nov 2023 18:49:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88BE7C6B46B;
	Tue, 28 Nov 2023 17:49:37 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6F56C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 17:49:36 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5098e423ba2so8352425e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 09:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701193776; x=1701798576;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fIAezfU5V4i15X+137zRs84aJguIecETApsweAHYW1A=;
 b=RiyIgTQQj4H6zGF3ci3fVAtb23iKVK1JFExkIMNjenQMhYDs9gNl3culgXtAPw6UAP
 kX3QGFqXmR7N/UPuYfLj5m8QJweF3uia+508N8nD8XKmwnBxlChXiGC0u/E/j9UyS39K
 psDYDTTmQHQCH8W6Csg/dthuyv51Nl3HstjK/uTORk9i3lBf7Zy9H2ZWtnep291adkxn
 q+BAf0Q9moS3KuPpnwwRRSmC5+7SnxEKOJ3v1Z2pncTOTCrjrUyjNMYcphcsOtje3cdO
 YMeDbiy5bfWEBn/unsjc62G5evwodm2tKMacGzQ5BjU9sgSAB6suMLXZIvgSnvTPzL2/
 1klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701193776; x=1701798576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fIAezfU5V4i15X+137zRs84aJguIecETApsweAHYW1A=;
 b=CSVqdX1kez3NEeL5Y8d4bgiHzz+b9GHI5wzma+wT7ktB2Go3n9wb+RBCKW6pCXL7Ld
 sNuGt/zy6EtE7pDaOvXllFVDYbGUiyh0h5NhEUij+rUe6FTUtMJbAntuAHEC8LJvttx6
 XsxbUHg+0wqjzVsnHjaSwbK8kN0e3NJTuNc8fPovASLyk0tRI3JxY8ZzeMqvZspXnWLS
 aoVkMquKc5jbwaCRbMwHGZqvX8sLluHzwh7dgFjTDPD5CSm7ftoQwXeBncBgB9sBZwYr
 Feb3m0oMtk7+8eeUcUZax4iK+Ire1DMsrTRjR8Fga/0911YvWqJgaMeaarnfcddnyI0J
 Xo0A==
X-Gm-Message-State: AOJu0Yx3KRGE+qJVOaurxgfEyqTv6cmESscQaEf2Q+kwzwzqLKM6Qsh4
 oPayrIX70NArWFQ6p85gGGg=
X-Google-Smtp-Source: AGHT+IGLx/ajG7Ro6+7rSHhh7RvluDw3EeEXY0NVHO2nCh63CWI85nTxBO+CeSFb9SEEBbxEeZUTXA==
X-Received: by 2002:a05:6512:3d8a:b0:50a:756d:40fd with SMTP id
 k10-20020a0565123d8a00b0050a756d40fdmr13593292lfv.11.1701193775613; 
 Tue, 28 Nov 2023 09:49:35 -0800 (PST)
Received: from localhost
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 lw5-20020a170906bcc500b00a13f7286209sm971010ejb.8.2023.11.28.09.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 09:49:34 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Tue, 28 Nov 2023 18:49:25 +0100
Message-ID: <170119374433.445690.3475637524078126762.b4-ty@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org, kernel@pengutronix.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/5] pwm: stm32: Cleanups,
	get_state() and proper hw take over
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

Ck9uIFRodSwgMTkgT2N0IDIwMjMgMjI6MDY6NTkgKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdy
b3RlOgo+IHNvbWUgdGltZSBhZ28gUGhpbGlwcCBhbHJlYWR5IHNlbnQgYW4gaW1wbGVtZW50YXRp
b24gb2YgLmdldF9zdGF0ZSgpIGZvcgo+IHRoZSBzdG0zMiBQV00gZHJpdmVyLiBIZSBjcmVhdGVk
IHRoaXMgc2VyaWVzIGZyb20gdGhlIGZlZWRiYWNrIGJ1dAo+IGRpZG4ndCBjb21lIGFyb3VuZCB0
byBzZW5kIGl0IG91dC4gVGhlIGdvYWwgb2YgdGhpcyBzZXJpZXMgaXMgdG8gYWxsb3cKPiB0byB0
YWtlIG92ZXIgYSBwd20tYmFja2xpZ2h0IGZyb20gdGhlIGJvb3Rsb2FkZXIgd2l0aG91dCBmbGlj
a2VyaW5nIG9uCj4gYW4gc3RtMzJtcDE1NyBiYXNlZCBtYWNoaW5lLgo+IAo+IFRoZSBvbmx5IHRo
aW5nIEkgZGlkIGhlcmUgdG8gUGhpbGlwcCdzIHNlcmllcyB3YXMgdG8gc3BsaXQgb25lIG9mIHRo
ZQo+IHBhdGNoZXMgaW4gdHdvLiBQaGlsaXBwIGhhZCB0aGUgY29udGVudHMgb2YgcGF0Y2hlcyA0
IGFuZCA1IGluIGEgc2luZ2xlCj4gcGF0Y2guCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEK
ClsxLzVdIHB3bTogc3RtMzI6IFJlcGxhY2Ugd3JpdGVfY2NyeCB3aXRoIHJlZ21hcF93cml0ZQog
ICAgICBjb21taXQ6IGY5OGVmNmJlYzQ4M2I5MjFhZTQzNDFjNzcxOWMyZmUyNmQ1ZGQ2ZWUKWzIv
NV0gcHdtOiBzdG0zMjogTWFrZSBjaCBwYXJhbWV0ZXIgdW5zaWduZWQKICAgICAgY29tbWl0OiA0
Y2YwMzEyMGMzYTk2ZTg5ZWYyZWMyOGY3NTJlNDdkMTFiZTZiMDM2ClszLzVdIHB3bTogc3RtMzI6
IFVzZSBod2VpZ2h0MzIgaW4gc3RtMzJfcHdtX2RldGVjdF9jaGFubmVscwogICAgICBjb21taXQ6
IDQwNmEyYWU5NTMzNTJkODhmMjRjYTFkNTY0Yzg5OGY0ZDg5NmZhZjAKWzQvNV0gcHdtOiBzdG0z
MjogSW1wbGVtZW50IC5nZXRfc3RhdGUoKQogICAgICBjb21taXQ6IDY5MTJiNjdjNjU1ZjUwMmRm
MmQzYzgwMDAyNTYyZmFjODc4MDFhZGEKWzUvNV0gcHdtOiBzdG0zMjogRml4IGVuYWJsZSBjb3Vu
dCBmb3IgY2xrIGluIC5wcm9iZSgpCiAgICAgIGNvbW1pdDogYzAwMzFjYmE0NDJjYzEzYmVmMjM4
NWU1M2MyOWE5ODMwOGEyMDk2MQoKQmVzdCByZWdhcmRzLAotLSAKVGhpZXJyeSBSZWRpbmcgPHRo
aWVycnkucmVkaW5nQGdtYWlsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
