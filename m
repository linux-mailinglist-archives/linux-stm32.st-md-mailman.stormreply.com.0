Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ED26C61AA
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 09:30:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4259CC6A5E7;
	Thu, 23 Mar 2023 08:30:02 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73648C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 08:30:00 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-544b959a971so348688447b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679560199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ESqicvrtxMjgfv2DQ/MbAC2UcJgHBWQRNQuYleU6Lxc=;
 b=auh9w4//9ZjxHavJWL3nkpB/8hz0Qp657Qd/SCGI99yNlonXV4rVy5V4S1re8qkcn1
 wkHuP4yLqaLpr3BATeYTwZhpHFNYMfhfFvBhiaCPBw/43c/9AHaP5/WD1W6q26CxW/vS
 lDzn2Qownfc29i6U6Qtbr59OzMfkO34zvh/5tfqdspVIwECXzBhf/LUIKt4b4RECX1wZ
 0CNn004ZOkQV1DzcmtML/tSlFQkB2aeZRstUu/ubRvYRPMUI0u3BBd1ay5qU/mNNTDqk
 sZdrN1sJgL8NQhS71hyQ6ktPfYar/qav4R/fpkO1+qUOzmGfL8gHp/MFV+mULzky+X56
 ZOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679560199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ESqicvrtxMjgfv2DQ/MbAC2UcJgHBWQRNQuYleU6Lxc=;
 b=VsXy5C5cwqTnT0LpvbhvIoJxL5g6hTZ5MHjc48dbxu7Qr5HYAKVamctqnPicr0Dwai
 641JkwSFW2zWIaGxfsDGDiMvdmAv0cIV1GXErrQV4TMtYqDHeJb01d0Vlby+BMBHEWiL
 klXpcPUf8KM+UjJh7jjmHa/gTl3o8iN/VQpS+ha+MyqKW0zxNrno4rem4VkWA0eIPLdt
 F9flOXWDpL47e4ZQmrLigR/LwKoEw43DRJUObEn2ZHNMpDoGFcoBpAvre1EcoZdYCw30
 PlsUKVJAvn6d3L3WkNLDHr831dfZeCb6AjDxeh9odfhOQElLX8FldLZ9AlwSX6K/YgpA
 SoHg==
X-Gm-Message-State: AAQBX9fTQYHyLc/Q3+JXJonDDFSZOGr1DKsHOWp+Yt0k/UQvNIBXi1NU
 ND2/OHUgTgN6j5ksBzgh9Slfo5jbKCYzpEDwKR8YkA==
X-Google-Smtp-Source: AKy350ZNlg5R5/BZzQajdKFhT8TJ5d/EfLNOqmBrkrroUQh7Bq9HML1sAQV9tmcb+eMmwJWymvt43FU84C+ft7dowAo=
X-Received: by 2002:a0d:ec4a:0:b0:541:753d:32f9 with SMTP id
 r10-20020a0dec4a000000b00541753d32f9mr1395590ywn.9.1679560199380; Thu, 23 Mar
 2023 01:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org>
 <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
 <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
 <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
 <CAL_Jsq+pzQvsvk8KiyVZPrebMvV6-PfxFXFXcPOf0C21+-yo9A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+pzQvsvk8KiyVZPrebMvV6-PfxFXFXcPOf0C21+-yo9A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2023 09:29:48 +0100
Message-ID: <CACRpkdbaCX0Fdr5guWZqCO_iVQrnOMmN-FYMV=LfFDsz9cdULA@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Tony Lindgren <tony@atomide.com>,
 Sean Wang <sean.wang@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: Use of_property_present() for
 testing DT property presence
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

T24gTW9uLCBNYXIgMjAsIDIwMjMgYXQgNzoxOOKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgoKPiA+IFNvIEkgbmVlZCBhIG5ldyB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2gg
YmVmb3JlIEkgY2FuIGFwcGx5IGl0Cj4gPiBJIGd1ZXNzLCBvciB0aGVyZSB3aWxsIGJlIGNvbmZs
aWN0IHdpdGggUmVzZWFzIHN0dWZmPwo+Cj4gQ2FuIHlvdSBqdXN0IGRyb3AgZHJpdmVycy9waW5j
dHJsL3JlbmVzYXMvcGluY3RybC5jIGZyb20gdGhpcyBwYXRjaD8KCllvdSBqdXN0IGV4cG9zZWQg
aG93IGxhenkgSSBhbSA7KQoKT0sgSSBkaWQgdGhhdCwgcGF0Y2ggYXBwbGllZCBzYW5zIHRoZSBy
ZW5lc2FzIGh1bmsuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
