Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D365AC4495
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 23:00:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E49A8C36B11;
	Mon, 26 May 2025 21:00:13 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 504A6C36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 21:00:12 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-52617ceae0dso879413e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748293211; x=1748898011;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/VsZ6IE0jdOkCcZ5aD8yrns3Cyc4PjTDiK26k40UxU=;
 b=jPhPU6KP20QCc4Cfu9DoMtruaMAWH4xTiCIvBc8lipULRQE1R/f9jF4uUanI8zra7d
 muXH+tbDMY1Zx4rrWfS5C5pZiExZsyqsK/gPvQKrZa9cF64Cki/bla6R7qxbeftnN8Uh
 O57TsjlXVwNJ0X2G0pm6+cjuLxwoNZQYPogecEoGqvutkO4G0w1ulefrteXTLhkt0EKZ
 c16kS4cCHY1vzzO/oENQRY7bWTaKH2ys5RsBo2YrRz+ecx4WN01bdZebdYkGedHjl6J0
 wtcIVuPsjA9kcnHw1PqpLoeKAUXx703CEegN58F8cppKvW4rrxh0uK73pjb0Ca7oRBAe
 5aCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748293211; x=1748898011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/VsZ6IE0jdOkCcZ5aD8yrns3Cyc4PjTDiK26k40UxU=;
 b=V4jF17LBKsYDi7VwXC50yKiS/bL3X+/r6KnU+E7KSlRs+ipPTebZeHIrG3HMtRt7aV
 NArt4VmH09KwKsQukMui2YAeWA6bOq2vkleJL+jzFSd/JJNMdynsKam6tcM7kWJsI/0q
 quvhyUQZzE9y+Y31lR6gn4OuFEiJs/3Zqd1IF/dSzM1Med3RhmJZJhhKLcqpSUUIGUUe
 NvXfztoQxzQctZCqleSBt1b3NeTCNQg83GInZtGA5xyEHhGCm6oG6CE5GHl9itRP2Amq
 2iSVoyBVB48SAKlBeB9reinpv696/fzq35IoNbAju7BkPYXz9XSLUpB+2jqWcCRasnvO
 l/bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU9bP5sI1vbPF74TIQFoTvXUBbAy2Os8dH9Z6ISMHUSqbF413sneKpUrurMh5WVdfh4QIVHX+WEaQCyg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxoRMBr9PyS+7FCzGX/vPVRim3VuOXJJVsJxIikytNnzZ19kFbb
 7e+3X9CRHnP7YxxeRSCDZpdBhi9Eg+cUb4614OQNFDbXKx2f/Ml8fvLO2RZ7aVbSiHHr2ghEPqk
 nU+OjSPFipKJq/KdBYWF1OndiJM+S6jc=
X-Gm-Gg: ASbGnctAYNC8AGkDEtJHWl0isIT51qPlSoq0o3y9mPEms7kU40to4vLbc76lln35e6P
 gQfRzBrwqJjojOdb8Vv2Ubvh2Zpck6Pba67pfnK7YeowFs+JuHez2SGWLPFjhSEiAVGJArrtg2W
 AVUNkuEOq3bpxUQx9vOp0Jk2cXjDzCeAUUrA==
X-Google-Smtp-Source: AGHT+IH1F819UdbqKdjXVnrU+7ibb4kb7PWACyBEmwPcni1wlQBFRsB0+/IWFIf8hbs072AoO3ylAlqbgpDxsk8Lh1Y=
X-Received: by 2002:a05:6122:82a5:b0:50a:c70b:9453 with SMTP id
 71dfb90a1353d-52f2c5bf4admr7622487e0c.10.1748293211020; Mon, 26 May 2025
 14:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
 <20250526002924.2567843-2-james.hilliard1@gmail.com>
 <aDQgmJMIkkQ922Bd@shell.armlinux.org.uk>
 <4a2c60a2-03a7-43b8-9f40-ea2b0a3c4154@lunn.ch>
 <CADvTj4qvu+FCP1AzMx6xFsFXVuo=6s0UBCLSt7_ok3War09BNA@mail.gmail.com>
 <a2538232-be98-42ed-ae82-45e2fcff3368@lunn.ch>
