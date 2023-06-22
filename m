Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 661F873A121
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 14:45:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AF54C65E4F;
	Thu, 22 Jun 2023 12:45:32 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F244FC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 12:45:29 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-471b1ba1a7dso1891522e0c.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 05:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687437929; x=1690029929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0IAa9QbAg6mMlY1K9iZzo0KBKDVgETeE7PvH1uKY77A=;
 b=ncXLWJal2QgP96Sk787g47rL08o41YhaHQkUsKss+1kCC6ddUpEN3L55GGmCxBJq7F
 jhLgPPCkkFrxAovoz0yCGZOurSHBbjZJH7RTzW+o4/SBHJeLrmyEgvRhOG9c7vjH+l1f
 tIh2gE6ytKG8pXPhioIiUFU/Lkjy5DkK5Ql9cI5UUQry8f/0GwgCxeJXcG+HIFEJIayN
 pz139igKWI9WVrCMytz7bSK8HDx7gV5r0ezX23fP4R99kw9787UalhuapCb+AsqCn5mi
 WVQ8HPq8DJx0GHz5crnpzn51ahg5tzD/M6mR3ElNs3vw9LF8DwH8fy6plHGKinBHQH9V
 yanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687437929; x=1690029929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0IAa9QbAg6mMlY1K9iZzo0KBKDVgETeE7PvH1uKY77A=;
 b=CigHkKrQMa0+kvvm4o2R495Ohgiz3/FjdLZIVdUa5N92TDttGUAtL7vBP2nttW57dx
 9CAlW+D7pumZrwceQO3V4JYPRsKOfrNMeoKiz6Xq7KqDpwgXC9kdOb2TFsjesiS8fVlL
 JrOhYcyaPtCjSO0uHfD5ccSJFNZc4rvW9hcsxn5nLwk5MvNJxPfQJIH5VTLlVBjcsBIi
 lMrGmY848AFJE90CCDuqeSOa7pQrQUsdDvVsudaXaMRPMwIS2NvfaNj4kUxQ/40tMkLC
 NqgVddhIMLDNfir6GUlTHjYt7MNm5lJuJivU4fJT1U5cXY5lD2quyrZ07r0uFrC6nTFV
 bKfg==
X-Gm-Message-State: AC+VfDyoIADftZJyRKgBMU+IGZIeEAbGVe6GaCAxFjuJdSXaAM3etvLT
 4mjvhOtBv7GDKXAQUy/MLtiqYaIRDqIj53R5RWC7Zg==
X-Google-Smtp-Source: ACHHUZ5/jzxo/ijO8rlAjptGql3tzGDgmPaiskSoOAANtplM754UorQOZnV5cX2QhyZ4FbjKszM2FRZhAFgxM5gtNns=
X-Received: by 2002:a1f:d103:0:b0:471:5cb5:11f8 with SMTP id
 i3-20020a1fd103000000b004715cb511f8mr7797350vkg.15.1687437928832; Thu, 22 Jun
 2023 05:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230621153650.440350-9-brgl@bgdev.pl>
 <202306221025.K6fKRmj7-lkp@intel.com>
In-Reply-To: <202306221025.K6fKRmj7-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Jun 2023 14:45:17 +0200
Message-ID: <CAMRc=MeWBh-uWDJTLwg5uzE=-Q2jTnSg4Gw9ogh-9N+WUntSwg@mail.gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Junxiao Chang <junxiao.chang@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 08/11] net: stmmac: platform:
	provide devm_stmmac_probe_config_dt()
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

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgNDo0OeKAr0FNIGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPiB3cm90ZToKPgo+IEhpIEJhcnRvc3osCj4KPiBrZXJuZWwgdGVzdCByb2JvdCBu
b3RpY2VkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3JzOgo+Cj4gW2F1dG8gYnVpbGQgdGVzdCBF
UlJPUiBvbiBuZXQtbmV4dC9tYWluXQo+Cj4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vaW50
ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL0JhcnRvc3otR29sYXN6ZXdza2kvbmV0LXN0bW1hYy1w
bGF0Zm9ybS1wcm92aWRlLXN0bW1hY19wbHRmcl9pbml0LzIwMjMwNjIxLTIzNDEzMwo+IGJhc2U6
ICAgbmV0LW5leHQvbWFpbgo+IHBhdGNoIGxpbms6ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyMzA2MjExNTM2NTAuNDQwMzUwLTktYnJnbCU0MGJnZGV2LnBsCj4gcGF0Y2ggc3ViamVj
dDogW1BBVENIIG5ldC1uZXh0IDA4LzExXSBuZXQ6IHN0bW1hYzogcGxhdGZvcm06IHByb3ZpZGUg
ZGV2bV9zdG1tYWNfcHJvYmVfY29uZmlnX2R0KCkKPiBjb25maWc6IHg4Nl82NC1rZXhlYyAoaHR0
cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjMwNjIyLzIwMjMwNjIyMTAy
NS5LNmZLUm1qNy1sa3BAaW50ZWwuY29tL2NvbmZpZykKPiBjb21waWxlcjogZ2NjLTEyIChEZWJp
YW4gMTIuMi4wLTE0KSAxMi4yLjAKPiByZXByb2R1Y2U6IChodHRwczovL2Rvd25sb2FkLjAxLm9y
Zy8wZGF5LWNpL2FyY2hpdmUvMjAyMzA2MjIvMjAyMzA2MjIxMDI1Lks2ZktSbWo3LWxrcEBpbnRl
bC5jb20vcmVwcm9kdWNlKQo+Cj4gSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBw
YXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcgdmVyc2lvbiBvZgo+IHRoZSBzYW1lIHBh
dGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MKPiB8IFJlcG9ydGVkLWJ5OiBr
ZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiB8IENsb3NlczogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMDYyMjEwMjUuSzZmS1JtajctbGtwQGludGVs
LmNvbS8KPgo+IEFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToKPgo+ICAgIGxk
OiB2bWxpbnV4Lm86IGluIGZ1bmN0aW9uIGBfX2tzeW10YWJfZGV2bV9zdG1tYWNfcHJvYmVfY29u
ZmlnX2R0JzoKPiA+PiBzdG1tYWNfcGxhdGZvcm0uYzooX19fa3N5bXRhYl9ncGwrZGV2bV9zdG1t
YWNfcHJvYmVfY29uZmlnX2R0KzB4MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRldm1fc3Rt
bWFjX3Byb2JlX2NvbmZpZ19kdCcKPgo+IC0tCj4gMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2Vydmlj
ZQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMvd2lraQoKSSBhZGRlZCB0aGUg
bWlzc2luZyBzdHViIGZvciAhQ09ORklHX09GIHRvIHYyLgoKQmFydApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
