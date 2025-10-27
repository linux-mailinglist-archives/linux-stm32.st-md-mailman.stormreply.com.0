Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B396FC11A15
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 23:12:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71831C6049B;
	Mon, 27 Oct 2025 22:12:22 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A06B0C6048D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 22:12:21 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-378ddffb497so49277081fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761603141; x=1762207941;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rva8eNp25Ue0gQsDBJs+PbWTXuUBcdKNczWyrciaM/c=;
 b=eig9uFUjN434Ohy/T/AbB2yjnHmhRK4gg3aMyQlTdWAD6j/rTnhriX4PraXjQHF31+
 7FYyElZIfSJZvoTPzl8FGauJVOI88+OIFES1nYt33tbZ/+8pokHfBfJdlteTuncyZXbT
 l/xFdbeI/ozL9zo10Zxu5BjlSgihU3hcuh+3EmA6I7zw9wtx72AGSW3sTQ1dSRc/I2zf
 vR8P5E31Zm8yongWclXlBUelsfHsi8KLIPR+EbfefVC/7f854UVSdXlKgLhMPu9pzIoe
 z3YtszymjTXoPUC9GRxGqwrmUhY3+MsyNm5n5Aa3lZf1vgoRyouZBQC76O4wtPIeQnbm
 o2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761603141; x=1762207941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rva8eNp25Ue0gQsDBJs+PbWTXuUBcdKNczWyrciaM/c=;
 b=m+CzvYNAl+IE03wg00auQd2dcSxEigDApAUEe5tnRIpOdamfj9q/qWd1Q7+3gx1ANc
 h2MhVgwbDdfFCsVajtA8QSqhSABYnMVV6Kc77rgDfvAKij6JuaduO5ybkqsF6dbStgAO
 2JvHMN3YPGHrh+GvRC/XyB38Hj4B/OOzcpqUO3/39fFd+41rhtEVthXWbOs7H4w8GRF1
 0NZR4rutd8+RN8nNJIRfX3E2KttxKNUR1JbX9414OTzA22bD1B52LlIXLSgNyNR6eo8d
 UgKj0L3mR+lKlbu5XEeAj/uO+9zgLh9qsfxrFA8FlMt1NAhlfky2fdt48Gm2RvBC3hlS
 UZCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJaut4aswictb91nq8NslJlO1SmmIYlb7eW0dDiLjWmQhEnkXaJOPpvdYxCfMizZASHsaPRijNhsUaYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy01GjcRMjlzflkhPSs9FASXc1goEFEyZhBPFWOx/GZMs0K8ZtR
 r3WrX97u8NCm16HylWQVC2DxVKUwbYAId0E/Ks/FkqpAYFiIIh+mhBKc3c5hS4+NumtMCGpxxlP
 512vsymptOT623VR00WDzirJYFDcohOiQ3Ki57VDNrg==
X-Gm-Gg: ASbGncutWSOFwGwccYILtLdZ0twrxAO+lnF29EhzlGw/pvEFzaItRszrtmLz+n0Bk+K
 oLF49UIe7yq9K5U/8c5kfvHpWex+E3qFmCcvmRYHZ++BSij7XImKFQW6rLnZEcgUoqyeN3W9Axq
 jugd8//RpKVpSTBBhulD0+jF38cuClVQLuZ6YTBeaGoHThI7+A5a6/nxqVKtoDMcr4p8X3w1Vmy
 ds4A9H6hb2FB1CRjIcrmM9YVdm894Df2QR/+EJr8kyRz0E099vXVW++C/sK
X-Google-Smtp-Source: AGHT+IH9m/NbKfDEBOg7KAI9hfdkDs7TGJGbF3wUoHtsDaxpc5srcl1X8uRL0I9IzeShm5L96wIBCgrx2J3l4dX7aIw=
X-Received: by 2002:a05:651c:1b05:b0:379:348:80da with SMTP id
 38308e7fff4ca-379076be2ebmr3767231fa.8.1761603140859; Mon, 27 Oct 2025
 15:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-6-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-6-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:12:09 +0100
X-Gm-Features: AWmQ_bk9gp6HQ-6BpDwN-PY0mSBFQkGGnyA4wpSZIs-jczVxX4VZCaFGaKlsqZw
Message-ID: <CACRpkdZK9L9q_zLZVc9JLmJ=XPWFBrKgk_3bLxxpCFvRCJr9-g@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 05/12] pinctrl: stm32: Rework
	stm32_pconf_parse_conf()
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
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFJlZHVjZSB0aGUgbnVtYmVyIG9mIHBhcmFt
ZXRlcnMgb2YgdGhlIGZ1bmN0aW9uIGJ5IG1vdmluZyBpbnNpZGUKPiB0aGUgZnVuY3Rpb24gdGhl
IGRlY29kaW5nIG9mIHRoZSBmaWVsZCAnY29uZmlnJy4KPgo+IFdoaWxlIHRoZXJlOgo+IC0gY2hh
bmdlIHRoZSB0eXBlIG9mICdwYXJhbScgdG8gJ3Vuc2lnbmVkIGludCcgdG8gaGFuZGxlIHRoZSBl
eHRyYQo+ICAgdmFsdWVzIG5vdCBpbiAnZW51bSBwaW5fY29uZmlnX3BhcmFtJzsKPiAtIGNoYW5n
ZSB0aGUgdHlwZSBvZiAnYXJnJyB0byAndTMyJyB0byBhdm9pZCBhZGRpdGlvbmFsIGNvbnZlcnNp
b25zCj4gICBhbmQgYWxpZ24gdG8gJ3UzMicgdGhlIGNvcnJlc3BvbmRpbmcgcGFyYW0gb2YgX19z
dG0zMl9ncGlvX3NldCgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGFudG9u
aW8uYm9ybmVvQGZvc3Muc3QuY29tPgoKUGF0Y2ggYXBwbGllZCEKCllvdXJzLApMaW51cyBXYWxs
ZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
