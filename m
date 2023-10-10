Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3397BFADD
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Oct 2023 14:11:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70755C6B44B;
	Tue, 10 Oct 2023 12:11:43 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EA7FC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 12:11:42 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-d81f079fe73so6450203276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 05:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696939901; x=1697544701;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+q8X53t6/nAULKwb/iQeHBUqOXFycHH5TaG/WC1vrU=;
 b=TZcL0h1oO+GapK2XUTXluBIYKrotVM8YsrX6fK7s97IDkP4rvwAcx74CMCRRQCJugE
 LPuWkKMrsIDjHwyg7FTcQtgc7JSwb70wBvSR8Xe5yXDZcBk9j1HsffXyYtVNeQN8RIyQ
 1/L3bjk/BVzE6PZjuq7MTV49z//LMNswVOlzjHjfXjw472pka9eoSeMmIOJlypj8oBkb
 3zk0/xQqRiovKlJzhwsbQtA0f2Px/31PrK0L/tOwiFAXA+rezTqMFundLlURSGdqSFwz
 IQXHj4nU9LWurS4LPOr7UFubo/o7xLtmodSzvKJ8zkP8nACOiQ9zFsWW1hztVTv5Ck2i
 xecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696939901; x=1697544701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+q8X53t6/nAULKwb/iQeHBUqOXFycHH5TaG/WC1vrU=;
 b=mmjAftibqYGMvCzKXRzepDT6FLy2iC3/y8oBIN3vYAemB3COgBF5ETd+M+aLP4Y9rX
 8UzO2g3PU9tbLUgOCovzC4yB/PjHtOqVnhMSFdGouocusCfY/4gfdnjkfryVPHEUykD3
 dd/m2NG4rf4l8ez2fctzY5lzid1yNRQzG/rlr/9bsSauGsL55+2WyMzSGtBLzkvmwI8j
 loOdL/2qX28okHYZO8hARWqt/Yz5R2m6jpiG+qGkOsQx/ZeVBOK2tqd5IY1fZW3z/fQl
 IpOS2lO23wJnGe73fSQWzuQ/BhS+U0Vm+exrjNnvLyz3tgYJDAJYuKXyf1+ZHaSjmFhb
 x1RA==
X-Gm-Message-State: AOJu0YxwQamFqgbxgaLSdQd5hzq4K0AH5TQA2eJBntkjNuvkxLeZq94F
 x6qCObym5gz5m89YL2Pz+A1roKErXsm1aZcOedOsOw==
X-Google-Smtp-Source: AGHT+IHY62VCVtolYEhTBCIC57nxmItuoQHuHYu3sYeMnpAunQnYQ8ZtY1uLV0kYVpGVCOXn9wxAiQn5CWxRf+sQLyM=
X-Received: by 2002:a25:800a:0:b0:d9a:5c10:d7f7 with SMTP id
 m10-20020a25800a000000b00d9a5c10d7f7mr1507482ybk.60.1696939901112; Tue, 10
 Oct 2023 05:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231006082247.3830719-1-martin@kaiser.cx>
In-Reply-To: <20231006082247.3830719-1-martin@kaiser.cx>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Oct 2023 14:11:30 +0200
Message-ID: <CACRpkdY9md81_GHN8kKJhCE9GbW6k5tRLavaQ4DJtYCf+C11+Q@mail.gmail.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: st,
	stm32: fix phandle-array warning
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

T24gRnJpLCBPY3QgNiwgMjAyMyBhdCAxMDoyN+KAr0FNIE1hcnRpbiBLYWlzZXIgPG1hcnRpbkBr
YWlzZXIuY3g+IHdyb3RlOgoKCj4gbWFrZSBDSEVDS19EVEJTPXkgc3Qvc3RtMzJmNDY5LWRpc2Nv
LmR0Ygo+Cj4gYnJpbmdzIHVwIGEgd2FybmluZyBhYm91dCBhIG1pc3NpbmcgYXJndW1lbnQ6Cj4K
PiBzdG0zMmY0NjktZGlzY28uZHRiOiBwaW5jdHJsQDQwMDIwMDAwOiBzdCxzeXNjZmc6MDogWzIx
LCA4XSBpcyB0b28gc2hvcnQKPgo+IFRoZSBkZXNjcmlwdGlvbiBvZiB0aGUgdGhpcmQgZW50cnkg
aW5kaWNhdGVzIHRoYXQgdGhpcyBlbnRyeSBpcyBvcHRpb25hbC4KPiBUaGUgY29kZSBpbiBzdG0z
Ml9wY3RybF9kdF9zZXR1cF9pcnEgcGFyc2VzIHN0LHN5c2NmZyBhbmQgdHJlYXRzIHRoZSB0aGly
ZAo+IGVudHJ5IGFzIG9wdGlvbmFsLiBJdCBkZWZhdWx0cyB0byAweGYgaWYgbm90IHByZXNlbnQg
aW4gdGhlIGRldmljZXRyZWUuCj4KPiBVcGRhdGUgdGhlIHNjaGVtYSB0byByZXF1aXJlIGF0IGxl
YXN0IHR3byBlbnRyaWVzLCB1c2UgdGhlIHNhbWUgc3ludGF4IGFzCj4gdGhlIGRlc2NyaXB0aW9u
IG9mIHJlbmVzYXMsaXBtbXUtbWFpbiBpbgo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9pb21tdS9yZW5lc2FzLGlwbW11LXZtc2EueWFtbC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1h
cnRpbiBLYWlzZXIgPG1hcnRpbkBrYWlzZXIuY3g+CgpQYXRjaCBhcHBsaWVkIQoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
