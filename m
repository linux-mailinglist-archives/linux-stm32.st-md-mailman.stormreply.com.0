Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9995AB41D
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Sep 2022 16:51:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AB05C640FC;
	Fri,  2 Sep 2022 14:51:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBFE6C640F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Sep 2022 14:51:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4DE361AA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Sep 2022 14:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37353C433B5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Sep 2022 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662130279;
 bh=4Hkr87g3PnzCLM9ZxFNQa5qADO4ZTPUXVLBqOM+przo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=h89XrqJuOXVQ4/8j/RjAq2NaBhz3+B4MWMgpH+S85BBgwuJpO7HMyGFtHxu9/UISb
 Ooo9ElCQqawa3/ew19xm+Tz8ntL2NNlg5mAxSK0mq26A0evpSb4NxGfhghyXeznQXl
 /aHP8dyeitoacHRZMR1sxLILr14GNLypUZxk2V5lEPeSv+9Ou0tnxKyOviLCLvJGqH
 nCTIO4INBz1uA6d8Mp3wUvJL8ixuaiePPI1AhxbL4ojKFomWDsXe4zwK1IqJNXOipd
 sHAb2Ql5+ML2QYQ8EHQtg0orVkUV23sLA/WQA20OOSIVe1Qav+eGismKrmZ/GiiczB
 WC/lWgSOFhgew==
Received: by mail-vk1-f177.google.com with SMTP id b63so1091478vkh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Sep 2022 07:51:19 -0700 (PDT)
X-Gm-Message-State: ACgBeo1SGsJNRC/lAbG3XV9SFskitSWBdJ8XhMTubd9JMRKY0wACnjr7
 nWXNJht8jrcndsbXyIquNTsVHRggUZbHS8ZYAg==
X-Google-Smtp-Source: AA6agR7gPR2eoNK8OlOt6H6YcAAUxzaXErLPZTaQL7XqzgtAc9mBmf8rXIp3NGDWwMeU3NPODBPf4sb4u9Hs3ebXLSY=
X-Received: by 2002:a05:6122:d86:b0:37d:3fe:df43 with SMTP id
 bc6-20020a0561220d8600b0037d03fedf43mr10496067vkb.15.1662130278184; Fri, 02
 Sep 2022 07:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220823145649.3118479-4-robh@kernel.org>
 <13083804.uLZWGnKmhe@kista>
In-Reply-To: <13083804.uLZWGnKmhe@kista>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 Sep 2022 09:51:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJTgrSZcKNr1ky5LAXRQbj3MADMpCCYVC26rcZvzwY1Xw@mail.gmail.com>
Message-ID: <CAL_JsqJTgrSZcKNr1ky5LAXRQbj3MADMpCCYVC26rcZvzwY1Xw@mail.gmail.com>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chris Zhong <zyw@rock-chips.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Renner Berthing <kernel@esmil.dk>,
 Samuel Holland <samuel@sholland.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Alistair Francis <alistair@alistair23.me>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tim Harvey <tharvey@gateworks.com>, Zhang Qing <zhangqing@rock-chips.com>,
 Maxime Ripard <mripard@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Robert Jones <rjones@gateworks.com>, - <patches@opensource.cirrus.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steve Twiss <stwiss.opensource@diasemi.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: Add missing
 (unevaluated|additional)Properties on child nodes
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

