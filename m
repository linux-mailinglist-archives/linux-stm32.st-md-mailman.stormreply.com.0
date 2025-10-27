Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80292C11A6D
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 23:17:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DEFBC628AC;
	Mon, 27 Oct 2025 22:17:32 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF691C628A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 22:17:30 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-37902f130e1so12179111fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761603450; x=1762208250;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gu9c7lWkxgnzHfgy0KZY7zp67ms1gfmmcEaQ5l83Deg=;
 b=cjDSMQZI/0w+bNat5KI+9HVfKJWJ58yWlAM+FdxLEWxfH9lFx4JgNZa6RxHjiopLZC
 JPI3aLEoIbWR4ItF1s4y4zjo8rLgKLPdqHya/Aeqj+5UPJT+IHuAZSipnYjUAB0Ncy5T
 RGnVDKdjhe11lpdWjC/1Qkw+f/9P8Tx1MtBruqQzJutnT20lQr4tKDD1MhhH83BQwWMs
 FMBjDar7NQ/y06hiuAf7DnxATFl0WhVRt0HL1PrYaH0EJ+o6CYimVz8xltjU/b8k8dsl
 nDGxvE/psq39kL7ZZlmvWb7GcdTxwuPW80sbn7Gb/zkiF/vGbb9s1yQfPMkQ+8jgrqls
 Gh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761603450; x=1762208250;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gu9c7lWkxgnzHfgy0KZY7zp67ms1gfmmcEaQ5l83Deg=;
 b=MnMh9hfFow7/qmG9hqIToRerZuYgKqes9ovUHMrvflMoT7Z1+rhLVkxzklqnS7qtRr
 HWtHBsP31AiRUggnZRGlSFOkI1lBatW2sOwH8jSzZO/X/PVCjfYPBDAXRumOUPlqe81M
 w4owanxnNta/xo3ARFgDQz9ArM90TUdGzk4KrYlBm930ZqITo3nnAB4PzVtA08eVfPcm
 uAq0AZ+L/AphGqgRVOq3WJjVHrty4YBk/VDLl2Q/Lcu176ERoLU/MKKU15j0+a/BZmNQ
 89RsWI5VM+YNHLEt2uY+BcAIxrEWI6UpQ5zVj1NqOChzzFyumcsHyLyXQP+OOG3zP7nm
 b32g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxv/iybqVEw/jZzBT9dkElADMuHAVUgabvuHotVE7iqBB86TLlz6sLkVmhAndftt/CEhLuepdB0w9Dpg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4lG9IVbPSxmk3LxelS4dam8sex3eMD8+nwBqvEfs/Z9QGveEb
 A6h2gRt13NahSnnk4qRl73Fcr6lVS82cSeB/lrr/LUQkNebhTsmtAKBh4go7qjVEeko1w0qCYjh
 DD3rY8N4NOvaeGEHoL0RSTNOgLi6YXK5VJSFv7gQg8Q==
X-Gm-Gg: ASbGncs2ey0i/SAJuLI5or08M+jtkM70p2xJInhGJ2TOKdGdTrenmv3bGWp0S9GGQia
 ig4JC24R4ryHWDF/2pAIBvk3CyAroZ/VSF6zkAL0mbfZtHRG7t/LW0Ngd2epYdYLphXnRqytHWP
 l/HGDA8X7q5iN5/lHpZO7oW8CPcWsD13DxBzmvefN8ZCuOyaJFFhKTD1JklJyp1sikLOVtMedbT
 1wKsvA/AV0EP4rfe/GhrZetvXkzqQLCWSVeNfxyz9O8vvlfBuSmkKgRLk8E
X-Google-Smtp-Source: AGHT+IHJkZ6eE1AkncVU3lyfeHAfgwuxN0K4vqQ9jMi+HxWP78OGiBunIzAgT3y/91LM4yJ4y7mIdTa25YZ1xkf/4xk=
X-Received: by 2002:a2e:9395:0:b0:36d:860c:d98c with SMTP id
 38308e7fff4ca-379077ad874mr2869931fa.45.1761603449931; Mon, 27 Oct 2025
 15:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-13-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-13-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:17:19 +0100
X-Gm-Features: AWmQ_bmnRcLAntimuZ53EMjWeghfhO7r4GpgnvkhG3-R4hWIysmsmbmnWQXNJ4M
Message-ID: <CACRpkdbGjsGwvJ5gA-HhUQ4_XrQJAaMa0pdzHS19sgLXv0XUag@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 12/12] arm64: dts: st: Add I/O sync to
	eth pinctrl in stm32mp25-pinctrl.dtsi
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
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IE9uIGJvYXJkIHN0bTMybXAyNTdmLWV2MSwg
dGhlIHByb3BhZ2F0aW9uIGRlbGF5IGJldHdlZW4gZXRoMS9ldGgyCj4gYW5kIHRoZSBleHRlcm5h
bCBQSFkgcmVxdWlyZXMgYSBjb21wZW5zYXRpb24gdG8gZ3VhcmFudGVlIHRoYXQgbm8KPiBwYWNr
ZXQgZ2V0IGxvc3QgaW4gYWxsIHRoZSB3b3JraW5nIGNvbmRpdGlvbnMuCj4KPiBBZGQgSS9PIHN5
bmNocm9uaXphdGlvbiBwcm9wZXJ0aWVzIGluIHBpbmN0cmwgb24gYWxsIHRoZSBSR01JSQo+IGRh
dGEgcGlucywgYWN0aXZhdGluZyByZS1zYW1wbGluZyBvbiBib3RoIGVkZ2VzIG9mIHRoZSBjbG9j
ay4KPgo+IENvLWRldmVsb3BlZC1ieTogQ2hyaXN0b3BoZSBSb3VsbGllciA8Y2hyaXN0b3BoZS5y
b3VsbGllckBmb3NzLnN0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIFJvdWxsaWVy
IDxjaHJpc3RvcGhlLnJvdWxsaWVyQGZvc3Muc3QuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFudG9u
aW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0Bmb3NzLnN0LmNvbT4KClBsZWFzZSBtZXJnZSB0aGlz
IGxhc3QgcGF0Y2ggdGhyb3VnaCB0aGUgQVJNIFNvQyB0cmVlIQpGV0lXOgpSZXZpZXdlZC1ieTog
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdh
bGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
