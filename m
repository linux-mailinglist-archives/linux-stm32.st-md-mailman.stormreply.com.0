Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29650C42CB6
	for <lists+linux-stm32@lfdr.de>; Sat, 08 Nov 2025 13:30:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAC6FC5A4C5;
	Sat,  8 Nov 2025 12:30:55 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7069BC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Nov 2025 12:30:54 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-297e239baecso5067425ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Nov 2025 04:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1762605053; x=1763209853;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=;
 b=PCs9Y27KOiFOkSUT4rxWwkNGLWmLGMz4KovVePouxXcmMV6cZGDxdy2DSjcYySjbyQ
 +Svv6+/qJFRVLYF7hkN4JOCGEkukZWd7id/SmH2y1EKhxfXcTksVHoVBbdPJmA+xJa+J
 F2R+bKXExhcTMfba2cWce8kECERw5BrQG2CeJF5MKDayUpEZULgb2ErJBcZ7NM3dYgLw
 z8EnJOiXkDwST4P4tK7SNBwhR4O02AgtseTSm4liC7kBnp39emo3govVFq1HyibMrxY/
 vQ2EhhcrDHtY1hMppHOMiFapaX2pEmyG4btBB3hc3rHxC2ZI5UN4mw509yotHz5nUi3Z
 q2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762605053; x=1763209853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=;
 b=OoZxOB6zKWMtpym2jrpan0RLa+S5s8RmX/jtzrtuLlQNXsjA0AAP0DyGijnXgAj15a
 VsCs2ej5ik3BokyNGDGuA7RA8gtfYxl6XfeeZqEINdsh5+yZHGos890o21RAowgwXfgP
 CPPOyKbAg0JPl4gdzU+tipnxVnJuPFVscLr3N5QM+zMuE7D50U3146a6FD8oroFG9z+P
 kY8TuPjjkny1m7OqI6xX4fSI27Gz+TjSNsOVHiVH4/XeR9f01BNYLn7Uyc7cH4BKn/Gz
 ucZ9+Gl3UOwo0tF/kDXMWeoeny4HL72KYshcLFO13q4uB47FkJhezuUhkpK6kMZQnWgl
 4kig==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5QuZm8xy3YvZ0K4p4nvYP7Zt655TFTz+X7OYGQboPvV+tP3NfXcdtrrSED0nQd3JV+jbf5OCQOVqukg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YypWG0ss46utpHxjUrGeNNcuYc189TuwvZwpPypim25R7DPvKMb
 BXFUZV+NaDQiRPv3IfbjvGbkPJZXpXENO02zJN8LuZkgUeAVhV1n3T63MiPmnNYY2aaTReOG02l
 yjILRx9kedgMj+uLekCRkRYSpY2iCk7A=
X-Gm-Gg: ASbGnctKY393eEMqMK+/Yw7RVbtJ4u7+aS6cqLRWoaGd9nhsUPRHKpagl+qtu9XWmDn
 sVCTkzD9R2jdmL8eUns7OXjvjYpstjaW4L3QJbaj0uLduTn71ffUM3NpQgDdmW984a+29PmNMiF
 DmRfWVSNBdY0ol+iYKVrKt3pc1F9tLpDoMP6+nvN2onlsTrEgzk36PFZEsXGZPeIbUd9P7+3y6/
 zn1y9Z9yn7QK+LBSXwM1U0UBUyJTXnUiSuMhxmGVa/KcBpQwHSRXWQECWhk0cgiAxv4+hLXwg/u
 rliCNpjt0COP+cTR4iRZhnEQbBs=
X-Google-Smtp-Source: AGHT+IFggAiteVIarAA4yH7nX7bpSEtb/3RAGcM3xV3yeTnEsgYxWgJ+blB80el3RONC2EPUTf3q2DoKMIlCAJuDAHE=
X-Received: by 2002:a17:903:1a2e:b0:295:5da6:5ff7 with SMTP id
 d9443c01a7336-297e1e3409cmr35315945ad.15.1762605052702; Sat, 08 Nov 2025
 04:30:52 -0800 (PST)
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNS6-0000000DkSV-39Ff@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNS6-0000000DkSV-39Ff@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:30:41 +0100
X-Gm-Features: AWmQ_bmyclexD2i-9GELP91SUMtxA9fKus1hhuyJQbz-Kh7t3dy3c6LqsK6hIg8
Message-ID: <CAFBinCDf5jMMFbkRCj7jWOSB__jBpQN5FWZhKAgdoELeKwW+Ow@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next 07/16] net: stmmac: meson8b: use
	PHY_INTF_SEL_xxx
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAzOjI44oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSdXNz
ZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgpSZXZpZXdlZC1i
eTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNv
bT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
