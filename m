Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2DDA5F616
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 14:38:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB265C78F83;
	Thu, 13 Mar 2025 13:38:41 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA700C78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 13:38:40 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-5240317b3e0so364093e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741873119; x=1742477919;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sIpqoek4eGSOylKbMTSFOVbyM/qGLYGplSwODZFoBwg=;
 b=DaoBsGkhd0SCJ6brqJdYnqylvJIgOh2CMi7tqZn1xL5/ea9OJ6hz/RIHzvgm8vAA9E
 Do7+zgsYa5BwCylEJ2nZY3uAaoE1rMVRlNfDl1jHGshdMSdiHWMfnWXbPhR0a1O1t5Il
 28MLdkUmeXVRId4Hin8sX7mFD0htNrkZACGGoaPDzjEVacKS/CT6Zv57ELjLwFvtyabs
 SGimhPcmqge7nBcc+b113J55iPDlPZxvE3ReWNsMG7tzBlrdl/lZtwbcQaj4qdM5mfii
 27fUOX2nezU9e2jOTbgGGaEmTHunNNnjj7b0/aIciXNN7Myz/jFiICMaJeiVtTkZIotI
 Ve9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741873119; x=1742477919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sIpqoek4eGSOylKbMTSFOVbyM/qGLYGplSwODZFoBwg=;
 b=tAypf7Zwo3Io4Oih90cYue4T1AY7m2dZJS9uNWrtXRiwzRIouYefO+oiMaJnpX00aI
 Uuyn6PKPMa8jAWz8vqqfofOl4L/g6EVsNUtMuQG7T11q/XvqWEYHtE4belI24TJLvDVs
 yEZ6Q2AeEtE6qH2f1bzi22Nn74FllwhLQIwS3t7S6n+azMFHhtD4CawHSbw3oizG/EUa
 8P/1hQ+IKM0FXZDb5hN8aiUSmKTjqtnN+YWrPx0e70v4Ng2SU9Dcc0qJ0zuEhv59wFjt
 8UUhNpjq6ksSruxZ8rDAVidMfwc/1N2M9afnjzW97dM9QGY6hKKbvCvDqBjubz/RxRe0
 rk0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl6EKTFKS4h846pUxcwTuQqY9uCslys5acIBqJHs/jBh8RlC9Enky9jRdthSJ+Jj/nExhFRFSqnR2WIQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzpTSF7sSizbgCr8DsHI2axiv9bafanC1TthffMXej9Jbx2ctH5
 XetOL4s2yriK6DTArthA5lCE27uWBtiogYkmC2mAbB/O0NQiuakoCD4zn+7CE+iwQxhNqUVviaj
 PSp7y8jB3SlH0yIdQpLtYHvJrXQM=
X-Gm-Gg: ASbGnct/F0YH5R3yNSk1lO27XOFuYejwFTwaLgNMBzok3+YElS9slvbv8YNo7fj+cG5
 4AlAOWVTCEdpuort/n2Ze52XIE4BqvXiWyDMe3Hogr6D/hU4ZoLNkWUq5B3hgvfclU1WJpgRRO2
 nKEGMkjv6SBeEirZ+paeCjP9082dEpcZhSTMluVF81U4kn0Oo6GVaZz43Nbj0=
X-Google-Smtp-Source: AGHT+IEcryLwmYP3TdsvEC/+UeCHlR3N+sWjCLCU1sbSkHGz1fjASLBhtHx+j6tuN07I1St0YxBKUyaqA22JoKt2WYU=
X-Received: by 2002:a05:6122:1d9f:b0:516:230b:eec with SMTP id
 71dfb90a1353d-523e4076cf3mr19762024e0c.5.1741873119552; Thu, 13 Mar 2025
 06:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
 <E1tsIUK-005vGk-H7@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tsIUK-005vGk-H7@rmk-PC.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Mar 2025 13:38:12 +0000
X-Gm-Features: AQ5f1JqlA8hzG437O530Oq2Xdo4TAVMjVgaona5iqv0GCiHktSEod7myZxpXhN4
Message-ID: <CA+V-a8sasAGkwCWGnbBEjeMRVM79xVVzTq15uJQ_7Q+YwB1QpA@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 7/7] net: stmmac: deprecate
 "snps, en-tx-lpi-clockgating" property
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

T24gV2VkLCBNYXIgMTIsIDIwMjUgYXQgOTo1OOKAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gV2hldGhlciB0aGUgTUlJIHRy
YW5zbWl0IGNsb2NrIGNhbiBiZSBzdG9wcGVkIGlzIHByaW1hcmlseSBhIHByb3BlcnR5Cj4gb2Yg
dGhlIFBIWSAodGhlcmUgaXMgYSBjYXBhYmlsaXR5IGJpdCB0aGF0IHNob3VsZCBiZSBjaGVja2Vk
IGZpcnN0LikKPiBXaGV0aGVyIHRoZSBNQUMgaXMgY2FwYWJsZSBvZiBzdG9wcGluZyB0aGUgdHJh
bnNtaXQgY2xvY2sgaXMgYSBzZXBhcmF0ZQo+IGlzc3VlLCBidXQgdGhpcyBpcyBhbHJlYWR5IGhh
bmRsZWQgYnkgdGhlIGNvcmUgRGVzaWduV2FyZSBNQUMgY29kZS4KPgo+IFRoZXJlZm9yZSwgc25w
cyxlbi10eC1scGktY2xvY2tnYXRpbmcgaXMgdGVjaG5pY2FsbHkgaW5jb3JyZWN0LCBhbmQKPiB0
aGlzIGNvbW1pdCBhZGRzIGEgd2FybmluZyBzaG91bGQgYSBEVCBiZSBlbmNvdW50ZXJlZCB3aXRo
IHRoZSBwcm9wZXJ0eQo+IHByZXNlbnQuCj4KPiBIb3dldmVyLCB3ZSBrZWVwIGJhY2t3YXJkcyBj
b21wYXRpYmlsaXR5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvc3RtbWFjX3BsYXRmb3JtLmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgpSZXZpZXdlZC1ieTogTGFkIFBy
YWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoKQ2hlZXJz
LApQcmFiaGFrYXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
