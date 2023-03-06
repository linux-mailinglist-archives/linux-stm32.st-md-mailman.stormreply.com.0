Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8B06AD163
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 23:19:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BC7AC65E73;
	Mon,  6 Mar 2023 22:19:22 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2151C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 22:19:20 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-536c02eea4dso211238427b3.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Mar 2023 14:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678141159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BIwy9GGWWk7FRheyk7kQvNm+28TrmRYb7v9Ze4E4qE4=;
 b=ICZbYBbMVaIDZmAFB6H5iCrhGOEY35M31GUKkKobfQ8xltOrmn8D7FBBCOITMcflZS
 tG44B2qro/h5+lzF6tMxsW8eAPNd9g34RzZohr48LOpkOe65wBRX5KoI/Ijr40eZ47u0
 hg9LCHTphHBINZkB8S5Stwn7tdrs6yBXkgkm5ESSb9puGdqGNkOVYFJ7AlZ5nH8WM/BX
 VLXoEQKY4rimQFW9XQI71Ag9FOrsXPDGATyku/a5MWV099Hb/BvLMCqc0tbzZW/EPoo/
 JYcXWDx5G47YQPkidEUVePtZhKEOq7OFI76H8ngB+J188eN8H6kWVzpgqs5QTDJcNVaE
 PWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678141159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIwy9GGWWk7FRheyk7kQvNm+28TrmRYb7v9Ze4E4qE4=;
 b=eTMvSkfDT+SfgACCgpSrPtZ2M+pZvwsMgBS0/AWdOnraTnHYWDFV/mpMVDr+guk6FW
 CScUADwcQlOEwveUAZgXkndicpe2FcqxczmavlHTgIRJ7tKO/cJUtlqxWs3F3f33SwU5
 LgmbJYtyiK5855gISh8RpAGnphyVrnuJUN1oi8kYk2P5kmruGeNnLgrMd9J/ZM2xcvZn
 8OIc5sB3wzzC2u+tFjmTRNDRHeDF5YD2exMBAmoNEqUc5fvegG0DJmJ2ADXqmQn8k7vm
 SMYcjtEaOfuuEuTH38PdILzy2VtIFHNKrf6CrQcWyeJZe0OZDZVDYCi0n0WE1bVnTAvi
 cK/w==
X-Gm-Message-State: AO0yUKXkrtp0zwWKr3OQUjjQ7rHevB8bAHHWfQoTVTazxXaPD3y6MSpm
 PSdC1MneRiTwC3MT5ak4I+bshrR8ydLdyCCo6sFPBQ==
X-Google-Smtp-Source: AK7set+FEBHOTN7jH6jw+W4M/INkl80XRa4XzqDzPxdd9YGD5yqFWOonMchaUl4aHKnjh/2xQeNLpP3z0RkBrl7WU5s=
X-Received: by 2002:a81:b705:0:b0:535:fe26:acc with SMTP id
 v5-20020a81b705000000b00535fe260accmr7785857ywh.10.1678141159600; Mon, 06 Mar
 2023 14:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-21-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-21-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 23:19:08 +0100
Message-ID: <CACRpkdYS54Svj=B-NfrjX+kBDYw5e9Jyt70L0tr_iX5+mVYK4A@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-aspeed@lists.ozlabs.org, edmund.j.dea@intel.com,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 anitha.chrisanthus@intel.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 samuel@sholland.org, airlied@gmail.com, javierm@redhat.com,
 jernej.skrabec@gmail.com, linux-imx@nxp.com, linux-sunxi@lists.linux.dev,
 p.zabel@pengutronix.de, daniel@ffwll.ch, martin.blumenstingl@googlemail.com,
 s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 laurentiu.palcu@oss.nxp.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 hyun.kwon@xilinx.com, tomba@kernel.org, andrew@aj.id.au, jyri.sarha@iki.fi,
 yannick.fertre@foss.st.com, kernel@pengutronix.de, khilman@baylibre.com,
 shawnguo@kernel.org, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH 20/22] drm/tve200: Use GEM DMA fbdev
	emulation
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

T24gV2VkLCBNYXIgMSwgMjAyMyBhdCA0OjMx4oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgoKPiBVc2UgdGhlIGZiZGV2IGVtdWxhdGlvbiB0aGF0IGlz
IG9wdGltaXplZCBmb3IgRE1BIGhlbHBlcnMuIEF2b2lkcwo+IHBvc3NpYmxlIHNoYWRvdyBidWZm
ZXJpbmcgYW5kIG1ha2VzIHRoZSBjb2RlIHNpbXBsZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KClRoYXQgc291bmRzIG5lYXQ6CkFj
a2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywK
TGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
