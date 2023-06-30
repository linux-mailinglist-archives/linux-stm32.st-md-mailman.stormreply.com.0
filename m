Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6218C743A81
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jun 2023 13:11:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED932C6B454;
	Fri, 30 Jun 2023 11:11:48 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52204C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jun 2023 11:11:47 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1688123506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBi2xn+NWrUQzLbxhPhUtfNKTaMAus8XdZkjy6jHSNM=;
 b=418LKbfzErO8aWbRiCy6RicHEfWmrfLoIcdhuAdqKEQ/ZbLyV5fOr9TL2jgmxbiB1UJ3bl
 L7RSNcul7PGGKtMoVG58xOTYMswwl0fvl2x6Gy3oeK78nmBEYbydnR6FVElSSy3QDkkQS4
 aNdClghzIVSlb1kIYZa+lxNsG6dKqXTENfkuKKK8H3fwdANqYJnMII3qHGkdR7RslbGNzH
 rMZSPPYA/DaN+m+jbNSRocp1b1dwjRh2NBrN92RDYtVGXNSXIAHcc+RtRHjhZQcR/LI027
 /C9gb1mFySWZHISgYn13LNhN7Izd0dCqTTysj0/z5qIQHqLoTPKk/6VDB9l9vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1688123506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBi2xn+NWrUQzLbxhPhUtfNKTaMAus8XdZkjy6jHSNM=;
 b=jVPJlwFMcCzb0wYuBYE9xW6cZEwUMtJR24us2ZwmMLiYkh/Ya8FPIpIwdTH1G8h/qMJoP9
 yy6W7RPJnQ28ZkBA==
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Yangtao Li <frank.li@vivo.com>
In-Reply-To: <20230627110025.vgtplc6nluiiuvoh@pengutronix.de>
References: <20230627101215.58798-1-frank.li@vivo.com>
 <20230627110025.vgtplc6nluiiuvoh@pengutronix.de>
Date: Fri, 30 Jun 2023 13:11:46 +0200
Message-ID: <87h6qpyzkd.ffs@tglx>
MIME-Version: 1.0
Cc: heiko@sntech.de, hayashi.kunihiko@socionext.com, rafael@kernel.org,
 amitk@kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 jernej.skrabec@gmail.com, miquel.raynal@bootlin.com,
 srinivas.pandruvada@linux.intel.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, bchihi@baylibre.com,
 florian.fainelli@broadcom.com, daniel.lezcano@linaro.org,
 chi.minghao@zte.com.cn, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com, wenst@chromium.org,
 rui.zhang@intel.com, thara.gopinath@gmail.com, kernel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linux-mediatek@lists.infradead.org,
 mmayer@broadcom.com, matthias.bgg@gmail.com,
 DLG-Adam.Ward.opensource@dm.renesas.com, johan+linaro@kernel.org,
 angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org,
 niklas.soderlund+renesas@ragnatech.se, andersson@kernel.org,
 linux-kernel@vger.kernel.org, shangxiaojing@huawei.com,
 konrad.dybcio@linaro.org, mcoquelin.stm32@gmail.com, shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 01/15] genirq/devres: Add error
 information printing for devm_request_threaded_irq()
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

