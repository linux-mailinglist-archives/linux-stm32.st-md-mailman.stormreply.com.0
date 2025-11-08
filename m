Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 146ABC42CBF
	for <lists+linux-stm32@lfdr.de>; Sat, 08 Nov 2025 13:31:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D192EC5A4C5;
	Sat,  8 Nov 2025 12:31:10 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D337DC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Nov 2025 12:31:08 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-ba599137cf8so997581a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Nov 2025 04:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1762605067; x=1763209867;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=;
 b=kuu2GgM3qo/AfcsI6KFGb8ZbfSyMODYPWVjc+/9FwcGKznrTIbIOHFDvjHCduRtLEb
 D8oOOeUoBldGOywN0YCxmwqVvZY92yKo/7QCpAEhId/B6VlAxV2AlDmpMAJYTT1/1cme
 iLjdoCj4HBIUw9e3okH6ib7nmXYQTzLfT3kmd2oZ0v+Ui+mF9bvlhCTH8C6f5b723/ZN
 EX9E44ZrX8gPWTRDN1DS9J+4XNyk9T0LePhruvz3I14a9QzVMZNYBADs6K6HS51b7hdw
 GgJw8fi3+nlyhdMNbOzQelhukmFB3H25WIAfTwhBdkALEzWcopbkdJ6UbwEEhhqX/Kpp
 3kCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762605067; x=1763209867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=;
 b=q8oYTxWiOmjdCQjtmQeBg5Pb1ThjtuJpnBjcLWgp2HT0XCajiMtgcFcFGNCJ71/WN7
 iNQtJLDiCir9aCJQYSaCyHgykawTKmuG1dfbd+gzTWtTfm33yAxooKoeoxAFFq8671Ps
 locJryebnqcFtOx8t3vYe5ZFrPa9ok8PGJpu0NCUm4zDnpNs/1hAc6K+K6WkW9/BpdVz
 yXuw9Sww4IyVV0ijU0qSnNPvaI9XS9L2yALAgjrAxEHoXibAKojzGUqVcJr9jvsJLK0D
 M43tR9kJxRlf+Oz4bYz1svNmvyQNin3FK82lXRIOl4RzVUUQQNlAZET7eiTXVHb1/zWM
 DYjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQid27m+Uqle6R8QbbQrpWmexppMyYDOaRyT2AP5hdp+mG0hGjp50iQZhOj3gygHC/XIfkCwRs3TqUJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwfbWfeasJFL0Vl/THyCQtRGVTBXGBfXw6cLf/vRmwula+CXM1v
 /zK/+BOOu6PfaABBoeyaQh+e7NeNWGbHDJTbExpH5dDmYe15N5djdg9frGMdaNOLXLRiMsfoiSO
 TXCuvBfojy6mV+uREP0AQVElHSbOs8Ao=
X-Gm-Gg: ASbGnctEjEhza6T0kRfnSM/1pEbRbtDyE5VYXr5VHkFR9EOOPk0FihRfROz4uDBB89I
 cekTZhJOYQBZowl16EX0/T4wRAvkw/djXt9MKLr8CeWZuPT/EZ8U7DWHCtgMp2VhL5SUDpCyU2x
 pJI9Vp1kOc5dp5+9Sl+2yqS234oswNxTTQkZPSbDj9aOYBe654/qy4D9foRiNviseGrdmO+PSxx
 ylrZIASTDIjaI/1V0ZHI2Ew92hTaXQ8nWqVViJEq/L2KhiPp2ZTM645wvQHXcG+hQqOseCpmTgy
 T5DYvpcVwrHxW0U/
X-Google-Smtp-Source: AGHT+IEuHvgMZMmDRNRPAfeOAymHEAn1hYvpEGWDduP2LeVblYn4NjcSRVQL/UdeJaq1Z4u9o2SDmDIZmKAPg0jARQs=
X-Received: by 2002:a17:903:3804:b0:295:5898:ff5c with SMTP id
 d9443c01a7336-297e1e3429emr34741885ad.16.1762605067406; Sat, 08 Nov 2025
 04:31:07 -0800 (PST)
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSB-0000000DkSb-3fWL@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNSB-0000000DkSb-3fWL@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:30:56 +0100
X-Gm-Features: AWmQ_bkQCCCHuH8ylnNhyHhFQTUKFqSEN4LNOb9Me0YP6OYeddbK-4LWE8Q83H4
Message-ID: <CAFBinCDf4rHs-Q1ZVo_WqF1r8_aLJ745B0tG+=6NpmbBOe2c9A@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 08/16] net: stmmac: meson8b: use
	phy_intf_sel directly
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAzOjI54oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBSZWFycmFuZ2UgbWVzb25fYXhn
X3NldF9waHlfbW9kZSgpIHRvIHVzZSBwaHlfaW50Zl9zZWwgZGlyZWN0bHksCj4gY29udmVydGlu
ZyBpdCB0byB0aGUgcmVnaXN0ZXIgZmllbGQgZm9yIG1lc29uOGJfZHdtYWNfbWFza19iaXRzKCku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJt
bGludXgub3JnLnVrPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJs
dW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
