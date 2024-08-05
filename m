Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA17947921
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 12:12:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF087C7128F;
	Mon,  5 Aug 2024 10:12:15 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A37ECC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2024 10:12:07 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so158378081fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Aug 2024 03:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722852727; x=1723457527;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aBUI0cv6RKxMVVB/tkuI6YX2BH2X9rEgl2ihEJmJwVE=;
 b=gdalhAhP8tklUGHmQ5jaVJsnJuKzdHAZD7bxfMeRDcAahgpnLhV8hcDHfv0vRBXcpF
 RrBlfvDO8/HUzy0TwDLiC3CzNRTzNmew7cB9QS/OWYxEsO9C1P/oWjb7fEzSFdSScJgT
 U5Y9+APc8+bgi8bd9yHJE2+v6I/8gRf7kzra3J1R2ds0lDba+swXEyvpso2xBEzusA8v
 6KDsEyURQvNHnqAOWMNcBgF1XQP99aJUJ1gRbo7waLEYDstEyZhcvG49HgPQCc+H/vi4
 3Up0OTaIhdwcbMdwzZjAY6xWTWaEPA6o0rt41fmNA3ep8IwWxTusu165Ts7r7S9zacDM
 QuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722852727; x=1723457527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aBUI0cv6RKxMVVB/tkuI6YX2BH2X9rEgl2ihEJmJwVE=;
 b=ZBMud576hC9kVUxsYj5TJPb+PE4OJrlP4gOToshC6Qc/64p5MVsMQywGJLU/N4XCEe
 4blqcNDHO+kWMKqLmNgzLQH/lB7T7UvPB6qxDjkZCfNpJ39fnzk/LLUrS94nEiBrPoZr
 NTv/tn3+zVRgHfnf72Vr0b1lhLXekTaqCCMGA6i1HdKDfyelUkebaLZIQB69rMDGqIGh
 T1I2eZQp7rzTzvda+v1QtHEsQL9oMm2dxWyL/ZOxrok9r0U7BD3ZwUwLI8xt7fnCHTMG
 IFktUdGMY6UjHFU00xi5luvBcobWZL3Km2/ZyXhAyR3o+7qDMyRLeNh7bIE9nx/6iGSK
 sZjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBL4LggvSO/sLNeFMJvQF3HR5N0n4qXcCWgKbWHuSKySQmBgceY5BhmSXgc/hcqI6l4IL3+LEj2gwzvmAk6PQe+NXwrl1Qyk8Ko+x3biw4eIc2Hua4xF1K
X-Gm-Message-State: AOJu0YzQPttHfoZFL+IXc4ePbC1b/tDLsMa3tYnSgoFK5nNcyxHdwVTz
 KKNFij4wb9omVCKAHUZ1oIcAs2jATtSyMJUy2aXH96VEjziskMWI+zFO2piaDDZ8f/tWbiGjLQ9
 FTZhlR8NyJPNOAhmjaGpeN35KvBJKFtzn+6sNgg==
X-Google-Smtp-Source: AGHT+IGy87u/qg4BJ3TC4T8YzxT5D6K9LAVyY2+21hQh275kOvCpifr3EAKkDMIr6mSuV8VqppJGDqylPVAwqGtgTSQ=
X-Received: by 2002:a05:6512:33ce:b0:52e:9d2c:1c56 with SMTP id
 2adb3069b0e04-530bb3b73bemr7403273e87.35.1722852726656; Mon, 05 Aug 2024
 03:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
In-Reply-To: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 Aug 2024 12:11:55 +0200
Message-ID: <CAMRc=Mf2zOyQv=gw6+c=a6U-fJKOaXK9QQ=kukmXKTjXOx8TNg@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC v3 0/14] net: stmmac: convert stmmac
	"pcs" to phylink
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

T24gRnJpLCBBdWcgMiwgMjAyNCBhdCAxMjo0NeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IEhpLAo+Cj4gVGhpcyBpcyB2ZXJzaW9u
IDMgb2YgdGhlIHNlcmllcyBzd2l0Y2hpbmcgc3RtbWFjIHRvIHVzZSBwaHlsaW5rIFBDUwo+IGlz
bnRlYWQgb2YgZ29pbmcgYmVoaW5kIHBoeWxpbmsncyBiYWNrLgo+CgpUZXN0ZWQtYnk6IEJhcnRv
c3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4gIwpzYTg3NzVw
LXJpZGUtcjMKCihUaGUgYm9hcmQgaXMgYSBtb3JlIHJlY2VudCByZXZpc2lvbiBvZiB0aGUgb25l
IEFuZHJldyB0ZXN0ZWQgdGhpcyBzZXJpZXMgb24pCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