T24gVHVlLCBKdW4gMjcgMjAyMyBhdCAxMzowMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4g
T24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgMDY6MTI6MDFQTSArMDgwMCwgWWFuZ3RhbyBMaSB3cm90
ZToKPgo+IFdoaWxlIEkgYXNzdW1lIGNoYW5naW5nIHRvIGRldl9lcnJfcHJvYmUgaXMgYSByZXN1
bHQgb2YgbXkgY29uY2VybiB0aGF0Cj4gbm8gZXJyb3Igc2hvdWxkIGJlIHByaW50ZWQgd2hlbiBy
Yz0tRVBST0JFREVGRVIsIG15IG90aGVyIGNvbmNlcm4gdGhhdAo+IGFkZGluZyBhbiBlcnJvciBt
ZXNzYWdlIHRvIGEgZ2VuZXJpYyBhbGxvY2F0aW9uIGZ1bmN0aW9uIGlzIGEgYmFkIGlkZWEKPiBz
dGlsbCBzdGFuZHMuCgpJIGFncmVlIGluIGdlbmVyYWwsIGJ1dCBpZiB5b3UgYWN0dWFsbHkgbG9v
ayBhdCB0aGUgY2FsbCBzaXRlcyBvZgpkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKCkgdGhlbiB0
aGUgdmFzdCBtYWpvcml0eSBvZiB0aGVtIHByaW50IG1vcmUgb3IKbGVzcyBsb3VzeSBlcnJvciBt
ZXNzYWdlcy4gQSBxdWljayBncmVwL3NlZC9hd2svc29ydC91bmlxIHJldmVhbGVkCgogICAgIDUx
OSBtZXNzYWdlcyB0b3RhbCAodGhlcmUgYXJlIHByb2JhYmx5IG1vcmUpCgogICAgIDM1MiB1bmlx
dWUgbWVzc2FnZXMKCiAgICAgMzIzIHVuaXF1ZSBtZXNzYWdlcyBhZnRlciBsb3dlciBjYXNpbmcK
CiAgICAgICAgIFRob3NlIDMyMyBhcmUgbW9zdGx5IGp1c3QgdmFyaWFudHMgb2YgdGhlIHNhbWUg
cGF0dGVybnMgd2l0aCBzbGlnaHQKICAgICAgICAgbW9kaWZpY2F0aW9ucyBpbiBmb3JtYXR0aW5n
IGFuZCBpbmZvcm1hdGlvbiBwcm92aWRlZC4KCiAgICAgMTg2IG9mIHRoZXNlIG1lc3NhZ2VzIGRv
IG5vdCBkZWxpdmVyIGFueSB1c2VmdWwgaW5mb3JtYXRpb24sCiAgICAgICAgIGUuZy4gIm5vIGly
cSIsICIKCiAgICAgVGhlIG1vc3QgdXNlZnVsIG9uZSBvZiBhbGwgaXM6ICJjb3VsZCByZXF1ZXN0
IHdha2V1cCBpcnE6ICVkIgoKU28gdGhlcmUgaXMgY2VydGFpbmx5IGFuIGFyZ3VtZW50IHRvIGJl
IG1hZGUgdGhhdCB0aGlzIHBhcnRpY3VsYXIKZnVuY3Rpb24gc2hvdWxkIHByaW50IGEgd2VsbCBm
b3JtYXR0ZWQgYW5kIGluZm9ybWF0aXZlIGVycm9yIG1lc3NhZ2UuCgpJdCdzIG5vdCBhIGdlbmVy
YWwgYWxsb2NhdG9yIGxpa2Uga21hbGxvYygpLiBJdCdzIHNwZWNpYWxpemVkIGFuZCBpbiB0aGUK
dmFzdCBtYWpvcml0eSBvZiBjYXNlcyBmYWlsaW5nIHRvIHJlcXVlc3QgdGhlIGludGVycnVwdCBj
YXVzZXMgdGhlCmRldmljZSBwcm9iZSB0byBmYWlsLiBTbyBoYXZpbmcgcHJvcGVyIGFuZCBjb25z
aXN0ZW50IGluZm9ybWF0aW9uIHdoeQp0aGUgZGV2aWNlIGNhbm5vdCBiZSB1c2VkIF9pc18gdXNl
ZnVsLgoKWWFuZ3RhbzogVGhlIHdheSBob3cgdGhpcyBpcyBhdHRlbXB0ZWQgaXMgbm90IHVzZWZ1
bCBhdCBhbGwuCgogICAgMSkgVGhlIGNoYW5nZWxvZyBpcyB3b3JkIHNhbGFkIGFuZCBwcm92aWRl
cyAwIHJhdGlvbmFsZQoKICAgICAgIEFsc28gc3VjaCBzZXJpZXMgcmVxdWlyZSBhIGNvdmVyIGxl
dHRlci4uLgoKICAgIDIpIFRoZSBkZXZfZXJyKCkgd2hpY2ggaXMgYWRkZWQgaXMgbm90IGluZm9y
bWF0aXZlIGF0IGFsbCBhbmQgY2Fubm90CiAgICAgICByZXBsYWNlIGFjdHVhbGx5IHVzZWZ1bCBl
cnJvciBtZXNzYWdlcy4gSXQncyBub3QgdGhhdCBoYXJkIHRvCiAgICAgICBtYWtlIGl0IHVzZWZ1
bC4KCiAgICAyKSBBZGRpbmcgdGhlIHByaW50a3MgdW5jb25kaXRpb25hbGx5IGZpcnN0IHdpbGwg
ZW1pdCB0d28gbWVzc2FnZXMKICAgICAgIHdpdGggZGlmZmVyZW50IGNvbnRlbnQuCgogICAgICAg
VGhpcyBpcyBub3QgaG93IHN1Y2ggY2hhbmdlcyBhcmUgZG9uZS4KCiAgICAgICBUaGUgcHJvcGVy
IGFwcHJvYWNoIGlzIHRvIGNyZWF0ZSBhIHdyYXBwZXIgZnVuY3Rpb24gd2hpY2ggZW1pdHMKICAg
ICAgIHRoZSBlcnJvciBtZXNzYWdlOgoKICAgICAgIHdyYXBwZXIoLi4uLi4sIGNvbnN0IGNoYXIg
KmluZm8pCiAgICAgICB7CiAgICAgICAgICAgIHJldCA9IGRldm1fcmVxdWVzdF90aHJlYWRlZF9p
cnEoLi4uLik7CiAgICAgICAgICAgIGlmIChyZXQgPCAwKSB7CiAgICAgICAgICAgICAgIGRldl9l
cnIoZGV2LCAiRmFpbGVkIHRvIHJlcXVlc3QgJXNpbnRlcnJ1cHQgJXUgJXMgJXM6ICVkXG4sCiAg
ICAgICAgICAgICAgICAgICAgICAgdGhyZWFkX2ZuID8gInRocmVhZGVkICIgOiAiIiwKICAgICAg
ICAgICAgICAgICAgICAgICBpcnEsIGRldm5hbWUsIGluZm8gPyA6ICIiLCByZXQpOwogICAgICAg
ICAgICB9CiAgICAgICAgICAgIHJldHVybiByZXQ7CiAgICAgICB9CgogICAgICAgVGhlbiBjb252
ZXJ0IHRoZSBjYWxsc2l0ZXMgb3ZlciBvbmUgYnkgb25lIHdpdGggcHJvcGVyCiAgICAgICBjaGFu
Z2Vsb2dzIGFuZCBqdXN0aWZpY2F0aW9uLgoKICAgICAgIFNlZT8KClRoYW5rcywKCiAgICAgICAg
dGdseApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
