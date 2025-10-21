Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5EABF5061
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Oct 2025 09:43:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACBA3C57186;
	Tue, 21 Oct 2025 07:43:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8420BC57184
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 07:43:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 27B5C4929E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 07:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EFAC19421
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 07:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761032626;
 bh=L3OSHu/zykUUrMf0jhQiVo+5X5Tp4yjmsTRArUNbg40=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=nuhjVe7dewQwiCcKzJosmLlrhCng/YZTQCU888Cw1JRGstMFQKq1pbud2Z8PIRkc9
 EL4ZiMTVQYItN2lOof0KUvZZ31mV8AJaD79wJAm7T6tlf1UMsiLQwhyZxD2MlFEqre
 /KQUWp71efacnNSB5bOVbi12pFYCcECOH9GuOJNF8C0PtAG9fZ6VWIuHGxpF2DaPzU
 poxS+KXXVMrc9lfatxufE8h9v1S3j+YDO2kfnWMICIVyKeCAjglWR2P9p6ow2sler5
 tOxZrlqn5eUjnCQ2qu06YvN39P83knb1R4AqEVKTZIxh0e7QWamVASXkckmlrRCqZo
 BFfWu0KvZIh1A==
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-36639c30bb7so47099061fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 00:43:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWOwhqVfNXmw7U2IQaM0VJQrWqBFkkEOJmNaqNYWEmMv306tBh6YjI3ObS4kX4sCu+zqZQygWAnAtgl/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzTiQsRqKv6MhX0rxnTHPn6zNPhfySBR3J7o7VvuVvvpaVL82BB
 1cCiooLGlK8jV2Wq6tR+zXpnFSBGVxg+YjbhpiX3/uCY5o2wyxNZ4E1B2vN8PtXZrtDkdK6SKQE
 PRbdqmhMfimyRl+D9xBIYCnEZzTsepf4=
X-Google-Smtp-Source: AGHT+IGdlueTEgM73EYjdJJ7MYdcpYR/rotWSKlN7mFY5uUlnnqxOjkAfgQUxRhc1E7On08N06u+r1J6has1Jnhp3yI=
X-Received: by 2002:a2e:9fcb:0:b0:375:ebfa:2986 with SMTP id
 38308e7fff4ca-37797a728f1mr44182921fa.34.1761032624223; Tue, 21 Oct 2025
 00:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 21 Oct 2025 15:43:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v67U1KUeEvQ8yhSHP5NY1-9hGuwuTwgKMWGJB2LZn5pwqw@mail.gmail.com>
X-Gm-Features: AS18NWBVywV_yRWAV-n1YGVmZIEA5XvU8OAR8wbCjrwgr8Xivfn8oNIG-rClQ6c
Message-ID: <CAGb2v67U1KUeEvQ8yhSHP5NY1-9hGuwuTwgKMWGJB2LZn5pwqw@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, s32@nxp.com,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVHVlLCBPY3QgMjEsIDIwMjUgYXQgMzoyN+KAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gUmVwbGFjZSB0aGUgaGFzX2dt
YWMsIGhhc19nbWFjNCBhbmQgaGFzX3hnbWFjIGludHMsIG9mIHdoaWNoIG9ubHkgb25lCj4gY2Fu
IGJlIHNldCB3aGVuIG1hdGNoaW5nIGEgY29yZSB0byBpdHMgZHJpdmVyIGJhY2tlbmQsIHdpdGgg
YW4KPiBlbnVtZXJhdGVkIHR5cGUgY2FycnlpbmcgdGhlIERXTUFDIGNvcmUgdHlwZS4KPgo+IFRl
c3RlZC1ieTogTWF4aW1lIENoZXZhbGxpZXIgPG1heGltZS5jaGV2YWxsaWVyQGJvb3RsaW4uY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tlcm5lbEBhcm1s
aW51eC5vcmcudWs+Cj4gLS0tCj4gdjI6Cj4gLSBmaXggY29uZmxpY3Qgd2l0aCByZW1vdmFsIHdp
dGggU1RNTUFDX0ZMQUdfSEFTX0lOVEVHUkFURURfUENTIHJlbW92YWwKPiAtIHdyYXAgODggY2hh
ciBsaW5lIGluIHN0bW1hY194bWl0KCkKPiAtIGFkZCBNYXhpbWUncyB0ZXN0ZWQtYnkKPgo+IEkg
aGF2ZW4ndCBhZGRlZCBNYXhpbWUncyByLWIgYmVjYXVzZSB0aGUgcGF0Y2ggaGFzIGNoYW5nZWQg
c3VidGx5LCBidXQKPiBub3QgaW4gYSB3YXkgdGhhdCBpbnZhbGlkYXRlcyB0ZXN0aW5nLiBHaXZl
biB0aGUgbWlub3IgY2hhbmdlcyBhbmQgaXQncwo+IHBvc3NpYmlsaXRpZXMgZm9yIGZ1cnRoZXIg
Y29uZmxpY3RzLCBjYW4gd2UgZ2V0IHRoaXMgaW4gc29vbmVyIHBsZWFzZT8KPiBUaGFua3MuCj4K
PiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvY29tbW9uLmggIHwgIDUgKysK
PiAgLi4uL3N0bWljcm8vc3RtbWFjL2R3bWFjLWR3Yy1xb3MtZXRoLmMgICAgICAgIHwgIDIgKy0K
PiAgLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1pbnRlbC5jIHwgIDUgKy0K
PiAgLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWlwcTgwNnguYyAgIHwgIDIgKy0K
PiAgLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMgIHwgIDIgKy0K
PiAgLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxwYzE4eHguYyAgIHwgIDIgKy0K
PiAgLi4uL3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMgICAgICAgIHwgIDIgKy0K
PiAgLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jICAgIHwgIDQgKy0K
PiAgLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zMzIuYyAgIHwgIDIgKy0K
PiAgLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXNvY2ZwZ2EuYyAgIHwgIDIgKy0K
PiAgLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW54aS5jIHwgIDIgKy0K
CkZvciBzdW54aSwKCkFja2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAa2VybmVsLm9yZz4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
