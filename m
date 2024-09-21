Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C24797DF00
	for <lists+linux-stm32@lfdr.de>; Sat, 21 Sep 2024 23:12:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7C3EC712A2;
	Sat, 21 Sep 2024 21:12:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D18CAC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Sep 2024 21:12:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CEE035C03B2;
 Sat, 21 Sep 2024 21:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF62C4CEC2;
 Sat, 21 Sep 2024 21:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726953156;
 bh=phXqp9sx1SQ3XnHPFtM1vPkRhWKw5lBZejOf6LQt9ao=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=HPfuKriUJ7XdvindCQ93kJOi52p/hb4yEY19k6ESAe5MkEtBmJzu1PVvFJG1LoVLP
 wt2gbB1hm8mXSgJ9yO9wDdJIgVrhnjL6MVQVoDQx5VYg2H+cNvLKGaTlLdcm/0F9iq
 jOQTk9vsaQgUwOuDDUMLYeA6DfZceX5/WoleSw5xz1AURC+vIslXn6+LqnhKmaQUYA
 cSMriGt6YbVN6H0msczVVKOSyNe6LmyAHERtIuW1Gld5uDFeDTwM7xayTORfk4IYUn
 UvMSFvyEdL1tKjtYhCNEpMMYtSlvDkTCLNllo+OW+Vc1BQTTK1KvaMNDNiBlZRB4nK
 R/h+nnCFE873g==
Message-ID: <1a96db1609b5b3b26584d8f823d85b7f.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
References: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Date: Sat, 21 Sep 2024 14:12:34 -0700
User-Agent: alot/0.10
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] clk: Switch back to struct
	platform_driver::remove()
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

UXVvdGluZyBVd2UgS2xlaW5lLUvDtm5pZyAoMjAyNC0wOS0wOSAwNzo0MDoyNSkKPiBBZnRlciBj
b21taXQgMGVkYjU1NWE2NWQxICgicGxhdGZvcm06IE1ha2UgcGxhdGZvcm1fZHJpdmVyOjpyZW1v
dmUoKQo+IHJldHVybiB2b2lkIikgLnJlbW92ZSgpIGlzIChhZ2FpbikgdGhlIHJpZ2h0IGNhbGxi
YWNrIHRvIGltcGxlbWVudCBmb3IKPiBwbGF0Zm9ybSBkcml2ZXJzLgo+IAo+IENvbnZlcnQgYWxs
IGNsayBkcml2ZXJzIHRvIHVzZSAucmVtb3ZlKCksIHdpdGggdGhlIGV2ZW50dWFsIGdvYWwgdG8g
ZHJvcAo+IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXI6OnJlbW92ZV9uZXcoKS4gQXMgLnJlbW92ZSgp
IGFuZCAucmVtb3ZlX25ldygpIGhhdmUKPiB0aGUgc2FtZSBwcm90b3R5cGVzLCBjb252ZXJzaW9u
IGlzIGRvbmUgYnkganVzdCBjaGFuZ2luZyB0aGUgc3RydWN0dXJlCj4gbWVtYmVyIG5hbWUgaW4g
dGhlIGRyaXZlciBpbml0aWFsaXplci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KPiAtLS0KCkFwcGxpZWQgdG8gY2xr
LW5leHQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
