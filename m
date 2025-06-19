Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BA0ADFD71
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jun 2025 08:02:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96BA5C36B29;
	Thu, 19 Jun 2025 06:02:28 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC0C3C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 05:46:54 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-553644b8f56so315379e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 22:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750312014; x=1750916814;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyTZhZosQlK8zc2CRYvq23U6H5QZQEEq+/ASYL+tvJM=;
 b=O6suWMgPayOiJEahK+fyNNf7sstCqWCX1X4cxSJLpGickBZnNBVjZXoiaEGeZtq3nY
 liE3ElWz9mfw+rHJviPlERWMKXQ2XgBID7RQMIQjdltPj8a0Cj4tZ+134Fo9zZoD16Dq
 TbcncHmFdPapLYJbg0udf3fRFvQXC0v+rjkgZYfV8NuqFNFqHdXY+D1lhO1lgVFlEfT/
 0I9cSZS6wKcwpwqYaQVUwrLiSx7UH4sLlDOZFH4/L8F8mMFESNm4NmRS3lE/us1D8nIV
 2WX4ADr8+YNVGh157V4fl+HF5eerwlOWJXANxkC5X3lid6kLFuVcACnT3FHxsyKsxzCc
 y0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750312014; x=1750916814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nyTZhZosQlK8zc2CRYvq23U6H5QZQEEq+/ASYL+tvJM=;
 b=vRadpvJ/op6TFT5Hwkdz5Pvw1yC+BedySayur76kBg2xpeaNMBTNwjlhdKarWxFzpJ
 iT/99deopYUUCwj3M22JE+SQkkdzw+EQKIpxCLrlEsNgj9YrE4leEcCQYkH0hg0ydh+Z
 7WMJPyoXu2yv+c+KdLYgVlNTn/1TFztheKIFx5j2JqmvQ0METUg8wBu027X1Rc3FwrjF
 UC77VfxNn/hdnAfNvn98sxPlaTgmR3gSAupzAxhSEx4Oy7eDFWVlVD2R8Qr1Mk1EDCr1
 Fr0HT2JErp1C1COPmyhPZJgp+TL0Uvx5x1TIZVZlyxB+uISKr9miVb4zP7Tjmv2A7KTS
 +bUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXePzRyDiLzP07RkI4wwiTpi6Hw8G/F91zKVmTWClhl6s/cA3wRtQ4ppPapKEAGOTWWyw7VX3JoSyx3Xw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx3oDGaE/4n1NTLJJDa/QdfsSmiOf+c4a7z6weuSSZKEOzPTnqv
 ZWIx9L+d6a5P1gNiVYMKXEJrienNkXP+xn38q18UddxovalhDBi91bGaPC+cUR63SNpD9iRoJUp
 AjG1xJWa82HCHQ6r8Fx1UIfgUyX/tQtw=
X-Gm-Gg: ASbGncsGTtbk6ZChuxK5r7ojCxEQS2Vhx02ufXpH0eVY4alRz1k1+1GnTUf0qcoKcML
 /1E98DjeomRV47mfAEzXQXBmizWCQ1UhDtutRDfwQt05hIELm5w+0QL4+MtwYB55Wm4qFKdTPLQ
 +avxKzZRk7VgNF9VgrW3FfDdC9iT/39hYm6ofKC5tHEKXA
X-Google-Smtp-Source: AGHT+IE1xPGt5ROVV8f70S5heb5S4gN/anI8tPUvJGRuJeXPD/dBLegDhxqjDN+fi/v7qlQqJzYLlHExWELH2KyeXss=
X-Received: by 2002:a05:6512:2114:b0:553:cf7d:7283 with SMTP id
 2adb3069b0e04-553cf7d7475mr2149020e87.33.1750312013519; Wed, 18 Jun 2025
 22:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
 <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
 <20250618183333.GW1699@horms.kernel.org>
In-Reply-To: <20250618183333.GW1699@horms.kernel.org>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 19 Jun 2025 13:46:16 +0800
X-Gm-Features: Ac12FXz2MfdvF8WEisDdVYaJh-GTBO0QM7RElK1s-X1101O0wUuzCnLffKUuZmw
Message-ID: <CAJhJPsV2moLRZji4pPxLoV6=GSdVsfXPDt6rkhKHqO-eC-X79Q@mail.gmail.com>
To: Simon Horman <horms@kernel.org>
X-Mailman-Approved-At: Thu, 19 Jun 2025 06:02:27 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mips@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: loongson1:
	provide match data struct
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

T24gVGh1LCBKdW4gMTksIDIwMjUgYXQgMjozM+KAr0FNIFNpbW9uIEhvcm1hbiA8aG9ybXNAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxOCwgMjAyNSBhdCAxMTo0MTowOUFNICsw
MTAwLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6Cj4gPiBQcm92aWRlIGEgc3RydWN0dXJl
IGZvciBtYXRjaCBkYXRhIHJhdGhlciB0aGFuIHVzaW5nIHRoZSBmdW5jdGlvbgo+ID4gcG9pbnRl
ciBhcyBtYXRjaCBkYXRhLiBUaGlzIGFsbG93cyBzdHJvbmdlciB0eXBlLWNoZWNraW5nIGZvciB0
aGUKPiA+IGZ1bmN0aW9uIGl0c2VsZiwgYW5kIGFsbG93cyBleHRlbnNpb25zIHRvIHRoZSBtYXRj
aCBkYXRhLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1r
K2tlcm5lbEBhcm1saW51eC5vcmcudWs+Cj4KPiBSZXZpZXdlZC1ieTogU2ltb24gSG9ybWFuIDxo
b3Jtc0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IEtlZ3VhbmcgWmhhbmcgPGtlZ3Vhbmcuemhh
bmdAZ21haWwuY29tPgpUZXN0ZWQtYnk6IEtlZ3VhbmcgWmhhbmcgPGtlZ3VhbmcuemhhbmdAZ21h
aWwuY29tPiAjIG9uIExTMUIgJiBMUzFDCgotLSAKQmVzdCByZWdhcmRzLAoKS2VndWFuZyBaaGFu
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
