Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AA3BE5B1B
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 00:34:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF54EC57B61;
	Thu, 16 Oct 2025 22:34:33 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2298C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 22:34:32 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-363f137bbf8so10774971fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 15:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760654072; x=1761258872;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iX+5unsZ/nIc8zTlOk5LEx289kMidILELWKfCtaDFTo=;
 b=s9p2BIzJ58FaOCP+4tBeUpzZHW21TqENgeW3+TcTXyywXdg39W+VS0QaR8F3RaHgSD
 bADxu0jfDeuSJ3J68ukEXJRWNOlOzLr1553YmuPD3lC+y1/HXEor7G+SKAIwnRWL0GDt
 ww8X6funXFx/cC0YUMAgnMEAneGD/THFUOwLgzAtgf88m90kGxC3IZ3DscMGdIG+8mfX
 CHGobHME5I3JiG3JCzJk1hHGFFakFluhaJYi305tSbiqrKN7HqG4MpAUGQe7JlYdHUa/
 8atTMGsgtDnwwHXPsv+Hv/v+VjQieeQ9IY1FqFl1f8vlczPQ0TxEGhrLTO7mNI26txvz
 pfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760654072; x=1761258872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iX+5unsZ/nIc8zTlOk5LEx289kMidILELWKfCtaDFTo=;
 b=eLn/gY/LHTKPqmNFG44rDoQ9TSa9s6NoSoX68eEVQLxFp8IA1jJlxnGfRiY1bKsJcI
 bcwTkDd6JYgWh9/uvqI5h+n4SdLHKckfl7kYK+4cPqVnH5Tom9P+NpBK1TYtXZ22duVG
 s5h7CokejzOcRu7tnpyA0Mp3KEfgKBkIuHtchbk6/beQylKf6+NmwsuYR9cfJzBaSG8s
 fWmcKKzr7DGY1lDeqDL3dw/G2FkdngDU7RgDHs4SuFAwOHUHrPY3BHLWEdT2yvsvvqMe
 hvWCWLjuETP7OM2x0/0aRPbL5mdkXW3kWsXfjTI15QD/MGSGcwrNEk2wPY7FkjT5Ockk
 gHrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHhZt6oFxZPVmAw+V0LO6PTkg8cs3a/gDLBXuuHwHQl7k374b0p4Dq7IlXDkHa7i0fAUTLI/1R6isiMg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz252auh19OAtHZsLnL2/rwmj1UfdOSlAY5UZArKe75MqqhLHL3
 j5fLIiABGdLH2+JIsIewaT2d1ek3669T7m8LyoZBqrqv/U8o/gpl4iAbDdymjbiQTuaR9zlICdb
 iEK4aWx82gRNlktcaAYnfLGWm7T2tljms5jPktPD/Sg==
X-Gm-Gg: ASbGncu1NcMhXQvHkJO3hXXUOfZsbvXlph6VWqoQ//+S/PQ8zIqDOKKq74fU2uZR94i
 MAJ/X4jHIg7oG+J0ZwfUVR55BIxxIWWlZGOEQQPtsG71sqx7iq2b+l8NiukAUOsxRbKdkITMrCF
 F1d0QVRhtmgJinvqWLJxtoh9Un1OX+EdXQv5kwjhMscPj1TNw4xhK0xe341Dco11NnswGER07s6
 oAdqX0CJDlK3I+cqEPFoHQUrk+ww1O5VABX2WWVTY7O6ulgtPBIYNMFcD18
X-Google-Smtp-Source: AGHT+IFA4cyVMFygunIvR6Sb+S9YIRIcOrQFSwrOM7TfF/g+giPJ+nTPjzhR5YZOyLHNwAaJZrRx7sKEMrauQ98ImcA=
X-Received: by 2002:a05:651c:1b12:b0:376:4320:e362 with SMTP id
 38308e7fff4ca-37797ad8130mr5292681fa.48.1760654071781; Thu, 16 Oct 2025
 15:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
 <20251014-barbecue-crewman-717fe614daa6@spud>
 <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
 <20251014-water-gown-11558c4eabe7@spud>
 <7ba7c2f2a6dcfac30f05b35a4f41ef0af2dab575.camel@foss.st.com>
In-Reply-To: <7ba7c2f2a6dcfac30f05b35a4f41ef0af2dab575.camel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Oct 2025 00:34:20 +0200
X-Gm-Features: AS18NWC4woaW4Og4j92NIZzv9C3mFxPWXkXZf-tyb-63Pv9rPBLJcNATzKQalio
Message-ID: <CACRpkdahbDfu+ffZC50hPrZRRo85_A3WUr8za-D7_tRJA6shrg@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 02/10] dt-bindings: pincfg-node: Add
	properties 'skew-delay-{in, out}put'
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

T24gV2VkLCBPY3QgMTUsIDIwMjUgYXQgMjo1MuKAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFdoYXQgYWJvdXQgdGhlIGV4aXN0aW5nICdz
a2V3LWRlbGF5Jz8gU2hvdWxkIGl0IGJlY29tZSBkZXByZWNhdGVkIGluCj4gZmF2b3Igb2YgYSBu
ZXcgJ3NrZXctZGVsYXktcHMnID8KCk1heWJlIGl0IHNob3VsZCBiZSBkZXByZWNhdGVkIEkgZGlk
bid0IHRoaW5rIG9mIHRoYXQuCgpJIHRoaW5rIHRoZXJlIGlzIG5vIG5lZWQgZm9yIGEgbmV3IHBy
b3BlcnR5IHRvIHJlcGxhY2UgaXQsCnlvdXIgbmV3IHByb3BlcnRpZXMgY2FuIGJlIHVzZWQsIGp1
c3Qgd2l0aCBpbnB1dCBhbmQgb3V0cHV0CnNrZXdzIHNldCB0byB0aGUgc2FtZSB2YWx1ZSwgc28g
aGFyZHdhcmUgdGhhdCBjYW4gb25seQpjb250cm9sIG9uZSBza2V3IGtub2Igc2hvdWxkIGNvbXBs
YWluIGlmIHRoZSB2YWx1ZXMKYXJlIGRpZmZlcmVudC4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
