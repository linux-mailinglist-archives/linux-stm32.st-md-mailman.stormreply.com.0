Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D04E3BF670C
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Oct 2025 14:27:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DD80C57B6C;
	Tue, 21 Oct 2025 12:27:04 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9249AC349C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 12:27:02 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-58affa66f2bso6499004e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 05:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761049622; x=1761654422;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRItKHoHeP/Luyk8nQVlzb7QSwUwBxc0c3xCNUrv3pc=;
 b=CDBhIBCM5D6CrlAopgmQdIMC7d3HUj2SzpfM/uFhmguylmO4Pu5aSSx7DtPatx7URQ
 OZeSko0McMoHjnYAmMdxPBc3Mwhzm8A7PZH6lypzlF9eyN388y59iCusb5KpA/oNUScf
 a1APwk7S2+BxMPB9xhxLScPB83SH94wdgFNmMPsTPjENgxnqqjTGOPA8jsQh2Ba3qANX
 m5+rQWZpzi7fR4LphOgnFmmRhORA0X/30hp5jyfmdYM2om0T7i+fepTARRC62lgaLJq1
 3FxcZ0A9ZlUifNx/bOWhhZds2c5iqebxF+RJ/CIrWRS/txAsN+VzjX4i6zeiyHJ74gRc
 Z5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761049622; x=1761654422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dRItKHoHeP/Luyk8nQVlzb7QSwUwBxc0c3xCNUrv3pc=;
 b=fY2nc5zHP321C/3bmdhLmCMJf38Mwl6otv7Umx4r8R5bMVZ//uR+bX47XO9oM2oJsB
 xpYkAL17OKLbg/O4Ucyi7DKDz4kTgf46avUlwduCnoZv/RvqKaOnXutxacSR09OuhVfj
 REEgbI23cxyqmI3Sm58OK9j5DIr/pURkXzcbJ6ner55PAI+2aB5eMXAz/U3d7bu8NSXS
 QrB1vMEQLolfAnad49lss+8AzGXf9jKmwMj38wc+/OFIjhSk3F1M3KwExIb1BHdiB/o6
 y67aehW/WqtSHLIDP4lYBluX47sMypct1wa8Y4DYEo3Mml33DxbS1bY1HoK+VYs3wV1v
 a5sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS6WlVBfM2/yMtKskXg7HRuYt0U3h3Bj2//0rwFcsAp29PvYUo7bF1iN9r9KwvNxyE7A7O7R2sMsaP6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyKO8Wi34yyBaglg8G9VQkPPZJ5aZAIRVq/eGIulLOUaEMX8Md5
 xr5+ckz0tdDlR6Tmq2QRMYICcPXnX7FguALV2+5xgg5XeWhsBxP1gcDKu/6Fqr5Ts2SjsKyzeof
 fPXj50oPWJnncznP9eR12P1dROJMqxM7NEbDJrDPPhg==
X-Gm-Gg: ASbGnctA4k2jI+4Y1KsVB0VrKjs91/31GZbhIeifiqRejHksUxKex5umDlvMbGA4nzJ
 3cV+eUBkSb7ytAk6SsBIqBp586gcT/vy7bMIaLkahpV3ceHZIDoVsvCMPDPz0ts9JhcINWdzen8
 WDMExdfIRa27Np5i6LEDjgFgAlJKPGBS1g3RNjVdjIxpgmUXS2aUpuvA80V4TIqawDf1b+acihH
 l8lDlG6v8nC2GsVhQUZf2HvLur7omgEZHmg8kmPfKUA1yX5pvrZeuXCF4aDm8dYi0DPbuNx/kA/
 zoP2DA==
X-Google-Smtp-Source: AGHT+IGxlVJN2rvaLyj+Brv4icN7nCu4VjMGW+HovXJOGOXiS4L6UUAPV/sCXKFATKrxTJyz9wkyawu1OYIvSs1RR4k=
X-Received: by 2002:a05:6512:ba1:b0:591:c8d7:c03b with SMTP id
 2adb3069b0e04-591d850cf22mr5196408e87.8.1761049621481; Tue, 21 Oct 2025
 05:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-10-antonio.borneo@foss.st.com>
 <20251014-affection-voltage-8b1764273a06@spud>
 <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
 <20251015-headstand-impulse-95aa736e7633@spud>
 <0826a055f6b2e3e6b50a5961e60d1b57d1d596c6.camel@foss.st.com>
 <CACRpkdbeaiNGfOFfVfDNZ=u=4yhCykcdSdHUv-td_DVyr3aWaQ@mail.gmail.com>
 <9dfdf02b7e5a99c515aff3c6528e2d5f70517201.camel@foss.st.com>
In-Reply-To: <9dfdf02b7e5a99c515aff3c6528e2d5f70517201.camel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Oct 2025 14:26:50 +0200
X-Gm-Features: AS18NWCW8_rg5qtH2LgaZCS86vARi5jbxP9hbx6C1qjmUJ3MwBUVy8SVIqQU3O4
Message-ID: <CACRpkdYRUcQLc07o4epJs41BMkweHp+hKr4KQbBeFW1ZNS3RJw@mail.gmail.com>
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

T24gVHVlLCBPY3QgMjEsIDIwMjUgYXQgMTo0OeKAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFRoZSBpc3N1ZSBpcyB0aGF0IHBhcnNlX2R0
X2NmZygpLCBjYWxsZWQgYnkgdGhlIGFib3ZlIG1lbnRpb25lZCBwaW5jb25mX2dlbmVyaWNfcGFy
c2VfZHRfY29uZmlnKCksCj4gb25seSB1c2VzIG9mX3Byb3BlcnR5X3JlYWRfdTMyKCkgdG8gZ2V0
IHRoZSB2YWx1ZSBvZiB0aGUgcHJvcGVydHkuCj4gQ29ub3IncyBwcm9wb3NhbCBmb3IgcmVwbGFj
aW5nIG15Cj4gc3QsaW8tc3luYyA9IDwwPjsKPiB3aXRoCj4gc3QsaW8tc3luYyA9ICJwYXNzLXRo
cm91Z2giOwo+IGRvZXNuJ3QgZml0IGluIQo+Cj4gRm9yIG15IHVzZSBjYXNlIEknbSBnb2luZyB0
byBleHRlbmQgcGFyc2VfZHRfY2ZnKCkgd2l0aCBmd25vZGVfcHJvcGVydHlfbWF0Y2hfcHJvcGVy
dHlfc3RyaW5nKCkgdG8gZXh0cmFjdCB0aGUgaW5kZXggZnJvbSBhbiBhcnJheSBvZiBzdHJpbmdz
Lgo+IFRoZW4gc3VjaCBpbmRleCB3b3VsZCBiZSB1c2VkIGZvciBwaW5jb25mX3RvX2NvbmZpZ19w
YWNrZWQoKS4KPiBEb2VzIHRoaXMgYXBwcm9hY2ggbG9vayByZWFzb25hYmxlPwoKQWhhIEkgc2Vl
IHRoZSBpc3N1ZS4KCkhhcmQgZm9yIG1lIHRvIHRlbGwgaG93IHRoaXMgd2lsbCBwbGF5IG91dCBz
aW5jZSB5b3UgYXJlIHRoZSBmaXJzdCB0byB0cnkgdGhpcywKYnV0IGl0IHNlZW1zIGxpa2UgdGhp
cyBjb3VsZCB3b3JrLgoKTGV0J3Mgc2VlIGhvdyB0aGUgY29kZSBsb29rcyEKCllvdXJzLApMaW51
cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
