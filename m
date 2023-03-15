Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B3F6BC121
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 00:33:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39FE1C6904C;
	Wed, 15 Mar 2023 23:33:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E907C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Mar 2023 23:33:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A96DB81FA9;
 Wed, 15 Mar 2023 23:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3EEC433D2;
 Wed, 15 Mar 2023 23:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678923181;
 bh=ZW0cW6j0eZ3LRxXMTCWZrrkIV3axsHJnqHcZZpwnlco=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DQEoGlYRaWYHi/3uI8nc0LhUk+/xLW7zzvBumLCc+upwsanoVQoyggJaMNzHIBAah
 dUqX7NTdlqtNqmVH/DkhNlmdhG2TDo8lVKgqn9b4iqOz8VxYmzIKSA6ocnC0RE5iVF
 gCDXLOCIQ9m3MCqH92jKnf66VpJfg28tUC4YFJRgv4WmV+H6ZpiS4GYhkT0Ulh7v6k
 0P0eiOIcdIton2WyhrGiY3/0QMrCKisubp+rlcPe4QhNIGfYkwOLPEua2qEBOr2RK8
 0lW00iPAGST7rIrGR+59BXC9kt6+CZ3pQcxZeLVFPF7TYXG9jP8MadTZ9rbSwtx0/w
 ga0o2PgaBXBEA==
From: Bjorn Andersson <andersson@kernel.org>
To: Tero Kristo <kristo@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Michal Simek <michal.simek@xilinx.com>, Nishanth Menon <nm@ti.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Andy Gross <agross@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 15 Mar 2023 16:35:30 -0700
Message-Id: <167892332563.4030021.12717582908504193989.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: linux-renesas-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] (subset) [PATCH 00/30] clk: Convert to platform
	remove callback returning void
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

T24gU3VuLCAxMiBNYXIgMjAyMyAxNzoxNDo0MiArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gdGhpcyBwYXRjaCBzZXJpZXMgYWRhcHRzIHRoZSBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93
IGRyaXZlcnMvY2xrCj4gdG8gdXNlIHRoZSAucmVtb3ZlX25ldygpIGNhbGxiYWNrLiBDb21wYXJl
ZCB0byB0aGUgdHJhZGl0aW9uYWwgLnJlbW92ZSgpCj4gY2FsbGJhY2sgLnJlbW92ZV9uZXcoKSBy
ZXR1cm5zIG5vIHZhbHVlLiBUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlCj4gdGhlIGRyaXZl
ciBjb3JlIGRvZXNuJ3QgKGFuZCBjYW5ub3QpIGNvcGUgZm9yIGVycm9ycyBkdXJpbmcgcmVtb3Zl
LiBUaGUKPiBvbmx5IGVmZmVjdCBvZiBhIG5vbi16ZXJvIHJldHVybiB2YWx1ZSBpbiAucmVtb3Zl
KCkgaXMgdGhhdCB0aGUgZHJpdmVyCj4gY29yZSBlbWl0cyBhIHdhcm5pbmcuIFRoZSBkZXZpY2Ug
aXMgcmVtb3ZlZCBhbnlob3cgYW5kIGFuIGVhcmx5IHJldHVybgo+IGZyb20gLnJlbW92ZSgpIHVz
dWFsbHkgeWllbGRzIGEgcmVzb3VyY2UgbGVhay4KPiAKPiBbLi4uXQoKQXBwbGllZCwgdGhhbmtz
IQoKWzIyLzMwXSBjbGs6IHFjb206IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiBjNGRjMjRkYTUyODY3NDJmOGNjNzI4Mzc5
ZjYxMTVjOWU4ODZhOGE0CgpCZXN0IHJlZ2FyZHMsCi0tIApCam9ybiBBbmRlcnNzb24gPGFuZGVy
c3NvbkBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