T24gVGh1LCBBdWcgMjUsIDIwMjIgYXQgMzo0OSBQTSBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5z
a3JhYmVjQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBEbmUgdG9yZWssIDIzLiBhdmd1c3QgMjAyMiBv
YiAxNjo1NjozNSBDRVNUIGplIFJvYiBIZXJyaW5nIG5hcGlzYWwoYSk6Cj4gPiBJbiBvcmRlciB0
byBlbnN1cmUgb25seSBkb2N1bWVudGVkIHByb3BlcnRpZXMgYXJlIHByZXNlbnQsIG5vZGUgc2No
ZW1hcwo+ID4gbXVzdCBoYXZlIHVuZXZhbHVhdGVkUHJvcGVydGllcyBvciBhZGRpdGlvbmFsUHJv
cGVydGllcyBzZXQgdG8gZmFsc2UKPiA+ICh0eXBpY2FsbHkpLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICAuLi4vbWZkL2Fs
bHdpbm5lcixzdW42aS1hMzEtcHJjbS55YW1sICAgICAgICAgfCA0MCArKysrKysrKysrKysrKysr
KysrCj4gPiAgLi4uL21mZC9hbGx3aW5uZXIsc3VuOGktYTIzLXByY20ueWFtbCAgICAgICAgIHwg
MTAgKysrKysKPiA+ICAuLi4vYmluZGluZ3MvbWZkL2NpcnJ1cyxsb2NobmFnYXIueWFtbCAgICAg
ICAgfCAgNSArKysKPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvZGxnLGRhOTA2My55
YW1sICAgfCAgNyArKy0tCj4gPiAgLi4uL2JpbmRpbmdzL21mZC9nYXRld29ya3MtZ3NjLnlhbWwg
ICAgICAgICAgIHwgIDUgKystCj4gPiAgLi4uL2JpbmRpbmdzL21mZC9tYXhpbSxtYXgxNDU3Ny55
YW1sICAgICAgICAgIHwgIDEgKwo+ID4gIC4uLi9iaW5kaW5ncy9tZmQvbWF4aW0sbWF4Nzc4NDMu
eWFtbCAgICAgICAgICB8ICAxICsKPiA+ICAuLi4vYmluZGluZ3MvbWZkL3JvY2tjaGlwLHJrODE3
LnlhbWwgICAgICAgICAgfCAgMiArCj4gPiAgLi4uL2JpbmRpbmdzL21mZC9zaWxlcmd5LHN5NzYz
NmEueWFtbCAgICAgICAgIHwgIDEgKwo+ID4gIC4uLi9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItbHB0
aW1lci55YW1sICAgICAgICB8ICA0ICsrCj4gPiAgLi4uL2JpbmRpbmdzL21mZC9zdCxzdG0zMi10
aW1lcnMueWFtbCAgICAgICAgIHwgIDMgKysKPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZmQvc3Qsc3RtZngueWFtbCAgICAgfCAgMSArCj4gPiAgLi4uL2JpbmRpbmdzL21mZC9zdGVyaWNz
c29uLGFiODUwMC55YW1sICAgICAgIHwgMjIgKysrKysrKysrKwo+ID4gIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21mZC90aSx0cHM2NTA4Ni55YW1sICB8ICAxICsKPiA+ICAuLi4vYmluZGluZ3Mv
bWZkL3gtcG93ZXJzLGF4cDE1Mi55YW1sICAgICAgICAgfCAgMSArCj4gPiAgMTUgZmlsZXMgY2hh
bmdlZCwgMTAwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dAo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2FsbHdpbm5lcixz
dW42aS1hMzEtcHJjbS55YW1sCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZmQvYWxsd2lubmVyLHN1bjZpLWEzMS1wcmNtLnlhbWwgaW5kZXgKPiA+IGQxMzE3NTljY2Fm
My4uMDIxZDMzY2IzZGQ2IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21mZC9hbGx3aW5uZXIsc3VuNmktYTMxLXByY20ueWFtbAo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hbGx3aW5uZXIsc3VuNmktYTMxLXBy
Y20ueWFtbAo+ID4gQEAgLTIyLDYgKzIyLDcgQEAgcHJvcGVydGllczoKPiA+ICBwYXR0ZXJuUHJv
cGVydGllczoKPiA+ICAgICJeLipfKGNsa3xyc3QpJCI6Cj4gPiAgICAgIHR5cGU6IG9iamVjdAo+
ID4gKyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gPgo+ID4gICAgICBwcm9wZXJ0
aWVzOgo+ID4gICAgICAgIGNvbXBhdGlibGU6Cj4gPiBAQCAtMzQsNiArMzUsNDUgQEAgcGF0dGVy
blByb3BlcnRpZXM6Cj4gPiAgICAgICAgICAgIC0gZml4ZWQtZmFjdG9yLWNsb2NrCj4gPgo+ID4g
ICAgICBhbGxPZjoKPiA+ICsgICAgICAtIGlmOgo+ID4gKyAgICAgICAgICBwcm9wZXJ0aWVzOgo+
ID4gKyAgICAgICAgICAgIGNvbXBhdGlibGU6Cj4gPiArICAgICAgICAgICAgICBjb250YWluczoK
PiA+ICsgICAgICAgICAgICAgICAgY29uc3Q6IGZpeGVkLWZhY3Rvci1jbG9jawo+ID4gKwo+ID4g
KyAgICAgICAgdGhlbjoKPiA+ICsgICAgICAgICAgJHJlZjogL3NjaGVtYXMvY2xvY2svZml4ZWQt
ZmFjdG9yLWNsb2NrLnlhbWwjCj4gPiArCj4gPiArICAgICAgLSBpZjoKPiA+ICsgICAgICAgICAg
cHJvcGVydGllczoKPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxlOgo+ID4gKyAgICAgICAgICAg
ICAgY29udGFpbnM6Cj4gPiArICAgICAgICAgICAgICAgIGNvbnN0OiBhbGx3aW5uZXIsc3VuNGkt
YTEwLW1vZDAtY2xrCj4gPiArCj4gPiArICAgICAgICB0aGVuOgo+ID4gKyAgICAgICAgICBwcm9w
ZXJ0aWVzOgo+ID4gKyAgICAgICAgICAgICIjY2xvY2stY2VsbHMiOgo+ID4gKyAgICAgICAgICAg
ICAgY29uc3Q6IDAKPiA+ICsKPiA+ICsgICAgICAgICAgICAjIEFscmVhZHkgY2hlY2tlZCBpbiB0
aGUgbWFpbiBzY2hlbWEKPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxlOiB0cnVlCj4gPiArCj4g
PiArICAgICAgICAgICAgY2xvY2tzOgo+ID4gKyAgICAgICAgICAgICAgbWF4SXRlbXM6IDIKPgo+
IExhc3QgdGltZSBub2RlIHdpdGggYWxsd2lubmVyLHN1bjRpLWExMC1tb2QwLWNsayBjb21wYXRp
YmxlIHdhcyB1c2VkLCBpdCBoYWQgMwo+IGNsb2Nrcy4gU2VlOgo+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2Fy
Y2gvCj4gYXJtL2Jvb3QvZHRzL3N1bjRpLWExMC5kdHNpP2lkPWYxODY5OGUxYzY2MzM4YjkwMmRl
Mzg2ZTRhZDk3YjhiMWI5ZDk5OWQjbjQwNgoKSHVtbSwgd2UgYWxyZWFkeSBoYXZlIGNvbnN0cmFp
bnRzIGluCmJpbmRpbmdzL2Nsb2NrL2FsbHdpbm5lcixzdW40aS1hMTAtbW9kMC1jbGsueWFtbC4g
SSdsbCBqdXN0IG1ha2UgaXQKJ2Nsb2NrczogdHJ1ZScgaGVyZSBpbnN0ZWFkLgoKUm9iCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
