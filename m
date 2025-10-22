Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 206FFBFBD2E
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 14:22:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 115E1C57B6F;
	Wed, 22 Oct 2025 12:22:26 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95769C46D55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 12:22:24 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-58affa66f2bso8036302e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761135744; x=1761740544;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
 b=KwaA8jmBQLK+Mod02sYatAOAlP7NUbi4Q/wN3dPua9Huw3LIXQ/ydCQRdInAEBtWHq
 nXJF7bJoorrgiwv48/eBlwUbqGvHOm5HhDeEA5IDpvijSaOT+tkORcmwm/hYIBZkEfUo
 0lX+f5IA415/AiKnJASMfU5bTvUkSNj/MU4RXvdrlXVcSdOGSex4j/QWoQvIz13MdbEj
 IHMMmeRMgUwjbKWXexbSDwV637oxkIs9/KSEl+XTTxq2CUmfNiXo2r47qXawrCsaXYQE
 gTfsxD97BMu6nK32KFRZSu1AylIFV92uFRRi+uBQN08FyS4YlCU1VlmY2jTb5/i+Kv0Q
 Jbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761135744; x=1761740544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
 b=eyUTwaFp5c4Z2KaC9MYwYqTG5WIe1dPbRizXZ1wMCOJcsCODKsQfCdqFStifX3WM/e
 PFH6ybF87AFw+vylpuOmAgkX786VC8yzZa9WyB3A9WU3MR9QlhVgO+crrFDFecUWXQVJ
 KKLNsVP9yPx3jVGCxFLdgqL1BnXpwkI5A4SgJh50iRoIW8Hjr1dowGPKwJWZ7+Th3URr
 Zze+0VJmLsXHYx9EQfd9jagHEnl9GusoNT7EykFTL5k3Lij7uZQLR/aKgcwRo1ff3Wg6
 OFDhd1AChqHfrfKC/6HrdA/pjr9OHwlkmTVGAoYO4+7O6JFTpaC++xzJzm/2K+RXjsvV
 E76Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVws3DNf62HsEMTChfVOQsfFuOlhu2dIilZot+e4iyrQX8+VtM+uUFNFODE2LXnByv4wgiAX9HhKnrbrg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywl5QDViOJmhK93J3KzAZPYUKiADiItkc4ghe+FnzxC4MH/LmUN
 6p22NYWfeqwXlCzyZMsJXOxYyLrso4hXrCsTteHgJb/MYMnZ6oAt+n2LggIKBmZBqQE0/OeFJRt
 N53C1BiAvrlZUw25crsZUFr0e0rkO4VPmbucj2weNhQ==
X-Gm-Gg: ASbGnctw3VoHm7GQkvB/IvsyYT+x9ZYe958RZJtsu/lucIKG2pASkzHqAr+Sv0Ky+XD
 f0aoSGPcA5ZwVEK8EoU7Lx1S6s6xYbJqx/s3ho62Zg/2oEyR2A1xEgIIAxx8xkQloygknzro9Dt
 v9fxVDqKogln1VootVaj7EY7CP8zQ+aFUYw92SkVTcqI0NJWumz7mlQVXk8uqSA4VEmwpn++Skg
 Tdio7n+IJB6851C7w77Gb7Hm5bMjkl6os62ss5Gwcb8iY7XKebqiifK+noy2oc1qTGyRiZSO7dJ
 anqLJfhiKeKli6ym
X-Google-Smtp-Source: AGHT+IHopjIXv8jRnOM7SdbKGejL8HmLCEbi6BqZ/fl5zn8nC+umc/NX29TWVW5P2ry8JnLwjKerkQkMpRF8tHTR1Sg=
X-Received: by 2002:a05:6512:6c6:b0:591:c473:5bc7 with SMTP id
 2adb3069b0e04-591d858f85emr7186831e87.50.1761135743550; Wed, 22 Oct 2025
 05:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 14:22:12 +0200
X-Gm-Features: AS18NWDxwRikRa37d3sfSPIurHFNsUg5soxDVQrWVC_wnbUDqwvc55kIMFCSQNk
Message-ID: <CAMRc=MdWFL_+RJXPUNLd0BTyxbt9x8jztf5SDViPQCkxSqoHdg@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, s32@nxp.com,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: replace has_xxxx
	with core_type
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

T24gVHVlLCBPY3QgMjEsIDIwMjUgYXQgOToyN+KAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gUmVwbGFjZSB0aGUgaGFzX2dt
YWMsIGhhc19nbWFjNCBhbmQgaGFzX3hnbWFjIGludHMsIG9mIHdoaWNoIG9ubHkgb25lCj4gY2Fu
IGJlIHNldCB3aGVuIG1hdGNoaW5nIGEgY29yZSB0byBpdHMgZHJpdmVyIGJhY2tlbmQsIHdpdGgg
YW4KPiBlbnVtZXJhdGVkIHR5cGUgY2FycnlpbmcgdGhlIERXTUFDIGNvcmUgdHlwZS4KPgo+IFRl
c3RlZC1ieTogTWF4aW1lIENoZXZhbGxpZXIgPG1heGltZS5jaGV2YWxsaWVyQGJvb3RsaW4uY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tlcm5lbEBhcm1s
aW51eC5vcmcudWs+Cj4gLS0tCgpSZXZpZXdlZC1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFy
dG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
