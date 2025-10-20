Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE0BF3D3C
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Oct 2025 00:09:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DFE3C1A977;
	Mon, 20 Oct 2025 22:09:06 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E28DBC0C947
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 22:09:05 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-57dfd0b6cd7so5431507e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 15:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998145; x=1761602945;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jou7wl1+eFLqh56mhBKzbuquNRGf4+Mstk8GHncGjYM=;
 b=EzRTvhxw9dUNqDcTs821zfbp2KJ83ITHcKb2z/baRpkUqbtNZ48RdzZZHAtKM/1DCH
 rgh/hbSzpZliRFTKubxXXDdRR2ueGn9JWUcEUCPg1BwuC7k/aAhAP/ZkgHnLZcsfpzUO
 wLkDOtr0dxkqOBfrivGjIDx0mGaLb4H318l3afkg94nghFCztPSqR7tQtcVnirzFL4fd
 5ItU1GOESGTfcQqu/264YFfhLU63zokf856CPvxVyw7PWKHfxtr383la05V+5zcQa2IZ
 6DmfHKhokFj8pm0Lc1NI8YFrjgwQdzrOK9zhaujcq/+m3UVwJmAC8IhcykVTq3d9lluN
 qclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998145; x=1761602945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jou7wl1+eFLqh56mhBKzbuquNRGf4+Mstk8GHncGjYM=;
 b=fZdH+zL3Acw/mWuY6rWAmr/0auX97CFEOiDcgRIbWDDMYVQIxCRrWBJJtVJ/OLUrGw
 LcngIs1q8gZOhdxlVqTbavaWjf0bfFSLL3VZXHXAqIBATJTGQP6Om72gLBEznNKS2eyD
 19t2hLrAJikRZiyipthEQy3EOsQV8FGecR5bmLH9Ld6p3PlvDVV1tdceMuKooDuuO4t3
 +hzq+hvAy4+KT/ACFUrM5GWrymJpUxJ1IIOfXkdQa5miF8h/d9iBgyp8xP0Xe0pz+SW4
 nNIq8kcIPI/CK6PueXBSHkATGqbnFLEqS2Y4XsWvurX34h/YVXyB9RLJba0EaRvoM/W8
 QNrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4lS9CQIHvDB/KHG4OqUIRdP0meQfcMsT29je3t6m8YYfSrd7ZH4fC+0f46st7QxgtQgHmDpHf3MOX3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwHsIyqmzQ27e+K6xEDIVMebo8K1bU1FazDgRFSV4giRbpQKiC4
 1Jmtg3GyPQ7unZ5+ZdpwmEY0jqBRS4LuHqs/oRuNBlF6+rtrGl09QGkiUWVO5sM+5dKof/f17Jc
 netWdyzUQmIZnlKS5Vh4mDMRoCtigBxYZVYb8TET5bQ==
X-Gm-Gg: ASbGncv9Rjb+PNQQgiX4PJiliCj2S2uo7NNTU+z19Zyj3DsbmQT5JZ1V3wvTKMQ+A9n
 Eujp1TggiA+gCJkzU7Nek/q8MNxS+3+fZAMyLiWo5qVjmDDATKZkn808fpG18nnQcZ1AGhO8NnR
 UkPRN7iKJX8xG/u4pXcwxaT8rQ2SpVRCE2ZF4cTFwcqmJ3xJGV8vkd+BrX9IdMc74eDdrOmWTb9
 JFNKriXAfpji3PYN4VTR2zsof7/MLvxbCujxdGb7oIhvURZsj/Trw4LX8RnJ3lO1LsIBwQ=
X-Google-Smtp-Source: AGHT+IHndeIzowFKyGV77xJrwW3PbYRom9TRTnbQmCDghJkjbT3tIKvOTzTzPAFp9D2embhKwkVO+r8Cc1SJcrX3RR4=
X-Received: by 2002:a2e:a9a8:0:b0:36a:cdb0:c1f3 with SMTP id
 38308e7fff4ca-37797a143b5mr45120621fa.29.1760998144941; Mon, 20 Oct 2025
 15:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-10-antonio.borneo@foss.st.com>
 <20251014-affection-voltage-8b1764273a06@spud>
 <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
 <20251015-headstand-impulse-95aa736e7633@spud>
 <0826a055f6b2e3e6b50a5961e60d1b57d1d596c6.camel@foss.st.com>
In-Reply-To: <0826a055f6b2e3e6b50a5961e60d1b57d1d596c6.camel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Oct 2025 00:08:53 +0200
X-Gm-Features: AS18NWB0sT7rk733pb0JBmXxWZ3rsESep7Jo9zTjJKG7duLHdqwxNHX29WRzGYA
Message-ID: <CACRpkdbeaiNGfOFfVfDNZ=u=4yhCykcdSdHUv-td_DVyr3aWaQ@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 09/10] dt-bindings: pinctrl: stm32:
 Support I/O synchronization parameters
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgNTowOeKAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IHBpbmNvbmYtZ2VuZXJpYyBvbmx5IGFjY2Vw
dHMgcG9zaXRpdmUgbnVtZXJpYyB2YWx1ZXMgZm9yCj4gYm90aCBnZW5lcmljIGFuZCBjdXN0b20g
cHJvcGVydGllcyBpbiBzdHJ1Y3QgcGluY29uZl9nZW5lcmljX3BhcmFtcy4KCkRvIHlvdSBuZWVk
IGl0IHRvIHN1cHBvcnQgbmVnYXRpdmUgdmFsdWVzPwpQYXRjaGVzIHdlbGNvbWUhCgo+IFBsdXMs
IEkgaGF2ZW4ndCBmb3VuZCBhbnkgZXhpc3RpbmcgZHJpdmVyIHRoYXQgbWl4ZXMgcGluY29uZi1n
ZW5lcmljIHdpdGgKPiBjdXN0b20gc3RyaW5nIHZhbHVlcy4KCk1heWJlIEkgbWlzdW5kZXJzdGFu
ZCwgYnV0IHBpbmNvbmZfZ2VuZXJpY19wYXJzZV9kdF9jb25maWcoKQpsb29rcyBhdCAgcGN0bGRl
di0+ZGVzYy0+Y3VzdG9tX3BhcmFtcyBhbmQKcGN0bGRldi0+ZGVzYy0+bnVtX2N1c3RvbV9wYXJh
bXMgZm91bmQgaW4Kc3RydWN0IHBpbmN0cmxfZGVzYyBpbgppbmNsdWRlL2xpbnV4L3BpbmN0cmwv
cGluY3RybC5oCgokIGdpdCBncmVwIGN1c3RvbV9wYXJhbXMgZHJpdmVycy9waW5jdHJsLwpnaXZl
cyB5b3UgYSBsaXN0IG9mIGFsbCBkcml2ZXJzIHVzaW5nIHRoaXMuCgpZb3VycywKTGludXMgV2Fs
bGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
