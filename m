Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A91A0BF67FC
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Oct 2025 14:42:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 325EBC57B6C;
	Tue, 21 Oct 2025 12:42:23 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4369AC06932
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 12:42:22 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-57dfd0b6cd7so6145069e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761050541; x=1761655341;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=icUi6yhGBFPCJDF6YW0uPghHiBtXnlV2bRo9arBdueU=;
 b=tgGbfHcPz0YQvOEsz6q/ckNGQ6MfEb0vysBqk74VqCpIchakiYbJ7h0s6DE0OM1bt0
 7icfj5sWv8769W+WLzk/TzzVvqWT6pVjPWvKnz9Avufh1Ux18bwxFeIkkq+sVQ+H9cmz
 K2NsmhyDYKIIpz0i6MNmmpwb+LY783PoqC4VNCCLrL+qroIsk9TC6t8xyuwe5HhIRY0Z
 yV/byfRvmX1nCMX2PeeVpDNub61ZAySraQvAFlhXV3ZT+bwNXjr6s4ce2HkiuDrwj+kb
 izz0ryMuuJ/jVWGKVsbPsVP42IF0y1EAohmBfdn+11RGhpO2SwXopAUj5QUTSfHXit2H
 c4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761050541; x=1761655341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=icUi6yhGBFPCJDF6YW0uPghHiBtXnlV2bRo9arBdueU=;
 b=d9+EzSXovv/q4CI4eC5QsoY0uP3wmSa1N5T8jmfrJaAU0IHoGPH+EPPMDGlViGi/5t
 5d8uoF6slzRVA+T5x0L3LpLliHtUgMR7OBzfWqfAPyHc6VJJCzMGWd5gjGufdumtSEUb
 PeJMpP9u8/kV7gmXQwOZtDHdM3RQEMLs0Buei/JDUCAxIalmm+M3jS7m3M6FfChP7rB6
 hZeuPAR0tyCD4XtetGyBRh/0VYbuaIDwHiQj0QAUv++dUmheot0HDoBwJr6WUMXnI4wl
 y3wluXRTHq8GH9Rq0eAiG3NBIE5mqmhUybjd5WYtOOVlecQerWXmlQu3m4UZ8B/oYrL8
 WQQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2TdEvB4gb5kfaV37mAfBxKRxr1PsHKBKTGEN0qB4xlE9Q1aL83NjAtGq8ZkT0+w8Ny/3I+i9vHPk4QA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxKy2Ue+x4Hol3HPLcp2bc1sKs6v+gsC9vyJtXOgXwF51970CiL
 g7WjzuZ/gV1vb3tNmNQDcAaXW51Xq8zHO+6Ud4cS8elOCNL47yJV+u0aGLN4No7S515niZBblnz
 V9P6ofDyvuwhnnnnm9pFmDS7mcm1wfCELfmVnbohw2A==
X-Gm-Gg: ASbGncsOqyzMmymr0n7wfIJXbkm9cZhd+dpLc77Plwzk4VQfnh1zLKLRGIPQNl2oQi3
 3wcFz+GFpi8Cxc6evtZEjcWGCmNWHEGSTTOzJp0ojHZZR1se+w0MPS3MYD50KYFP/Jg6Yo1KtYM
 azcAkUtP26KuLEYkbMB9aUuzQdugb2GD+Cd/8U/qx90lau5MoEEnPv2DwAueFvGLCyl5TASd8o/
 xmKSMZmmrExeBVSCVJdCNidYtRxxIljl6pi6fO0jxypz1bu57WKNirwpu86SVYxApOR3NhPcTQ4
 b1TDhbqbkkUZxVq4
X-Google-Smtp-Source: AGHT+IFGDPpBTeZONomFBAX1YzaiEBTSDtfpfJUCvTHtBOgU4ya2tYe3GNuR1bPQdzr+C4NaB2OPAwZEOmn27L5nTu8=
X-Received: by 2002:a05:6512:b1e:b0:58a:92cc:5819 with SMTP id
 2adb3069b0e04-591d853543dmr5476524e87.36.1761050541329; Tue, 21 Oct 2025
 05:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <E1v9Tqf-0000000ApJd-3dxC@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1v9Tqf-0000000ApJd-3dxC@rmk-PC.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 14:42:09 +0200
X-Gm-Features: AS18NWCRXicscJ1flw2qh-h28tM6CuC6Xw1MuRCeg5_mvREPDMfXTaEvmtfWRbw
Message-ID: <CAMRc=MccHEaXs6KJfG_ph=wG5TS4UTpG4Rzj25C4qbC_fCS21A@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: replace
	has_xxxx with core_type
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

T24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgOTo0MeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gUmVwbGFjZSB0aGUgaGFzX2dt
YWMsIGhhc19nbWFjNCBhbmQgaGFzX3hnbWFjIGludHMsIG9mIHdoaWNoIG9ubHkgb25lCj4gY2Fu
IGJlIHNldCB3aGVuIG1hdGNoaW5nIGEgY29yZSB0byBpdHMgZHJpdmVyIGJhY2tlbmQsIHdpdGgg
YW4KPiBlbnVtZXJhdGVkIHR5cGUgY2FycnlpbmcgdGhlIERXTUFDIGNvcmUgdHlwZS4KPgo+IFNp
Z25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tlcm5lbEBhcm1saW51eC5v
cmcudWs+Cj4gLS0tCj4gQWZ0ZXIgdGhlIGZpdmUgcGF0Y2ggY2xlYW51cCBoYXMgYmVlbiBtZXJn
ZWQsIEkgd2lsbCB3YW50IHRvIHN1Ym1pdAo+IHRoaXMgZm9yIG1lcmdpbmcuCj4KPiBUaGUgcHJv
YmxlbToKPiAtIEFueSBuZXcgc3RtbWFjIGdsdWUgY29kZSBpcyBsaWtlbHkgdG8gY29uZmxpY3Qg
d2l0aCB0aGlzLgo+IC0gQmFydG9zeiBHb2xhc3pld3NraSdzIHFjb20tZXRocW9zIHBhdGNoZXMg
cG9zdGVkIG9uIDh0aCBPY3RvYmVyCj4gICB3aWxsIGNvbmZsaWN0IHdpdGggdGhpcyBpZiByZXN1
Ym1pdHRlZCAod2UncmUgY2hhbmdpbmcgbGluZXMgdGhhdAo+ICAgb3ZlcmxhcCBpbiBkaWZmIGNv
bnRleHQuKQo+IC0gTWF4aW1lIENoZXZhbGxpZXIncyB0aWVtc3RhbXBpbmcgY2hhbmdlcyB3aWxs
IGNvbmZsaWN0IHdpdGggdGhpcy4KPgoKUmV2aWV3ZWQtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kg
PGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