In-Reply-To: <a2538232-be98-42ed-ae82-45e2fcff3368@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 14:59:59 -0600
X-Gm-Features: AX0GCFtdyKxOISq6OJd3jmhemPTpifVHzFplXIgoyjcfXkmvrrAzTnbwIsfNJc4
Message-ID: <CADvTj4pCo=d8ehkz6JoPNYEGtUWsgmGCqT7vFEyHTtD7yF5ZAA@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Huacai Chen <chenhuacai@kernel.org>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Yanteng Si <si.yanteng@linux.dev>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 Yinggang Gu <guyinggang@loongson.cn>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow
 runtime AC200/AC300 phy selection
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

T24gTW9uLCBNYXkgMjYsIDIwMjUgYXQgMTo1OOKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiA+IEknbSBjdXJyZW50bHkgZG9pbmcgbW9zdCBvZiB0aGUgUEhZIGlu
aXRpYWxpemF0aW9uIGluIHUtYm9vdCB0byBzaW1wbGlmeSB0ZXN0aW5nCj4gPiBvZiB0aGUgZWZ1
c2UgYmFzZWQgUEhZIHNlbGVjdGlvbiBsb2dpYyBpbiB0aGUga2VybmVsLiBJJ20gc2VuZGluZyB0
aGlzCj4gPiBzZXBhcmF0ZWx5IGFzIGEgbnVtYmVyIG9mIHN1YnNlcXVlbnQgZHJpdmVycyBmb3Ig
a2VybmVsIHNpZGUgUEhZCj4gPiBpbml0aWFsaXphdGlvbiB3aWxsIGJlIGRlcGVuZGVudCB1cG9u
IHNwZWNpZmljIFBIWSdzIGJlaW5nIGRpc2NvdmVyZWQgYXQKPiA+IHJ1bnRpbWUgdmlhIHRoZSBh
YzMwMCBlZnVzZSBiaXQuCj4KPiBEbyB0aGUgZGlmZmVyZW50IFBIWXMgaGF2ZSBkaWZmZXJlbnQg
SUQgdmFsdWVzIGluIHJlZ2lzdGVyIDIgYW5kIDM/CgpXZWxsLi4uZm9yIHRoZSBwcmltYXJ5IHBo
eSBhZGRyZXNzIGluIHRoZSBkZXZpY2UgdHJlZSwgbm86CkFDMzAwKGRvZXMgbm90IGFwcGVhciB0
byBzdXBwb3J0IGFkZHJlc3MgMSB1bmxpa2UgQUMyMDApOgpQSFkgYXQgYWRkcmVzcyAwOgowIC0g
MHgzMTAwCjEgLSAweDc5ZWQKMiAtIDB4NDQKMyAtIDB4MTQwMAoKQUMzMDAgYWRkcmVzcyB1c2Vk
IGZvciBQSFkgaW5pdGlhbGl6YXRpb24gc2VxdWVuY2Ugb24gYWRkcmVzcyAxNigweDEwKSwKYXBw
ZWFycyB0byBiZSB1c2VkIGFzIHJlcGxhY2VtZW50IGZvciBpMmMgaW5pdCBzZXF1ZW5jZSBvbiBB
QzIwMDoKUEhZIGF0IGFkZHJlc3MgMTA6CjAgLSAweDFmODAKMSAtIDB4MTA4NAoyIC0gMHhjMDAw
CjMgLSAweDAKCkFDMjAwOgpQSFkgYXQgYWRkcmVzcyAwOgowIC0gMHgzMDAwCjEgLSAweDc5ZWQK
MiAtIDB4NDQKMyAtIDB4MTQwMAoKQUMyMDA6ClBIWSBhdCBhZGRyZXNzIDE6CjAgLSAweDMwMDAK
MSAtIDB4NzllZAoyIC0gMHg0NAozIC0gMHgxNDAwCgpBQzIwMCBhcHBlYXJzIHRvIHN1cHBvcnQg
ZWl0aGVyIGFkZHJlc3MgMCBvciBhZGRyZXNzIDEuCgo+Cj4gICAgICAgICBBbmRyZXcKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
