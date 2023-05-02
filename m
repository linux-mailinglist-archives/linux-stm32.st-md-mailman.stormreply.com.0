Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1606F4BFA
	for <lists+linux-stm32@lfdr.de>; Tue,  2 May 2023 23:19:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65973C6A5FD;
	Tue,  2 May 2023 21:19:14 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70BB1C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 21:19:12 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-55a1462f9f6so31454747b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 May 2023 14:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683062351; x=1685654351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0h/G3jDyFIlsGjKztRY6ZyzstNpimF/rtsReSh8uQhc=;
 b=KRpm0LIjs28Qed8shWU3rN8qoEPt7Z2dbTHfeBDQWUYQ/eleo/D1hSCVxF8U6UZ+bs
 F1XMfbU8w5Ga3fHrL9f52m54VFw9b/NoIHxi6VJvUi0wJbHm/C9DZq5Ys2jrTCtfhcm1
 oBkQ2yn5ZHZ/TfTLorY09e+913thRNTfaqI5mNLT0k9tsDcNET4Mx+BQIf1502z+U6F5
 zdPY5wpLT0wKF469rWVGVCkKCBVQOBcwk1PBnM9kbNCfxW76JztqaMMAKMKH5t+1tPeB
 +v6bV47t5nalynw/2xl/re8ehZcjTh36Ag3m136LAbl2iZeuJ0S5NvYOTuc93MhpGwqC
 v4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683062351; x=1685654351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0h/G3jDyFIlsGjKztRY6ZyzstNpimF/rtsReSh8uQhc=;
 b=FtkS/OMH6pz5Usg6IqMLKiLOs1YFGGF9yKPGOFV99lbcVrQUVKpCuKaE4abeoC96io
 +AzehM9rLP+MsngHsU46O2ieEr1cpRkPLlK0qV2Eihyl5AmCQTTH3NdO2KwnsZj7+JKK
 5iS5ncpxNOAJTsb4pwcjoueV6Pk8EgDEH+lziWrjuGBAcwujMzsF8cfTQYLyElJxseK7
 C3wF7KtHCVnCDu5SSrDRF5vxbvP/Ahe5sjc/14pHFAtim/lQH6CHj5Abo9A3/HwvZQAE
 yU8IL7EWLM/bYmRR8o+Kcd2YQ9C3t/HpbfzXAftH+LIIA8KWf+sLHraJZkfhBlSlHf71
 kHJw==
X-Gm-Message-State: AC+VfDzv1kpoGKy0qQN4gTfjgy4Jwv6QUarkl26Qik7uH1DRx0UHgkK+
 gtOTE01xCuPLkYTZPJOuqbC+dRC7a9n1NdclkmrsNQ==
X-Google-Smtp-Source: ACHHUZ40eKx7z1zIEK43ZteAtF8Wd9UqjzfberS/RGyfg0Yc35rUPQJQ5+CsgQDyrPQsSFVeJx8PEmL+DqYZgiAtTAc=
X-Received: by 2002:a0d:e68f:0:b0:54f:6a20:5a19 with SMTP id
 p137-20020a0de68f000000b0054f6a205a19mr17486306ywe.34.1683062351071; Tue, 02
 May 2023 14:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 May 2023 23:18:59 +0200
Message-ID: <CACRpkdZx6vEVnxVt0tW4nYtnbv8g=Dc11sa_3myB3GW4jXk1oA@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

T24gVHVlLCBNYXkgMiwgMjAyMyBhdCA5OjQw4oCvUE0gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IEkndmUgZHVzdGVkIG9mZiBteSBzY3JpcHQgYW5kIG1hZGUgYSBi
cmFuY2hbMV0gd2l0aCB0aGUgcmVzdWx0Lgo+IFRoZXJlJ3MganVzdCBhIGNvdXBsZSBvZiBmaXhl
cyBuZWVkZWQgYWZ0ZXIgdGhlIHNjcmlwdCBpcyBydW4gKHNlZSB0aGUKPiB0b3AgY29tbWl0KS4g
VGhlIGNyb3NzIGFyY2ggaW5jbHVkZXMgYXJlIGFsbCBmaXhlZCB1cCBieSB0aGUgc2NyaXB0Lgo+
IGR0YnNfaW5zdGFsbCBtYWludGFpbnMgYSBmbGF0IGluc3RhbGwuIEkgY29tcGFyZWQgdGhlIG51
bWJlciBvZiAuZHRicwo+IGJlZm9yZSBhbmQgYWZ0ZXIgdG8gY2hlY2sgdGhlIHNjcmlwdC4KPgo+
IEkgdGhpbmsgdGhlIG9ubHkgaXNzdWUgcmVtYWluaW5nIGlzIGZpbmFsaXppbmcgdGhlIG1hcHBp
bmcgb2YKPiBwbGF0Zm9ybXMgdG8gc3ViZGlycy4gV2hhdCBJIGhhdmUgY3VycmVudGx5IGlzIGEg
bWl4dHVyZSBvZiBTb0MKPiBmYW1pbGllcyBhbmQgdmVuZG9ycy4gVGhlIG1vc3Qgbm90YWJsZSBh
cmUgYWxsIHRoZSBGcmVlc2NhbGUvTlhQCj4gcGxhdGZvcm1zLCBweGEsIHNvY2ZwZ2EsIGFuZCBz
dG0zMi4gSXQncyBub3QgY29uc2lzdGVudCB3aXRoIGFybTY0Cj4gZWl0aGVyLiBPbmNlIHRoYXQn
cyBmaW5hbGl6ZWQsIEkgc3RpbGwgbmVlZCB0byBnbyB1cGRhdGUgTUFJTlRBSU5FUlMuCgpJIHNl
ZSBteSBuaXRzIHdlcmUgZml4ZWQgbGlrZSBJIHdhbnRlZCB0aGVtLCBhbmQgaXQncyBub3cgbW9z
dGx5IGEKbWl4IG9mIHNvYyBhbmQgdmVuZG9yIG5hbWVzIHRoYXQgbWFrZSBzZW5zZSBzbyBmcm9t
IG15IHBvaW50IG9mIHZpZXc6CkFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+CgpOQjoKYXJjaC9hcm02NC9ib290L2R0cy9hcm0kCnZleHByZXNzLXYybS1y
czEuZHRzaSAtPiAuLi8uLi8uLi8uLi9hcm0vYm9vdC9kdHMvdmV4cHJlc3MtdjJtLXJzMS5kdHNp
CgpUaGlzIHN0aWxsIHdvcmtzIGFmdGVyIHRoZSBzY3JpcHQsIHllcz8KCllvdXJzLApMaW51cyBX
YWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
