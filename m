Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA5E73A183
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 15:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90C55C65E4F;
	Thu, 22 Jun 2023 13:10:56 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6752AC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 13:10:54 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-47169fc1a40so2157772e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 06:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687439453; x=1690031453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2ExnUNvm4puj2j+jBwDuVgUcMJgNpTHsaeUbPYv1HA=;
 b=yGJPcTf5yJ0LAQHbCs0//5u7zTlviWAP4S4kkO82hHeGqqVnJDo/C15mxkMnjVBse6
 sfzsKQg/tJSVZGfVAk+tv2ZXymwjUI5lj9RIwv2zgWtET1Lze47M1HqsNjk9drvIftQ0
 pVzHirWFhN1bcVZtplp/G3rDRFkBvIk7Ohha7vbGdSWN68j99aBXZCkf8V4jrhPnbTP+
 nhOe8iYPriWxHdLafESB8L8s6g/NsqEs7txzboyYTOG09Qzhiu6TWoV4V1fLyW2wxBud
 pWUKDeA7HjpbY62da6LVs0OiSI+2C/hOb/HcR/1eqFf7XNA9+3dGBuxxi6RAqth1l4dS
 18Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687439453; x=1690031453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P2ExnUNvm4puj2j+jBwDuVgUcMJgNpTHsaeUbPYv1HA=;
 b=BOnBQyHjIQaNwTvSkFd2Eo9mH5gRNO4ZQzHWr+HgpcSp40if+KZAVew+HCBM5xNyvv
 QJzIIATcr6u5cjbaI/rnxAOzuYTogtFMueYWIl+fY1w6GdX3seFTTQ3O1GA7F9M+qUqi
 SnfpVZSez8v52e92OE0RFKkse8DQWR7AskSEWdFknlF/3jQMPTxvzoguZ7w/UqrF+uR/
 HIBbyEPvkk0Ezlvl8xbOaGkT1V7cGsqtCI7nJaup1wXBxlpTbAfJgyv3hBSzkRWeXbfW
 4gmRX+ZgbuSv5G2cnOuitfz/nYcgVt8N5O+DMN90Q6bZM7Esf5Xej92S6XzOl3ReRer9
 e5YQ==
X-Gm-Message-State: AC+VfDw1G48Zu0AHTDK3o4dfBogd+XJYO3bzBbCGTefg4piDT3GrtUcO
 W8jcYP9Popah03k3iR1To6BSJW+NXn/CYiONeXDdmQ==
X-Google-Smtp-Source: ACHHUZ51ts75wkyfRCqdLOdLzUY3leYxdAIzn0un4E/YRo60Xqah11aqcikjs7PUlI+S5vg4oKw+3YC6Mm8RyX4xhqs=
X-Received: by 2002:a1f:e784:0:b0:471:6119:95cc with SMTP id
 e126-20020a1fe784000000b00471611995ccmr7694191vkh.14.1687439453218; Thu, 22
 Jun 2023 06:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230621182558.544417-11-brgl@bgdev.pl>
 <202306220657.ikVUl0zU-lkp@intel.com>
In-Reply-To: <202306220657.ikVUl0zU-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Jun 2023 15:10:42 +0200
Message-ID: <CAMRc=McU+eo3TSFmpR71mak08qJsA19hz8rZo5qk=rMbxoKOzQ@mail.gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, linux-tegra@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, linux-mediatek@lists.infradead.org,
 oe-kbuild-all@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 10/12] net: stmmac: replace the
 int_snapshot_en field with a flag
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

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgMTozMeKAr0FNIGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPiB3cm90ZToKPgo+IEhpIEJhcnRvc3osCj4KPiBrZXJuZWwgdGVzdCByb2JvdCBu
b3RpY2VkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3JzOgo+Cj4gW2F1dG8gYnVpbGQgdGVzdCBF
UlJPUiBvbiBuZXQtbmV4dC9tYWluXQo+Cj4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vaW50
ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL0JhcnRvc3otR29sYXN6ZXdza2kvbmV0LXN0bW1hYy1y
ZXBsYWNlLWhhc19pbnRlZ3JhdGVkX3Bjcy1maWVsZC13aXRoLWEtZmxhZy8yMDIzMDYyMi0wMjI5
NDQKPiBiYXNlOiAgIG5ldC1uZXh0L21haW4KPiBwYXRjaCBsaW5rOiAgICBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjMwNjIxMTgyNTU4LjU0NDQxNy0xMS1icmdsJTQwYmdkZXYucGwKPiBw
YXRjaCBzdWJqZWN0OiBbUEFUQ0ggbmV0LW5leHQgMTAvMTJdIG5ldDogc3RtbWFjOiByZXBsYWNl
IHRoZSBpbnRfc25hcHNob3RfZW4gZmllbGQgd2l0aCBhIGZsYWcKPiBjb25maWc6IGkzODYtcmFu
ZGNvbmZpZy1pMDEyLTIwMjMwNjIxIChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2Fy
Y2hpdmUvMjAyMzA2MjIvMjAyMzA2MjIwNjU3LmlrVlVsMHpVLWxrcEBpbnRlbC5jb20vY29uZmln
KQo+IGNvbXBpbGVyOiBjbGFuZyB2ZXJzaW9uIDE1LjAuNyAoaHR0cHM6Ly9naXRodWIuY29tL2xs
dm0vbGx2bS1wcm9qZWN0LmdpdCA4ZGZkY2M3YjdiZjY2ODM0YTc2MWJkOGRlNDQ1ODQwZWY2OGU0
ZDFhKQo+IHJlcHJvZHVjZTogKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2
ZS8yMDIzMDYyMi8yMDIzMDYyMjA2NTcuaWtWVWwwelUtbGtwQGludGVsLmNvbS9yZXByb2R1Y2Up
Cj4KPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5l
LiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mCj4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwga2lu
ZGx5IGFkZCBmb2xsb3dpbmcgdGFncwo+IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90
IDxsa3BAaW50ZWwuY29tPgo+IHwgQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1r
YnVpbGQtYWxsLzIwMjMwNjIyMDY1Ny5pa1ZVbDB6VS1sa3BAaW50ZWwuY29tLwo+Cj4gQWxsIGVy
cm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOgo+Cj4gPj4gZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW50ZWwuYzo2MTI6MjogZXJyb3I6IHVzZSBvZiB1bmRl
Y2xhcmVkIGlkZW50aWZpZXIgJ3ByaXYnCj4gICAgICAgICAgICBwcml2LT5wbGF0LT5mbGFncyAm
PSB+U1RNTUFDX0ZMQUdfSU5UX1NOQVBTSE9UX0VOOwo+ICAgICAgICAgICAgXgo+ICAgIDEgZXJy
b3IgZ2VuZXJhdGVkLgo+CgpFZWssIG11c3QgaGF2ZSBkaXNhYmxlZCB0aGlzIGRyaXZlciBpbiBt
eSBjb25maWcgYnkgYWNjaWRlbnQuIE5vdyBmaXhlZCBmb3IgdjIuCgpCYXJ0Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
