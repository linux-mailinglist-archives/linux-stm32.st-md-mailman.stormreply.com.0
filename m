Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 004629F4BA2
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 14:11:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6168C78014;
	Tue, 17 Dec 2024 13:11:13 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07743C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 13:11:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 79A47A40EE6;
 Tue, 17 Dec 2024 13:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DDEC4CED3;
 Tue, 17 Dec 2024 13:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734441064;
 bh=gvi4zhWgM7DuHNfwNNofUajiRjxTUQvFyFuksTf+yp4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZqOimGIf2rOEexCodXE54xgPWFKWsQXh5DQa2JIZ9Tot/zm+1AoDDBiARLImOU/if
 Ws7+/5BVWIa1ZnCK204U90bOnu2ShWueKtiMG75VAGzEkgw1cS66vynbyrm+loKCJ4
 0hBn+pdPR3JygijFBGes37/ZEPD/8SqK+h6Uk3AtF0JSbO//FC593HwY7fV1sqqPw7
 pDGB+lPknl/hBg1Ji3TssKeRo9eAOfMX1DjV23k4PgqCaMF+a4gkxfk0Fhs46+4xac
 UrECY/jXq4Ubi3Jm0fgg0Gca94ObsZw7uDpUcgeetcK09Lid1C+Lb+reyMTZgbTkKG
 cJeC/0dgeJ53g==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Marek Vasut <marex@denx.de>
In-Reply-To: <20241216104826.6946-1-marex@denx.de>
References: <20241216104826.6946-1-marex@denx.de>
Message-Id: <173444106208.1701236.11464150864495831064.b4-ty@kernel.org>
Date: Tue, 17 Dec 2024 13:11:02 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Lee Jones <lee@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Daniel Golle <daniel@makrotopia.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Pavel Machek <pavel@ucw.cz>,
 Lukasz Majewski <lukma@denx.de>, Christian Marangi <ansuelsmth@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] (subset) [PATCH v2] leds: trigger: netdev: Check
 offload ability on interface up
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

T24gTW9uLCAxNiBEZWMgMjAyNCAxMTo0ODoyMiArMDEwMCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4g
VGhlIHRyaWdnZXJfZGF0YS0+aHdfY29udHJvbCBpbmRpY2F0ZXMgd2hldGhlciB0aGUgTEVEIGlz
IGNvbnRyb2xsZWQgYnkgSFcKPiBvZmZsb2FkLCBpLmUuIHRoZSBQSFkuIFRoZSB0cmlnZ2VyX2Rh
dGEtPmh3X2NvbnRyb2wgPSBjYW5faHdfY29udHJvbCgpIGlzCj4gY3VycmVudGx5IGNhbGxlZCBv
bmx5IGZyb20gbmV0ZGV2X2xlZF9hdHRyX3N0b3JlKCksIGkuZS4gd2hlbiB3cml0aW5nIGFueQo+
IHN5c2ZzIGF0dHJpYnV0ZSBvZiB0aGUgbmV0ZGV2IHRyaWdnZXIgaW5zdGFuY2UgYXNzb2NpYXRl
ZCB3aXRoIGEgUEhZIExFRC4KPiAKPiBUaGUgY2FuX2h3X2NvbnRyb2woKSBjYWxscyB2YWxpZGF0
ZV9uZXRfZGV2KCkgd2hpY2ggaW50ZXJuYWxseSBjYWxscwo+IGxlZF9jZGV2LT5od19jb250cm9s
X2dldF9kZXZpY2UoKSwgd2hpY2ggaXMgcGh5X2xlZF9od19jb250cm9sX2dldF9kZXZpY2UoKQo+
IGZvciBQSFkgTEVEcy4gVGhlIHBoeV9sZWRfaHdfY29udHJvbF9nZXRfZGV2aWNlKCkgcmV0dXJu
cyBOVUxMIGlmIHRoZSBQSFkKPiBpcyBub3QgYXR0YWNoZWQuCj4gCj4gWy4uLl0KCkFwcGxpZWQs
IHRoYW5rcyEKClsxLzFdIGxlZHM6IHRyaWdnZXI6IG5ldGRldjogQ2hlY2sgb2ZmbG9hZCBhYmls
aXR5IG9uIGludGVyZmFjZSB1cAogICAgICBjb21taXQ6IDBkZmRhNTA5ODhjNjgwNWU4YWI0MzJl
OTk4NjZhMDIxZWE2ZWM0NmQKCi0tCkxlZSBKb25lcyBb5p2O55C85pavXQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
