Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BADB71600F
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 14:40:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37EF0C6A613;
	Tue, 30 May 2023 12:40:10 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E3D4C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 12:40:08 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-568900c331aso24438507b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 05:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685450407; x=1688042407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KOtUrb1jXt1YTc92Nx2K8yaF1tV0C2PLHIJDBXMJ1e8=;
 b=Xzaug7RhDfquxOwHHHTAUcmTCtkuzS5zRcWlYeEfobpHfoMjVlAS/CwdmhocJy+96e
 GWYVY+IToJWNf9RtM9CIM/4PkuKAlXjNuQvcsVuWPFSx3X7+/JzWNPUl91BQ2ra5ZCl9
 WONJg0uWUzsOzjrDyIK0shIC3ZgS5EfKxfg2hGcKlFIk5QoOXa0c6mbUMYZXh+tuhlZT
 /PitNi3wMZcN5EZ+MZKSUEOGbHJh1N3Gc9VcsdvFdffGhb2KSAG9ISFWbZVIgAazwWrD
 CTGPKjvp6w9IHZGE8jnBotfig/8ctvxCSmFJUU35tgunJYFbWHAKP83CjH6vJNj44Vm2
 b5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685450407; x=1688042407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KOtUrb1jXt1YTc92Nx2K8yaF1tV0C2PLHIJDBXMJ1e8=;
 b=hJz63WzwakDLgGvspd7qmAo0hwSXiw+eRC2egOo8AJnnmy4gFWeYYhfrTNwzObuxXB
 EVFoAfSKxmVqeauqCa9Nl6oyR+HyI74vr7ZSfhHCsIivQiOWHJPXudl14KjrN/blPj0p
 ANSYE5wmzmTOIC5fFBgLd8s4ciOZAqHmp9ceeaS5Dg3PrlA3sFhMv+GlsJ/yOnm5a75o
 C0xzE5JAK0KWJFOpPofc4N3xrFG0/FZfhe4gKQopbKy9a1ssDRuhr/GAXTnC/CBtklaH
 NDj+UPNOk7Crm9mFGqOPMtsU/lPc6ilxIqCC36IzqxMo9WmbXfcuQEnEDlWv+y7KX0oY
 3SNA==
X-Gm-Message-State: AC+VfDwg4rzRyCebkhfvg9niMy5p6PcBRxNtOk5LTrWLYe8h3ZdqENyn
 jHQfpfk8MUrBfnKzAk4L74VxTrFSOqVapavcE0FR6A==
X-Google-Smtp-Source: ACHHUZ5IRGVEGgUUERDvrDWcgtVuSj/SsOzSJ38VVusLz/5pCio/b35QywJsy1pwoBoZoBBFa8YeImTExOj4H4CgVzs=
X-Received: by 2002:a81:83d6:0:b0:566:a76a:fcc2 with SMTP id
 t205-20020a8183d6000000b00566a76afcc2mr2345411ywf.4.1685450407354; Tue, 30
 May 2023 05:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 May 2023 14:39:56 +0200
Message-ID: <CACRpkdboHeg-=thHvZrQXcx_HnecwmuBJskJTPjxFOB9z9R0gw@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/11] Add STM32MP25 support
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

T24gTW9uLCBNYXkgMjksIDIwMjMgYXQgNjoyMOKAr1BNIEFsZXhhbmRyZSBUb3JndWUKPGFsZXhh
bmRyZS50b3JndWVAZm9zcy5zdC5jb20+IHdyb3RlOgoKPiBBbGV4YW5kcmUgVG9yZ3VlICgxMCk6
Cj4gICBkdC1iaW5kaW5nczogcGluY3RybDogc3RtMzI6IHN1cHBvcnQgZm9yIHN0bTMybXAyNTcg
YW5kIGFkZGl0aW9uYWwKPiAgICAgcGFja2FnZXMKPiAgIHBpbmN0cmw6IHN0bTMyOiBhZGQgc3Rt
MzJtcDI1NyBwaW5jdHJsIHN1cHBvcnQKCkNhbiBwYXRjaCAxICYgMiBiZSBhcHBsaWVkIHRvIHRo
ZSBwaW5jdHJsIHRyZWUgc2VwYXJhdGVseT8KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
