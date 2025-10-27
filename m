Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8654BC11A09
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 23:11:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45C7AC6049D;
	Mon, 27 Oct 2025 22:11:44 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 966CBC6049B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 22:11:42 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3652d7800a8so42521161fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761603102; x=1762207902;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/tdW9Tc35Kw3/0Y5blWohgMonE+9zr16T+U6ZKHumPk=;
 b=MsNe/rIiJOIjf3zRpGs+RcfJ+VT9btGMJpER8MiGBLzpLIhlIspcqlihdnDGdpKIoc
 Rav/ZUvMxOaULNerHb9WLgLLSEjsLFKONg94JgGMGDv2RYnVJRhNqORVlSR2+ciEoCXb
 ciYC4CC1k0nlBdQ8IEJBzyx5A+Y3WGwbLVvNus/43vItBcrpYfjRykpgWVtZIuE9JlXu
 LWXiJ4gT/t97zvSJ/M49Aqv9zTZDOize+/Vp5jCLxu4QMTx1RUjxNrqrzPJ5ZQqZSFpZ
 rugeTVYdH3c9ve6az8gNoNc/sgG1ZfcLlYXN3MBFyhRnWxdc6MzvuSRM8GNBjRul0mjs
 IeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761603102; x=1762207902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/tdW9Tc35Kw3/0Y5blWohgMonE+9zr16T+U6ZKHumPk=;
 b=iAK+MREurSXGq//y9CEVKBWoW28MGO3iV8Lx5EPPYm2rs2WbdjNTb/in7OjDVUa7Ho
 LQiDW2M95GS706nwqt99QDLs51fCowN1QHhct824Vk28G8RgnvEULuxRjv/Aa+YE0NCh
 UrRABeq1n8A7dYUYWuOScgqv0dChkX+z6G7NLkJ+T31UAqNpHzXfsdbB0uSBEcQAhyq0
 qREYlT3X9dyUXEwnbWEcZqstyztUkoX/m+x+u5Tl6EVqPCDsukdD3a/+vagkYm7RUKYg
 kV7mD+Pcd65WokbKzkwzrkbAKlHsraGTrugw81mxd/3NYJoXWmDHXRqjpnBWXKhsRodT
 JMzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmlvlNw8J4i2gQ1vjZGo5tTHxoRz2a5R4TbDkYw3+UldQh/8eNu2Tz6PL0POmF0DuwrFF1pnjBVd8RdQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxa+eFH/NaO/IIBTJh3WYMeYwSg8yJpv0iWqQMpzLw1fVc40Hwg
 YwKZ5lfmPU5TQCsSYsyRgFVVaTg1Z52qGPSBTspJixFHL+1tCAwfRIpTAxxyNhVK9K8Rai5ib5u
 G0HaA9ppO6C68RzcVPTxYDNS/ZWB2BdhJmg8CnCYu3g==
X-Gm-Gg: ASbGncsdVviecmFq8/qfEypQQgOgjAAREttnof9zIcOQlSV30aeZY9c6XTvCmg6ntiT
 XaMkJOxIjhRRP3GjZKipruRJ1nf8tfXkAl7NPEJm7jQrzvVsrTrtJopcPMx56mVyeKXvsMrIgYk
 UqG5uUfPVciiLI5dEsvD/8uDVky2eb5qbeuB2+jIOGyiH/uK3tlgDaB89JInp6yskaTDeg438Ye
 yvBXn1HNL8ft9mBKr032ZSAOgL9VQITQJL531N2S7aPKT7r5rx2koNan+ZO
X-Google-Smtp-Source: AGHT+IFLT1ZdWr/hhEMnm9sTGNuOU2VvPh+C7lrdPQU4P+9e/YVXxLQp3pBZJvB8TttzAJ2Uq4NY4gf67nRQdQ5ZGG8=
X-Received: by 2002:a05:651c:885:b0:372:9505:7256 with SMTP id
 38308e7fff4ca-37907711530mr3518411fa.30.1761603101693; Mon, 27 Oct 2025
 15:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-5-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-5-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:11:29 +0100
X-Gm-Features: AWmQ_bma_Zx4YiWdv5O86TAgEFt04A-92MDE252FFHP4HKRhB_QpFTlP5ImwzJk
Message-ID: <CACRpkdZHYWMezkPq55Xmfj9U+0pALg-DJaR2bKXA95s_ptk8-Q@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 04/12] dt-bindings: pincfg-node: Add
	properties 'skew-delay-{in, out}put-ps'
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMzoyN+KAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IEFkZCB0aGUgcHJvcGVydGllcyAnc2tldy1k
ZWxheS1pbnB1dC1wcycgYW5kICdza2V3LWRlbGF5LW91dHB1dC1wcycKPiB0byBzcGVjaWZ5IGlu
ZGVwZW5kZW50IHNrZXcgZGVsYXkgdmFsdWUgZm9yIHRoZSB0d28gcGluJ3MgZGlyZWN0aW9ucy4K
PiBNYWtlIHRoZSBuZXcgcHJvcGVydGllcyB1bmF2YWlsYWJsZSB3aGVuIHRoZSBleGlzdGluZyBw
cm9wZXJ0eQo+ICdza2V3LWRlbGF5JyBpcyBzZWxlY3RlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFu
dG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0Bmb3NzLnN0LmNvbT4KClBhdGNoIGFwcGxpZWQh
CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
