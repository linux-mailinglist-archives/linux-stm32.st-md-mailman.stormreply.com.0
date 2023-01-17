Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E79266D8B8
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Jan 2023 09:53:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEAC1C65E45;
	Tue, 17 Jan 2023 08:53:58 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23EAFC65047
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 08:53:57 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id k12so335411qvj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 00:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dseOSX2zTH+XeCQ35kHO/8kj0vzRJ47S5eW+pnauFVw=;
 b=IN1tCeVLnwqol5mOOyaSKxyI6kXzBL3oblSeLXVIqXyUFgWIwbZ0AEzA8olwW7upIy
 FObicSGhLmkCghdvzFXSEJAyGxharJCShW7z0r+lEuvRAdFgw/Mxnef/EERBExtq8sMy
 Mcp+PQsHnyA392QlG4twkaHS5FodAKoH3B3yaJJT0FBlqe7JmvyILW6DXybR86bCuoQC
 UqoyUTTaZe3pVph9PjUnNC+gdZK/JhrtzzJA5+OSVpLY72U3uaJRq46DnYklrCW6khCa
 fPiWIzKX0q18Q1gHryK2/LjCQP56sP8q10LYVdVfp1q/DwJiFCOzLG6iIT0dwfrQWPTz
 2MNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dseOSX2zTH+XeCQ35kHO/8kj0vzRJ47S5eW+pnauFVw=;
 b=DHiklPbU2Gdu7hm2rbcYeNBTQ6/7VYl1ELeE1lqcYAYtHQyM/E8HrKS8MfqIoH8Pey
 vebIYondVwe/ztxPlWOKsQg3zKSpj3IuUF7MuX+DSV26T9hiuKzXGZAKskCmzoI+EFwt
 jfjQveTL+3PXyvcfXa5RL0HmU0SE0sxu4CQFFbRoWOYdOTUg1Xh0sXi8nJForgFHA+7Z
 BgPS/PhVNfgeZlAqRv60xDfVrNIlHnQ0oE45OoKR+W7LalMLKVOTgXrVpKSE68AjxMtX
 zjVF+K8xlIpihST4plYvpyALKYP0UZ9MN/HZhRL8lbs6slMZPIryewg+NxO/HG2tj4dV
 n6fg==
X-Gm-Message-State: AFqh2kpePKfICmXIjFTSg58AaDuyCt1EZovAvOLtqDFLMkD9Kp4bPXyH
 drWlQEFG2wNm9jug4PAKXmYNmsEOh5A0d5IXsTM=
X-Google-Smtp-Source: AMrXdXvLiqXj9jIN/w78ICHR0nICmfROd8xLwBZS8MBQVeGvCEuFhhD92MzOr0asWEhyUaMDPd3N/hzGbdM64AxxTSk=
X-Received: by 2002:a0c:f6c2:0:b0:532:2dd4:fea3 with SMTP id
 d2-20020a0cf6c2000000b005322dd4fea3mr144148qvo.48.1673945635919; Tue, 17 Jan
 2023 00:53:55 -0800 (PST)
MIME-Version: 1.0
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-13-nuno.sa@analog.com>
 <20220806192048.0ca41cc5@jic23-huawei>
 <20230116204452.il4gase2szipeexz@SoMainline.org>
In-Reply-To: <20230116204452.il4gase2szipeexz@SoMainline.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jan 2023 10:53:19 +0200
Message-ID: <CAHp75VdX9sFgn9STyzwcDCK1KYbU00ejFNcEP3FVnLk5J=Pktg@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Haibo Chen <haibo.chen@nxp.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Nancy Yuen <yuenn@google.com>,
 Andy Gross <agross@kernel.org>, linux-imx@nxp.com,
 Zhang Rui <rui.zhang@intel.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org,
 Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 12/15] iio: adc: qcom-spmi-adc5:
	convert to device properties
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

