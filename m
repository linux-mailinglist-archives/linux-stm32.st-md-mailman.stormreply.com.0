Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9FEB17021
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Jul 2025 13:07:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35B8FC36B3C;
	Thu, 31 Jul 2025 11:07:36 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADC9BC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 11:07:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4F751A5521C;
 Thu, 31 Jul 2025 11:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F662C4CEEF;
 Thu, 31 Jul 2025 11:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753960053;
 bh=lImUF4ZBLpMGdiQw17RNIr2Nu7symGY42Ol5dyS/my0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=j5sa9myw7oph0xRcf9vzdbBI9ib0DttNAG7pQVs+GCx2Aj50jcDjDC9bNeccsa9iw
 GEweFBIvozaSBlNPYgni5JdREY4rOmRzqp23BFivHJOP9SrNxC7OhTle/mJJP7OHSR
 6yqHiXxKDX4/qzbJ1+AdA07otcCn0tWaU336YIZ5e9zfMx2RdnNEHDru+DdZiAKSan
 l66isLmjfIzLl37duak+t4C2QjfywXHL47YZilOIzqEvXzny2WU+1kotiTAP81zchK
 dXWwNny5RGIw72DEfBToY5Wgt/aafuwTVqnXFMAIJju5yS+nDo99OAOgAgmrbK9ta6
 nXBiYoBjWQ8fg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20250725070752.338376-1-alexander.stein@ew.tq-group.com>
References: <20250725070752.338376-1-alexander.stein@ew.tq-group.com>
Message-Id: <175396005138.1136000.8754984127512092739.b4-ty@kernel.org>
Date: Thu, 31 Jul 2025 12:07:31 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c81fc
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/3] mfd: stmpe: Remove IRQ domain upon
	removal
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

T24gRnJpLCAyNSBKdWwgMjAyNSAwOTowNzo0OCArMDIwMCwgQWxleGFuZGVyIFN0ZWluIHdyb3Rl
Ogo+IFRoZSBJUlEgZG9tYWluIGlzIChvcHRpb25hbGx5KSBhZGRlZCBkdXJpbmcgc3RtcGVfcHJv
YmUsIGJ1dCBuZXZlciByZW1vdmVkLgo+IEFkZCB0aGUgY2FsbCB0byBzdG1wZV9yZW1vdmUuCj4g
Cj4gCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8zXSBtZmQ6IHN0bXBlOiBSZW1vdmUgSVJRIGRvbWFp
biB1cG9uIHJlbW92YWwKICAgICAgY29tbWl0OiBmYTQzMDI1MTBkZmY5YjljZmM3ZTY2MzA4ZDZh
NjYyOWZjYzUyNjVjClsyLzNdIG1mZDogc3RtcGUtc3BpOiBVc2UgbW9kdWxlX3NwaV9kcml2ZXIg
dG8gcmVtb3ZlIGJvaWxlcnBsYXRlCiAgICAgIGNvbW1pdDogOTA3YzAxYTliMDFjYTU2MTVmNmMy
YzQ4ODMyMWM3YWFkNDY5OTMzYgpbMy8zXSBtZmQ6IHN0bXBlLWkyYzogVXNlIG1vZHVsZV9pMmNf
ZHJpdmVyIHRvIHJlbW92ZSBib2lsZXJwbGF0ZQogICAgICBjb21taXQ6IGExOGQ4M2QyZGZmN2Vj
ZWJjNDVlYjZjMjg1MTIwYjBjNjY0MDkzY2UKCi0tCkxlZSBKb25lcyBb5p2O55C85pavXQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
