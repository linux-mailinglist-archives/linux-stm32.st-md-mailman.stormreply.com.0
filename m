Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED561B2D601
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 10:19:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A130C36B31;
	Wed, 20 Aug 2025 08:19:02 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E14F3C36B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 08:19:00 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b4746fd4793so2575859a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 01:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755677939; x=1756282739;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wUn65ndWyyECy779FroH88LwpGWaBPZvfehi8phsszk=;
 b=bXaT9UoA/luW9P6VY56lczJntbVTi71CCR06hlM5kQtDT+XYbKnfP4sKDP6jg9u13A
 Zodo8dEBWT9hyh44hRKwvfr/sOCFDk8mO0W8DR5lg16b9HiIVxMxl9vmkq6JU+Jfgwta
 suSKuiLW2bK0BWssX9ogCi01aCTYa+nyetq/d09DYhviM1WgYpAuIEparxYCQXR9xtWE
 biFmP1Ckch4+o0boXgRFzC9olQPLUu0CSDRvaWQYdJ6/z7Z9VIbfQsvOssOHJ+nbcIll
 TMocq+iFYVHJlxDGGuRx6ZVWf6Q4jM9K9AgYXr2NjUv93xJSPyOebg8uUoRrnlKwcuOL
 B7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755677939; x=1756282739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wUn65ndWyyECy779FroH88LwpGWaBPZvfehi8phsszk=;
 b=fcMGvm9dHc20f+eRaUjUPySE5WJr3pkrxjJEelLlvbX0O3V87fhXMAm0N7djwkBZ9H
 4m2eelQCUOwiVOwZ4ZWC/j3ZoER4CIt4Fxu2KFHMXFEycfKbg9OVqXiVJUT0ky3otDIK
 2O9pU3POt9scZJtdjQQVpoDpcz1dm1hYXvjImdv9CUjONVYRT1Lcngn7CnblMtabxVto
 XI13/m6llORbQsQcgkHu98GpMpFuSRurWABExv4lWnm64f8w/490NOUvmIeAb0u7t1QO
 GoJilhk/PGdEMIwjZWwyVnC9cTD6Ix9/kj61BEnRPf8kdmg09tFE/RUfuqm93oqjlxkC
 TmUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjoqlQgsa5g3H6Iv0ctxvqpUOdV5NIwpobk6bFqaObJ5lEPcV8H0GaQR3rizXt3GIl/+NLJNLgV6DPrw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YylzWIZ/mKnzKM5wrOxSYbk7Ndkzp6lwYd0fnJC9PR3LKRC0ko3
 rqucQyCSNlvgQFbgqJE6eXRwq6+HydLvXmKYesJDI0kGnYvHf+BD0MFt5xb+IYUsq+7kjbbfuJT
 K8ZNCUXCUMulSkq9n/CJJw5RKJsfJpCw=
X-Gm-Gg: ASbGncs+/509b9sipgrFXmBi9OYCyYh7piLyfpn2E5qO/vLfE3o5TEfAWe2b0qvqO70
 rOPQRTEhazX8aO15SKxaR7bzB4+hIoMOnYFxk3dauSTeH0D9nyMT+T3M9pp+4VbLoK342uASLW2
 DWM+e3KNJoIhpdp6opv4wI9FU1/Z7AKlKXMWnXPmJKUECPoffVWZLvqhO2VU6dKX0qkbPSbE1jw
 NO4
X-Google-Smtp-Source: AGHT+IHyS319ZtbgIK5QZ2TPQXhA0Y58me3odjKXWmlmqSDihLpOV/ytvp3iwfpabPjgDac+00Icnjn6G+Cpo8Pj+bM=
X-Received: by 2002:a17:903:18c:b0:240:96a:b81d with SMTP id
 d9443c01a7336-245ef0bf2bcmr23609915ad.5.1755677939214; Wed, 20 Aug 2025
 01:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250819213831.1368296-1-robh@kernel.org>
In-Reply-To: <20250819213831.1368296-1-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 20 Aug 2025 11:21:09 +0300
X-Gm-Features: Ac12FXwDgSq5YSRmZRgmCG7R1pa20x6uPGQw-yiLKpdR5FfgZLxMT4en9AePre4
Message-ID: <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-remoteproc@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Magnus Damm <magnus.damm@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5] remoteproc: Use
	of_reserved_mem_region_* functions for "memory-region"
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