T24gTW9uLCBKYW4gMTYsIDIwMjMgYXQgMTA6NDQgUE0gTWFyaWpuIFN1aWp0ZW4KPG1hcmlqbi5z
dWlqdGVuQHNvbWFpbmxpbmUub3JnPiB3cm90ZToKPgo+IE9uIDIwMjItMDgtMDYgMTk6MjA6NDgs
IEpvbmF0aGFuIENhbWVyb24gd3JvdGU6Cj4gPiBPbiBGcmksIDE1IEp1bCAyMDIyIDE0OjI5OjAw
ICswMjAwCj4gPiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPiB3cm90ZToKPiA+Cj4gPiA+
IE1ha2UgdGhlIGNvbnZlcnNpb24gdG8gZmlybXdhcmUgYWdub3N0aWMgZGV2aWNlIHByb3BlcnRp
ZXMuIEFzIHBhcnQgb2YKPiA+ID4gdGhlIGNvbnZlcnNpb24gdGhlIElJTyBpbmtlcm4gaW50ZXJm
YWNlICdvZl94bGF0ZSgpJyBpcyBhbHNvIGNvbnZlcnRlZCB0bwo+ID4gPiAnZndub2RlX3hsYXRl
KCknLiBUaGUgZ29hbCBpcyB0byBjb21wbGV0ZWx5IGRyb3AgJ29mX3hsYXRlJyBhbmQgaGVuY2Ug
T0YKPiA+ID4gZGVwZW5kZW5jaWVzIGZyb20gSUlPLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgo+ID4gPiBBY2tlZC1ieTogTGludXMgV2Fs
bGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+ID4gPiBSZXZpZXdlZC1ieTogQW5keSBT
aGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgo+ID4gK0NDIE1hcmlqaW4gd2hv
IGhhcHBlbmQgdG8gcG9zdCBhIHBhdGNoIGZvciB0aGlzIGRyaXZlciB0aGF0IEkganVzdCBhY2Nl
cHRlZAo+ID4gYW5kIGhlbmNlIHByb2JhYmx5IGhhcyBoYXJkd2FyZSBhY2Nlc3MuICBBbnkgY2hh
bmNlIG9mIGEgdGVzdCBmb3IgdGhpcyBzZXJpZXM/Cj4gPgo+ID4gSWYgbm90LCBubyBwcm9ibGVt
IGFzIHRoaXMgaXMgZmFpcmx5IG1lY2hhbmljYWwgYW5kIHdlIGhhdmUgdGVzdGluZyBvbiBzb21l
IG9mCj4gPiB0aGUgb3RoZXIgZHJpdmVycyB1c2luZyB0aGUgbmV3IGNvZGUuCj4gPgo+ID4gSSds
bCBwcm9iYWJseSBxdWV1ZSB0aGlzIHVwIGluIHRoZSBtZWFudGltZSBidXQgaXQgd29uJ3QgZW5k
IHVwIHVwc3RyZWFtCj4gPiBmb3IgYSBmZXcgd2Vla3MgeWV0Lgo+Cj4gSm9uYXRoYW4sCj4KPiBU
aGlzIENDIGp1c3Qgc3VyZmFjZWQgaW4gbXkgaW5ib3ggd2hpbGUgc2VhcmNoaW5nIGZvciBvdXIg
Y3VycmVudAo+IGRpc2N1c3Npb24gYXJvdW5kIG1pc3NpbmcgbGFiZWxzIGluIHFjb20tc3BtaS12
YWRjIC0gYW5kIG9uIHRoZSBzaWRlIGEKPiB1c2Vyc3BhY2UgQHh4IGxhYmVsIG5hbWUgQUJJIGJy
ZWFrIChpbiBxY29tLXNwbWktYWRjNSkgY2F1c2VkIGJ5IHRoaXMKPiBwYXRjaCdzIGZ3bm9kZV9n
ZXRfbmFtZSBjaGFuZ2UgLSB3ZSBjb3VsZCd2ZSBjYXVnaHQgaXQgaWYgSSBoYWQgbm90Cj4gYWNj
aWRlbnRhbGx5IG1hcmtlZCBpdCBhcyByZWFkIGFuZC9vciBmb3Jnb3QgYWJvdXQgaXQuICBNeSBh
cG9sb2dpZXMuCgpEb2VzIHRoZSBmb2xsb3dpbmcgYWRkaXRpb24gdG8gdGhlIHRvcCBvZiB0aGUK
YWRjNV9nZXRfZndfY2hhbm5lbF9kYXRhKCkgZml4IHRoZSBpc3N1ZT8KCisgICAgICAgbmFtZSA9
IGRldm1fa2FzcHJpbnRmKGFkYy0+ZGV2LCBHRlBfS0VSTkVMLCAiJXBmd1AiLCBmd25vZGUpOwor
ICAgICAgIGlmICghbmFtZSkKKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwoKLS0gCldp
dGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