SGkgUm9iLAoKVGhpcyBwYXRjaCB3aWxsIGJyZWFrIElNWCBSUFJPQyBzdXBwb3J0Lgo8c25pcD4K
Cj4gLS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5jCj4gKysrIGIvZHJpdmVycy9y
ZW1vdGVwcm9jL2lteF9ycHJvYy5jCgo8c25pcD4KPiAgc3RhdGljIGludCBpbXhfcnByb2NfcGFy
c2VfZncoc3RydWN0IHJwcm9jICpycHJvYywgY29uc3Qgc3RydWN0IGZpcm13YXJlICpmdykKPHNu
aXA+Cgo+IC0gICAgICAgICAgICAgICBwcml2LT5tZW1bYl0uY3B1X2FkZHIgPSBkZXZtX2lvcmVt
YXBfd2MoJnBkZXYtPmRldiwgcmVzLnN0YXJ0LCByZXNvdXJjZV9zaXplKCZyZXMpKTsKPiArICAg
ICAgICAgICAgICAgcHJpdi0+bWVtW2JdLmNwdV9hZGRyID0gZGV2bV9pb3JlbWFwX3Jlc291cmNl
X3djKCZwZGV2LT5kZXYsICZyZXMpOwoKZGV2bV9pb3JlbWFwX3Jlc291cmNlX3djIHdvcmtzIG9u
bHkgZm9yIElPUkVTT1VSQ0VfTUVNIHJlc291cmNlczoKCmxpYi9kZXZyZXMuYzoxMjQKc3RhdGlj
IHZvaWQgX19pb21lbSAqCl9fZGV2bV9pb3JlbWFwX3Jlc291cmNlKHN0cnVjdCBkZXZpY2UgKmRl
diwgY29uc3Qgc3RydWN0IHJlc291cmNlICpyZXMsCgrCuyAgICAgICBpZiAoIXJlcyB8fCByZXNv
dXJjZV90eXBlKHJlcykgIT0gSU9SRVNPVVJDRV9NRU0pIHsKwrsgICAgICAgwrsgICAgICAgcmV0
ID0gZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsICJpbnZhbGlkIHJlc291cmNlCiVwUlxuIiwg
cmVzKTsKwrsgICAgICAgwrsgICAgICAgcmV0dXJuIElPTUVNX0VSUl9QVFIocmV0KTsKwrsgICAg
ICAgfQoKd2hpbGUgdGhlIGRldm1faW9yZW1hcF93YyBkb2Vzbid0IGNhcmUgYWJvdXQgdGhpcy4K
ClNvIHdlIGNhbm5vdCB1c2UgZGV2bV9pb3JlbWFwX3Jlc291cmNlX3djIGhlcmUgdW5sZXNzIHlv
dSBhZGQKSU9SRVNPVVJDRV9NRU0gZmxhZ3MKdG8gIG9mX3Jlc2VydmVkX21lbV9yZWdpb25fdG9f
cmVzb3VyY2UgYXMgZGlzY3Vzc2VkIGhlcmU6CgpodHRwczovL2xrbWwub3JnL2xrbWwvMjAyNS80
LzI4Lzc1OQoKVGhlIHNhbWUgaXNzdWUgd2UgYXJlIGFscmVhZHkgZXhwZXJpZW5jaW5nIHdpdGgg
U291bmQgT3BlbiBGaXJtd2FyZQp3aGVyZSB0aGUgY2hhbmdlIHdhcyBhbHJlYWR5IG1lcmdlZAph
bmQgd2UgaGF2ZSBhIGJ1ZyBhbHJlYWR5IHJlcG9ydGVkLgoKSG93IHNob3VsZCB3ZSBmaXggdGhp
czoKCjEpIEFkZCAgcmVzLT5mbGFncyA9IElPUkVTT1VSQ0VfTUVNOyBpbiAgb2ZfcmVzZXJ2ZWRf
bWVtX3JlZ2lvbl90b19yZXNvdXJjZQoKT1IKCjIpIFVzZSBkZXZtX2lvcmVtYXBfd2MgaW5zdGVh
ZCBvZiBkZXZtX2lvcmVtYXBfcmVzb3VyY2Vfd2MuCgp0aGFua3MsCkRhbmllbC4KCgoKRGFuaWVs
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
